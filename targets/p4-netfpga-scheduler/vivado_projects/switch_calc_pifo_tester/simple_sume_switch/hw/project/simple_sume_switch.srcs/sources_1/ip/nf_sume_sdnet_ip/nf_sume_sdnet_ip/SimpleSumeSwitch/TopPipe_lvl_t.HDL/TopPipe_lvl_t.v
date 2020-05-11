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

 tx latency = 2 (cycles)
 min latency = 3 (cycles)
 max latency = 3 (cycles)

input/output tuple 'control'
	section 3-bit field @ [18:16]
	activeBank 1-bit field @ [15:15]
	offset 11-bit field @ [14:4]
	done 1-bit field @ [3:3]
	errorCode 3-bit field @ [2:0]

output tuple 'TopPipe_fl'
	result_1 32-bit field @ [31:0]

input/output tuple 'digest_data'
	unused 256-bit field @ [255:0]

output tuple 'local_state'
	id 16-bit field @ [15:0]

input/output tuple 'p'
	ethernet_isValid 1-bit field @ [102:102]
	ethernet_dstAddr 48-bit field @ [101:54]
	ethernet_srcAddr 48-bit field @ [53:6]
	calc_isValid 1-bit field @ [5:5]
	calc_class_id 5-bit field @ [4:0]

input/output tuple 'sume_metadata'
	pifo_info 32-bit field @ [159:128]
	dma_q_size 16-bit field @ [127:112]
	nf3_q_size 16-bit field @ [111:96]
	nf2_q_size 16-bit field @ [95:80]
	nf1_q_size 16-bit field @ [79:64]
	nf0_q_size 16-bit field @ [63:48]
	send_dig_to_cpu 8-bit field @ [47:40]
	drop 8-bit field @ [39:32]
	dst_port 8-bit field @ [31:24]
	src_port 8-bit field @ [23:16]
	pkt_len 16-bit field @ [15:0]

input/output tuple 'user_metadata'
	unused 8-bit field @ [7:0]

output tuple 'table_calc_req'
	lookup_request_key 48-bit field @ [47:0]

*/

