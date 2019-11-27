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
 * Author: Lin Qian
 *  
 * extern function test with dummy verilog module
 *
 * Description: implements a dummy verilog module for extern function
 */

`timescale 1 ps / 1 ps
module @MODULE_NAME@ 
#(
    parameter PORT_WIDTH = 8,
    parameter CLASS_WIDTH = 5,
    parameter RESULT_WIDTH = 32
)
(
    // Data Path I/O
    input                                   clk_lookup,
    input                                   rst, 
    input                                   tuple_in_my_pifo_rank_calc_input_VALID,
    input   [PORT_WIDTH+CLASS_WIDTH-1:0]    tuple_in_my_pifo_rank_calc_input_DATA,
    output                                  tuple_out_my_pifo_rank_calc_output_VALID,
    output  [RESULT_WIDTH-1:0]              tuple_out_my_pifo_rank_calc_output_DATA
);


// convert the input data to readable wires
wire[PORT_WIDTH-1:0]   input_port = tuple_in_my_pifo_rank_calc_input_DATA[PORT_WIDTH+CLASS_WIDTH-1:CLASS_WIDTH];
wire[CLASS_WIDTH-1:0]  input_class = tuple_in_my_pifo_rank_calc_input_DATA[CLASS_WIDTH-1:0];

wire    valid_in         = tuple_in_my_pifo_rank_calc_input_VALID;


// registers to hold statefulness
wire                                valid_r;
wire     [RESULT_WIDTH-1:0]         result_r;


// flipflop register statefulness
reg[PORT_WIDTH-1:0]   port_info;
reg[CLASS_WIDTH-1:0]  class_info;  


always@(posedge clk_lookup)
begin
if(~rst)
    begin
    port_info <= input_port;
    class_info <= input_class;
    end
end


assign tuple_out_my_pifo_rank_calc_output_VALID = tuple_in_my_pifo_rank_calc_input_VALID;
assign tuple_out_my_pifo_rank_calc_output_DATA  = port_info;
  
endmodule


