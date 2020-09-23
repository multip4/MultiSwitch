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
// Revision 0.2  - Remove Input Flip-Flop for Synchonization with Pipeline Data
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module scheduler_top_v0_1
    #(
    // parameters from original output_queue.v
    // Master AXI Stream Data Width
    parameter DATA_WIDTH=256,
    parameter PKT_BUFFER_WIDTH = 289,
    parameter C_S_AXIS_TUSER_WIDTH=160, // 128 + pifo width(32)
    parameter C_M_AXIS_TUSER_WIDTH=128,
    
    //parameter C_S_AXIS_TUSER_WIDTH=128,
    parameter NUM_QUEUES=5,
//    parameter BUFFER_INDEX_WIDTH = 12,  // calculated by log2 function
    
    // AXI Registers Data Width
    parameter C_S_AXI_DATA_WIDTH    = 32,          
    parameter C_S_AXI_ADDR_WIDTH    = 32,
//    parameter CPU_BUFFER_CALL_INDEX_WIDTH = 12,
              
    parameter C_BASEADDR            = 32'h00000000,

    // SI
    parameter QUEUE_DEPTH_BITS = 16,
    // end for original parameter.
    
    // parameters for scheduler_top.
    parameter BUFFER_WORD_DEPTH = 4096,
    parameter PIFO_CALENDAR_DEPTH = 512,  // scale down to test bit simulation.
    parameter PIFO_INFO_LENGTH = 32,
    parameter BUFFER_OUTPUT_SYNC=0,
    parameter CPU_EQ_AGENT_ADDR = 8
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
     output [QUEUE_DEPTH_BITS-1:0] nf0_q_size,
     output [QUEUE_DEPTH_BITS-1:0] nf1_q_size,
     output [QUEUE_DEPTH_BITS-1:0] nf2_q_size,
     output [QUEUE_DEPTH_BITS-1:0] nf3_q_size,
     output [QUEUE_DEPTH_BITS-1:0] dma_q_size,


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
    output                                    S_AXI_AWREADY

