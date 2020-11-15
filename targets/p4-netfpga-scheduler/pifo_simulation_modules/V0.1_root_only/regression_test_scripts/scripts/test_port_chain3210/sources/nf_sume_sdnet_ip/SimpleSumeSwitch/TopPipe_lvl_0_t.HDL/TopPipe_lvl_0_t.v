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

 tx latency = 27 (cycles)
 min latency = 28 (cycles)
 max latency = 28 (cycles)

input/output tuple 'control'
	section 5-bit field @ [23:19]
	activeBank 1-bit field @ [18:18]
	offset 14-bit field @ [17:4]
	done 1-bit field @ [3:3]
	errorCode 3-bit field @ [2:0]

input/output tuple 'digest_data'
	unused 256-bit field @ [255:0]

input tuple 'local_state'
	id 16-bit field @ [15:0]

input/output tuple 'p'
	ethernet_isValid 1-bit field @ [273:273]
	ethernet_dstAddr 48-bit field @ [272:225]
	ethernet_srcAddr 48-bit field @ [224:177]
	ethernet_etherType 16-bit field @ [176:161]
	ip_isValid 1-bit field @ [160:160]
	ip_version 4-bit field @ [159:156]
	ip_ihl 4-bit field @ [155:152]
	ip_tos 8-bit field @ [151:144]
	ip_totalLen 16-bit field @ [143:128]
	ip_identification 16-bit field @ [127:112]
	ip_flags 3-bit field @ [111:109]
	ip_fragOffset 13-bit field @ [108:96]
	ip_ttl 8-bit field @ [95:88]
	ip_protocol 8-bit field @ [87:80]
	ip_hdrChecksum 16-bit field @ [79:64]
	ip_srcAddr 32-bit field @ [63:32]
	ip_dstAddr 32-bit field @ [31:0]

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
	is_strict_priority 1-bit field @ [9:9]
	is_wrr 1-bit field @ [8:8]
	is_drr 1-bit field @ [7:7]
	is_wfq 1-bit field @ [6:6]
	switch_mode 1-bit field @ [5:5]
	wrr_class_id 5-bit field @ [4:0]

input tuple 'table_switch_mode_resp'
	hit 1-bit field @ [3:3]
	action_run 2-bit field @ [2:1]
	set_switch_mode_0_switch_mode 1-bit field @ [0:0]

input tuple 'table_rank_calc_mode_resp'
	hit 1-bit field @ [6:6]
	action_run 2-bit field @ [5:4]
	set_calc_mode_0_d1 1-bit field @ [3:3]
	set_calc_mode_0_d2 1-bit field @ [2:2]
	set_calc_mode_0_d3 1-bit field @ [1:1]
	set_calc_mode_0_d4 1-bit field @ [0:0]

input tuple 'table_l2_switch_resp'
	hit 1-bit field @ [10:10]
	action_run 2-bit field @ [9:8]
	l2_forward_2_port 8-bit field @ [7:0]

input tuple 'table_l1_switch_resp'
	hit 1-bit field @ [10:10]
	action_run 2-bit field @ [9:8]
	l2_forward_0_port 8-bit field @ [7:0]

input tuple 'table_strict_priority_resp'
	hit 1-bit field @ [34:34]
	action_run 2-bit field @ [33:32]
	set_strict_rank_0_rank 32-bit field @ [31:0]

*/

