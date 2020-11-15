`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/13/2010
// Design Name: 
// Module Name: block_ram_wrapper
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


// this module is wrapper for modules that uses blockrams
module block_ram_wrapper
#(
parameter ADDR_WIDTH = 12,
parameter THRESHOLD_ALMOST_FULL = 48,
parameter ADDR_TABLE_DEPTH = 4096,

parameter C_S_AXIS_DATA_BUFFER_WIDTH=289,
parameter C_M_AXIS_DATA_WIDTH=256,
parameter C_S_AXIS_DATA_WIDTH=256,
parameter C_M_AXIS_TUSER_WIDTH=128,
parameter C_S_AXIS_TUSER_WIDTH=128,
parameter C_M_AXIS_PIFO_WIDTH=32,
parameter C_S_AXIS_PIFO_WIDTH=32,
parameter C_S_AXIS_ADDR_WIDTH=12,
parameter OUTPUT_SYNC = 0,
parameter BUFFER_FULL_ON = ADDR_TABLE_DEPTH - THRESHOLD_ALMOST_FULL,
parameter BUFFER_FULL_OFF = 40
)
(
    // IO for Address Manager
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
    
    // IO for buffer
    s_axis_tdata,
    s_axis_tkeep,
    s_axis_tlast,
    s_axis_tuser,
    s_axis_tpifo,
    
    m_axis_tdata,
    m_axis_tkeep,
    m_axis_tlast,
    m_axis_tuser,
    m_axis_tpifo,

//    s_axis_wr_addr,
//    s_axis_wr_en,
//    s_axis_rd_addr,

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

input [C_S_AXIS_DATA_WIDTH-1:0]   s_axis_tdata;
input [C_S_AXIS_DATA_WIDTH/8-1:0] s_axis_tkeep;
input                             s_axis_tlast;
input [C_S_AXIS_TUSER_WIDTH-1:0]  s_axis_tuser;
input [C_S_AXIS_PIFO_WIDTH-1:0]   s_axis_tpifo;

output [C_M_AXIS_DATA_WIDTH-1:0]    m_axis_tdata;
output [C_M_AXIS_DATA_WIDTH/8-1:0]  m_axis_tkeep;
output                              m_axis_tlast;
output [C_M_AXIS_TUSER_WIDTH-1:0]   m_axis_tuser;
output [C_M_AXIS_PIFO_WIDTH-1:0 ]   m_axis_tpifo;

input clk;
input rstn;    


reg [ADDR_WIDTH-1:0] r_fl_head;
reg [ADDR_WIDTH-1:0] r_fl_head_next;

reg [ADDR_WIDTH-1:0] r_fl_tail;
reg [ADDR_WIDTH-1:0] r_fl_tail_next;

//reg [ADDR_WIDTH-1:0] r_last_rd_index, r_last_rd_index_next;

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


// wires    
    wire [C_M_AXIS_DATA_WIDTH-1:0]      m_axis_tdata_async;
    wire [C_M_AXIS_DATA_WIDTH/8-1:0]    m_axis_tkeep_async;
    wire                                m_axis_tlast_async;
    wire [C_M_AXIS_TUSER_WIDTH-1:0]     m_axis_tuser_async;
    wire [C_M_AXIS_PIFO_WIDTH-1:0 ]     m_axis_tpifo_async;
//    wire                                m_axis_tvalid_async;
    
    // regs
    reg [C_M_AXIS_DATA_WIDTH-1:0]       m_axis_tdata_reg;
    reg [C_M_AXIS_DATA_WIDTH/8-1:0]     m_axis_tkeep_reg;
    reg                                 m_axis_tlast_reg;
    reg [C_M_AXIS_TUSER_WIDTH-1:0]      m_axis_tuser_reg;
    reg [C_M_AXIS_PIFO_WIDTH-1:0 ]      m_axis_tpifo_reg;
//    reg                                 m_axis_tvalid_reg;
  

    // combinational logic output for each blockram 
//    reg [C_S_AXIS_DATA_BUFFER_WIDTH-1:0] r_pkt_buffer_dina;
//    reg [C_S_AXIS_TUSER_WIDTH-1:0] r_meta_buffer_dina;
//    reg [C_S_AXIS_PIFO_WIDTH-1:0] r_pifo_buffer_dina;
        
//    reg [C_S_AXIS_ADDR_WIDTH-1:0] r_pkt_buffer_addra;
//    reg [C_S_AXIS_ADDR_WIDTH-1:0] r_meta_buffer_addra;
//    reg [C_S_AXIS_ADDR_WIDTH-1:0] r_pifo_buffer_addra;

    wire [C_S_AXIS_DATA_BUFFER_WIDTH-1:0] w_pkt_buffer_out;
    wire [C_S_AXIS_TUSER_WIDTH-1:0] w_meta_buffer_out;
    wire [C_S_AXIS_PIFO_WIDTH-1:0] w_pifo_buffer_out;
        
    reg  [C_S_AXIS_ADDR_WIDTH-1:0] r_buffer_rd_addr;
    reg  [C_S_AXIS_ADDR_WIDTH-1:0] r_buffer_wr_addr;

buffer_pkt_289_4096
buffer_pkt_inst(
.dina({s_axis_tlast, s_axis_tkeep, s_axis_tdata}),
.wea(s_axis_wr_en),
.addra(r_buffer_wr_addr),  // always write to the fl_head
.douta(w_pkt_buffer_out),  // porta output to pkt read result.


.dinb(289'b0),
.addrb(r_buffer_rd_addr),
.doutb({m_axis_tlast_async,m_axis_tkeep_async,m_axis_tdata_async}),
.web('b0),
.clka(clk),
.clkb(clk)
);

buffer_meta_128_4096
buffer_meta_inst(
.dina(s_axis_tuser),
.wea(s_axis_wr_en),
.addra(r_buffer_wr_addr),  // always write to the fl_head
.douta(w_meta_buffer_out),

.dinb(128'b0),
.addrb(r_buffer_rd_addr),
.doutb(m_axis_tuser_async),
.web('b0),

.clka(clk),
.clkb(clk)
);

buffer_pifo_32_4096
buffer_pifo_inst(
.dina(s_axis_tpifo),
.wea(s_axis_wr_en),
.addra(r_buffer_wr_addr),  // always write to the fl_head
.douta(w_pifo_buffer_out),

.dinb(32'b0),
.addrb(r_buffer_rd_addr),
.doutb(m_axis_tpifo_async),
.web('b0),
.clka(clk),
.clkb(clk)
);

    always @(posedge clk) begin
    
        if(~rstn)
            begin
                m_axis_tdata_reg <= 0;
                m_axis_tkeep_reg <= 0;
                m_axis_tlast_reg <= 0;
                m_axis_tuser_reg <= 0;
                m_axis_tpifo_reg <= 0;
//                m_axis_tvalid_reg <= 0;
                                                                          
            end
        else
            begin

                
                m_axis_tdata_reg <= m_axis_tdata_async;
                m_axis_tkeep_reg <= m_axis_tkeep_async;
                m_axis_tlast_reg <= m_axis_tlast_async;
                m_axis_tuser_reg <= m_axis_tuser_async;
                m_axis_tpifo_reg <= m_axis_tpifo_async;
//                m_axis_tvalid_reg <= m_axis_tvalid_async;  
                
            end
    end

//// just return input value.
//assign m_axis_tvalid_async = s_axis_rd_en; 

assign m_axis_tdata = (~OUTPUT_SYNC)? m_axis_tdata_async : m_axis_tdata_reg;
assign m_axis_tkeep = (~OUTPUT_SYNC)? m_axis_tkeep_async : m_axis_tkeep_reg;
assign m_axis_tlast = (~OUTPUT_SYNC)? m_axis_tlast_async : m_axis_tlast_reg;
assign m_axis_tuser = (~OUTPUT_SYNC)? m_axis_tuser_async : m_axis_tuser_reg;
assign m_axis_tpifo = (~OUTPUT_SYNC)? m_axis_tpifo_async : m_axis_tpifo_reg;
//assign m_axis_tvalid = (OUTPUT_SYNC)? m_axis_tvalid_async : m_axis_tvalid_reg;


always @(*)
begin
    port_b_addr = r_fl_head;
    port_b_data = 32'b0;
    port_b_wea = 'b0;
    
    port_a_addr = r_fl_tail;
    port_a_data = 32'b0;
    port_a_wea = 'b0;

    r_fl_head_next = r_fl_head;
    r_fl_tail_next = r_fl_tail;
//    r_last_rd_index_next = r_last_rd_index;
    m_axis_space_counter_reg_next = m_axis_space_counter_reg;
    
    r_buffer_wr_addr = r_fl_head;
    r_buffer_rd_addr = r_fl_tail;

    // if read first word signal is enabled.
    // go to FL tail update state,
    
    if(s_axis_rd_first_word_en)
        begin
            // update current fl tail's next pointer(the sop address)

            
            if (r_fl_tail != s_axis_rd_pkt_sop_addr)
                begin
                    port_a_addr = r_fl_tail;
                    port_a_data = s_axis_rd_pkt_sop_addr;
                    port_a_wea = 'b1;
                end
            
            // set the next fl_tail address as sop
            r_fl_tail_next = s_axis_rd_pkt_sop_addr;
            r_buffer_rd_addr = s_axis_rd_pkt_sop_addr; // changed
            
        end
    
    // if read signal is enabled,
    // move fl_tail to fl_tail next.
    else if(s_axis_rd_en)
        begin
            r_fl_tail_next = w_port_a_out;
            port_a_addr = w_port_a_out;
//            r_last_rd_index_next = r_fl_tail;
            r_buffer_rd_addr = w_port_a_out; // changed
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

// FULL Control FSM
reg fsm_full, fsm_full_next;
localparam NORMAL = 0;
localparam FULL = 1;

always @(*)
begin
    fsm_full_next = fsm_full;
    
    case(fsm_full)
        NORMAL:
            begin
                if (m_axis_space_counter_reg > BUFFER_FULL_ON)
                    begin
                        fsm_full_next = FULL;
                    end
            end
        FULL:
            begin
                if (m_axis_space_counter_reg < BUFFER_FULL_OFF)
                    begin
                        fsm_full_next = NORMAL;
                    end
            end
    endcase
    
end





always @(posedge clk)
begin
    if(~rstn) 
        begin
            r_fl_head <= 0;
            r_fl_tail <= ADDR_TABLE_DEPTH-1;
            fsm_full <= NORMAL;
//            addr_manager_fsm_state<=IDLE;
//            r_last_rd_index <= ADDR_TABLE_DEPTH-1;
            m_axis_space_counter_reg <= 0;

            
        end
    else
        begin
//            r_last_rd_index <= r_last_rd_index_next;
            r_fl_head <= r_fl_head_next;
            r_fl_tail <= r_fl_tail_next;
            fsm_full <= fsm_full_next;
//            addr_manager_fsm_state <= addr_manager_fsm_state_next;
            m_axis_space_counter_reg <= m_axis_space_counter_reg_next;

        end
    
end


assign m_axis_almost_full = fsm_full;
assign m_axis_fl_head = r_fl_head;
assign m_axis_fl_head_next = r_fl_head_next;
assign m_axis_fl_tail = r_fl_tail;    
assign m_axis_fl_tail_next = r_fl_tail_next;
assign m_axis_remain_space = ADDR_TABLE_DEPTH-m_axis_space_counter_reg;
assign m_axis_is_empty = (m_axis_space_counter_reg == 0)? 1:0;
assign m_axis_buffer_counter = m_axis_space_counter_reg;

endmodule