//    output reg [C_S_AXI_DATA_WIDTH-1:0]  bytes_dropped,
//    output reg [NUM_QUEUES-1:0]          pkt_dropped
    );
    
    
    function integer log2;
       input integer number;
       begin
          log2=0;
          while(2**log2<number) begin
             log2=log2+1;
          end
       end
    endfunction // log2
    
    localparam BUFFER_INDEX_WIDTH = log2(BUFFER_WORD_DEPTH);
    localparam CPU_BUFFER_CALL_INDEX_WIDTH = log2(BUFFER_WORD_DEPTH);
    localparam PIFO_INDEX_WIDTH = log2(PIFO_CALENDAR_DEPTH);    
    
    
    
     wire [NUM_QUEUES-1:0]               w_buffer_almost_full_bit_array; 
     wire [NUM_QUEUES-1:0]               w_pifo_full_bit_array;
     wire [NUM_QUEUES-1:0]               w_buffer_write_en_bit_array; 
     wire [NUM_QUEUES-1:0]               w_pifo_insert_en_bit_array; 
    
    // read wire between cpu_sub and output queue module
    wire [CPU_BUFFER_CALL_INDEX_WIDTH-1 : 0]     w_cpu2ip_read_pkt_buffer_req_addr;
    wire [NUM_QUEUES-1:0]               w_cpu2ip_read_pkt_buffer_req_valid;
    wire [PKT_BUFFER_WIDTH-1:0]         w_ip2cpu_read_pkt_buffer_resp_value;
    wire [NUM_QUEUES-1:0]               w_ip2cpu_read_pkt_buffer_resp_valid;
    
    wire [CPU_BUFFER_CALL_INDEX_WIDTH-1 : 0]     w_cpu2ip_read_sume_buffer_req_addr;
    wire [NUM_QUEUES-1:0]               w_cpu2ip_read_sume_buffer_req_valid;  
    wire [C_M_AXIS_TUSER_WIDTH-1:0]     w_ip2cpu_read_sume_buffer_resp_value;  
    wire [NUM_QUEUES-1:0]               w_ip2cpu_read_sume_buffer_resp_valid;  
                                         
    wire [CPU_BUFFER_CALL_INDEX_WIDTH-1 : 0]     w_cpu2ip_read_pifo_buffer_req_addr;    
    wire [NUM_QUEUES-1:0]               w_cpu2ip_read_pifo_buffer_req_valid;   
    wire [PIFO_INFO_LENGTH-1:0]         w_ip2cpu_read_pifo_buffer_resp_value;  
    wire [NUM_QUEUES-1:0]               w_ip2cpu_read_pifo_buffer_resp_valid;  
                                         
    wire [PIFO_INDEX_WIDTH-1 : 0]     w_cpu2ip_read_pifo_calendar_req_addr;  
    wire [NUM_QUEUES-1:0]               w_cpu2ip_read_pifo_calendar_req_valid; 
    wire [PIFO_INFO_LENGTH-1:0]         w_ip2cpu_read_pifo_calendar_resp_value;
    wire [NUM_QUEUES-1:0]               w_ip2cpu_read_pifo_calendar_resp_valid;
                                         
    // write wire between cpu_sub and output queue module                                     
    wire [CPU_BUFFER_CALL_INDEX_WIDTH-1 : 0]     w_cpu2ip_write_pkt_buffer_req_addr;    
    wire [PKT_BUFFER_WIDTH-1:0]         w_cpu2ip_write_pkt_buffer_req_value;   
    wire [NUM_QUEUES-1:0]               w_cpu2ip_write_pkt_buffer_req_valid;   
    wire [NUM_QUEUES-1:0]               w_ip2cpu_write_pkt_buffer_resp_valid;  
                                         
    wire [CPU_BUFFER_CALL_INDEX_WIDTH-1 : 0]     w_cpu2ip_write_sume_buffer_req_addr;   
    wire [C_M_AXIS_TUSER_WIDTH-1:0]     w_cpu2ip_write_sume_buffer_req_value;  
    wire [NUM_QUEUES-1:0]               w_cpu2ip_write_sume_buffer_req_valid;  
    wire [NUM_QUEUES-1:0]               w_ip2cpu_write_sume_buffer_resp_valid; 
                                         
    wire [CPU_BUFFER_CALL_INDEX_WIDTH-1 : 0]     w_cpu2ip_write_pifo_buffer_req_addr;   
    wire [PIFO_INFO_LENGTH-1:0]         w_cpu2ip_write_pifo_buffer_req_value;  
    wire [NUM_QUEUES-1:0]               w_cpu2ip_write_pifo_buffer_req_valid;  
    wire [NUM_QUEUES-1:0]               w_ip2cpu_write_pifo_buffer_resp_valid; 
                                         
    wire [PIFO_INDEX_WIDTH-1 : 0]     w_cpu2ip_write_pifo_calendar_req_addr; 
    wire [PIFO_INFO_LENGTH-1:0]         w_cpu2ip_write_pifo_calendar_req_value;
    wire [NUM_QUEUES-1:0]               w_cpu2ip_write_pifo_calendar_req_valid;
    wire [NUM_QUEUES-1:0]               w_ip2cpu_write_pifo_calendar_resp_valid;

    reg [DATA_WIDTH - 1:0]                    s_axis_tdata_d1;
    reg [(DATA_WIDTH / 8) - 1:0]              s_axis_tkeep_d1;
    reg [C_S_AXIS_TUSER_WIDTH-1:0]            s_axis_tuser_d1;
    reg                                       s_axis_tvalid_d1;
    reg                                       s_axis_tlast_d1;

    reg [DATA_WIDTH - 1:0]                    s_axis_tdata_d2;
    reg [(DATA_WIDTH / 8) - 1:0]              s_axis_tkeep_d2;
    reg [C_S_AXIS_TUSER_WIDTH-1:0]            s_axis_tuser_d2;
    reg                                       s_axis_tvalid_d2;
    reg                                       s_axis_tlast_d2;

    reg [PIFO_INFO_LENGTH-1:0]         r_m_axis_0_tpifo;
    reg [PIFO_INFO_LENGTH-1:0]         r_m_axis_1_tpifo;
    reg [PIFO_INFO_LENGTH-1:0]         r_m_axis_2_tpifo;
    reg [PIFO_INFO_LENGTH-1:0]         r_m_axis_3_tpifo;
    reg [PIFO_INFO_LENGTH-1:0]         r_m_axis_4_tpifo;
            


    reg [NUM_QUEUES-1:0]               r_buffer_write_en_bit_array; 
    reg [NUM_QUEUES-1:0]               r_pifo_insert_en_bit_array;  

