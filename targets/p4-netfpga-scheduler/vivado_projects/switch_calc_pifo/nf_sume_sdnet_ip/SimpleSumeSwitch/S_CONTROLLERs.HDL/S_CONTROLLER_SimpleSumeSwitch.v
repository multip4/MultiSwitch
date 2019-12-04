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
	lookup_table_control_S_AXI_AWREADY,
	lookup_table_control_S_AXI_WREADY,
	lookup_table_control_S_AXI_BRESP,
	lookup_table_control_S_AXI_BVALID,
	lookup_table_control_S_AXI_ARREADY,
	lookup_table_control_S_AXI_RDATA,
	lookup_table_control_S_AXI_RRESP,
	lookup_table_control_S_AXI_RVALID,
	lookup_table_control_S_AXI_AWADDR,
	lookup_table_control_S_AXI_AWVALID,
	lookup_table_control_S_AXI_WDATA,
	lookup_table_control_S_AXI_WSTRB,
	lookup_table_control_S_AXI_WVALID,
	lookup_table_control_S_AXI_BREADY,
	lookup_table_control_S_AXI_ARADDR,
	lookup_table_control_S_AXI_ARVALID,
	lookup_table_control_S_AXI_RREADY,
	jk_reg_rw_0_control_S_AXI_AWREADY,
	jk_reg_rw_0_control_S_AXI_WREADY,
	jk_reg_rw_0_control_S_AXI_BRESP,
	jk_reg_rw_0_control_S_AXI_BVALID,
	jk_reg_rw_0_control_S_AXI_ARREADY,
	jk_reg_rw_0_control_S_AXI_RDATA,
	jk_reg_rw_0_control_S_AXI_RRESP,
	jk_reg_rw_0_control_S_AXI_RVALID,
	jk_reg_rw_0_control_S_AXI_AWADDR,
	jk_reg_rw_0_control_S_AXI_AWVALID,
	jk_reg_rw_0_control_S_AXI_WDATA,
	jk_reg_rw_0_control_S_AXI_WSTRB,
	jk_reg_rw_0_control_S_AXI_WVALID,
	jk_reg_rw_0_control_S_AXI_BREADY,
	jk_reg_rw_0_control_S_AXI_ARADDR,
	jk_reg_rw_0_control_S_AXI_ARVALID,
	jk_reg_rw_0_control_S_AXI_RREADY
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
input lookup_table_control_S_AXI_AWREADY ;
input lookup_table_control_S_AXI_WREADY ;
input [1:0] lookup_table_control_S_AXI_BRESP ;
input lookup_table_control_S_AXI_BVALID ;
input lookup_table_control_S_AXI_ARREADY ;
input [31:0] lookup_table_control_S_AXI_RDATA ;
input [1:0] lookup_table_control_S_AXI_RRESP ;
input lookup_table_control_S_AXI_RVALID ;
output [7:0] lookup_table_control_S_AXI_AWADDR ;
output lookup_table_control_S_AXI_AWVALID ;
output [31:0] lookup_table_control_S_AXI_WDATA ;
output [3:0] lookup_table_control_S_AXI_WSTRB ;
output lookup_table_control_S_AXI_WVALID ;
output lookup_table_control_S_AXI_BREADY ;
output [7:0] lookup_table_control_S_AXI_ARADDR ;
output lookup_table_control_S_AXI_ARVALID ;
output lookup_table_control_S_AXI_RREADY ;
input jk_reg_rw_0_control_S_AXI_AWREADY ;
input jk_reg_rw_0_control_S_AXI_WREADY ;
input [1:0] jk_reg_rw_0_control_S_AXI_BRESP ;
input jk_reg_rw_0_control_S_AXI_BVALID ;
input jk_reg_rw_0_control_S_AXI_ARREADY ;
input [31:0] jk_reg_rw_0_control_S_AXI_RDATA ;
input [1:0] jk_reg_rw_0_control_S_AXI_RRESP ;
input jk_reg_rw_0_control_S_AXI_RVALID ;
output [3:0] jk_reg_rw_0_control_S_AXI_AWADDR ;
output jk_reg_rw_0_control_S_AXI_AWVALID ;
output [31:0] jk_reg_rw_0_control_S_AXI_WDATA ;
output [3:0] jk_reg_rw_0_control_S_AXI_WSTRB ;
output jk_reg_rw_0_control_S_AXI_WVALID ;
output jk_reg_rw_0_control_S_AXI_BREADY ;
output [3:0] jk_reg_rw_0_control_S_AXI_ARADDR ;
output jk_reg_rw_0_control_S_AXI_ARVALID ;
output jk_reg_rw_0_control_S_AXI_RREADY ;

