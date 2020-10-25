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

module SimpleSumeSwitch (
	packet_in_packet_in_TVALID,
	packet_in_packet_in_TREADY,
	packet_in_packet_in_TDATA,
	packet_in_packet_in_TKEEP,
	packet_in_packet_in_TLAST,
	tuple_in_sume_metadata_VALID,
	tuple_in_sume_metadata_DATA,
	control_S_AXI_AWADDR,
	control_S_AXI_AWVALID,
	control_S_AXI_AWREADY,
	control_S_AXI_WDATA,
	control_S_AXI_WSTRB,
	control_S_AXI_WVALID,
	control_S_AXI_WREADY,
	control_S_AXI_BRESP,
	control_S_AXI_BVALID,
	control_S_AXI_BREADY,
	control_S_AXI_ARADDR,
	control_S_AXI_ARVALID,
	control_S_AXI_ARREADY,
	control_S_AXI_RDATA,
	control_S_AXI_RRESP,
	control_S_AXI_RVALID,
	control_S_AXI_RREADY,
	enable_processing,
	packet_out_packet_out_TVALID,
	packet_out_packet_out_TREADY,
	packet_out_packet_out_TDATA,
	packet_out_packet_out_TKEEP,
	packet_out_packet_out_TLAST,
	tuple_out_digest_data_VALID,
	tuple_out_digest_data_DATA,
	tuple_out_sume_metadata_VALID,
	tuple_out_sume_metadata_DATA,
	clk_line_rst,
	clk_line,
	clk_lookup_rst,
	clk_lookup,
	clk_control_rst,
	clk_control,
	last_pkt_info4,
	last_pkt_info3,
	last_pkt_info2,
	last_pkt_info1,
	last_pkt_info0,
	internal_rst_done
);