//     wire [C_S_AXIS_TUSER_WIDTH-PIFO_INFO_LENGTH-1:0] w_sume_meta_d2;
//     wire    [PIFO_INFO_LENGTH-1:0] w_pifo_info_d2;    

    wire [CPU_EQ_AGENT_ADDR-1:0] w_cpu2ip_read_stat_enqueue_agent_req_addr; 
    wire                          w_cpu2ip_read_stat_enqueue_agent_req_valid;
    wire [C_S_AXI_DATA_WIDTH-1:0] w_ip2cpu_read_stat_enqueue_agent_resp_value;
    wire                          w_ip2cpu_read_stat_enqueue_agent_resp_valid;
        
        
// enqueue agent handles real data(not delayed input data),
// to check whether drop or enqueue.

wire  [PIFO_INFO_LENGTH-1:0] w_pifo_info, w_pifo_info_d1;
wire  [C_S_AXIS_TUSER_WIDTH-PIFO_INFO_LENGTH-1:0] w_sume_meta, w_sume_meta_d1;

assign {w_pifo_info_d1, w_sume_meta_d1} = s_axis_tuser_d1; //wire split
assign {w_pifo_info, w_sume_meta} = s_axis_tuser; //wire split

    enqueue_agent_v0_1
    #(
    .SYNC_MODE(1)
    )
    enqueue_agent_inst(
            // from/to pipeline
        .s_axis_tvalid(s_axis_tvalid), 
        
        .s_axis_tuser(w_sume_meta), // sume_meta.
        .s_axis_tpifo_valid(w_pifo_info[PIFO_INFO_LENGTH-1]),//w_pifo_info[PIFO_INFO_LENGTH-1]
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tready(s_axis_tready), //output signal.
        
        // from each port queue status 
        .s_axis_buffer_almost_full(w_buffer_almost_full_bit_array),
        .s_axis_pifo_full(w_pifo_full_bit_array),
            
        .m_axis_ctl_pifo_in_en(w_pifo_insert_en_bit_array),
        .m_axis_ctl_buffer_wr_en(w_buffer_write_en_bit_array),
        
        // cpu read req/resp
        
        .s_axi_addr(w_cpu2ip_read_stat_enqueue_agent_req_addr),      
        .s_axi_req_valid(w_cpu2ip_read_stat_enqueue_agent_req_valid), 
                         
        .m_axi_data(w_ip2cpu_read_stat_enqueue_agent_resp_value),      
        .m_axi_resp_valid(w_ip2cpu_read_stat_enqueue_agent_resp_valid),        
        
        .axis_aclk(axis_aclk),
        .axis_resetn(axis_resetn)
    );

