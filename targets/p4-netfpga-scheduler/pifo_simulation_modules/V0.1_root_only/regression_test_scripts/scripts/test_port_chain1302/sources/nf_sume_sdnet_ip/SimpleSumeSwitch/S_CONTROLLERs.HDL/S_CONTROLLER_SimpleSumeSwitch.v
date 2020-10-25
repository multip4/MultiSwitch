//----------------------------------------------------------------------------
//   This file is owned and controlled by Xilinx and must be used solely    //
//   for design, simulation, implementation and creation of design files    //
//   limited to Xilinx devices or technologies. Use with non-Xilinx         //
//   devices or technologies is expressly prohibited and immediately        //
//   terminates your license.                                               //
//                                                                          //
//   XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY   //
//   FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY   //
//   PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE            //
//   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, XILINX IS     //
//   MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY     //
//   CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY      //
//   RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY      //
//   DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE  //
//   IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR         //
//   REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF        //
//   INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A  //
//   PARTICULAR PURPOSE.                                                    //
//                                                                          //
//   Xilinx products are not intended for use in life support appliances,   //
//   devices, or systems.  Use in such applications are expressly           //
//   prohibited.                                                            //
//                                                                          //
//   (c) Copyright 1995-2015 Xilinx, Inc.                                   //
//   All rights reserved.                                                   //
//----------------------------------------------------------------------------
// Xilinx SDNet Compiler version 2018.2, build 2342300
//----------------------------------------------------------------------------
/*

*/

