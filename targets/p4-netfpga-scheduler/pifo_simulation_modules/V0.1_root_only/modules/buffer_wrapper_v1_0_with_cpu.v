`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2019 11:33:26 PM
// Design Name: 
// Module Name: buffer_wrapper_v1_0_with_cpu
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


module buffer_wrapper_v1_0_with_cpu
#(
    parameter C_S_AXIS_DATA_BUFFER_WIDTH=289,
    parameter C_M_AXIS_DATA_WIDTH=256,
    parameter C_S_AXIS_DATA_WIDTH=256,
    parameter C_M_AXIS_TUSER_WIDTH=128,
    parameter C_S_AXIS_TUSER_WIDTH=128,
    parameter C_M_AXIS_PIFO_WIDTH=32,
    parameter C_S_AXIS_PIFO_WIDTH=32,
    parameter C_S_AXIS_ADDR_WIDTH=12,
    parameter OUTPUT_SYNC = 0
    
    )
    (
    
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

    s_axis_wr_addr,
    s_axis_wr_en,
    s_axis_rd_addr,

    clk,
    rstn 
    );


    input [C_S_AXIS_DATA_WIDTH-1:0]   s_axis_tdata;
    input [C_S_AXIS_DATA_WIDTH/8-1:0] s_axis_tkeep;
    input                             s_axis_tlast;
    input [C_S_AXIS_TUSER_WIDTH-1:0]  s_axis_tuser;
    input [C_S_AXIS_PIFO_WIDTH-1:0]   s_axis_tpifo;
    
    input [C_S_AXIS_ADDR_WIDTH-1:0]   s_axis_wr_addr;
    input [C_S_AXIS_ADDR_WIDTH-1:0]   s_axis_rd_addr;
    input s_axis_wr_en;

    output [C_M_AXIS_DATA_WIDTH-1:0]    m_axis_tdata;
    output [C_M_AXIS_DATA_WIDTH/8-1:0]  m_axis_tkeep;
    output                              m_axis_tlast;
    output [C_M_AXIS_TUSER_WIDTH-1:0]   m_axis_tuser;
    output [C_M_AXIS_PIFO_WIDTH-1:0 ]   m_axis_tpifo;
    
    // TODO: 
    // how to return valid value??
    // 
    //output                              m_axis_valid; 

    input clk;
    input rstn;
    
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
    reg [C_S_AXIS_DATA_BUFFER_WIDTH-1:0]    pkt_buffer_dina;
    reg [C_S_AXIS_TUSER_WIDTH-1:0]          meta_buffer_dina;
    reg [C_S_AXIS_PIFO_WIDTH-1:0]           pifo_buffer_dina;
        
    reg [C_S_AXIS_ADDR_WIDTH-1:0]           pkt_buffer_addra;
    reg [C_S_AXIS_ADDR_WIDTH-1:0]           meta_buffer_addra;
    reg [C_S_AXIS_ADDR_WIDTH-1:0]           pifo_buffer_addra;

    reg                                     pkt_buffer_wr_en;
    reg                                     meta_buffer_wr_en;
    reg                                     pifo_buffer_wr_en;    

    // register for bram port a output
    
    reg [C_S_AXIS_DATA_BUFFER_WIDTH-1:0]    r_pkt_buffer_out_sync;
    reg [C_S_AXIS_TUSER_WIDTH-1:0]          r_meta_buffer_out_sync;
    reg [C_S_AXIS_PIFO_WIDTH-1:0]           r_pifo_buffer_out_sync;
    
    wire [C_S_AXIS_DATA_BUFFER_WIDTH-1:0]   r_pkt_buffer_out_async;
    wire [C_S_AXIS_TUSER_WIDTH-1:0]         r_meta_buffer_out_async;
    wire [C_S_AXIS_PIFO_WIDTH-1:0]          r_pifo_buffer_out_async;
        
        

 
    // fsm for cpu operation handling.
    
    localparam IDLE = 0;
    localparam WAIT_FOR_DP_IDLE = 1;
    
    reg buffer_wrapper_fsm_state;
    reg buffer_wrapper_fsm_state_next;
         
 always @(*)
 begin
    
    // set port a write enable signal to dp input signal.
    pkt_buffer_wr_en = s_axis_wr_en;
    meta_buffer_wr_en = s_axis_wr_en;
    pifo_buffer_wr_en = s_axis_wr_en;
            
    pkt_buffer_dina = {s_axis_tlast,s_axis_tkeep,s_axis_tdata};
    meta_buffer_dina = s_axis_tuser;
    pifo_buffer_dina = s_axis_tpifo;
    
    pkt_buffer_addra = s_axis_wr_addr;
    meta_buffer_addra = s_axis_wr_addr;
    pifo_buffer_addra = s_axis_wr_addr;

end

    
    buffer_pkt_289_4096
    buffer_pkt_inst(
    .dina(pkt_buffer_dina),
    .wea(pkt_buffer_wr_en),
    .addra(pkt_buffer_addra),  // always write to the fl_head
    .douta(r_pkt_buffer_out_async),  // porta output to pkt read result.
    

    .dinb(289'b0),
    .addrb(s_axis_rd_addr),
    .doutb({m_axis_tlast_async,m_axis_tkeep_async,m_axis_tdata_async}),
    .web('b0),
    .clka(clk),
    .clkb(clk)
    );

    buffer_meta_128_4096
    buffer_meta_inst(
    .dina(meta_buffer_dina),
    .wea(meta_buffer_wr_en),
    .addra(meta_buffer_addra),  // always write to the fl_head
    .douta(r_meta_buffer_out_async),
    
    .dinb(128'b0),
    .addrb(s_axis_rd_addr),
    .doutb(m_axis_tuser_async),
    .web('b0),
    
    .clka(clk),
    .clkb(clk)
    );
    
    buffer_pifo_32_4096
    buffer_pifo_inst(
    .dina(pifo_buffer_dina),
    .wea(pifo_buffer_wr_en),
    .addra(pifo_buffer_addra),  // always write to the fl_head
    .douta(r_pifo_buffer_out_async),
    
    .dinb(32'b0),
    .addrb(s_axis_rd_addr),
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
             
                buffer_wrapper_fsm_state <= 0;
                
                r_pkt_buffer_out_sync <= 0;
                r_meta_buffer_out_sync <= 0;
                r_pifo_buffer_out_sync <= 0;
                                                      
            end
        else
            begin
                buffer_wrapper_fsm_state <= buffer_wrapper_fsm_state_next;
                
                m_axis_tdata_reg <= m_axis_tdata_async;
                m_axis_tkeep_reg <= m_axis_tkeep_async;
                m_axis_tlast_reg <= m_axis_tlast_async;
                m_axis_tuser_reg <= m_axis_tuser_async;
                m_axis_tpifo_reg <= m_axis_tpifo_async;
//                m_axis_tvalid_reg <= m_axis_tvalid_async;  
                
                r_pkt_buffer_out_sync <= r_pkt_buffer_out_async;
                r_meta_buffer_out_sync <= r_meta_buffer_out_async;
                r_pifo_buffer_out_sync <= r_pifo_buffer_out_async;

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

endmodule