`timescale 1 ps / 1 ps

module TopPipe_lvl_t (
	rst,
	clk_line,
	tuple_in_digest_data_VALID,
	tuple_in_digest_data_DATA,
	tuple_in_p_VALID,
	tuple_in_p_DATA,
	tuple_in_sume_metadata_VALID,
	tuple_in_sume_metadata_DATA,
	tuple_in_user_metadata_VALID,
	tuple_in_user_metadata_DATA,
	tuple_out_TopPipe_fl_VALID,
	tuple_out_TopPipe_fl_DATA,
	tuple_out_digest_data_VALID,
	tuple_out_digest_data_DATA,
	tuple_out_local_state_VALID,
	tuple_out_local_state_DATA,
	tuple_out_p_VALID,
	tuple_out_p_DATA,
	tuple_out_sume_metadata_VALID,
	tuple_out_sume_metadata_DATA,
	tuple_out_user_metadata_VALID,
	tuple_out_user_metadata_DATA,
	tuple_out_table_calc_req_VALID,
	tuple_out_table_calc_req_DATA
);

input rst ;
input clk_line ;
input tuple_in_digest_data_VALID ;
input [255:0] tuple_in_digest_data_DATA ;
input tuple_in_p_VALID /* unused */ ;
input [102:0] tuple_in_p_DATA ;
input tuple_in_sume_metadata_VALID /* unused */ ;
input [159:0] tuple_in_sume_metadata_DATA ;
input tuple_in_user_metadata_VALID /* unused */ ;
input [7:0] tuple_in_user_metadata_DATA ;
output tuple_out_TopPipe_fl_VALID ;
output [31:0] tuple_out_TopPipe_fl_DATA ;
output tuple_out_digest_data_VALID ;
output [255:0] tuple_out_digest_data_DATA ;
output tuple_out_local_state_VALID ;
output [15:0] tuple_out_local_state_DATA ;
output tuple_out_p_VALID ;
output [102:0] tuple_out_p_DATA ;
output tuple_out_sume_metadata_VALID ;
output [159:0] tuple_out_sume_metadata_DATA ;
output tuple_out_user_metadata_VALID ;
output [7:0] tuple_out_user_metadata_DATA ;
output tuple_out_table_calc_req_VALID ;
output [47:0] tuple_out_table_calc_req_DATA ;

wire [18:0] tuple_in_control_DATA ;
wire tuple_in_valid ;
reg [18:0] tuple_in_control_i ;
wire [255:0] tuple_in_digest_data ;
wire [102:0] tuple_in_p ;
wire [159:0] tuple_in_sume_metadata ;
wire [7:0] tuple_in_user_metadata ;
wire tuple_out_valid ;
wire tuple_out_TopPipe_fl_VALID ;
wire [31:0] tuple_out_TopPipe_fl_DATA ;
wire [31:0] tuple_out_TopPipe_fl ;
wire tuple_out_digest_data_VALID ;
wire [255:0] tuple_out_digest_data_DATA ;
wire [255:0] tuple_out_digest_data ;
wire tuple_out_local_state_VALID ;
wire [15:0] tuple_out_local_state_DATA ;
wire [15:0] tuple_out_local_state ;
wire tuple_out_p_VALID ;
wire [102:0] tuple_out_p_DATA ;
wire [102:0] tuple_out_p ;
wire tuple_out_sume_metadata_VALID ;
wire [159:0] tuple_out_sume_metadata_DATA ;
wire [159:0] tuple_out_sume_metadata ;
wire tuple_out_user_metadata_VALID ;
wire [7:0] tuple_out_user_metadata_DATA ;
wire [7:0] tuple_out_user_metadata ;
wire tuple_out_table_calc_req_VALID ;
wire [47:0] tuple_out_table_calc_req_DATA ;
wire [47:0] tuple_out_table_calc_req ;

assign tuple_in_control_DATA = 0 ;

assign tuple_in_valid = tuple_in_digest_data_VALID ;

always @* begin
	tuple_in_control_i = 0 ;
	if ( ( tuple_in_control_DATA[3] == 0 ) ) begin
		tuple_in_control_i[18:16] = 1 ;
	end
end

assign tuple_in_digest_data = tuple_in_digest_data_DATA ;

assign tuple_in_p = tuple_in_p_DATA ;

assign tuple_in_sume_metadata = tuple_in_sume_metadata_DATA ;

assign tuple_in_user_metadata = tuple_in_user_metadata_DATA ;

assign tuple_out_TopPipe_fl_VALID = tuple_out_valid ;

assign tuple_out_TopPipe_fl_DATA = tuple_out_TopPipe_fl ;

assign tuple_out_digest_data_VALID = tuple_out_valid ;

assign tuple_out_digest_data_DATA = tuple_out_digest_data ;

assign tuple_out_local_state_VALID = tuple_out_valid ;

assign tuple_out_local_state_DATA = tuple_out_local_state ;

assign tuple_out_p_VALID = tuple_out_valid ;

assign tuple_out_p_DATA = tuple_out_p ;

assign tuple_out_sume_metadata_VALID = tuple_out_valid ;

assign tuple_out_sume_metadata_DATA = tuple_out_sume_metadata ;

assign tuple_out_user_metadata_VALID = tuple_out_valid ;

assign tuple_out_user_metadata_DATA = tuple_out_user_metadata ;

assign tuple_out_table_calc_req_VALID = tuple_out_valid ;

assign tuple_out_table_calc_req_DATA = tuple_out_table_calc_req ;

TopPipe_lvl_t_Engine
TopPipe_lvl_t_inst
(
	.reset               	( rst ),
	.clock               	( clk_line ),
	.RX_TUPLE_VALID      	( tuple_in_valid ),
	.RX_TUPLE_control    	( tuple_in_control_i ),
	.TX_TUPLE_VALID      	( tuple_out_valid ),
	.TX_TUPLE_control    	(  ),
	.TX_TUPLE_TopPipe_fl 	( tuple_out_TopPipe_fl ),
	.RX_TUPLE_digest_data	( tuple_in_digest_data ),
	.TX_TUPLE_digest_data	( tuple_out_digest_data ),
	.TX_TUPLE_local_state	( tuple_out_local_state ),
	.RX_TUPLE_p          	( tuple_in_p ),
	.TX_TUPLE_p          	( tuple_out_p ),
	.RX_TUPLE_sume_metadata	( tuple_in_sume_metadata ),
	.TX_TUPLE_sume_metadata	( tuple_out_sume_metadata ),
	.RX_TUPLE_user_metadata	( tuple_in_user_metadata ),
	.TX_TUPLE_user_metadata	( tuple_out_user_metadata ),
	.TX_TUPLE_table_calc_req	( tuple_out_table_calc_req ),
	.RX_PKT_RDY          	(  ),
	.TX_PKT_RDY          	( 1'd1 ),
	.RX_PKT_VLD          	( tuple_in_valid ),
	.RX_PKT_SOP          	( tuple_in_valid ),
	.RX_PKT_EOP          	( tuple_in_valid ),
	.RX_PKT_ERR          	( 1'b0 ),
	.RX_PKT_CNT          	( 1'b0 ),
	.RX_PKT_DAT          	( 8'b0 ),
	.TX_PKT_VLD          	(  ),
	.TX_PKT_SOP          	(  ),
	.TX_PKT_EOP          	(  ),
	.TX_PKT_ERR          	(  ),
	.TX_PKT_CNT          	(  ),
	.TX_PKT_DAT          	(  )
);


endmodule

// machine-generated file - do NOT modify by hand !
// File created on 2020/04/16 20:38:08
// by Barista HDL generation library, version TRUNK @ 1007984

