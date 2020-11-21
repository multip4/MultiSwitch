//-
// Copyright (C) 2010, 2011 The Board of Trustees of The Leland Stanford
//                          Junior University
// Copyright (C) 2010, 2011 Adam Covington
// Copyright (C) 2015 Noa Zilberman
// Copyright (C) 2017 Stephen Ibanez
// All rights reserved.
//
// This software was developed by
// Stanford University and the University of Cambridge Computer Laboratory
// under National Science Foundation under Grant No. CNS-0855268,
// the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and
// by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), 
// as part of the DARPA MRC research programme.
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
/*******************************************************************************
 *  File:
 *        sss_output_queues.v
 *
 *  Library:
 *        hw/std/cores/sss_output_queues.v
 *
 *  Module:
 *        sss_output_queues.v
 *
 *  Author:
 *        Adam Covington
 *        Modified by Noa Zilberman
 *        Modified by Stephen Ibanez
 *    
 *  Description:
 *        BRAM Output queues
 *        Outputs have a parameterizable width
 *
 *        This is a modified version of the original netfpga output_queues module.
 *        s_axis_tready = 0 until s_axis_tvalid is asserted. 
 *
 */


module sss_output_queue_single
#(
    // Master AXI Stream Data Width
    parameter C_M_AXIS_DATA_WIDTH=256,
    parameter C_S_AXIS_DATA_WIDTH=256,
    parameter C_M_AXIS_TUSER_WIDTH=128,
    parameter C_S_AXIS_TUSER_WIDTH=128,
    parameter QUEUE_BUFFER_SIZE = 256,
    parameter QUEUE_BUFFER_THRESHOLD = 128
)
(
    // Part 1: System side signals
    // Global Ports
    input                                           axis_aclk,
    input                                           axis_resetn,

    // Slave Stream Ports (interface to data path)
    input [C_S_AXIS_DATA_WIDTH - 1:0]               s_axis_tdata,
    input [((C_S_AXIS_DATA_WIDTH / 8)) - 1:0]       s_axis_tkeep,
    input [C_S_AXIS_TUSER_WIDTH-1:0]                s_axis_tuser,
    input                                           s_axis_tvalid,
    output                                          s_axis_tready,
    input                                           s_axis_tlast,

    // Master Stream Ports (interface to TX queues)
    output [C_M_AXIS_DATA_WIDTH - 1:0]              m_axis_tdata,
    output [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0]      m_axis_tkeep,
    output [C_M_AXIS_TUSER_WIDTH-1:0]               m_axis_tuser,
    output                                          m_axis_tvalid,
    input                                           m_axis_tready,
    output                                          m_axis_tlast
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

   // ------------ Internal Params --------


   localparam BUFFER_SIZE         = QUEUE_BUFFER_SIZE; // enough for about 100us of buffering  //4096; // Buffer size 4096B
   localparam BUFFER_SIZE_WIDTH   = log2(BUFFER_SIZE/(C_M_AXIS_DATA_WIDTH/8));
   localparam BUFFER_THRESHOLD = QUEUE_BUFFER_THRESHOLD/(C_M_AXIS_DATA_WIDTH/8); // buffer almost full at 1500 depth.
   localparam NUM_STATES = 1;
   localparam IDLE = 0;
   localparam WR_PKT = 1;

   localparam NUM_METADATA_STATES = 2;
   localparam WAIT_HEADER = 0;
   localparam WAIT_EOP = 1;

   // SI
   localparam MIN_PACKET_SIZE = 64;
   localparam META_BUFFER_WIDTH = BUFFER_SIZE_WIDTH;


   // ------------- Regs/ wires -----------

   /* Format of tuser signal:
    *     [15:0]    pkt_len; // unsigned int
    *     [23:16]   src_port; // one-hot encoded: {DMA, NF3, DMA, NF2, DMA, NF1, DMA, NF0}
    *     [31:24]   dst_port; // one-hot encoded: {DMA, NF3, DMA, NF2, DMA, NF1, DMA, NF0}
    *     [39:32]   drop; // only bit 32 is used
    *     [47:40]   send_dig_to_cpu; // only bit 40 is used
    *     [127:48]  digest_data;
    */


   reg                 nearly_full;
   wire                nearly_full_fifo;
   wire                empty;

   reg                 metadata_nearly_full;
   wire                metadata_nearly_full_fifo;
   wire                metadata_empty;

   wire [C_M_AXIS_TUSER_WIDTH-1:0]             fifo_out_tuser;
   wire [C_M_AXIS_DATA_WIDTH-1:0]        fifo_out_tdata;
   wire [((C_M_AXIS_DATA_WIDTH/8))-1:0]  fifo_out_tkeep;
   wire              fifo_out_tlast;

   wire                rd_en;
   reg                 wr_en;

   reg                 metadata_rd_en;
   reg                 metadata_wr_en;

//   reg           cur_queue;
//   reg           cur_queue_next;
//   wire          oq;

   reg [NUM_STATES-1:0]                state;
   reg [NUM_STATES-1:0]                state_next;

   reg [NUM_METADATA_STATES-1:0]       metadata_state;
   reg [NUM_METADATA_STATES-1:0]       metadata_state_next;

//   reg                                                             first_word, first_word_next;



//   wire clear_counters;
//   wire reset_registers;


   // ------------ SSS additions -------------

   localparam DIGEST_WIDTH = 80;
    wire send_dig_to_cpu;
    wire [DIGEST_WIDTH-1:0] digest_data;

   wire [C_S_AXIS_DATA_WIDTH/8 + C_S_AXIS_DATA_WIDTH:0] data_queue_in;
    wire  data_queue_wr_en;
   wire [C_S_AXIS_TUSER_WIDTH-1:0] metadata_queue_in;
    wire  metadata_queue_wr_en;
   wire [BUFFER_SIZE_WIDTH:0] data_queue_depth;

   // ------------ Modules -------------
   localparam SEND_DIG_POS = 40; 
   assign send_dig_to_cpu = s_axis_tuser[SEND_DIG_POS];
   assign digest_data = s_axis_tuser[127:48];

      /*
        We want to send the digest_data over DMA if the send_dig_to_cpu bit is set
        otherwise use the packet itself will be sent over DMA if the output queue
        field specifies one of the DMA queues.

        If send_dig_to_cpu == 1'b1 then that digest data is actually written a clock cycle
        early (i.e. when state == IDLE). 
      */
      assign data_queue_in = {s_axis_tlast, 
                                s_axis_tkeep, 
                                s_axis_tdata};

      assign data_queue_wr_en = wr_en;

      assign metadata_queue_in = s_axis_tuser;  

      assign metadata_queue_wr_en = metadata_wr_en;

      sss_fallthrough_small_fifo
        #( .WIDTH(C_M_AXIS_DATA_WIDTH+C_M_AXIS_DATA_WIDTH/8+1),
           .MAX_DEPTH_BITS(BUFFER_SIZE_WIDTH),
           .PROG_FULL_THRESHOLD(BUFFER_THRESHOLD))
      output_fifo
        (// Outputs
         .dout                           ({fifo_out_tlast, fifo_out_tkeep, fifo_out_tdata}),
         .full                           (),
         .nearly_full                    (),
         .prog_full                      (nearly_full_fifo),
         .empty                          (empty),
         // Inputs
         .din                            (data_queue_in),
         .wr_en                          (data_queue_wr_en),
         .rd_en                          (rd_en),

         .depth                          (data_queue_depth), 

         .reset                          (~axis_resetn),
         .clk                            (axis_aclk));
      
      fallthrough_small_fifo
        #( .WIDTH(C_M_AXIS_TUSER_WIDTH),
           .MAX_DEPTH_BITS(META_BUFFER_WIDTH))
      metadata_fifo
        (// Outputs
         .dout                           (fifo_out_tuser),
         .full                           (),
         .nearly_full                    (metadata_nearly_full_fifo),
        .prog_full                      (),
         .empty                          (metadata_empty),
         // Inputs
         .din                            (metadata_queue_in),
         .wr_en                          (metadata_queue_wr_en),
         .rd_en                          (metadata_rd_en),
         .reset                          (~axis_resetn),
         .clk                            (axis_aclk));


   always @(metadata_state, rd_en, fifo_out_tlast, fifo_out_tuser) begin
        metadata_rd_en = 1'b0;

  metadata_state_next = metadata_state;
        case(metadata_state)
          WAIT_HEADER: begin
            if(rd_en) begin
                  if (~fifo_out_tlast) begin
                    metadata_state_next = WAIT_EOP;
                  end
                  metadata_rd_en = 1'b1;
            end
          end
          
          WAIT_EOP: begin
            if(rd_en & fifo_out_tlast) begin
              metadata_state_next = WAIT_HEADER;
            end
          end
        endcase
      end

      always @(posedge axis_aclk) begin
        if(~axis_resetn) begin
          metadata_state <= WAIT_HEADER;
        end
        else begin
          metadata_state <= metadata_state_next;
        end