input [0:0] packet_in_packet_in_TVALID ;
output [0:0] packet_in_packet_in_TREADY ;
input [255:0] packet_in_packet_in_TDATA ;
input [31:0] packet_in_packet_in_TKEEP ;
input [0:0] packet_in_packet_in_TLAST ;
input [0:0] tuple_in_sume_metadata_VALID ;
input [159:0] tuple_in_sume_metadata_DATA ;
input [10:0] control_S_AXI_AWADDR ;
input [0:0] control_S_AXI_AWVALID ;
output [0:0] control_S_AXI_AWREADY ;
input [31:0] control_S_AXI_WDATA ;
input [3:0] control_S_AXI_WSTRB ;
input [0:0] control_S_AXI_WVALID ;
output [0:0] control_S_AXI_WREADY ;
output [1:0] control_S_AXI_BRESP ;
output [0:0] control_S_AXI_BVALID ;
input [0:0] control_S_AXI_BREADY ;
input [10:0] control_S_AXI_ARADDR ;
input [0:0] control_S_AXI_ARVALID ;
output [0:0] control_S_AXI_ARREADY ;
output [31:0] control_S_AXI_RDATA ;
output [1:0] control_S_AXI_RRESP ;
output [0:0] control_S_AXI_RVALID ;
input [0:0] control_S_AXI_RREADY ;
input [0:0] enable_processing ;
output [0:0] packet_out_packet_out_TVALID ;
input [0:0] packet_out_packet_out_TREADY ;
output [255:0] packet_out_packet_out_TDATA ;
output [31:0] packet_out_packet_out_TKEEP ;
output [0:0] packet_out_packet_out_TLAST ;
output [0:0] tuple_out_digest_data_VALID ;
output [255:0] tuple_out_digest_data_DATA ;
output [0:0] tuple_out_sume_metadata_VALID ;
output [159:0] tuple_out_sume_metadata_DATA ;
(* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_HIGH" *) input clk_line_rst ;
input clk_line ;
(* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_HIGH" *) input clk_lookup_rst ;
input clk_lookup ;
(* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_HIGH" *) input clk_control_rst ;
input clk_control ;
output [0:0] internal_rst_done ;
input 	 [31:0] 	 last_pkt_info4;
input 	 [31:0] 	 last_pkt_info3;
input 	 [31:0] 	 last_pkt_info2;
input 	 [31:0] 	 last_pkt_info1;
input 	 [31:0] 	 last_pkt_info0;

wire [0:0] packet_in_packet_in_TREADY ;
wire [0:0] control_S_AXI_AWREADY ;
wire [0:0] control_S_AXI_WREADY ;
wire [1:0] control_S_AXI_BRESP ;
wire [0:0] control_S_AXI_BVALID ;
wire [0:0] control_S_AXI_ARREADY ;
wire [31:0] control_S_AXI_RDATA ;
wire [1:0] control_S_AXI_RRESP ;
wire [0:0] control_S_AXI_RVALID ;
wire [0:0] packet_out_packet_out_TVALID ;
wire [255:0] packet_out_packet_out_TDATA ;
wire [31:0] packet_out_packet_out_TKEEP ;
wire [0:0] packet_out_packet_out_TLAST ;
wire [0:0] tuple_out_digest_data_VALID ;
wire [255:0] tuple_out_digest_data_DATA ;
wire [0:0] tuple_out_sume_metadata_VALID ;
wire [159:0] tuple_out_sume_metadata_DATA ;
wire [0:0] TopPipe_lvl__tuple_out_table_switch_mode_req_____S_BRIDGER_for_table_switch_mode_tuple_in_request__tuple_in_VALID ;
wire [47:0] TopPipe_lvl__tuple_out_table_switch_mode_req_____S_BRIDGER_for_table_switch_mode_tuple_in_request__tuple_in_DATA ;
wire [0:0] S_BRIDGER_for_table_switch_mode_tuple_in_request__tuple_out_____table_switch_mode__tuple_in_request_VALID ;
wire [47:0] S_BRIDGER_for_table_switch_mode_tuple_in_request__tuple_out_____table_switch_mode__tuple_in_request_DATA ;
wire [0:0] TopPipe_lvl__tuple_out_table_rank_calc_mode_req_____S_BRIDGER_for_table_rank_calc_mode_tuple_in_request__tuple_in_VALID ;
wire [47:0] TopPipe_lvl__tuple_out_table_rank_calc_mode_req_____S_BRIDGER_for_table_rank_calc_mode_tuple_in_request__tuple_in_DATA ;
wire [0:0] S_BRIDGER_for_table_rank_calc_mode_tuple_in_request__tuple_out_____table_rank_calc_mode__tuple_in_request_VALID ;
wire [47:0] S_BRIDGER_for_table_rank_calc_mode_tuple_in_request__tuple_out_____table_rank_calc_mode__tuple_in_request_DATA ;
wire [0:0] TopPipe_lvl__tuple_out_table_l2_switch_req_____S_BRIDGER_for_table_l2_switch_tuple_in_request__tuple_in_VALID ;
wire [47:0] TopPipe_lvl__tuple_out_table_l2_switch_req_____S_BRIDGER_for_table_l2_switch_tuple_in_request__tuple_in_DATA ;
wire [0:0] S_BRIDGER_for_table_l2_switch_tuple_in_request__tuple_out_____table_l2_switch__tuple_in_request_VALID ;
wire [47:0] S_BRIDGER_for_table_l2_switch_tuple_in_request__tuple_out_____table_l2_switch__tuple_in_request_DATA ;
wire [0:0] TopPipe_lvl__tuple_out_table_l1_switch_req_____S_BRIDGER_for_table_l1_switch_tuple_in_request__tuple_in_VALID ;
wire [11:0] TopPipe_lvl__tuple_out_table_l1_switch_req_____S_BRIDGER_for_table_l1_switch_tuple_in_request__tuple_in_DATA ;
wire [0:0] S_BRIDGER_for_table_l1_switch_tuple_in_request__tuple_out_____table_l1_switch__tuple_in_request_VALID ;
wire [11:0] S_BRIDGER_for_table_l1_switch_tuple_in_request__tuple_out_____table_l1_switch__tuple_in_request_DATA ;
wire [0:0] TopPipe_lvl__tuple_out_table_strict_priority_req_____S_BRIDGER_for_table_strict_priority_tuple_in_request__tuple_in_VALID ;
wire [47:0] TopPipe_lvl__tuple_out_table_strict_priority_req_____S_BRIDGER_for_table_strict_priority_tuple_in_request__tuple_in_DATA ;
wire [0:0] S_BRIDGER_for_table_strict_priority_tuple_in_request__tuple_out_____table_strict_priority__tuple_in_request_VALID ;
wire [47:0] S_BRIDGER_for_table_strict_priority_tuple_in_request__tuple_out_____table_strict_priority__tuple_in_request_DATA ;
wire [0:0] TopDeparser__tuple_out_control_____S_PROTOCOL_ADAPTER_EGRESS__tuple_in_control_VALID ;
wire [23:0] TopDeparser__tuple_out_control_____S_PROTOCOL_ADAPTER_EGRESS__tuple_in_control_DATA ;
wire [0:0] TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_SOF ;
wire [0:0] TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_EOF ;
wire [0:0] TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_VAL ;
wire [0:0] TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_RDY ;
wire [255:0] TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_DAT ;
wire [5:0] TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_CNT ;
wire [0:0] TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_ERR ;
wire [0:0] S_SYNCER_for_TopParser__tuple_out_TUPLE0_____TopParser__tuple_in_sume_metadata_VALID ;
wire [159:0] S_SYNCER_for_TopParser__tuple_out_TUPLE0_____TopParser__tuple_in_sume_metadata_DATA ;
wire [0:0] S_PROTOCOL_ADAPTER_INGRESS__tuple_out_control_____S_SYNCER_for_TopParser__tuple_in_TUPLE1_VALID ;
wire [23:0] S_PROTOCOL_ADAPTER_INGRESS__tuple_out_control_____S_SYNCER_for_TopParser__tuple_in_TUPLE1_DATA ;
wire [0:0] S_SYNCER_for_TopParser__tuple_out_TUPLE1_____TopParser__tuple_in_control_VALID ;
wire [23:0] S_SYNCER_for_TopParser__tuple_out_TUPLE1_____TopParser__tuple_in_control_DATA ;
wire [0:0] S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_SOF ;
wire [0:0] S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_EOF ;
wire [0:0] S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_VAL ;
wire [0:0] S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_RDY /* unused */ ;
wire [255:0] S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_DAT ;
wire [5:0] S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_CNT ;
wire [0:0] S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_ERR ;
wire [0:0] S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_SOF ;
wire [0:0] S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_EOF ;
wire [0:0] S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_VAL ;
wire [0:0] S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_RDY ;
wire [255:0] S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_DAT ;
wire [5:0] S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_CNT ;
wire [0:0] S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_ERR ;
wire [0:0] TopParser__tuple_out_p_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE0_VALID ;
wire [273:0] TopParser__tuple_out_p_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE0_DATA ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE0_____TopPipe_lvl__tuple_in_p_VALID ;
wire [273:0] S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE0_____TopPipe_lvl__tuple_in_p_DATA ;
wire [0:0] TopParser__tuple_out_user_metadata_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE1_VALID ;
wire [9:0] TopParser__tuple_out_user_metadata_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE1_DATA ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE1_____TopPipe_lvl__tuple_in_user_metadata_VALID ;
wire [9:0] S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE1_____TopPipe_lvl__tuple_in_user_metadata_DATA ;
wire [0:0] TopParser__tuple_out_digest_data_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE2_VALID ;
wire [255:0] TopParser__tuple_out_digest_data_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE2_DATA ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE2_____TopPipe_lvl__tuple_in_digest_data_VALID ;
wire [255:0] S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE2_____TopPipe_lvl__tuple_in_digest_data_DATA ;
wire [0:0] TopParser__tuple_out_sume_metadata_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE3_VALID ;
wire [159:0] TopParser__tuple_out_sume_metadata_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE3_DATA ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE3_____TopPipe_lvl__tuple_in_sume_metadata_VALID ;
wire [159:0] S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE3_____TopPipe_lvl__tuple_in_sume_metadata_DATA ;
wire [0:0] TopParser__tuple_out_control_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE4_VALID ;
wire [23:0] TopParser__tuple_out_control_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE4_DATA ;
wire [0:0] TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_SOF ;
wire [0:0] TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_EOF ;
wire [0:0] TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_VAL ;
wire [0:0] TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_RDY ;
wire [255:0] TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_DAT ;
wire [5:0] TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_CNT ;
wire [0:0] TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_ERR ;
wire [0:0] TopParser__tuple_out_TopParser_extracts_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE6_VALID ;
wire [31:0] TopParser__tuple_out_TopParser_extracts_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE6_DATA ;
wire [0:0] TopPipe_lvl__tuple_out_digest_data_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE0_VALID ;
wire [255:0] TopPipe_lvl__tuple_out_digest_data_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE0_DATA ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE0_____TopPipe_lvl_0__tuple_in_digest_data_VALID ;
wire [255:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE0_____TopPipe_lvl_0__tuple_in_digest_data_DATA ;
wire [0:0] TopPipe_lvl__tuple_out_local_state_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE1_VALID ;
wire [15:0] TopPipe_lvl__tuple_out_local_state_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE1_DATA ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE1_____TopPipe_lvl_0__tuple_in_local_state_VALID ;
wire [15:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE1_____TopPipe_lvl_0__tuple_in_local_state_DATA ;
wire [0:0] TopPipe_lvl__tuple_out_p_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE2_VALID ;
wire [273:0] TopPipe_lvl__tuple_out_p_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE2_DATA ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE2_____TopPipe_lvl_0__tuple_in_p_VALID ;
wire [273:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE2_____TopPipe_lvl_0__tuple_in_p_DATA ;
wire [0:0] TopPipe_lvl__tuple_out_sume_metadata_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE3_VALID ;
wire [159:0] TopPipe_lvl__tuple_out_sume_metadata_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE3_DATA ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE3_____TopPipe_lvl_0__tuple_in_sume_metadata_VALID ;
wire [159:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE3_____TopPipe_lvl_0__tuple_in_sume_metadata_DATA ;
wire [0:0] TopPipe_lvl__tuple_out_user_metadata_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE4_VALID ;
wire [9:0] TopPipe_lvl__tuple_out_user_metadata_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE4_DATA ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE4_____TopPipe_lvl_0__tuple_in_user_metadata_VALID ;
wire [9:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE4_____TopPipe_lvl_0__tuple_in_user_metadata_DATA ;
wire [0:0] table_switch_mode__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE5_VALID ;
wire [3:0] table_switch_mode__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE5_DATA ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE5_____TopPipe_lvl_0__tuple_in_table_switch_mode_resp_VALID ;
wire [3:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE5_____TopPipe_lvl_0__tuple_in_table_switch_mode_resp_DATA ;
wire [0:0] table_rank_calc_mode__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE6_VALID ;
wire [6:0] table_rank_calc_mode__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE6_DATA ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE6_____TopPipe_lvl_0__tuple_in_table_rank_calc_mode_resp_VALID ;
wire [6:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE6_____TopPipe_lvl_0__tuple_in_table_rank_calc_mode_resp_DATA ;
wire [0:0] table_l2_switch__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE7_VALID ;
wire [10:0] table_l2_switch__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE7_DATA ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE7_____TopPipe_lvl_0__tuple_in_table_l2_switch_resp_VALID ;
wire [10:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE7_____TopPipe_lvl_0__tuple_in_table_l2_switch_resp_DATA ;
wire [0:0] table_l1_switch__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE8_VALID ;
wire [10:0] table_l1_switch__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE8_DATA ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE8_____TopPipe_lvl_0__tuple_in_table_l1_switch_resp_VALID ;
wire [10:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE8_____TopPipe_lvl_0__tuple_in_table_l1_switch_resp_DATA ;
wire [0:0] table_strict_priority__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE9_VALID ;
wire [34:0] table_strict_priority__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE9_DATA ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE9_____TopPipe_lvl_0__tuple_in_table_strict_priority_resp_VALID ;
wire [34:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE9_____TopPipe_lvl_0__tuple_in_table_strict_priority_resp_DATA ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE4_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE10_VALID ;
wire [23:0] S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE4_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE10_DATA ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_SOF ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_EOF ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_VAL ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_RDY ;
wire [255:0] S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_DAT ;
wire [5:0] S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_CNT ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_ERR ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE6_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE12_VALID ;
wire [31:0] S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE6_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE12_DATA ;
wire [0:0] TopPipe_lvl_0__tuple_out_p_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE0_VALID ;
wire [273:0] TopPipe_lvl_0__tuple_out_p_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE0_DATA ;
wire [0:0] S_SYNCER_for_TopDeparser__tuple_out_TUPLE0_____TopDeparser__tuple_in_p_VALID ;
wire [273:0] S_SYNCER_for_TopDeparser__tuple_out_TUPLE0_____TopDeparser__tuple_in_p_DATA ;
wire [0:0] TopPipe_lvl_0__tuple_out_user_metadata_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE1_VALID ;
wire [9:0] TopPipe_lvl_0__tuple_out_user_metadata_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE1_DATA ;
wire [0:0] S_SYNCER_for_TopDeparser__tuple_out_TUPLE1_____TopDeparser__tuple_in_user_metadata_VALID ;
wire [9:0] S_SYNCER_for_TopDeparser__tuple_out_TUPLE1_____TopDeparser__tuple_in_user_metadata_DATA ;
wire [0:0] TopPipe_lvl_0__tuple_out_digest_data_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE2_VALID ;
wire [255:0] TopPipe_lvl_0__tuple_out_digest_data_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE2_DATA ;
wire [0:0] S_SYNCER_for_TopDeparser__tuple_out_TUPLE2_____TopDeparser__tuple_in_digest_data_VALID ;
wire [255:0] S_SYNCER_for_TopDeparser__tuple_out_TUPLE2_____TopDeparser__tuple_in_digest_data_DATA ;
wire [0:0] TopPipe_lvl_0__tuple_out_sume_metadata_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE3_VALID ;
wire [159:0] TopPipe_lvl_0__tuple_out_sume_metadata_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE3_DATA ;
wire [0:0] S_SYNCER_for_TopDeparser__tuple_out_TUPLE3_____TopDeparser__tuple_in_sume_metadata_VALID ;
wire [159:0] S_SYNCER_for_TopDeparser__tuple_out_TUPLE3_____TopDeparser__tuple_in_sume_metadata_DATA ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE10_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE4_VALID ;
wire [23:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE10_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE4_DATA ;
wire [0:0] S_SYNCER_for_TopDeparser__tuple_out_TUPLE4_____TopDeparser__tuple_in_control_VALID ;
wire [23:0] S_SYNCER_for_TopDeparser__tuple_out_TUPLE4_____TopDeparser__tuple_in_control_DATA ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_SOF ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_EOF ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_VAL ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_RDY ;
wire [255:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_DAT ;
wire [5:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_CNT ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_ERR ;
wire [0:0] S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_SOF ;
wire [0:0] S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_EOF ;
wire [0:0] S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_VAL ;
wire [0:0] S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_RDY ;
wire [255:0] S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_DAT ;
wire [5:0] S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_CNT ;
wire [0:0] S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_ERR ;
wire [0:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE12_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE6_VALID ;
wire [31:0] S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE12_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE6_DATA ;
wire [0:0] S_SYNCER_for_TopDeparser__tuple_out_TUPLE6_____TopDeparser__tuple_in_TopDeparser_extracts_VALID ;
wire [31:0] S_SYNCER_for_TopDeparser__tuple_out_TUPLE6_____TopDeparser__tuple_in_TopDeparser_extracts_DATA ;
wire [0:0] TopDeparser__tuple_out_digest_data_____S_SYNCER_for__OUT___tuple_in_TUPLE0_VALID ;
wire [255:0] TopDeparser__tuple_out_digest_data_____S_SYNCER_for__OUT___tuple_in_TUPLE0_DATA ;
wire [0:0] TopDeparser__tuple_out_sume_metadata_____S_SYNCER_for__OUT___tuple_in_TUPLE1_VALID ;
wire [159:0] TopDeparser__tuple_out_sume_metadata_____S_SYNCER_for__OUT___tuple_in_TUPLE1_DATA ;
wire [0:0] S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_TVALID ;
wire [0:0] S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_TREADY ;
wire [255:0] S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_TDATA ;
wire [31:0] S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_TKEEP ;
wire [0:0] S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_TLAST ;
wire [7:0] S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_AWADDR ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_AWVALID ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_AWREADY ;
wire [31:0] S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_WDATA ;
wire [3:0] S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_WSTRB ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_WVALID ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_WREADY ;
wire [1:0] S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_BRESP ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_BVALID ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_BREADY ;
wire [7:0] S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_ARADDR ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_ARVALID ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_ARREADY ;
wire [31:0] S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_RDATA ;
wire [1:0] S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_RRESP ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_RVALID ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_RREADY ;
wire [7:0] S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_AWADDR ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_AWVALID ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_AWREADY ;
wire [31:0] S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_WDATA ;
wire [3:0] S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_WSTRB ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_WVALID ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_WREADY ;
wire [1:0] S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_BRESP ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_BVALID ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_BREADY ;
wire [7:0] S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_ARADDR ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_ARVALID ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_ARREADY ;
wire [31:0] S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_RDATA ;
wire [1:0] S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_RRESP ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_RVALID ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_RREADY ;
wire [7:0] S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_AWADDR ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_AWVALID ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_AWREADY ;
wire [31:0] S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_WDATA ;
wire [3:0] S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_WSTRB ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_WVALID ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_WREADY ;
wire [1:0] S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_BRESP ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_BVALID ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_BREADY ;
wire [7:0] S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_ARADDR ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_ARVALID ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_ARREADY ;
wire [31:0] S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_RDATA ;
wire [1:0] S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_RRESP ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_RVALID ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_RREADY ;
wire [7:0] S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_AWADDR ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_AWVALID ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_AWREADY ;
wire [31:0] S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_WDATA ;
wire [3:0] S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_WSTRB ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_WVALID ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_WREADY ;
wire [1:0] S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_BRESP ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_BVALID ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_BREADY ;
wire [7:0] S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_ARADDR ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_ARVALID ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_ARREADY ;
wire [31:0] S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_RDATA ;
wire [1:0] S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_RRESP ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_RVALID ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_RREADY ;
wire [7:0] S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_AWADDR ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_AWVALID ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_AWREADY ;
wire [31:0] S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_WDATA ;
wire [3:0] S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_WSTRB ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_WVALID ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_WREADY ;
wire [1:0] S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_BRESP ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_BVALID ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_BREADY ;
wire [7:0] S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_ARADDR ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_ARVALID ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_ARREADY ;
wire [31:0] S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_RDATA ;
wire [1:0] S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_RRESP ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_RVALID ;
wire [0:0] S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_RREADY ;
wire clk_line_init_done ;
wire clk_line_rst_high ;
wire clk_line_rst_low /* unused */ ;
wire clk_lookup_init_done ;
wire clk_lookup_rst_high ;
wire clk_lookup_rst_low /* unused */ ;
wire clk_control_init_done ;
wire clk_control_rst_high ;
wire clk_control_rst_low ;
wire [0:0] internal_rst_done ;
wire S_SYNCER_for_TopParser______IN__BACKPRESSURE ;
reg S_SYNCER_for_TopParser______IN__BACKPRESSURE_1 ;
reg S_SYNCER_for_TopParser______IN__BACKPRESSURE_2 ;
reg S_SYNCER_for_TopParser______IN__BACKPRESSURE_3 ;
wire _source_zero_BACKPRESSURE /* unused */ ;
wire S_SYNCER_for__OUT______TopDeparser_BACKPRESSURE ;
reg S_SYNCER_for__OUT______TopDeparser_BACKPRESSURE_1 ;
reg S_SYNCER_for__OUT______TopDeparser_BACKPRESSURE_2 ;
reg S_SYNCER_for__OUT______TopDeparser_BACKPRESSURE_3 ;
wire S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_TopParser_BACKPRESSURE ;
reg S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_TopParser_BACKPRESSURE_1 ;
reg S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_TopParser_BACKPRESSURE_2 ;
reg S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_TopParser_BACKPRESSURE_3 ;
wire S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE ;
reg S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE_1 ;
reg S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE_2 ;
reg S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE_3 ;
wire S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE ;
reg S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE_1 ;
reg S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE_2 ;
reg S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE_3 ;
wire TopDeparser_____S_SYNCER_for_TopDeparser_BACKPRESSURE ;

// black box
S_RESETTER_line
S_RESET_clk_line
(
	.clk                 	( clk_line ),
	.rst                 	( clk_line_rst ),
	.reset_out_active_high	( clk_line_rst_high ),
	.reset_out_active_low	( clk_line_rst_low ),
	.init_done           	( clk_line_init_done )
);

// black box
S_RESETTER_lookup
S_RESET_clk_lookup
(
	.clk                 	( clk_lookup ),
	.rst                 	( clk_lookup_rst ),
	.reset_out_active_high	( clk_lookup_rst_high ),
	.reset_out_active_low	( clk_lookup_rst_low ),
	.init_done           	( clk_lookup_init_done )
);

// black box
S_RESETTER_control
S_RESET_clk_control
(
	.clk                 	( clk_control ),
	.rst                 	( clk_control_rst ),
	.reset_out_active_high	( clk_control_rst_high ),
	.reset_out_active_low	( clk_control_rst_low ),
	.init_done           	( clk_control_init_done )
);

assign internal_rst_done = ( ( clk_line_init_done && clk_lookup_init_done ) && clk_control_init_done ) ;

always @( posedge clk_line ) begin
	if ( clk_line_rst_high ) begin
		S_SYNCER_for_TopParser______IN__BACKPRESSURE_1 <= 0 ;
		S_SYNCER_for_TopParser______IN__BACKPRESSURE_2 <= 0 ;
		S_SYNCER_for_TopParser______IN__BACKPRESSURE_3 <= 0 ;
	end
	else  begin
		S_SYNCER_for_TopParser______IN__BACKPRESSURE_1 <= S_SYNCER_for_TopParser______IN__BACKPRESSURE ;
		S_SYNCER_for_TopParser______IN__BACKPRESSURE_2 <= S_SYNCER_for_TopParser______IN__BACKPRESSURE_1 ;
		S_SYNCER_for_TopParser______IN__BACKPRESSURE_3 <= S_SYNCER_for_TopParser______IN__BACKPRESSURE_2 ;
	end
end

assign packet_in_packet_in_TREADY = ~S_SYNCER_for_TopParser______IN__BACKPRESSURE_3 ;

assign _source_zero_BACKPRESSURE = 1'd0 ;

always @( posedge clk_line ) begin
	if ( clk_line_rst_high ) begin
		S_SYNCER_for__OUT______TopDeparser_BACKPRESSURE_1 <= 0 ;
		S_SYNCER_for__OUT______TopDeparser_BACKPRESSURE_2 <= 0 ;
		S_SYNCER_for__OUT______TopDeparser_BACKPRESSURE_3 <= 0 ;
	end
	else  begin
		S_SYNCER_for__OUT______TopDeparser_BACKPRESSURE_1 <= S_SYNCER_for__OUT______TopDeparser_BACKPRESSURE ;
		S_SYNCER_for__OUT______TopDeparser_BACKPRESSURE_2 <= S_SYNCER_for__OUT______TopDeparser_BACKPRESSURE_1 ;
		S_SYNCER_for__OUT______TopDeparser_BACKPRESSURE_3 <= S_SYNCER_for__OUT______TopDeparser_BACKPRESSURE_2 ;
	end
end

always @( posedge clk_line ) begin
	if ( clk_line_rst_high ) begin
		S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_TopParser_BACKPRESSURE_1 <= 0 ;
		S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_TopParser_BACKPRESSURE_2 <= 0 ;
		S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_TopParser_BACKPRESSURE_3 <= 0 ;
	end
	else  begin
		S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_TopParser_BACKPRESSURE_1 <= S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_TopParser_BACKPRESSURE ;
		S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_TopParser_BACKPRESSURE_2 <= S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_TopParser_BACKPRESSURE_1 ;
		S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_TopParser_BACKPRESSURE_3 <= S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_TopParser_BACKPRESSURE_2 ;
	end
end

always @( posedge clk_line ) begin
	if ( clk_line_rst_high ) begin
		S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE_1 <= 0 ;
		S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE_2 <= 0 ;
		S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE_3 <= 0 ;
	end
	else  begin
		S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE_1 <= S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE ;
		S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE_2 <= S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE_1 ;
		S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE_3 <= S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE_2 ;
	end
end

always @( posedge clk_line ) begin
	if ( clk_line_rst_high ) begin
		S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE_1 <= 0 ;
		S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE_2 <= 0 ;
		S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE_3 <= 0 ;
	end
	else  begin
		S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE_1 <= S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE ;
		S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE_2 <= S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE_1 ;
		S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE_3 <= S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE_2 ;
	end
end

// black box
TopParser_t
TopParser
(
	.tuple_in_sume_metadata_VALID	( S_SYNCER_for_TopParser__tuple_out_TUPLE0_____TopParser__tuple_in_sume_metadata_VALID ),
	.tuple_in_sume_metadata_DATA	( S_SYNCER_for_TopParser__tuple_out_TUPLE0_____TopParser__tuple_in_sume_metadata_DATA ),
	.tuple_in_control_VALID	( S_SYNCER_for_TopParser__tuple_out_TUPLE1_____TopParser__tuple_in_control_VALID ),
	.tuple_in_control_DATA	( S_SYNCER_for_TopParser__tuple_out_TUPLE1_____TopParser__tuple_in_control_DATA ),
	.packet_in_SOF       	( S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_SOF ),
	.packet_in_EOF       	( S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_EOF ),
	.packet_in_VAL       	( S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_VAL ),
	.packet_in_RDY       	( S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_RDY ),
	.packet_in_DAT       	( S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_DAT ),
	.packet_in_CNT       	( S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_CNT ),
	.packet_in_ERR       	( S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_ERR ),
	.tuple_out_p_VALID   	( TopParser__tuple_out_p_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE0_VALID ),
	.tuple_out_p_DATA    	( TopParser__tuple_out_p_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE0_DATA ),
	.tuple_out_user_metadata_VALID	( TopParser__tuple_out_user_metadata_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE1_VALID ),
	.tuple_out_user_metadata_DATA	( TopParser__tuple_out_user_metadata_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE1_DATA ),
	.tuple_out_digest_data_VALID	( TopParser__tuple_out_digest_data_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE2_VALID ),
	.tuple_out_digest_data_DATA	( TopParser__tuple_out_digest_data_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE2_DATA ),
	.tuple_out_sume_metadata_VALID	( TopParser__tuple_out_sume_metadata_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE3_VALID ),
	.tuple_out_sume_metadata_DATA	( TopParser__tuple_out_sume_metadata_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE3_DATA ),
	.tuple_out_control_VALID	( TopParser__tuple_out_control_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE4_VALID ),
	.tuple_out_control_DATA	( TopParser__tuple_out_control_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE4_DATA ),
	.packet_out_SOF      	( TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_SOF ),
	.packet_out_EOF      	( TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_EOF ),
	.packet_out_VAL      	( TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_VAL ),
	.packet_out_RDY      	( TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_RDY ),
	.packet_out_DAT      	( TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_DAT ),
	.packet_out_CNT      	( TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_CNT ),
	.packet_out_ERR      	( TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_ERR ),
	.tuple_out_TopParser_extracts_VALID	( TopParser__tuple_out_TopParser_extracts_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE6_VALID ),
	.tuple_out_TopParser_extracts_DATA	( TopParser__tuple_out_TopParser_extracts_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE6_DATA ),
	.clk_line            	( clk_line ),
	.rst                 	( clk_line_rst_high )
);

// black box
TopPipe_lvl_t
TopPipe_lvl
(
	.tuple_out_table_switch_mode_req_VALID	( TopPipe_lvl__tuple_out_table_switch_mode_req_____S_BRIDGER_for_table_switch_mode_tuple_in_request__tuple_in_VALID ),
	.tuple_out_table_switch_mode_req_DATA	( TopPipe_lvl__tuple_out_table_switch_mode_req_____S_BRIDGER_for_table_switch_mode_tuple_in_request__tuple_in_DATA ),
	.tuple_out_table_rank_calc_mode_req_VALID	( TopPipe_lvl__tuple_out_table_rank_calc_mode_req_____S_BRIDGER_for_table_rank_calc_mode_tuple_in_request__tuple_in_VALID ),
	.tuple_out_table_rank_calc_mode_req_DATA	( TopPipe_lvl__tuple_out_table_rank_calc_mode_req_____S_BRIDGER_for_table_rank_calc_mode_tuple_in_request__tuple_in_DATA ),
	.tuple_out_table_l2_switch_req_VALID	( TopPipe_lvl__tuple_out_table_l2_switch_req_____S_BRIDGER_for_table_l2_switch_tuple_in_request__tuple_in_VALID ),
	.tuple_out_table_l2_switch_req_DATA	( TopPipe_lvl__tuple_out_table_l2_switch_req_____S_BRIDGER_for_table_l2_switch_tuple_in_request__tuple_in_DATA ),
	.tuple_out_table_l1_switch_req_VALID	( TopPipe_lvl__tuple_out_table_l1_switch_req_____S_BRIDGER_for_table_l1_switch_tuple_in_request__tuple_in_VALID ),
	.tuple_out_table_l1_switch_req_DATA	( TopPipe_lvl__tuple_out_table_l1_switch_req_____S_BRIDGER_for_table_l1_switch_tuple_in_request__tuple_in_DATA ),
	.tuple_out_table_strict_priority_req_VALID	( TopPipe_lvl__tuple_out_table_strict_priority_req_____S_BRIDGER_for_table_strict_priority_tuple_in_request__tuple_in_VALID ),
	.tuple_out_table_strict_priority_req_DATA	( TopPipe_lvl__tuple_out_table_strict_priority_req_____S_BRIDGER_for_table_strict_priority_tuple_in_request__tuple_in_DATA ),
	.tuple_in_p_VALID    	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE0_____TopPipe_lvl__tuple_in_p_VALID ),
	.tuple_in_p_DATA     	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE0_____TopPipe_lvl__tuple_in_p_DATA ),
	.tuple_in_user_metadata_VALID	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE1_____TopPipe_lvl__tuple_in_user_metadata_VALID ),
	.tuple_in_user_metadata_DATA	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE1_____TopPipe_lvl__tuple_in_user_metadata_DATA ),
	.tuple_in_digest_data_VALID	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE2_____TopPipe_lvl__tuple_in_digest_data_VALID ),
	.tuple_in_digest_data_DATA	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE2_____TopPipe_lvl__tuple_in_digest_data_DATA ),
	.tuple_in_sume_metadata_VALID	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE3_____TopPipe_lvl__tuple_in_sume_metadata_VALID ),
	.tuple_in_sume_metadata_DATA	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE3_____TopPipe_lvl__tuple_in_sume_metadata_DATA ),
	.tuple_out_digest_data_VALID	( TopPipe_lvl__tuple_out_digest_data_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE0_VALID ),
	.tuple_out_digest_data_DATA	( TopPipe_lvl__tuple_out_digest_data_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE0_DATA ),
	.tuple_out_local_state_VALID	( TopPipe_lvl__tuple_out_local_state_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE1_VALID ),
	.tuple_out_local_state_DATA	( TopPipe_lvl__tuple_out_local_state_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE1_DATA ),
	.tuple_out_p_VALID   	( TopPipe_lvl__tuple_out_p_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE2_VALID ),
	.tuple_out_p_DATA    	( TopPipe_lvl__tuple_out_p_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE2_DATA ),
	.tuple_out_sume_metadata_VALID	( TopPipe_lvl__tuple_out_sume_metadata_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE3_VALID ),
	.tuple_out_sume_metadata_DATA	( TopPipe_lvl__tuple_out_sume_metadata_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE3_DATA ),
	.tuple_out_user_metadata_VALID	( TopPipe_lvl__tuple_out_user_metadata_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE4_VALID ),
	.tuple_out_user_metadata_DATA	( TopPipe_lvl__tuple_out_user_metadata_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE4_DATA ),
	.clk_line            	( clk_line ),
	.rst                 	( clk_line_rst_high )
);

// black box
table_switch_mode_t
table_switch_mode
(
	.tuple_in_request_VALID	( S_BRIDGER_for_table_switch_mode_tuple_in_request__tuple_out_____table_switch_mode__tuple_in_request_VALID ),
	.tuple_in_request_DATA	( S_BRIDGER_for_table_switch_mode_tuple_in_request__tuple_out_____table_switch_mode__tuple_in_request_DATA ),
	.tuple_out_response_VALID	( table_switch_mode__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE5_VALID ),
	.tuple_out_response_DATA	( table_switch_mode__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE5_DATA ),
	.control_S_AXI_AWADDR	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_AWADDR ),
	.control_S_AXI_AWVALID	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_AWVALID ),
	.control_S_AXI_AWREADY	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_AWREADY ),
	.control_S_AXI_WDATA 	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_WDATA ),
	.control_S_AXI_WSTRB 	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_WSTRB ),
	.control_S_AXI_WVALID	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_WVALID ),
	.control_S_AXI_WREADY	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_WREADY ),
	.control_S_AXI_BRESP 	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_BRESP ),
	.control_S_AXI_BVALID	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_BVALID ),
	.control_S_AXI_BREADY	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_BREADY ),
	.control_S_AXI_ARADDR	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_ARADDR ),
	.control_S_AXI_ARVALID	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_ARVALID ),
	.control_S_AXI_ARREADY	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_ARREADY ),
	.control_S_AXI_RDATA 	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_RDATA ),
	.control_S_AXI_RRESP 	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_RRESP ),
	.control_S_AXI_RVALID	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_RVALID ),
	.control_S_AXI_RREADY	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_RREADY ),
	.clk_lookup          	( clk_lookup ),
	.clk_control         	( clk_control ),
	.clk_lookup_rst_high 	( clk_lookup_rst_high ),
	.clk_control_rst_low 	( clk_control_rst_low )
);

