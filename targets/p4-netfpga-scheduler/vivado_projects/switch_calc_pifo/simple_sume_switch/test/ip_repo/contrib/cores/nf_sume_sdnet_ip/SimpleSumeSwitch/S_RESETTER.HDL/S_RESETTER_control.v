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
// File created: 2020/04/16 20:38:09
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






 reg	skkzkn1g40b2hhaz76j7c42eo_885;	 initial skkzkn1g40b2hhaz76j7c42eo_885 = 1'b0 ;
 reg	uunvx18zb3k4ji5h0z_453;	 initial uunvx18zb3k4ji5h0z_453 = 1'b0 ;
 reg [4:0] fzbz2lpteafv32fosag_526;	 initial fzbz2lpteafv32fosag_526 = 5'b00000 ;
 reg [6:0] kezbpn4xm6yrvz9wqq64ygan1u79cst_432;	 initial kezbpn4xm6yrvz9wqq64ygan1u79cst_432 = 7'b0000000 ;
 wire	yb6behty58qhtpcm6cibmyz_611 ;
 reg	pj2obqnxukjt74uzm_338;	 initial pj2obqnxukjt74uzm_338 = 1'b1 ;
 reg	ny57q904amtq1w73tg8a2nhumdtdwlq5_411;	 initial ny57q904amtq1w73tg8a2nhumdtdwlq5_411 = 1'b0 ;
 reg	sy20wrlw6da3roacwzqd7bn_274;	 initial sy20wrlw6da3roacwzqd7bn_274 = 1'b1 ;
 reg	q0ovcsf8wsszmvx9vwqb64j5_413;	 initial q0ovcsf8wsszmvx9vwqb64j5_413 = 1'b0 ;
 wire [4:0] c8se8qk60xytiompchg_283 ;
 wire [6:0] inif76llrjeg4x1z_780 ;
 wire	d23249ke9h2tmx4zktd64vyprm_814 ;
 wire	sok1s2ztizm08ys30vjsmk03_864 ;
 wire	nefi9qzneg4hk5ljw8haqh_552 ;
 wire	xnw70an1qy7ds4aikuqdyhlk_269 ;
 wire	vky1aagn3a86o2tkeeg_17 ;
 wire	wzhq2w913ssakun5ho_174 ;
 wire	byd3tdivnr9loixf5mc_165 ;
 wire	cu4k8u7vjqlb0l1wl91usulr459lle_519 ;
 wire	gv3pxk93nijoo7vga_325 ;
 wire	dp7hksr80d1n0818ye_812 ;
 wire	yrrgbxqho0qseoh6vepj_124 ;
 wire	sew5gye9zpsfdpf7_328 ;


 assign c8se8qk60xytiompchg_283 = 
	fzbz2lpteafv32fosag_526 + 1 ;
 assign inif76llrjeg4x1z_780 = 
	kezbpn4xm6yrvz9wqq64ygan1u79cst_432 + 1 ;
 assign d23249ke9h2tmx4zktd64vyprm_814 = (
	((fzbz2lpteafv32fosag_526 > 5'b00000))?1'b1:
	0)  ;
 assign sok1s2ztizm08ys30vjsmk03_864 = 
	rst | uunvx18zb3k4ji5h0z_453 ;
 assign nefi9qzneg4hk5ljw8haqh_552 = 
	sok1s2ztizm08ys30vjsmk03_864 | d23249ke9h2tmx4zktd64vyprm_814 ;
 assign xnw70an1qy7ds4aikuqdyhlk_269 = (
	((uunvx18zb3k4ji5h0z_453 == 1'b1) && (sew5gye9zpsfdpf7_328 == 1'b1) && (fzbz2lpteafv32fosag_526 == 5'b00000))?1'b1:
	((fzbz2lpteafv32fosag_526 != 5'b00000) && (uunvx18zb3k4ji5h0z_453 != 1'b1))?1'b1:
	0)  ;
 assign vky1aagn3a86o2tkeeg_17 = (
	((skkzkn1g40b2hhaz76j7c42eo_885 == 1'b1))?1'b1:
	0)  ;
 assign wzhq2w913ssakun5ho_174 = (
	((fzbz2lpteafv32fosag_526 == 5'b01111) && (uunvx18zb3k4ji5h0z_453 != 1'b1) && (sew5gye9zpsfdpf7_328 == 1'b1))?1'b1:
	((kezbpn4xm6yrvz9wqq64ygan1u79cst_432 != 7'b0000000) && (kezbpn4xm6yrvz9wqq64ygan1u79cst_432 != 7'b0111111) && (uunvx18zb3k4ji5h0z_453 != 1'b1) && (sew5gye9zpsfdpf7_328 == 1'b1))?1'b1:
	0)  ;
 assign byd3tdivnr9loixf5mc_165 = (
	((kezbpn4xm6yrvz9wqq64ygan1u79cst_432 == 7'b0111111))?1'b1:
	0)  ;
 assign cu4k8u7vjqlb0l1wl91usulr459lle_519 = 
	1'b1 ;
 assign gv3pxk93nijoo7vga_325 = 
	1'b0 ;
 assign dp7hksr80d1n0818ye_812 = 
	 ~(yb6behty58qhtpcm6cibmyz_611) ;
 assign yrrgbxqho0qseoh6vepj_124 = (
	((kezbpn4xm6yrvz9wqq64ygan1u79cst_432 == 7'b0111111))?1'b1:
	0)  ;
 assign sew5gye9zpsfdpf7_328 = 
	1'b1 ;
 assign reset_out_active_high 	= sy20wrlw6da3roacwzqd7bn_274 ;
 assign reset_out_active_low 	= q0ovcsf8wsszmvx9vwqb64j5_413 ;


assign yb6behty58qhtpcm6cibmyz_611 = (
	((nefi9qzneg4hk5ljw8haqh_552 == 1'b1) && (fzbz2lpteafv32fosag_526 < 5'b10000))?cu4k8u7vjqlb0l1wl91usulr459lle_519 :
1'b0) ;



always @(posedge clk)
begin
		skkzkn1g40b2hhaz76j7c42eo_885 <= rst ;
		uunvx18zb3k4ji5h0z_453 <= skkzkn1g40b2hhaz76j7c42eo_885 ;
	if (vky1aagn3a86o2tkeeg_17) 
	begin 
	  fzbz2lpteafv32fosag_526 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (xnw70an1qy7ds4aikuqdyhlk_269) 
		begin 
			fzbz2lpteafv32fosag_526 <= c8se8qk60xytiompchg_283 ;
		end 
	end 
	if (vky1aagn3a86o2tkeeg_17) 
	begin 
	  kezbpn4xm6yrvz9wqq64ygan1u79cst_432 <= 7'b0000000 ;
	 end 
	else 
	begin 
		if (wzhq2w913ssakun5ho_174) 
		begin 
			kezbpn4xm6yrvz9wqq64ygan1u79cst_432 <= inif76llrjeg4x1z_780 ;
		end 
	end 
	if (rst) 
	begin 
	  pj2obqnxukjt74uzm_338 <= 1'b1 ;
	 end 
	else 
	begin 
			pj2obqnxukjt74uzm_338 <= yb6behty58qhtpcm6cibmyz_611 ;
	end 
	if (rst) 
	begin 
	  ny57q904amtq1w73tg8a2nhumdtdwlq5_411 <= 1'b0 ;
	 end 
	else 
	begin 
			ny57q904amtq1w73tg8a2nhumdtdwlq5_411 <= dp7hksr80d1n0818ye_812 ;
	end 
	if (rst) 
	begin 
	  sy20wrlw6da3roacwzqd7bn_274 <= 1'b1 ;
	 end 
	else 
	begin 
			sy20wrlw6da3roacwzqd7bn_274 <= pj2obqnxukjt74uzm_338 ;
	end 
	if (rst) 
	begin 
	  q0ovcsf8wsszmvx9vwqb64j5_413 <= 1'b0 ;
	 end 
	else 
	begin 
			q0ovcsf8wsszmvx9vwqb64j5_413 <= ny57q904amtq1w73tg8a2nhumdtdwlq5_411 ;
	end 
		init_done <= yrrgbxqho0qseoh6vepj_124 ;
end

endmodule 
