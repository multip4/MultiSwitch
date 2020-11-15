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


/* Tuple format for input:
  [PORT_WIDTH]      output_port
  [CLASS_WIDTH]     class id
  [WEIGHT_WIDTH]    class weight
  [PKT_WIDTH]       pkt_size
  [CALC_TYPE_WIDTH] calc_type  // calc_type[1] => wrr, calc_type[2] -> drr, clac_type[3] -> wfq
  
*/

module @MODULE_NAME@ 
#(
    parameter INDEX_WIDTH = @INDEX_WIDTH@,
    parameter CLASS_WIDTH = @CLASS_WIDTH@,
    parameter RESULT_WIDTH = @RESULT_WIDTH@,
    parameter WEIGHT_WIDTH = @WEIGHT_WIDTH@,
    parameter PKT_WIDTH = 16,
    parameter CALC_TYPE_WIDTH = @TYPE_WIDTH@,
    parameter PORT_WIDTH = 8,
    parameter PORT_NUM = 5,

    parameter INPUT_WIDTH = CLASS_WIDTH+WEIGHT_WIDTH+PKT_WIDTH+CALC_TYPE_WIDTH+PORT_WIDTH + 1,
    parameter PIFO_OVERFLOW_WIDTH = 1,
    parameter PIFO_RANK_WIDTH = 18,
    parameter PIFO_ADDR_WIDTH = 12,
    parameter PIFO_WIDTH = 32
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
    wire                       w_req_fifo_valid;

    
    reg                       r_req_wrr_valid, r_req_drr_valid, r_req_wfq_valid;
    reg                       r_req_wrr_valid_next, r_req_drr_valid_next, r_req_wfq_valid_next;


    reg [CLASS_WIDTH-1:0]     r_req_class_id, r_req_class_id_next;
    reg [WEIGHT_WIDTH-1:0]    r_req_class_weight, r_req_class_weight_next;
    reg [PKT_WIDTH-1:0]       r_req_pkt_size, r_req_pkt_size_next;
    reg [CALC_TYPE_WIDTH-1:0] r_req_calc_type, r_req_calc_type_next;
    reg [PORT_WIDTH-1:0]      r_req_output_port, r_req_output_port_next;
    //reg                       r_req_fifo_valid, r_req_fifo_valid_next;

    reg                                 rd_en_fifo;
    wire                                full_fifo,empty_fifo;

    wire [PORT_NUM-1:0]       w_output_port_bit_array;
    reg [PORT_NUM-1:0]       r_output_port_bit_array;
    // get output bit array.
    assign w_output_port_bit_array =  
                    r_req_output_port[0] |               // port 0
                   (r_req_output_port[2] << 1) |     // port 1
                   (r_req_output_port[4] << 2) |     // port 2
                   (r_req_output_port[6] << 3) |     // port 3
                   ((r_req_output_port[1] | 
                   r_req_output_port[3] | 
                   r_req_output_port[5] | 
                   r_req_output_port[7]) << 4); // port 4, cpu.

    reg [PIFO_WIDTH-1:0]      r_last_pkt_info,r_last_pkt_info_next;

    wire                            w_last_pkt_valid;
    wire [PIFO_OVERFLOW_WIDTH-1:0]  w_last_pkt_overflow;
    wire [PIFO_RANK_WIDTH-1:0]      w_last_pkt_round;
    wire [PIFO_ADDR_WIDTH-1:0]      w_last_pkt_addr;

    assign {w_last_pkt_valid, w_last_pkt_overflow, w_last_pkt_round, w_last_pkt_addr} = r_last_pkt_info;


wire                     w_div_out_valid;
wire [WEIGHT_WIDTH-1:0]  w_div_out_quotient;
wire [WEIGHT_WIDTH-1:0]  w_div_out_remain;

reg [WEIGHT_WIDTH-1:0] r_div_out_quotient,r_div_out_quotient_next;
reg [WEIGHT_WIDTH-1:0] r_div_out_remain, r_div_out_remain_next;


wire [CLASS_WIDTH-1:0]     w_div_class_id;
wire [WEIGHT_WIDTH-1:0]    w_div_class_weight;
wire [PKT_WIDTH-1:0]       w_div_pkt_size;
wire [CALC_TYPE_WIDTH-1:0] w_div_calc_type;
wire [PORT_WIDTH-1:0]      w_div_output_port;
wire                       w_req_valid;

assign {w_req_valid, w_div_output_port, w_div_class_id, w_div_class_weight, w_div_pkt_size, w_div_calc_type} = tuple_in_@EXTERN_NAME@_input_DATA;

wire [WEIGHT_WIDTH-1:0]    w_div_divisor;

