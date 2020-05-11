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
	table_calc_control_S_AXI_AWREADY,
	table_calc_control_S_AXI_WREADY,
	table_calc_control_S_AXI_BRESP,
	table_calc_control_S_AXI_BVALID,
	table_calc_control_S_AXI_ARREADY,
	table_calc_control_S_AXI_RDATA,
	table_calc_control_S_AXI_RRESP,
	table_calc_control_S_AXI_RVALID,
	table_calc_control_S_AXI_AWADDR,
	table_calc_control_S_AXI_AWVALID,
	table_calc_control_S_AXI_WDATA,
	table_calc_control_S_AXI_WSTRB,
	table_calc_control_S_AXI_WVALID,
	table_calc_control_S_AXI_BREADY,
	table_calc_control_S_AXI_ARADDR,
	table_calc_control_S_AXI_ARVALID,
	table_calc_control_S_AXI_RREADY,
	rankcalc_wrr_calc_0_control_S_AXI_AWREADY,
	rankcalc_wrr_calc_0_control_S_AXI_WREADY,
	rankcalc_wrr_calc_0_control_S_AXI_BRESP,
	rankcalc_wrr_calc_0_control_S_AXI_BVALID,
	rankcalc_wrr_calc_0_control_S_AXI_ARREADY,
	rankcalc_wrr_calc_0_control_S_AXI_RDATA,
	rankcalc_wrr_calc_0_control_S_AXI_RRESP,
	rankcalc_wrr_calc_0_control_S_AXI_RVALID,
	rankcalc_wrr_calc_0_control_S_AXI_AWADDR,
	rankcalc_wrr_calc_0_control_S_AXI_AWVALID,
	rankcalc_wrr_calc_0_control_S_AXI_WDATA,
	rankcalc_wrr_calc_0_control_S_AXI_WSTRB,
	rankcalc_wrr_calc_0_control_S_AXI_WVALID,
	rankcalc_wrr_calc_0_control_S_AXI_BREADY,
	rankcalc_wrr_calc_0_control_S_AXI_ARADDR,
	rankcalc_wrr_calc_0_control_S_AXI_ARVALID,
	rankcalc_wrr_calc_0_control_S_AXI_RREADY
);

input clk_control /* unused */ ;
output enable_processing ;
input rst /* unused */ ;
input [8:0] control_S_AXI_AWADDR ;
input control_S_AXI_AWVALID ;
input [31:0] control_S_AXI_WDATA ;
input [3:0] control_S_AXI_WSTRB ;
input control_S_AXI_WVALID ;
input control_S_AXI_BREADY ;
input [8:0] control_S_AXI_ARADDR ;
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
input table_calc_control_S_AXI_AWREADY ;
input table_calc_control_S_AXI_WREADY ;
input [1:0] table_calc_control_S_AXI_BRESP ;
input table_calc_control_S_AXI_BVALID ;
input table_calc_control_S_AXI_ARREADY ;
input [31:0] table_calc_control_S_AXI_RDATA ;
input [1:0] table_calc_control_S_AXI_RRESP ;
input table_calc_control_S_AXI_RVALID ;
output [7:0] table_calc_control_S_AXI_AWADDR ;
output table_calc_control_S_AXI_AWVALID ;
output [31:0] table_calc_control_S_AXI_WDATA ;
output [3:0] table_calc_control_S_AXI_WSTRB ;
output table_calc_control_S_AXI_WVALID ;
output table_calc_control_S_AXI_BREADY ;
output [7:0] table_calc_control_S_AXI_ARADDR ;
output table_calc_control_S_AXI_ARVALID ;
output table_calc_control_S_AXI_RREADY ;
input rankcalc_wrr_calc_0_control_S_AXI_AWREADY ;
input rankcalc_wrr_calc_0_control_S_AXI_WREADY ;
input [1:0] rankcalc_wrr_calc_0_control_S_AXI_BRESP ;
input rankcalc_wrr_calc_0_control_S_AXI_BVALID ;
input rankcalc_wrr_calc_0_control_S_AXI_ARREADY ;
input [31:0] rankcalc_wrr_calc_0_control_S_AXI_RDATA ;
input [1:0] rankcalc_wrr_calc_0_control_S_AXI_RRESP ;
input rankcalc_wrr_calc_0_control_S_AXI_RVALID ;
output [7:0] rankcalc_wrr_calc_0_control_S_AXI_AWADDR ;
output rankcalc_wrr_calc_0_control_S_AXI_AWVALID ;
output [31:0] rankcalc_wrr_calc_0_control_S_AXI_WDATA ;
output [3:0] rankcalc_wrr_calc_0_control_S_AXI_WSTRB ;
output rankcalc_wrr_calc_0_control_S_AXI_WVALID ;
output rankcalc_wrr_calc_0_control_S_AXI_BREADY ;
output [7:0] rankcalc_wrr_calc_0_control_S_AXI_ARADDR ;
output rankcalc_wrr_calc_0_control_S_AXI_ARVALID ;
output rankcalc_wrr_calc_0_control_S_AXI_RREADY ;

