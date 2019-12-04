//
// Copyright (c) 2017 Stephen Ibanez
// All rights reserved.
//
// This software was developed by Stanford University and the University of Cambridge Computer Laboratory 
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


/*
 * File: jk_reg_rw_0_t.v 
 * Author: Stephen Ibanez
 * 
 * Auto-generated file.
 *
 * reg_rw
 *
 * Atomically read or write a register.
 *
 */



`timescale 1 ps / 1 ps
`define READ_OP    8'd0
`define WRITE_OP   8'd1

`include "jk_cpu_regs_defines.v"
module jk_reg_rw_0_t 
#(
    parameter INDEX_WIDTH = 4,
    parameter REG_WIDTH = 32,
    parameter OP_WIDTH = 8,
    parameter INPUT_WIDTH = REG_WIDTH+INDEX_WIDTH+8+1,
    parameter C_S_AXI_ADDR_WIDTH = 4,
    parameter C_S_AXI_DATA_WIDTH = 32
)
(
    // Data Path I/O
    input                                           clk_lookup,
    input                                           clk_lookup_rst_high, 
    input                                           tuple_in_jk_reg_rw_input_VALID,
    input   [INPUT_WIDTH-1:0]                       tuple_in_jk_reg_rw_input_DATA,
    output                                         tuple_out_jk_reg_rw_output_VALID,
    output  [REG_WIDTH-1:0]                        tuple_out_jk_reg_rw_output_DATA,

    // Control Path I/O
    input                                     clk_control,
    input                                     clk_control_rst_low,
    input      [C_S_AXI_ADDR_WIDTH-1 : 0]     control_S_AXI_AWADDR,
    input                                     control_S_AXI_AWVALID,
    input      [C_S_AXI_DATA_WIDTH-1 : 0]     control_S_AXI_WDATA,
    input      [C_S_AXI_DATA_WIDTH/8-1 : 0]   control_S_AXI_WSTRB,
    input                                     control_S_AXI_WVALID,
    input                                     control_S_AXI_BREADY,
    input      [C_S_AXI_ADDR_WIDTH-1 : 0]     control_S_AXI_ARADDR,
    input                                     control_S_AXI_ARVALID,
    input                                     control_S_AXI_RREADY,
    output                                    control_S_AXI_ARREADY,
    output     [C_S_AXI_DATA_WIDTH-1 : 0]     control_S_AXI_RDATA,
    output     [1 : 0]                        control_S_AXI_RRESP,
    output                                    control_S_AXI_RVALID,
    output                                    control_S_AXI_WREADY,
    output     [1 :0]                         control_S_AXI_BRESP,
    output                                    control_S_AXI_BVALID,
    output                                    control_S_AXI_AWREADY

);


