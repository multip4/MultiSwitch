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
// File created: 2020/10/08 13:42:06
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






 reg	sbljppe4nyeoi3irjlemywrs478gn_623;	 initial sbljppe4nyeoi3irjlemywrs478gn_623 = 1'b0 ;
 reg	vnkw4g7vos9srorzwwplpd5hi6lt_631;	 initial vnkw4g7vos9srorzwwplpd5hi6lt_631 = 1'b0 ;
 reg [4:0] hz7yk8lvzti73gzz23lk9fz_24;	 initial hz7yk8lvzti73gzz23lk9fz_24 = 5'b00000 ;
 reg [6:0] wdarincejxfnc4zetqvaqdeq9tmw1_31;	 initial wdarincejxfnc4zetqvaqdeq9tmw1_31 = 7'b0000000 ;
 wire	bf3npt60s3ijj16b_26 ;
 reg	n27vvyd4v5currdvh5ms_496;	 initial n27vvyd4v5currdvh5ms_496 = 1'b1 ;
 reg	shc7pczhbs0ke6zycfpyw_654;	 initial shc7pczhbs0ke6zycfpyw_654 = 1'b0 ;
 reg	q3vmz3mfrlhsxqko7ymm_147;	 initial q3vmz3mfrlhsxqko7ymm_147 = 1'b1 ;
 reg	mxshfjmkmbj783pc618p793_852;	 initial mxshfjmkmbj783pc618p793_852 = 1'b0 ;
 wire [4:0] k39pqwlnxy2c3ykn3qa474xfp8zfe_420 ;
 wire [6:0] imme0hyw7ylhckmv742_680 ;
 wire	v207z0dijgxw121yjngc2nm2ms3_235 ;
 wire	rv8rvxjl9u9jci1kjadnvxy7ct8ao64q_828 ;
 wire	pd2i8c2jy1tafyta0hf1_185 ;
 wire	gvseuw2ldsw165fk05uhx6tse_59 ;
 wire	r947qs1kssoke0wd6waqek5fw9jubv_738 ;
 wire	rox8qbmzbtioun7a2u_145 ;
 wire	tetoqu6wzymk5kw9dzkiba_145 ;
 wire	t0a6xqdhb1xtxwgle4jeh27wfn93_587 ;
 wire	f9g5buj1ealyp5atsuekusxhenldt_412 ;
 wire	ki6eduueesrs5rmu572afejgos4gtqj_852 ;
 wire	je361ya60gapzsuvq1ep422yswapf_183 ;
 wire	ic4fgkss45213vm6l6gf_567 ;


 assign k39pqwlnxy2c3ykn3qa474xfp8zfe_420 = 
	hz7yk8lvzti73gzz23lk9fz_24 + 1 ;
 assign imme0hyw7ylhckmv742_680 = 
	wdarincejxfnc4zetqvaqdeq9tmw1_31 + 1 ;
 assign v207z0dijgxw121yjngc2nm2ms3_235 = (
	((hz7yk8lvzti73gzz23lk9fz_24 > 5'b00000))?1'b1:
	0)  ;
 assign rv8rvxjl9u9jci1kjadnvxy7ct8ao64q_828 = 
	rst | vnkw4g7vos9srorzwwplpd5hi6lt_631 ;
 assign pd2i8c2jy1tafyta0hf1_185 = 
	rv8rvxjl9u9jci1kjadnvxy7ct8ao64q_828 | v207z0dijgxw121yjngc2nm2ms3_235 ;
 assign gvseuw2ldsw165fk05uhx6tse_59 = (
	((vnkw4g7vos9srorzwwplpd5hi6lt_631 == 1'b1) && (ic4fgkss45213vm6l6gf_567 == 1'b1) && (hz7yk8lvzti73gzz23lk9fz_24 == 5'b00000))?1'b1:
	((hz7yk8lvzti73gzz23lk9fz_24 != 5'b00000) && (vnkw4g7vos9srorzwwplpd5hi6lt_631 != 1'b1))?1'b1:
	0)  ;
 assign r947qs1kssoke0wd6waqek5fw9jubv_738 = (
	((sbljppe4nyeoi3irjlemywrs478gn_623 == 1'b1))?1'b1:
	0)  ;
 assign rox8qbmzbtioun7a2u_145 = (
	((hz7yk8lvzti73gzz23lk9fz_24 == 5'b01111) && (vnkw4g7vos9srorzwwplpd5hi6lt_631 != 1'b1) && (ic4fgkss45213vm6l6gf_567 == 1'b1))?1'b1:
	((wdarincejxfnc4zetqvaqdeq9tmw1_31 != 7'b0000000) && (wdarincejxfnc4zetqvaqdeq9tmw1_31 != 7'b0111111) && (vnkw4g7vos9srorzwwplpd5hi6lt_631 != 1'b1) && (ic4fgkss45213vm6l6gf_567 == 1'b1))?1'b1:
	0)  ;
 assign tetoqu6wzymk5kw9dzkiba_145 = (
	((wdarincejxfnc4zetqvaqdeq9tmw1_31 == 7'b0111111))?1'b1:
	0)  ;
 assign t0a6xqdhb1xtxwgle4jeh27wfn93_587 = 
	1'b1 ;
 assign f9g5buj1ealyp5atsuekusxhenldt_412 = 
	1'b0 ;
 assign ki6eduueesrs5rmu572afejgos4gtqj_852 = 
	 ~(bf3npt60s3ijj16b_26) ;
 assign je361ya60gapzsuvq1ep422yswapf_183 = (
	((wdarincejxfnc4zetqvaqdeq9tmw1_31 == 7'b0111111))?1'b1:
	0)  ;
 assign ic4fgkss45213vm6l6gf_567 = 
	1'b1 ;
 assign reset_out_active_high 	= q3vmz3mfrlhsxqko7ymm_147 ;
 assign reset_out_active_low 	= mxshfjmkmbj783pc618p793_852 ;


assign bf3npt60s3ijj16b_26 = (
	((pd2i8c2jy1tafyta0hf1_185 == 1'b1) && (hz7yk8lvzti73gzz23lk9fz_24 < 5'b10000))?t0a6xqdhb1xtxwgle4jeh27wfn93_587 :
1'b0) ;



always @(posedge clk)
begin
		sbljppe4nyeoi3irjlemywrs478gn_623 <= rst ;
		vnkw4g7vos9srorzwwplpd5hi6lt_631 <= sbljppe4nyeoi3irjlemywrs478gn_623 ;
	if (r947qs1kssoke0wd6waqek5fw9jubv_738) 
	begin 
	  hz7yk8lvzti73gzz23lk9fz_24 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (gvseuw2ldsw165fk05uhx6tse_59) 
		begin 
			hz7yk8lvzti73gzz23lk9fz_24 <= k39pqwlnxy2c3ykn3qa474xfp8zfe_420 ;
		end 
	end 
	if (r947qs1kssoke0wd6waqek5fw9jubv_738) 
	begin 
	  wdarincejxfnc4zetqvaqdeq9tmw1_31 <= 7'b0000000 ;
	 end 
	else 
	begin 
		if (rox8qbmzbtioun7a2u_145) 
		begin 
			wdarincejxfnc4zetqvaqdeq9tmw1_31 <= imme0hyw7ylhckmv742_680 ;
		end 
	end 
	if (rst) 
	begin 
	  n27vvyd4v5currdvh5ms_496 <= 1'b1 ;
	 end 
	else 
	begin 
			n27vvyd4v5currdvh5ms_496 <= bf3npt60s3ijj16b_26 ;
	end 
	if (rst) 
	begin 
	  shc7pczhbs0ke6zycfpyw_654 <= 1'b0 ;
	 end 
	else 
	begin 
			shc7pczhbs0ke6zycfpyw_654 <= ki6eduueesrs5rmu572afejgos4gtqj_852 ;
	end 
	if (rst) 
	begin 
	  q3vmz3mfrlhsxqko7ymm_147 <= 1'b1 ;
	 end 
	else 
	begin 
			q3vmz3mfrlhsxqko7ymm_147 <= n27vvyd4v5currdvh5ms_496 ;
	end 
	if (rst) 
	begin 
	  mxshfjmkmbj783pc618p793_852 <= 1'b0 ;
	 end 
	else 
	begin 
			mxshfjmkmbj783pc618p793_852 <= shc7pczhbs0ke6zycfpyw_654 ;
	end 
		init_done <= je361ya60gapzsuvq1ep422yswapf_183 ;
end

endmodule 
