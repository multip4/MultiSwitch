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
// File created: 2020/10/03 20:31:34
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






 reg	cmvgi5a0229sfuvjpz2gt11x0k9pgj_848;	 initial cmvgi5a0229sfuvjpz2gt11x0k9pgj_848 = 1'b0 ;
 reg	swd912eyma5qwu19vda_264;	 initial swd912eyma5qwu19vda_264 = 1'b0 ;
 reg [4:0] mptcxln1gsjtnpa04jz_169;	 initial mptcxln1gsjtnpa04jz_169 = 5'b00000 ;
 reg [6:0] uh7oj3whf4xhmcabvrli3ki1e6wpr1_864;	 initial uh7oj3whf4xhmcabvrli3ki1e6wpr1_864 = 7'b0000000 ;
 wire	w36ikmyuz0rh5jyf1wl8_893 ;
 reg	qspey6ielci0zthl6ifblcop_889;	 initial qspey6ielci0zthl6ifblcop_889 = 1'b1 ;
 reg	ze3ibct4a2e373vh2332qn9qk_490;	 initial ze3ibct4a2e373vh2332qn9qk_490 = 1'b0 ;
 reg	dxfb97q0k2y42c33_602;	 initial dxfb97q0k2y42c33_602 = 1'b1 ;
 reg	vh8xyl5kogvs775udohkrb2g0jo00ib_584;	 initial vh8xyl5kogvs775udohkrb2g0jo00ib_584 = 1'b0 ;
 wire [4:0] sgpdmyfkurmbmvllkga92dn306ixc_818 ;
 wire [6:0] fbf6ayr299ltgh1vj_197 ;
 wire	r79bbud531lymmg2r0tmm52qmw_628 ;
 wire	p2fddpfwtmfi13s92tifqh_748 ;
 wire	kd9bql2vztjitsrf0duy7tft_723 ;
 wire	qllfza0xenjwgy3kqjleei_634 ;
 wire	ndrpb9isf18r4x5kn_567 ;
 wire	qt1pv3b6skp5m60k_209 ;
 wire	honfftbfh1v3n21z8ztait_869 ;
 wire	jw7xb132f78ac77n3h3j46fvd_667 ;
 wire	ic6v8kthighl19wt5q19ttoo8ylxra_245 ;
 wire	az9439l6w5kmc2jiuam9zjqqpwtna0_852 ;
 wire	hx96jiod96stz35martxbqmlvlamcua_241 ;
 wire	gy22t40h7gcr6jtnr1am6px_407 ;


 assign sgpdmyfkurmbmvllkga92dn306ixc_818 = 
	mptcxln1gsjtnpa04jz_169 + 1 ;
 assign fbf6ayr299ltgh1vj_197 = 
	uh7oj3whf4xhmcabvrli3ki1e6wpr1_864 + 1 ;
 assign r79bbud531lymmg2r0tmm52qmw_628 = (
	((mptcxln1gsjtnpa04jz_169 > 5'b00000))?1'b1:
	0)  ;
 assign p2fddpfwtmfi13s92tifqh_748 = 
	rst | swd912eyma5qwu19vda_264 ;
 assign kd9bql2vztjitsrf0duy7tft_723 = 
	p2fddpfwtmfi13s92tifqh_748 | r79bbud531lymmg2r0tmm52qmw_628 ;
 assign qllfza0xenjwgy3kqjleei_634 = (
	((swd912eyma5qwu19vda_264 == 1'b1) && (gy22t40h7gcr6jtnr1am6px_407 == 1'b1) && (mptcxln1gsjtnpa04jz_169 == 5'b00000))?1'b1:
	((mptcxln1gsjtnpa04jz_169 != 5'b00000) && (swd912eyma5qwu19vda_264 != 1'b1))?1'b1:
	0)  ;
 assign ndrpb9isf18r4x5kn_567 = (
	((cmvgi5a0229sfuvjpz2gt11x0k9pgj_848 == 1'b1))?1'b1:
	0)  ;
 assign qt1pv3b6skp5m60k_209 = (
	((mptcxln1gsjtnpa04jz_169 == 5'b01111) && (swd912eyma5qwu19vda_264 != 1'b1) && (gy22t40h7gcr6jtnr1am6px_407 == 1'b1))?1'b1:
	((uh7oj3whf4xhmcabvrli3ki1e6wpr1_864 != 7'b0000000) && (uh7oj3whf4xhmcabvrli3ki1e6wpr1_864 != 7'b0111111) && (swd912eyma5qwu19vda_264 != 1'b1) && (gy22t40h7gcr6jtnr1am6px_407 == 1'b1))?1'b1:
	0)  ;
 assign honfftbfh1v3n21z8ztait_869 = (
	((uh7oj3whf4xhmcabvrli3ki1e6wpr1_864 == 7'b0111111))?1'b1:
	0)  ;
 assign jw7xb132f78ac77n3h3j46fvd_667 = 
	1'b1 ;
 assign ic6v8kthighl19wt5q19ttoo8ylxra_245 = 
	1'b0 ;
 assign az9439l6w5kmc2jiuam9zjqqpwtna0_852 = 
	 ~(w36ikmyuz0rh5jyf1wl8_893) ;
 assign hx96jiod96stz35martxbqmlvlamcua_241 = (
	((uh7oj3whf4xhmcabvrli3ki1e6wpr1_864 == 7'b0111111))?1'b1:
	0)  ;
 assign gy22t40h7gcr6jtnr1am6px_407 = 
	1'b1 ;
 assign reset_out_active_high 	= dxfb97q0k2y42c33_602 ;
 assign reset_out_active_low 	= vh8xyl5kogvs775udohkrb2g0jo00ib_584 ;


assign w36ikmyuz0rh5jyf1wl8_893 = (
	((kd9bql2vztjitsrf0duy7tft_723 == 1'b1) && (mptcxln1gsjtnpa04jz_169 < 5'b10000))?jw7xb132f78ac77n3h3j46fvd_667 :
1'b0) ;



always @(posedge clk)
begin
		cmvgi5a0229sfuvjpz2gt11x0k9pgj_848 <= rst ;
		swd912eyma5qwu19vda_264 <= cmvgi5a0229sfuvjpz2gt11x0k9pgj_848 ;
	if (ndrpb9isf18r4x5kn_567) 
	begin 
	  mptcxln1gsjtnpa04jz_169 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (qllfza0xenjwgy3kqjleei_634) 
		begin 
			mptcxln1gsjtnpa04jz_169 <= sgpdmyfkurmbmvllkga92dn306ixc_818 ;
		end 
	end 
	if (ndrpb9isf18r4x5kn_567) 
	begin 
	  uh7oj3whf4xhmcabvrli3ki1e6wpr1_864 <= 7'b0000000 ;
	 end 
	else 
	begin 
		if (qt1pv3b6skp5m60k_209) 
		begin 
			uh7oj3whf4xhmcabvrli3ki1e6wpr1_864 <= fbf6ayr299ltgh1vj_197 ;
		end 
	end 
	if (rst) 
	begin 
	  qspey6ielci0zthl6ifblcop_889 <= 1'b1 ;
	 end 
	else 
	begin 
			qspey6ielci0zthl6ifblcop_889 <= w36ikmyuz0rh5jyf1wl8_893 ;
	end 
	if (rst) 
	begin 
	  ze3ibct4a2e373vh2332qn9qk_490 <= 1'b0 ;
	 end 
	else 
	begin 
			ze3ibct4a2e373vh2332qn9qk_490 <= az9439l6w5kmc2jiuam9zjqqpwtna0_852 ;
	end 
	if (rst) 
	begin 
	  dxfb97q0k2y42c33_602 <= 1'b1 ;
	 end 
	else 
	begin 
			dxfb97q0k2y42c33_602 <= qspey6ielci0zthl6ifblcop_889 ;
	end 
	if (rst) 
	begin 
	  vh8xyl5kogvs775udohkrb2g0jo00ib_584 <= 1'b0 ;
	 end 
	else 
	begin 
			vh8xyl5kogvs775udohkrb2g0jo00ib_584 <= ze3ibct4a2e373vh2332qn9qk_490 ;
	end 
		init_done <= hx96jiod96stz35martxbqmlvlamcua_241 ;
end

endmodule 
