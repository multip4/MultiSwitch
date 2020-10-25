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
// File created: 2020/10/07 14:57:22
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






 reg	gfaaecd3h8xt7tkq_432;	 initial gfaaecd3h8xt7tkq_432 = 1'b0 ;
 reg	p7d6h5asd6j8z9a1lg9eqtuzlbo_538;	 initial p7d6h5asd6j8z9a1lg9eqtuzlbo_538 = 1'b0 ;
 reg [4:0] ugdxdxepcp04ogsa3p3x07ujbnjj_180;	 initial ugdxdxepcp04ogsa3p3x07ujbnjj_180 = 5'b00000 ;
 reg [7:0] k7wolb3cfjxun16pkxh88u_349;	 initial k7wolb3cfjxun16pkxh88u_349 = 8'h00 ;
 wire	t6we5vh4d5ubb74wgax6iu0dc0u_704 ;
 reg	kbox2ni1ujayhu6gqrzicox4c1i4pco_359;	 initial kbox2ni1ujayhu6gqrzicox4c1i4pco_359 = 1'b1 ;
 reg	xnoggcw7f240tscqar3z8_618;	 initial xnoggcw7f240tscqar3z8_618 = 1'b0 ;
 reg	au78quh9th7erwkptoj5s_429;	 initial au78quh9th7erwkptoj5s_429 = 1'b1 ;
 reg	s7uw7wfbe2y9t57w08b_138;	 initial s7uw7wfbe2y9t57w08b_138 = 1'b0 ;
 wire [4:0] s7nzuxaic5pc94mqs6k0_256 ;
 wire [7:0] fijg30hlelh72im282v9812n79_99 ;
 wire	lcqcuw9gh5xjp2ckoe58abdq_39 ;
 wire	irkjz3izdw46be1esxu2adfzpx_87 ;
 wire	usfam5ky0nywcm2mm6fvigiczzyrq_346 ;
 wire	emrmk1hciyo3p5904dlb7aavz0wh_217 ;
 wire	y94uvo7yxlbqvrh0p7qk_844 ;
 wire	p51vkkpgi2epwd8jcoixaxe198av_580 ;
 wire	mitd6kt07uanffx81cmu1m_654 ;
 wire	alzvuc8kvt2kipad2etxgg_501 ;
 wire	adxag5t1vhsa35fhd2jp9_848 ;
 wire	csm3jq0fkj61mb3b4j74act4b086e_299 ;
 wire	s60j32xrpcnrien5yce6ve1kyhwmbm3p_342 ;
 wire	v52lhbx7e4nkldozmzg_687 ;


 assign s7nzuxaic5pc94mqs6k0_256 = 
	ugdxdxepcp04ogsa3p3x07ujbnjj_180 + 1 ;
 assign fijg30hlelh72im282v9812n79_99 = 
	k7wolb3cfjxun16pkxh88u_349 + 1 ;
 assign lcqcuw9gh5xjp2ckoe58abdq_39 = (
	((ugdxdxepcp04ogsa3p3x07ujbnjj_180 > 5'b00000))?1'b1:
	0)  ;
 assign irkjz3izdw46be1esxu2adfzpx_87 = 
	rst | p7d6h5asd6j8z9a1lg9eqtuzlbo_538 ;
 assign usfam5ky0nywcm2mm6fvigiczzyrq_346 = 
	irkjz3izdw46be1esxu2adfzpx_87 | lcqcuw9gh5xjp2ckoe58abdq_39 ;
 assign emrmk1hciyo3p5904dlb7aavz0wh_217 = (
	((p7d6h5asd6j8z9a1lg9eqtuzlbo_538 == 1'b1) && (v52lhbx7e4nkldozmzg_687 == 1'b1) && (ugdxdxepcp04ogsa3p3x07ujbnjj_180 == 5'b00000))?1'b1:
	((ugdxdxepcp04ogsa3p3x07ujbnjj_180 != 5'b00000) && (p7d6h5asd6j8z9a1lg9eqtuzlbo_538 != 1'b1))?1'b1:
	0)  ;
 assign y94uvo7yxlbqvrh0p7qk_844 = (
	((gfaaecd3h8xt7tkq_432 == 1'b1))?1'b1:
	0)  ;
 assign p51vkkpgi2epwd8jcoixaxe198av_580 = (
	((ugdxdxepcp04ogsa3p3x07ujbnjj_180 == 5'b01111) && (p7d6h5asd6j8z9a1lg9eqtuzlbo_538 != 1'b1) && (v52lhbx7e4nkldozmzg_687 == 1'b1))?1'b1:
	((k7wolb3cfjxun16pkxh88u_349 != 8'h00) && (k7wolb3cfjxun16pkxh88u_349 != 8'h86) && (p7d6h5asd6j8z9a1lg9eqtuzlbo_538 != 1'b1) && (v52lhbx7e4nkldozmzg_687 == 1'b1))?1'b1:
	0)  ;
 assign mitd6kt07uanffx81cmu1m_654 = (
	((k7wolb3cfjxun16pkxh88u_349 == 8'h86))?1'b1:
	0)  ;
 assign alzvuc8kvt2kipad2etxgg_501 = 
	1'b1 ;
 assign adxag5t1vhsa35fhd2jp9_848 = 
	1'b0 ;
 assign csm3jq0fkj61mb3b4j74act4b086e_299 = 
	 ~(t6we5vh4d5ubb74wgax6iu0dc0u_704) ;
 assign s60j32xrpcnrien5yce6ve1kyhwmbm3p_342 = (
	((k7wolb3cfjxun16pkxh88u_349 == 8'h86))?1'b1:
	0)  ;
 assign v52lhbx7e4nkldozmzg_687 = 
	1'b1 ;
 assign reset_out_active_high 	= au78quh9th7erwkptoj5s_429 ;
 assign reset_out_active_low 	= s7uw7wfbe2y9t57w08b_138 ;


assign t6we5vh4d5ubb74wgax6iu0dc0u_704 = (
	((usfam5ky0nywcm2mm6fvigiczzyrq_346 == 1'b1) && (ugdxdxepcp04ogsa3p3x07ujbnjj_180 < 5'b10000))?alzvuc8kvt2kipad2etxgg_501 :
1'b0) ;



always @(posedge clk)
begin
		gfaaecd3h8xt7tkq_432 <= rst ;
		p7d6h5asd6j8z9a1lg9eqtuzlbo_538 <= gfaaecd3h8xt7tkq_432 ;
	if (y94uvo7yxlbqvrh0p7qk_844) 
	begin 
	  ugdxdxepcp04ogsa3p3x07ujbnjj_180 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (emrmk1hciyo3p5904dlb7aavz0wh_217) 
		begin 
			ugdxdxepcp04ogsa3p3x07ujbnjj_180 <= s7nzuxaic5pc94mqs6k0_256 ;
		end 
	end 
	if (y94uvo7yxlbqvrh0p7qk_844) 
	begin 
	  k7wolb3cfjxun16pkxh88u_349 <= 8'h00 ;
	 end 
	else 
	begin 
		if (p51vkkpgi2epwd8jcoixaxe198av_580) 
		begin 
			k7wolb3cfjxun16pkxh88u_349 <= fijg30hlelh72im282v9812n79_99 ;
		end 
	end 
	if (rst) 
	begin 
	  kbox2ni1ujayhu6gqrzicox4c1i4pco_359 <= 1'b1 ;
	 end 
	else 
	begin 
			kbox2ni1ujayhu6gqrzicox4c1i4pco_359 <= t6we5vh4d5ubb74wgax6iu0dc0u_704 ;
	end 
	if (rst) 
	begin 
	  xnoggcw7f240tscqar3z8_618 <= 1'b0 ;
	 end 
	else 
	begin 
			xnoggcw7f240tscqar3z8_618 <= csm3jq0fkj61mb3b4j74act4b086e_299 ;
	end 
	if (rst) 
	begin 
	  au78quh9th7erwkptoj5s_429 <= 1'b1 ;
	 end 
	else 
	begin 
			au78quh9th7erwkptoj5s_429 <= kbox2ni1ujayhu6gqrzicox4c1i4pco_359 ;
	end 
	if (rst) 
	begin 
	  s7uw7wfbe2y9t57w08b_138 <= 1'b0 ;
	 end 
	else 
	begin 
			s7uw7wfbe2y9t57w08b_138 <= xnoggcw7f240tscqar3z8_618 ;
	end 
		init_done <= s60j32xrpcnrien5yce6ve1kyhwmbm3p_342 ;
end

endmodule 
