`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/10/2019 10:21:47 AM
// Design Name: 
// Module Name: addr_manager_v0_2
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


// this module uses FF register array for manange addr table.
module addr_manager
#(
parameter ADDR_WIDTH = 12,
parameter THRESHOLD_ALMOST_FULL = 48,
parameter ADDR_TABLE_DEPTH = 4096
)
(
    s_axis_wr_en, // write signal for fl_head transition
    s_axis_rd_en,    // read signal 
    s_axis_rd_first_word_en, // the first word signal, for r_fl_tail value update.
    
    s_axis_rd_pkt_sop_addr, // read address for sop 
    
    m_axis_fl_head,       // next writable available address, same as free list head.
    m_axis_fl_head_next,
    m_axis_fl_tail,
    m_axis_fl_tail_next,  // next readable address, the value of index at r_fl_tail
    
    
    m_axis_remain_space, // statistics for buffer space
    m_axis_buffer_counter,
    m_axis_almost_full,  // buffer almost full signal. 
    m_axis_is_empty,     // buffer empty signal
    
    clk,
    rstn    //active low
  
);

input s_axis_wr_en; // write to buffer signal,
input s_axis_rd_en; // read from buffer signal
input s_axis_rd_first_word_en;
input [ADDR_WIDTH-1:0] s_axis_rd_pkt_sop_addr;

output [ADDR_WIDTH-1:0] m_axis_fl_head;
output [ADDR_WIDTH-1:0] m_axis_fl_head_next;
output [ADDR_WIDTH-1:0] m_axis_fl_tail;
output [ADDR_WIDTH-1:0] m_axis_fl_tail_next;

output                  m_axis_almost_full;
output                  m_axis_is_empty;
output [ADDR_WIDTH-1:0] m_axis_remain_space;
output [ADDR_WIDTH-1:0] m_axis_buffer_counter;
    
input clk;
input rstn;    


reg [ADDR_WIDTH-1:0] r_fl_head;
reg [ADDR_WIDTH-1:0] r_fl_head_next;

reg [ADDR_WIDTH-1:0] r_fl_tail;
reg [ADDR_WIDTH-1:0] r_fl_tail_next;


//reg                  addr_manager_fsm_state;
//reg                  addr_manager_fsm_state_next;

reg [ADDR_WIDTH-1:0] port_a_addr;
reg [ADDR_WIDTH-1:0] port_a_data;
reg                  port_a_wea;
wire [ADDR_WIDTH-1:0] w_port_a_out;


reg [ADDR_WIDTH-1:0] port_b_addr;
reg [ADDR_WIDTH-1:0] port_b_data;
reg                  port_b_wea;
wire [ADDR_WIDTH-1:0] w_port_b_out;

// register for store remain space(unit: words)
reg [ADDR_WIDTH-1:0] m_axis_space_counter_reg;
reg [ADDR_WIDTH-1:0] m_axis_space_counter_reg_next;    


addr_table_12_4096_with_coe
    addr_table(
        // PortA for FL Tail (both read/write may occured).
        .addra(port_a_addr),
        .dina(port_a_data),
        .douta(w_port_a_out),
        .wea(port_a_wea), // no write for port a 
        
        // PortB for FL Head (read only)  
        .addrb(port_b_addr),
        .dinb(port_b_data),
        .doutb(w_port_b_out),
        .web(port_b_wea),
        
        .clka(clk),
        .clkb(clk)
    );


always @(*)
begin
    port_b_addr = r_fl_head_next;
    port_b_data = 32'b0;
    port_b_wea = 'b0;
    
    port_a_addr = r_fl_tail;
    port_a_data = 32'b0;
    port_a_wea = 'b0;

    r_fl_head_next = r_fl_head;
    r_fl_tail_next = r_fl_tail;
    
    m_axis_space_counter_reg_next = m_axis_space_counter_reg;
    

    // if read first word signal is enabled.
    // go to FL tail update state,
    
    if(s_axis_rd_first_word_en)
        begin
            // update current fl tail's next pointer(the sop address)
            
            port_a_data = s_axis_rd_pkt_sop_addr;
            port_a_wea = 'b1;
            
            // set the next fl_tail address as sop
            r_fl_tail_next = s_axis_rd_pkt_sop_addr;

        end
    
    // if read signal is enabled,
    // move fl_tail to fl_tail next.
    else if(s_axis_rd_en)
        begin
            r_fl_tail_next = w_port_a_out;
            port_a_addr = w_port_a_out;
        end
    
    
    // move fl_head when write signal is enabled
    
    if(s_axis_wr_en)
        begin
            r_fl_head_next = w_port_b_out;
            port_b_addr = w_port_b_out;
        end
                
    // counter
    
    if(s_axis_wr_en & ~s_axis_rd_en)
        begin
            m_axis_space_counter_reg_next = m_axis_space_counter_reg + 1;    
        end 
    else if (~s_axis_wr_en & s_axis_rd_en)           
        begin
            m_axis_space_counter_reg_next = m_axis_space_counter_reg - 1;
        end


end

always @(posedge clk)
begin
    if(~rstn) 
        begin
            r_fl_head <= 0;
            r_fl_tail <= ADDR_TABLE_DEPTH-1;
//            addr_manager_fsm_state<=IDLE;
            m_axis_space_counter_reg <= 0;

            
        end
    else
        begin
            r_fl_head <= r_fl_head_next;
            r_fl_tail <= r_fl_tail_next;
//            addr_manager_fsm_state <= addr_manager_fsm_state_next;
            m_axis_space_counter_reg <= m_axis_space_counter_reg_next;
     
        end
    
end


assign m_axis_almost_full = (m_axis_space_counter_reg > ADDR_TABLE_DEPTH-THRESHOLD_ALMOST_FULL)? 1 : 0;

assign m_axis_fl_head = r_fl_head;
assign m_axis_fl_head_next = r_fl_head_next;
assign m_axis_fl_tail = r_fl_tail;    
assign m_axis_fl_tail_next = r_fl_tail_next;
assign m_axis_remain_space = ADDR_TABLE_DEPTH-m_axis_space_counter_reg;
assign m_axis_is_empty = (m_axis_space_counter_reg == 0)? 1:0;
assign m_axis_buffer_counter = m_axis_space_counter_reg;

endmodule
