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
// File created: 2020/10/08 15:24:15
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






 reg	syup1t9tu0c00khd1r4bp9bwf14j_592;	 initial syup1t9tu0c00khd1r4bp9bwf14j_592 = 1'b0 ;
 reg	kpc8xofwjj5iaz8187grf_271;	 initial kpc8xofwjj5iaz8187grf_271 = 1'b0 ;
 reg [4:0] cgomo0dr1thx7swpoimm_349;	 initial cgomo0dr1thx7swpoimm_349 = 5'b00000 ;
 reg [6:0] lr8650wpzqx6w7vuxviz29vpfig8m_739;	 initial lr8650wpzqx6w7vuxviz29vpfig8m_739 = 7'b0000000 ;
 wire	mgf8fk3v2tz266fb4_211 ;
 reg	qfzw0c9izcum1rz5tk9wd8m96kirdf5h_433;	 initial qfzw0c9izcum1rz5tk9wd8m96kirdf5h_433 = 1'b1 ;
 reg	qxntogcv48e8shozjwim8zwuanxk_365;	 initial qxntogcv48e8shozjwim8zwuanxk_365 = 1'b0 ;
 reg	umfoy7290f0uyk5q2sdjnt608_325;	 initial umfoy7290f0uyk5q2sdjnt608_325 = 1'b1 ;
 reg	p6nlfprs1ak79g801hxirp8f_244;	 initial p6nlfprs1ak79g801hxirp8f_244 = 1'b0 ;
 wire [4:0] ct8o7gqnotut150pvg0d_876 ;
 wire [6:0] k8xw9xapezdk6luee6so_27 ;
 wire	p5ke958eg6y7mzo21kfdgo3i2f_788 ;
 wire	qwf0fcukei8zw3hgdk5tlk9seb7_93 ;
 wire	ndhgzvonpz5s1uciqid4zjfovvk_396 ;
 wire	yoewpc70hr3nd0bl8xvr69_592 ;
 wire	js2ljvmj4xw4bdg7_358 ;
 wire	d66ggyy30r7ww09l7_824 ;
 wire	if0l5heyw6n5djpfnegqfak25d5zis8_273 ;
 wire	dfyq9mvplefhw642dcon9o_477 ;
 wire	wzuhqkebsun93imfxxw1zsltmr3zwd_586 ;
 wire	kpipbjb2f256kxeuto3_846 ;
 wire	izj7m7gfads7b1a7mpj0d4hz2n7d4rl_305 ;
 wire	m394qemm7k4kovfcl4boqpoygk_556 ;


 assign ct8o7gqnotut150pvg0d_876 = 
	cgomo0dr1thx7swpoimm_349 + 1 ;
 assign k8xw9xapezdk6luee6so_27 = 
	lr8650wpzqx6w7vuxviz29vpfig8m_739 + 1 ;
 assign p5ke958eg6y7mzo21kfdgo3i2f_788 = (
	((cgomo0dr1thx7swpoimm_349 > 5'b00000))?1'b1:
	0)  ;
 assign qwf0fcukei8zw3hgdk5tlk9seb7_93 = 
	rst | kpc8xofwjj5iaz8187grf_271 ;
 assign ndhgzvonpz5s1uciqid4zjfovvk_396 = 
	qwf0fcukei8zw3hgdk5tlk9seb7_93 | p5ke958eg6y7mzo21kfdgo3i2f_788 ;
 assign yoewpc70hr3nd0bl8xvr69_592 = (
	((kpc8xofwjj5iaz8187grf_271 == 1'b1) && (m394qemm7k4kovfcl4boqpoygk_556 == 1'b1) && (cgomo0dr1thx7swpoimm_349 == 5'b00000))?1'b1:
	((cgomo0dr1thx7swpoimm_349 != 5'b00000) && (kpc8xofwjj5iaz8187grf_271 != 1'b1))?1'b1:
	0)  ;
 assign js2ljvmj4xw4bdg7_358 = (
	((syup1t9tu0c00khd1r4bp9bwf14j_592 == 1'b1))?1'b1:
	0)  ;
 assign d66ggyy30r7ww09l7_824 = (
	((cgomo0dr1thx7swpoimm_349 == 5'b01111) && (kpc8xofwjj5iaz8187grf_271 != 1'b1) && (m394qemm7k4kovfcl4boqpoygk_556 == 1'b1))?1'b1:
	((lr8650wpzqx6w7vuxviz29vpfig8m_739 != 7'b0000000) && (lr8650wpzqx6w7vuxviz29vpfig8m_739 != 7'b0111111) && (kpc8xofwjj5iaz8187grf_271 != 1'b1) && (m394qemm7k4kovfcl4boqpoygk_556 == 1'b1))?1'b1:
	0)  ;
 assign if0l5heyw6n5djpfnegqfak25d5zis8_273 = (
	((lr8650wpzqx6w7vuxviz29vpfig8m_739 == 7'b0111111))?1'b1:
	0)  ;
 assign dfyq9mvplefhw642dcon9o_477 = 
	1'b1 ;
 assign wzuhqkebsun93imfxxw1zsltmr3zwd_586 = 
	1'b0 ;
 assign kpipbjb2f256kxeuto3_846 = 
	 ~(mgf8fk3v2tz266fb4_211) ;
 assign izj7m7gfads7b1a7mpj0d4hz2n7d4rl_305 = (
	((lr8650wpzqx6w7vuxviz29vpfig8m_739 == 7'b0111111))?1'b1:
	0)  ;
 assign m394qemm7k4kovfcl4boqpoygk_556 = 
	1'b1 ;
 assign reset_out_active_high 	= umfoy7290f0uyk5q2sdjnt608_325 ;
 assign reset_out_active_low 	= p6nlfprs1ak79g801hxirp8f_244 ;


assign mgf8fk3v2tz266fb4_211 = (
	((ndhgzvonpz5s1uciqid4zjfovvk_396 == 1'b1) && (cgomo0dr1thx7swpoimm_349 < 5'b10000))?dfyq9mvplefhw642dcon9o_477 :
1'b0) ;



always @(posedge clk)
begin
		syup1t9tu0c00khd1r4bp9bwf14j_592 <= rst ;
		kpc8xofwjj5iaz8187grf_271 <= syup1t9tu0c00khd1r4bp9bwf14j_592 ;
	if (js2ljvmj4xw4bdg7_358) 
	begin 
	  cgomo0dr1thx7swpoimm_349 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (yoewpc70hr3nd0bl8xvr69_592) 
		begin 
			cgomo0dr1thx7swpoimm_349 <= ct8o7gqnotut150pvg0d_876 ;
		end 
	end 
	if (js2ljvmj4xw4bdg7_358) 
	begin 
	  lr8650wpzqx6w7vuxviz29vpfig8m_739 <= 7'b0000000 ;
	 end 
	else 
	begin 
		if (d66ggyy30r7ww09l7_824) 
		begin 
			lr8650wpzqx6w7vuxviz29vpfig8m_739 <= k8xw9xapezdk6luee6so_27 ;
		end 
	end 
	if (rst) 
	begin 
	  qfzw0c9izcum1rz5tk9wd8m96kirdf5h_433 <= 1'b1 ;
	 end 
	else 
	begin 
			qfzw0c9izcum1rz5tk9wd8m96kirdf5h_433 <= mgf8fk3v2tz266fb4_211 ;
	end 
	if (rst) 
	begin 
	  qxntogcv48e8shozjwim8zwuanxk_365 <= 1'b0 ;
	 end 
	else 
	begin 
			qxntogcv48e8shozjwim8zwuanxk_365 <= kpipbjb2f256kxeuto3_846 ;
	end 
	if (rst) 
	begin 
	  umfoy7290f0uyk5q2sdjnt608_325 <= 1'b1 ;
	 end 
	else 
	begin 
			umfoy7290f0uyk5q2sdjnt608_325 <= qfzw0c9izcum1rz5tk9wd8m96kirdf5h_433 ;
	end 
	if (rst) 
	begin 
	  p6nlfprs1ak79g801hxirp8f_244 <= 1'b0 ;
	 end 
	else 
	begin 
			p6nlfprs1ak79g801hxirp8f_244 <= qxntogcv48e8shozjwim8zwuanxk_365 ;
	end 
		init_done <= izj7m7gfads7b1a7mpj0d4hz2n7d4rl_305 ;
end

endmodule 
