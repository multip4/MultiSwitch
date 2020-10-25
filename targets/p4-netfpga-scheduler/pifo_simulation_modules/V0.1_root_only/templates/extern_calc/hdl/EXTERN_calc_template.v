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
 * File: @MODULE_NAME@.v 
 * Author: Zhenguo Cui
 * 
 * Top Wrapper for the Extern Calculation Functions.
 */



`timescale 1 ps / 1 ps

`define PORT0  5'b00001
`define PORT1  5'b00010
`define PORT2  5'b00100
`define PORT3  5'b01000
`define DMA    5'b10000



/* Tuple format for input:
  
  [CLASS_WIDTH]     class id
  [WEIGHT_WIDTH]    class weight
  [PKT_WIDTH]       pkt_size
  [CALC_TYPE_WIDTH] calc_type  // calc_type[1] => wrr, calc_type[2] -> drr, clac_type[3] -> wfq
  [PORT_WIDTH]      output_port
*/



//`include "@PREFIX_NAME@_cpu_regs_defines.v"
module @MODULE_NAME@ 
#(
    parameter CLASS_WIDTH = @CLASS_WIDTH@,
    parameter RESULT_WIDTH = @RESULT_WIDTH@,
    parameter WEIGHT_WIDTH = @WEIGHT_WIDTH@,
    parameter PKT_WIDTH = 16,
    parameter CALC_TYPE_WIDTH = @TYPE_WIDTH@,
    parameter PORT_WIDTH = 8,
    parameter PORT_NUM = 5,

    parameter INPUT_WIDTH = CLASS_WIDTH+WEIGHT_WIDTH+PKT_WIDTH+CALC_TYPE_WIDTH+PORT_WIDTH,
    parameter PIFO_OVERFLOW_WIDTH = 2,
    parameter PIFO_RANK_WIDTH = 17,
    parameter PIFO_ADDR_WIDTH = 12, 
    parameter PIFO_WIDTH = 32,
    //parameter C_S_AXI_ADDR_WIDTH = @ADDR_WIDTH@,
    parameter C_S_AXI_DATA_WIDTH = 32
)
(
    // Data Path I/O
    input                                             tuple_in_@EXTERN_NAME@_input_VALID,
    input   [INPUT_WIDTH-1:0]                         tuple_in_@EXTERN_NAME@_input_DATA,
    output                                             tuple_out_@EXTERN_NAME@_output_VALID,
    output  [RESULT_WIDTH-1:0]                         tuple_out_@EXTERN_NAME@_output_DATA,

    // Last Pifo Sinals
    input [PIFO_WIDTH-1:0]                    last_pifo_info0,
    input [PIFO_WIDTH-1:0]                    last_pifo_info1,
    input [PIFO_WIDTH-1:0]                    last_pifo_info2,
    input [PIFO_WIDTH-1:0]                    last_pifo_info3,
    input [PIFO_WIDTH-1:0]                    last_pifo_info4,
    

    // Control Path I/O
//    input                                     clk_control,
//    input                                     clk_control_rst_low,
//    input      [C_S_AXI_ADDR_WIDTH-1 : 0]     control_S_AXI_AWADDR,
//    input                                     control_S_AXI_AWVALID,
//    input      [C_S_AXI_DATA_WIDTH-1 : 0]     control_S_AXI_WDATA,
//    input      [C_S_AXI_DATA_WIDTH/8-1 : 0]   control_S_AXI_WSTRB,
//    input                                     control_S_AXI_WVALID,
//    input                                     control_S_AXI_BREADY,
//    input      [C_S_AXI_ADDR_WIDTH-1 : 0]     control_S_AXI_ARADDR,
//    input                                     control_S_AXI_ARVALID,
//    input                                     control_S_AXI_RREADY,
//    output                                    control_S_AXI_ARREADY,
//    output     [C_S_AXI_DATA_WIDTH-1 : 0]     control_S_AXI_RDATA,
//    output     [1 : 0]                        control_S_AXI_RRESP,
//    output                                    control_S_AXI_RVALID,
//    output                                    control_S_AXI_WREADY,
//    output     [1 :0]                         control_S_AXI_BRESP,
//    output                                    control_S_AXI_BVALID,
//    output                                    control_S_AXI_AWREADY,

    // clk, rst
    input                                           clk_lookup,
    input                                           rst


);
    
    wire rstn;
    assign rstn = ~rst;
    localparam L2_REQ_BUF_DEPTH = 6;
    localparam IDLE = 0;
    localparam WAIT_RESULT_WRR = 1;
    localparam WAIT_RESULT_DRR = 2;
    localparam WAIT_RESULT_WFQ = 3;
    localparam FSM_WIDTH = 2;
    
    
    localparam PORT0     =   5'b00001;
    localparam PORT1 =      5'b00010;
    localparam PORT2  =     5'b00100;
    localparam PORT3  =     5'b01000;
    localparam DMA    =     5'b10000;


    wire [CLASS_WIDTH-1:0]     w_req_class_id;
    wire [WEIGHT_WIDTH-1:0]    w_req_class_weight;
    wire [PKT_WIDTH-1:0]       w_req_pkt_size;
    wire [CALC_TYPE_WIDTH-1:0] w_req_calc_type;
    wire [PORT_WIDTH-1:0]      w_req_output_port;

    
    reg                      r_req_wrr_valid, r_req_drr_valid, r_req_wfq_valid;
    reg [CLASS_WIDTH-1:0]     r_req_class_id;
    reg [WEIGHT_WIDTH-1:0]    r_req_class_weight;
    reg [PKT_WIDTH-1:0]       r_req_pkt_size;
    reg [CALC_TYPE_WIDTH-1:0] r_req_calc_type;
    reg [PORT_WIDTH-1:0]      r_req_output_port;

    assign {w_req_class_id, w_req_class_weight, w_req_pkt_size, w_req_calc_type, w_req_output_port} = tuple_in_my_extern_calc_input_DATA;

    wire                      w_req_wrr_valid;
    assign w_req_wrr_valid = tuple_in_my_extern_calc_input_VALID & w_req_calc_type[1];
    wire                      w_req_drr_valid;
    assign w_req_drr_valid = tuple_in_my_extern_calc_input_VALID & w_req_calc_type[2];
    wire                      w_req_wfq_valid;
    assign w_req_wfq_valid = tuple_in_my_extern_calc_input_VALID & w_req_calc_type[3];




    wire [PORT_NUM-1:0]       w_output_port_bit_array;
    // get output bit array.
    assign w_output_port_bit_array =  
                    w_req_output_port[0] |               // port 0
                   (w_req_output_port[2] << 1) |     // port 1
                   (w_req_output_port[4] << 2) |     // port 2
                   (w_req_output_port[6] << 3) |     // port 3
                   ((w_req_output_port[1] | 
                   w_req_output_port[3] | 
                   w_req_output_port[5] | 
                   w_req_output_port[7]) << 4); // port 4, cpu.

    reg [PIFO_WIDTH-1:0]      r_last_pkt_info,r_last_pkt_info_next;

    wire                            w_last_pkt_valid;
    wire [PIFO_OVERFLOW_WIDTH-1:0]  w_last_pkt_overflow;
    wire [PIFO_RANK_WIDTH-1:0]      w_last_pkt_round;
    wire [PIFO_ADDR_WIDTH-1:0]      w_last_pkt_addr;

    assign {w_last_pkt_valid, w_last_pkt_overflow, w_last_pkt_round, w_last_pkt_addr} = r_last_pkt_info;


