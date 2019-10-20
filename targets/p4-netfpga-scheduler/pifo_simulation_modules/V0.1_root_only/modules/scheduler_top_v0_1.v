`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Zhenguo Cui
// 
// Create Date: 08/27/2019 01:21:10 PM
// Design Name: 
// Module Name: scheduler_top_v0_1
// Project Name: MultiP4
// Target Devices: NetFPGA SUME
// Tool Versions: Vivado2018.2, SDNet 2018.2
// Description: PIFO Scheduler for Netfpga SUME, replace original output queue.
//  
// Dependencies: 
//  input signal from PIPELINE,
//  output signal to nf_10g_etherent... modules.
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module scheduler_top_v0_1
    #(
    // parameters from original output_queue.v
    // Master AXI Stream Data Width
    parameter DATA_WIDTH=256,
    parameter C_S_AXIS_TUSER_WIDTH=160, // 128 + pifo width(32)
    parameter C_M_AXIS_TUSER_WIDTH=128,
    //parameter C_S_AXIS_TUSER_WIDTH=128,
    parameter NUM_QUEUES=5,
    

    // AXI Registers Data Width
    parameter C_S_AXI_DATA_WIDTH    = 32,          
    parameter C_S_AXI_ADDR_WIDTH    = 12,          
    parameter C_BASEADDR            = 32'h00000000,

    // SI
    parameter QUEUE_DEPTH_BITS = 16,
    // end for original parameter.
    
    // parameters for scheduler_top.
    parameter BUFFER_WORD_COUNT = 4096,
    parameter PIFO_INFO_ROOT_LENGTH = 30, //{valid - 1bit,rank-16bit,islast-1bit,field-12bit } total 30bit.
    parameter PIFO_INFO_CHILD_LENGTH = 38, //{valid - 1bit, rank - 16bit, qid - 8bit, islast - 1bit, field - 12bit} total 38bit.
    parameter PIFO_INFO_LENGTH = 32
    )
    (
     
    // Part 1: System side signals
    // Global Ports
    input axis_aclk,
    input axis_resetn,

    // Slave Stream Ports (interface to data path)
    input [DATA_WIDTH - 1:0]                    s_axis_tdata,
    input [(DATA_WIDTH / 8) - 1:0]              s_axis_tkeep,
    input [C_S_AXIS_TUSER_WIDTH-1:0]            s_axis_tuser,
    input                                       s_axis_tvalid,
    input                                       s_axis_tlast,
    output                                      s_axis_tready,   
    
    // Master Stream Ports (interface to TX queues)
    input                                       m_axis_0_tready,
    output [DATA_WIDTH - 1:0]                   m_axis_0_tdata,
    output [(DATA_WIDTH / 8) - 1:0]             m_axis_0_tkeep,
    output [C_M_AXIS_TUSER_WIDTH-1:0]           m_axis_0_tuser,
    output [PIFO_INFO_LENGTH-1:0]               m_axis_0_tpifo,
    output                                      m_axis_0_tvalid,
    output                                      m_axis_0_tlast,
    
    input                                       m_axis_1_tready,
    output [DATA_WIDTH - 1:0]                   m_axis_1_tdata,
    output [(DATA_WIDTH / 8) - 1:0]             m_axis_1_tkeep,
    output [C_M_AXIS_TUSER_WIDTH-1:0]           m_axis_1_tuser,
    output [PIFO_INFO_LENGTH-1:0]               m_axis_1_tpifo,
    output                                      m_axis_1_tvalid,
    output                                      m_axis_1_tlast,

    input                                       m_axis_2_tready,
    output [DATA_WIDTH - 1:0]                   m_axis_2_tdata,
    output [(DATA_WIDTH / 8) - 1:0]             m_axis_2_tkeep,
    output [C_M_AXIS_TUSER_WIDTH-1:0]           m_axis_2_tuser,
    output [PIFO_INFO_LENGTH-1:0]               m_axis_2_tpifo,
    output                                      m_axis_2_tvalid,
    output                                      m_axis_2_tlast,

    input                                       m_axis_3_tready,
    output [DATA_WIDTH - 1:0]                   m_axis_3_tdata,
    output [((DATA_WIDTH / 8)) - 1:0]           m_axis_3_tkeep,
    output [C_M_AXIS_TUSER_WIDTH-1:0]           m_axis_3_tuser,
    output [PIFO_INFO_LENGTH-1:0]               m_axis_3_tpifo,
    output                                      m_axis_3_tvalid,
    output                                      m_axis_3_tlast,

    input                                       m_axis_4_tready,
    output [DATA_WIDTH - 1:0]                   m_axis_4_tdata,
    output [(DATA_WIDTH / 8) - 1:0]             m_axis_4_tkeep,
    output [C_M_AXIS_TUSER_WIDTH-1:0]           m_axis_4_tuser,
    output [PIFO_INFO_LENGTH-1:0]               m_axis_4_tpifo,
    output                                      m_axis_4_tvalid,
    output                                      m_axis_4_tlast,

    // stats
    output reg [QUEUE_DEPTH_BITS:0] nf0_q_size,
    output reg [QUEUE_DEPTH_BITS:0] nf1_q_size,
    output reg [QUEUE_DEPTH_BITS:0] nf2_q_size,
    output reg [QUEUE_DEPTH_BITS:0] nf3_q_size,
    output reg [QUEUE_DEPTH_BITS:0] dma_q_size,

    output reg  [C_S_AXI_DATA_WIDTH-1:0] bytes_stored,
    output reg  [NUM_QUEUES-1:0]         pkt_stored,

    output [C_S_AXI_DATA_WIDTH-1:0]  bytes_removed_0,
    output [C_S_AXI_DATA_WIDTH-1:0]  bytes_removed_1,
    output [C_S_AXI_DATA_WIDTH-1:0]  bytes_removed_2,
    output [C_S_AXI_DATA_WIDTH-1:0]  bytes_removed_3,
    output [C_S_AXI_DATA_WIDTH-1:0]  bytes_removed_4,
    output                           pkt_removed_0,
    output                           pkt_removed_1,
    output                           pkt_removed_2,
    output                           pkt_removed_3,
    output                           pkt_removed_4,

// Slave AXI Ports
    input                                     S_AXI_ACLK,
    input                                     S_AXI_ARESETN,
    input      [C_S_AXI_ADDR_WIDTH-1 : 0]     S_AXI_AWADDR,
    input                                     S_AXI_AWVALID,
    input      [C_S_AXI_DATA_WIDTH-1 : 0]     S_AXI_WDATA,
    input      [C_S_AXI_DATA_WIDTH/8-1 : 0]   S_AXI_WSTRB,
    input                                     S_AXI_WVALID,
    input                                     S_AXI_BREADY,
    input      [C_S_AXI_ADDR_WIDTH-1 : 0]     S_AXI_ARADDR,
    input                                     S_AXI_ARVALID,
    input                                     S_AXI_RREADY,
    output                                    S_AXI_ARREADY,
    output     [C_S_AXI_DATA_WIDTH-1 : 0]     S_AXI_RDATA,
    output     [1 : 0]                        S_AXI_RRESP,
    output                                    S_AXI_RVALID,
    output                                    S_AXI_WREADY,
    output     [1 :0]                         S_AXI_BRESP,
    output                                    S_AXI_BVALID,
    output                                    S_AXI_AWREADY,

    output reg [C_S_AXI_DATA_WIDTH-1:0]  bytes_dropped,
    output reg [NUM_QUEUES-1:0]          pkt_dropped
    );
    
    
    
    wire [NUM_QUEUES-1:0]               w_buffer_almost_full_bit_array; 
    wire [NUM_QUEUES-1:0]               w_pifo_full_bit_array;
    wire [NUM_QUEUES-1:0]               w_buffer_write_en_bit_array; 
    wire [NUM_QUEUES-1:0]               w_pifo_insert_en_bit_array; 
            
    
    enqueue_agent_v0_1
    enqueue_agent_inst(
            // from/to pipeline
        .s_axis_tvalid(s_axis_tvalid),
        .s_axis_tready(s_axis_tready),
        .s_axis_tuser(s_axis_tuser), // sume_meta + pifo_info_root + pifo_info_child.
        .s_axis_tlast(s_axis_tlast),
        
        // from each port queue status 
        .s_axis_buffer_almost_full(w_buffer_almost_full_bit_array),
        .s_axis_pifo_full(w_pifo_full_bit_array),
            
        .m_axis_ctl_pifo_in_en(w_pifo_insert_en_bit_array),
        .m_axis_ctl_buffer_wr_en(w_buffer_write_en_bit_array),
        
        .axis_aclk(axis_aclk),
        .axis_resetn(axis_resetn)
    );
    
    
//    wire                        buffer_0_empty;

    wire    [PIFO_INFO_LENGTH-1:0] w_pifo_info;          
    assign  w_pifo_info = s_axis_tuser[C_S_AXIS_TUSER_WIDTH-1:C_S_AXIS_TUSER_WIDTH-PIFO_INFO_LENGTH];
    

    wire                        buffer_0_almost_full;
    wire                        pifo_0_full;
        
    output_queue_v0_1
    output_queue_inst_port0(
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tkeep(s_axis_tkeep),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tpifo(w_pifo_info),
        .s_axis_tvalid(s_axis_tvalid),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_buffer_wr_en(w_buffer_write_en_bit_array[0]),
        .s_axis_pifo_insert_en(w_pifo_insert_en_bit_array[0]),
        .m_axis_tready(m_axis_0_tready),
        .m_axis_tvalid(m_axis_0_tvalid),
        .m_axis_tdata(m_axis_0_tdata),
        .m_axis_tkeep(m_axis_0_tkeep),
        .m_axis_tlast(m_axis_0_tlast),
        .m_axis_tuser(m_axis_0_tuser),
        .m_axis_tpifo(m_axis_0_tpifo),
        .m_is_buffer_almost_full(buffer_0_almost_full),
        .m_is_pifo_full(pifo_0_full),
        .axis_aclk(axis_aclk),
        .axis_resetn(axis_resetn)
    );
    
    wire                        buffer_1_almost_full;
    wire                        pifo_1_full;
    output_queue_v0_1
    output_queue_inst_port1(
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tkeep(s_axis_tkeep),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tpifo(w_pifo_info),
        .s_axis_tvalid(s_axis_tvalid),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_buffer_wr_en(w_buffer_write_en_bit_array[1]),
        .s_axis_pifo_insert_en(w_pifo_insert_en_bit_array[1]),
        .m_axis_tready(m_axis_1_tready),
        .m_axis_tvalid(m_axis_1_tvalid),
        .m_axis_tdata(m_axis_1_tdata),
        .m_axis_tkeep(m_axis_1_tkeep),
        .m_axis_tlast(m_axis_1_tlast),
        .m_axis_tuser(m_axis_1_tuser),
        .m_axis_tpifo(m_axis_1_tpifo),
        .m_is_buffer_almost_full(buffer_1_almost_full),
        .m_is_pifo_full(pifo_1_full),
        .axis_aclk(axis_aclk),
        .axis_resetn(axis_resetn)
    );
    
    wire                        buffer_2_almost_full;
    wire                        pifo_2_full;
    output_queue_v0_1
    output_queue_inst_port2(
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tkeep(s_axis_tkeep),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tpifo(w_pifo_info),
        .s_axis_tvalid(s_axis_tvalid),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_buffer_wr_en(w_buffer_write_en_bit_array[2]),
        .s_axis_pifo_insert_en(w_pifo_insert_en_bit_array[2]),
        .m_axis_tready(m_axis_2_tready),
        .m_axis_tvalid(m_axis_2_tvalid),
        .m_axis_tdata(m_axis_2_tdata),
        .m_axis_tkeep(m_axis_2_tkeep),
        .m_axis_tlast(m_axis_2_tlast),
        .m_axis_tuser(m_axis_2_tuser),
        .m_axis_tpifo(m_axis_2_tpifo),
        .m_is_buffer_almost_full(buffer_2_almost_full),
        .m_is_pifo_full(pifo_2_full),
        .axis_aclk(axis_aclk),
        .axis_resetn(axis_resetn)
    );
    
    wire                        buffer_3_almost_full;
    wire                        pifo_3_full;
    output_queue_v0_1
    output_queue_inst_port3(
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tkeep(s_axis_tkeep),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tpifo(w_pifo_info),
        .s_axis_tvalid(s_axis_tvalid),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_buffer_wr_en(w_buffer_write_en_bit_array[3]),
        .s_axis_pifo_insert_en(w_pifo_insert_en_bit_array[3]),
        .m_axis_tready(m_axis_3_tready),
        .m_axis_tvalid(m_axis_3_tvalid),
        .m_axis_tdata(m_axis_3_tdata),
        .m_axis_tkeep(m_axis_3_tkeep),
        .m_axis_tlast(m_axis_3_tlast),
        .m_axis_tuser(m_axis_3_tuser),
        .m_axis_tpifo(m_axis_3_tpifo),
        .m_is_buffer_almost_full(buffer_3_almost_full),
        .m_is_pifo_full(pifo_3_full),
        .axis_aclk(axis_aclk),
        .axis_resetn(axis_resetn)
    );

    // port 4 is cpu port
    wire                        buffer_4_almost_full;
    wire                        pifo_4_full;
    output_queue_v0_1
    output_queue_inst_port4(
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tkeep(s_axis_tkeep),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tpifo(w_pifo_info),
        .s_axis_tvalid(s_axis_tvalid),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_buffer_wr_en(w_buffer_write_en_bit_array[4]),
        .s_axis_pifo_insert_en(w_pifo_insert_en_bit_array[4]),
        .m_axis_tready(m_axis_4_tready),
        .m_axis_tvalid(m_axis_4_tvalid),
        .m_axis_tdata(m_axis_4_tdata),
        .m_axis_tkeep(m_axis_4_tkeep),
        .m_axis_tlast(m_axis_4_tlast),
        .m_axis_tuser(m_axis_4_tuser),
        .m_axis_tpifo(m_axis_4_tpifo),
        .m_is_buffer_almost_full(buffer_4_almost_full),
        .m_is_pifo_full(pifo_4_full),
        .axis_aclk(axis_aclk),
        .axis_resetn(axis_resetn)
    );    

assign w_buffer_almost_full_bit_array = {buffer_4_almost_full,buffer_3_almost_full,buffer_2_almost_full,buffer_1_almost_full,buffer_0_almost_full};
assign w_pifo_full_bit_array = {pifo_4_full,pifo_3_full,pifo_2_full,pifo_1_full,pifo_0_full};

endmodule
