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
// File created: 2020/10/08 13:42:06
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






 reg	gi5hctoaxyniq9miiyirern_900;	 initial gi5hctoaxyniq9miiyirern_900 = 1'b0 ;
 reg	fft5e10v3szwgxqxcgiql7u7siit4g_499;	 initial fft5e10v3szwgxqxcgiql7u7siit4g_499 = 1'b0 ;
 reg [4:0] pkc5pjg4ya4qk31aj_56;	 initial pkc5pjg4ya4qk31aj_56 = 5'b00000 ;
 reg [6:0] q1fpy6rrhyudkq1iojo3br17_41;	 initial q1fpy6rrhyudkq1iojo3br17_41 = 7'b0000000 ;
 wire	gpll70p3gwv35k2671hrdctq6vi105c2_487 ;
 reg	yoo2proydafsc5boht80jpd9roc2fm_476;	 initial yoo2proydafsc5boht80jpd9roc2fm_476 = 1'b1 ;
 reg	q8pgfewycceb0emqbkfp32m59702oxxh_64;	 initial q8pgfewycceb0emqbkfp32m59702oxxh_64 = 1'b0 ;
 reg	c5k9uef3zkkjicezcphc_267;	 initial c5k9uef3zkkjicezcphc_267 = 1'b1 ;
 reg	hmokfks5s8xgv3x2n8q0xagq_176;	 initial hmokfks5s8xgv3x2n8q0xagq_176 = 1'b0 ;
 wire [4:0] x7mkmi5kk7r303t44_731 ;
 wire [6:0] k75bpcj15p87e4zx4hs_902 ;
 wire	x2rhoauq7mvy02mxy1key_510 ;
 wire	zoxm96dbr1p9dnmd3pr5gr7xue5_774 ;
 wire	quq8vrv5fmpnyisq45f3t2_647 ;
 wire	rvdnw3ipnxzb1sgj37nnzz6r7pqwch_54 ;
 wire	sdso34r78c5k9v8wmoneyk2ad9pdo_877 ;
 wire	kvzh3kxs5esg6ynj7tjveyde5hs4_784 ;
 wire	laz89wh5ui7y7vs5v1sl_406 ;
 wire	vmvbsfa4lgo4u2knw1eredot_318 ;
 wire	vgmjcjj86wv5v4wkr7cev9y3ty2dw_110 ;
 wire	ozd3227mqiabyr1gsu63ytvgvwb_831 ;
 wire	jq0qo0c2m5rr2wg2pg335ylw8bapj_560 ;
 wire	ci0c8pb49g1liy5iezn9zpx_34 ;


 assign x7mkmi5kk7r303t44_731 = 
	pkc5pjg4ya4qk31aj_56 + 1 ;
 assign k75bpcj15p87e4zx4hs_902 = 
	q1fpy6rrhyudkq1iojo3br17_41 + 1 ;
 assign x2rhoauq7mvy02mxy1key_510 = (
	((pkc5pjg4ya4qk31aj_56 > 5'b00000))?1'b1:
	0)  ;
 assign zoxm96dbr1p9dnmd3pr5gr7xue5_774 = 
	rst | fft5e10v3szwgxqxcgiql7u7siit4g_499 ;
 assign quq8vrv5fmpnyisq45f3t2_647 = 
	zoxm96dbr1p9dnmd3pr5gr7xue5_774 | x2rhoauq7mvy02mxy1key_510 ;
 assign rvdnw3ipnxzb1sgj37nnzz6r7pqwch_54 = (
	((fft5e10v3szwgxqxcgiql7u7siit4g_499 == 1'b1) && (ci0c8pb49g1liy5iezn9zpx_34 == 1'b1) && (pkc5pjg4ya4qk31aj_56 == 5'b00000))?1'b1:
	((pkc5pjg4ya4qk31aj_56 != 5'b00000) && (fft5e10v3szwgxqxcgiql7u7siit4g_499 != 1'b1))?1'b1:
	0)  ;
 assign sdso34r78c5k9v8wmoneyk2ad9pdo_877 = (
	((gi5hctoaxyniq9miiyirern_900 == 1'b1))?1'b1:
	0)  ;
 assign kvzh3kxs5esg6ynj7tjveyde5hs4_784 = (
	((pkc5pjg4ya4qk31aj_56 == 5'b01111) && (fft5e10v3szwgxqxcgiql7u7siit4g_499 != 1'b1) && (ci0c8pb49g1liy5iezn9zpx_34 == 1'b1))?1'b1:
	((q1fpy6rrhyudkq1iojo3br17_41 != 7'b0000000) && (q1fpy6rrhyudkq1iojo3br17_41 != 7'b0111111) && (fft5e10v3szwgxqxcgiql7u7siit4g_499 != 1'b1) && (ci0c8pb49g1liy5iezn9zpx_34 == 1'b1))?1'b1:
	0)  ;
 assign laz89wh5ui7y7vs5v1sl_406 = (
	((q1fpy6rrhyudkq1iojo3br17_41 == 7'b0111111))?1'b1:
	0)  ;
 assign vmvbsfa4lgo4u2knw1eredot_318 = 
	1'b1 ;
 assign vgmjcjj86wv5v4wkr7cev9y3ty2dw_110 = 
	1'b0 ;
 assign ozd3227mqiabyr1gsu63ytvgvwb_831 = 
	 ~(gpll70p3gwv35k2671hrdctq6vi105c2_487) ;
 assign jq0qo0c2m5rr2wg2pg335ylw8bapj_560 = (
	((q1fpy6rrhyudkq1iojo3br17_41 == 7'b0111111))?1'b1:
	0)  ;
 assign ci0c8pb49g1liy5iezn9zpx_34 = 
	1'b1 ;
 assign reset_out_active_high 	= c5k9uef3zkkjicezcphc_267 ;
 assign reset_out_active_low 	= hmokfks5s8xgv3x2n8q0xagq_176 ;


assign gpll70p3gwv35k2671hrdctq6vi105c2_487 = (
	((quq8vrv5fmpnyisq45f3t2_647 == 1'b1) && (pkc5pjg4ya4qk31aj_56 < 5'b10000))?vmvbsfa4lgo4u2knw1eredot_318 :
1'b0) ;



always @(posedge clk)
begin
		gi5hctoaxyniq9miiyirern_900 <= rst ;
		fft5e10v3szwgxqxcgiql7u7siit4g_499 <= gi5hctoaxyniq9miiyirern_900 ;
	if (sdso34r78c5k9v8wmoneyk2ad9pdo_877) 
	begin 
	  pkc5pjg4ya4qk31aj_56 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (rvdnw3ipnxzb1sgj37nnzz6r7pqwch_54) 
		begin 
			pkc5pjg4ya4qk31aj_56 <= x7mkmi5kk7r303t44_731 ;
		end 
	end 
	if (sdso34r78c5k9v8wmoneyk2ad9pdo_877) 
	begin 
	  q1fpy6rrhyudkq1iojo3br17_41 <= 7'b0000000 ;
	 end 
	else 
	begin 
		if (kvzh3kxs5esg6ynj7tjveyde5hs4_784) 
		begin 
			q1fpy6rrhyudkq1iojo3br17_41 <= k75bpcj15p87e4zx4hs_902 ;
		end 
	end 
	if (rst) 
	begin 
	  yoo2proydafsc5boht80jpd9roc2fm_476 <= 1'b1 ;
	 end 
	else 
	begin 
			yoo2proydafsc5boht80jpd9roc2fm_476 <= gpll70p3gwv35k2671hrdctq6vi105c2_487 ;
	end 
	if (rst) 
	begin 
	  q8pgfewycceb0emqbkfp32m59702oxxh_64 <= 1'b0 ;
	 end 
	else 
	begin 
			q8pgfewycceb0emqbkfp32m59702oxxh_64 <= ozd3227mqiabyr1gsu63ytvgvwb_831 ;
	end 
	if (rst) 
	begin 
	  c5k9uef3zkkjicezcphc_267 <= 1'b1 ;
	 end 
	else 
	begin 
			c5k9uef3zkkjicezcphc_267 <= yoo2proydafsc5boht80jpd9roc2fm_476 ;
	end 
	if (rst) 
	begin 
	  hmokfks5s8xgv3x2n8q0xagq_176 <= 1'b0 ;
	 end 
	else 
	begin 
			hmokfks5s8xgv3x2n8q0xagq_176 <= q8pgfewycceb0emqbkfp32m59702oxxh_64 ;
	end 
		init_done <= jq0qo0c2m5rr2wg2pg335ylw8bapj_560 ;
end

endmodule 