// WRR ENGINE
    wire                       w_wrr_out_valid;
    wire [PIFO_WIDTH-1:0]      w_wrr_out_data;



    wrr_engine
    #(
      .CLASS_WIDTH(CLASS_WIDTH),
      .WEIGHT_WIDTH(WEIGHT_WIDTH),
      .PKT_WIDTH(PKT_WIDTH),
      .RESULT_WIDTH(RESULT_WIDTH),
      .PIFO_OVERFLOW_WIDTH(PIFO_OVERFLOW_WIDTH),
      .PIFO_ROUND_WIDTH(PIFO_RANK_WIDTH),
      .PIFO_ADDR_WIDTH(PIFO_ADDR_WIDTH),
      .PIFO_WIDTH(PIFO_WIDTH)
    )
    wrr_inst(
      .req_valid(w_req_wrr_valid),
      .req_class_id(w_req_class_id),
      .req_class_weight(w_req_class_weight),
      .last_pifo_valid(w_last_pkt_valid),
      .last_pifo_overflow(w_last_pkt_overflow),
      .last_pifo_round(w_last_pkt_round),
      .resp_valid(w_wrr_out_valid),
      .resp_data(w_wrr_out_data),
      .clk(clk_lookup),
      .rstn(rstn)
    );

// DRR ENGINE
    wire                       w_drr_out_valid;
    wire [PIFO_WIDTH-1:0]      w_drr_out_data;