`timescale 1 ps / 1 ps

module TopPipe_lvl_0_t (
	rst,
	clk_line,
	tuple_in_digest_data_VALID,
	tuple_in_digest_data_DATA,
	tuple_in_local_state_VALID,
	tuple_in_local_state_DATA,
	tuple_in_p_VALID,
	tuple_in_p_DATA,
	tuple_in_sume_metadata_VALID,
	tuple_in_sume_metadata_DATA,
	tuple_in_user_metadata_VALID,
	tuple_in_user_metadata_DATA,
	tuple_in_table_switch_mode_resp_VALID,
	tuple_in_table_switch_mode_resp_DATA,
	tuple_in_table_rank_calc_mode_resp_VALID,
	tuple_in_table_rank_calc_mode_resp_DATA,
	tuple_in_table_l2_switch_resp_VALID,
	tuple_in_table_l2_switch_resp_DATA,
	tuple_in_table_l1_switch_resp_VALID,
	tuple_in_table_l1_switch_resp_DATA,
	tuple_in_table_strict_priority_resp_VALID,
	tuple_in_table_strict_priority_resp_DATA,
	tuple_out_digest_data_VALID,
	tuple_out_digest_data_DATA,
	tuple_out_p_VALID,
	tuple_out_p_DATA,
	tuple_out_sume_metadata_VALID,
	tuple_out_sume_metadata_DATA,
	tuple_out_user_metadata_VALID,
	tuple_out_user_metadata_DATA
);

input rst ;
input clk_line ;
input tuple_in_digest_data_VALID ;
input [255:0] tuple_in_digest_data_DATA ;
input tuple_in_local_state_VALID /* unused */ ;
input [15:0] tuple_in_local_state_DATA ;
input tuple_in_p_VALID /* unused */ ;
input [273:0] tuple_in_p_DATA ;
input tuple_in_sume_metadata_VALID /* unused */ ;
input [159:0] tuple_in_sume_metadata_DATA ;
input tuple_in_user_metadata_VALID /* unused */ ;
input [9:0] tuple_in_user_metadata_DATA ;
input tuple_in_table_switch_mode_resp_VALID /* unused */ ;
input [3:0] tuple_in_table_switch_mode_resp_DATA ;
input tuple_in_table_rank_calc_mode_resp_VALID /* unused */ ;
input [6:0] tuple_in_table_rank_calc_mode_resp_DATA ;
input tuple_in_table_l2_switch_resp_VALID /* unused */ ;
input [10:0] tuple_in_table_l2_switch_resp_DATA ;
input tuple_in_table_l1_switch_resp_VALID /* unused */ ;
input [10:0] tuple_in_table_l1_switch_resp_DATA ;
input tuple_in_table_strict_priority_resp_VALID /* unused */ ;
input [34:0] tuple_in_table_strict_priority_resp_DATA ;
output tuple_out_digest_data_VALID ;
output [255:0] tuple_out_digest_data_DATA ;
output tuple_out_p_VALID ;
output [273:0] tuple_out_p_DATA ;
output tuple_out_sume_metadata_VALID ;
output [159:0] tuple_out_sume_metadata_DATA ;
output tuple_out_user_metadata_VALID ;
output [9:0] tuple_out_user_metadata_DATA ;

wire [23:0] tuple_in_control_DATA ;
wire tuple_in_valid ;
reg [23:0] tuple_in_control_i ;
wire [255:0] tuple_in_digest_data ;
wire [15:0] tuple_in_local_state ;
wire [273:0] tuple_in_p ;
wire [159:0] tuple_in_sume_metadata ;
wire [9:0] tuple_in_user_metadata ;
wire [3:0] tuple_in_table_switch_mode_resp ;
wire [6:0] tuple_in_table_rank_calc_mode_resp ;
wire [10:0] tuple_in_table_l2_switch_resp ;
wire [10:0] tuple_in_table_l1_switch_resp ;
wire [34:0] tuple_in_table_strict_priority_resp ;
wire tuple_out_valid ;
wire tuple_out_digest_data_VALID ;
wire [255:0] tuple_out_digest_data_DATA ;
wire [255:0] tuple_out_digest_data ;
wire tuple_out_p_VALID ;
wire [273:0] tuple_out_p_DATA ;
wire [273:0] tuple_out_p ;
wire tuple_out_sume_metadata_VALID ;
wire [159:0] tuple_out_sume_metadata_DATA ;
wire [159:0] tuple_out_sume_metadata ;
wire tuple_out_user_metadata_VALID ;
wire [9:0] tuple_out_user_metadata_DATA ;
wire [9:0] tuple_out_user_metadata ;

assign tuple_in_control_DATA = 0 ;

assign tuple_in_valid = tuple_in_digest_data_VALID ;

always @* begin
	tuple_in_control_i = 0 ;
	if ( ( tuple_in_control_DATA[3] == 0 ) ) begin
		tuple_in_control_i[23:19] = 19 ;
	end
end

assign tuple_in_digest_data = tuple_in_digest_data_DATA ;

assign tuple_in_local_state = tuple_in_local_state_DATA ;

assign tuple_in_p = tuple_in_p_DATA ;

assign tuple_in_sume_metadata = tuple_in_sume_metadata_DATA ;

assign tuple_in_user_metadata = tuple_in_user_metadata_DATA ;

assign tuple_in_table_switch_mode_resp = tuple_in_table_switch_mode_resp_DATA ;

assign tuple_in_table_rank_calc_mode_resp = tuple_in_table_rank_calc_mode_resp_DATA ;

assign tuple_in_table_l2_switch_resp = tuple_in_table_l2_switch_resp_DATA ;

assign tuple_in_table_l1_switch_resp = tuple_in_table_l1_switch_resp_DATA ;

assign tuple_in_table_strict_priority_resp = tuple_in_table_strict_priority_resp_DATA ;

assign tuple_out_digest_data_VALID = tuple_out_valid ;

assign tuple_out_digest_data_DATA = tuple_out_digest_data ;

assign tuple_out_p_VALID = tuple_out_valid ;

assign tuple_out_p_DATA = tuple_out_p ;

assign tuple_out_sume_metadata_VALID = tuple_out_valid ;

assign tuple_out_sume_metadata_DATA = tuple_out_sume_metadata ;

assign tuple_out_user_metadata_VALID = tuple_out_valid ;

assign tuple_out_user_metadata_DATA = tuple_out_user_metadata ;

TopPipe_lvl_0_t_Engine
TopPipe_lvl_0_t_inst
(
	.reset               	( rst ),
	.clock               	( clk_line ),
	.RX_TUPLE_VALID      	( tuple_in_valid ),
	.RX_TUPLE_control    	( tuple_in_control_i ),
	.TX_TUPLE_VALID      	( tuple_out_valid ),
	.TX_TUPLE_control    	(  ),
	.RX_TUPLE_digest_data	( tuple_in_digest_data ),
	.TX_TUPLE_digest_data	( tuple_out_digest_data ),
	.RX_TUPLE_local_state	( tuple_in_local_state ),
	.RX_TUPLE_p          	( tuple_in_p ),
	.TX_TUPLE_p          	( tuple_out_p ),
	.RX_TUPLE_sume_metadata	( tuple_in_sume_metadata ),
	.TX_TUPLE_sume_metadata	( tuple_out_sume_metadata ),
	.RX_TUPLE_user_metadata	( tuple_in_user_metadata ),
	.TX_TUPLE_user_metadata	( tuple_out_user_metadata ),
	.RX_TUPLE_table_switch_mode_resp	( tuple_in_table_switch_mode_resp ),
	.RX_TUPLE_table_rank_calc_mode_resp	( tuple_in_table_rank_calc_mode_resp ),
	.RX_TUPLE_table_l2_switch_resp	( tuple_in_table_l2_switch_resp ),
	.RX_TUPLE_table_l1_switch_resp	( tuple_in_table_l1_switch_resp ),
	.RX_TUPLE_table_strict_priority_resp	( tuple_in_table_strict_priority_resp ),
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
// File created on 2020/10/07 14:57:20
// by Barista HDL generation library, version TRUNK @ 1007984
