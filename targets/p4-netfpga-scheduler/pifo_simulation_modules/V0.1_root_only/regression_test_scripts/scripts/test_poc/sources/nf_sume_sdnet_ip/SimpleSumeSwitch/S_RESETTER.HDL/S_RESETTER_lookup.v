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
// File created: 2020/10/08 15:24:15
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






 reg	uq224vb5iso2yzh55hku5hcki_361;	 initial uq224vb5iso2yzh55hku5hcki_361 = 1'b0 ;
 reg	dl8ywqc6vu1fr9nlwxal2us3hfu_324;	 initial dl8ywqc6vu1fr9nlwxal2us3hfu_324 = 1'b0 ;
 reg [4:0] bse8zt2fas6fm1vsqzka6_476;	 initial bse8zt2fas6fm1vsqzka6_476 = 5'b00000 ;
 reg [7:0] qd0og0uhkvqlh73439ju3ped3yz_842;	 initial qd0og0uhkvqlh73439ju3ped3yz_842 = 8'h00 ;
 wire	jc9glenh1q00p6fy3h740_39 ;
 reg	xczzkrk9cw9rldffwyhthmicyyzhg45n_121;	 initial xczzkrk9cw9rldffwyhthmicyyzhg45n_121 = 1'b1 ;
 reg	sc9abs2x0azyq8cfte6p4_44;	 initial sc9abs2x0azyq8cfte6p4_44 = 1'b0 ;
 reg	vl3mzkm3kw5bw66o8rvnaclvoo7_775;	 initial vl3mzkm3kw5bw66o8rvnaclvoo7_775 = 1'b1 ;
 reg	bpefa6out9b8f9uo47tlkteo4_30;	 initial bpefa6out9b8f9uo47tlkteo4_30 = 1'b0 ;
 wire [4:0] zycr14rcral3yxci432qarx7r_761 ;
 wire [7:0] x9ff5tgkk9bs5f8gzqz0mm4jt_226 ;
 wire	y6uupcv425wqri9u_437 ;
 wire	psns6uf7vb0bt6moealsm8sa_353 ;
 wire	pkorhai62e79neowky5cqgix1l_8 ;
 wire	wigiu3diqxi7k8w3ebnceoq_820 ;
 wire	s7jjr3vmvznpq35d_410 ;
 wire	iodzcvf8nxdj4ylat51t8t8s_830 ;
 wire	bf7cgs4jhsr9qcxhkuyeljzpthbe0_231 ;
 wire	ealviopmancjrszhlwjx8os_708 ;
 wire	mq7s4nl2cc31b6618b_434 ;
 wire	v9ndgy32qnlwzw3ct8cyq0bwgk84v_624 ;
 wire	qkttudas0xcug70wgawk6_432 ;
 wire	aob2ljh6wshu4evn88awzk_340 ;


 assign zycr14rcral3yxci432qarx7r_761 = 
	bse8zt2fas6fm1vsqzka6_476 + 1 ;
 assign x9ff5tgkk9bs5f8gzqz0mm4jt_226 = 
	qd0og0uhkvqlh73439ju3ped3yz_842 + 1 ;
 assign y6uupcv425wqri9u_437 = (
	((bse8zt2fas6fm1vsqzka6_476 > 5'b00000))?1'b1:
	0)  ;
 assign psns6uf7vb0bt6moealsm8sa_353 = 
	rst | dl8ywqc6vu1fr9nlwxal2us3hfu_324 ;
 assign pkorhai62e79neowky5cqgix1l_8 = 
	psns6uf7vb0bt6moealsm8sa_353 | y6uupcv425wqri9u_437 ;
 assign wigiu3diqxi7k8w3ebnceoq_820 = (
	((dl8ywqc6vu1fr9nlwxal2us3hfu_324 == 1'b1) && (aob2ljh6wshu4evn88awzk_340 == 1'b1) && (bse8zt2fas6fm1vsqzka6_476 == 5'b00000))?1'b1:
	((bse8zt2fas6fm1vsqzka6_476 != 5'b00000) && (dl8ywqc6vu1fr9nlwxal2us3hfu_324 != 1'b1))?1'b1:
	0)  ;
 assign s7jjr3vmvznpq35d_410 = (
	((uq224vb5iso2yzh55hku5hcki_361 == 1'b1))?1'b1:
	0)  ;
 assign iodzcvf8nxdj4ylat51t8t8s_830 = (
	((bse8zt2fas6fm1vsqzka6_476 == 5'b01111) && (dl8ywqc6vu1fr9nlwxal2us3hfu_324 != 1'b1) && (aob2ljh6wshu4evn88awzk_340 == 1'b1))?1'b1:
	((qd0og0uhkvqlh73439ju3ped3yz_842 != 8'h00) && (qd0og0uhkvqlh73439ju3ped3yz_842 != 8'h86) && (dl8ywqc6vu1fr9nlwxal2us3hfu_324 != 1'b1) && (aob2ljh6wshu4evn88awzk_340 == 1'b1))?1'b1:
	0)  ;
 assign bf7cgs4jhsr9qcxhkuyeljzpthbe0_231 = (
	((qd0og0uhkvqlh73439ju3ped3yz_842 == 8'h86))?1'b1:
	0)  ;
 assign ealviopmancjrszhlwjx8os_708 = 
	1'b1 ;
 assign mq7s4nl2cc31b6618b_434 = 
	1'b0 ;
 assign v9ndgy32qnlwzw3ct8cyq0bwgk84v_624 = 
	 ~(jc9glenh1q00p6fy3h740_39) ;
 assign qkttudas0xcug70wgawk6_432 = (
	((qd0og0uhkvqlh73439ju3ped3yz_842 == 8'h86))?1'b1:
	0)  ;
 assign aob2ljh6wshu4evn88awzk_340 = 
	1'b1 ;
 assign reset_out_active_high 	= vl3mzkm3kw5bw66o8rvnaclvoo7_775 ;
 assign reset_out_active_low 	= bpefa6out9b8f9uo47tlkteo4_30 ;


assign jc9glenh1q00p6fy3h740_39 = (
	((pkorhai62e79neowky5cqgix1l_8 == 1'b1) && (bse8zt2fas6fm1vsqzka6_476 < 5'b10000))?ealviopmancjrszhlwjx8os_708 :
1'b0) ;



always @(posedge clk)
begin
		uq224vb5iso2yzh55hku5hcki_361 <= rst ;
		dl8ywqc6vu1fr9nlwxal2us3hfu_324 <= uq224vb5iso2yzh55hku5hcki_361 ;
	if (s7jjr3vmvznpq35d_410) 
	begin 
	  bse8zt2fas6fm1vsqzka6_476 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (wigiu3diqxi7k8w3ebnceoq_820) 
		begin 
			bse8zt2fas6fm1vsqzka6_476 <= zycr14rcral3yxci432qarx7r_761 ;
		end 
	end 
	if (s7jjr3vmvznpq35d_410) 
	begin 
	  qd0og0uhkvqlh73439ju3ped3yz_842 <= 8'h00 ;
	 end 
	else 
	begin 
		if (iodzcvf8nxdj4ylat51t8t8s_830) 
		begin 
			qd0og0uhkvqlh73439ju3ped3yz_842 <= x9ff5tgkk9bs5f8gzqz0mm4jt_226 ;
		end 
	end 
	if (rst) 
	begin 
	  xczzkrk9cw9rldffwyhthmicyyzhg45n_121 <= 1'b1 ;
	 end 
	else 
	begin 
			xczzkrk9cw9rldffwyhthmicyyzhg45n_121 <= jc9glenh1q00p6fy3h740_39 ;
	end 
	if (rst) 
	begin 
	  sc9abs2x0azyq8cfte6p4_44 <= 1'b0 ;
	 end 
	else 
	begin 
			sc9abs2x0azyq8cfte6p4_44 <= v9ndgy32qnlwzw3ct8cyq0bwgk84v_624 ;
	end 
	if (rst) 
	begin 
	  vl3mzkm3kw5bw66o8rvnaclvoo7_775 <= 1'b1 ;
	 end 
	else 
	begin 
			vl3mzkm3kw5bw66o8rvnaclvoo7_775 <= xczzkrk9cw9rldffwyhthmicyyzhg45n_121 ;
	end 
	if (rst) 
	begin 
	  bpefa6out9b8f9uo47tlkteo4_30 <= 1'b0 ;
	 end 
	else 
	begin 
			bpefa6out9b8f9uo47tlkteo4_30 <= sc9abs2x0azyq8cfte6p4_44 ;
	end 
		init_done <= qkttudas0xcug70wgawk6_432 ;
end

endmodule 