// black box
table_rank_calc_mode_t
table_rank_calc_mode
(
	.tuple_in_request_VALID	( S_BRIDGER_for_table_rank_calc_mode_tuple_in_request__tuple_out_____table_rank_calc_mode__tuple_in_request_VALID ),
	.tuple_in_request_DATA	( S_BRIDGER_for_table_rank_calc_mode_tuple_in_request__tuple_out_____table_rank_calc_mode__tuple_in_request_DATA ),
	.tuple_out_response_VALID	( table_rank_calc_mode__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE6_VALID ),
	.tuple_out_response_DATA	( table_rank_calc_mode__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE6_DATA ),
	.control_S_AXI_AWADDR	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_AWADDR ),
	.control_S_AXI_AWVALID	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_AWVALID ),
	.control_S_AXI_AWREADY	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_AWREADY ),
	.control_S_AXI_WDATA 	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_WDATA ),
	.control_S_AXI_WSTRB 	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_WSTRB ),
	.control_S_AXI_WVALID	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_WVALID ),
	.control_S_AXI_WREADY	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_WREADY ),
	.control_S_AXI_BRESP 	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_BRESP ),
	.control_S_AXI_BVALID	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_BVALID ),
	.control_S_AXI_BREADY	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_BREADY ),
	.control_S_AXI_ARADDR	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_ARADDR ),
	.control_S_AXI_ARVALID	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_ARVALID ),
	.control_S_AXI_ARREADY	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_ARREADY ),
	.control_S_AXI_RDATA 	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_RDATA ),
	.control_S_AXI_RRESP 	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_RRESP ),
	.control_S_AXI_RVALID	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_RVALID ),
	.control_S_AXI_RREADY	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_RREADY ),
	.clk_lookup          	( clk_lookup ),
	.clk_control         	( clk_control ),
	.clk_lookup_rst_high 	( clk_lookup_rst_high ),
	.clk_control_rst_low 	( clk_control_rst_low )
);