/* Tuple format for input:
        [REG_WIDTH+INDEX_WIDTH+8   : REG_WIDTH+INDEX_WIDTH+8] : statefulValid
        [REG_WIDTH+INDEX_WIDTH+7   : REG_WIDTH+8            ] : index_in
        [REG_WIDTH+7               : 8                        ] : newVal_in
        [7                         : 0                        ] : opCode_in
*/

    // request_fifo output signals 
    wire                           statefulValid_fifo; 
    wire    [INDEX_WIDTH-1:0]      index_fifo;
    wire    [REG_WIDTH-1:0]        newVal_fifo;
    wire    [OP_WIDTH-1:0]         opCode_fifo;
    
    wire empty_fifo;
    wire full_fifo;
    reg rd_en_fifo;

    localparam L2_REQ_BUF_DEPTH = 6;
    localparam REG_DEPTH = 2**INDEX_WIDTH;

    // data plane state machine states
    localparam START_REQ = 0;
    localparam WAIT_BRAM = 1;
    localparam WRITE_RESULT = 2;

    // control plane state machine states
    localparam WAIT_REQ = 0;
    localparam WAIT_BRAM_CTRL = 1;
    localparam WRITE_READ_RESULT = 2;

    // data plane state machine signals
    reg [2:0]                     d_state, d_state_next;
    reg [REG_WIDTH-1:0]           result_r, result_r_next;
    reg [1:0]                     cycle_cnt, cycle_cnt_next;
    reg                           valid_out;
    reg [REG_WIDTH-1:0]           result_out;

    // control plane state machine signals
    reg [2:0]                     c_state, c_state_next;
    reg [REG_WIDTH-1:0]           ip2cpu_data_r, ip2cpu_data_r_next;
    reg [INDEX_WIDTH-1:0]         ip2cpu_index_r, ip2cpu_index_r_next;
    reg [1:0]                     cycle_cnt_ctrl, cycle_cnt_ctrl_next;

    // BRAM signals
    /*  TODO: add support for control-plane */
    reg                       c_we_bram;
    reg                       c_en_bram;
    reg   [INDEX_WIDTH-1:0]   c_addr_in_bram, c_addr_in_bram_r, c_addr_in_bram_r_next;
    reg   [REG_WIDTH-1:0]     c_data_in_bram;
    wire  [REG_WIDTH-1:0]     c_data_out_bram;

    reg                      d_we_bram;
    reg                      d_en_bram;
    reg  [INDEX_WIDTH-1:0]   d_addr_in_bram, d_addr_in_bram_r, d_addr_in_bram_r_next;
    reg  [REG_WIDTH-1:0]     d_data_in_bram;
    wire [REG_WIDTH-1:0]     d_data_out_bram;

    // control signals
    // CPU reads IP interface
    wire      [C_S_AXI_DATA_WIDTH-1:0]         ip2cpu_jk_reg_data;
    reg       [REG_WIDTH-1:0]                  ip2cpu_jk_reg_data_adj;
    reg       [INDEX_WIDTH-1:0]                ip2cpu_jk_reg_index;
    reg                                        ip2cpu_jk_reg_valid;
    wire      [INDEX_WIDTH-1:0]                ipReadReq_jk_reg_index;
    wire                                       ipReadReq_jk_reg_valid;

    // CPU writes IP interface
    wire     [C_S_AXI_DATA_WIDTH-1:0]          cpu2ip_jk_reg_data;
    wire     [REG_WIDTH-1:0]                   cpu2ip_jk_reg_data_adj;
    wire     [INDEX_WIDTH-1:0]                 cpu2ip_jk_reg_index;
    wire                                       cpu2ip_jk_reg_valid;

    reg      [INDEX_WIDTH-1:0]                 ipReadReq_index_r0;
    reg                                        ipReadReq_valid_r0;
    reg      [REG_WIDTH-1:0]                   cpu2ip_data_r0;
    reg      [INDEX_WIDTH-1:0]                 cpu2ip_index_r0;
    reg                                        cpu2ip_valid_r0;

    reg      [INDEX_WIDTH-1:0]                 ipReadReq_index_r1;
    reg                                        ipReadReq_valid_r1;
    reg      [REG_WIDTH-1:0]                   cpu2ip_data_r1;
    reg      [INDEX_WIDTH-1:0]                 cpu2ip_index_r1;
    reg                                        cpu2ip_valid_r1;

    wire resetn_sync;


    //// CPU REGS START ////
    jk_cpu_regs
    #(
        .C_BASE_ADDRESS        (0),
        .C_S_AXI_DATA_WIDTH    (C_S_AXI_DATA_WIDTH),
        .C_S_AXI_ADDR_WIDTH    (C_S_AXI_ADDR_WIDTH)
    ) jk_cpu_regs_inst
    (
      // General ports
       .clk                    ( clk_lookup),
       .resetn                 (~clk_lookup_rst_high),
      // AXI Lite ports
       .S_AXI_ACLK             (clk_control),
       .S_AXI_ARESETN          (clk_control_rst_low),
       .S_AXI_AWADDR           (control_S_AXI_AWADDR),
       .S_AXI_AWVALID          (control_S_AXI_AWVALID),
       .S_AXI_WDATA            (control_S_AXI_WDATA),
       .S_AXI_WSTRB            (control_S_AXI_WSTRB),
       .S_AXI_WVALID           (control_S_AXI_WVALID),
       .S_AXI_BREADY           (control_S_AXI_BREADY),
       .S_AXI_ARADDR           (control_S_AXI_ARADDR),
       .S_AXI_ARVALID          (control_S_AXI_ARVALID),
       .S_AXI_RREADY           (control_S_AXI_RREADY),
       .S_AXI_ARREADY          (control_S_AXI_ARREADY),
       .S_AXI_RDATA            (control_S_AXI_RDATA),
       .S_AXI_RRESP            (control_S_AXI_RRESP),
       .S_AXI_RVALID           (control_S_AXI_RVALID),
       .S_AXI_WREADY           (control_S_AXI_WREADY),
       .S_AXI_BRESP            (control_S_AXI_BRESP),
       .S_AXI_BVALID           (control_S_AXI_BVALID),
       .S_AXI_AWREADY          (control_S_AXI_AWREADY),
    
      // Register ports
      // CPU reads IP interface
      .ip2cpu_jk_reg_data          (ip2cpu_jk_reg_data),
      .ip2cpu_jk_reg_index         (ip2cpu_jk_reg_index),
      .ip2cpu_jk_reg_valid         (ip2cpu_jk_reg_valid),
      .ipReadReq_jk_reg_index       (ipReadReq_jk_reg_index),
      .ipReadReq_jk_reg_valid      (ipReadReq_jk_reg_valid),
      // CPU writes IP interface
      .cpu2ip_jk_reg_data          (cpu2ip_jk_reg_data),
      .cpu2ip_jk_reg_index         (cpu2ip_jk_reg_index),
      .cpu2ip_jk_reg_valid         (cpu2ip_jk_reg_valid),
      // Global Registers - user can select if to use
      .cpu_resetn_soft(),//software reset, after cpu module
      .resetn_soft    (),//software reset to cpu module (from central reset management)
      .resetn_sync    (resetn_sync)//synchronized reset, use for better timing
    );
    //// CPU REGS END ////

    //// Input buffer to hold requests ////
    fallthrough_small_fifo
    #(
        .WIDTH(INPUT_WIDTH),
        .MAX_DEPTH_BITS(L2_REQ_BUF_DEPTH)
    )
    request_fifo
    (
       // Outputs
       .dout                           ({statefulValid_fifo, index_fifo, newVal_fifo, opCode_fifo}),
       .full                           (full_fifo),
       .nearly_full                    (),
       .prog_full                      (),
       .empty                          (empty_fifo),
       // Inputs
       .din                            (tuple_in_jk_reg_rw_input_DATA),
       .wr_en                          (tuple_in_jk_reg_rw_input_VALID),
       .rd_en                          (rd_en_fifo),
       .reset                          (~resetn_sync),
       .clk                            (clk_lookup)
    );

    //// BRAM to hold state ////
    true_dp_bram
    #(
        .L2_DEPTH(INDEX_WIDTH),
        .WIDTH(REG_WIDTH)
    ) jk_bram
    (
        .clk               (clk_lookup),
        // control plane R/W interface
        .we1               (c_we_bram),
        .en1               (c_en_bram),
        .addr1             (c_addr_in_bram),
        .din1              (c_data_in_bram),
        .rst1              (~resetn_sync),
        .regce1            (c_en_bram),
        .dout1             (c_data_out_bram),
        // data plane R/W interface
        .we2               (d_we_bram),
        .en2               (d_en_bram),
        .addr2             (d_addr_in_bram),
        .din2              (d_data_in_bram),
        .rst2              (~resetn_sync),
        .regce2            (d_en_bram),
        .dout2             (d_data_out_bram)
    );

    generate
    if (C_S_AXI_DATA_WIDTH > REG_WIDTH) begin: SMALL_REG
        assign ip2cpu_jk_reg_data = {'d0, ip2cpu_jk_reg_data_adj};
        assign cpu2ip_jk_reg_data_adj = cpu2ip_jk_reg_data[C_S_AXI_DATA_WIDTH-1:0];
    end
    else if (C_S_AXI_DATA_WIDTH < REG_WIDTH) begin: LARGE_REG
        assign ip2cpu_jk_reg_data = ip2cpu_jk_reg_data_adj[C_S_AXI_DATA_WIDTH-1:0];
        assign cpu2ip_jk_reg_data_adj = {'d0, cpu2ip_jk_reg_data};
    end
    else begin: NORMAL_REG
        assign ip2cpu_jk_reg_data = ip2cpu_jk_reg_data_adj;
        assign cpu2ip_jk_reg_data_adj = cpu2ip_jk_reg_data;
    end
    endgenerate

   // register the cpu_regs module outputs
   always @ (posedge clk_lookup) begin
       if (~resetn_sync) begin
           cpu2ip_data_r0 <= 0;
           cpu2ip_index_r0 <= 0;
           cpu2ip_valid_r0 <= 0;

           ipReadReq_index_r0 <= 0;
           ipReadReq_valid_r0 <= 0;

           cpu2ip_data_r1 <= 0;
           cpu2ip_index_r1 <= 0;
           cpu2ip_valid_r1 <= 0;

           ipReadReq_index_r1 <= 0;
           ipReadReq_valid_r1 <= 0;
       end
       else begin
           cpu2ip_data_r0 <= cpu2ip_jk_reg_data_adj;
           cpu2ip_index_r0 <= cpu2ip_jk_reg_index;
           cpu2ip_valid_r0 <= cpu2ip_jk_reg_valid;

           ipReadReq_index_r0 <= ipReadReq_jk_reg_index;
           ipReadReq_valid_r0 <= ipReadReq_jk_reg_valid;

           cpu2ip_data_r1 <=  cpu2ip_data_r0;
           cpu2ip_index_r1 <= cpu2ip_index_r0;
           cpu2ip_valid_r1 <= cpu2ip_valid_r0;

           ipReadReq_index_r1 <= ipReadReq_index_r0;
           ipReadReq_valid_r1 <= ipReadReq_valid_r0;
       end
   end


   /* data plane R/W State Machine */ 
   always @(*) begin
      // default values
      d_state_next   = d_state;
      rd_en_fifo = 0;
      d_en_bram = 1;

      d_we_bram = 0;
      d_addr_in_bram = d_addr_in_bram_r;
      d_addr_in_bram_r_next = d_addr_in_bram_r;
      d_data_in_bram = 0;
      
      result_r_next = result_r;
      
      cycle_cnt_next = cycle_cnt;
      valid_out = 0;
      result_out = 0;

      case(d_state)
          START_REQ: begin
              if (~empty_fifo) begin
                  rd_en_fifo = 1;
                  if (statefulValid_fifo && index_fifo < REG_DEPTH) begin
                      if (opCode_fifo == `READ_OP) begin
                          d_addr_in_bram = index_fifo;
                          d_addr_in_bram_r_next = index_fifo;
                          d_state_next = WAIT_BRAM;
                      end
                      else if (opCode_fifo == `WRITE_OP) begin
                          d_we_bram = 1;
                          d_addr_in_bram = index_fifo;
                          d_addr_in_bram_r_next = index_fifo;
                          d_data_in_bram = newVal_fifo;
                          result_r_next = newVal_fifo;
                          d_state_next = WRITE_RESULT;
                      end
                      else begin
                          $display("ERROR: d_state = START_REQ, unsupported opCode: %0d\n", opCode_fifo);
                          result_r_next = 0;
                          d_state_next = WRITE_RESULT;
                      end
                  end
                  else begin
                      result_r_next = 0;
                      d_state_next = WRITE_RESULT;
                  end
              end
          end

          WAIT_BRAM: begin
              if (cycle_cnt == 1'b1) begin // 2 cycle BRAM read latency
                  cycle_cnt_next = 0;
                  result_r_next = d_data_out_bram;
                  d_state_next = WRITE_RESULT;
              end
              else begin
                  cycle_cnt_next = cycle_cnt + 1;
              end
          end

          WRITE_RESULT: begin
             valid_out = 1;
             result_out = result_r;
             d_state_next = START_REQ;
          end
      endcase // case(d_state)
   end // always @ (*)

   assign tuple_out_jk_reg_rw_output_VALID = valid_out;
   assign tuple_out_jk_reg_rw_output_DATA  = result_out;

   always @(posedge clk_lookup) begin
      if(~resetn_sync) begin
         d_state <= START_REQ;
         d_addr_in_bram_r <= 0;
         result_r <= 0;
         cycle_cnt <= 0;
      end
      else begin
         d_state <= d_state_next;
         d_addr_in_bram_r <= d_addr_in_bram_r_next;
         result_r <= result_r_next;
         cycle_cnt <= cycle_cnt_next;
      end
   end


   /* control plane R/W state machine */
   always @(*) begin
      // default values
      c_state_next   = c_state;
      c_en_bram = 1;

      c_we_bram = 0;
      c_addr_in_bram = c_addr_in_bram_r;
      c_addr_in_bram_r_next = c_addr_in_bram_r;
      c_data_in_bram = 0;

      ip2cpu_data_r_next = ip2cpu_data_r;
      ip2cpu_index_r_next = ip2cpu_index_r;

      cycle_cnt_ctrl_next = cycle_cnt_ctrl;

      ip2cpu_jk_reg_valid = 0;
      ip2cpu_jk_reg_data_adj = 0;
      ip2cpu_jk_reg_index = 0;

      case(c_state)
          WAIT_REQ: begin
              if (cpu2ip_valid_r1 && cpu2ip_index_r1 < REG_DEPTH) begin
                  c_we_bram = 1;
                  c_addr_in_bram = cpu2ip_index_r1;
                  c_addr_in_bram_r_next = cpu2ip_index_r1;
                  c_data_in_bram = cpu2ip_data_r1;
              end
              else if (ipReadReq_valid_r1) begin
                  if (ipReadReq_index_r1 < REG_DEPTH) begin
                      c_addr_in_bram = ipReadReq_index_r1;
                      c_addr_in_bram_r_next = ipReadReq_index_r1;
                      c_state_next = WAIT_BRAM_CTRL;
                  end
                  else begin
                      $display("ERROR: c_state = WAIT_REQ, requested read index out of range: %0d\n", ipReadReq_index_r1);
                      ip2cpu_data_r_next = 0;
                      ip2cpu_index_r_next = 0;
                      c_state_next = WRITE_READ_RESULT;
                  end
              end
          end

          WAIT_BRAM_CTRL: begin
              if (cycle_cnt_ctrl == 1'b1) begin // 2 cycle BRAM read latency
                  cycle_cnt_ctrl_next = 0;
                  ip2cpu_data_r_next = c_data_out_bram;
                  ip2cpu_index_r_next = c_addr_in_bram_r;
                  c_state_next = WRITE_READ_RESULT;
              end
              else begin
                  cycle_cnt_ctrl_next = cycle_cnt_ctrl + 1;
              end
          end

          WRITE_READ_RESULT: begin
              ip2cpu_jk_reg_valid = 1;
              ip2cpu_jk_reg_data_adj = ip2cpu_data_r;
              ip2cpu_jk_reg_index = ip2cpu_index_r;
              c_state_next = WAIT_REQ;
          end
      endcase // case(c_state)
   end // always @ (*)

   // state machine is running on clk_lookup because the clocks
   // are the same ... (clk_200)
   always @(posedge clk_lookup) begin
      if(~resetn_sync) begin
         c_state <= WAIT_REQ;
         c_addr_in_bram_r <= 0;

         ip2cpu_data_r <= 0;
         ip2cpu_index_r <= 0;
         cycle_cnt_ctrl <= 0;
      end
      else begin
         c_state <= c_state_next;
         c_addr_in_bram_r <= c_addr_in_bram_r_next;

         ip2cpu_data_r <= ip2cpu_data_r_next;
         ip2cpu_index_r <= ip2cpu_index_r_next;
         cycle_cnt_ctrl <= cycle_cnt_ctrl_next;
      end
   end

endmodule