`timescale 1 ps / 1 ps

module S_CONTROLLER_SimpleSumeSwitch (
	clk_control,
	enable_processing,
	rst,
	control_S_AXI_AWADDR,
	control_S_AXI_AWVALID,
	control_S_AXI_WDATA,
	control_S_AXI_WSTRB,
	control_S_AXI_WVALID,
	control_S_AXI_BREADY,
	control_S_AXI_ARADDR,
	control_S_AXI_ARVALID,
	control_S_AXI_RREADY,
	control_S_AXI_AWREADY,
	control_S_AXI_WREADY,
	control_S_AXI_BRESP,
	control_S_AXI_BVALID,
	control_S_AXI_ARREADY,
	control_S_AXI_RDATA,
	control_S_AXI_RRESP,
	control_S_AXI_RVALID,
	table_l2_switch_control_S_AXI_AWREADY,
	table_l2_switch_control_S_AXI_WREADY,
	table_l2_switch_control_S_AXI_BRESP,
	table_l2_switch_control_S_AXI_BVALID,
	table_l2_switch_control_S_AXI_ARREADY,
	table_l2_switch_control_S_AXI_RDATA,
	table_l2_switch_control_S_AXI_RRESP,
	table_l2_switch_control_S_AXI_RVALID,
	table_l2_switch_control_S_AXI_AWADDR,
	table_l2_switch_control_S_AXI_AWVALID,
	table_l2_switch_control_S_AXI_WDATA,
	table_l2_switch_control_S_AXI_WSTRB,
	table_l2_switch_control_S_AXI_WVALID,
	table_l2_switch_control_S_AXI_BREADY,
	table_l2_switch_control_S_AXI_ARADDR,
	table_l2_switch_control_S_AXI_ARVALID,
	table_l2_switch_control_S_AXI_RREADY,
	table_l1_switch_control_S_AXI_AWREADY,
	table_l1_switch_control_S_AXI_WREADY,
	table_l1_switch_control_S_AXI_BRESP,
	table_l1_switch_control_S_AXI_BVALID,
	table_l1_switch_control_S_AXI_ARREADY,
	table_l1_switch_control_S_AXI_RDATA,
	table_l1_switch_control_S_AXI_RRESP,
	table_l1_switch_control_S_AXI_RVALID,
	table_l1_switch_control_S_AXI_AWADDR,
	table_l1_switch_control_S_AXI_AWVALID,
	table_l1_switch_control_S_AXI_WDATA,
	table_l1_switch_control_S_AXI_WSTRB,
	table_l1_switch_control_S_AXI_WVALID,
	table_l1_switch_control_S_AXI_BREADY,
	table_l1_switch_control_S_AXI_ARADDR,
	table_l1_switch_control_S_AXI_ARVALID,
	table_l1_switch_control_S_AXI_RREADY,
	table_strict_priority_control_S_AXI_AWREADY,
	table_strict_priority_control_S_AXI_WREADY,
	table_strict_priority_control_S_AXI_BRESP,
	table_strict_priority_control_S_AXI_BVALID,
	table_strict_priority_control_S_AXI_ARREADY,
	table_strict_priority_control_S_AXI_RDATA,
	table_strict_priority_control_S_AXI_RRESP,
	table_strict_priority_control_S_AXI_RVALID,
	table_strict_priority_control_S_AXI_AWADDR,
	table_strict_priority_control_S_AXI_AWVALID,
	table_strict_priority_control_S_AXI_WDATA,
	table_strict_priority_control_S_AXI_WSTRB,
	table_strict_priority_control_S_AXI_WVALID,
	table_strict_priority_control_S_AXI_BREADY,
	table_strict_priority_control_S_AXI_ARADDR,
	table_strict_priority_control_S_AXI_ARVALID,
	table_strict_priority_control_S_AXI_RREADY,
	table_switch_mode_control_S_AXI_AWREADY,
	table_switch_mode_control_S_AXI_WREADY,
	table_switch_mode_control_S_AXI_BRESP,
	table_switch_mode_control_S_AXI_BVALID,
	table_switch_mode_control_S_AXI_ARREADY,
	table_switch_mode_control_S_AXI_RDATA,
	table_switch_mode_control_S_AXI_RRESP,
	table_switch_mode_control_S_AXI_RVALID,
	table_switch_mode_control_S_AXI_AWADDR,
	table_switch_mode_control_S_AXI_AWVALID,
	table_switch_mode_control_S_AXI_WDATA,
	table_switch_mode_control_S_AXI_WSTRB,
	table_switch_mode_control_S_AXI_WVALID,
	table_switch_mode_control_S_AXI_BREADY,
	table_switch_mode_control_S_AXI_ARADDR,
	table_switch_mode_control_S_AXI_ARVALID,
	table_switch_mode_control_S_AXI_RREADY,
	table_rank_calc_mode_control_S_AXI_AWREADY,
	table_rank_calc_mode_control_S_AXI_WREADY,
	table_rank_calc_mode_control_S_AXI_BRESP,
	table_rank_calc_mode_control_S_AXI_BVALID,
	table_rank_calc_mode_control_S_AXI_ARREADY,
	table_rank_calc_mode_control_S_AXI_RDATA,
	table_rank_calc_mode_control_S_AXI_RRESP,
	table_rank_calc_mode_control_S_AXI_RVALID,
	table_rank_calc_mode_control_S_AXI_AWADDR,
	table_rank_calc_mode_control_S_AXI_AWVALID,
	table_rank_calc_mode_control_S_AXI_WDATA,
	table_rank_calc_mode_control_S_AXI_WSTRB,
	table_rank_calc_mode_control_S_AXI_WVALID,
	table_rank_calc_mode_control_S_AXI_BREADY,
	table_rank_calc_mode_control_S_AXI_ARADDR,
	table_rank_calc_mode_control_S_AXI_ARVALID,
	table_rank_calc_mode_control_S_AXI_RREADY
);

input clk_control /* unused */ ;
output enable_processing ;
input rst /* unused */ ;
input [10:0] control_S_AXI_AWADDR ;
input control_S_AXI_AWVALID ;
input [31:0] control_S_AXI_WDATA ;
input [3:0] control_S_AXI_WSTRB ;
input control_S_AXI_WVALID ;
input control_S_AXI_BREADY ;
input [10:0] control_S_AXI_ARADDR ;
input control_S_AXI_ARVALID ;
input control_S_AXI_RREADY ;
output control_S_AXI_AWREADY ;
output control_S_AXI_WREADY ;
output [1:0] control_S_AXI_BRESP ;
output control_S_AXI_BVALID ;
output control_S_AXI_ARREADY ;
output [31:0] control_S_AXI_RDATA ;
output [1:0] control_S_AXI_RRESP ;
output control_S_AXI_RVALID ;
input table_l2_switch_control_S_AXI_AWREADY ;
input table_l2_switch_control_S_AXI_WREADY ;
input [1:0] table_l2_switch_control_S_AXI_BRESP ;
input table_l2_switch_control_S_AXI_BVALID ;
input table_l2_switch_control_S_AXI_ARREADY ;
input [31:0] table_l2_switch_control_S_AXI_RDATA ;
input [1:0] table_l2_switch_control_S_AXI_RRESP ;
input table_l2_switch_control_S_AXI_RVALID ;
output [7:0] table_l2_switch_control_S_AXI_AWADDR ;
output table_l2_switch_control_S_AXI_AWVALID ;
output [31:0] table_l2_switch_control_S_AXI_WDATA ;
output [3:0] table_l2_switch_control_S_AXI_WSTRB ;
output table_l2_switch_control_S_AXI_WVALID ;
output table_l2_switch_control_S_AXI_BREADY ;
output [7:0] table_l2_switch_control_S_AXI_ARADDR ;
output table_l2_switch_control_S_AXI_ARVALID ;
output table_l2_switch_control_S_AXI_RREADY ;
input table_l1_switch_control_S_AXI_AWREADY ;
input table_l1_switch_control_S_AXI_WREADY ;
input [1:0] table_l1_switch_control_S_AXI_BRESP ;
input table_l1_switch_control_S_AXI_BVALID ;
input table_l1_switch_control_S_AXI_ARREADY ;
input [31:0] table_l1_switch_control_S_AXI_RDATA ;
input [1:0] table_l1_switch_control_S_AXI_RRESP ;
input table_l1_switch_control_S_AXI_RVALID ;
output [7:0] table_l1_switch_control_S_AXI_AWADDR ;
output table_l1_switch_control_S_AXI_AWVALID ;
output [31:0] table_l1_switch_control_S_AXI_WDATA ;
output [3:0] table_l1_switch_control_S_AXI_WSTRB ;
output table_l1_switch_control_S_AXI_WVALID ;
output table_l1_switch_control_S_AXI_BREADY ;
output [7:0] table_l1_switch_control_S_AXI_ARADDR ;
output table_l1_switch_control_S_AXI_ARVALID ;
output table_l1_switch_control_S_AXI_RREADY ;
input table_strict_priority_control_S_AXI_AWREADY ;
input table_strict_priority_control_S_AXI_WREADY ;
input [1:0] table_strict_priority_control_S_AXI_BRESP ;
input table_strict_priority_control_S_AXI_BVALID ;
input table_strict_priority_control_S_AXI_ARREADY ;
input [31:0] table_strict_priority_control_S_AXI_RDATA ;
input [1:0] table_strict_priority_control_S_AXI_RRESP ;
input table_strict_priority_control_S_AXI_RVALID ;
output [7:0] table_strict_priority_control_S_AXI_AWADDR ;
output table_strict_priority_control_S_AXI_AWVALID ;
output [31:0] table_strict_priority_control_S_AXI_WDATA ;
output [3:0] table_strict_priority_control_S_AXI_WSTRB ;
output table_strict_priority_control_S_AXI_WVALID ;
output table_strict_priority_control_S_AXI_BREADY ;
output [7:0] table_strict_priority_control_S_AXI_ARADDR ;
output table_strict_priority_control_S_AXI_ARVALID ;
output table_strict_priority_control_S_AXI_RREADY ;
input table_switch_mode_control_S_AXI_AWREADY ;
input table_switch_mode_control_S_AXI_WREADY ;
input [1:0] table_switch_mode_control_S_AXI_BRESP ;
input table_switch_mode_control_S_AXI_BVALID ;
input table_switch_mode_control_S_AXI_ARREADY ;
input [31:0] table_switch_mode_control_S_AXI_RDATA ;
input [1:0] table_switch_mode_control_S_AXI_RRESP ;
input table_switch_mode_control_S_AXI_RVALID ;
output [7:0] table_switch_mode_control_S_AXI_AWADDR ;
output table_switch_mode_control_S_AXI_AWVALID ;
output [31:0] table_switch_mode_control_S_AXI_WDATA ;
output [3:0] table_switch_mode_control_S_AXI_WSTRB ;
output table_switch_mode_control_S_AXI_WVALID ;
output table_switch_mode_control_S_AXI_BREADY ;
output [7:0] table_switch_mode_control_S_AXI_ARADDR ;
output table_switch_mode_control_S_AXI_ARVALID ;
output table_switch_mode_control_S_AXI_RREADY ;
input table_rank_calc_mode_control_S_AXI_AWREADY ;
input table_rank_calc_mode_control_S_AXI_WREADY ;
input [1:0] table_rank_calc_mode_control_S_AXI_BRESP ;
input table_rank_calc_mode_control_S_AXI_BVALID ;
input table_rank_calc_mode_control_S_AXI_ARREADY ;
input [31:0] table_rank_calc_mode_control_S_AXI_RDATA ;
input [1:0] table_rank_calc_mode_control_S_AXI_RRESP ;
input table_rank_calc_mode_control_S_AXI_RVALID ;
output [7:0] table_rank_calc_mode_control_S_AXI_AWADDR ;
output table_rank_calc_mode_control_S_AXI_AWVALID ;
output [31:0] table_rank_calc_mode_control_S_AXI_WDATA ;
output [3:0] table_rank_calc_mode_control_S_AXI_WSTRB ;
output table_rank_calc_mode_control_S_AXI_WVALID ;
output table_rank_calc_mode_control_S_AXI_BREADY ;
output [7:0] table_rank_calc_mode_control_S_AXI_ARADDR ;
output table_rank_calc_mode_control_S_AXI_ARVALID ;
output table_rank_calc_mode_control_S_AXI_RREADY ;

wire enable_processing ;
reg control_S_AXI_AWREADY ;
reg control_S_AXI_WREADY ;
reg [1:0] control_S_AXI_BRESP ;
reg control_S_AXI_BVALID ;
reg control_S_AXI_ARREADY ;
reg [31:0] control_S_AXI_RDATA ;
reg [1:0] control_S_AXI_RRESP ;
reg control_S_AXI_RVALID ;
reg [7:0] table_l2_switch_control_S_AXI_AWADDR ;
reg table_l2_switch_control_S_AXI_AWVALID ;
reg [31:0] table_l2_switch_control_S_AXI_WDATA ;
reg [3:0] table_l2_switch_control_S_AXI_WSTRB ;
reg table_l2_switch_control_S_AXI_WVALID ;
reg table_l2_switch_control_S_AXI_BREADY ;
reg [7:0] table_l2_switch_control_S_AXI_ARADDR ;
reg table_l2_switch_control_S_AXI_ARVALID ;
reg table_l2_switch_control_S_AXI_RREADY ;
reg [7:0] table_l1_switch_control_S_AXI_AWADDR ;
reg table_l1_switch_control_S_AXI_AWVALID ;
reg [31:0] table_l1_switch_control_S_AXI_WDATA ;
reg [3:0] table_l1_switch_control_S_AXI_WSTRB ;
reg table_l1_switch_control_S_AXI_WVALID ;
reg table_l1_switch_control_S_AXI_BREADY ;
reg [7:0] table_l1_switch_control_S_AXI_ARADDR ;
reg table_l1_switch_control_S_AXI_ARVALID ;
reg table_l1_switch_control_S_AXI_RREADY ;
reg [7:0] table_strict_priority_control_S_AXI_AWADDR ;
reg table_strict_priority_control_S_AXI_AWVALID ;
reg [31:0] table_strict_priority_control_S_AXI_WDATA ;
reg [3:0] table_strict_priority_control_S_AXI_WSTRB ;
reg table_strict_priority_control_S_AXI_WVALID ;
reg table_strict_priority_control_S_AXI_BREADY ;
reg [7:0] table_strict_priority_control_S_AXI_ARADDR ;
reg table_strict_priority_control_S_AXI_ARVALID ;
reg table_strict_priority_control_S_AXI_RREADY ;
reg [7:0] table_switch_mode_control_S_AXI_AWADDR ;
reg table_switch_mode_control_S_AXI_AWVALID ;
reg [31:0] table_switch_mode_control_S_AXI_WDATA ;
reg [3:0] table_switch_mode_control_S_AXI_WSTRB ;
reg table_switch_mode_control_S_AXI_WVALID ;
reg table_switch_mode_control_S_AXI_BREADY ;
reg [7:0] table_switch_mode_control_S_AXI_ARADDR ;
reg table_switch_mode_control_S_AXI_ARVALID ;
reg table_switch_mode_control_S_AXI_RREADY ;
reg [7:0] table_rank_calc_mode_control_S_AXI_AWADDR ;
reg table_rank_calc_mode_control_S_AXI_AWVALID ;
reg [31:0] table_rank_calc_mode_control_S_AXI_WDATA ;
reg [3:0] table_rank_calc_mode_control_S_AXI_WSTRB ;
reg table_rank_calc_mode_control_S_AXI_WVALID ;
reg table_rank_calc_mode_control_S_AXI_BREADY ;
reg [7:0] table_rank_calc_mode_control_S_AXI_ARADDR ;
reg table_rank_calc_mode_control_S_AXI_ARVALID ;
reg table_rank_calc_mode_control_S_AXI_RREADY ;

assign enable_processing = 1'd1 ;

always @* begin
	table_l2_switch_control_S_AXI_AWADDR = control_S_AXI_AWADDR[7:0] ;
	table_l2_switch_control_S_AXI_WDATA = control_S_AXI_WDATA ;
	table_l2_switch_control_S_AXI_WSTRB = control_S_AXI_WSTRB ;
	table_l1_switch_control_S_AXI_AWADDR = control_S_AXI_AWADDR[7:0] ;
	table_l1_switch_control_S_AXI_WDATA = control_S_AXI_WDATA ;
	table_l1_switch_control_S_AXI_WSTRB = control_S_AXI_WSTRB ;
	table_strict_priority_control_S_AXI_AWADDR = control_S_AXI_AWADDR[7:0] ;
	table_strict_priority_control_S_AXI_WDATA = control_S_AXI_WDATA ;
	table_strict_priority_control_S_AXI_WSTRB = control_S_AXI_WSTRB ;
	table_switch_mode_control_S_AXI_AWADDR = control_S_AXI_AWADDR[7:0] ;
	table_switch_mode_control_S_AXI_WDATA = control_S_AXI_WDATA ;
	table_switch_mode_control_S_AXI_WSTRB = control_S_AXI_WSTRB ;
	table_rank_calc_mode_control_S_AXI_AWADDR = control_S_AXI_AWADDR[7:0] ;
	table_rank_calc_mode_control_S_AXI_WDATA = control_S_AXI_WDATA ;
	table_rank_calc_mode_control_S_AXI_WSTRB = control_S_AXI_WSTRB ;
	if ( ( ( ( control_S_AXI_AWADDR >= 0 ) && ( control_S_AXI_AWADDR <= 255 ) ) && control_S_AXI_AWVALID ) ) begin
		control_S_AXI_AWREADY = table_l2_switch_control_S_AXI_AWREADY ;
		control_S_AXI_WREADY = table_l2_switch_control_S_AXI_WREADY ;
		table_l2_switch_control_S_AXI_AWVALID = control_S_AXI_AWVALID ;
		table_l2_switch_control_S_AXI_WVALID = control_S_AXI_WVALID ;
		table_l1_switch_control_S_AXI_AWVALID = 0 ;
		table_l1_switch_control_S_AXI_WVALID = 0 ;
		table_strict_priority_control_S_AXI_AWVALID = 0 ;
		table_strict_priority_control_S_AXI_WVALID = 0 ;
		table_switch_mode_control_S_AXI_AWVALID = 0 ;
		table_switch_mode_control_S_AXI_WVALID = 0 ;
		table_rank_calc_mode_control_S_AXI_AWVALID = 0 ;
		table_rank_calc_mode_control_S_AXI_WVALID = 0 ;
	end
	else  begin
		if ( ( ( ( control_S_AXI_AWADDR >= 256 ) && ( control_S_AXI_AWADDR <= 511 ) ) && control_S_AXI_AWVALID ) ) begin
			table_l2_switch_control_S_AXI_AWVALID = 0 ;
			table_l2_switch_control_S_AXI_WVALID = 0 ;
			control_S_AXI_AWREADY = table_l1_switch_control_S_AXI_AWREADY ;
			control_S_AXI_WREADY = table_l1_switch_control_S_AXI_WREADY ;
			table_l1_switch_control_S_AXI_AWVALID = control_S_AXI_AWVALID ;
			table_l1_switch_control_S_AXI_WVALID = control_S_AXI_WVALID ;
			table_strict_priority_control_S_AXI_AWVALID = 0 ;
			table_strict_priority_control_S_AXI_WVALID = 0 ;
			table_switch_mode_control_S_AXI_AWVALID = 0 ;
			table_switch_mode_control_S_AXI_WVALID = 0 ;
			table_rank_calc_mode_control_S_AXI_AWVALID = 0 ;
			table_rank_calc_mode_control_S_AXI_WVALID = 0 ;
		end
		else  begin
			if ( ( ( ( control_S_AXI_AWADDR >= 512 ) && ( control_S_AXI_AWADDR <= 767 ) ) && control_S_AXI_AWVALID ) ) begin
				table_l2_switch_control_S_AXI_AWVALID = 0 ;
				table_l2_switch_control_S_AXI_WVALID = 0 ;
				table_l1_switch_control_S_AXI_AWVALID = 0 ;
				table_l1_switch_control_S_AXI_WVALID = 0 ;
				control_S_AXI_AWREADY = table_strict_priority_control_S_AXI_AWREADY ;
				control_S_AXI_WREADY = table_strict_priority_control_S_AXI_WREADY ;
				table_strict_priority_control_S_AXI_AWVALID = control_S_AXI_AWVALID ;
				table_strict_priority_control_S_AXI_WVALID = control_S_AXI_WVALID ;
				table_switch_mode_control_S_AXI_AWVALID = 0 ;
				table_switch_mode_control_S_AXI_WVALID = 0 ;
				table_rank_calc_mode_control_S_AXI_AWVALID = 0 ;
				table_rank_calc_mode_control_S_AXI_WVALID = 0 ;
			end
			else  begin
				if ( ( ( ( control_S_AXI_AWADDR >= 768 ) && ( control_S_AXI_AWADDR <= 1023 ) ) && control_S_AXI_AWVALID ) ) begin
					table_l2_switch_control_S_AXI_AWVALID = 0 ;
					table_l2_switch_control_S_AXI_WVALID = 0 ;
					table_l1_switch_control_S_AXI_AWVALID = 0 ;
					table_l1_switch_control_S_AXI_WVALID = 0 ;
					table_strict_priority_control_S_AXI_AWVALID = 0 ;
					table_strict_priority_control_S_AXI_WVALID = 0 ;
					control_S_AXI_AWREADY = table_switch_mode_control_S_AXI_AWREADY ;
					control_S_AXI_WREADY = table_switch_mode_control_S_AXI_WREADY ;
					table_switch_mode_control_S_AXI_AWVALID = control_S_AXI_AWVALID ;
					table_switch_mode_control_S_AXI_WVALID = control_S_AXI_WVALID ;
					table_rank_calc_mode_control_S_AXI_AWVALID = 0 ;
					table_rank_calc_mode_control_S_AXI_WVALID = 0 ;
				end
				else  begin
					if ( ( ( ( control_S_AXI_AWADDR >= 1024 ) && ( control_S_AXI_AWADDR <= 1279 ) ) && control_S_AXI_AWVALID ) ) begin
						table_l2_switch_control_S_AXI_AWVALID = 0 ;
						table_l2_switch_control_S_AXI_WVALID = 0 ;
						table_l1_switch_control_S_AXI_AWVALID = 0 ;
						table_l1_switch_control_S_AXI_WVALID = 0 ;
						table_strict_priority_control_S_AXI_AWVALID = 0 ;
						table_strict_priority_control_S_AXI_WVALID = 0 ;
						table_switch_mode_control_S_AXI_AWVALID = 0 ;
						table_switch_mode_control_S_AXI_WVALID = 0 ;
						control_S_AXI_AWREADY = table_rank_calc_mode_control_S_AXI_AWREADY ;
						control_S_AXI_WREADY = table_rank_calc_mode_control_S_AXI_WREADY ;
						table_rank_calc_mode_control_S_AXI_AWVALID = control_S_AXI_AWVALID ;
						table_rank_calc_mode_control_S_AXI_WVALID = control_S_AXI_WVALID ;
					end
					else  begin
						control_S_AXI_AWREADY = 0 ;
						control_S_AXI_WREADY = 0 ;
						table_l2_switch_control_S_AXI_AWVALID = 0 ;
						table_l2_switch_control_S_AXI_WVALID = 0 ;
						table_l1_switch_control_S_AXI_AWVALID = 0 ;
						table_l1_switch_control_S_AXI_WVALID = 0 ;
						table_strict_priority_control_S_AXI_AWVALID = 0 ;
						table_strict_priority_control_S_AXI_WVALID = 0 ;
						table_switch_mode_control_S_AXI_AWVALID = 0 ;
						table_switch_mode_control_S_AXI_WVALID = 0 ;
						table_rank_calc_mode_control_S_AXI_AWVALID = 0 ;
						table_rank_calc_mode_control_S_AXI_WVALID = 0 ;
					end
				end
			end
		end
	end
	if ( table_l2_switch_control_S_AXI_BVALID ) begin
		control_S_AXI_BRESP = table_l2_switch_control_S_AXI_BRESP ;
		control_S_AXI_BVALID = table_l2_switch_control_S_AXI_BVALID ;
		table_l2_switch_control_S_AXI_BREADY = control_S_AXI_BREADY ;
		table_l1_switch_control_S_AXI_BREADY = 0 ;
		table_strict_priority_control_S_AXI_BREADY = 0 ;
		table_switch_mode_control_S_AXI_BREADY = 0 ;
		table_rank_calc_mode_control_S_AXI_BREADY = 0 ;
	end
	else  begin
		if ( table_l1_switch_control_S_AXI_BVALID ) begin
			control_S_AXI_BRESP = table_l1_switch_control_S_AXI_BRESP ;
			control_S_AXI_BVALID = table_l1_switch_control_S_AXI_BVALID ;
			table_l2_switch_control_S_AXI_BREADY = 0 ;
			table_l1_switch_control_S_AXI_BREADY = control_S_AXI_BREADY ;
			table_strict_priority_control_S_AXI_BREADY = 0 ;
			table_switch_mode_control_S_AXI_BREADY = 0 ;
			table_rank_calc_mode_control_S_AXI_BREADY = 0 ;
		end
		else  begin
			if ( table_strict_priority_control_S_AXI_BVALID ) begin
				control_S_AXI_BRESP = table_strict_priority_control_S_AXI_BRESP ;
				control_S_AXI_BVALID = table_strict_priority_control_S_AXI_BVALID ;
				table_l2_switch_control_S_AXI_BREADY = 0 ;
				table_l1_switch_control_S_AXI_BREADY = 0 ;
				table_strict_priority_control_S_AXI_BREADY = control_S_AXI_BREADY ;
				table_switch_mode_control_S_AXI_BREADY = 0 ;
				table_rank_calc_mode_control_S_AXI_BREADY = 0 ;
			end
			else  begin
				if ( table_switch_mode_control_S_AXI_BVALID ) begin
					control_S_AXI_BRESP = table_switch_mode_control_S_AXI_BRESP ;
					control_S_AXI_BVALID = table_switch_mode_control_S_AXI_BVALID ;
					table_l2_switch_control_S_AXI_BREADY = 0 ;
					table_l1_switch_control_S_AXI_BREADY = 0 ;
					table_strict_priority_control_S_AXI_BREADY = 0 ;
					table_switch_mode_control_S_AXI_BREADY = control_S_AXI_BREADY ;
					table_rank_calc_mode_control_S_AXI_BREADY = 0 ;
				end
				else  begin
					if ( table_rank_calc_mode_control_S_AXI_BVALID ) begin
						control_S_AXI_BRESP = table_rank_calc_mode_control_S_AXI_BRESP ;
						control_S_AXI_BVALID = table_rank_calc_mode_control_S_AXI_BVALID ;
						table_l2_switch_control_S_AXI_BREADY = 0 ;
						table_l1_switch_control_S_AXI_BREADY = 0 ;
						table_strict_priority_control_S_AXI_BREADY = 0 ;
						table_switch_mode_control_S_AXI_BREADY = 0 ;
						table_rank_calc_mode_control_S_AXI_BREADY = control_S_AXI_BREADY ;
					end
					else  begin
						control_S_AXI_BRESP = 0 ;
						control_S_AXI_BVALID = 0 ;
						table_l2_switch_control_S_AXI_BREADY = 0 ;
						table_l1_switch_control_S_AXI_BREADY = 0 ;
						table_strict_priority_control_S_AXI_BREADY = 0 ;
						table_switch_mode_control_S_AXI_BREADY = 0 ;
						table_rank_calc_mode_control_S_AXI_BREADY = 0 ;
					end
				end
			end
		end
	end
	if ( ( ( ( control_S_AXI_ARADDR >= 0 ) && ( control_S_AXI_ARADDR <= 255 ) ) && control_S_AXI_ARVALID ) ) begin
		control_S_AXI_ARREADY = table_l2_switch_control_S_AXI_ARREADY ;
		table_l2_switch_control_S_AXI_ARADDR = control_S_AXI_ARADDR[7:0] ;
		table_l2_switch_control_S_AXI_ARVALID = control_S_AXI_ARVALID ;
		table_l1_switch_control_S_AXI_ARADDR = 0 ;
		table_l1_switch_control_S_AXI_ARVALID = 0 ;
		table_strict_priority_control_S_AXI_ARADDR = 0 ;
		table_strict_priority_control_S_AXI_ARVALID = 0 ;
		table_switch_mode_control_S_AXI_ARADDR = 0 ;
		table_switch_mode_control_S_AXI_ARVALID = 0 ;
		table_rank_calc_mode_control_S_AXI_ARADDR = 0 ;
		table_rank_calc_mode_control_S_AXI_ARVALID = 0 ;
	end
	else  begin
		if ( ( ( ( control_S_AXI_ARADDR >= 256 ) && ( control_S_AXI_ARADDR <= 511 ) ) && control_S_AXI_ARVALID ) ) begin
			table_l2_switch_control_S_AXI_ARADDR = 0 ;
			table_l2_switch_control_S_AXI_ARVALID = 0 ;
			control_S_AXI_ARREADY = table_l1_switch_control_S_AXI_ARREADY ;
			table_l1_switch_control_S_AXI_ARADDR = control_S_AXI_ARADDR[7:0] ;
			table_l1_switch_control_S_AXI_ARVALID = control_S_AXI_ARVALID ;
			table_strict_priority_control_S_AXI_ARADDR = 0 ;
			table_strict_priority_control_S_AXI_ARVALID = 0 ;
			table_switch_mode_control_S_AXI_ARADDR = 0 ;
			table_switch_mode_control_S_AXI_ARVALID = 0 ;
			table_rank_calc_mode_control_S_AXI_ARADDR = 0 ;
			table_rank_calc_mode_control_S_AXI_ARVALID = 0 ;
		end
		else  begin
			if ( ( ( ( control_S_AXI_ARADDR >= 512 ) && ( control_S_AXI_ARADDR <= 767 ) ) && control_S_AXI_ARVALID ) ) begin
				table_l2_switch_control_S_AXI_ARADDR = 0 ;
				table_l2_switch_control_S_AXI_ARVALID = 0 ;
				table_l1_switch_control_S_AXI_ARADDR = 0 ;
				table_l1_switch_control_S_AXI_ARVALID = 0 ;
				control_S_AXI_ARREADY = table_strict_priority_control_S_AXI_ARREADY ;
				table_strict_priority_control_S_AXI_ARADDR = control_S_AXI_ARADDR[7:0] ;
				table_strict_priority_control_S_AXI_ARVALID = control_S_AXI_ARVALID ;
				table_switch_mode_control_S_AXI_ARADDR = 0 ;
				table_switch_mode_control_S_AXI_ARVALID = 0 ;
				table_rank_calc_mode_control_S_AXI_ARADDR = 0 ;
				table_rank_calc_mode_control_S_AXI_ARVALID = 0 ;
			end
			else  begin
				if ( ( ( ( control_S_AXI_ARADDR >= 768 ) && ( control_S_AXI_ARADDR <= 1023 ) ) && control_S_AXI_ARVALID ) ) begin
					table_l2_switch_control_S_AXI_ARADDR = 0 ;
					table_l2_switch_control_S_AXI_ARVALID = 0 ;
					table_l1_switch_control_S_AXI_ARADDR = 0 ;
					table_l1_switch_control_S_AXI_ARVALID = 0 ;
					table_strict_priority_control_S_AXI_ARADDR = 0 ;
					table_strict_priority_control_S_AXI_ARVALID = 0 ;
					control_S_AXI_ARREADY = table_switch_mode_control_S_AXI_ARREADY ;
					table_switch_mode_control_S_AXI_ARADDR = control_S_AXI_ARADDR[7:0] ;
					table_switch_mode_control_S_AXI_ARVALID = control_S_AXI_ARVALID ;
					table_rank_calc_mode_control_S_AXI_ARADDR = 0 ;
					table_rank_calc_mode_control_S_AXI_ARVALID = 0 ;
				end
				else  begin
					if ( ( ( ( control_S_AXI_ARADDR >= 1024 ) && ( control_S_AXI_ARADDR <= 1279 ) ) && control_S_AXI_ARVALID ) ) begin
						table_l2_switch_control_S_AXI_ARADDR = 0 ;
						table_l2_switch_control_S_AXI_ARVALID = 0 ;
						table_l1_switch_control_S_AXI_ARADDR = 0 ;
						table_l1_switch_control_S_AXI_ARVALID = 0 ;
						table_strict_priority_control_S_AXI_ARADDR = 0 ;
						table_strict_priority_control_S_AXI_ARVALID = 0 ;
						table_switch_mode_control_S_AXI_ARADDR = 0 ;
						table_switch_mode_control_S_AXI_ARVALID = 0 ;
						control_S_AXI_ARREADY = table_rank_calc_mode_control_S_AXI_ARREADY ;
						table_rank_calc_mode_control_S_AXI_ARADDR = control_S_AXI_ARADDR[7:0] ;
						table_rank_calc_mode_control_S_AXI_ARVALID = control_S_AXI_ARVALID ;
					end
					else  begin
						control_S_AXI_ARREADY = 0 ;
						table_l2_switch_control_S_AXI_ARADDR = 0 ;
						table_l2_switch_control_S_AXI_ARVALID = 0 ;
						table_l1_switch_control_S_AXI_ARADDR = 0 ;
						table_l1_switch_control_S_AXI_ARVALID = 0 ;
						table_strict_priority_control_S_AXI_ARADDR = 0 ;
						table_strict_priority_control_S_AXI_ARVALID = 0 ;
						table_switch_mode_control_S_AXI_ARADDR = 0 ;
						table_switch_mode_control_S_AXI_ARVALID = 0 ;
						table_rank_calc_mode_control_S_AXI_ARADDR = 0 ;
						table_rank_calc_mode_control_S_AXI_ARVALID = 0 ;
					end
				end
			end
		end
	end
	if ( table_l2_switch_control_S_AXI_RVALID ) begin
		control_S_AXI_RDATA = table_l2_switch_control_S_AXI_RDATA ;
		control_S_AXI_RRESP = table_l2_switch_control_S_AXI_RRESP ;
		control_S_AXI_RVALID = table_l2_switch_control_S_AXI_RVALID ;
		table_l2_switch_control_S_AXI_RREADY = control_S_AXI_RREADY ;
		table_l1_switch_control_S_AXI_RREADY = 0 ;
		table_strict_priority_control_S_AXI_RREADY = 0 ;
		table_switch_mode_control_S_AXI_RREADY = 0 ;
		table_rank_calc_mode_control_S_AXI_RREADY = 0 ;
	end
	else  begin
		if ( table_l1_switch_control_S_AXI_RVALID ) begin
			control_S_AXI_RDATA = table_l1_switch_control_S_AXI_RDATA ;
			control_S_AXI_RRESP = table_l1_switch_control_S_AXI_RRESP ;
			control_S_AXI_RVALID = table_l1_switch_control_S_AXI_RVALID ;
			table_l2_switch_control_S_AXI_RREADY = 0 ;
			table_l1_switch_control_S_AXI_RREADY = control_S_AXI_RREADY ;
			table_strict_priority_control_S_AXI_RREADY = 0 ;
			table_switch_mode_control_S_AXI_RREADY = 0 ;
			table_rank_calc_mode_control_S_AXI_RREADY = 0 ;
		end
		else  begin
			if ( table_strict_priority_control_S_AXI_RVALID ) begin
				control_S_AXI_RDATA = table_strict_priority_control_S_AXI_RDATA ;
				control_S_AXI_RRESP = table_strict_priority_control_S_AXI_RRESP ;
				control_S_AXI_RVALID = table_strict_priority_control_S_AXI_RVALID ;
				table_l2_switch_control_S_AXI_RREADY = 0 ;
				table_l1_switch_control_S_AXI_RREADY = 0 ;
				table_strict_priority_control_S_AXI_RREADY = control_S_AXI_RREADY ;
				table_switch_mode_control_S_AXI_RREADY = 0 ;
				table_rank_calc_mode_control_S_AXI_RREADY = 0 ;
			end
			else  begin
				if ( table_switch_mode_control_S_AXI_RVALID ) begin
					control_S_AXI_RDATA = table_switch_mode_control_S_AXI_RDATA ;
					control_S_AXI_RRESP = table_switch_mode_control_S_AXI_RRESP ;
					control_S_AXI_RVALID = table_switch_mode_control_S_AXI_RVALID ;
					table_l2_switch_control_S_AXI_RREADY = 0 ;
					table_l1_switch_control_S_AXI_RREADY = 0 ;
					table_strict_priority_control_S_AXI_RREADY = 0 ;
					table_switch_mode_control_S_AXI_RREADY = control_S_AXI_RREADY ;
					table_rank_calc_mode_control_S_AXI_RREADY = 0 ;
				end
				else  begin
					if ( table_rank_calc_mode_control_S_AXI_RVALID ) begin
						control_S_AXI_RDATA = table_rank_calc_mode_control_S_AXI_RDATA ;
						control_S_AXI_RRESP = table_rank_calc_mode_control_S_AXI_RRESP ;
						control_S_AXI_RVALID = table_rank_calc_mode_control_S_AXI_RVALID ;
						table_l2_switch_control_S_AXI_RREADY = 0 ;
						table_l1_switch_control_S_AXI_RREADY = 0 ;
						table_strict_priority_control_S_AXI_RREADY = 0 ;
						table_switch_mode_control_S_AXI_RREADY = 0 ;
						table_rank_calc_mode_control_S_AXI_RREADY = control_S_AXI_RREADY ;
					end
					else  begin
						control_S_AXI_RDATA = 0 ;
						control_S_AXI_RRESP = 0 ;
						control_S_AXI_RVALID = 0 ;
						table_l2_switch_control_S_AXI_RREADY = 0 ;
						table_l1_switch_control_S_AXI_RREADY = 0 ;
						table_strict_priority_control_S_AXI_RREADY = 0 ;
						table_switch_mode_control_S_AXI_RREADY = 0 ;
						table_rank_calc_mode_control_S_AXI_RREADY = 0 ;
					end
				end
			end
		end
	end
end


endmodule

// machine-generated file - do NOT modify by hand !
// File created on 2020/10/07 15:07:47
// by Barista HDL generation library, version TRUNK @ 1007984