// WFQ ENGINE
    wire                       w_wfq_out_valid;
    wire [PIFO_WIDTH-1:0]      w_wfq_out_data;


    reg                                 rd_en_fifo;
    wire                                full_fifo,empty_fifo;

    //// Input buffer to hold requests ////
    fallthrough_small_fifo
    #(
        .WIDTH(INPUT_WIDTH),
        .MAX_DEPTH_BITS(L2_REQ_BUF_DEPTH)
    )
    request_fifo
    (
       // Outputs
       .dout                           ({w_req_class_id, w_req_class_weight, w_req_pkt_size, w_req_calc_type, w_req_output_port}),
       .full                           (full_fifo),
       .nearly_full                    (),
       .prog_full                      (),
       .empty                          (empty_fifo),
       // Inputs
       .din                            (tuple_in_my_extern_calc_input_DATA),
       .wr_en                          (tuple_in_my_extern_calc_input_VALID),
       .rd_en                          (rd_en_fifo),
       .reset                          (~rstn),
       .clk                            (clk_lookup)
    );

    reg  [FSM_WIDTH-1:0]               r_fsm_state, r_fsm_state_next;
    reg  [RESULT_WIDTH-1:0]           r_output_data, r_output_data_next;
    reg  [PORT_NUM-1:0]               r_output_port_array, r_output_port_array_next;
    reg                               r_output_valid, r_output_valid_next;

    // FSM 
    always @(*)
      begin
        r_fsm_state_next = r_fsm_state;
        r_output_data_next = r_output_data;
        r_output_port_array_next = r_output_port_array;
        r_last_pkt_info_next = r_last_pkt_info;
        r_output_valid_next = 0;
        case(r_fsm_state)
          IDLE:
            begin
              if (~empty_fifo) 
                begin
                  rd_en_fifo = 1;
                  
                  

                  r_output_port_array_next = w_output_port_bit_array;

                  case(w_output_port_bit_array)
                    PORT0:
                      begin
                        r_last_pkt_info_next = last_pifo_info0;
                      end
                    PORT1:
                      begin
                        r_last_pkt_info_next = last_pifo_info1;
                      end
                    PORT2:
                      begin
                        r_last_pkt_info_next = last_pifo_info2;
                      end
                    PORT3:
                      begin
                        r_last_pkt_info_next = last_pifo_info3;
                      end
                    DMA:
                      begin
                        r_last_pkt_info_next = last_pifo_info4;
                      end
                  endcase
                  
                  case({w_req_wrr_valid, w_req_drr_valid, w_req_wfq_valid})
                    'b001: // WFQ
                        begin
                            r_fsm_state_next = WAIT_RESULT_WFQ;
                        end
                    'b010: // DRR
                        begin
                            r_fsm_state_next = WAIT_RESULT_DRR;
                        end
                    'b100: // WRR
                        begin
                            r_fsm_state_next = WAIT_RESULT_WRR;
                        end
                    
                  endcase
                 
              end
            end
          WAIT_RESULT_WRR:
            begin
                if(w_wrr_out_valid)
                    begin
                        r_output_valid_next = 1;
                        r_output_data_next = w_wrr_out_data;
                        r_fsm_state_next = IDLE;
                    end
            end
            
         WAIT_RESULT_DRR:
              begin
                  if(w_drr_out_valid)
                      begin
                          r_output_valid_next = 1;
                          r_output_data_next = w_drr_out_data;
                          r_fsm_state_next = IDLE;
                      end
              end
         WAIT_RESULT_WFQ:
               begin
                   if(w_wfq_out_valid)
                       begin
                           r_output_valid_next = 1;
                           r_output_data_next = w_wfq_out_data;
                           r_fsm_state_next = IDLE;
                       end
               end
        endcase

      end



    always @(posedge clk_lookup)
      begin
        if (~rstn) 
          begin
            r_fsm_state <= IDLE;
            r_req_calc_type <= 0;
            r_output_data <= 0;
            r_output_port_array <= 0;
            r_output_valid <= 0;
            r_last_pkt_info <= 0;
            r_req_wrr_valid <= 0;
            r_req_drr_valid <= 0;
            r_req_wfq_valid <= 0;
            r_req_class_id <= 0;    
            r_req_class_weight <= 0;
            r_req_pkt_size <= 0;    
            r_req_calc_type <= 0;   
            r_req_output_port <= 0;             
          end
        else
          begin
            r_fsm_state <= r_fsm_state_next;
            r_output_data <= r_output_data_next;
            r_output_port_array <= r_output_port_array_next;
            r_output_valid <= r_output_valid_next;
            r_last_pkt_info <= r_last_pkt_info_next;
            r_req_wrr_valid <= w_req_wrr_valid;
            r_req_drr_valid <= w_req_drr_valid;
            r_req_wfq_valid <= w_req_wfq_valid;
            r_req_class_id <= w_req_class_id;    
            r_req_class_weight <= w_req_class_weight;
            r_req_pkt_size <= w_req_pkt_size;    
            r_req_calc_type <= w_req_calc_type;   
            r_req_output_port <= w_req_output_port;    
          end
      end

    assign tuple_out_@EXTERN_NAME@_output_VALID = r_output_valid;
    assign tuple_out_@EXTERN_NAME@_output_DATA = r_output_data;
endmodule