end

   always @(*) begin
      state_next     = state;
      wr_en          = 0;
      metadata_wr_en = 0;

      case(state)

        /* cycle between input queues until one is not empty */
        IDLE: begin
           if(s_axis_tvalid) begin
                  state_next = WR_PKT;
                  metadata_wr_en = 1'b1;
                  wr_en=1'b1;
           end
        end

        /* wait until eop */
        WR_PKT: begin
            if(s_axis_tvalid) begin
                wr_en = 1'b1;
                if(s_axis_tlast) begin
                    state_next = IDLE;
                end
            end
        end // case: WR_PKT

      endcase // case(state)
   end // always @ (*)


   always @(posedge axis_aclk) begin
      if(~axis_resetn) begin
         state <= IDLE;
//         first_word <= 0;

      end
      else begin
         state <= state_next;
//         first_word <= first_word_next;

      end

      nearly_full <= nearly_full_fifo;
      metadata_nearly_full <= metadata_nearly_full_fifo;
   end


   assign m_axis_tdata   = fifo_out_tdata;
   assign m_axis_tkeep   = fifo_out_tkeep;
   assign m_axis_tuser   = fifo_out_tuser;
   assign m_axis_tlast   = fifo_out_tlast;
   assign m_axis_tvalid  = ~empty;
   assign rd_en    = m_axis_tready & ~empty;
//   assign s_axis_tready = ~nearly_full_fifo & ~metadata_nearly_full_fifo;
   assign s_axis_tready = ~nearly_full & ~metadata_nearly_full;

endmodule
