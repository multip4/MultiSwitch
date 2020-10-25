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
Output Checking Module
*/

`timescale 1 ps / 1 ps

module Check (
	file_done,
	fw_done,
	rst,
	clk_n,
	check_eof,
	tuple_out_valid,
	tuple_out_digest_data,
	tuple_out_sume_metadata,
	packet_out_avail,
	packet_out_tready,
	packet_out_tvalid,
	packet_out_tlast,
	packet_out_tkeep,
	packet_out_tdata
);

input file_done ;
input fw_done ;
input rst ;
input clk_n ;
output check_eof ;
input tuple_out_valid ;
input [255:0] tuple_out_digest_data ;
input [159:0] tuple_out_sume_metadata ;
output packet_out_avail ;
input packet_out_tready ;
input packet_out_tvalid ;
input packet_out_tlast ;
input [31:0] packet_out_tkeep ;
input [255:0] packet_out_tdata ;

reg [31:0] fd_pkt ;
reg [31:0] fd_tup ;
reg check_eof ;
reg [31:0] pktCnt ;
reg [31:0] wordCnt ;
wire ready ;
wire dataVld ;
wire dataEop ;
reg [255:0] tuple_exp_tuple_out_digest_data ;
reg [159:0] tuple_exp_tuple_out_sume_metadata ;
wire packet_out_avail ;
reg packet_exp_tlast ;
reg [31:0] packet_exp_tkeep ;
reg [255:0] packet_exp_tdata ;
reg [255:0] packet_out_mask ;

always @( posedge file_done ) begin
	fd_pkt <= $fopen("Packet_expect.axi", "r") ;
	fd_tup <= $fopen("Tuple_expect.txt", "r") ;
end

always @( posedge clk_n ) begin
	if ( rst ) begin
		pktCnt <= 1 ;
		wordCnt <= 0 ;
	end
	else  begin
		if ( ( dataVld && ready ) ) begin
			pktCnt <= ( dataEop ? ( pktCnt + 1 ) : pktCnt ) ;
			wordCnt <= ( dataEop ? 0 : ( wordCnt + 1 ) ) ;
		end
	end
end

always @( posedge clk_n ) begin
	if ( rst ) begin
		tuple_exp_tuple_out_digest_data <= 'hX ;
		tuple_exp_tuple_out_sume_metadata <= 'hX ;
	end
	if ( ( ( ( !rst && file_done ) && fw_done ) && tuple_out_valid ) ) begin
		if ( ( 32'h2 != $fscanf(fd_tup, "%x %x ", tuple_exp_tuple_out_digest_data, tuple_exp_tuple_out_sume_metadata) ) ) begin
			$display("[%0t] ERROR: error reading expected tuple file", $time);
			$finish(1);
		end
		else  begin
			if ( ( { tuple_exp_tuple_out_digest_data, tuple_exp_tuple_out_sume_metadata } == { tuple_out_digest_data, tuple_out_sume_metadata } ) ) begin
				$display("[%0t]  INFO: packet %0d tuple OK < tuple_out_digest_data, tuple_out_sume_metadata > = < %x %x >", $time, pktCnt, tuple_out_digest_data, tuple_out_sume_metadata);
			end
			else  begin
				$display("[%0t] ERROR: tuple mismatch for packet %0d", $time, pktCnt);
				$display("expected < tuple_out_digest_data, tuple_out_sume_metadata > = < %x %x >", tuple_exp_tuple_out_digest_data, tuple_exp_tuple_out_sume_metadata);
				$display("actual   < tuple_out_digest_data, tuple_out_sume_metadata > = < %x %x >", tuple_out_digest_data, tuple_out_sume_metadata);
				$finish(1);
			end
		end
	end
end

assign packet_out_avail = 1 ;

always @* begin
	packet_out_mask[7:0] = ( packet_out_tlast ? { 8{packet_out_tkeep[0]} } : 8'd255 ) ;
	packet_out_mask[15:8] = ( packet_out_tlast ? { 8{packet_out_tkeep[1]} } : 8'd255 ) ;
	packet_out_mask[23:16] = ( packet_out_tlast ? { 8{packet_out_tkeep[2]} } : 8'd255 ) ;
	packet_out_mask[31:24] = ( packet_out_tlast ? { 8{packet_out_tkeep[3]} } : 8'd255 ) ;
	packet_out_mask[39:32] = ( packet_out_tlast ? { 8{packet_out_tkeep[4]} } : 8'd255 ) ;
	packet_out_mask[47:40] = ( packet_out_tlast ? { 8{packet_out_tkeep[5]} } : 8'd255 ) ;
	packet_out_mask[55:48] = ( packet_out_tlast ? { 8{packet_out_tkeep[6]} } : 8'd255 ) ;
	packet_out_mask[63:56] = ( packet_out_tlast ? { 8{packet_out_tkeep[7]} } : 8'd255 ) ;
	packet_out_mask[71:64] = ( packet_out_tlast ? { 8{packet_out_tkeep[8]} } : 8'd255 ) ;
	packet_out_mask[79:72] = ( packet_out_tlast ? { 8{packet_out_tkeep[9]} } : 8'd255 ) ;
	packet_out_mask[87:80] = ( packet_out_tlast ? { 8{packet_out_tkeep[10]} } : 8'd255 ) ;
	packet_out_mask[95:88] = ( packet_out_tlast ? { 8{packet_out_tkeep[11]} } : 8'd255 ) ;
	packet_out_mask[103:96] = ( packet_out_tlast ? { 8{packet_out_tkeep[12]} } : 8'd255 ) ;
	packet_out_mask[111:104] = ( packet_out_tlast ? { 8{packet_out_tkeep[13]} } : 8'd255 ) ;
	packet_out_mask[119:112] = ( packet_out_tlast ? { 8{packet_out_tkeep[14]} } : 8'd255 ) ;
	packet_out_mask[127:120] = ( packet_out_tlast ? { 8{packet_out_tkeep[15]} } : 8'd255 ) ;
	packet_out_mask[135:128] = ( packet_out_tlast ? { 8{packet_out_tkeep[16]} } : 8'd255 ) ;
	packet_out_mask[143:136] = ( packet_out_tlast ? { 8{packet_out_tkeep[17]} } : 8'd255 ) ;
	packet_out_mask[151:144] = ( packet_out_tlast ? { 8{packet_out_tkeep[18]} } : 8'd255 ) ;
	packet_out_mask[159:152] = ( packet_out_tlast ? { 8{packet_out_tkeep[19]} } : 8'd255 ) ;
	packet_out_mask[167:160] = ( packet_out_tlast ? { 8{packet_out_tkeep[20]} } : 8'd255 ) ;
	packet_out_mask[175:168] = ( packet_out_tlast ? { 8{packet_out_tkeep[21]} } : 8'd255 ) ;
	packet_out_mask[183:176] = ( packet_out_tlast ? { 8{packet_out_tkeep[22]} } : 8'd255 ) ;
	packet_out_mask[191:184] = ( packet_out_tlast ? { 8{packet_out_tkeep[23]} } : 8'd255 ) ;
	packet_out_mask[199:192] = ( packet_out_tlast ? { 8{packet_out_tkeep[24]} } : 8'd255 ) ;
	packet_out_mask[207:200] = ( packet_out_tlast ? { 8{packet_out_tkeep[25]} } : 8'd255 ) ;
	packet_out_mask[215:208] = ( packet_out_tlast ? { 8{packet_out_tkeep[26]} } : 8'd255 ) ;
	packet_out_mask[223:216] = ( packet_out_tlast ? { 8{packet_out_tkeep[27]} } : 8'd255 ) ;
	packet_out_mask[231:224] = ( packet_out_tlast ? { 8{packet_out_tkeep[28]} } : 8'd255 ) ;
	packet_out_mask[239:232] = ( packet_out_tlast ? { 8{packet_out_tkeep[29]} } : 8'd255 ) ;
	packet_out_mask[247:240] = ( packet_out_tlast ? { 8{packet_out_tkeep[30]} } : 8'd255 ) ;
	packet_out_mask[255:248] = ( packet_out_tlast ? { 8{packet_out_tkeep[31]} } : 8'd255 ) ;
end

assign ready = packet_out_tready ;

assign dataVld = packet_out_tvalid ;

assign dataEop = packet_out_tlast ;

always @( posedge clk_n ) begin
	if ( rst ) begin
		packet_exp_tlast <= 'hX ;
		packet_exp_tkeep <= 'hX ;
		packet_exp_tdata <= 'hX ;
	end
	else  begin
		if ( file_done ) begin
			check_eof <= $feof(fd_pkt) ;
		end
	end
	if ( ( ( ( ( !rst && file_done ) && fw_done ) && packet_out_tvalid ) && packet_out_tready ) ) begin
		if ( ( 32'h3 != $fscanf(fd_pkt, "%x %x %x ", packet_exp_tlast, packet_exp_tkeep, packet_exp_tdata) ) ) begin
			$display("[%0t] ERROR: error reading expected packet file", $time);
			$finish(1);
		end
		else  begin
			if ( ( ( ( packet_exp_tlast == packet_out_tlast ) && ( packet_exp_tkeep == packet_out_tkeep ) ) && ( packet_exp_tdata == ( packet_out_tdata & packet_out_mask ) ) ) ) begin
				$display("[%0t]  INFO: packet %0d  data OK (tlast, tkeep, tdata) = (%b, %x, %x)", $time, pktCnt, packet_out_tlast, packet_out_tkeep, packet_out_tdata);
			end
			else  begin
				$display("[%0t] ERROR: packet mismatch in packet %0d cycle %0d", $time, pktCnt, wordCnt);
				$display("expected (tlast, tkeep, tdata) = (%b, %x, %x)", packet_exp_tlast, packet_exp_tkeep, packet_exp_tdata);
				$display("actual   (tlast, tkeep, tdata) = (%b, %x, %x)", packet_out_tlast, packet_out_tkeep, ( packet_out_tdata & packet_out_mask ));
				$finish(1);
			end
		end
	end
end


endmodule

// machine-generated file - do NOT modify by hand !
// File created on 2020/10/07 14:57:22
// by Barista HDL generation library, version TRUNK @ 1007984

