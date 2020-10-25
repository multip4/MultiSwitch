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
// File name: S_RESETTER_line.v
// File created: 2020/10/07 14:57:22
// Created by: Xilinx SDNet Compiler version 2018.2, build 2342300

//----------------------------------------------------------------------------

`timescale 1 ns / 100 ps

module S_RESETTER_line (


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






 reg	e1pmhzh6gv3ncvarnd7i2alf2c7ijy_136;	 initial e1pmhzh6gv3ncvarnd7i2alf2c7ijy_136 = 1'b0 ;
 reg	ax881e0ty5uz8n2n_626;	 initial ax881e0ty5uz8n2n_626 = 1'b0 ;
 reg [4:0] dkgtz2i3o6mlr1n8trwqn_807;	 initial dkgtz2i3o6mlr1n8trwqn_807 = 5'b00000 ;
 reg [6:0] cy3ybyk1akgj90sgbxhatmln2jt_619;	 initial cy3ybyk1akgj90sgbxhatmln2jt_619 = 7'b0000000 ;
 wire	yir0g4qkqqh870mlzk1tgs1v_335 ;
 reg	j5annmyavrm2j3r8d7rlcumh4kbxtopz_476;	 initial j5annmyavrm2j3r8d7rlcumh4kbxtopz_476 = 1'b1 ;
 reg	sj1968qq971j7u4hs20cyj7ce3w01_128;	 initial sj1968qq971j7u4hs20cyj7ce3w01_128 = 1'b0 ;
 reg	o4pt7lk3b3w4mn7sjg8yjrv_511;	 initial o4pt7lk3b3w4mn7sjg8yjrv_511 = 1'b1 ;
 reg	e367872fta1kgv7kjgjw3v1rei4_570;	 initial e367872fta1kgv7kjgjw3v1rei4_570 = 1'b0 ;
 wire [4:0] zjukwsim1yk6hdcbxpgg3to7_215 ;
 wire [6:0] qsw32d908mt9ipyg1viya5n2eoud0d_480 ;
 wire	xllshrx331o2rckbgkhvc7bf0bq_782 ;
 wire	mz2zipg215wk9ghmibvc4xni4k_346 ;
 wire	mc11b89tfcqy5smcbqbo_392 ;
 wire	riacvyni20805zt68wrif6_112 ;
 wire	ke5y84rrwg87c1zrd1fpmrisw02mp_387 ;
 wire	gwi9s610eb05rzw4qxlmx31v_648 ;
 wire	escqn0lnwgdvyezubdtq9yt4n8g0t8_635 ;
 wire	gptxpkmktfc6zae8ycx6czmas_471 ;
 wire	wnyu4g1yw2asfhryckr2i9vmqkyym6l_313 ;
 wire	jz7gdznj27952wz84tc_302 ;
 wire	zc1gdeh9zsui10urxh5n_792 ;
 wire	k77o31fa88rwl4a8i8otmrb0cit3fyp_87 ;


 assign zjukwsim1yk6hdcbxpgg3to7_215 = 
	dkgtz2i3o6mlr1n8trwqn_807 + 1 ;
 assign qsw32d908mt9ipyg1viya5n2eoud0d_480 = 
	cy3ybyk1akgj90sgbxhatmln2jt_619 + 1 ;
 assign xllshrx331o2rckbgkhvc7bf0bq_782 = (
	((dkgtz2i3o6mlr1n8trwqn_807 > 5'b00000))?1'b1:
	0)  ;
 assign mz2zipg215wk9ghmibvc4xni4k_346 = 
	rst | ax881e0ty5uz8n2n_626 ;
 assign mc11b89tfcqy5smcbqbo_392 = 
	mz2zipg215wk9ghmibvc4xni4k_346 | xllshrx331o2rckbgkhvc7bf0bq_782 ;
 assign riacvyni20805zt68wrif6_112 = (
	((ax881e0ty5uz8n2n_626 == 1'b1) && (k77o31fa88rwl4a8i8otmrb0cit3fyp_87 == 1'b1) && (dkgtz2i3o6mlr1n8trwqn_807 == 5'b00000))?1'b1:
	((dkgtz2i3o6mlr1n8trwqn_807 != 5'b00000) && (ax881e0ty5uz8n2n_626 != 1'b1))?1'b1:
	0)  ;
 assign ke5y84rrwg87c1zrd1fpmrisw02mp_387 = (
	((e1pmhzh6gv3ncvarnd7i2alf2c7ijy_136 == 1'b1))?1'b1:
	0)  ;
 assign gwi9s610eb05rzw4qxlmx31v_648 = (
	((dkgtz2i3o6mlr1n8trwqn_807 == 5'b01111) && (ax881e0ty5uz8n2n_626 != 1'b1) && (k77o31fa88rwl4a8i8otmrb0cit3fyp_87 == 1'b1))?1'b1:
	((cy3ybyk1akgj90sgbxhatmln2jt_619 != 7'b0000000) && (cy3ybyk1akgj90sgbxhatmln2jt_619 != 7'b0111111) && (ax881e0ty5uz8n2n_626 != 1'b1) && (k77o31fa88rwl4a8i8otmrb0cit3fyp_87 == 1'b1))?1'b1:
	0)  ;
 assign escqn0lnwgdvyezubdtq9yt4n8g0t8_635 = (
	((cy3ybyk1akgj90sgbxhatmln2jt_619 == 7'b0111111))?1'b1:
	0)  ;
 assign gptxpkmktfc6zae8ycx6czmas_471 = 
	1'b1 ;
 assign wnyu4g1yw2asfhryckr2i9vmqkyym6l_313 = 
	1'b0 ;
 assign jz7gdznj27952wz84tc_302 = 
	 ~(yir0g4qkqqh870mlzk1tgs1v_335) ;
 assign zc1gdeh9zsui10urxh5n_792 = (
	((cy3ybyk1akgj90sgbxhatmln2jt_619 == 7'b0111111))?1'b1:
	0)  ;
 assign k77o31fa88rwl4a8i8otmrb0cit3fyp_87 = 
	1'b1 ;
 assign reset_out_active_high 	= o4pt7lk3b3w4mn7sjg8yjrv_511 ;
 assign reset_out_active_low 	= e367872fta1kgv7kjgjw3v1rei4_570 ;


assign yir0g4qkqqh870mlzk1tgs1v_335 = (
	((mc11b89tfcqy5smcbqbo_392 == 1'b1) && (dkgtz2i3o6mlr1n8trwqn_807 < 5'b10000))?gptxpkmktfc6zae8ycx6czmas_471 :
1'b0) ;



always @(posedge clk)
begin
		e1pmhzh6gv3ncvarnd7i2alf2c7ijy_136 <= rst ;
		ax881e0ty5uz8n2n_626 <= e1pmhzh6gv3ncvarnd7i2alf2c7ijy_136 ;
	if (ke5y84rrwg87c1zrd1fpmrisw02mp_387) 
	begin 
	  dkgtz2i3o6mlr1n8trwqn_807 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (riacvyni20805zt68wrif6_112) 
		begin 
			dkgtz2i3o6mlr1n8trwqn_807 <= zjukwsim1yk6hdcbxpgg3to7_215 ;
		end 
	end 
	if (ke5y84rrwg87c1zrd1fpmrisw02mp_387) 
	begin 
	  cy3ybyk1akgj90sgbxhatmln2jt_619 <= 7'b0000000 ;
	 end 
	else 
	begin 
		if (gwi9s610eb05rzw4qxlmx31v_648) 
		begin 
			cy3ybyk1akgj90sgbxhatmln2jt_619 <= qsw32d908mt9ipyg1viya5n2eoud0d_480 ;
		end 
	end 
	if (rst) 
	begin 
	  j5annmyavrm2j3r8d7rlcumh4kbxtopz_476 <= 1'b1 ;
	 end 
	else 
	begin 
			j5annmyavrm2j3r8d7rlcumh4kbxtopz_476 <= yir0g4qkqqh870mlzk1tgs1v_335 ;
	end 
	if (rst) 
	begin 
	  sj1968qq971j7u4hs20cyj7ce3w01_128 <= 1'b0 ;
	 end 
	else 
	begin 
			sj1968qq971j7u4hs20cyj7ce3w01_128 <= jz7gdznj27952wz84tc_302 ;
	end 
	if (rst) 
	begin 
	  o4pt7lk3b3w4mn7sjg8yjrv_511 <= 1'b1 ;
	 end 
	else 
	begin 
			o4pt7lk3b3w4mn7sjg8yjrv_511 <= j5annmyavrm2j3r8d7rlcumh4kbxtopz_476 ;
	end 
	if (rst) 
	begin 
	  e367872fta1kgv7kjgjw3v1rei4_570 <= 1'b0 ;
	 end 
	else 
	begin 
			e367872fta1kgv7kjgjw3v1rei4_570 <= sj1968qq971j7u4hs20cyj7ce3w01_128 ;
	end 
		init_done <= zc1gdeh9zsui10urxh5n_792 ;
end

endmodule 
