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
// File name: S_RESETTER_lookup.v
// File created: 2019/12/09 21:12:17
// Created by: Xilinx SDNet Compiler version 2018.2, build 2342300

//----------------------------------------------------------------------------

`timescale 1 ns / 100 ps

module S_RESETTER_lookup (


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






 reg	rjidbw3rr3p8liihg5pljv6_498;	 initial rjidbw3rr3p8liihg5pljv6_498 = 1'b0 ;
 reg	lr973kp7q9ym7cfy7m4t_281;	 initial lr973kp7q9ym7cfy7m4t_281 = 1'b0 ;
 reg [4:0] g2l0t6vw3lsmo7fq4a9mfx4rfp8lzo_611;	 initial g2l0t6vw3lsmo7fq4a9mfx4rfp8lzo_611 = 5'b00000 ;
 reg [7:0] o5xy9804gnfscem8ao_193;	 initial o5xy9804gnfscem8ao_193 = 8'h00 ;
 wire	jclik7upxcljl8l3buz9ikjygwie_140 ;
 reg	qfact1vwmtvra4eami6p_816;	 initial qfact1vwmtvra4eami6p_816 = 1'b1 ;
 reg	ximrzc2fph8eqwdop_85;	 initial ximrzc2fph8eqwdop_85 = 1'b0 ;
 reg	nqk4mjuhnd5v9x3exqrd006gmt9yc_851;	 initial nqk4mjuhnd5v9x3exqrd006gmt9yc_851 = 1'b1 ;
 reg	lcf0hypk42sxjqd7g_134;	 initial lcf0hypk42sxjqd7g_134 = 1'b0 ;
 wire [4:0] jlnwo5a8u34o4o53jwcvw62ej8icz_419 ;
 wire [7:0] d4wey3l0spscx2o1_67 ;
 wire	car6wyxysnou7zjscemskr1j_433 ;
 wire	gjmwnco12y0hxjvj4l5xby8_778 ;
 wire	g5br4faerzkq9ca9scooxt_656 ;
 wire	nnfgjca8o8z6df8z9m19fco4gw6_104 ;
 wire	nzy2tqrtncab6xmhgei0rsfkt5h_878 ;
 wire	ltx1z8alqv2hehmglq42eijm_792 ;
 wire	sjuq3yymglh96zo8r_186 ;
 wire	l6e56e5wp1xkvhsih1y_47 ;
 wire	z775shoi20004115ivb_832 ;
 wire	clhuj2lbddznxcmfnwt9kiud6hp_770 ;
 wire	zjbzsm1ht4elp334crnvtbw_353 ;
 wire	iq8t46fa0fc5araipg_345 ;


 assign jlnwo5a8u34o4o53jwcvw62ej8icz_419 = 
	g2l0t6vw3lsmo7fq4a9mfx4rfp8lzo_611 + 1 ;
 assign d4wey3l0spscx2o1_67 = 
	o5xy9804gnfscem8ao_193 + 1 ;
 assign car6wyxysnou7zjscemskr1j_433 = (
	((g2l0t6vw3lsmo7fq4a9mfx4rfp8lzo_611 > 5'b00000))?1'b1:
	0)  ;
 assign gjmwnco12y0hxjvj4l5xby8_778 = 
	rst | lr973kp7q9ym7cfy7m4t_281 ;
 assign g5br4faerzkq9ca9scooxt_656 = 
	gjmwnco12y0hxjvj4l5xby8_778 | car6wyxysnou7zjscemskr1j_433 ;
 assign nnfgjca8o8z6df8z9m19fco4gw6_104 = (
	((lr973kp7q9ym7cfy7m4t_281 == 1'b1) && (iq8t46fa0fc5araipg_345 == 1'b1) && (g2l0t6vw3lsmo7fq4a9mfx4rfp8lzo_611 == 5'b00000))?1'b1:
	((g2l0t6vw3lsmo7fq4a9mfx4rfp8lzo_611 != 5'b00000) && (lr973kp7q9ym7cfy7m4t_281 != 1'b1))?1'b1:
	0)  ;
 assign nzy2tqrtncab6xmhgei0rsfkt5h_878 = (
	((rjidbw3rr3p8liihg5pljv6_498 == 1'b1))?1'b1:
	0)  ;
 assign ltx1z8alqv2hehmglq42eijm_792 = (
	((g2l0t6vw3lsmo7fq4a9mfx4rfp8lzo_611 == 5'b01111) && (lr973kp7q9ym7cfy7m4t_281 != 1'b1) && (iq8t46fa0fc5araipg_345 == 1'b1))?1'b1:
	((o5xy9804gnfscem8ao_193 != 8'h00) && (o5xy9804gnfscem8ao_193 != 8'h86) && (lr973kp7q9ym7cfy7m4t_281 != 1'b1) && (iq8t46fa0fc5araipg_345 == 1'b1))?1'b1:
	0)  ;
 assign sjuq3yymglh96zo8r_186 = (
	((o5xy9804gnfscem8ao_193 == 8'h86))?1'b1:
	0)  ;
 assign l6e56e5wp1xkvhsih1y_47 = 
	1'b1 ;
 assign z775shoi20004115ivb_832 = 
	1'b0 ;
 assign clhuj2lbddznxcmfnwt9kiud6hp_770 = 
	 ~(jclik7upxcljl8l3buz9ikjygwie_140) ;
 assign zjbzsm1ht4elp334crnvtbw_353 = (
	((o5xy9804gnfscem8ao_193 == 8'h86))?1'b1:
	0)  ;
 assign iq8t46fa0fc5araipg_345 = 
	1'b1 ;
 assign reset_out_active_high 	= nqk4mjuhnd5v9x3exqrd006gmt9yc_851 ;
 assign reset_out_active_low 	= lcf0hypk42sxjqd7g_134 ;


assign jclik7upxcljl8l3buz9ikjygwie_140 = (
	((g5br4faerzkq9ca9scooxt_656 == 1'b1) && (g2l0t6vw3lsmo7fq4a9mfx4rfp8lzo_611 < 5'b10000))?l6e56e5wp1xkvhsih1y_47 :
1'b0) ;



always @(posedge clk)
begin
		rjidbw3rr3p8liihg5pljv6_498 <= rst ;
		lr973kp7q9ym7cfy7m4t_281 <= rjidbw3rr3p8liihg5pljv6_498 ;
	if (nzy2tqrtncab6xmhgei0rsfkt5h_878) 
	begin 
	  g2l0t6vw3lsmo7fq4a9mfx4rfp8lzo_611 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (nnfgjca8o8z6df8z9m19fco4gw6_104) 
		begin 
			g2l0t6vw3lsmo7fq4a9mfx4rfp8lzo_611 <= jlnwo5a8u34o4o53jwcvw62ej8icz_419 ;
		end 
	end 
	if (nzy2tqrtncab6xmhgei0rsfkt5h_878) 
	begin 
	  o5xy9804gnfscem8ao_193 <= 8'h00 ;
	 end 
	else 
	begin 
		if (ltx1z8alqv2hehmglq42eijm_792) 
		begin 
			o5xy9804gnfscem8ao_193 <= d4wey3l0spscx2o1_67 ;
		end 
	end 
	if (rst) 
	begin 
	  qfact1vwmtvra4eami6p_816 <= 1'b1 ;
	 end 
	else 
	begin 
			qfact1vwmtvra4eami6p_816 <= jclik7upxcljl8l3buz9ikjygwie_140 ;
	end 
	if (rst) 
	begin 
	  ximrzc2fph8eqwdop_85 <= 1'b0 ;
	 end 
	else 
	begin 
			ximrzc2fph8eqwdop_85 <= clhuj2lbddznxcmfnwt9kiud6hp_770 ;
	end 
	if (rst) 
	begin 
	  nqk4mjuhnd5v9x3exqrd006gmt9yc_851 <= 1'b1 ;
	 end 
	else 
	begin 
			nqk4mjuhnd5v9x3exqrd006gmt9yc_851 <= qfact1vwmtvra4eami6p_816 ;
	end 
	if (rst) 
	begin 
	  lcf0hypk42sxjqd7g_134 <= 1'b0 ;
	 end 
	else 
	begin 
			lcf0hypk42sxjqd7g_134 <= ximrzc2fph8eqwdop_85 ;
	end 
		init_done <= zjbzsm1ht4elp334crnvtbw_353 ;
end

endmodule 