// black box
table_l2_switch_t
table_l2_switch
(
	.tuple_in_request_VALID	( S_BRIDGER_for_table_l2_switch_tuple_in_request__tuple_out_____table_l2_switch__tuple_in_request_VALID ),
	.tuple_in_request_DATA	( S_BRIDGER_for_table_l2_switch_tuple_in_request__tuple_out_____table_l2_switch__tuple_in_request_DATA ),
	.tuple_out_response_VALID	( table_l2_switch__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE7_VALID ),
	.tuple_out_response_DATA	( table_l2_switch__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE7_DATA ),
	.control_S_AXI_AWADDR	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_AWADDR ),
	.control_S_AXI_AWVALID	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_AWVALID ),
	.control_S_AXI_AWREADY	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_AWREADY ),
	.control_S_AXI_WDATA 	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_WDATA ),
	.control_S_AXI_WSTRB 	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_WSTRB ),
	.control_S_AXI_WVALID	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_WVALID ),
	.control_S_AXI_WREADY	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_WREADY ),
	.control_S_AXI_BRESP 	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_BRESP ),
	.control_S_AXI_BVALID	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_BVALID ),
	.control_S_AXI_BREADY	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_BREADY ),
	.control_S_AXI_ARADDR	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_ARADDR ),
	.control_S_AXI_ARVALID	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_ARVALID ),
	.control_S_AXI_ARREADY	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_ARREADY ),
	.control_S_AXI_RDATA 	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_RDATA ),
	.control_S_AXI_RRESP 	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_RRESP ),
	.control_S_AXI_RVALID	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_RVALID ),
	.control_S_AXI_RREADY	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_RREADY ),
	.clk_lookup          	( clk_lookup ),
	.clk_control         	( clk_control ),
	.clk_lookup_rst_high 	( clk_lookup_rst_high ),
	.clk_control_rst_low 	( clk_control_rst_low )
);

// black box
table_l1_switch_t
table_l1_switch
(
	.tuple_in_request_VALID	( S_BRIDGER_for_table_l1_switch_tuple_in_request__tuple_out_____table_l1_switch__tuple_in_request_VALID ),
	.tuple_in_request_DATA	( S_BRIDGER_for_table_l1_switch_tuple_in_request__tuple_out_____table_l1_switch__tuple_in_request_DATA ),
	.tuple_out_response_VALID	( table_l1_switch__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE8_VALID ),
	.tuple_out_response_DATA	( table_l1_switch__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE8_DATA ),
	.control_S_AXI_AWADDR	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_AWADDR ),
	.control_S_AXI_AWVALID	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_AWVALID ),
	.control_S_AXI_AWREADY	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_AWREADY ),
	.control_S_AXI_WDATA 	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_WDATA ),
	.control_S_AXI_WSTRB 	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_WSTRB ),
	.control_S_AXI_WVALID	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_WVALID ),
	.control_S_AXI_WREADY	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_WREADY ),
	.control_S_AXI_BRESP 	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_BRESP ),
	.control_S_AXI_BVALID	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_BVALID ),
	.control_S_AXI_BREADY	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_BREADY ),
	.control_S_AXI_ARADDR	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_ARADDR ),
	.control_S_AXI_ARVALID	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_ARVALID ),
	.control_S_AXI_ARREADY	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_ARREADY ),
	.control_S_AXI_RDATA 	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_RDATA ),
	.control_S_AXI_RRESP 	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_RRESP ),
	.control_S_AXI_RVALID	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_RVALID ),
	.control_S_AXI_RREADY	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_RREADY ),
	.clk_lookup          	( clk_lookup ),
	.clk_control         	( clk_control ),
	.clk_lookup_rst_high 	( clk_lookup_rst_high ),
	.clk_control_rst_low 	( clk_control_rst_low )
);

// black box
table_strict_priority_t
table_strict_priority
(
	.tuple_in_request_VALID	( S_BRIDGER_for_table_strict_priority_tuple_in_request__tuple_out_____table_strict_priority__tuple_in_request_VALID ),
	.tuple_in_request_DATA	( S_BRIDGER_for_table_strict_priority_tuple_in_request__tuple_out_____table_strict_priority__tuple_in_request_DATA ),
	.tuple_out_response_VALID	( table_strict_priority__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE9_VALID ),
	.tuple_out_response_DATA	( table_strict_priority__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE9_DATA ),
	.control_S_AXI_AWADDR	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_AWADDR ),
	.control_S_AXI_AWVALID	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_AWVALID ),
	.control_S_AXI_AWREADY	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_AWREADY ),
	.control_S_AXI_WDATA 	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_WDATA ),
	.control_S_AXI_WSTRB 	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_WSTRB ),
	.control_S_AXI_WVALID	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_WVALID ),
	.control_S_AXI_WREADY	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_WREADY ),
	.control_S_AXI_BRESP 	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_BRESP ),
	.control_S_AXI_BVALID	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_BVALID ),
	.control_S_AXI_BREADY	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_BREADY ),
	.control_S_AXI_ARADDR	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_ARADDR ),
	.control_S_AXI_ARVALID	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_ARVALID ),
	.control_S_AXI_ARREADY	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_ARREADY ),
	.control_S_AXI_RDATA 	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_RDATA ),
	.control_S_AXI_RRESP 	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_RRESP ),
	.control_S_AXI_RVALID	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_RVALID ),
	.control_S_AXI_RREADY	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_RREADY ),
	.clk_lookup          	( clk_lookup ),
	.clk_control         	( clk_control ),
	.clk_lookup_rst_high 	( clk_lookup_rst_high ),
	.clk_control_rst_low 	( clk_control_rst_low )
);

// black box
TopPipe_lvl_0_t
TopPipe_lvl_0
(
	.tuple_in_digest_data_VALID	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE0_____TopPipe_lvl_0__tuple_in_digest_data_VALID ),
	.tuple_in_digest_data_DATA	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE0_____TopPipe_lvl_0__tuple_in_digest_data_DATA ),
	.tuple_in_local_state_VALID	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE1_____TopPipe_lvl_0__tuple_in_local_state_VALID ),
	.tuple_in_local_state_DATA	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE1_____TopPipe_lvl_0__tuple_in_local_state_DATA ),
	.tuple_in_p_VALID    	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE2_____TopPipe_lvl_0__tuple_in_p_VALID ),
	.tuple_in_p_DATA     	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE2_____TopPipe_lvl_0__tuple_in_p_DATA ),
	.tuple_in_sume_metadata_VALID	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE3_____TopPipe_lvl_0__tuple_in_sume_metadata_VALID ),
	.tuple_in_sume_metadata_DATA	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE3_____TopPipe_lvl_0__tuple_in_sume_metadata_DATA ),
	.tuple_in_user_metadata_VALID	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE4_____TopPipe_lvl_0__tuple_in_user_metadata_VALID ),
	.tuple_in_user_metadata_DATA	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE4_____TopPipe_lvl_0__tuple_in_user_metadata_DATA ),
	.tuple_in_table_switch_mode_resp_VALID	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE5_____TopPipe_lvl_0__tuple_in_table_switch_mode_resp_VALID ),
	.tuple_in_table_switch_mode_resp_DATA	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE5_____TopPipe_lvl_0__tuple_in_table_switch_mode_resp_DATA ),
	.tuple_in_table_rank_calc_mode_resp_VALID	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE6_____TopPipe_lvl_0__tuple_in_table_rank_calc_mode_resp_VALID ),
	.tuple_in_table_rank_calc_mode_resp_DATA	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE6_____TopPipe_lvl_0__tuple_in_table_rank_calc_mode_resp_DATA ),
	.tuple_in_table_l2_switch_resp_VALID	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE7_____TopPipe_lvl_0__tuple_in_table_l2_switch_resp_VALID ),
	.tuple_in_table_l2_switch_resp_DATA	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE7_____TopPipe_lvl_0__tuple_in_table_l2_switch_resp_DATA ),
	.tuple_in_table_l1_switch_resp_VALID	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE8_____TopPipe_lvl_0__tuple_in_table_l1_switch_resp_VALID ),
	.tuple_in_table_l1_switch_resp_DATA	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE8_____TopPipe_lvl_0__tuple_in_table_l1_switch_resp_DATA ),
	.tuple_in_table_strict_priority_resp_VALID	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE9_____TopPipe_lvl_0__tuple_in_table_strict_priority_resp_VALID ),
	.tuple_in_table_strict_priority_resp_DATA	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE9_____TopPipe_lvl_0__tuple_in_table_strict_priority_resp_DATA ),
	.tuple_out_p_VALID   	( TopPipe_lvl_0__tuple_out_p_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE0_VALID ),
	.tuple_out_p_DATA    	( TopPipe_lvl_0__tuple_out_p_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE0_DATA ),
	.tuple_out_user_metadata_VALID	( TopPipe_lvl_0__tuple_out_user_metadata_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE1_VALID ),
	.tuple_out_user_metadata_DATA	( TopPipe_lvl_0__tuple_out_user_metadata_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE1_DATA ),
	.tuple_out_digest_data_VALID	( TopPipe_lvl_0__tuple_out_digest_data_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE2_VALID ),
	.tuple_out_digest_data_DATA	( TopPipe_lvl_0__tuple_out_digest_data_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE2_DATA ),
	.tuple_out_sume_metadata_VALID	( TopPipe_lvl_0__tuple_out_sume_metadata_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE3_VALID ),
	.tuple_out_sume_metadata_DATA	( TopPipe_lvl_0__tuple_out_sume_metadata_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE3_DATA ),
	.clk_line            	( clk_line ),
	.rst                 	( clk_line_rst_high )
);