wire enable_processing ;
reg control_S_AXI_AWREADY ;
reg control_S_AXI_WREADY ;
reg [1:0] control_S_AXI_BRESP ;
reg control_S_AXI_BVALID ;
reg control_S_AXI_ARREADY ;
reg [31:0] control_S_AXI_RDATA ;
reg [1:0] control_S_AXI_RRESP ;
reg control_S_AXI_RVALID ;
reg [7:0] lookup_table_control_S_AXI_AWADDR ;
reg lookup_table_control_S_AXI_AWVALID ;
reg [31:0] lookup_table_control_S_AXI_WDATA ;
reg [3:0] lookup_table_control_S_AXI_WSTRB ;
reg lookup_table_control_S_AXI_WVALID ;
reg lookup_table_control_S_AXI_BREADY ;
reg [7:0] lookup_table_control_S_AXI_ARADDR ;
reg lookup_table_control_S_AXI_ARVALID ;
reg lookup_table_control_S_AXI_RREADY ;
reg [3:0] jk_reg_rw_0_control_S_AXI_AWADDR ;
reg jk_reg_rw_0_control_S_AXI_AWVALID ;
reg [31:0] jk_reg_rw_0_control_S_AXI_WDATA ;
reg [3:0] jk_reg_rw_0_control_S_AXI_WSTRB ;
reg jk_reg_rw_0_control_S_AXI_WVALID ;
reg jk_reg_rw_0_control_S_AXI_BREADY ;
reg [3:0] jk_reg_rw_0_control_S_AXI_ARADDR ;
reg jk_reg_rw_0_control_S_AXI_ARVALID ;
reg jk_reg_rw_0_control_S_AXI_RREADY ;

assign enable_processing = 1'd1 ;

