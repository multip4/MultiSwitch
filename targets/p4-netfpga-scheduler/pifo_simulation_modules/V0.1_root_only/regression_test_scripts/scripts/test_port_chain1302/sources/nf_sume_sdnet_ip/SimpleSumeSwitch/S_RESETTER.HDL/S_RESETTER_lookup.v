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
// File created: 2020/10/07 15:07:47
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






 reg	yqmwyj3388pvuuwvp498j0_723;	 initial yqmwyj3388pvuuwvp498j0_723 = 1'b0 ;
 reg	muzj58a22huyq94dcrk_183;	 initial muzj58a22huyq94dcrk_183 = 1'b0 ;
 reg [4:0] kyysyx97hz6o5skuohrzus2r1_649;	 initial kyysyx97hz6o5skuohrzus2r1_649 = 5'b00000 ;
 reg [7:0] eq5fl7rsidvux7bukbl9qq6q_415;	 initial eq5fl7rsidvux7bukbl9qq6q_415 = 8'h00 ;
 wire	mntpeayrom5k3jebb7h0vmxc94az_298 ;
 reg	zqts2o2cqf4wnx8ay_593;	 initial zqts2o2cqf4wnx8ay_593 = 1'b1 ;
 reg	r539izxg3oqoo6h0j5r4670527h322_214;	 initial r539izxg3oqoo6h0j5r4670527h322_214 = 1'b0 ;
 reg	rj5th7f4ks95uziwcgndifu9_605;	 initial rj5th7f4ks95uziwcgndifu9_605 = 1'b1 ;
 reg	n82oxq40lripfh1a864fc90gpg5t_906;	 initial n82oxq40lripfh1a864fc90gpg5t_906 = 1'b0 ;
 wire [4:0] arjakmvlfnp2lk0dhek_279 ;
 wire [7:0] kwxicbeyjud1nzik_651 ;
 wire	xupdi7sq9n6cuq55dtq15d3hcu23k_332 ;
 wire	pz7re5g6rxoyny4ppv0lt48uwj_759 ;
 wire	b8drqmmktymaqyh56dv0x3577q_834 ;
 wire	g23chmaj1t9ykd0yaw79_448 ;
 wire	iw143qg8uy0r7ts069pnyi1rfi1s_466 ;
 wire	t7cu0t11xlwxnyar_743 ;
 wire	abwkute71603v8zbjoegjrh_213 ;
 wire	avxg2s3oyxvbt83b_817 ;
 wire	nb0xfxna463zz4a64ychjb1o82g_368 ;
 wire	jo14ezcm13xezusmxg9oo21sjufbp_532 ;
 wire	wl7squ34c0fhumg2jjnvpm_95 ;
 wire	o3l8to631h3dj7y6wi4vgezyuo662_647 ;


 assign arjakmvlfnp2lk0dhek_279 = 
	kyysyx97hz6o5skuohrzus2r1_649 + 1 ;
 assign kwxicbeyjud1nzik_651 = 
	eq5fl7rsidvux7bukbl9qq6q_415 + 1 ;
 assign xupdi7sq9n6cuq55dtq15d3hcu23k_332 = (
	((kyysyx97hz6o5skuohrzus2r1_649 > 5'b00000))?1'b1:
	0)  ;
 assign pz7re5g6rxoyny4ppv0lt48uwj_759 = 
	rst | muzj58a22huyq94dcrk_183 ;
 assign b8drqmmktymaqyh56dv0x3577q_834 = 
	pz7re5g6rxoyny4ppv0lt48uwj_759 | xupdi7sq9n6cuq55dtq15d3hcu23k_332 ;
 assign g23chmaj1t9ykd0yaw79_448 = (
	((muzj58a22huyq94dcrk_183 == 1'b1) && (o3l8to631h3dj7y6wi4vgezyuo662_647 == 1'b1) && (kyysyx97hz6o5skuohrzus2r1_649 == 5'b00000))?1'b1:
	((kyysyx97hz6o5skuohrzus2r1_649 != 5'b00000) && (muzj58a22huyq94dcrk_183 != 1'b1))?1'b1:
	0)  ;
 assign iw143qg8uy0r7ts069pnyi1rfi1s_466 = (
	((yqmwyj3388pvuuwvp498j0_723 == 1'b1))?1'b1:
	0)  ;
 assign t7cu0t11xlwxnyar_743 = (
	((kyysyx97hz6o5skuohrzus2r1_649 == 5'b01111) && (muzj58a22huyq94dcrk_183 != 1'b1) && (o3l8to631h3dj7y6wi4vgezyuo662_647 == 1'b1))?1'b1:
	((eq5fl7rsidvux7bukbl9qq6q_415 != 8'h00) && (eq5fl7rsidvux7bukbl9qq6q_415 != 8'h86) && (muzj58a22huyq94dcrk_183 != 1'b1) && (o3l8to631h3dj7y6wi4vgezyuo662_647 == 1'b1))?1'b1:
	0)  ;
 assign abwkute71603v8zbjoegjrh_213 = (
	((eq5fl7rsidvux7bukbl9qq6q_415 == 8'h86))?1'b1:
	0)  ;
 assign avxg2s3oyxvbt83b_817 = 
	1'b1 ;
 assign nb0xfxna463zz4a64ychjb1o82g_368 = 
	1'b0 ;
 assign jo14ezcm13xezusmxg9oo21sjufbp_532 = 
	 ~(mntpeayrom5k3jebb7h0vmxc94az_298) ;
 assign wl7squ34c0fhumg2jjnvpm_95 = (
	((eq5fl7rsidvux7bukbl9qq6q_415 == 8'h86))?1'b1:
	0)  ;
 assign o3l8to631h3dj7y6wi4vgezyuo662_647 = 
	1'b1 ;
 assign reset_out_active_high 	= rj5th7f4ks95uziwcgndifu9_605 ;
 assign reset_out_active_low 	= n82oxq40lripfh1a864fc90gpg5t_906 ;


assign mntpeayrom5k3jebb7h0vmxc94az_298 = (
	((b8drqmmktymaqyh56dv0x3577q_834 == 1'b1) && (kyysyx97hz6o5skuohrzus2r1_649 < 5'b10000))?avxg2s3oyxvbt83b_817 :
1'b0) ;



always @(posedge clk)
begin
		yqmwyj3388pvuuwvp498j0_723 <= rst ;
		muzj58a22huyq94dcrk_183 <= yqmwyj3388pvuuwvp498j0_723 ;
	if (iw143qg8uy0r7ts069pnyi1rfi1s_466) 
	begin 
	  kyysyx97hz6o5skuohrzus2r1_649 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (g23chmaj1t9ykd0yaw79_448) 
		begin 
			kyysyx97hz6o5skuohrzus2r1_649 <= arjakmvlfnp2lk0dhek_279 ;
		end 
	end 
	if (iw143qg8uy0r7ts069pnyi1rfi1s_466) 
	begin 
	  eq5fl7rsidvux7bukbl9qq6q_415 <= 8'h00 ;
	 end 
	else 
	begin 
		if (t7cu0t11xlwxnyar_743) 
		begin 
			eq5fl7rsidvux7bukbl9qq6q_415 <= kwxicbeyjud1nzik_651 ;
		end 
	end 
	if (rst) 
	begin 
	  zqts2o2cqf4wnx8ay_593 <= 1'b1 ;
	 end 
	else 
	begin 
			zqts2o2cqf4wnx8ay_593 <= mntpeayrom5k3jebb7h0vmxc94az_298 ;
	end 
	if (rst) 
	begin 
	  r539izxg3oqoo6h0j5r4670527h322_214 <= 1'b0 ;
	 end 
	else 
	begin 
			r539izxg3oqoo6h0j5r4670527h322_214 <= jo14ezcm13xezusmxg9oo21sjufbp_532 ;
	end 
	if (rst) 
	begin 
	  rj5th7f4ks95uziwcgndifu9_605 <= 1'b1 ;
	 end 
	else 
	begin 
			rj5th7f4ks95uziwcgndifu9_605 <= zqts2o2cqf4wnx8ay_593 ;
	end 
	if (rst) 
	begin 
	  n82oxq40lripfh1a864fc90gpg5t_906 <= 1'b0 ;
	 end 
	else 
	begin 
			n82oxq40lripfh1a864fc90gpg5t_906 <= r539izxg3oqoo6h0j5r4670527h322_214 ;
	end 
		init_done <= wl7squ34c0fhumg2jjnvpm_95 ;
end

endmodule 
