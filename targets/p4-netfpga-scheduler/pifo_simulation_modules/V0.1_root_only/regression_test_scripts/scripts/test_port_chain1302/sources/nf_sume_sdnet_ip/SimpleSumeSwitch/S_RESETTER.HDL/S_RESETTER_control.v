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
// File created: 2020/10/07 15:07:47
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






 reg	oyve8k3vlveyaxgmeb2rhyv_291;	 initial oyve8k3vlveyaxgmeb2rhyv_291 = 1'b0 ;
 reg	evtdv0z688vmkr38t2336kxj7_265;	 initial evtdv0z688vmkr38t2336kxj7_265 = 1'b0 ;
 reg [4:0] nk4lxmx6bw2us71d9sy_33;	 initial nk4lxmx6bw2us71d9sy_33 = 5'b00000 ;
 reg [6:0] yi0np8evdw6n9xgg1r2fnq1j87_226;	 initial yi0np8evdw6n9xgg1r2fnq1j87_226 = 7'b0000000 ;
 wire	xlpv7e4rscrwdlcaikmbbym3q49kxdm_490 ;
 reg	w6wv8rgm1hhxcgpevgmo_866;	 initial w6wv8rgm1hhxcgpevgmo_866 = 1'b1 ;
 reg	ts249o5hde1msp2ft2sa3v3tlthls_120;	 initial ts249o5hde1msp2ft2sa3v3tlthls_120 = 1'b0 ;
 reg	l1oo6lp0zfrerd2y6uee3ve7b43gyfbs_285;	 initial l1oo6lp0zfrerd2y6uee3ve7b43gyfbs_285 = 1'b1 ;
 reg	v7czsau3t4ackvvvn1m_903;	 initial v7czsau3t4ackvvvn1m_903 = 1'b0 ;
 wire [4:0] b1ucmqjxo6xaak86opp3v_483 ;
 wire [6:0] gztcs49kb30ejr1xqhqy1zp8ln8_829 ;
 wire	y2dcndyf10pizz8goqydsyhdm4bcstg_482 ;
 wire	sv5vtjvn0y2pr1qr227kumeyfchr00h7_724 ;
 wire	d9m3q5g2066pdr6gbvywwxn0zp_60 ;
 wire	l176h691gxxc4q9b3aiojev5gq5h7_749 ;
 wire	e29goksjuslupe5o2poya2_471 ;
 wire	b7wvxj2rbd1g0nxu_892 ;
 wire	xt1umymbwycjf6gz4b75ja_43 ;
 wire	gu0kncebjd4xtxd7xpqr_519 ;
 wire	jn60xe0ug4vyg1zdfcx_592 ;
 wire	uyw0ver4ng3y0dqqsq_720 ;
 wire	m4ay62ltvf0gx83v17rkxvmbgy8_460 ;
 wire	wjxhotzabayhnu75gb11xz15ljvk38_35 ;


 assign b1ucmqjxo6xaak86opp3v_483 = 
	nk4lxmx6bw2us71d9sy_33 + 1 ;
 assign gztcs49kb30ejr1xqhqy1zp8ln8_829 = 
	yi0np8evdw6n9xgg1r2fnq1j87_226 + 1 ;
 assign y2dcndyf10pizz8goqydsyhdm4bcstg_482 = (
	((nk4lxmx6bw2us71d9sy_33 > 5'b00000))?1'b1:
	0)  ;
 assign sv5vtjvn0y2pr1qr227kumeyfchr00h7_724 = 
	rst | evtdv0z688vmkr38t2336kxj7_265 ;
 assign d9m3q5g2066pdr6gbvywwxn0zp_60 = 
	sv5vtjvn0y2pr1qr227kumeyfchr00h7_724 | y2dcndyf10pizz8goqydsyhdm4bcstg_482 ;
 assign l176h691gxxc4q9b3aiojev5gq5h7_749 = (
	((evtdv0z688vmkr38t2336kxj7_265 == 1'b1) && (wjxhotzabayhnu75gb11xz15ljvk38_35 == 1'b1) && (nk4lxmx6bw2us71d9sy_33 == 5'b00000))?1'b1:
	((nk4lxmx6bw2us71d9sy_33 != 5'b00000) && (evtdv0z688vmkr38t2336kxj7_265 != 1'b1))?1'b1:
	0)  ;
 assign e29goksjuslupe5o2poya2_471 = (
	((oyve8k3vlveyaxgmeb2rhyv_291 == 1'b1))?1'b1:
	0)  ;
 assign b7wvxj2rbd1g0nxu_892 = (
	((nk4lxmx6bw2us71d9sy_33 == 5'b01111) && (evtdv0z688vmkr38t2336kxj7_265 != 1'b1) && (wjxhotzabayhnu75gb11xz15ljvk38_35 == 1'b1))?1'b1:
	((yi0np8evdw6n9xgg1r2fnq1j87_226 != 7'b0000000) && (yi0np8evdw6n9xgg1r2fnq1j87_226 != 7'b0111111) && (evtdv0z688vmkr38t2336kxj7_265 != 1'b1) && (wjxhotzabayhnu75gb11xz15ljvk38_35 == 1'b1))?1'b1:
	0)  ;
 assign xt1umymbwycjf6gz4b75ja_43 = (
	((yi0np8evdw6n9xgg1r2fnq1j87_226 == 7'b0111111))?1'b1:
	0)  ;
 assign gu0kncebjd4xtxd7xpqr_519 = 
	1'b1 ;
 assign jn60xe0ug4vyg1zdfcx_592 = 
	1'b0 ;
 assign uyw0ver4ng3y0dqqsq_720 = 
	 ~(xlpv7e4rscrwdlcaikmbbym3q49kxdm_490) ;
 assign m4ay62ltvf0gx83v17rkxvmbgy8_460 = (
	((yi0np8evdw6n9xgg1r2fnq1j87_226 == 7'b0111111))?1'b1:
	0)  ;
 assign wjxhotzabayhnu75gb11xz15ljvk38_35 = 
	1'b1 ;
 assign reset_out_active_high 	= l1oo6lp0zfrerd2y6uee3ve7b43gyfbs_285 ;
 assign reset_out_active_low 	= v7czsau3t4ackvvvn1m_903 ;


assign xlpv7e4rscrwdlcaikmbbym3q49kxdm_490 = (
	((d9m3q5g2066pdr6gbvywwxn0zp_60 == 1'b1) && (nk4lxmx6bw2us71d9sy_33 < 5'b10000))?gu0kncebjd4xtxd7xpqr_519 :
1'b0) ;



always @(posedge clk)
begin
		oyve8k3vlveyaxgmeb2rhyv_291 <= rst ;
		evtdv0z688vmkr38t2336kxj7_265 <= oyve8k3vlveyaxgmeb2rhyv_291 ;
	if (e29goksjuslupe5o2poya2_471) 
	begin 
	  nk4lxmx6bw2us71d9sy_33 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (l176h691gxxc4q9b3aiojev5gq5h7_749) 
		begin 
			nk4lxmx6bw2us71d9sy_33 <= b1ucmqjxo6xaak86opp3v_483 ;
		end 
	end 
	if (e29goksjuslupe5o2poya2_471) 
	begin 
	  yi0np8evdw6n9xgg1r2fnq1j87_226 <= 7'b0000000 ;
	 end 
	else 
	begin 
		if (b7wvxj2rbd1g0nxu_892) 
		begin 
			yi0np8evdw6n9xgg1r2fnq1j87_226 <= gztcs49kb30ejr1xqhqy1zp8ln8_829 ;
		end 
	end 
	if (rst) 
	begin 
	  w6wv8rgm1hhxcgpevgmo_866 <= 1'b1 ;
	 end 
	else 
	begin 
			w6wv8rgm1hhxcgpevgmo_866 <= xlpv7e4rscrwdlcaikmbbym3q49kxdm_490 ;
	end 
	if (rst) 
	begin 
	  ts249o5hde1msp2ft2sa3v3tlthls_120 <= 1'b0 ;
	 end 
	else 
	begin 
			ts249o5hde1msp2ft2sa3v3tlthls_120 <= uyw0ver4ng3y0dqqsq_720 ;
	end 
	if (rst) 
	begin 
	  l1oo6lp0zfrerd2y6uee3ve7b43gyfbs_285 <= 1'b1 ;
	 end 
	else 
	begin 
			l1oo6lp0zfrerd2y6uee3ve7b43gyfbs_285 <= w6wv8rgm1hhxcgpevgmo_866 ;
	end 
	if (rst) 
	begin 
	  v7czsau3t4ackvvvn1m_903 <= 1'b0 ;
	 end 
	else 
	begin 
			v7czsau3t4ackvvvn1m_903 <= ts249o5hde1msp2ft2sa3v3tlthls_120 ;
	end 
		init_done <= m4ay62ltvf0gx83v17rkxvmbgy8_460 ;
end

endmodule 