// black box
TopDeparser_t
TopDeparser
(
	.tuple_out_control_VALID	( TopDeparser__tuple_out_control_____S_PROTOCOL_ADAPTER_EGRESS__tuple_in_control_VALID ),
	.tuple_out_control_DATA	( TopDeparser__tuple_out_control_____S_PROTOCOL_ADAPTER_EGRESS__tuple_in_control_DATA ),
	.packet_out_SOF      	( TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_SOF ),
	.packet_out_EOF      	( TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_EOF ),
	.packet_out_VAL      	( TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_VAL ),
	.packet_out_RDY      	( TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_RDY ),
	.packet_out_DAT      	( TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_DAT ),
	.packet_out_CNT      	( TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_CNT ),
	.packet_out_ERR      	( TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_ERR ),
	.tuple_in_p_VALID    	( S_SYNCER_for_TopDeparser__tuple_out_TUPLE0_____TopDeparser__tuple_in_p_VALID ),
	.tuple_in_p_DATA     	( S_SYNCER_for_TopDeparser__tuple_out_TUPLE0_____TopDeparser__tuple_in_p_DATA ),
	.tuple_in_user_metadata_VALID	( S_SYNCER_for_TopDeparser__tuple_out_TUPLE1_____TopDeparser__tuple_in_user_metadata_VALID ),
	.tuple_in_user_metadata_DATA	( S_SYNCER_for_TopDeparser__tuple_out_TUPLE1_____TopDeparser__tuple_in_user_metadata_DATA ),
	.tuple_in_digest_data_VALID	( S_SYNCER_for_TopDeparser__tuple_out_TUPLE2_____TopDeparser__tuple_in_digest_data_VALID ),
	.tuple_in_digest_data_DATA	( S_SYNCER_for_TopDeparser__tuple_out_TUPLE2_____TopDeparser__tuple_in_digest_data_DATA ),
	.tuple_in_sume_metadata_VALID	( S_SYNCER_for_TopDeparser__tuple_out_TUPLE3_____TopDeparser__tuple_in_sume_metadata_VALID ),
	.tuple_in_sume_metadata_DATA	( S_SYNCER_for_TopDeparser__tuple_out_TUPLE3_____TopDeparser__tuple_in_sume_metadata_DATA ),
	.tuple_in_control_VALID	( S_SYNCER_for_TopDeparser__tuple_out_TUPLE4_____TopDeparser__tuple_in_control_VALID ),
	.tuple_in_control_DATA	( S_SYNCER_for_TopDeparser__tuple_out_TUPLE4_____TopDeparser__tuple_in_control_DATA ),
	.packet_in_SOF       	( S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_SOF ),
	.packet_in_EOF       	( S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_EOF ),
	.packet_in_VAL       	( S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_VAL ),
	.packet_in_RDY       	( S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_RDY ),
	.packet_in_DAT       	( S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_DAT ),
	.packet_in_CNT       	( S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_CNT ),
	.packet_in_ERR       	( S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_ERR ),
	.tuple_in_TopDeparser_extracts_VALID	( S_SYNCER_for_TopDeparser__tuple_out_TUPLE6_____TopDeparser__tuple_in_TopDeparser_extracts_VALID ),
	.tuple_in_TopDeparser_extracts_DATA	( S_SYNCER_for_TopDeparser__tuple_out_TUPLE6_____TopDeparser__tuple_in_TopDeparser_extracts_DATA ),
	.tuple_out_digest_data_VALID	( TopDeparser__tuple_out_digest_data_____S_SYNCER_for__OUT___tuple_in_TUPLE0_VALID ),
	.tuple_out_digest_data_DATA	( TopDeparser__tuple_out_digest_data_____S_SYNCER_for__OUT___tuple_in_TUPLE0_DATA ),
	.tuple_out_sume_metadata_VALID	( TopDeparser__tuple_out_sume_metadata_____S_SYNCER_for__OUT___tuple_in_TUPLE1_VALID ),
	.tuple_out_sume_metadata_DATA	( TopDeparser__tuple_out_sume_metadata_____S_SYNCER_for__OUT___tuple_in_TUPLE1_DATA ),
	.backpressure_in     	( S_SYNCER_for__OUT______TopDeparser_BACKPRESSURE_3 ),
	.backpressure_out    	( TopDeparser_____S_SYNCER_for_TopDeparser_BACKPRESSURE ),
	.clk_line            	( clk_line ),
	.rst                 	( clk_line_rst_high )
);

// black box
S_BRIDGER_for_table_switch_mode_tuple_in_request
S_BRIDGER_for_table_switch_mode_tuple_in_request
(
	.tuple_in_VALID      	( TopPipe_lvl__tuple_out_table_switch_mode_req_____S_BRIDGER_for_table_switch_mode_tuple_in_request__tuple_in_VALID ),
	.tuple_in_DATA       	( TopPipe_lvl__tuple_out_table_switch_mode_req_____S_BRIDGER_for_table_switch_mode_tuple_in_request__tuple_in_DATA ),
	.tuple_out_VALID     	( S_BRIDGER_for_table_switch_mode_tuple_in_request__tuple_out_____table_switch_mode__tuple_in_request_VALID ),
	.tuple_out_DATA      	( S_BRIDGER_for_table_switch_mode_tuple_in_request__tuple_out_____table_switch_mode__tuple_in_request_DATA ),
	.clk_lookup          	( clk_lookup ),
	.clk_line            	( clk_line ),
	.clk_line_rst_high   	( clk_line_rst_high ),
	.clk_lookup_rst_high 	( clk_lookup_rst_high )
);

// black box
S_BRIDGER_for_table_rank_calc_mode_tuple_in_request
S_BRIDGER_for_table_rank_calc_mode_tuple_in_request
(
	.tuple_in_VALID      	( TopPipe_lvl__tuple_out_table_rank_calc_mode_req_____S_BRIDGER_for_table_rank_calc_mode_tuple_in_request__tuple_in_VALID ),
	.tuple_in_DATA       	( TopPipe_lvl__tuple_out_table_rank_calc_mode_req_____S_BRIDGER_for_table_rank_calc_mode_tuple_in_request__tuple_in_DATA ),
	.tuple_out_VALID     	( S_BRIDGER_for_table_rank_calc_mode_tuple_in_request__tuple_out_____table_rank_calc_mode__tuple_in_request_VALID ),
	.tuple_out_DATA      	( S_BRIDGER_for_table_rank_calc_mode_tuple_in_request__tuple_out_____table_rank_calc_mode__tuple_in_request_DATA ),
	.clk_lookup          	( clk_lookup ),
	.clk_line            	( clk_line ),
	.clk_line_rst_high   	( clk_line_rst_high ),
	.clk_lookup_rst_high 	( clk_lookup_rst_high )
);

// black box
S_BRIDGER_for_table_l2_switch_tuple_in_request
S_BRIDGER_for_table_l2_switch_tuple_in_request
(
	.tuple_in_VALID      	( TopPipe_lvl__tuple_out_table_l2_switch_req_____S_BRIDGER_for_table_l2_switch_tuple_in_request__tuple_in_VALID ),
	.tuple_in_DATA       	( TopPipe_lvl__tuple_out_table_l2_switch_req_____S_BRIDGER_for_table_l2_switch_tuple_in_request__tuple_in_DATA ),
	.tuple_out_VALID     	( S_BRIDGER_for_table_l2_switch_tuple_in_request__tuple_out_____table_l2_switch__tuple_in_request_VALID ),
	.tuple_out_DATA      	( S_BRIDGER_for_table_l2_switch_tuple_in_request__tuple_out_____table_l2_switch__tuple_in_request_DATA ),
	.clk_lookup          	( clk_lookup ),
	.clk_line            	( clk_line ),
	.clk_line_rst_high   	( clk_line_rst_high ),
	.clk_lookup_rst_high 	( clk_lookup_rst_high )
);

// black box
S_BRIDGER_for_table_l1_switch_tuple_in_request
S_BRIDGER_for_table_l1_switch_tuple_in_request
(
	.tuple_in_VALID      	( TopPipe_lvl__tuple_out_table_l1_switch_req_____S_BRIDGER_for_table_l1_switch_tuple_in_request__tuple_in_VALID ),
	.tuple_in_DATA       	( TopPipe_lvl__tuple_out_table_l1_switch_req_____S_BRIDGER_for_table_l1_switch_tuple_in_request__tuple_in_DATA ),
	.tuple_out_VALID     	( S_BRIDGER_for_table_l1_switch_tuple_in_request__tuple_out_____table_l1_switch__tuple_in_request_VALID ),
	.tuple_out_DATA      	( S_BRIDGER_for_table_l1_switch_tuple_in_request__tuple_out_____table_l1_switch__tuple_in_request_DATA ),
	.clk_lookup          	( clk_lookup ),
	.clk_line            	( clk_line ),
	.clk_line_rst_high   	( clk_line_rst_high ),
	.clk_lookup_rst_high 	( clk_lookup_rst_high )
);

// black box
S_BRIDGER_for_table_strict_priority_tuple_in_request
S_BRIDGER_for_table_strict_priority_tuple_in_request
(
	.tuple_in_VALID      	( TopPipe_lvl__tuple_out_table_strict_priority_req_____S_BRIDGER_for_table_strict_priority_tuple_in_request__tuple_in_VALID ),
	.tuple_in_DATA       	( TopPipe_lvl__tuple_out_table_strict_priority_req_____S_BRIDGER_for_table_strict_priority_tuple_in_request__tuple_in_DATA ),
	.tuple_out_VALID     	( S_BRIDGER_for_table_strict_priority_tuple_in_request__tuple_out_____table_strict_priority__tuple_in_request_VALID ),
	.tuple_out_DATA      	( S_BRIDGER_for_table_strict_priority_tuple_in_request__tuple_out_____table_strict_priority__tuple_in_request_DATA ),
	.clk_lookup          	( clk_lookup ),
	.clk_line            	( clk_line ),
	.clk_line_rst_high   	( clk_line_rst_high ),
	.clk_lookup_rst_high 	( clk_lookup_rst_high )
);

// black box
S_PROTOCOL_ADAPTER_INGRESS
S_PROTOCOL_ADAPTER_INGRESS
(
	.packet_in_TVALID    	( packet_in_packet_in_TVALID ),
	.packet_in_TREADY    	(  ),
	.packet_in_TDATA     	( packet_in_packet_in_TDATA ),
	.packet_in_TKEEP     	( packet_in_packet_in_TKEEP ),
	.packet_in_TLAST     	( packet_in_packet_in_TLAST ),
	.tuple_out_control_VALID	( S_PROTOCOL_ADAPTER_INGRESS__tuple_out_control_____S_SYNCER_for_TopParser__tuple_in_TUPLE1_VALID ),
	.tuple_out_control_DATA	( S_PROTOCOL_ADAPTER_INGRESS__tuple_out_control_____S_SYNCER_for_TopParser__tuple_in_TUPLE1_DATA ),
	.packet_out_SOF      	( S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_SOF ),
	.packet_out_EOF      	( S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_EOF ),
	.packet_out_VAL      	( S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_VAL ),
	.packet_out_RDY      	( packet_in_packet_in_TREADY ),
	.packet_out_DAT      	( S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_DAT ),
	.packet_out_CNT      	( S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_CNT ),
	.packet_out_ERR      	( S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_ERR ),
	.plain_in_init       	( enable_processing ),
	.clk_line            	( clk_line ),
	.rst                 	( clk_line_rst_high )
);

// black box
S_PROTOCOL_ADAPTER_EGRESS
S_PROTOCOL_ADAPTER_EGRESS
(
	.tuple_in_control_VALID	( TopDeparser__tuple_out_control_____S_PROTOCOL_ADAPTER_EGRESS__tuple_in_control_VALID ),
	.tuple_in_control_DATA	( TopDeparser__tuple_out_control_____S_PROTOCOL_ADAPTER_EGRESS__tuple_in_control_DATA ),
	.packet_in_SOF       	( TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_SOF ),
	.packet_in_EOF       	( TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_EOF ),
	.packet_in_VAL       	( TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_VAL ),
	.packet_in_RDY       	( TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_RDY ),
	.packet_in_DAT       	( TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_DAT ),
	.packet_in_CNT       	( TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_CNT ),
	.packet_in_ERR       	( TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_TopDeparser__packet_out_____S_PROTOCOL_ADAPTER_EGRESS__packet_in_ERR ),
	.packet_out_TVALID   	( S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_TVALID ),
	.packet_out_TREADY   	( S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_TREADY ),
	.packet_out_TDATA    	( S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_TDATA ),
	.packet_out_TKEEP    	( S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_TKEEP ),
	.packet_out_TLAST    	( S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_TLAST ),
	.clk_line            	( clk_line ),
	.rst                 	( clk_line_rst_high )
);

