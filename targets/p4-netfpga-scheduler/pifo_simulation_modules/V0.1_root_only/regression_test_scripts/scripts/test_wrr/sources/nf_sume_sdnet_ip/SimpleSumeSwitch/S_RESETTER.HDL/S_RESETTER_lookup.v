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
// File created: 2020/10/08 13:42:06
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






 reg	gj8ilgmyl9nqv2j5o5pd0lrre_461;	 initial gj8ilgmyl9nqv2j5o5pd0lrre_461 = 1'b0 ;
 reg	tdct4lmy8qep6bsn3d_579;	 initial tdct4lmy8qep6bsn3d_579 = 1'b0 ;
 reg [4:0] maqw69akq3y7sb1ryx_802;	 initial maqw69akq3y7sb1ryx_802 = 5'b00000 ;
 reg [7:0] kwyq5cozyn5yc97pqgr3vksw4a2_405;	 initial kwyq5cozyn5yc97pqgr3vksw4a2_405 = 8'h00 ;
 wire	s3ohanfr5cqo9hqsb65mxrlld7p_361 ;
 reg	mu63rprkl0ta9f24dik1488vsott_659;	 initial mu63rprkl0ta9f24dik1488vsott_659 = 1'b1 ;
 reg	c0qsv7zpvxlegzk92_83;	 initial c0qsv7zpvxlegzk92_83 = 1'b0 ;
 reg	a79d2ypm1f23gkcdb2_432;	 initial a79d2ypm1f23gkcdb2_432 = 1'b1 ;
 reg	z7a2syekfxq5nspf06xr5ia86f78_435;	 initial z7a2syekfxq5nspf06xr5ia86f78_435 = 1'b0 ;
 wire [4:0] onpy3mcu5lqbsxkl_213 ;
 wire [7:0] i8yzt6qhuqkvvohyf_12 ;
 wire	kma30jd1pgdat5j2zwx9cmgf_296 ;
 wire	oiorsrvhm4cmv0c33ir_132 ;
 wire	ttogb95ybs9kfise2eotuiqu_723 ;
 wire	f74eae26bei67ef92npxd1_109 ;
 wire	tk8abxxrsvb0xpfvudq31t1d7d7htv9g_117 ;
 wire	ch9uwma01uwudjori89q4fvl3ls_835 ;
 wire	b0d8e2w8mbk2l3a7_614 ;
 wire	tjbg119w881ur1e0rxy0aybs4u0_842 ;
 wire	wx1mbixrm29dwpbsvdo75c_78 ;
 wire	f8ktltoh2mfbwerccyc5b8q0ni_510 ;
 wire	onrh53q8voasc5fu9lg_455 ;
 wire	p15d9wxugirevpnmo1u0hya3n4_462 ;


 assign onpy3mcu5lqbsxkl_213 = 
	maqw69akq3y7sb1ryx_802 + 1 ;
 assign i8yzt6qhuqkvvohyf_12 = 
	kwyq5cozyn5yc97pqgr3vksw4a2_405 + 1 ;
 assign kma30jd1pgdat5j2zwx9cmgf_296 = (
	((maqw69akq3y7sb1ryx_802 > 5'b00000))?1'b1:
	0)  ;
 assign oiorsrvhm4cmv0c33ir_132 = 
	rst | tdct4lmy8qep6bsn3d_579 ;
 assign ttogb95ybs9kfise2eotuiqu_723 = 
	oiorsrvhm4cmv0c33ir_132 | kma30jd1pgdat5j2zwx9cmgf_296 ;
 assign f74eae26bei67ef92npxd1_109 = (
	((tdct4lmy8qep6bsn3d_579 == 1'b1) && (p15d9wxugirevpnmo1u0hya3n4_462 == 1'b1) && (maqw69akq3y7sb1ryx_802 == 5'b00000))?1'b1:
	((maqw69akq3y7sb1ryx_802 != 5'b00000) && (tdct4lmy8qep6bsn3d_579 != 1'b1))?1'b1:
	0)  ;
 assign tk8abxxrsvb0xpfvudq31t1d7d7htv9g_117 = (
	((gj8ilgmyl9nqv2j5o5pd0lrre_461 == 1'b1))?1'b1:
	0)  ;
 assign ch9uwma01uwudjori89q4fvl3ls_835 = (
	((maqw69akq3y7sb1ryx_802 == 5'b01111) && (tdct4lmy8qep6bsn3d_579 != 1'b1) && (p15d9wxugirevpnmo1u0hya3n4_462 == 1'b1))?1'b1:
	((kwyq5cozyn5yc97pqgr3vksw4a2_405 != 8'h00) && (kwyq5cozyn5yc97pqgr3vksw4a2_405 != 8'h86) && (tdct4lmy8qep6bsn3d_579 != 1'b1) && (p15d9wxugirevpnmo1u0hya3n4_462 == 1'b1))?1'b1:
	0)  ;
 assign b0d8e2w8mbk2l3a7_614 = (
	((kwyq5cozyn5yc97pqgr3vksw4a2_405 == 8'h86))?1'b1:
	0)  ;
 assign tjbg119w881ur1e0rxy0aybs4u0_842 = 
	1'b1 ;
 assign wx1mbixrm29dwpbsvdo75c_78 = 
	1'b0 ;
 assign f8ktltoh2mfbwerccyc5b8q0ni_510 = 
	 ~(s3ohanfr5cqo9hqsb65mxrlld7p_361) ;
 assign onrh53q8voasc5fu9lg_455 = (
	((kwyq5cozyn5yc97pqgr3vksw4a2_405 == 8'h86))?1'b1:
	0)  ;
 assign p15d9wxugirevpnmo1u0hya3n4_462 = 
	1'b1 ;
 assign reset_out_active_high 	= a79d2ypm1f23gkcdb2_432 ;
 assign reset_out_active_low 	= z7a2syekfxq5nspf06xr5ia86f78_435 ;


assign s3ohanfr5cqo9hqsb65mxrlld7p_361 = (
	((ttogb95ybs9kfise2eotuiqu_723 == 1'b1) && (maqw69akq3y7sb1ryx_802 < 5'b10000))?tjbg119w881ur1e0rxy0aybs4u0_842 :
1'b0) ;



always @(posedge clk)
begin
		gj8ilgmyl9nqv2j5o5pd0lrre_461 <= rst ;
		tdct4lmy8qep6bsn3d_579 <= gj8ilgmyl9nqv2j5o5pd0lrre_461 ;
	if (tk8abxxrsvb0xpfvudq31t1d7d7htv9g_117) 
	begin 
	  maqw69akq3y7sb1ryx_802 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (f74eae26bei67ef92npxd1_109) 
		begin 
			maqw69akq3y7sb1ryx_802 <= onpy3mcu5lqbsxkl_213 ;
		end 
	end 
	if (tk8abxxrsvb0xpfvudq31t1d7d7htv9g_117) 
	begin 
	  kwyq5cozyn5yc97pqgr3vksw4a2_405 <= 8'h00 ;
	 end 
	else 
	begin 
		if (ch9uwma01uwudjori89q4fvl3ls_835) 
		begin 
			kwyq5cozyn5yc97pqgr3vksw4a2_405 <= i8yzt6qhuqkvvohyf_12 ;
		end 
	end 
	if (rst) 
	begin 
	  mu63rprkl0ta9f24dik1488vsott_659 <= 1'b1 ;
	 end 
	else 
	begin 
			mu63rprkl0ta9f24dik1488vsott_659 <= s3ohanfr5cqo9hqsb65mxrlld7p_361 ;
	end 
	if (rst) 
	begin 
	  c0qsv7zpvxlegzk92_83 <= 1'b0 ;
	 end 
	else 
	begin 
			c0qsv7zpvxlegzk92_83 <= f8ktltoh2mfbwerccyc5b8q0ni_510 ;
	end 
	if (rst) 
	begin 
	  a79d2ypm1f23gkcdb2_432 <= 1'b1 ;
	 end 
	else 
	begin 
			a79d2ypm1f23gkcdb2_432 <= mu63rprkl0ta9f24dik1488vsott_659 ;
	end 
	if (rst) 
	begin 
	  z7a2syekfxq5nspf06xr5ia86f78_435 <= 1'b0 ;
	 end 
	else 
	begin 
			z7a2syekfxq5nspf06xr5ia86f78_435 <= c0qsv7zpvxlegzk92_83 ;
	end 
		init_done <= onrh53q8voasc5fu9lg_455 ;
end

endmodule 
