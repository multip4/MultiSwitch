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
`include "@PREFIX_NAME@_cpu_regs_defines.v"
module @MODULE_NAME@ #(
    parameter PORT_WIDTH = 8,
    parameter PORT_LENGHT = 3,
    parameter CLASS_WIDTH = 5,
    parameter RESULT_WIDTH = 32,
    parameter MEM_WIDTH = 32,
    parameter ROUND_WIDTH = 11,
    parameter COUNTER_WIDTH = 8, //read and write data length(number 0 to 256).
    parameter PIFO_INFO_WIDTH = 12,
    parameter PIFO_RANK_WIDTH = 19,
    parameter C_S_AXI_ADDR_WIDTH = @ADDR_WIDTH@,
    parameter C_S_AXI_DATA_WIDTH = 32,
    parameter INDEX_WIDTH = @INDEX_WIDTH@
)
(
    // Data Path I/O
    input                                   clk_lookup,
    input                                   clk_lookup_rst_high, 
    //input                                   rst, 
    input                                   tuple_in_my_pifo_rank_calc_input_VALID,
    input   [PORT_WIDTH+CLASS_WIDTH-1:0]    tuple_in_my_pifo_rank_calc_input_DATA,
    //input   [ROUND_WIDTH-1:0]               input_round,
    input   [31:0]                          last_pkt_info0,
    input   [31:0]                          last_pkt_info1,
    input   [31:0]                          last_pkt_info2,
    input   [31:0]                          last_pkt_info3,
    input   [31:0]                          last_pkt_info4,
    output                                  tuple_out_my_pifo_rank_calc_output_VALID,
    output  [RESULT_WIDTH-1:0]              tuple_out_my_pifo_rank_calc_output_DATA,

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


// p4 interface wire
wire[PORT_WIDTH-1:0]   input_port = tuple_in_my_pifo_rank_calc_input_DATA[PORT_WIDTH+CLASS_WIDTH-1:CLASS_WIDTH];
wire[CLASS_WIDTH-1:0]  input_class = tuple_in_my_pifo_rank_calc_input_DATA[CLASS_WIDTH-1:0];
wire    valid_in         = tuple_in_my_pifo_rank_calc_input_VALID;

// flipflop register.
reg[PORT_LENGHT+CLASS_WIDTH-1:0]   reg_write_address; //port,class
reg                   reg_write_sig;
reg                   reg_read_sig;
reg[COUNTER_WIDTH-1:0]        reg_config_weight;
reg[ROUND_WIDTH-1:0]          reg_round;
reg[COUNTER_WIDTH-1:0]        reg_counter;
reg[RESULT_WIDTH-1:0]         reg_calced_rank;
reg [ROUND_WIDTH-1:0]         input_round;
reg                           reg_calc_valid;


reg [PIFO_INFO_WIDTH-1:0] reg_pifo_info;
reg                       reg_valid_sig;


// combinational output.
reg[COUNTER_WIDTH-1:0]  reg_config_weight_next; //only use for setting config value.
reg[ROUND_WIDTH-1:0]    reg_round_next;
reg[COUNTER_WIDTH-1:0]  reg_counter_next;
reg[PORT_LENGHT+CLASS_WIDTH-1:0]   reg_write_address_next; //port,class
reg                   reg_write_sig_next;
reg                   reg_read_sig_next;
reg [PORT_LENGHT-1:0] reg_port_info;
reg                   reg_calc_valid_next;

// wire
wire  [PORT_LENGHT+CLASS_WIDTH-1:0] wire_read_address;
wire  [MEM_WIDTH-1:0] wire_read_value;
wire  [ROUND_WIDTH-1:0] wire_round;
wire  [COUNTER_WIDTH-1:0] wire_counter;
wire  [COUNTER_WIDTH-1:0] wire_config_weight;
wire  [MEM_WIDTH-1:0] wire_write_value; 
wire [PIFO_RANK_WIDTH-1:0] wire_pifo_rank;

// CPU writes IP interface
wire     [C_S_AXI_DATA_WIDTH-1:0]          cpu2ip_@PREFIX_NAME@_reg_data;
wire     [INDEX_WIDTH-1:0]                 cpu2ip_@PREFIX_NAME@_reg_index;
wire                                       cpu2ip_@PREFIX_NAME@_reg_valid;

assign wire_read_address = {reg_port_info, input_class};
assign wire_counter = wire_read_value[COUNTER_WIDTH-1:0];
assign wire_round = wire_read_value[ROUND_WIDTH+COUNTER_WIDTH-1:COUNTER_WIDTH];
assign wire_config_weight = wire_read_value[COUNTER_WIDTH+ROUND_WIDTH+COUNTER_WIDTH-1:ROUND_WIDTH+COUNTER_WIDTH];

assign wire_write_value = {reg_config_weight, reg_round, reg_counter};
assign wire_pifo_rank = {reg_round,input_class};

wire resetn_sync;

//// CPU REGS START ////
@PREFIX_NAME@_cpu_regs
#(
    .C_BASE_ADDRESS        (0),
    .C_S_AXI_DATA_WIDTH    (C_S_AXI_DATA_WIDTH),
    .C_S_AXI_ADDR_WIDTH    (C_S_AXI_ADDR_WIDTH)
) @PREFIX_NAME@_cpu_regs_inst
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
  .ip2cpu_@PREFIX_NAME@_reg_data          (), //wire
  .ip2cpu_@PREFIX_NAME@_reg_index         (), //reg
  .ip2cpu_@PREFIX_NAME@_reg_valid         (), //reg
  .ipReadReq_@PREFIX_NAME@_reg_index      (),  //wire
  .ipReadReq_@PREFIX_NAME@_reg_valid      (), //wire
  // CPU writes IP interface
  .cpu2ip_@PREFIX_NAME@_reg_data          (cpu2ip_@PREFIX_NAME@_reg_data),
  .cpu2ip_@PREFIX_NAME@_reg_index         (cpu2ip_@PREFIX_NAME@_reg_index),
  .cpu2ip_@PREFIX_NAME@_reg_valid         (cpu2ip_@PREFIX_NAME@_reg_valid),
  // Global Registers - user can select if to use
  .cpu_resetn_soft(),//software reset, after cpu module
  .resetn_soft    (),//software reset to cpu module (from central reset management)
  .resetn_sync    (resetn_sync)//synchronized reset, use for better timing
);
//// CPU REGS END ////


// Block Ram memory.
blk_mem_gen_0 weight_counter(
.clka(clk_lookup),    // input wire clka
.wea(reg_write_sig),      // input wire [0 : 0] wea
.addra(reg_write_address),  // input wire [7 : 0] addra
.dina(wire_write_value),    // input wire [31 : 0] dina
.clkb(clk_lookup),    // input wire clkb
.addrb(wire_read_address),  // input wire [7 : 0] addrb
.doutb(wire_read_value) // output wire [31 : 0] doutb
);


always @(*)
begin
input_round  = 0;
case (input_port)
    'b00000001:
        begin
        input_round  = 0;
        reg_port_info = 0;
        end
    'b00000100:
        begin
        input_round  = 0;
        reg_port_info = 1;
        end
    'b00010000:
        begin
        input_round  = 0;
        reg_port_info = 2;
        end
    'b01000000:
        begin
        input_round  = 0;
        reg_port_info = 3;
        end
    default : 
        begin
        //CPU Channel Read
        reg_port_info = 0;
        input_round  = 0;
        end
endcase
end

always @(*)
begin
if(valid_in)
    begin
    reg_read_sig_next = 'd1;
    end
else
    begin
    reg_read_sig_next = 'd0;
    end
end


always @(*)
begin

if(cpu2ip_@PREFIX_NAME@_reg_valid) //config sig come
    begin
    reg_config_weight_next = cpu2ip_@PREFIX_NAME@_reg_data;
    reg_write_address_next = cpu2ip_@PREFIX_NAME@_reg_index;  
    reg_round_next = 'd0;
    reg_counter_next = 'd0;
    reg_write_sig_next = 'd1;
    reg_calc_valid_next = 'd0;
    end


else if(reg_read_sig) //read done sig from blk memory.
    begin 
    reg_config_weight_next = wire_config_weight;
    
      
    if(wire_round < input_round)
        begin
        reg_round_next = input_round;
        reg_counter_next = 1;
        end
    else
        begin
        if(wire_counter < wire_config_weight)
            begin
            reg_counter_next = wire_counter +1;
            reg_round_next = wire_round;
            end
        else
            begin
            reg_counter_next = 'd1;
            reg_round_next = wire_round + 1;
            end            
        end
        
    reg_write_address_next = wire_read_address;   
    reg_write_sig_next = 'd1;
    reg_calc_valid_next = 'd1;
    end
    
else
    begin
    reg_write_sig_next = 'd0;
    reg_write_address_next = reg_write_address;
    reg_config_weight_next =reg_config_weight;
    reg_round_next = reg_round;
    reg_counter_next = reg_counter;
    reg_calc_valid_next = 'd0;
    end
end


always@(posedge clk_lookup)
begin
if(resetn_sync)
    begin
    reg_config_weight <= reg_config_weight_next;
    reg_round <= reg_round_next;
    reg_counter <= reg_counter_next;
    reg_write_address <= reg_write_address_next;
    reg_write_sig <= reg_write_sig_next;
    reg_read_sig <= reg_read_sig_next;
    reg_calc_valid = reg_calc_valid_next;
    reg_pifo_info <= 0;
    reg_valid_sig <= 1;
    end
else
    begin
    reg_config_weight <= 0;
    reg_round <=0;
    reg_counter <= 0;
    reg_write_address <= 0;
    reg_write_sig <=0;
    reg_read_sig <= 0;
    reg_pifo_info <=0;
    reg_valid_sig <=0;
    reg_calc_valid <=0;
    end
end

assign tuple_out_my_pifo_rank_calc_output_VALID = reg_calc_valid;
assign tuple_out_my_pifo_rank_calc_output_DATA  = {reg_valid_sig,wire_pifo_rank,reg_pifo_info};
  
endmodule