//    wire                        buffer_0_empty
    wire                                        buffer_almost_full[0:NUM_QUEUES-1];
    wire                                        pifo_full[0:NUM_QUEUES-1];
    wire [BUFFER_INDEX_WIDTH-1:0]               buffer_queue_depth[0:NUM_QUEUES-1];
    
    wire [DATA_WIDTH - 1:0]                     w_tdata_to_sss_output_queue_single[0:NUM_QUEUES-1];
    wire [(DATA_WIDTH / 8) - 1:0]               w_tkeep_to_sss_output_queue_single[0:NUM_QUEUES-1];
    wire [C_M_AXIS_TUSER_WIDTH-1:0]             w_tuser_to_sss_output_queue_single[0:NUM_QUEUES-1];
    wire                                        w_tvalid_to_sss_output_queue_single[0:NUM_QUEUES-1];
    wire                                        w_tlast_to_sss_output_queue_single[0:NUM_QUEUES-1];
    wire                                        w_tready_from_sss_output_queue_single[0:NUM_QUEUES-1];
    wire [PIFO_INFO_LENGTH-1:0]                 w_tpifo_next[0:NUM_QUEUES-1];
    
    wire                                       w_m_axis_tready[0:NUM_QUEUES-1];
    wire [DATA_WIDTH - 1:0]                   w_m_axis_tdata[0:NUM_QUEUES-1];
    wire [(DATA_WIDTH / 8) - 1:0]             w_m_axis_tkeep[0:NUM_QUEUES-1];
    wire [C_M_AXIS_TUSER_WIDTH-1:0]           w_m_axis_tuser[0:NUM_QUEUES-1];
    wire [PIFO_INFO_LENGTH-1:0]               w_m_axis_tpifo[0:NUM_QUEUES-1];
    wire                                      w_m_axis_tvalid[0:NUM_QUEUES-1];
    wire                                      w_m_axis_tlast[0:NUM_QUEUES-1]; 
    
    assign w_m_axis_tready[0] = m_axis_0_tready;
    assign w_m_axis_tready[1] = m_axis_1_tready;
    assign w_m_axis_tready[2] = m_axis_2_tready;
    assign w_m_axis_tready[3] = m_axis_3_tready;
    assign w_m_axis_tready[4] = m_axis_4_tready;
            
    assign m_axis_0_tdata = w_m_axis_tdata[0];
    assign m_axis_1_tdata = w_m_axis_tdata[1];
    assign m_axis_2_tdata = w_m_axis_tdata[2];
    assign m_axis_3_tdata = w_m_axis_tdata[3];
    assign m_axis_4_tdata = w_m_axis_tdata[4];
    
    assign m_axis_0_tkeep = w_m_axis_tkeep[0];
    assign m_axis_1_tkeep = w_m_axis_tkeep[1];
    assign m_axis_2_tkeep = w_m_axis_tkeep[2];
    assign m_axis_3_tkeep = w_m_axis_tkeep[3];
    assign m_axis_4_tkeep = w_m_axis_tkeep[4];

    assign m_axis_0_tuser = w_m_axis_tuser[0];
    assign m_axis_1_tuser = w_m_axis_tuser[1];
    assign m_axis_2_tuser = w_m_axis_tuser[2];
    assign m_axis_3_tuser = w_m_axis_tuser[3];
    assign m_axis_4_tuser = w_m_axis_tuser[4];
    
    assign m_axis_0_tvalid = w_m_axis_tvalid[0];
    assign m_axis_1_tvalid = w_m_axis_tvalid[1];
    assign m_axis_2_tvalid = w_m_axis_tvalid[2];
    assign m_axis_3_tvalid = w_m_axis_tvalid[3];
    assign m_axis_4_tvalid = w_m_axis_tvalid[4];        
    
    assign m_axis_0_tlast = w_m_axis_tlast[0];
    assign m_axis_1_tlast = w_m_axis_tlast[1];
    assign m_axis_2_tlast = w_m_axis_tlast[2];
    assign m_axis_3_tlast = w_m_axis_tlast[3];
    assign m_axis_4_tlast = w_m_axis_tlast[4];
    

    genvar i;
    generate
        
        for(i=0;i<NUM_QUEUES;i=i+1)
            begin:gen_output_queue
                
                output_queue_v0_1_with_cpu
                #(
                .BUFFER_ADDR_WIDTH(BUFFER_INDEX_WIDTH),  
                .BUFFER_WORD_DEPTH(BUFFER_WORD_DEPTH),
                .PIFO_WORD_DEPTH(PIFO_CALENDAR_DEPTH),
                .PIFO_ADDR_WIDTH(PIFO_INDEX_WIDTH),  
                .OUTPUT_SYNC(BUFFER_OUTPUT_SYNC)          
                )
                output_queue_inst(
            
                    .s_axis_tdata(s_axis_tdata_d1),
                    .s_axis_tkeep(s_axis_tkeep_d1),
                    .s_axis_tuser(w_sume_meta_d1),
                    .s_axis_tpifo(w_pifo_info_d1),
                    .s_axis_tvalid(s_axis_tvalid_d1 & r_buffer_write_en_bit_array[i]),
                    .s_axis_tlast(s_axis_tlast_d1),
                    .s_axis_buffer_wr_en(r_buffer_write_en_bit_array[i]),
                    .s_axis_pifo_insert_en(r_pifo_insert_en_bit_array[i]),
            
                    .m_axis_tready(w_tready_from_sss_output_queue_single[i]),
                    .m_axis_tvalid(w_tvalid_to_sss_output_queue_single[i]),
                    .m_axis_tdata(w_tdata_to_sss_output_queue_single[i]),
                    .m_axis_tkeep(w_tkeep_to_sss_output_queue_single[i]),
                    .m_axis_tlast(w_tlast_to_sss_output_queue_single[i]),
                    .m_axis_tuser(w_tuser_to_sss_output_queue_single[i]),
                    .m_axis_tpifo(w_tpifo_next[i]),
                    .m_is_buffer_almost_full(buffer_almost_full[i]),
                    .m_is_pifo_full(pifo_full[i]),
                    .m_buffer_counter(buffer_queue_depth[i]),
                    .axis_aclk(axis_aclk),
                    .axis_resetn(axis_resetn)
                );
            
                sss_output_queue_single
                sss_output_queue_single_inst
                (
                    .axis_aclk(axis_aclk),    
                    .axis_resetn(axis_resetn),  
                                             
                    .s_axis_tdata(w_tdata_to_sss_output_queue_single[i]), 
                    .s_axis_tkeep(w_tkeep_to_sss_output_queue_single[i]), 
                    .s_axis_tuser(w_tuser_to_sss_output_queue_single[i]), 
                    .s_axis_tvalid(w_tvalid_to_sss_output_queue_single[i]),
                    .s_axis_tready(w_tready_from_sss_output_queue_single[i]),
                    .s_axis_tlast(w_tlast_to_sss_output_queue_single[i]), 
                                         
                    .m_axis_tdata(w_m_axis_tdata[i]), 
                    .m_axis_tkeep(w_m_axis_tkeep[i]), 
                    .m_axis_tuser(w_m_axis_tuser[i]), 
                    .m_axis_tvalid(w_m_axis_tvalid[i]),
                    .m_axis_tready(w_m_axis_tready[i]),
                    .m_axis_tlast(w_m_axis_tlast[i])   
                );
                
            end
    
    
    endgenerate
    