// black box
S_SYNCER_for_TopParser
S_SYNCER_for_TopParser
(
	.tuple_in_TUPLE0_VALID	( tuple_in_sume_metadata_VALID ),
	.tuple_in_TUPLE0_DATA	( tuple_in_sume_metadata_DATA ),
	.tuple_out_TUPLE0_VALID	( S_SYNCER_for_TopParser__tuple_out_TUPLE0_____TopParser__tuple_in_sume_metadata_VALID ),
	.tuple_out_TUPLE0_DATA	( S_SYNCER_for_TopParser__tuple_out_TUPLE0_____TopParser__tuple_in_sume_metadata_DATA ),
	.tuple_in_TUPLE1_VALID	( S_PROTOCOL_ADAPTER_INGRESS__tuple_out_control_____S_SYNCER_for_TopParser__tuple_in_TUPLE1_VALID ),
	.tuple_in_TUPLE1_DATA	( S_PROTOCOL_ADAPTER_INGRESS__tuple_out_control_____S_SYNCER_for_TopParser__tuple_in_TUPLE1_DATA ),
	.tuple_out_TUPLE1_VALID	( S_SYNCER_for_TopParser__tuple_out_TUPLE1_____TopParser__tuple_in_control_VALID ),
	.tuple_out_TUPLE1_DATA	( S_SYNCER_for_TopParser__tuple_out_TUPLE1_____TopParser__tuple_in_control_DATA ),
	.packet_in_PACKET2_SOF	( S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_SOF ),
	.packet_in_PACKET2_EOF	( S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_EOF ),
	.packet_in_PACKET2_VAL	( S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_VAL ),
	.packet_in_PACKET2_RDY	( S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_RDY ),
	.packet_in_PACKET2_DAT	( S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_DAT ),
	.packet_in_PACKET2_CNT	( S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_CNT ),
	.packet_in_PACKET2_ERR	( S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_S_PROTOCOL_ADAPTER_INGRESS__packet_out_____S_SYNCER_for_TopParser__packet_in_PACKET2_ERR ),
	.packet_out_PACKET2_SOF	( S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_SOF ),
	.packet_out_PACKET2_EOF	( S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_EOF ),
	.packet_out_PACKET2_VAL	( S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_VAL ),
	.packet_out_PACKET2_RDY	( S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_RDY ),
	.packet_out_PACKET2_DAT	( S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_DAT ),
	.packet_out_PACKET2_CNT	( S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_CNT ),
	.packet_out_PACKET2_ERR	( S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_S_SYNCER_for_TopParser__packet_out_PACKET2_____TopParser__packet_in_ERR ),
	.backpressure_in     	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_TopParser_BACKPRESSURE_3 ),
	.backpressure_out    	( S_SYNCER_for_TopParser______IN__BACKPRESSURE ),
	.clk_in_0            	( clk_line ),
	.rst_in_0            	( clk_line_rst_high ),
	.clk_out_0           	( clk_line ),
	.rst_out_0           	( clk_line_rst_high ),
	.clk_in_1            	( clk_line ),
	.rst_in_1            	( clk_line_rst_high ),
	.clk_out_1           	( clk_line ),
	.rst_out_1           	( clk_line_rst_high ),
	.clk_in_2            	( clk_line ),
	.rst_in_2            	( clk_line_rst_high ),
	.clk_out_2           	( clk_line ),
	.rst_out_2           	( clk_line_rst_high )
);

// black box
S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser
S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser
(
	.tuple_in_TUPLE0_VALID	( TopParser__tuple_out_p_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE0_VALID ),
	.tuple_in_TUPLE0_DATA	( TopParser__tuple_out_p_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE0_DATA ),
	.tuple_out_TUPLE0_VALID	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE0_____TopPipe_lvl__tuple_in_p_VALID ),
	.tuple_out_TUPLE0_DATA	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE0_____TopPipe_lvl__tuple_in_p_DATA ),
	.tuple_in_TUPLE1_VALID	( TopParser__tuple_out_user_metadata_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE1_VALID ),
	.tuple_in_TUPLE1_DATA	( TopParser__tuple_out_user_metadata_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE1_DATA ),
	.tuple_out_TUPLE1_VALID	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE1_____TopPipe_lvl__tuple_in_user_metadata_VALID ),
	.tuple_out_TUPLE1_DATA	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE1_____TopPipe_lvl__tuple_in_user_metadata_DATA ),
	.tuple_in_TUPLE2_VALID	( TopParser__tuple_out_digest_data_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE2_VALID ),
	.tuple_in_TUPLE2_DATA	( TopParser__tuple_out_digest_data_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE2_DATA ),
	.tuple_out_TUPLE2_VALID	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE2_____TopPipe_lvl__tuple_in_digest_data_VALID ),
	.tuple_out_TUPLE2_DATA	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE2_____TopPipe_lvl__tuple_in_digest_data_DATA ),
	.tuple_in_TUPLE3_VALID	( TopParser__tuple_out_sume_metadata_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE3_VALID ),
	.tuple_in_TUPLE3_DATA	( TopParser__tuple_out_sume_metadata_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE3_DATA ),
	.tuple_out_TUPLE3_VALID	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE3_____TopPipe_lvl__tuple_in_sume_metadata_VALID ),
	.tuple_out_TUPLE3_DATA	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE3_____TopPipe_lvl__tuple_in_sume_metadata_DATA ),
	.tuple_in_TUPLE4_VALID	( TopParser__tuple_out_control_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE4_VALID ),
	.tuple_in_TUPLE4_DATA	( TopParser__tuple_out_control_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE4_DATA ),
	.packet_in_PACKET5_SOF	( TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_SOF ),
	.packet_in_PACKET5_EOF	( TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_EOF ),
	.packet_in_PACKET5_VAL	( TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_VAL ),
	.packet_in_PACKET5_RDY	( TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_RDY ),
	.packet_in_PACKET5_DAT	( TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_DAT ),
	.packet_in_PACKET5_CNT	( TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_CNT ),
	.packet_in_PACKET5_ERR	( TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_TopParser__packet_out_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET5_ERR ),
	.tuple_in_TUPLE6_VALID	( TopParser__tuple_out_TopParser_extracts_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE6_VALID ),
	.tuple_in_TUPLE6_DATA	( TopParser__tuple_out_TopParser_extracts_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE6_DATA ),
	.tuple_out_TUPLE4_VALID	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE4_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE10_VALID ),
	.tuple_out_TUPLE4_DATA	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE4_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE10_DATA ),
	.packet_out_PACKET5_SOF	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_SOF ),
	.packet_out_PACKET5_EOF	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_EOF ),
	.packet_out_PACKET5_VAL	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_VAL ),
	.packet_out_PACKET5_RDY	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_RDY ),
	.packet_out_PACKET5_DAT	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_DAT ),
	.packet_out_PACKET5_CNT	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_CNT ),
	.packet_out_PACKET5_ERR	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_ERR ),
	.tuple_out_TUPLE6_VALID	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE6_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE12_VALID ),
	.tuple_out_TUPLE6_DATA	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE6_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE12_DATA ),
	.backpressure_in     	( S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE_3 ),
	.backpressure_out    	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_TopParser_BACKPRESSURE ),
	.clk_in_0            	( clk_line ),
	.rst_in_0            	( clk_line_rst_high ),
	.clk_out_0           	( clk_line ),
	.rst_out_0           	( clk_line_rst_high ),
	.clk_in_1            	( clk_line ),
	.rst_in_1            	( clk_line_rst_high ),
	.clk_out_1           	( clk_line ),
	.rst_out_1           	( clk_line_rst_high ),
	.clk_in_2            	( clk_line ),
	.rst_in_2            	( clk_line_rst_high ),
	.clk_out_2           	( clk_line ),
	.rst_out_2           	( clk_line_rst_high ),
	.clk_in_3            	( clk_line ),
	.rst_in_3            	( clk_line_rst_high ),
	.clk_out_3           	( clk_line ),
	.rst_out_3           	( clk_line_rst_high ),
	.clk_in_4            	( clk_line ),
	.rst_in_4            	( clk_line_rst_high ),
	.clk_out_4           	( clk_line ),
	.rst_out_4           	( clk_line_rst_high ),
	.clk_in_5            	( clk_line ),
	.rst_in_5            	( clk_line_rst_high ),
	.clk_out_5           	( clk_line ),
	.rst_out_5           	( clk_line_rst_high ),
	.clk_in_6            	( clk_line ),
	.rst_in_6            	( clk_line_rst_high ),
	.clk_out_6           	( clk_line ),
	.rst_out_6           	( clk_line_rst_high )
);

