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
// File created: 2019/11/21 22:45:49
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






 reg	pkrcsv17n470vbr3bml_665;	 initial pkrcsv17n470vbr3bml_665 = 1'b0 ;
 reg	bobbwadsbyn1p9tvpi3z_445;	 initial bobbwadsbyn1p9tvpi3z_445 = 1'b0 ;
 reg [4:0] o1qttfuhuniq3n0rg7m_743;	 initial o1qttfuhuniq3n0rg7m_743 = 5'b00000 ;
 reg [6:0] p61qwtjfhttuearc1_351;	 initial p61qwtjfhttuearc1_351 = 7'b0000000 ;
 wire	fz2cegs2osr33fhxs5fdfvaqmnfs9mu_338 ;
 reg	txc2ql7gy0f6fdwwqnk2e1kb1k6hmsj_535;	 initial txc2ql7gy0f6fdwwqnk2e1kb1k6hmsj_535 = 1'b1 ;
 reg	cs1ksh4jglxdgyqo8zo1u0vnfsh3n_476;	 initial cs1ksh4jglxdgyqo8zo1u0vnfsh3n_476 = 1'b0 ;
 reg	m1ygr5hig0lwrtit_18;	 initial m1ygr5hig0lwrtit_18 = 1'b1 ;
 reg	fkprl9oa8hknwg5j43x5uzd_246;	 initial fkprl9oa8hknwg5j43x5uzd_246 = 1'b0 ;
 wire [4:0] pgvmb00xowirsp3z58l69ex0q8scgu_814 ;
 wire [6:0] mih34igylhc9k6pnhjbvahk0306o6_93 ;
 wire	uxc0nnyv3hrco8fzx_829 ;
 wire	wjr2mw3hrh54l2lrdga_283 ;
 wire	onrmlmnub26zcig41f_496 ;
 wire	h160awijt8lv8d741_641 ;
 wire	gxkppb10dkv7segbaiie3rcjxr_676 ;
 wire	k4bt4f8t7poqch2kvjbnk5n04bq_470 ;
 wire	ukho4a0t12px4nyma7nlkfx92_743 ;
 wire	fgphpgym99kbp0zwlcgefjb_893 ;
 wire	lni8c3prnq50oi0jfrewxy296eprill7_451 ;
 wire	ai0z9goe2brldm1qxtpsqjjw07hn9r_78 ;
 wire	l627jrk1q3rsmj13_688 ;
 wire	l5gxirln9bs7p7i1_753 ;


 assign pgvmb00xowirsp3z58l69ex0q8scgu_814 = 
	o1qttfuhuniq3n0rg7m_743 + 1 ;
 assign mih34igylhc9k6pnhjbvahk0306o6_93 = 
	p61qwtjfhttuearc1_351 + 1 ;
 assign uxc0nnyv3hrco8fzx_829 = (
	((o1qttfuhuniq3n0rg7m_743 > 5'b00000))?1'b1:
	0)  ;
 assign wjr2mw3hrh54l2lrdga_283 = 
	rst | bobbwadsbyn1p9tvpi3z_445 ;
 assign onrmlmnub26zcig41f_496 = 
	wjr2mw3hrh54l2lrdga_283 | uxc0nnyv3hrco8fzx_829 ;
 assign h160awijt8lv8d741_641 = (
	((bobbwadsbyn1p9tvpi3z_445 == 1'b1) && (l5gxirln9bs7p7i1_753 == 1'b1) && (o1qttfuhuniq3n0rg7m_743 == 5'b00000))?1'b1:
	((o1qttfuhuniq3n0rg7m_743 != 5'b00000) && (bobbwadsbyn1p9tvpi3z_445 != 1'b1))?1'b1:
	0)  ;
 assign gxkppb10dkv7segbaiie3rcjxr_676 = (
	((pkrcsv17n470vbr3bml_665 == 1'b1))?1'b1:
	0)  ;
 assign k4bt4f8t7poqch2kvjbnk5n04bq_470 = (
	((o1qttfuhuniq3n0rg7m_743 == 5'b01111) && (bobbwadsbyn1p9tvpi3z_445 != 1'b1) && (l5gxirln9bs7p7i1_753 == 1'b1))?1'b1:
	((p61qwtjfhttuearc1_351 != 7'b0000000) && (p61qwtjfhttuearc1_351 != 7'b0111111) && (bobbwadsbyn1p9tvpi3z_445 != 1'b1) && (l5gxirln9bs7p7i1_753 == 1'b1))?1'b1:
	0)  ;
 assign ukho4a0t12px4nyma7nlkfx92_743 = (
	((p61qwtjfhttuearc1_351 == 7'b0111111))?1'b1:
	0)  ;
 assign fgphpgym99kbp0zwlcgefjb_893 = 
	1'b1 ;
 assign lni8c3prnq50oi0jfrewxy296eprill7_451 = 
	1'b0 ;
 assign ai0z9goe2brldm1qxtpsqjjw07hn9r_78 = 
	 ~(fz2cegs2osr33fhxs5fdfvaqmnfs9mu_338) ;
 assign l627jrk1q3rsmj13_688 = (
	((p61qwtjfhttuearc1_351 == 7'b0111111))?1'b1:
	0)  ;
 assign l5gxirln9bs7p7i1_753 = 
	1'b1 ;
 assign reset_out_active_high 	= m1ygr5hig0lwrtit_18 ;
 assign reset_out_active_low 	= fkprl9oa8hknwg5j43x5uzd_246 ;


assign fz2cegs2osr33fhxs5fdfvaqmnfs9mu_338 = (
	((onrmlmnub26zcig41f_496 == 1'b1) && (o1qttfuhuniq3n0rg7m_743 < 5'b10000))?fgphpgym99kbp0zwlcgefjb_893 :
1'b0) ;



always @(posedge clk)
begin
		pkrcsv17n470vbr3bml_665 <= rst ;
		bobbwadsbyn1p9tvpi3z_445 <= pkrcsv17n470vbr3bml_665 ;
	if (gxkppb10dkv7segbaiie3rcjxr_676) 
	begin 
	  o1qttfuhuniq3n0rg7m_743 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (h160awijt8lv8d741_641) 
		begin 
			o1qttfuhuniq3n0rg7m_743 <= pgvmb00xowirsp3z58l69ex0q8scgu_814 ;
		end 
	end 
	if (gxkppb10dkv7segbaiie3rcjxr_676) 
	begin 
	  p61qwtjfhttuearc1_351 <= 7'b0000000 ;
	 end 
	else 
	begin 
		if (k4bt4f8t7poqch2kvjbnk5n04bq_470) 
		begin 
			p61qwtjfhttuearc1_351 <= mih34igylhc9k6pnhjbvahk0306o6_93 ;
		end 
	end 
	if (rst) 
	begin 
	  txc2ql7gy0f6fdwwqnk2e1kb1k6hmsj_535 <= 1'b1 ;
	 end 
	else 
	begin 
			txc2ql7gy0f6fdwwqnk2e1kb1k6hmsj_535 <= fz2cegs2osr33fhxs5fdfvaqmnfs9mu_338 ;
	end 
	if (rst) 
	begin 
	  cs1ksh4jglxdgyqo8zo1u0vnfsh3n_476 <= 1'b0 ;
	 end 
	else 
	begin 
			cs1ksh4jglxdgyqo8zo1u0vnfsh3n_476 <= ai0z9goe2brldm1qxtpsqjjw07hn9r_78 ;
	end 
	if (rst) 
	begin 
	  m1ygr5hig0lwrtit_18 <= 1'b1 ;
	 end 
	else 
	begin 
			m1ygr5hig0lwrtit_18 <= txc2ql7gy0f6fdwwqnk2e1kb1k6hmsj_535 ;
	end 
	if (rst) 
	begin 
	  fkprl9oa8hknwg5j43x5uzd_246 <= 1'b0 ;
	 end 
	else 
	begin 
			fkprl9oa8hknwg5j43x5uzd_246 <= cs1ksh4jglxdgyqo8zo1u0vnfsh3n_476 ;
	end 
		init_done <= l627jrk1q3rsmj13_688 ;
end

endmodule 
