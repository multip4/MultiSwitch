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
// File created: 2019/12/04 18:15:53
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






 reg	vt9mf9jlb6zugz29ickrdgrgas1_718;	 initial vt9mf9jlb6zugz29ickrdgrgas1_718 = 1'b0 ;
 reg	w0qjyltcn745ozpiojpvcd_432;	 initial w0qjyltcn745ozpiojpvcd_432 = 1'b0 ;
 reg [4:0] fcsb958a091iotiyletesozu9kdo9to_476;	 initial fcsb958a091iotiyletesozu9kdo9to_476 = 5'b00000 ;
 reg [6:0] ghrbixnktmw4ek5bgo1b3eea4gg_482;	 initial ghrbixnktmw4ek5bgo1b3eea4gg_482 = 7'b0000000 ;
 wire	gjwgfgucmsh93gzdqx462zdxlkw_307 ;
 reg	mlzk4r3ia4wcodexa7kinm_523;	 initial mlzk4r3ia4wcodexa7kinm_523 = 1'b1 ;
 reg	d6pnr364k2030odl1isih8a_160;	 initial d6pnr364k2030odl1isih8a_160 = 1'b0 ;
 reg	rk34s499bkfr655ti6n2gfeakkeq9v_485;	 initial rk34s499bkfr655ti6n2gfeakkeq9v_485 = 1'b1 ;
 reg	iny3kgza2sya94gsat8dm_138;	 initial iny3kgza2sya94gsat8dm_138 = 1'b0 ;
 wire [4:0] v4lcsdfz6k1hgq2mw_132 ;
 wire [6:0] qt23vsxr9c44kerjeyosq8a_733 ;
 wire	tj0ax0ld6gwf10z7j7g9n5432qdi_297 ;
 wire	aufwrusv33ch28wgt_563 ;
 wire	upudf3m0vxnq2ilkz7tro_902 ;
 wire	qbjy2p2s8ft6tdk9_775 ;
 wire	rl8aoe4ye357r4kx4otzd7_299 ;
 wire	gdp1mc7y7d1g84dmm4cvh2_352 ;
 wire	jezexn87xvv84nuhnhtmczirba3hh_67 ;
 wire	ew76jor0fiuxu348665b79_877 ;
 wire	p1r821v821n73mnvfttiz07idyeks4vp_651 ;
 wire	jn2h5jlrmhktdo6q6p_370 ;
 wire	qrb132e2pb1p46x0m5iw4awvd6jo_791 ;
 wire	ddi8vvlngq0bhrcay9xjf0qjezk_185 ;


 assign v4lcsdfz6k1hgq2mw_132 = 
	fcsb958a091iotiyletesozu9kdo9to_476 + 1 ;
 assign qt23vsxr9c44kerjeyosq8a_733 = 
	ghrbixnktmw4ek5bgo1b3eea4gg_482 + 1 ;
 assign tj0ax0ld6gwf10z7j7g9n5432qdi_297 = (
	((fcsb958a091iotiyletesozu9kdo9to_476 > 5'b00000))?1'b1:
	0)  ;
 assign aufwrusv33ch28wgt_563 = 
	rst | w0qjyltcn745ozpiojpvcd_432 ;
 assign upudf3m0vxnq2ilkz7tro_902 = 
	aufwrusv33ch28wgt_563 | tj0ax0ld6gwf10z7j7g9n5432qdi_297 ;
 assign qbjy2p2s8ft6tdk9_775 = (
	((w0qjyltcn745ozpiojpvcd_432 == 1'b1) && (ddi8vvlngq0bhrcay9xjf0qjezk_185 == 1'b1) && (fcsb958a091iotiyletesozu9kdo9to_476 == 5'b00000))?1'b1:
	((fcsb958a091iotiyletesozu9kdo9to_476 != 5'b00000) && (w0qjyltcn745ozpiojpvcd_432 != 1'b1))?1'b1:
	0)  ;
 assign rl8aoe4ye357r4kx4otzd7_299 = (
	((vt9mf9jlb6zugz29ickrdgrgas1_718 == 1'b1))?1'b1:
	0)  ;
 assign gdp1mc7y7d1g84dmm4cvh2_352 = (
	((fcsb958a091iotiyletesozu9kdo9to_476 == 5'b01111) && (w0qjyltcn745ozpiojpvcd_432 != 1'b1) && (ddi8vvlngq0bhrcay9xjf0qjezk_185 == 1'b1))?1'b1:
	((ghrbixnktmw4ek5bgo1b3eea4gg_482 != 7'b0000000) && (ghrbixnktmw4ek5bgo1b3eea4gg_482 != 7'b0111111) && (w0qjyltcn745ozpiojpvcd_432 != 1'b1) && (ddi8vvlngq0bhrcay9xjf0qjezk_185 == 1'b1))?1'b1:
	0)  ;
 assign jezexn87xvv84nuhnhtmczirba3hh_67 = (
	((ghrbixnktmw4ek5bgo1b3eea4gg_482 == 7'b0111111))?1'b1:
	0)  ;
 assign ew76jor0fiuxu348665b79_877 = 
	1'b1 ;
 assign p1r821v821n73mnvfttiz07idyeks4vp_651 = 
	1'b0 ;
 assign jn2h5jlrmhktdo6q6p_370 = 
	 ~(gjwgfgucmsh93gzdqx462zdxlkw_307) ;
 assign qrb132e2pb1p46x0m5iw4awvd6jo_791 = (
	((ghrbixnktmw4ek5bgo1b3eea4gg_482 == 7'b0111111))?1'b1:
	0)  ;
 assign ddi8vvlngq0bhrcay9xjf0qjezk_185 = 
	1'b1 ;
 assign reset_out_active_high 	= rk34s499bkfr655ti6n2gfeakkeq9v_485 ;
 assign reset_out_active_low 	= iny3kgza2sya94gsat8dm_138 ;


assign gjwgfgucmsh93gzdqx462zdxlkw_307 = (
	((upudf3m0vxnq2ilkz7tro_902 == 1'b1) && (fcsb958a091iotiyletesozu9kdo9to_476 < 5'b10000))?ew76jor0fiuxu348665b79_877 :
1'b0) ;



always @(posedge clk)
begin
		vt9mf9jlb6zugz29ickrdgrgas1_718 <= rst ;
		w0qjyltcn745ozpiojpvcd_432 <= vt9mf9jlb6zugz29ickrdgrgas1_718 ;
	if (rl8aoe4ye357r4kx4otzd7_299) 
	begin 
	  fcsb958a091iotiyletesozu9kdo9to_476 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (qbjy2p2s8ft6tdk9_775) 
		begin 
			fcsb958a091iotiyletesozu9kdo9to_476 <= v4lcsdfz6k1hgq2mw_132 ;
		end 
	end 
	if (rl8aoe4ye357r4kx4otzd7_299) 
	begin 
	  ghrbixnktmw4ek5bgo1b3eea4gg_482 <= 7'b0000000 ;
	 end 
	else 
	begin 
		if (gdp1mc7y7d1g84dmm4cvh2_352) 
		begin 
			ghrbixnktmw4ek5bgo1b3eea4gg_482 <= qt23vsxr9c44kerjeyosq8a_733 ;
		end 
	end 
	if (rst) 
	begin 
	  mlzk4r3ia4wcodexa7kinm_523 <= 1'b1 ;
	 end 
	else 
	begin 
			mlzk4r3ia4wcodexa7kinm_523 <= gjwgfgucmsh93gzdqx462zdxlkw_307 ;
	end 
	if (rst) 
	begin 
	  d6pnr364k2030odl1isih8a_160 <= 1'b0 ;
	 end 
	else 
	begin 
			d6pnr364k2030odl1isih8a_160 <= jn2h5jlrmhktdo6q6p_370 ;
	end 
	if (rst) 
	begin 
	  rk34s499bkfr655ti6n2gfeakkeq9v_485 <= 1'b1 ;
	 end 
	else 
	begin 
			rk34s499bkfr655ti6n2gfeakkeq9v_485 <= mlzk4r3ia4wcodexa7kinm_523 ;
	end 
	if (rst) 
	begin 
	  iny3kgza2sya94gsat8dm_138 <= 1'b0 ;
	 end 
	else 
	begin 
			iny3kgza2sya94gsat8dm_138 <= d6pnr364k2030odl1isih8a_160 ;
	end 
		init_done <= qrb132e2pb1p46x0m5iw4awvd6jo_791 ;
end

endmodule 
