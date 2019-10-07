`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2019 12:55:11 PM
// Design Name: 
// Module Name: addr_manager_v0_1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module addr_manager_v0_1
    #(
    parameter ADDR_WIDTH = 12,
    parameter THRESHOLD_ALMOST_FULL = 48,
    parameter ADDR_TABLE_DEPTH = 4096
    )
    (
        s_axis_wr_en, // write signal for fl_head transition
        s_axis_rd_en,    // read signal 
        s_axis_first_word_en, // the first word signal, for r_fl_tail value update.
        
        s_axis_rd_addr, // read address for sop 
        
        m_axis_fl_head,       // next writable available address, same as free list head.
        m_axis_fl_head_next,
        m_axis_rd_next_addr,  // next readable address, the value of index at r_fl_tail
        
        m_axis_remain_space, // statistics for buffer spae
        m_axis_almost_full,  // buffer almost full signal. 
        m_axis_is_empty,     // buffer empty signal
        
        clk,
        rstn    //active low
      
    );
    
    input s_axis_wr_en; // write to buffer signal,
    input s_axis_rd_en; // read from buffer signal
    input s_axis_first_word_en;
    input [ADDR_WIDTH-1:0] s_axis_rd_addr;
    
    output [ADDR_WIDTH-1:0] m_axis_fl_head;
    output [ADDR_WIDTH-1:0] m_axis_fl_head_next;
    output [ADDR_WIDTH-1:0] m_axis_rd_next_addr;

    output                  m_axis_almost_full;
    output                  m_axis_is_empty;
    output [ADDR_WIDTH-1:0] m_axis_remain_space;

    input clk;
    input rstn;    
        
 
    // register for read next address
//    reg [ADDR_WIDTH-1:0] m_axis_rd_next_addr_reg;
//    reg [ADDR_WIDTH-1:0] m_axis_rd_next_addr_reg_next;
    
    // register for store remain space(unit: words)
    reg [ADDR_WIDTH-1:0] m_axis_remain_space_reg;
    reg [ADDR_WIDTH-1:0] m_axis_remain_space_reg_next;    
    
    // freelist header and tail
    reg [ADDR_WIDTH-1:0] r_fl_head;    
    reg [ADDR_WIDTH-1:0] r_fl_head_next;    
    reg [ADDR_WIDTH-1:0] r_fl_tail;    
    reg [ADDR_WIDTH-1:0] r_fl_tail_next;
            
    //wires 
    wire [ADDR_WIDTH-1:0] port_a_input_addr;
    wire [ADDR_WIDTH-1:0] port_a_out_value;
    
    reg [ADDR_WIDTH-1:0] port_b_input_addr;
    reg [ADDR_WIDTH-1:0] port_b_input_value;
    reg  port_b_wr_en;
    wire [ADDR_WIDTH-1:0] w_port_b_input_addr;
    wire [ADDR_WIDTH-1:0] port_b_out_value;        
    
    
    // local parameeters
    
    localparam IDLE = 0;
    localparam FIRST_WORD = 1;
    reg  addr_manager_fsm_state;
    reg  addr_manager_fsm_state_next;
    
     
    // PortA for FL Head (read only).
    // PortB for FL Tail (both read/write may occured)
    addr_table_12_4096_with_coe
    addr_table_inst(
        .addra(port_a_input_addr),
        .dina(0),
        .douta(port_a_out_value),
        .wea(0), // no write for port a 
        
        .addrb(port_b_input_addr),
        .dinb(port_b_input_value),
        .doutb(port_b_out_value),
        .web(port_b_wr_en),
        .clka(clk),
        .clkb(clk)
    );
    

    integer i;
    always @(*)
    begin

        // if is write mode, then r_fl_head_next as addr_table output value 
        // otherwise, takes r_fl_head register value.
        r_fl_head_next = (s_axis_wr_en)? port_a_out_value :r_fl_head;
                      
        // set default value
        addr_manager_fsm_state_next = addr_manager_fsm_state;
        m_axis_remain_space_reg_next = m_axis_remain_space_reg; 
        
        r_fl_tail_next = r_fl_tail;
        port_b_input_addr = r_fl_tail;
        port_b_input_value = 0;
        port_b_wr_en = 0;
        
        // FSM Logic:
        // Two States: Read the First word from buffer takes two cycles
        // one for r_fl_tail update, the other on for read next addr.
        // in IDLE states, if the read signal and first word signal is on, then
        // update current r_fl_tail link, 
        // then move to FIRST_WORD state.
        // in FIRST_WORD state: read target address value, then goto IDLE state.
        
        case(addr_manager_fsm_state)
            IDLE:
                begin
                
                // calculate remain_counter_next
                // if only write enabled, then decrease 1
                // if only read enabled, then increase 1
                // otherwise, remain same.
                if (s_axis_wr_en & ~(s_axis_rd_en & ~s_axis_first_word_en)) 
                    begin
                        m_axis_remain_space_reg_next = m_axis_remain_space_reg - 1;
                    end
                else if(~s_axis_wr_en & (s_axis_rd_en & ~s_axis_first_word_en)) 
                    begin
                        m_axis_remain_space_reg_next = m_axis_remain_space_reg + 1;
                    end
                
                //if the first word_en is 1, then move to FIRST_WORD state.
                // and update current r_fl_tail link.
                if(s_axis_rd_en & s_axis_first_word_en)
                    begin
                        r_fl_tail_next = s_axis_rd_addr;
                        port_b_input_addr = r_fl_tail;
                        port_b_input_value = s_axis_rd_addr;
                        port_b_wr_en = 1;
                        // state transition to 
                        addr_manager_fsm_state_next = FIRST_WORD; 
                    end
                else if(s_axis_rd_en & ~s_axis_first_word_en)
                    begin
                        // update r_fl_tail_next value.
                        r_fl_tail_next = port_b_out_value;
                        port_b_input_addr = port_b_out_value;
                        // update next read addr when read enable and not first word. 
//                        m_axis_rd_next_addr_reg_next = port_b_out_value;
                    end
                end                               
            FIRST_WORD:
                begin
                
                // calculate remain_counter_next
                // check write signal, if 0 then means only ready occured, increase remain space by 1.
                if(~s_axis_wr_en)
                    m_axis_remain_space_reg_next = m_axis_remain_space_reg + 1;
                
                //set read address
                port_b_input_addr = s_axis_rd_addr;
                addr_manager_fsm_state_next = IDLE;
                end
        endcase
        
        
    end
    
    always@(posedge clk) 
    begin
        
        if(~rstn) // reset active at low
            begin
                r_fl_head <= 0;
                r_fl_tail <= ADDR_TABLE_DEPTH-1;
                m_axis_remain_space_reg <= ADDR_TABLE_DEPTH-1;
//                m_axis_rd_next_addr_reg <= ADDR_TABLE_DEPTH-1;
                addr_manager_fsm_state <= IDLE;
                
            end
        else    // update register value
            begin
                r_fl_head <= r_fl_head_next;
                r_fl_tail <= r_fl_tail_next;
                m_axis_remain_space_reg <= m_axis_remain_space_reg_next;
//                m_axis_rd_next_addr_reg <= m_axis_rd_next_addr_reg_next;
                addr_manager_fsm_state <= addr_manager_fsm_state_next;
            end
            
    end
    
    // retrun almost full signal by comparing remain_counter and threshold value.
    assign m_axis_almost_full = (m_axis_remain_space_reg > THRESHOLD_ALMOST_FULL - 1)? 0 : 1;
    assign m_axis_fl_head = r_fl_head;
    assign m_axis_fl_head_next = r_fl_head_next;
        
    assign m_axis_rd_next_addr = r_fl_tail_next;
    assign m_axis_remain_space = m_axis_remain_space_reg;
    assign m_axis_is_empty = (m_axis_remain_space_reg == (ADDR_TABLE_DEPTH-1))? 1:0;
    assign port_a_input_addr = r_fl_head_next;
    
endmodule
