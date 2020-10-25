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
// File created: 2020/10/07 14:57:22
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






 reg	i1kh1r6pow79yras0sdql_586;	 initial i1kh1r6pow79yras0sdql_586 = 1'b0 ;
 reg	y2rrfu2sk1ttgx9kq2nhtg1lvf6_272;	 initial y2rrfu2sk1ttgx9kq2nhtg1lvf6_272 = 1'b0 ;
 reg [4:0] c7i7abdn8d5suob9v8lrbry_498;	 initial c7i7abdn8d5suob9v8lrbry_498 = 5'b00000 ;
 reg [6:0] caj9paw1ozknpxo9djxtmcu3f012_805;	 initial caj9paw1ozknpxo9djxtmcu3f012_805 = 7'b0000000 ;
 wire	ohrij9mvp6797yqbeyr1c_831 ;
 reg	flg0pjzx3zxnya2m3tv_579;	 initial flg0pjzx3zxnya2m3tv_579 = 1'b1 ;
 reg	e032gxkzhks9x0oj0ecbgjtu5_558;	 initial e032gxkzhks9x0oj0ecbgjtu5_558 = 1'b0 ;
 reg	o5syk3emqx5ysr13_261;	 initial o5syk3emqx5ysr13_261 = 1'b1 ;
 reg	yh4y2boz0z4ga14ekzfsr2pagj39uqr_65;	 initial yh4y2boz0z4ga14ekzfsr2pagj39uqr_65 = 1'b0 ;
 wire [4:0] kcfnbaxi1va06hd96gsyi_246 ;
 wire [6:0] msk5jo4d0opcyxlp_209 ;
 wire	btkch3z25vxhz1x0ehz17ju6_639 ;
 wire	gx7ed22fglpan82w5mwa89vgcekj4p_111 ;
 wire	crotkfjkztt0yln8mqd5_188 ;
 wire	awls4zqa0mqszo5sildr_760 ;
 wire	ydr872df7ncx5p8n5h6zn_363 ;
 wire	plnru5lw562b5p5zqdb1v2bpjx_524 ;
 wire	u9pi0k3z8d64qqbojb1btcoy42x2d6_479 ;
 wire	l6f2s80w502ol6oua6wc_728 ;
 wire	xoft53hh12dopi1lg8ate_733 ;
 wire	vzlbh5qpnr6zy5yka_696 ;
 wire	baiclemjm5ztw2bdou2s1w66_536 ;
 wire	i9bj8s54cerodvu4lgm4osbkluo2_773 ;


 assign kcfnbaxi1va06hd96gsyi_246 = 
	c7i7abdn8d5suob9v8lrbry_498 + 1 ;
 assign msk5jo4d0opcyxlp_209 = 
	caj9paw1ozknpxo9djxtmcu3f012_805 + 1 ;
 assign btkch3z25vxhz1x0ehz17ju6_639 = (
	((c7i7abdn8d5suob9v8lrbry_498 > 5'b00000))?1'b1:
	0)  ;
 assign gx7ed22fglpan82w5mwa89vgcekj4p_111 = 
	rst | y2rrfu2sk1ttgx9kq2nhtg1lvf6_272 ;
 assign crotkfjkztt0yln8mqd5_188 = 
	gx7ed22fglpan82w5mwa89vgcekj4p_111 | btkch3z25vxhz1x0ehz17ju6_639 ;
 assign awls4zqa0mqszo5sildr_760 = (
	((y2rrfu2sk1ttgx9kq2nhtg1lvf6_272 == 1'b1) && (i9bj8s54cerodvu4lgm4osbkluo2_773 == 1'b1) && (c7i7abdn8d5suob9v8lrbry_498 == 5'b00000))?1'b1:
	((c7i7abdn8d5suob9v8lrbry_498 != 5'b00000) && (y2rrfu2sk1ttgx9kq2nhtg1lvf6_272 != 1'b1))?1'b1:
	0)  ;
 assign ydr872df7ncx5p8n5h6zn_363 = (
	((i1kh1r6pow79yras0sdql_586 == 1'b1))?1'b1:
	0)  ;
 assign plnru5lw562b5p5zqdb1v2bpjx_524 = (
	((c7i7abdn8d5suob9v8lrbry_498 == 5'b01111) && (y2rrfu2sk1ttgx9kq2nhtg1lvf6_272 != 1'b1) && (i9bj8s54cerodvu4lgm4osbkluo2_773 == 1'b1))?1'b1:
	((caj9paw1ozknpxo9djxtmcu3f012_805 != 7'b0000000) && (caj9paw1ozknpxo9djxtmcu3f012_805 != 7'b0111111) && (y2rrfu2sk1ttgx9kq2nhtg1lvf6_272 != 1'b1) && (i9bj8s54cerodvu4lgm4osbkluo2_773 == 1'b1))?1'b1:
	0)  ;
 assign u9pi0k3z8d64qqbojb1btcoy42x2d6_479 = (
	((caj9paw1ozknpxo9djxtmcu3f012_805 == 7'b0111111))?1'b1:
	0)  ;
 assign l6f2s80w502ol6oua6wc_728 = 
	1'b1 ;
 assign xoft53hh12dopi1lg8ate_733 = 
	1'b0 ;
 assign vzlbh5qpnr6zy5yka_696 = 
	 ~(ohrij9mvp6797yqbeyr1c_831) ;
 assign baiclemjm5ztw2bdou2s1w66_536 = (
	((caj9paw1ozknpxo9djxtmcu3f012_805 == 7'b0111111))?1'b1:
	0)  ;
 assign i9bj8s54cerodvu4lgm4osbkluo2_773 = 
	1'b1 ;
 assign reset_out_active_high 	= o5syk3emqx5ysr13_261 ;
 assign reset_out_active_low 	= yh4y2boz0z4ga14ekzfsr2pagj39uqr_65 ;


assign ohrij9mvp6797yqbeyr1c_831 = (
	((crotkfjkztt0yln8mqd5_188 == 1'b1) && (c7i7abdn8d5suob9v8lrbry_498 < 5'b10000))?l6f2s80w502ol6oua6wc_728 :
1'b0) ;



always @(posedge clk)
begin
		i1kh1r6pow79yras0sdql_586 <= rst ;
		y2rrfu2sk1ttgx9kq2nhtg1lvf6_272 <= i1kh1r6pow79yras0sdql_586 ;
	if (ydr872df7ncx5p8n5h6zn_363) 
	begin 
	  c7i7abdn8d5suob9v8lrbry_498 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (awls4zqa0mqszo5sildr_760) 
		begin 
			c7i7abdn8d5suob9v8lrbry_498 <= kcfnbaxi1va06hd96gsyi_246 ;
		end 
	end 
	if (ydr872df7ncx5p8n5h6zn_363) 
	begin 
	  caj9paw1ozknpxo9djxtmcu3f012_805 <= 7'b0000000 ;
	 end 
	else 
	begin 
		if (plnru5lw562b5p5zqdb1v2bpjx_524) 
		begin 
			caj9paw1ozknpxo9djxtmcu3f012_805 <= msk5jo4d0opcyxlp_209 ;
		end 
	end 
	if (rst) 
	begin 
	  flg0pjzx3zxnya2m3tv_579 <= 1'b1 ;
	 end 
	else 
	begin 
			flg0pjzx3zxnya2m3tv_579 <= ohrij9mvp6797yqbeyr1c_831 ;
	end 
	if (rst) 
	begin 
	  e032gxkzhks9x0oj0ecbgjtu5_558 <= 1'b0 ;
	 end 
	else 
	begin 
			e032gxkzhks9x0oj0ecbgjtu5_558 <= vzlbh5qpnr6zy5yka_696 ;
	end 
	if (rst) 
	begin 
	  o5syk3emqx5ysr13_261 <= 1'b1 ;
	 end 
	else 
	begin 
			o5syk3emqx5ysr13_261 <= flg0pjzx3zxnya2m3tv_579 ;
	end 
	if (rst) 
	begin 
	  yh4y2boz0z4ga14ekzfsr2pagj39uqr_65 <= 1'b0 ;
	 end 
	else 
	begin 
			yh4y2boz0z4ga14ekzfsr2pagj39uqr_65 <= e032gxkzhks9x0oj0ecbgjtu5_558 ;
	end 
		init_done <= baiclemjm5ztw2bdou2s1w66_536 ;
end

endmodule 