wire enable_processing ;
reg control_S_AXI_AWREADY ;
reg control_S_AXI_WREADY ;
reg [1:0] control_S_AXI_BRESP ;
reg control_S_AXI_BVALID ;
reg control_S_AXI_ARREADY ;
reg [31:0] control_S_AXI_RDATA ;
reg [1:0] control_S_AXI_RRESP ;
reg control_S_AXI_RVALID ;
reg [7:0] table_calc_control_S_AXI_AWADDR ;
reg table_calc_control_S_AXI_AWVALID ;
reg [31:0] table_calc_control_S_AXI_WDATA ;
reg [3:0] table_calc_control_S_AXI_WSTRB ;
reg table_calc_control_S_AXI_WVALID ;
reg table_calc_control_S_AXI_BREADY ;
reg [7:0] table_calc_control_S_AXI_ARADDR ;
reg table_calc_control_S_AXI_ARVALID ;
reg table_calc_control_S_AXI_RREADY ;
reg [7:0] rankcalc_wrr_calc_0_control_S_AXI_AWADDR ;
reg rankcalc_wrr_calc_0_control_S_AXI_AWVALID ;
reg [31:0] rankcalc_wrr_calc_0_control_S_AXI_WDATA ;
reg [3:0] rankcalc_wrr_calc_0_control_S_AXI_WSTRB ;
reg rankcalc_wrr_calc_0_control_S_AXI_WVALID ;
reg rankcalc_wrr_calc_0_control_S_AXI_BREADY ;
reg [7:0] rankcalc_wrr_calc_0_control_S_AXI_ARADDR ;
reg rankcalc_wrr_calc_0_control_S_AXI_ARVALID ;
reg rankcalc_wrr_calc_0_control_S_AXI_RREADY ;

assign enable_processing = 1'd1 ;

