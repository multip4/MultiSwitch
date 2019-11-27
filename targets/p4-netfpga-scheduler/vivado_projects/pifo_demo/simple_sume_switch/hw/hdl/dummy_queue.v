//-
// Copyright (c) 2015 Noa Zilberman
// All rights reserved.
//  File:
//        dummy_queueue.v
//
//  Module:
//        dummy_queue (Might be instead by PIFO QUEUE)
//
//  Author: 1000 lim, Queue Jinkook From Korea University.
//
//  Description:
//        Dummy Queue for the test PIFO Extern Block.
//
// @NETFPGA_LICENSE_HEADER_START@
//
// Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor
// license agreements.  See the NOTICE file distributed with this work for
// additional information regarding copyright ownership.  NetFPGA licenses this
// file to you under the NetFPGA Hardware-Software License, Version 1.0 (the
// "License"); you may not use this file except in compliance with the
// License.  You may obtain a copy of the License at:
//
//   http://www.netfpga-cic.org
//
// Unless required by applicable law or agreed to in writing, Work distributed
// under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.
//
// @NETFPGA_LICENSE_HEADER_END@
//

`timescale 1ps / 1ps

module dummy_queue
#(
    // parameters from original output_queue.v
    // Master AXI Stream Data Width
    parameter DATA_WIDTH=256,
    parameter C_S_AXIS_TUSER_WIDTH=160, // 128 + pifo width(32)
    parameter C_M_AXIS_TUSER_WIDTH=160,
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


//register for dummy logic - pifo information
reg [PIFO_INFO_LENGTH-1:0] r_port0_pifo_info;
reg [PIFO_INFO_LENGTH-1:0] r_port1_pifo_info;
reg [PIFO_INFO_LENGTH-1:0] r_port2_pifo_info;
reg [PIFO_INFO_LENGTH-1:0] r_port3_pifo_info;
reg [PIFO_INFO_LENGTH-1:0] r_port4_pifo_info;

wire [PIFO_INFO_LENGTH-1:0] r_port0_pifo_info_next;
wire [PIFO_INFO_LENGTH-1:0] r_port1_pifo_info_next;
wire [PIFO_INFO_LENGTH-1:0] r_port2_pifo_info_next;
wire [PIFO_INFO_LENGTH-1:0] r_port3_pifo_info_next;
wire [PIFO_INFO_LENGTH-1:0] r_port4_pifo_info_next;


// dummy logic for pifo info output

always @(posedge axis_aclk)
begin
    if(~axis_resetn)//reset valid at low
        begin
            r_port0_pifo_info <= 0;
            r_port1_pifo_info <= 0;
            r_port2_pifo_info <= 0;
            r_port3_pifo_info <= 0;
            r_port4_pifo_info <= 0;
        end
    else
        begin
            r_port0_pifo_info <= r_port0_pifo_info_next;
            r_port1_pifo_info <= r_port1_pifo_info_next;
            r_port2_pifo_info <= r_port2_pifo_info_next;
            r_port3_pifo_info <= r_port3_pifo_info_next;
            r_port4_pifo_info <= r_port4_pifo_info_next;
        end
end

// 

localparam DST_POS = 24;

wire[PIFO_INFO_LENGTH-1:0] w_input_pifo_info;
assign w_input_pifo_info = s_axis_tuser[C_S_AXIS_TUSER_WIDTH-1:128];

wire[NUM_QUEUES-1:0] output_port_bit_array_wire;
// get output bit array.
assign output_port_bit_array_wire =  
                s_axis_tuser[DST_POS] |               // port 0
               (s_axis_tuser[DST_POS + 2] << 1) |     // port 1
               (s_axis_tuser[DST_POS + 4] << 2) |     // port 2
               (s_axis_tuser[DST_POS + 6] << 3) |     // port 3
               ((s_axis_tuser[DST_POS + 1] | 
               s_axis_tuser[DST_POS + 3] | 
               s_axis_tuser[DST_POS + 5] | 
               s_axis_tuser[DST_POS + 7]) << 4); // port 4, cpu.

assign r_port0_pifo_info_next = (output_port_bit_array_wire[0]) ? w_input_pifo_info : r_port0_pifo_info;
assign r_port1_pifo_info_next = (output_port_bit_array_wire[1]) ? w_input_pifo_info : r_port1_pifo_info;
assign r_port2_pifo_info_next = (output_port_bit_array_wire[2]) ? w_input_pifo_info : r_port2_pifo_info;
assign r_port3_pifo_info_next = (output_port_bit_array_wire[3]) ? w_input_pifo_info : r_port3_pifo_info;
assign r_port4_pifo_info_next = (output_port_bit_array_wire[4]) ? w_input_pifo_info : r_port4_pifo_info;



//assign input port to output port
assign m_axis_0_tpifo = r_port0_pifo_info_next;
assign m_axis_1_tpifo = r_port1_pifo_info_next;
assign m_axis_2_tpifo = r_port2_pifo_info_next;
assign m_axis_3_tpifo = r_port3_pifo_info_next;
assign m_axis_4_tpifo = r_port4_pifo_info_next;

assign s_axis_tready =1;
assign m_axis_0_tready = 1;
assign m_axis_0_tdata = s_axis_tdata;
assign m_axis_0_tkeep = s_axis_tkeep;
assign m_axis_0_tuser = s_axis_tuser;
assign m_axis_0_tvalid = s_axis_tvalid;
assign m_axis_0_tlast = s_axis_tlast;

assign m_axis_1_tready = 1;
assign m_axis_1_tdata = s_axis_tdata;
assign m_axis_1_tkeep = s_axis_tkeep;
assign m_axis_1_tuser = s_axis_tuser;
assign m_axis_1_tvalid = s_axis_tvalid;
assign m_axis_1_tlast = s_axis_tlast;

assign m_axis_2_tready = 1;
assign m_axis_2_tdata = s_axis_tdata;
assign m_axis_2_tkeep = s_axis_tkeep;
assign m_axis_2_tuser = s_axis_tuser;
assign m_axis_2_tvalid = s_axis_tvalid;
assign m_axis_2_tlast = s_axis_tlast;

assign m_axis_3_tready = 1;
assign m_axis_3_tdata = s_axis_tdata;
assign m_axis_3_tkeep = s_axis_tkeep;
assign m_axis_3_tuser = s_axis_tuser;
assign m_axis_3_tvalid = s_axis_tvalid;
assign m_axis_3_tlast = s_axis_tlast;

assign m_axis_4_tready = 1;
assign m_axis_4_tdata = s_axis_tdata;
assign m_axis_4_tkeep = s_axis_tkeep;
assign m_axis_4_tuser = s_axis_tuser;
assign m_axis_4_tvalid = s_axis_tvalid;
assign m_axis_4_tlast = s_axis_tlast;


// end for dummy logic
endmodule
