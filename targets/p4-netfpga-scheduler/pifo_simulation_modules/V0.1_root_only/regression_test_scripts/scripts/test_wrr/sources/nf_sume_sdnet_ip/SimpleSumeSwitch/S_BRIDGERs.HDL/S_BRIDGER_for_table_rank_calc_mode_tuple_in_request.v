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

module S_BRIDGER_for_table_rank_calc_mode_tuple_in_request (
	clk_line,
	clk_lookup,
	clk_line_rst_high,
	clk_lookup_rst_high,
	tuple_in_VALID,
	tuple_in_DATA,
	tuple_out_VALID,
	tuple_out_DATA
);

input clk_line ;
input clk_lookup ;
input clk_line_rst_high ;
input clk_lookup_rst_high /* unused */ ;
input tuple_in_VALID ;
input [47:0] tuple_in_DATA ;
output tuple_out_VALID ;
output [47:0] tuple_out_DATA /* undriven */ ;

wire empty /* undriven */ ;
wire full /* undriven */ ;
wire injectsbiterr ;
wire injectdbiterr ;
wire prog_full /* undriven */ ;
wire prog_empty /* undriven */ ;
wire [7:0] rd_data_count /* undriven */ ;
wire [7:0] wr_data_count /* undriven */ ;
wire rd_rst_busy /* undriven */ ;
wire wr_rst_busy /* undriven */ ;
wire overflow /* undriven */ ;
wire underflow /* undriven */ ;
wire sbiterr /* undriven */ ;
wire dbiterr /* undriven */ ;
wire rd_en ;
reg rd_en_d1 ;
wire almempty /* undriven */ ;
wire almfull /* undriven */ ;
wire dvalid /* undriven */ ;
wire wrack /* undriven */ ;
wire tuple_out_VALID ;
wire [47:0] tuple_out_DATA /* undriven */ ;

always @( posedge clk_lookup ) begin
	rd_en_d1 <= rd_en ;
end

assign injectsbiterr = 1'd0 ;

assign injectdbiterr = 1'd0 ;

assign rd_en = ~empty ;

assign tuple_out_VALID = rd_en_d1 ;

always @( posedge clk_lookup ) begin
	rd_en_d1 <= rd_en ;
end

// black box
xpm_fifo_async

#(
	.WRITE_DATA_WIDTH    	( 48 ),
	.FIFO_MEMORY_TYPE    	( 1651663213 ),
	.FIFO_WRITE_DEPTH    	( 256 ),
	.PROG_FULL_THRESH    	( 128 ),
	.PROG_EMPTY_THRESH   	( 3 ),
	.RD_DATA_COUNT_WIDTH 	( 8 ),
	.WR_DATA_COUNT_WIDTH 	( 8 ),
	.DOUT_RESET_VALUE    	( 48 )
)
myfifo
(
	.rst                 	( clk_line_rst_high ),
	.wr_clk              	( clk_line ),
	.wr_en               	( tuple_in_VALID ),
	.din                 	( tuple_in_DATA ),
	.dout                	( tuple_out_DATA ),
	.empty               	( empty ),
	.full                	( full ),
	.rd_clk              	( clk_lookup ),
	.rd_en               	( ~empty ),
	.sleep               	( 1'd0 ),
	.injectsbiterr       	( injectsbiterr ),
	.injectdbiterr       	( injectdbiterr ),
	.prog_full           	( prog_full ),
	.prog_empty          	( prog_empty ),
	.rd_data_count       	( rd_data_count ),
	.wr_data_count       	( wr_data_count ),
	.rd_rst_busy         	( rd_rst_busy ),
	.wr_rst_busy         	( wr_rst_busy ),
	.overflow            	( overflow ),
	.underflow           	( underflow ),
	.sbiterr             	( sbiterr ),
	.dbiterr             	( dbiterr ),
	.almost_empty        	( almempty ),
	.almost_full         	( almfull ),
	.data_valid          	( dvalid ),
	.wr_ack              	( wrack )
);


endmodule

// machine-generated file - do NOT modify by hand !
// File created on 2020/10/08 13:42:05
// by Barista HDL generation library, version TRUNK @ 1007984