// black box
S_SYNCER_for_S_SYNCER_for_TopDeparser
S_SYNCER_for_S_SYNCER_for_TopDeparser
(
	.tuple_in_TUPLE0_VALID	( TopPipe_lvl__tuple_out_digest_data_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE0_VALID ),
	.tuple_in_TUPLE0_DATA	( TopPipe_lvl__tuple_out_digest_data_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE0_DATA ),
	.tuple_out_TUPLE0_VALID	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE0_____TopPipe_lvl_0__tuple_in_digest_data_VALID ),
	.tuple_out_TUPLE0_DATA	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE0_____TopPipe_lvl_0__tuple_in_digest_data_DATA ),
	.tuple_in_TUPLE1_VALID	( TopPipe_lvl__tuple_out_local_state_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE1_VALID ),
	.tuple_in_TUPLE1_DATA	( TopPipe_lvl__tuple_out_local_state_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE1_DATA ),
	.tuple_out_TUPLE1_VALID	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE1_____TopPipe_lvl_0__tuple_in_local_state_VALID ),
	.tuple_out_TUPLE1_DATA	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE1_____TopPipe_lvl_0__tuple_in_local_state_DATA ),
	.tuple_in_TUPLE2_VALID	( TopPipe_lvl__tuple_out_p_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE2_VALID ),
	.tuple_in_TUPLE2_DATA	( TopPipe_lvl__tuple_out_p_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE2_DATA ),
	.tuple_out_TUPLE2_VALID	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE2_____TopPipe_lvl_0__tuple_in_p_VALID ),
	.tuple_out_TUPLE2_DATA	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE2_____TopPipe_lvl_0__tuple_in_p_DATA ),
	.tuple_in_TUPLE3_VALID	( TopPipe_lvl__tuple_out_sume_metadata_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE3_VALID ),
	.tuple_in_TUPLE3_DATA	( TopPipe_lvl__tuple_out_sume_metadata_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE3_DATA ),
	.tuple_out_TUPLE3_VALID	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE3_____TopPipe_lvl_0__tuple_in_sume_metadata_VALID ),
	.tuple_out_TUPLE3_DATA	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE3_____TopPipe_lvl_0__tuple_in_sume_metadata_DATA ),
	.tuple_in_TUPLE4_VALID	( TopPipe_lvl__tuple_out_user_metadata_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE4_VALID ),
	.tuple_in_TUPLE4_DATA	( TopPipe_lvl__tuple_out_user_metadata_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE4_DATA ),
	.tuple_out_TUPLE4_VALID	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE4_____TopPipe_lvl_0__tuple_in_user_metadata_VALID ),
	.tuple_out_TUPLE4_DATA	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE4_____TopPipe_lvl_0__tuple_in_user_metadata_DATA ),
	.tuple_in_TUPLE5_VALID	( table_switch_mode__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE5_VALID ),
	.tuple_in_TUPLE5_DATA	( table_switch_mode__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE5_DATA ),
	.tuple_out_TUPLE5_VALID	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE5_____TopPipe_lvl_0__tuple_in_table_switch_mode_resp_VALID ),
	.tuple_out_TUPLE5_DATA	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE5_____TopPipe_lvl_0__tuple_in_table_switch_mode_resp_DATA ),
	.tuple_in_TUPLE6_VALID	( table_rank_calc_mode__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE6_VALID ),
	.tuple_in_TUPLE6_DATA	( table_rank_calc_mode__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE6_DATA ),
	.tuple_out_TUPLE6_VALID	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE6_____TopPipe_lvl_0__tuple_in_table_rank_calc_mode_resp_VALID ),
	.tuple_out_TUPLE6_DATA	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE6_____TopPipe_lvl_0__tuple_in_table_rank_calc_mode_resp_DATA ),
	.tuple_in_TUPLE7_VALID	( table_l2_switch__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE7_VALID ),
	.tuple_in_TUPLE7_DATA	( table_l2_switch__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE7_DATA ),
	.tuple_out_TUPLE7_VALID	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE7_____TopPipe_lvl_0__tuple_in_table_l2_switch_resp_VALID ),
	.tuple_out_TUPLE7_DATA	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE7_____TopPipe_lvl_0__tuple_in_table_l2_switch_resp_DATA ),
	.tuple_in_TUPLE8_VALID	( table_l1_switch__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE8_VALID ),
	.tuple_in_TUPLE8_DATA	( table_l1_switch__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE8_DATA ),
	.tuple_out_TUPLE8_VALID	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE8_____TopPipe_lvl_0__tuple_in_table_l1_switch_resp_VALID ),
	.tuple_out_TUPLE8_DATA	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE8_____TopPipe_lvl_0__tuple_in_table_l1_switch_resp_DATA ),
	.tuple_in_TUPLE9_VALID	( table_strict_priority__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE9_VALID ),
	.tuple_in_TUPLE9_DATA	( table_strict_priority__tuple_out_response_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE9_DATA ),
	.tuple_out_TUPLE9_VALID	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE9_____TopPipe_lvl_0__tuple_in_table_strict_priority_resp_VALID ),
	.tuple_out_TUPLE9_DATA	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE9_____TopPipe_lvl_0__tuple_in_table_strict_priority_resp_DATA ),
	.tuple_in_TUPLE10_VALID	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE4_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE10_VALID ),
	.tuple_in_TUPLE10_DATA	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE4_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE10_DATA ),
	.packet_in_PACKET11_SOF	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_SOF ),
	.packet_in_PACKET11_EOF	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_EOF ),
	.packet_in_PACKET11_VAL	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_VAL ),
	.packet_in_PACKET11_RDY	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_RDY ),
	.packet_in_PACKET11_DAT	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_DAT ),
	.packet_in_PACKET11_CNT	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_CNT ),
	.packet_in_PACKET11_ERR	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_in_PACKET11_ERR ),
	.tuple_in_TUPLE12_VALID	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE6_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE12_VALID ),
	.tuple_in_TUPLE12_DATA	( S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE6_____S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_in_TUPLE12_DATA ),
	.tuple_out_TUPLE10_VALID	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE10_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE4_VALID ),
	.tuple_out_TUPLE10_DATA	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE10_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE4_DATA ),
	.packet_out_PACKET11_SOF	( S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_SOF ),
	.packet_out_PACKET11_EOF	( S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_EOF ),
	.packet_out_PACKET11_VAL	( S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_VAL ),
	.packet_out_PACKET11_RDY	( S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_RDY ),
	.packet_out_PACKET11_DAT	( S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_DAT ),
	.packet_out_PACKET11_CNT	( S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_CNT ),
	.packet_out_PACKET11_ERR	( S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_ERR ),
	.tuple_out_TUPLE12_VALID	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE12_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE6_VALID ),
	.tuple_out_TUPLE12_DATA	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE12_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE6_DATA ),
	.backpressure_in     	( S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE_3 ),
	.backpressure_out    	( S_SYNCER_for_S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE ),
	.clk_in_0            	( clk_line ),
	.rst_in_0            	( clk_line_rst_high ),
	.clk_out_0           	( clk_line ),
	.rst_out_0           	( clk_line_rst_high ),
	.clk_in_1            	( clk_line ),
	.rst_in_1            	( clk_line_rst_high ),
	.clk_out_1           	( clk_line ),
	.rst_out_1           	( clk_line_rst_high ),
	.clk_in_2            	( clk_line ),
	.rst_in_2            	( clk_line_rst_high ),
	.clk_out_2           	( clk_line ),
	.rst_out_2           	( clk_line_rst_high ),
	.clk_in_3            	( clk_line ),
	.rst_in_3            	( clk_line_rst_high ),
	.clk_out_3           	( clk_line ),
	.rst_out_3           	( clk_line_rst_high ),
	.clk_in_4            	( clk_line ),
	.rst_in_4            	( clk_line_rst_high ),
	.clk_out_4           	( clk_line ),
	.rst_out_4           	( clk_line_rst_high ),
	.clk_in_5            	( clk_line ),
	.rst_in_5            	( clk_line_rst_high ),
	.clk_out_5           	( clk_line ),
	.rst_out_5           	( clk_line_rst_high ),
	.clk_in_6            	( clk_lookup ),
	.rst_in_6            	( clk_lookup_rst_high ),
	.clk_out_6           	( clk_line ),
	.rst_out_6           	( clk_line_rst_high ),
	.clk_in_7            	( clk_lookup ),
	.rst_in_7            	( clk_lookup_rst_high ),
	.clk_out_7           	( clk_line ),
	.rst_out_7           	( clk_line_rst_high ),
	.clk_in_8            	( clk_lookup ),
	.rst_in_8            	( clk_lookup_rst_high ),
	.clk_out_8           	( clk_line ),
	.rst_out_8           	( clk_line_rst_high ),
	.clk_in_9            	( clk_lookup ),
	.rst_in_9            	( clk_lookup_rst_high ),
	.clk_out_9           	( clk_line ),
	.rst_out_9           	( clk_line_rst_high ),
	.clk_in_10           	( clk_lookup ),
	.rst_in_10           	( clk_lookup_rst_high ),
	.clk_out_10          	( clk_line ),
	.rst_out_10          	( clk_line_rst_high ),
	.clk_in_11           	( clk_line ),
	.rst_in_11           	( clk_line_rst_high ),
	.clk_out_11          	( clk_line ),
	.rst_out_11          	( clk_line_rst_high ),
	.clk_in_12           	( clk_line ),
	.rst_in_12           	( clk_line_rst_high ),
	.clk_out_12          	( clk_line ),
	.rst_out_12          	( clk_line_rst_high )
);

// black box
S_SYNCER_for_TopDeparser
S_SYNCER_for_TopDeparser
(
	.tuple_in_TUPLE0_VALID	( TopPipe_lvl_0__tuple_out_p_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE0_VALID ),
	.tuple_in_TUPLE0_DATA	( TopPipe_lvl_0__tuple_out_p_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE0_DATA ),
	.tuple_out_TUPLE0_VALID	( S_SYNCER_for_TopDeparser__tuple_out_TUPLE0_____TopDeparser__tuple_in_p_VALID ),
	.tuple_out_TUPLE0_DATA	( S_SYNCER_for_TopDeparser__tuple_out_TUPLE0_____TopDeparser__tuple_in_p_DATA ),
	.tuple_in_TUPLE1_VALID	( TopPipe_lvl_0__tuple_out_user_metadata_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE1_VALID ),
	.tuple_in_TUPLE1_DATA	( TopPipe_lvl_0__tuple_out_user_metadata_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE1_DATA ),
	.tuple_out_TUPLE1_VALID	( S_SYNCER_for_TopDeparser__tuple_out_TUPLE1_____TopDeparser__tuple_in_user_metadata_VALID ),
	.tuple_out_TUPLE1_DATA	( S_SYNCER_for_TopDeparser__tuple_out_TUPLE1_____TopDeparser__tuple_in_user_metadata_DATA ),
	.tuple_in_TUPLE2_VALID	( TopPipe_lvl_0__tuple_out_digest_data_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE2_VALID ),
	.tuple_in_TUPLE2_DATA	( TopPipe_lvl_0__tuple_out_digest_data_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE2_DATA ),
	.tuple_out_TUPLE2_VALID	( S_SYNCER_for_TopDeparser__tuple_out_TUPLE2_____TopDeparser__tuple_in_digest_data_VALID ),
	.tuple_out_TUPLE2_DATA	( S_SYNCER_for_TopDeparser__tuple_out_TUPLE2_____TopDeparser__tuple_in_digest_data_DATA ),
	.tuple_in_TUPLE3_VALID	( TopPipe_lvl_0__tuple_out_sume_metadata_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE3_VALID ),
	.tuple_in_TUPLE3_DATA	( TopPipe_lvl_0__tuple_out_sume_metadata_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE3_DATA ),
	.tuple_out_TUPLE3_VALID	( S_SYNCER_for_TopDeparser__tuple_out_TUPLE3_____TopDeparser__tuple_in_sume_metadata_VALID ),
	.tuple_out_TUPLE3_DATA	( S_SYNCER_for_TopDeparser__tuple_out_TUPLE3_____TopDeparser__tuple_in_sume_metadata_DATA ),
	.tuple_in_TUPLE4_VALID	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE10_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE4_VALID ),
	.tuple_in_TUPLE4_DATA	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE10_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE4_DATA ),
	.tuple_out_TUPLE4_VALID	( S_SYNCER_for_TopDeparser__tuple_out_TUPLE4_____TopDeparser__tuple_in_control_VALID ),
	.tuple_out_TUPLE4_DATA	( S_SYNCER_for_TopDeparser__tuple_out_TUPLE4_____TopDeparser__tuple_in_control_DATA ),
	.packet_in_PACKET5_SOF	( S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_SOF ),
	.packet_in_PACKET5_EOF	( S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_EOF ),
	.packet_in_PACKET5_VAL	( S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_VAL ),
	.packet_in_PACKET5_RDY	( S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_RDY ),
	.packet_in_PACKET5_DAT	( S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_DAT ),
	.packet_in_PACKET5_CNT	( S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_CNT ),
	.packet_in_PACKET5_ERR	( S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_S_SYNCER_for_S_SYNCER_for_TopDeparser__packet_out_PACKET11_____S_SYNCER_for_TopDeparser__packet_in_PACKET5_ERR ),
	.packet_out_PACKET5_SOF	( S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_SOF ),
	.packet_out_PACKET5_EOF	( S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_EOF ),
	.packet_out_PACKET5_VAL	( S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_VAL ),
	.packet_out_PACKET5_RDY	( S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_RDY ),
	.packet_out_PACKET5_DAT	( S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_DAT ),
	.packet_out_PACKET5_CNT	( S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_CNT ),
	.packet_out_PACKET5_ERR	( S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_S_SYNCER_for_TopDeparser__packet_out_PACKET5_____TopDeparser__packet_in_ERR ),
	.tuple_in_TUPLE6_VALID	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE12_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE6_VALID ),
	.tuple_in_TUPLE6_DATA	( S_SYNCER_for_S_SYNCER_for_TopDeparser__tuple_out_TUPLE12_____S_SYNCER_for_TopDeparser__tuple_in_TUPLE6_DATA ),
	.tuple_out_TUPLE6_VALID	( S_SYNCER_for_TopDeparser__tuple_out_TUPLE6_____TopDeparser__tuple_in_TopDeparser_extracts_VALID ),
	.tuple_out_TUPLE6_DATA	( S_SYNCER_for_TopDeparser__tuple_out_TUPLE6_____TopDeparser__tuple_in_TopDeparser_extracts_DATA ),
	.backpressure_in     	( TopDeparser_____S_SYNCER_for_TopDeparser_BACKPRESSURE ),
	.backpressure_out    	( S_SYNCER_for_TopDeparser_____S_SYNCER_for_S_SYNCER_for_TopDeparser_BACKPRESSURE ),
	.clk_in_0            	( clk_line ),
	.rst_in_0            	( clk_line_rst_high ),
	.clk_out_0           	( clk_line ),
	.rst_out_0           	( clk_line_rst_high ),
	.clk_in_1            	( clk_line ),
	.rst_in_1            	( clk_line_rst_high ),
	.clk_out_1           	( clk_line ),
	.rst_out_1           	( clk_line_rst_high ),
	.clk_in_2            	( clk_line ),
	.rst_in_2            	( clk_line_rst_high ),
	.clk_out_2           	( clk_line ),
	.rst_out_2           	( clk_line_rst_high ),
	.clk_in_3            	( clk_line ),
	.rst_in_3            	( clk_line_rst_high ),
	.clk_out_3           	( clk_line ),
	.rst_out_3           	( clk_line_rst_high ),
	.clk_in_4            	( clk_line ),
	.rst_in_4            	( clk_line_rst_high ),
	.clk_out_4           	( clk_line ),
	.rst_out_4           	( clk_line_rst_high ),
	.clk_in_5            	( clk_line ),
	.rst_in_5            	( clk_line_rst_high ),
	.clk_out_5           	( clk_line ),
	.rst_out_5           	( clk_line_rst_high ),
	.clk_in_6            	( clk_line ),
	.rst_in_6            	( clk_line_rst_high ),
	.clk_out_6           	( clk_line ),
	.rst_out_6           	( clk_line_rst_high )
);