always @* begin
	table_calc_control_S_AXI_AWADDR = control_S_AXI_AWADDR[7:0] ;
	table_calc_control_S_AXI_WDATA = control_S_AXI_WDATA ;
	table_calc_control_S_AXI_WSTRB = control_S_AXI_WSTRB ;
	rankcalc_wrr_calc_0_control_S_AXI_AWADDR = control_S_AXI_AWADDR[7:0] ;
	rankcalc_wrr_calc_0_control_S_AXI_WDATA = control_S_AXI_WDATA ;
	rankcalc_wrr_calc_0_control_S_AXI_WSTRB = control_S_AXI_WSTRB ;
	if ( ( ( ( control_S_AXI_AWADDR >= 0 ) && ( control_S_AXI_AWADDR <= 255 ) ) && control_S_AXI_AWVALID ) ) begin
		control_S_AXI_AWREADY = table_calc_control_S_AXI_AWREADY ;
		control_S_AXI_WREADY = table_calc_control_S_AXI_WREADY ;
		table_calc_control_S_AXI_AWVALID = control_S_AXI_AWVALID ;
		table_calc_control_S_AXI_WVALID = control_S_AXI_WVALID ;
		rankcalc_wrr_calc_0_control_S_AXI_AWVALID = 0 ;
		rankcalc_wrr_calc_0_control_S_AXI_WVALID = 0 ;
	end
	else  begin
		if ( ( ( ( control_S_AXI_AWADDR >= 256 ) && ( control_S_AXI_AWADDR <= 511 ) ) && control_S_AXI_AWVALID ) ) begin
			table_calc_control_S_AXI_AWVALID = 0 ;
			table_calc_control_S_AXI_WVALID = 0 ;
			control_S_AXI_AWREADY = rankcalc_wrr_calc_0_control_S_AXI_AWREADY ;
			control_S_AXI_WREADY = rankcalc_wrr_calc_0_control_S_AXI_WREADY ;
			rankcalc_wrr_calc_0_control_S_AXI_AWVALID = control_S_AXI_AWVALID ;
			rankcalc_wrr_calc_0_control_S_AXI_WVALID = control_S_AXI_WVALID ;
		end
		else  begin
			control_S_AXI_AWREADY = 0 ;
			control_S_AXI_WREADY = 0 ;
			table_calc_control_S_AXI_AWVALID = 0 ;
			table_calc_control_S_AXI_WVALID = 0 ;
			rankcalc_wrr_calc_0_control_S_AXI_AWVALID = 0 ;
			rankcalc_wrr_calc_0_control_S_AXI_WVALID = 0 ;
		end
	end
	if ( table_calc_control_S_AXI_BVALID ) begin
		control_S_AXI_BRESP = table_calc_control_S_AXI_BRESP ;
		control_S_AXI_BVALID = table_calc_control_S_AXI_BVALID ;
		table_calc_control_S_AXI_BREADY = control_S_AXI_BREADY ;
		rankcalc_wrr_calc_0_control_S_AXI_BREADY = 0 ;
	end
	else  begin
		if ( rankcalc_wrr_calc_0_control_S_AXI_BVALID ) begin
			control_S_AXI_BRESP = rankcalc_wrr_calc_0_control_S_AXI_BRESP ;
			control_S_AXI_BVALID = rankcalc_wrr_calc_0_control_S_AXI_BVALID ;
			table_calc_control_S_AXI_BREADY = 0 ;
			rankcalc_wrr_calc_0_control_S_AXI_BREADY = control_S_AXI_BREADY ;
		end
		else  begin
			control_S_AXI_BRESP = 0 ;
			control_S_AXI_BVALID = 0 ;
			table_calc_control_S_AXI_BREADY = 0 ;
			rankcalc_wrr_calc_0_control_S_AXI_BREADY = 0 ;
		end
	end
	if ( ( ( ( control_S_AXI_ARADDR >= 0 ) && ( control_S_AXI_ARADDR <= 255 ) ) && control_S_AXI_ARVALID ) ) begin
		control_S_AXI_ARREADY = table_calc_control_S_AXI_ARREADY ;
		table_calc_control_S_AXI_ARADDR = control_S_AXI_ARADDR[7:0] ;
		table_calc_control_S_AXI_ARVALID = control_S_AXI_ARVALID ;
		rankcalc_wrr_calc_0_control_S_AXI_ARADDR = 0 ;
		rankcalc_wrr_calc_0_control_S_AXI_ARVALID = 0 ;
	end
	else  begin
		if ( ( ( ( control_S_AXI_ARADDR >= 256 ) && ( control_S_AXI_ARADDR <= 511 ) ) && control_S_AXI_ARVALID ) ) begin
			table_calc_control_S_AXI_ARADDR = 0 ;
			table_calc_control_S_AXI_ARVALID = 0 ;
			control_S_AXI_ARREADY = rankcalc_wrr_calc_0_control_S_AXI_ARREADY ;
			rankcalc_wrr_calc_0_control_S_AXI_ARADDR = control_S_AXI_ARADDR[7:0] ;
			rankcalc_wrr_calc_0_control_S_AXI_ARVALID = control_S_AXI_ARVALID ;
		end
		else  begin
			control_S_AXI_ARREADY = 0 ;
			table_calc_control_S_AXI_ARADDR = 0 ;
			table_calc_control_S_AXI_ARVALID = 0 ;
			rankcalc_wrr_calc_0_control_S_AXI_ARADDR = 0 ;
			rankcalc_wrr_calc_0_control_S_AXI_ARVALID = 0 ;
		end
	end
	if ( table_calc_control_S_AXI_RVALID ) begin
		control_S_AXI_RDATA = table_calc_control_S_AXI_RDATA ;
		control_S_AXI_RRESP = table_calc_control_S_AXI_RRESP ;
		control_S_AXI_RVALID = table_calc_control_S_AXI_RVALID ;
		table_calc_control_S_AXI_RREADY = control_S_AXI_RREADY ;
		rankcalc_wrr_calc_0_control_S_AXI_RREADY = 0 ;
	end
	else  begin
		if ( rankcalc_wrr_calc_0_control_S_AXI_RVALID ) begin
			control_S_AXI_RDATA = rankcalc_wrr_calc_0_control_S_AXI_RDATA ;
			control_S_AXI_RRESP = rankcalc_wrr_calc_0_control_S_AXI_RRESP ;
			control_S_AXI_RVALID = rankcalc_wrr_calc_0_control_S_AXI_RVALID ;
			table_calc_control_S_AXI_RREADY = 0 ;
			rankcalc_wrr_calc_0_control_S_AXI_RREADY = control_S_AXI_RREADY ;
		end
		else  begin
			control_S_AXI_RDATA = 0 ;
			control_S_AXI_RRESP = 0 ;
			control_S_AXI_RVALID = 0 ;
			table_calc_control_S_AXI_RREADY = 0 ;
			rankcalc_wrr_calc_0_control_S_AXI_RREADY = 0 ;
		end
	end
end


endmodule

// machine-generated file - do NOT modify by hand !
// File created on 2020/04/16 20:38:09
// by Barista HDL generation library, version TRUNK @ 1007984