always @* begin
	lookup_table_control_S_AXI_AWADDR = control_S_AXI_AWADDR[7:0] ;
	lookup_table_control_S_AXI_WDATA = control_S_AXI_WDATA ;
	lookup_table_control_S_AXI_WSTRB = control_S_AXI_WSTRB ;
	jk_reg_rw_0_control_S_AXI_AWADDR = control_S_AXI_AWADDR[7:0] ;
	jk_reg_rw_0_control_S_AXI_WDATA = control_S_AXI_WDATA ;
	jk_reg_rw_0_control_S_AXI_WSTRB = control_S_AXI_WSTRB ;
	if ( ( ( ( control_S_AXI_AWADDR >= 0 ) && ( control_S_AXI_AWADDR <= 255 ) ) && control_S_AXI_AWVALID ) ) begin
		control_S_AXI_AWREADY = lookup_table_control_S_AXI_AWREADY ;
		control_S_AXI_WREADY = lookup_table_control_S_AXI_WREADY ;
		lookup_table_control_S_AXI_AWVALID = control_S_AXI_AWVALID ;
		lookup_table_control_S_AXI_WVALID = control_S_AXI_WVALID ;
		jk_reg_rw_0_control_S_AXI_AWVALID = 0 ;
		jk_reg_rw_0_control_S_AXI_WVALID = 0 ;
	end
	else  begin
		if ( ( ( ( control_S_AXI_AWADDR >= 256 ) && ( control_S_AXI_AWADDR <= 511 ) ) && control_S_AXI_AWVALID ) ) begin
			lookup_table_control_S_AXI_AWVALID = 0 ;
			lookup_table_control_S_AXI_WVALID = 0 ;
			control_S_AXI_AWREADY = jk_reg_rw_0_control_S_AXI_AWREADY ;
			control_S_AXI_WREADY = jk_reg_rw_0_control_S_AXI_WREADY ;
			jk_reg_rw_0_control_S_AXI_AWVALID = control_S_AXI_AWVALID ;
			jk_reg_rw_0_control_S_AXI_WVALID = control_S_AXI_WVALID ;
		end
		else  begin
			control_S_AXI_AWREADY = 0 ;
			control_S_AXI_WREADY = 0 ;
			lookup_table_control_S_AXI_AWVALID = 0 ;
			lookup_table_control_S_AXI_WVALID = 0 ;
			jk_reg_rw_0_control_S_AXI_AWVALID = 0 ;
			jk_reg_rw_0_control_S_AXI_WVALID = 0 ;
		end
	end
	if ( lookup_table_control_S_AXI_BVALID ) begin
		control_S_AXI_BRESP = lookup_table_control_S_AXI_BRESP ;
		control_S_AXI_BVALID = lookup_table_control_S_AXI_BVALID ;
		lookup_table_control_S_AXI_BREADY = control_S_AXI_BREADY ;
		jk_reg_rw_0_control_S_AXI_BREADY = 0 ;
	end
	else  begin
		if ( jk_reg_rw_0_control_S_AXI_BVALID ) begin
			control_S_AXI_BRESP = jk_reg_rw_0_control_S_AXI_BRESP ;
			control_S_AXI_BVALID = jk_reg_rw_0_control_S_AXI_BVALID ;
			lookup_table_control_S_AXI_BREADY = 0 ;
			jk_reg_rw_0_control_S_AXI_BREADY = control_S_AXI_BREADY ;
		end
		else  begin
			control_S_AXI_BRESP = 0 ;
			control_S_AXI_BVALID = 0 ;
			lookup_table_control_S_AXI_BREADY = 0 ;
			jk_reg_rw_0_control_S_AXI_BREADY = 0 ;
		end
	end
	if ( ( ( ( control_S_AXI_ARADDR >= 0 ) && ( control_S_AXI_ARADDR <= 255 ) ) && control_S_AXI_ARVALID ) ) begin
		control_S_AXI_ARREADY = lookup_table_control_S_AXI_ARREADY ;
		lookup_table_control_S_AXI_ARADDR = control_S_AXI_ARADDR[7:0] ;
		lookup_table_control_S_AXI_ARVALID = control_S_AXI_ARVALID ;
		jk_reg_rw_0_control_S_AXI_ARADDR = 0 ;
		jk_reg_rw_0_control_S_AXI_ARVALID = 0 ;
	end
	else  begin
		if ( ( ( ( control_S_AXI_ARADDR >= 256 ) && ( control_S_AXI_ARADDR <= 511 ) ) && control_S_AXI_ARVALID ) ) begin
			lookup_table_control_S_AXI_ARADDR = 0 ;
			lookup_table_control_S_AXI_ARVALID = 0 ;
			control_S_AXI_ARREADY = jk_reg_rw_0_control_S_AXI_ARREADY ;
			jk_reg_rw_0_control_S_AXI_ARADDR = control_S_AXI_ARADDR[3:0] ;
			jk_reg_rw_0_control_S_AXI_ARVALID = control_S_AXI_ARVALID ;
		end
		else  begin
			control_S_AXI_ARREADY = 0 ;
			lookup_table_control_S_AXI_ARADDR = 0 ;
			lookup_table_control_S_AXI_ARVALID = 0 ;
			jk_reg_rw_0_control_S_AXI_ARADDR = 0 ;
			jk_reg_rw_0_control_S_AXI_ARVALID = 0 ;
		end
	end
	if ( lookup_table_control_S_AXI_RVALID ) begin
		control_S_AXI_RDATA = lookup_table_control_S_AXI_RDATA ;
		control_S_AXI_RRESP = lookup_table_control_S_AXI_RRESP ;
		control_S_AXI_RVALID = lookup_table_control_S_AXI_RVALID ;
		lookup_table_control_S_AXI_RREADY = control_S_AXI_RREADY ;
		jk_reg_rw_0_control_S_AXI_RREADY = 0 ;
	end
	else  begin
		if ( jk_reg_rw_0_control_S_AXI_RVALID ) begin
			control_S_AXI_RDATA = jk_reg_rw_0_control_S_AXI_RDATA ;
			control_S_AXI_RRESP = jk_reg_rw_0_control_S_AXI_RRESP ;
			control_S_AXI_RVALID = jk_reg_rw_0_control_S_AXI_RVALID ;
			lookup_table_control_S_AXI_RREADY = 0 ;
			jk_reg_rw_0_control_S_AXI_RREADY = control_S_AXI_RREADY ;
		end
		else  begin
			control_S_AXI_RDATA = 0 ;
			control_S_AXI_RRESP = 0 ;
			control_S_AXI_RVALID = 0 ;
			lookup_table_control_S_AXI_RREADY = 0 ;
			jk_reg_rw_0_control_S_AXI_RREADY = 0 ;
		end
	end
end


endmodule

// machine-generated file - do NOT modify by hand !
// File created on 2019/12/04 18:15:53
// by Barista HDL generation library, version TRUNK @ 1007984

