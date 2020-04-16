//-
// Copyright (C) 2010, 2011 The Board of Trustees of The Leland Stanford
//                          Junior University
// Copyright (C) 2019 Stephen Ibanez
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
 *        event_output_queues.v
 *
 *  Module:
 *        event_output_queues
 *
 *  Author:
 *        Stephen Ibanez
 * 		
 *  Description:
 *        A modified version of the output queues module which emits enqueue,
 *        dequeue, and drop events.
 *
 *        Dequeue events must be serialized because different ports might fire
 *        at the same time.
 */

module event_output_queues 
#(
    // Pkt AXI Stream Data Width
    parameter C_M_AXIS_DATA_WIDTH  = 256,
    parameter C_S_AXIS_DATA_WIDTH  = 256,
    parameter C_M_AXIS_TUSER_WIDTH = 128,
    parameter C_S_AXIS_TUSER_WIDTH = 128,

    parameter DST_PORT_POS         = 24,
    parameter NUM_PORTS            = 5,

    parameter PORT_WIDTH           = 8,

    parameter USER_ENQ_DATA_WIDTH  = 32,
    parameter USER_ENQ_DATA_LO     = 32,
    parameter USER_ENQ_DATA_HI     = USER_ENQ_DATA_LO + USER_ENQ_DATA_WIDTH - 1,
    parameter ENQ_DATA_WIDTH       = USER_ENQ_DATA_WIDTH + PORT_WIDTH,

    parameter USER_DEQ_DATA_WIDTH  = 32,
    parameter USER_DEQ_DATA_LO     = USER_ENQ_DATA_HI + 1,
    parameter USER_DEQ_DATA_HI     = USER_DEQ_DATA_LO + USER_DEQ_DATA_WIDTH - 1,
    parameter DEQ_DATA_WIDTH       = USER_DEQ_DATA_WIDTH + PORT_WIDTH,

    parameter USER_DROP_DATA_WIDTH = 32,
    parameter USER_DROP_DATA_LO    = USER_DEQ_DATA_HI + 1,
    parameter USER_DROP_DATA_HI    = USER_DROP_DATA_LO + USER_DROP_DATA_WIDTH - 1,
    parameter DROP_DATA_WIDTH      = USER_DROP_DATA_WIDTH + PORT_WIDTH
)
(
    // Global Ports
    input                                      axis_aclk,
    input                                      axis_resetn,

    // Master Pkt Stream (nf0) 
    output     [C_M_AXIS_DATA_WIDTH - 1:0]         m_axis_0_tdata,
    output     [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m_axis_0_tkeep,
    output     [C_M_AXIS_TUSER_WIDTH-1:0]          m_axis_0_tuser,
    output                                         m_axis_0_tvalid,
    input                                          m_axis_0_tready,
    output                                         m_axis_0_tlast,

    // Master Pkt Stream (nf1) 
    output     [C_M_AXIS_DATA_WIDTH - 1:0]         m_axis_1_tdata,
    output     [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m_axis_1_tkeep,
    output     [C_M_AXIS_TUSER_WIDTH-1:0]          m_axis_1_tuser,
    output                                         m_axis_1_tvalid,
    input                                          m_axis_1_tready,
    output                                         m_axis_1_tlast,

    // Master Pkt Stream (nf2) 
    output     [C_M_AXIS_DATA_WIDTH - 1:0]         m_axis_2_tdata,
    output     [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m_axis_2_tkeep,
    output     [C_M_AXIS_TUSER_WIDTH-1:0]          m_axis_2_tuser,
    output                                         m_axis_2_tvalid,
    input                                          m_axis_2_tready,
    output                                         m_axis_2_tlast,

    // Master Pkt Stream (nf3) 
    output     [C_M_AXIS_DATA_WIDTH - 1:0]         m_axis_3_tdata,
    output     [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m_axis_3_tkeep,
    output     [C_M_AXIS_TUSER_WIDTH-1:0]          m_axis_3_tuser,
    output                                         m_axis_3_tvalid,
    input                                          m_axis_3_tready,
    output                                         m_axis_3_tlast,

    // Master Pkt Stream (dma) 
    output     [C_M_AXIS_DATA_WIDTH - 1:0]         m_axis_4_tdata,
    output     [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m_axis_4_tkeep,
    output     [C_M_AXIS_TUSER_WIDTH-1:0]          m_axis_4_tuser,
    output                                         m_axis_4_tvalid,
    input                                          m_axis_4_tready,
    output                                         m_axis_4_tlast,

    // Slave Pkt Stream Ports (incomming pkts)
    input [C_S_AXIS_DATA_WIDTH - 1:0]              s_axis_tdata,
    input [((C_S_AXIS_DATA_WIDTH / 8)) - 1:0]      s_axis_tkeep,
    input [C_S_AXIS_TUSER_WIDTH-1:0]               s_axis_tuser,
    input                                          s_axis_tvalid,
    output                                         s_axis_tready,
    input                                          s_axis_tlast,

    // Enqueue Event
    output                                         m_enq_event_valid,
    input                                          m_enq_event_rd,
    output [ENQ_DATA_WIDTH-1:0]                    m_enq_event_data,

    // Enqueue Event
    output                                         m_deq_event_valid,
    input                                          m_deq_event_rd,
    output [DEQ_DATA_WIDTH-1:0]                    m_deq_event_data,

    // Drop Event
    output                                         m_drop_event_valid,
    input                                          m_drop_event_rd,
    output [DROP_DATA_WIDTH-1:0]                   m_drop_event_data

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

   //--------------------- Internal Parameters-------------------------
   /* For Insertion FSM */
   localparam WAIT_START     = 0;
   localparam RCV_WORD       = 1;
   localparam DROP_PKT       = 2;
   localparam L2_IFSM_STATES = 2;

   /* For Removal FSM */
   localparam RFSM_START = 0;
   localparam RFSM_FINISH_PKT = 1;
   localparam L2_RFSM_STATES = 1;   

   /* For Drop Events FSM */
   localparam DROP_START      = 0;
   localparam DROP_FINISH_PKT = 1;
   localparam L2_DROP_STATES  = 1;

   localparam MAX_DEPTH = 4096; // measured in 32B words
   localparam L2_MAX_DEPTH = log2(MAX_DEPTH);

   localparam MAX_PKTS = MAX_DEPTH/2; // min pkt size is 64B
   localparam L2_MAX_PKTS = log2(MAX_PKTS);

   localparam MAX_PKT_SIZE = 50; // measured in 32B words
   localparam BUFFER_THRESHOLD = MAX_DEPTH-MAX_PKT_SIZE;

   localparam L2_MAX_ENQ_EVENTS = 7;
   localparam L2_MAX_DEQ_EVENTS = 7;
   localparam L2_MAX_DROP_EVENTS = 7;

   //---------------------- Wires and Regs ---------------------------- 
   reg  [NUM_PORTS-1:0]  d_fifo_wr_en;
   reg  [NUM_PORTS-1:0]  d_fifo_rd_en;
   wire [NUM_PORTS-1:0]  d_fifo_nearly_full;
   wire [NUM_PORTS-1:0]  d_fifo_empty;

   reg  [NUM_PORTS-1:0]  port_enable;

   reg  [NUM_PORTS-1:0]  m_fifo_wr_en;
   reg  [NUM_PORTS-1:0]  m_fifo_rd_en;
   wire [NUM_PORTS-1:0]  m_fifo_nearly_full;
   wire [NUM_PORTS-1:0]  m_fifo_empty;

   reg [L2_IFSM_STATES-1:0] ifsm_state [NUM_PORTS-1:0];
   reg [L2_IFSM_STATES-1:0] ifsm_state_next [NUM_PORTS-1:0];
   reg [L2_RFSM_STATES-1:0] rfsm_state [NUM_PORTS-1:0];
   reg [L2_RFSM_STATES-1:0] rfsm_state_next [NUM_PORTS-1:0];

   wire  [C_M_AXIS_DATA_WIDTH - 1:0]         m_axis_tdata [NUM_PORTS-1:0];
   wire  [((C_M_AXIS_DATA_WIDTH / 8)) - 1:0] m_axis_tkeep [NUM_PORTS-1:0];
   wire  [C_M_AXIS_TUSER_WIDTH-1:0]          m_axis_tuser [NUM_PORTS-1:0];
   reg   [NUM_PORTS-1:0]                     m_axis_tvalid;
   wire  [NUM_PORTS-1:0]                     m_axis_tready;
   wire  [NUM_PORTS-1:0]                     m_axis_tlast;

   reg [PORT_WIDTH-1:0] enq_port;
   reg [USER_DROP_DATA_WIDTH-1:0] user_enq_data;
   reg [ENQ_DATA_WIDTH-1:0] s_enq_event_data;
   reg enq_event_wr;
   wire enq_event_full;
   wire enq_event_empty;

   reg [PORT_WIDTH-1:0] deq_port;
   reg [USER_DEQ_DATA_WIDTH-1:0] user_deq_data;
   reg [DEQ_DATA_WIDTH-1:0] deq_event_din;
   reg  deq_event_wr;
   wire deq_event_full;
   wire deq_event_empty;

   reg [L2_DROP_STATES-1:0] drop_state, drop_state_next;

   reg [PORT_WIDTH-1:0] drop_port;
   reg [USER_DROP_DATA_WIDTH-1:0] user_drop_data;
   reg [DROP_DATA_WIDTH-1:0] s_drop_event_data;
   reg  drop_event_wr;
   wire drop_event_full;
   wire drop_event_empty;

   wire [USER_DEQ_DATA_WIDTH-1:0]   deq_port_fifo_din [NUM_PORTS-1:0];
   wire [NUM_PORTS-1:0]             deq_port_fifo_wr;
   reg  [NUM_PORTS-1:0]             deq_port_fifo_rd;
   wire [USER_DEQ_DATA_WIDTH-1:0]   deq_port_fifo_dout [NUM_PORTS-1:0];
   wire [NUM_PORTS-1:0]             deq_port_fifo_full;
   wire [NUM_PORTS-1:0]             deq_port_fifo_empty;

   //-------------------- Modules and Logic ---------------------------
   // Do not propagate back pressure
   assign s_axis_tready = 1;

   genvar i;
   generate
   for (i=0; i<NUM_PORTS; i=i+1) begin: output_queues
       fallthrough_small_fifo 
          #(
              .WIDTH(C_M_AXIS_DATA_WIDTH+C_M_AXIS_DATA_WIDTH/8+1),
              .MAX_DEPTH_BITS(L2_MAX_DEPTH),
              .PROG_FULL_THRESHOLD(BUFFER_THRESHOLD)
          )
          data_fifo
            (.din         ({s_axis_tlast, s_axis_tkeep, s_axis_tdata}),     // Data in
             .wr_en       (d_fifo_wr_en[i]),       // Write enable
             .rd_en       (d_fifo_rd_en[i]),       // Read the next word
             .dout        ({m_axis_tlast[i], m_axis_tkeep[i], m_axis_tdata[i]}),
             .full        (),
             .prog_full   (d_fifo_nearly_full[i]),
             .nearly_full (),
             .empty       (d_fifo_empty[i]),
             .reset       (~axis_resetn),
             .clk         (axis_aclk)
             );

       fallthrough_small_fifo 
          #(
              .WIDTH(C_M_AXIS_TUSER_WIDTH),
              .MAX_DEPTH_BITS(L2_MAX_PKTS)
          )
          meta_fifo
            (.din         (s_axis_tuser),     // Data in
             .wr_en       (m_fifo_wr_en[i]),       // Write enable
             .rd_en       (m_fifo_rd_en[i]),       // Read the next word
             .dout        (m_axis_tuser[i]),
             .full        (),
             .prog_full   (),
             .nearly_full (m_fifo_nearly_full[i]),
             .empty       (m_fifo_empty[i]),
             .reset       (~axis_resetn),
             .clk         (axis_aclk)
             );

       fallthrough_small_fifo 
          #(
              .WIDTH(USER_DEQ_DATA_WIDTH),
              .MAX_DEPTH_BITS(L2_MAX_DEQ_EVENTS)
          )
          deq_event_port_fifo
            (.din         (deq_port_fifo_din[i]),    // Data in
             .wr_en       (deq_port_fifo_wr[i]),        // Write enable
             .rd_en       (deq_port_fifo_rd[i]),      // Read the next word
             .dout        (deq_port_fifo_dout[i]),
             .full        (),
             .prog_full   (),
             .nearly_full (deq_port_fifo_full[i]),
             .empty       (deq_port_fifo_empty[i]),
             .reset       (~axis_resetn),
             .clk         (axis_aclk)
             );

        /* Drive Dequeue Event Signals */
        assign deq_port_fifo_wr[i] = m_fifo_rd_en[i];
        assign deq_port_fifo_din[i] = m_axis_tuser[i][USER_DEQ_DATA_HI:USER_DEQ_DATA_LO];

        /* Insertion State Machine */
        always @(*) begin
            // defaults
            ifsm_state_next[i] = ifsm_state[i];

            d_fifo_wr_en[i] = 0;
            m_fifo_wr_en[i] = 0;

            if ( ((i < 4) && s_axis_tuser[DST_PORT_POS+(i*2)]) ||
                 ((i == 4) && (s_axis_tuser[DST_PORT_POS+1] | s_axis_tuser[DST_PORT_POS+3] | s_axis_tuser[DST_PORT_POS+5] | s_axis_tuser[DST_PORT_POS+7])) )
                port_enable[i] = 1;
            else
                port_enable[i] = 0;

            case(ifsm_state[i])
                WAIT_START: begin
                    if (s_axis_tvalid & s_axis_tready) begin
                        if (port_enable[i] & ~d_fifo_nearly_full[i] & ~m_fifo_nearly_full[i]) begin
                            d_fifo_wr_en[i] = 1;
                            m_fifo_wr_en[i] = 1;
                            ifsm_state_next[i] = RCV_WORD;
                        end
                        else begin
                            ifsm_state_next[i] = DROP_PKT;
                        end
                    end
                end

                RCV_WORD: begin
                    if (s_axis_tvalid & s_axis_tready) begin
                        d_fifo_wr_en[i] = 1;
                        if (s_axis_tlast) begin
                            ifsm_state_next[i] = WAIT_START;
                        end
                    end
                end

                DROP_PKT: begin
                    if (s_axis_tvalid & s_axis_tready & s_axis_tlast) begin
                        ifsm_state_next[i] = WAIT_START;
                    end
                end
            endcase
        end

        always @(posedge axis_aclk) begin
            if (~axis_resetn) begin
                ifsm_state[i] <= WAIT_START;
            end
            else begin
                ifsm_state[i] <= ifsm_state_next[i];
            end
        end

        /* Removal State Machine */
        always @(*) begin
            // defaults
            rfsm_state_next[i] = rfsm_state[i];

            d_fifo_rd_en[i] = 0;
            m_fifo_rd_en[i] = 0;

            m_axis_tvalid[i] = 0;

            case(rfsm_state[i])
                RFSM_START: begin
                   if (~d_fifo_empty[i] & ~m_fifo_empty[i]) begin
                       m_axis_tvalid[i] = 1;
                       if (m_axis_tready[i]) begin
                           d_fifo_rd_en[i] = 1;
                           m_fifo_rd_en[i] = 1;
                           rfsm_state_next[i] = RFSM_FINISH_PKT;
                       end
                   end 
                end

                RFSM_FINISH_PKT: begin
                   if (~d_fifo_empty[i]) begin
                       m_axis_tvalid[i] = 1;
                       if (m_axis_tready[i]) begin
                           d_fifo_rd_en[i] = 1;
                           if (m_axis_tlast[i])
                               rfsm_state_next[i] = RFSM_START;
                       end
                   end
                end
            endcase
        end

        always @(posedge axis_aclk) begin
            if (~axis_resetn) begin
                rfsm_state[i] <= RFSM_START;
            end
            else begin
                rfsm_state[i] <= rfsm_state_next[i];
            end
        end

    end
    endgenerate

    // -------------------- Enqueue Event Logic ----------------------

    fallthrough_small_fifo 
       #(
           .WIDTH(ENQ_DATA_WIDTH),
           .MAX_DEPTH_BITS(L2_MAX_ENQ_EVENTS)
       )
       enq_event_fifo
         (.din         (s_enq_event_data),    // Data in
          .wr_en       (enq_event_wr),        // Write enable
          .rd_en       (m_enq_event_rd),      // Read the next word
          .dout        (m_enq_event_data),
          .full        (),
          .prog_full   (),
          .nearly_full (enq_event_full),
          .empty       (enq_event_empty),
          .reset       (~axis_resetn),
          .clk         (axis_aclk)
          );

    assign m_enq_event_valid = ~enq_event_empty;

    /* Enqueue Event Logic */
    always @(*) begin
        // Write enqueue event whenever packet metadata is written
        enq_event_wr = |m_fifo_wr_en;

        user_enq_data = s_axis_tuser[USER_ENQ_DATA_HI:USER_ENQ_DATA_LO];
        enq_port = {1'b0, m_fifo_wr_en[3], 1'b0, m_fifo_wr_en[2], 1'b0, m_fifo_wr_en[1], m_fifo_wr_en[4], m_fifo_wr_en[0]};
        s_enq_event_data = {user_enq_data, enq_port};
    end

    // -------------------- Dequeue Event Logic ----------------------

    fallthrough_small_fifo 
       #(
           .WIDTH(DEQ_DATA_WIDTH),
           .MAX_DEPTH_BITS(L2_MAX_DEQ_EVENTS)
       )
       deq_event_fifo
         (.din         (deq_event_din),    // Data in
          .wr_en       (deq_event_wr),        // Write enable
          .rd_en       (m_deq_event_rd),      // Read the next word
          .dout        (m_deq_event_data),
          .full        (),
          .prog_full   (),
          .nearly_full (deq_event_full),
          .empty       (deq_event_empty),
          .reset       (~axis_resetn),
          .clk         (axis_aclk)
          );

    assign m_deq_event_valid = ~deq_event_empty;

    integer j;

    /* Dequeue Event Logic */
    /*
     * This logic must serialize the dequeue events from each
     * of the individual ports.
     */
    always @(*) begin
        deq_event_wr = 0;
        deq_port_fifo_rd = 0;
        user_deq_data = 0;
        deq_port = 0;
        deq_event_din = {user_deq_data, deq_port};

        // pick the first non-empty fifo (if any)
        for (j=0; j<NUM_PORTS; j=j+1) begin
            if (~deq_port_fifo_empty[j] & ~deq_event_wr) begin
                deq_event_wr = 1;
                deq_port_fifo_rd[j] = 1;
                user_deq_data = deq_port_fifo_dout[j];
                if (j == 0) begin
                    deq_port = 8'b00000001;
                end
                else if (j == 1) begin
                    deq_port = 8'b00000100;
                end
                else if (j == 2) begin
                    deq_port = 8'b00010000;
                end
                else if (j == 3) begin
                    deq_port = 8'b01000000;
                end
                else begin
                    deq_port = 8'b00000010;
                end
            end
        end
    end

    // -------------------- Drop Event Logic ----------------------

    fallthrough_small_fifo 
       #(
           .WIDTH(DROP_DATA_WIDTH),
           .MAX_DEPTH_BITS(L2_MAX_DROP_EVENTS)
       )
       drop_event_fifo
         (.din         (s_drop_event_data),    // Data in
          .wr_en       (drop_event_wr),        // Write enable
          .rd_en       (m_drop_event_rd),      // Read the next word
          .dout        (m_drop_event_data),
          .full        (),
          .prog_full   (),
          .nearly_full (drop_event_full),
          .empty       (drop_event_empty),
          .reset       (~axis_resetn),
          .clk         (axis_aclk)
          );

    assign m_drop_event_valid = ~drop_event_empty;

    /* Drop Event State Machine */
    always @(*) begin
        // defaults
        drop_state_next = drop_state;

        drop_event_wr = 0;
        user_drop_data = s_axis_tuser[USER_DROP_DATA_HI:USER_DROP_DATA_LO];
        drop_port = 0;
        s_drop_event_data = {user_drop_data, drop_port};

        case(drop_state)
            DROP_START: begin
                if (s_axis_tvalid & s_axis_tready) begin
                    drop_port = {1'b0,
                                 ifsm_state_next[3]==DROP_PKT & port_enable[3],
                                 1'b0,
                                 ifsm_state_next[2]==DROP_PKT & port_enable[2],
                                 1'b0,
                                 ifsm_state_next[1]==DROP_PKT & port_enable[1],
                                 ifsm_state_next[4]==DROP_PKT & port_enable[4],
                                 ifsm_state_next[0]==DROP_PKT & port_enable[0]};
                    drop_event_wr = |drop_port;
                    drop_state_next = DROP_FINISH_PKT;
                end
            end

            DROP_FINISH_PKT: begin
                if (s_axis_tvalid & s_axis_tready & s_axis_tlast) begin
                    drop_state_next = DROP_START;
                end
            end
        endcase
    end

    always @(posedge axis_aclk) begin
        if (~axis_resetn) begin
            drop_state <= DROP_START;
        end
        else begin
            drop_state <= drop_state_next;
        end
    end

    /* Wire up the outputs */
    assign m_axis_0_tdata = m_axis_tdata[0];
    assign m_axis_0_tkeep = m_axis_tkeep[0];
    assign m_axis_0_tuser = m_axis_tuser[0];
    assign m_axis_0_tvalid = m_axis_tvalid[0];
    assign m_axis_tready[0] = m_axis_0_tready;
    assign m_axis_0_tlast = m_axis_tlast[0];

    assign m_axis_1_tdata = m_axis_tdata[1];
    assign m_axis_1_tkeep = m_axis_tkeep[1];
    assign m_axis_1_tuser = m_axis_tuser[1];
    assign m_axis_1_tvalid = m_axis_tvalid[1];
    assign m_axis_tready[1] = m_axis_1_tready;
    assign m_axis_1_tlast = m_axis_tlast[1];

    assign m_axis_2_tdata = m_axis_tdata[2];
    assign m_axis_2_tkeep = m_axis_tkeep[2];
    assign m_axis_2_tuser = m_axis_tuser[2];
    assign m_axis_2_tvalid = m_axis_tvalid[2];
    assign m_axis_tready[2] = m_axis_2_tready;
    assign m_axis_2_tlast = m_axis_tlast[2];

    assign m_axis_3_tdata = m_axis_tdata[3];
    assign m_axis_3_tkeep = m_axis_tkeep[3];
    assign m_axis_3_tuser = m_axis_tuser[3];
    assign m_axis_3_tvalid = m_axis_tvalid[3];
    assign m_axis_tready[3] = m_axis_3_tready;
    assign m_axis_3_tlast = m_axis_tlast[3];

    assign m_axis_4_tdata = m_axis_tdata[4];
    assign m_axis_4_tkeep = m_axis_tkeep[4];
    assign m_axis_4_tuser = m_axis_tuser[4];
    assign m_axis_4_tvalid = m_axis_tvalid[4];
    assign m_axis_tready[4] = m_axis_4_tready;
    assign m_axis_4_tlast = m_axis_tlast[4];

`ifdef COCOTB_SIM
initial begin
  $dumpfile ("event_output_queues_waveform.vcd");
  $dumpvars (0, event_output_queues);
  #1 $display("Sim running...");
end
`endif

endmodule // event_output_queues