// black box
S_SYNCER_for__OUT_
S_SYNCER_for__OUT_
(
	.tuple_in_TUPLE0_VALID	( TopDeparser__tuple_out_digest_data_____S_SYNCER_for__OUT___tuple_in_TUPLE0_VALID ),
	.tuple_in_TUPLE0_DATA	( TopDeparser__tuple_out_digest_data_____S_SYNCER_for__OUT___tuple_in_TUPLE0_DATA ),
	.tuple_out_TUPLE0_VALID	( tuple_out_digest_data_VALID ),
	.tuple_out_TUPLE0_DATA	( tuple_out_digest_data_DATA ),
	.tuple_in_TUPLE1_VALID	( TopDeparser__tuple_out_sume_metadata_____S_SYNCER_for__OUT___tuple_in_TUPLE1_VALID ),
	.tuple_in_TUPLE1_DATA	( TopDeparser__tuple_out_sume_metadata_____S_SYNCER_for__OUT___tuple_in_TUPLE1_DATA ),
	.tuple_out_TUPLE1_VALID	( tuple_out_sume_metadata_VALID ),
	.tuple_out_TUPLE1_DATA	( tuple_out_sume_metadata_DATA ),
	.packet_in_PACKET2_TVALID	( S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_TVALID ),
	.packet_in_PACKET2_TREADY	( S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_TREADY ),
	.packet_in_PACKET2_TDATA	( S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_TDATA ),
	.packet_in_PACKET2_TKEEP	( S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_TKEEP ),
	.packet_in_PACKET2_TLAST	( S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_S_PROTOCOL_ADAPTER_EGRESS__packet_out_____S_SYNCER_for__OUT___packet_in_PACKET2_TLAST ),
	.packet_out_PACKET2_TVALID	( packet_out_packet_out_TVALID ),
	.packet_out_PACKET2_TREADY	( packet_out_packet_out_TREADY ),
	.packet_out_PACKET2_TDATA	( packet_out_packet_out_TDATA ),
	.packet_out_PACKET2_TKEEP	( packet_out_packet_out_TKEEP ),
	.packet_out_PACKET2_TLAST	( packet_out_packet_out_TLAST ),
	.backpressure_in     	( ~(packet_out_packet_out_TREADY) ),
	.backpressure_out    	( S_SYNCER_for__OUT______TopDeparser_BACKPRESSURE ),
	.clk_in_0            	( clk_line ),
	.rst_in_0            	( clk_line_rst_high ),
	.clk_out_0           	( clk_line ),
	.rst_out_0           	( clk_line_rst_high ),
	.clk_in_1            	( clk_line ),
	.rst_in_1            	( clk_line_rst_high ),
	.clk_out_1           	( clk_line ),
	.rst_out_1           	( clk_line_rst_high ),
	.clk_in_2            	( clk_line ),
	.rst_in_2            	( clk_line_rst_high ),
	.clk_out_2           	( clk_line ),
	.rst_out_2           	( clk_line_rst_high )
);

// black box
S_CONTROLLER_SimpleSumeSwitch
S_CONTROL_SimpleSumeSwitch
(
	.enable_processing   	( ),
	.table_switch_mode_control_S_AXI_AWADDR	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_AWADDR ),
	.table_switch_mode_control_S_AXI_AWVALID	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_AWVALID ),
	.table_switch_mode_control_S_AXI_AWREADY	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_AWREADY ),
	.table_switch_mode_control_S_AXI_WDATA	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_WDATA ),
	.table_switch_mode_control_S_AXI_WSTRB	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_WSTRB ),
	.table_switch_mode_control_S_AXI_WVALID	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_WVALID ),
	.table_switch_mode_control_S_AXI_WREADY	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_WREADY ),
	.table_switch_mode_control_S_AXI_BRESP	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_BRESP ),
	.table_switch_mode_control_S_AXI_BVALID	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_BVALID ),
	.table_switch_mode_control_S_AXI_BREADY	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_BREADY ),
	.table_switch_mode_control_S_AXI_ARADDR	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_ARADDR ),
	.table_switch_mode_control_S_AXI_ARVALID	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_ARVALID ),
	.table_switch_mode_control_S_AXI_ARREADY	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_ARREADY ),
	.table_switch_mode_control_S_AXI_RDATA	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_RDATA ),
	.table_switch_mode_control_S_AXI_RRESP	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_RRESP ),
	.table_switch_mode_control_S_AXI_RVALID	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_RVALID ),
	.table_switch_mode_control_S_AXI_RREADY	( S_CONTROL_SimpleSumeSwitch__table_switch_mode_control_____table_switch_mode__control_S_AXI_RREADY ),
	.table_rank_calc_mode_control_S_AXI_AWADDR	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_AWADDR ),
	.table_rank_calc_mode_control_S_AXI_AWVALID	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_AWVALID ),
	.table_rank_calc_mode_control_S_AXI_AWREADY	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_AWREADY ),
	.table_rank_calc_mode_control_S_AXI_WDATA	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_WDATA ),
	.table_rank_calc_mode_control_S_AXI_WSTRB	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_WSTRB ),
	.table_rank_calc_mode_control_S_AXI_WVALID	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_WVALID ),
	.table_rank_calc_mode_control_S_AXI_WREADY	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_WREADY ),
	.table_rank_calc_mode_control_S_AXI_BRESP	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_BRESP ),
	.table_rank_calc_mode_control_S_AXI_BVALID	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_BVALID ),
	.table_rank_calc_mode_control_S_AXI_BREADY	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_BREADY ),
	.table_rank_calc_mode_control_S_AXI_ARADDR	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_ARADDR ),
	.table_rank_calc_mode_control_S_AXI_ARVALID	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_ARVALID ),
	.table_rank_calc_mode_control_S_AXI_ARREADY	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_ARREADY ),
	.table_rank_calc_mode_control_S_AXI_RDATA	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_RDATA ),
	.table_rank_calc_mode_control_S_AXI_RRESP	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_RRESP ),
	.table_rank_calc_mode_control_S_AXI_RVALID	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_RVALID ),
	.table_rank_calc_mode_control_S_AXI_RREADY	( S_CONTROL_SimpleSumeSwitch__table_rank_calc_mode_control_____table_rank_calc_mode__control_S_AXI_RREADY ),
	.table_l2_switch_control_S_AXI_AWADDR	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_AWADDR ),
	.table_l2_switch_control_S_AXI_AWVALID	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_AWVALID ),
	.table_l2_switch_control_S_AXI_AWREADY	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_AWREADY ),
	.table_l2_switch_control_S_AXI_WDATA	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_WDATA ),
	.table_l2_switch_control_S_AXI_WSTRB	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_WSTRB ),
	.table_l2_switch_control_S_AXI_WVALID	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_WVALID ),
	.table_l2_switch_control_S_AXI_WREADY	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_WREADY ),
	.table_l2_switch_control_S_AXI_BRESP	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_BRESP ),
	.table_l2_switch_control_S_AXI_BVALID	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_BVALID ),
	.table_l2_switch_control_S_AXI_BREADY	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_BREADY ),
	.table_l2_switch_control_S_AXI_ARADDR	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_ARADDR ),
	.table_l2_switch_control_S_AXI_ARVALID	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_ARVALID ),
	.table_l2_switch_control_S_AXI_ARREADY	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_ARREADY ),
	.table_l2_switch_control_S_AXI_RDATA	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_RDATA ),
	.table_l2_switch_control_S_AXI_RRESP	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_RRESP ),
	.table_l2_switch_control_S_AXI_RVALID	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_RVALID ),
	.table_l2_switch_control_S_AXI_RREADY	( S_CONTROL_SimpleSumeSwitch__table_l2_switch_control_____table_l2_switch__control_S_AXI_RREADY ),
	.table_l1_switch_control_S_AXI_AWADDR	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_AWADDR ),
	.table_l1_switch_control_S_AXI_AWVALID	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_AWVALID ),
	.table_l1_switch_control_S_AXI_AWREADY	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_AWREADY ),
	.table_l1_switch_control_S_AXI_WDATA	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_WDATA ),
	.table_l1_switch_control_S_AXI_WSTRB	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_WSTRB ),
	.table_l1_switch_control_S_AXI_WVALID	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_WVALID ),
	.table_l1_switch_control_S_AXI_WREADY	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_WREADY ),
	.table_l1_switch_control_S_AXI_BRESP	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_BRESP ),
	.table_l1_switch_control_S_AXI_BVALID	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_BVALID ),
	.table_l1_switch_control_S_AXI_BREADY	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_BREADY ),
	.table_l1_switch_control_S_AXI_ARADDR	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_ARADDR ),
	.table_l1_switch_control_S_AXI_ARVALID	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_ARVALID ),
	.table_l1_switch_control_S_AXI_ARREADY	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_ARREADY ),
	.table_l1_switch_control_S_AXI_RDATA	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_RDATA ),
	.table_l1_switch_control_S_AXI_RRESP	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_RRESP ),
	.table_l1_switch_control_S_AXI_RVALID	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_RVALID ),
	.table_l1_switch_control_S_AXI_RREADY	( S_CONTROL_SimpleSumeSwitch__table_l1_switch_control_____table_l1_switch__control_S_AXI_RREADY ),
	.table_strict_priority_control_S_AXI_AWADDR	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_AWADDR ),
	.table_strict_priority_control_S_AXI_AWVALID	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_AWVALID ),
	.table_strict_priority_control_S_AXI_AWREADY	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_AWREADY ),
	.table_strict_priority_control_S_AXI_WDATA	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_WDATA ),
	.table_strict_priority_control_S_AXI_WSTRB	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_WSTRB ),
	.table_strict_priority_control_S_AXI_WVALID	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_WVALID ),
	.table_strict_priority_control_S_AXI_WREADY	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_WREADY ),
	.table_strict_priority_control_S_AXI_BRESP	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_BRESP ),
	.table_strict_priority_control_S_AXI_BVALID	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_BVALID ),
	.table_strict_priority_control_S_AXI_BREADY	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_BREADY ),
	.table_strict_priority_control_S_AXI_ARADDR	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_ARADDR ),
	.table_strict_priority_control_S_AXI_ARVALID	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_ARVALID ),
	.table_strict_priority_control_S_AXI_ARREADY	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_ARREADY ),
	.table_strict_priority_control_S_AXI_RDATA	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_RDATA ),
	.table_strict_priority_control_S_AXI_RRESP	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_RRESP ),
	.table_strict_priority_control_S_AXI_RVALID	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_RVALID ),
	.table_strict_priority_control_S_AXI_RREADY	( S_CONTROL_SimpleSumeSwitch__table_strict_priority_control_____table_strict_priority__control_S_AXI_RREADY ),
	.control_S_AXI_AWADDR	( control_S_AXI_AWADDR ),
	.control_S_AXI_AWVALID	( control_S_AXI_AWVALID ),
	.control_S_AXI_AWREADY	( control_S_AXI_AWREADY ),
	.control_S_AXI_WDATA 	( control_S_AXI_WDATA ),
	.control_S_AXI_WSTRB 	( control_S_AXI_WSTRB ),
	.control_S_AXI_WVALID	( control_S_AXI_WVALID ),
	.control_S_AXI_WREADY	( control_S_AXI_WREADY ),
	.control_S_AXI_BRESP 	( control_S_AXI_BRESP ),
	.control_S_AXI_BVALID	( control_S_AXI_BVALID ),
	.control_S_AXI_BREADY	( control_S_AXI_BREADY ),
	.control_S_AXI_ARADDR	( control_S_AXI_ARADDR ),
	.control_S_AXI_ARVALID	( control_S_AXI_ARVALID ),
	.control_S_AXI_ARREADY	( control_S_AXI_ARREADY ),
	.control_S_AXI_RDATA 	( control_S_AXI_RDATA ),
	.control_S_AXI_RRESP 	( control_S_AXI_RRESP ),
	.control_S_AXI_RVALID	( control_S_AXI_RVALID ),
	.control_S_AXI_RREADY	( control_S_AXI_RREADY ),
	.clk_control         	( clk_control ),
	.rst                 	( clk_control_rst_high )
);


endmodule

// machine-generated file - do NOT modify by hand !
// File created on 2020/10/03 20:31:34
// by Barista HDL generation library, version TRUNK @ 1007984

