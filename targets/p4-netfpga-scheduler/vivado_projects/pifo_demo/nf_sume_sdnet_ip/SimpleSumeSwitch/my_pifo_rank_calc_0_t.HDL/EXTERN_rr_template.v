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


/*
 * File: @MODULE_NAME@.v 
 * Author: Lin Qian
 *  
 * extern function test with dummy verilog module
 * Description: implements a dummy verilog module for extern function
 */


`timescale 1 ps / 1 ps
module @MODULE_NAME@ #(
    parameter PORT_WIDTH = 8,
    parameter CLASS_WIDTH = 5,
    parameter RESULT_WIDTH = 32,
    parameter MEM_WIDTH = 32,
    parameter ROUND_WIDTH = 11
)
(
    // Data Path I/O
    input                                   clk_lookup,
    input                                   clk_lookup_rst_high, 
    input                                   rst, 
    input                                   tuple_in_my_pifo_rank_calc_input_VALID,
    input   [PORT_WIDTH+CLASS_WIDTH-1:0]    tuple_in_my_pifo_rank_calc_input_DATA,
    input   [ROUND_WIDTH-1:0]               input_round,
    output                                  tuple_out_my_pifo_rank_calc_output_VALID,
    output  [RESULT_WIDTH-1:0]              tuple_out_my_pifo_rank_calc_output_DATA
);

// p4 interface wire
wire[PORT_WIDTH-1:0]   input_port = tuple_in_my_pifo_rank_calc_input_DATA[PORT_WIDTH+CLASS_WIDTH-1:CLASS_WIDTH];
wire[CLASS_WIDTH-1:0]  input_class = tuple_in_my_pifo_rank_calc_input_DATA[CLASS_WIDTH-1:0];
wire    valid_in         = tuple_in_my_pifo_rank_calc_input_VALID;

// flipflop register.
reg[PORT_WIDTH+CLASS_WIDTH-1:0]   reg_write_address; //port,class
reg[MEM_WIDTH-1:0]    reg_write_value;
reg                   reg_write_sig;
reg[MEM_WIDTH-1:0]    reg_read_value;
reg                   reg_read_sig;
reg[RESULT_WIDTH-1:0]             reg_calced_rank;

// combinational output.
reg[PORT_WIDTH+CLASS_WIDTH-1:0]   reg_write_address_next; //port,class
reg[MEM_WIDTH-1:0]    reg_write_value_next;
reg                   reg_write_sig_next;
reg[MEM_WIDTH-1:0]    reg_read_value_next;
reg                   reg_read_sig_next;
reg[RESULT_WIDTH-1:0]             reg_calced_rank_next;

// wire
wire  [PORT_WIDTH+CLASS_WIDTH-1:0] wire_read_address;
wire  [MEM_WIDTH-1:0] wire_read_value;

// Block Ram memory.
blk_mem_gen_0 weight_counter(
.clka(clk_lookup),    // input wire clka
.wea(reg_write_sig),      // input wire [0 : 0] wea
.addra(reg_write_address),  // input wire [7 : 0] addra
.dina(reg_write_value),    // input wire [31 : 0] dina
.clkb(clk_lookup),    // input wire clkb
.addrb(wire_read_address),  // input wire [7 : 0] addrb
.doutb(wire_read_value) // output wire [31 : 0] doutb
);

assign wire_read_address = {input_port, input_class};

always @(*)
begin
if(valid_in)
    begin
    reg_read_value_next = wire_read_value;
    reg_read_sig_next = 'd1;
    end
else
    begin
    reg_read_value_next = reg_read_value;
    reg_read_sig_next = 'd0;
    end
end


always @(*)
begin
if(reg_read_sig)
    begin 
    if(wire_read_value < input_round)
        begin
        reg_write_value_next = input_round;
        end
    else
        begin
        reg_write_value_next =  wire_read_value + 1; //adding one counter.
        end
        
    reg_write_address_next = wire_read_address;   
    reg_write_sig_next = 'd1;
    end
else
    begin
    reg_write_sig_next = 'd0;
    reg_write_value_next = reg_write_value;
    reg_write_address_next = reg_write_address;
    end
end

always@(posedge clk_lookup)
begin
if(~rst)
    begin
    reg_write_address <= reg_write_address_next;
    reg_write_value <= reg_write_value_next;
    reg_write_sig <= reg_write_sig_next;
    reg_read_value <= reg_read_value_next;
    reg_read_sig <= reg_read_sig_next;
    end
else
    begin
    reg_write_address <= 0;
    reg_write_value <= 0;
    reg_write_sig <=0;
    reg_read_value <=0;
    reg_read_sig <= 0;
    end
end

assign tuple_out_my_pifo_rank_calc_output_VALID = tuple_in_my_pifo_rank_calc_input_VALID;
assign tuple_out_my_pifo_rank_calc_output_DATA  = {input_class,reg_write_value [ROUND_WIDTH-1:0]};
  
endmodule