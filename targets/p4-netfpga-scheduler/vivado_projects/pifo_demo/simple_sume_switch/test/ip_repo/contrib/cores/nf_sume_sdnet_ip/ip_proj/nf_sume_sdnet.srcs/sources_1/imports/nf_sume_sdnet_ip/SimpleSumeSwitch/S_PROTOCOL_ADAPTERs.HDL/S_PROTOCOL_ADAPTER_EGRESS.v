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

module S_PROTOCOL_ADAPTER_EGRESS (
	clk_line,
	rst,
	tuple_in_control_VALID,
	tuple_in_control_DATA,
	packet_in_SOF,
	packet_in_EOF,
	packet_in_VAL,
	packet_in_RDY,
	packet_in_DAT,
	packet_in_ERR,
	packet_in_CNT,
	packet_out_TLAST,
	packet_out_TVALID,
	packet_out_TREADY,
	packet_out_TDATA,
	packet_out_TKEEP
);

input clk_line ;
input rst ;
input tuple_in_control_VALID /* unused */ ;
input [21:0] tuple_in_control_DATA /* unused */ ;
input packet_in_SOF ;
input packet_in_EOF ;
input packet_in_VAL ;
output packet_in_RDY ;
input [255:0] packet_in_DAT ;
input packet_in_ERR /* unused */ ;
input [5:0] packet_in_CNT ;
output packet_out_TLAST ;
output packet_out_TVALID ;
input packet_out_TREADY ;
output [255:0] packet_out_TDATA /* undriven */ ;
output [31:0] packet_out_TKEEP /* undriven */ ;

wire packet_in_RDY ;
reg packet_out_TLAST ;
reg packet_out_TVALID ;
wire [255:0] packet_out_TDATA /* undriven */ ;
wire [31:0] packet_out_TKEEP /* undriven */ ;
reg [255:0] packet_out_TDATA_i /* unused */ ;
reg [31:0] packet_out_TKEEP_i /* unused */ ;

always @( posedge clk_line ) begin
	if ( rst ) begin
		packet_out_TLAST <= 0 ;
	end
	else  begin
		if ( ( ( packet_in_SOF && packet_in_EOF ) && ( packet_in_CNT == 0 ) ) ) begin
			packet_out_TLAST <= 1 ;
		end
		else  begin
			packet_out_TLAST <= packet_in_EOF ;
		end
	end
end

assign packet_in_RDY = packet_out_TREADY ;

always @( posedge clk_line ) begin
	packet_out_TVALID <= packet_in_VAL ;
	packet_out_TDATA_i <= packet_in_DAT ;
end

always @( posedge clk_line ) begin
	packet_out_TKEEP_i <= ( packet_in_EOF ? ~( { 32{1'd1} } >> packet_in_CNT ) : { 32{1'd1} } ) ;
end



genvar i;
genvar j;
for (i=0; i<32; i=i+1) 
    for (j=0; j<8; j=j+1) 
        assign packet_out_TDATA[i*8+j] = packet_out_TDATA_i[(32-i-1)*8+j];
for (i=0; i<32; i=i+1) assign packet_out_TKEEP[i] = packet_out_TKEEP_i[31-i];


endmodule

// machine-generated file - do NOT modify by hand !
// File created on 2019/11/21 22:45:49
// by Barista HDL generation library, version TRUNK @ 1007984

