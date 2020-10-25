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
//----------------------------------------------------------------------------


//----------------------------------------------------------------------------
// File name: S_RESETTER_control.v
// File created: 2020/10/08 15:24:15
// Created by: Xilinx SDNet Compiler version 2018.2, build 2342300

//----------------------------------------------------------------------------

`timescale 1 ns / 100 ps

module S_RESETTER_control (


     reset_out_active_high, 
     reset_out_active_low, 
     init_done, 

     clk, 
     rst 

);

//-------------------------------------------------------------
// I/O
//-------------------------------------------------------------
 output		reset_out_active_high ;
 output		reset_out_active_low ;
 output	reg	init_done ;
 input		clk ;
 input		rst ;






 reg	eucv5rxzkomzsx221_646;	 initial eucv5rxzkomzsx221_646 = 1'b0 ;
 reg	gsd19yzr600npvp7_535;	 initial gsd19yzr600npvp7_535 = 1'b0 ;
 reg [4:0] eqmqz3yeb3wnwdfkqse75y1xa_121;	 initial eqmqz3yeb3wnwdfkqse75y1xa_121 = 5'b00000 ;
 reg [6:0] rkixctb4eje8us0nj7uskzmy_165;	 initial rkixctb4eje8us0nj7uskzmy_165 = 7'b0000000 ;
 wire	sgs88o2thu3p5fai6pzflhxzjk_826 ;
 reg	u3kr3glutlr0nki0d_680;	 initial u3kr3glutlr0nki0d_680 = 1'b1 ;
 reg	mhzb2bn3zbkvkvrqarf_310;	 initial mhzb2bn3zbkvkvrqarf_310 = 1'b0 ;
 reg	wedw8nrw1i0kc1ww1q3b2nv6p0_656;	 initial wedw8nrw1i0kc1ww1q3b2nv6p0_656 = 1'b1 ;
 reg	i6xox95r4qqk4kwixdecwr610gt_331;	 initial i6xox95r4qqk4kwixdecwr610gt_331 = 1'b0 ;
 wire [4:0] p5p5kbo4lqs5o4ajuwzaep4_867 ;
 wire [6:0] mrgzblhodompbmj9i_264 ;
 wire	hhe5buw62ivytnflw4bvyw_66 ;
 wire	slg1hl4lw77356os3qafvj0cq9pmtvk_524 ;
 wire	j35lviai2tkt2o4te9juijy289v0lvnp_485 ;
 wire	gxtx3cptux4ezd19ad4r_651 ;
 wire	x0up6izutxk36v1ectpuz_445 ;
 wire	mm5d7a8d8nbif0lwopgpv_541 ;
 wire	u9itpeb12wba1f8ogau_591 ;
 wire	j766xjdo9d1qt7xl0kecz699utojk_181 ;
 wire	bimfgjy3prju0kp3dc_485 ;
 wire	r7ok9tsgz01dg7td_373 ;
 wire	k0jwf3kcrjfkm70u2il5no_328 ;
 wire	m1c0yje15g2ycseybe_535 ;


 assign p5p5kbo4lqs5o4ajuwzaep4_867 = 
	eqmqz3yeb3wnwdfkqse75y1xa_121 + 1 ;
 assign mrgzblhodompbmj9i_264 = 
	rkixctb4eje8us0nj7uskzmy_165 + 1 ;
 assign hhe5buw62ivytnflw4bvyw_66 = (
	((eqmqz3yeb3wnwdfkqse75y1xa_121 > 5'b00000))?1'b1:
	0)  ;
 assign slg1hl4lw77356os3qafvj0cq9pmtvk_524 = 
	rst | gsd19yzr600npvp7_535 ;
 assign j35lviai2tkt2o4te9juijy289v0lvnp_485 = 
	slg1hl4lw77356os3qafvj0cq9pmtvk_524 | hhe5buw62ivytnflw4bvyw_66 ;
 assign gxtx3cptux4ezd19ad4r_651 = (
	((gsd19yzr600npvp7_535 == 1'b1) && (m1c0yje15g2ycseybe_535 == 1'b1) && (eqmqz3yeb3wnwdfkqse75y1xa_121 == 5'b00000))?1'b1:
	((eqmqz3yeb3wnwdfkqse75y1xa_121 != 5'b00000) && (gsd19yzr600npvp7_535 != 1'b1))?1'b1:
	0)  ;
 assign x0up6izutxk36v1ectpuz_445 = (
	((eucv5rxzkomzsx221_646 == 1'b1))?1'b1:
	0)  ;
 assign mm5d7a8d8nbif0lwopgpv_541 = (
	((eqmqz3yeb3wnwdfkqse75y1xa_121 == 5'b01111) && (gsd19yzr600npvp7_535 != 1'b1) && (m1c0yje15g2ycseybe_535 == 1'b1))?1'b1:
	((rkixctb4eje8us0nj7uskzmy_165 != 7'b0000000) && (rkixctb4eje8us0nj7uskzmy_165 != 7'b0111111) && (gsd19yzr600npvp7_535 != 1'b1) && (m1c0yje15g2ycseybe_535 == 1'b1))?1'b1:
	0)  ;
 assign u9itpeb12wba1f8ogau_591 = (
	((rkixctb4eje8us0nj7uskzmy_165 == 7'b0111111))?1'b1:
	0)  ;
 assign j766xjdo9d1qt7xl0kecz699utojk_181 = 
	1'b1 ;
 assign bimfgjy3prju0kp3dc_485 = 
	1'b0 ;
 assign r7ok9tsgz01dg7td_373 = 
	 ~(sgs88o2thu3p5fai6pzflhxzjk_826) ;
 assign k0jwf3kcrjfkm70u2il5no_328 = (
	((rkixctb4eje8us0nj7uskzmy_165 == 7'b0111111))?1'b1:
	0)  ;
 assign m1c0yje15g2ycseybe_535 = 
	1'b1 ;
 assign reset_out_active_high 	= wedw8nrw1i0kc1ww1q3b2nv6p0_656 ;
 assign reset_out_active_low 	= i6xox95r4qqk4kwixdecwr610gt_331 ;


assign sgs88o2thu3p5fai6pzflhxzjk_826 = (
	((j35lviai2tkt2o4te9juijy289v0lvnp_485 == 1'b1) && (eqmqz3yeb3wnwdfkqse75y1xa_121 < 5'b10000))?j766xjdo9d1qt7xl0kecz699utojk_181 :
1'b0) ;



always @(posedge clk)
begin
		eucv5rxzkomzsx221_646 <= rst ;
		gsd19yzr600npvp7_535 <= eucv5rxzkomzsx221_646 ;
	if (x0up6izutxk36v1ectpuz_445) 
	begin 
	  eqmqz3yeb3wnwdfkqse75y1xa_121 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (gxtx3cptux4ezd19ad4r_651) 
		begin 
			eqmqz3yeb3wnwdfkqse75y1xa_121 <= p5p5kbo4lqs5o4ajuwzaep4_867 ;
		end 
	end 
	if (x0up6izutxk36v1ectpuz_445) 
	begin 
	  rkixctb4eje8us0nj7uskzmy_165 <= 7'b0000000 ;
	 end 
	else 
	begin 
		if (mm5d7a8d8nbif0lwopgpv_541) 
		begin 
			rkixctb4eje8us0nj7uskzmy_165 <= mrgzblhodompbmj9i_264 ;
		end 
	end 
	if (rst) 
	begin 
	  u3kr3glutlr0nki0d_680 <= 1'b1 ;
	 end 
	else 
	begin 
			u3kr3glutlr0nki0d_680 <= sgs88o2thu3p5fai6pzflhxzjk_826 ;
	end 
	if (rst) 
	begin 
	  mhzb2bn3zbkvkvrqarf_310 <= 1'b0 ;
	 end 
	else 
	begin 
			mhzb2bn3zbkvkvrqarf_310 <= r7ok9tsgz01dg7td_373 ;
	end 
	if (rst) 
	begin 
	  wedw8nrw1i0kc1ww1q3b2nv6p0_656 <= 1'b1 ;
	 end 
	else 
	begin 
			wedw8nrw1i0kc1ww1q3b2nv6p0_656 <= u3kr3glutlr0nki0d_680 ;
	end 
	if (rst) 
	begin 
	  i6xox95r4qqk4kwixdecwr610gt_331 <= 1'b0 ;
	 end 
	else 
	begin 
			i6xox95r4qqk4kwixdecwr610gt_331 <= mhzb2bn3zbkvkvrqarf_310 ;
	end 
		init_done <= k0jwf3kcrjfkm70u2il5no_328 ;
end

endmodule 