assign w_div_divisor = (w_div_class_weight == 0) ? 2 : w_div_class_weight;

// the fllowing comment need to be space in front,
// for adding division modules by macro.
// if not have space,
// then the script is ignored without any warning/error message

  //div_gen macro 

//div_gen_drr
//div_gen_drr_inst
//(
//    .s_axis_divisor_tvalid(tuple_in_my_extern_calc_input_VALID),
//    .s_axis_divisor_tdata(w_div_divisor),    
//    .s_axis_dividend_tvalid(tuple_in_my_extern_calc_input_VALID),
//    .s_axis_dividend_tdata(w_div_pkt_size),
//    .m_axis_dout_tvalid(w_div_out_valid),
//    .m_axis_dout_tdata({w_div_out_quotient,w_div_out_remain}),

//    .aclk(clk_lookup)
//);

// WRR ENGINE
    wire                       w_wrr_out_valid;
    wire [PIFO_WIDTH-1:0]      w_wrr_out_data;

    wrr_engine
    #(
      .CLASS_WIDTH(CLASS_WIDTH),
      .WEIGHT_WIDTH(WEIGHT_WIDTH),
      .RESULT_WIDTH(RESULT_WIDTH),
      .PIFO_OVERFLOW_WIDTH(PIFO_OVERFLOW_WIDTH),
      .PIFO_ROUND_WIDTH(PIFO_RANK_WIDTH),
      .PIFO_ADDR_WIDTH(PIFO_ADDR_WIDTH),
      .PIFO_WIDTH(PIFO_WIDTH)
    )
    wrr_inst(
      .req_valid(r_req_wrr_valid),
      .req_class_id(r_req_class_id),
      .req_class_weight(r_req_class_weight),
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
    drr_engine_v2
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
    drr_inst(
      .req_valid(r_req_drr_valid),
      .req_class_id(r_req_class_id),
      .req_class_weight(r_req_class_weight),      
      .req_div_quotient(r_div_out_quotient),
      .req_div_remain(r_div_out_remain),
      .last_pifo_valid(w_last_pkt_valid),
      .last_pifo_overflow(w_last_pkt_overflow),
      .last_pifo_round(w_last_pkt_round),
      .resp_valid(w_drr_out_valid),
      .resp_data(w_drr_out_data),

      .clk(clk_lookup),
      .rstn(rstn)
    ); 
  

// WFQ ENGINE
    wire                       w_wfq_out_valid;
    wire [PIFO_WIDTH-1:0]      w_wfq_out_data;

    wfq_engine
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
    wfq_inst(
      .req_valid(r_req_wfq_valid),
      .req_class_id(r_req_class_id), 
      .req_div_quotient(r_div_out_quotient),
      .req_div_remain(r_div_out_remain),
      .last_pifo_valid(w_last_pkt_valid),
      .last_pifo_overflow(w_last_pkt_overflow),
      .last_pifo_round(w_last_pkt_round),
      .resp_valid(w_wfq_out_valid),
      .resp_data(w_wfq_out_data),

      .clk(clk_lookup),
      .rstn(rstn)
    ); 

    wire empty_div_fifo;
    wire full_div_fifo;
    wire [WEIGHT_WIDTH-1:0]  w_div_fifo_out_quotient;
    wire [WEIGHT_WIDTH-1:0]  w_div_fifo_out_remain;

    //// Input buffer to hold requests ////
    extern_fallthrough_small_fifo
    #(
        .WIDTH(INPUT_WIDTH),
        .MAX_DEPTH_BITS(L2_REQ_BUF_DEPTH)
    )
    extern_devide_fifo
    (
       // Outputs
       .dout                           ({w_div_fifo_out_quotient,w_div_fifo_out_remain}),
       .full                           (full_div_fifo),
       .nearly_full                    (),
       .prog_full                      (),
       .empty                          (empty_div_fifo),
       // Inputs
       .din                            ({w_div_out_quotient,w_div_out_remain}),
       .wr_en                          (w_div_out_valid),
       .rd_en                          (rd_en_fifo),
       .reset                          (~rstn),
       .clk                            (clk_lookup)
    );

    //// Input buffer to hold requests ////
    extern_fallthrough_small_fifo
    #(
        .WIDTH(INPUT_WIDTH),
        .MAX_DEPTH_BITS(L2_REQ_BUF_DEPTH)
    )
    extern_request_fifo
    (
       // Outputs
       .dout                           ({w_req_fifo_valid, w_req_output_port, w_req_class_id, w_req_class_weight, w_req_pkt_size, w_req_calc_type}),
       .full                           (full_fifo),
       .nearly_full                    (),
       .prog_full                      (),
       .empty                          (empty_fifo),
       // Inputs
       .din                            (tuple_in_@EXTERN_NAME@_input_DATA),
       .wr_en                          (tuple_in_@EXTERN_NAME@_input_VALID),
       .rd_en                          (rd_en_fifo),
       .reset                          (~rstn),
       .clk                            (clk_lookup)
    );

    reg  [FSM_WIDTH-1:0]               r_fsm_state, r_fsm_state_next;
    reg  [RESULT_WIDTH-1:0]           r_output_data, r_output_data_next;
    reg                               r_output_valid, r_output_valid_next;


    localparam REQ_WRR = 8'b00000100;
    localparam REQ_DRR = 8'b00000010;    
    localparam REQ_WFQ = 8'b00001000;  

    // FSM 
    always @(*)
      begin
        r_fsm_state_next = r_fsm_state;
        r_output_data_next = r_output_data;
        r_last_pkt_info_next = r_last_pkt_info;
        r_output_valid_next = 0;
        rd_en_fifo = 0;
        
        r_req_class_id_next = r_req_class_id;    
        r_req_class_weight_next = r_req_class_weight;
        r_req_pkt_size_next = r_req_pkt_size;    
        r_req_calc_type_next = r_req_calc_type;   
        r_req_output_port_next = r_req_output_port;
        r_div_out_quotient_next = r_div_out_quotient;
        r_div_out_remain_next = r_div_out_remain;

        r_req_wrr_valid_next = 0;
        r_req_drr_valid_next = 0;
        r_req_wfq_valid_next = 0;

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
          default:
            begin
              r_last_pkt_info_next = last_pifo_info4;
            end
        endcase

        case(r_fsm_state)
          IDLE:
            begin
              if (~empty_div_fifo) 
                begin
                  rd_en_fifo = 1;

                  if(w_req_fifo_valid == 1)
                    begin

                        r_req_class_id_next = w_req_class_id;    
                        r_req_class_weight_next = w_req_class_weight;
                        r_req_pkt_size_next = w_req_pkt_size;    
                        r_req_calc_type_next = w_req_calc_type;   
                        r_req_output_port_next = w_req_output_port;
                        r_div_out_quotient_next = w_div_fifo_out_quotient;
                        r_div_out_remain_next = w_div_fifo_out_remain;     
                        
                        case(w_req_calc_type)
                          REQ_WFQ: // WFQ
                              begin
                                  r_fsm_state_next = WAIT_RESULT_WFQ;
                                  r_req_wfq_valid_next = 1;
                              end
                          REQ_DRR: // DRR
                              begin
                                  r_fsm_state_next = WAIT_RESULT_DRR;
                                  r_req_drr_valid_next = 1;
                              end
                          REQ_WRR: // WRR
                              begin
                                  r_fsm_state_next = WAIT_RESULT_WRR;
                                  r_req_wrr_valid_next = 1;
                              end
                          default: // No match
                              begin
                                  r_fsm_state_next = IDLE;
                                  r_output_valid_next = 1;
                                  r_output_data_next = {RESULT_WIDTH{1'b0}};
                              end
                          
                        endcase
                    end
                  else
                    begin
                      r_fsm_state_next = IDLE;
                      r_output_valid_next = 1;
                      r_output_data_next = {RESULT_WIDTH{1'b0}};
                    end
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
          default:
            begin
              r_fsm_state_next = IDLE;
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
            r_output_port_bit_array <= 0;
            r_div_out_quotient <= 0;
            r_div_out_remain <= 0;          
          end
        else
          begin
            r_fsm_state <= r_fsm_state_next;
            r_output_data <= r_output_data_next;
            r_output_valid <= r_output_valid_next;
            r_last_pkt_info <= r_last_pkt_info_next;
            r_req_wrr_valid <= r_req_wrr_valid_next;
            r_req_drr_valid <= r_req_drr_valid_next;
            r_req_wfq_valid <= r_req_wfq_valid_next;
            r_req_class_id <= r_req_class_id_next;    
            r_req_class_weight <= r_req_class_weight_next;
            r_req_pkt_size <= r_req_pkt_size_next;    
            r_req_calc_type <= r_req_calc_type_next;   
            r_req_output_port <= r_req_output_port_next;
            r_output_port_bit_array <= w_output_port_bit_array;
            r_div_out_quotient <= r_div_out_quotient_next;
            r_div_out_remain <= r_div_out_remain_next;      
          end
      end

    assign tuple_out_@EXTERN_NAME@_output_VALID = r_output_valid;
    assign tuple_out_@EXTERN_NAME@_output_DATA = r_output_data;
endmodule