always @(posedge axis_aclk)
begin
    if(~axis_resetn)
        begin
            s_axis_tdata_d1  <= 0; 
            s_axis_tkeep_d1  <= 0; 
            s_axis_tuser_d1  <= 0; 
            s_axis_tvalid_d1 <= 0;
            s_axis_tlast_d1  <= 0; 

            s_axis_tdata_d2  <= 0; 
            s_axis_tkeep_d2  <= 0; 
            s_axis_tuser_d2  <= 0; 
            s_axis_tvalid_d2 <= 0;
            s_axis_tlast_d2  <= 0; 
            
            
            r_m_axis_0_tpifo <= 0;
            r_m_axis_1_tpifo <= 0;
            r_m_axis_2_tpifo <= 0;
            r_m_axis_3_tpifo <= 0;
            r_m_axis_4_tpifo <= 0;
            
            r_buffer_write_en_bit_array <= 0;
            r_pifo_insert_en_bit_array <=0 ; 

            
        end
    else
        begin
            s_axis_tdata_d1  <= s_axis_tdata; 
            s_axis_tkeep_d1  <= s_axis_tkeep; 
            s_axis_tuser_d1  <= s_axis_tuser; 
            s_axis_tvalid_d1 <= s_axis_tvalid;
            s_axis_tlast_d1  <= s_axis_tlast; 

            s_axis_tdata_d2  <= s_axis_tdata_d1; 
            s_axis_tkeep_d2  <= s_axis_tkeep_d1; 
            s_axis_tuser_d2 <= s_axis_tuser_d1; 
            s_axis_tvalid_d2 <= s_axis_tvalid_d1;
            s_axis_tlast_d2  <= s_axis_tlast_d1; 

            r_m_axis_0_tpifo <= w_tpifo_next[0];
            r_m_axis_1_tpifo <= w_tpifo_next[1];
            r_m_axis_2_tpifo <= w_tpifo_next[2];
            r_m_axis_3_tpifo <= w_tpifo_next[3];
            r_m_axis_4_tpifo <= w_tpifo_next[4];

            r_buffer_write_en_bit_array <= w_buffer_write_en_bit_array;
            r_pifo_insert_en_bit_array <= w_pifo_insert_en_bit_array; 

        end
end

//assign  w_pifo_info_d2 = s_axis_tuser_d2[C_S_AXIS_TUSER_WIDTH-1:C_S_AXIS_TUSER_WIDTH-PIFO_INFO_LENGTH];    
//assign  w_sume_meta_d2 = s_axis_tuser_d2[C_S_AXIS_TUSER_WIDTH-PIFO_INFO_LENGTH-1:0];
assign w_buffer_almost_full_bit_array = {buffer_almost_full[4],buffer_almost_full[3],buffer_almost_full[2],buffer_almost_full[1],buffer_almost_full[0]};
assign w_pifo_full_bit_array = {pifo_full[4],pifo_full[3],pifo_full[2],pifo_full[1],pifo_full[0]};
assign nf0_q_size = {4'b0, buffer_queue_depth[0]};
assign nf1_q_size = {4'b0, buffer_queue_depth[1]};
assign nf2_q_size = {4'b0, buffer_queue_depth[2]};
assign nf3_q_size = {4'b0, buffer_queue_depth[3]};
assign dma_q_size = {4'b0, buffer_queue_depth[4]}; 

assign m_axis_0_tpifo = r_m_axis_0_tpifo;
assign m_axis_1_tpifo = r_m_axis_1_tpifo;
assign m_axis_2_tpifo = r_m_axis_2_tpifo;
assign m_axis_3_tpifo = r_m_axis_3_tpifo;
assign m_axis_4_tpifo = r_m_axis_4_tpifo;

endmodule
