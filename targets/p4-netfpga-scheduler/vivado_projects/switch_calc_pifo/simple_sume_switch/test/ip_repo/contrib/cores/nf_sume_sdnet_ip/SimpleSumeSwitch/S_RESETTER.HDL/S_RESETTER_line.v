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
// File created: 2019/12/04 18:15:53
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






 reg	cp36s7dc79bfy4ouu_600;	 initial cp36s7dc79bfy4ouu_600 = 1'b0 ;
 reg	zk5900n7lyul8z8cjmj2k4f5qzmcrx7b_698;	 initial zk5900n7lyul8z8cjmj2k4f5qzmcrx7b_698 = 1'b0 ;
 reg [4:0] gm8ag9qcmvdkvf210l2je3vonq2_159;	 initial gm8ag9qcmvdkvf210l2je3vonq2_159 = 5'b00000 ;
 reg [6:0] ih85qexehzdt57x0t1raoey_441;	 initial ih85qexehzdt57x0t1raoey_441 = 7'b0000000 ;
 wire	txcdht5ce15yv59wn0f_750 ;
 reg	clbp1buv9axq4ge3qok8snk43xh2y_522;	 initial clbp1buv9axq4ge3qok8snk43xh2y_522 = 1'b1 ;
 reg	mf4kqhysphgeii9qut_263;	 initial mf4kqhysphgeii9qut_263 = 1'b0 ;
 reg	dtgmimffdeggatwk1l0w1udge_127;	 initial dtgmimffdeggatwk1l0w1udge_127 = 1'b1 ;
 reg	cdx4qe888ns61tfmpq_320;	 initial cdx4qe888ns61tfmpq_320 = 1'b0 ;
 wire [4:0] f306kvg2xf1xr46wt5qjdxlednzy6g7b_215 ;
 wire [6:0] e3qsruaazym6ojka1_4 ;
 wire	by0chwes73m2ld46rrt76v2dtj_718 ;
 wire	c866td0615h7jqkedkdees7frs2t_270 ;
 wire	jqq97i4g1rfe82h8d_551 ;
 wire	cqjaufquksvl0l6tiwem_612 ;
 wire	p8dmoj9npgm1fxholvtic2w9x_3 ;
 wire	fljlhkdydotb4079k_777 ;
 wire	d5z7jd4r01nvhev01mdnvxv_549 ;
 wire	n7mk3wnzv4rui2jvd72n_367 ;
 wire	iuxtj1hg8xz308kkyl3wxa223amk_173 ;
 wire	yfwxbzuc3x7dad32jv3aumyp5m0zx5mu_156 ;
 wire	yb90hddfu14rsqior_184 ;
 wire	g80b7dw8485e5znlmafipjeg4rcll_69 ;


 assign f306kvg2xf1xr46wt5qjdxlednzy6g7b_215 = 
	gm8ag9qcmvdkvf210l2je3vonq2_159 + 1 ;
 assign e3qsruaazym6ojka1_4 = 
	ih85qexehzdt57x0t1raoey_441 + 1 ;
 assign by0chwes73m2ld46rrt76v2dtj_718 = (
	((gm8ag9qcmvdkvf210l2je3vonq2_159 > 5'b00000))?1'b1:
	0)  ;
 assign c866td0615h7jqkedkdees7frs2t_270 = 
	rst | zk5900n7lyul8z8cjmj2k4f5qzmcrx7b_698 ;
 assign jqq97i4g1rfe82h8d_551 = 
	c866td0615h7jqkedkdees7frs2t_270 | by0chwes73m2ld46rrt76v2dtj_718 ;
 assign cqjaufquksvl0l6tiwem_612 = (
	((zk5900n7lyul8z8cjmj2k4f5qzmcrx7b_698 == 1'b1) && (g80b7dw8485e5znlmafipjeg4rcll_69 == 1'b1) && (gm8ag9qcmvdkvf210l2je3vonq2_159 == 5'b00000))?1'b1:
	((gm8ag9qcmvdkvf210l2je3vonq2_159 != 5'b00000) && (zk5900n7lyul8z8cjmj2k4f5qzmcrx7b_698 != 1'b1))?1'b1:
	0)  ;
 assign p8dmoj9npgm1fxholvtic2w9x_3 = (
	((cp36s7dc79bfy4ouu_600 == 1'b1))?1'b1:
	0)  ;
 assign fljlhkdydotb4079k_777 = (
	((gm8ag9qcmvdkvf210l2je3vonq2_159 == 5'b01111) && (zk5900n7lyul8z8cjmj2k4f5qzmcrx7b_698 != 1'b1) && (g80b7dw8485e5znlmafipjeg4rcll_69 == 1'b1))?1'b1:
	((ih85qexehzdt57x0t1raoey_441 != 7'b0000000) && (ih85qexehzdt57x0t1raoey_441 != 7'b0111111) && (zk5900n7lyul8z8cjmj2k4f5qzmcrx7b_698 != 1'b1) && (g80b7dw8485e5znlmafipjeg4rcll_69 == 1'b1))?1'b1:
	0)  ;
 assign d5z7jd4r01nvhev01mdnvxv_549 = (
	((ih85qexehzdt57x0t1raoey_441 == 7'b0111111))?1'b1:
	0)  ;
 assign n7mk3wnzv4rui2jvd72n_367 = 
	1'b1 ;
 assign iuxtj1hg8xz308kkyl3wxa223amk_173 = 
	1'b0 ;
 assign yfwxbzuc3x7dad32jv3aumyp5m0zx5mu_156 = 
	 ~(txcdht5ce15yv59wn0f_750) ;
 assign yb90hddfu14rsqior_184 = (
	((ih85qexehzdt57x0t1raoey_441 == 7'b0111111))?1'b1:
	0)  ;
 assign g80b7dw8485e5znlmafipjeg4rcll_69 = 
	1'b1 ;
 assign reset_out_active_high 	= dtgmimffdeggatwk1l0w1udge_127 ;
 assign reset_out_active_low 	= cdx4qe888ns61tfmpq_320 ;


assign txcdht5ce15yv59wn0f_750 = (
	((jqq97i4g1rfe82h8d_551 == 1'b1) && (gm8ag9qcmvdkvf210l2je3vonq2_159 < 5'b10000))?n7mk3wnzv4rui2jvd72n_367 :
1'b0) ;



always @(posedge clk)
begin
		cp36s7dc79bfy4ouu_600 <= rst ;
		zk5900n7lyul8z8cjmj2k4f5qzmcrx7b_698 <= cp36s7dc79bfy4ouu_600 ;
	if (p8dmoj9npgm1fxholvtic2w9x_3) 
	begin 
	  gm8ag9qcmvdkvf210l2je3vonq2_159 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (cqjaufquksvl0l6tiwem_612) 
		begin 
			gm8ag9qcmvdkvf210l2je3vonq2_159 <= f306kvg2xf1xr46wt5qjdxlednzy6g7b_215 ;
		end 
	end 
	if (p8dmoj9npgm1fxholvtic2w9x_3) 
	begin 
	  ih85qexehzdt57x0t1raoey_441 <= 7'b0000000 ;
	 end 
	else 
	begin 
		if (fljlhkdydotb4079k_777) 
		begin 
			ih85qexehzdt57x0t1raoey_441 <= e3qsruaazym6ojka1_4 ;
		end 
	end 
	if (rst) 
	begin 
	  clbp1buv9axq4ge3qok8snk43xh2y_522 <= 1'b1 ;
	 end 
	else 
	begin 
			clbp1buv9axq4ge3qok8snk43xh2y_522 <= txcdht5ce15yv59wn0f_750 ;
	end 
	if (rst) 
	begin 
	  mf4kqhysphgeii9qut_263 <= 1'b0 ;
	 end 
	else 
	begin 
			mf4kqhysphgeii9qut_263 <= yfwxbzuc3x7dad32jv3aumyp5m0zx5mu_156 ;
	end 
	if (rst) 
	begin 
	  dtgmimffdeggatwk1l0w1udge_127 <= 1'b1 ;
	 end 
	else 
	begin 
			dtgmimffdeggatwk1l0w1udge_127 <= clbp1buv9axq4ge3qok8snk43xh2y_522 ;
	end 
	if (rst) 
	begin 
	  cdx4qe888ns61tfmpq_320 <= 1'b0 ;
	 end 
	else 
	begin 
			cdx4qe888ns61tfmpq_320 <= mf4kqhysphgeii9qut_263 ;
	end 
		init_done <= yb90hddfu14rsqior_184 ;
end

endmodule 
