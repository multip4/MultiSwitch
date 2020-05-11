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
// File created: 2020/04/16 20:38:09
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






 reg	ycfohyxvkopzfog4e2cisqnmbg7_875;	 initial ycfohyxvkopzfog4e2cisqnmbg7_875 = 1'b0 ;
 reg	q5q3eutmoiwcq8jwalqyr9f6u9hada_486;	 initial q5q3eutmoiwcq8jwalqyr9f6u9hada_486 = 1'b0 ;
 reg [4:0] v5eymxr0kovlqwk89mn7fh5v80npg_206;	 initial v5eymxr0kovlqwk89mn7fh5v80npg_206 = 5'b00000 ;
 reg [6:0] irl0qtdw2ic78t9cky39yq_18;	 initial irl0qtdw2ic78t9cky39yq_18 = 7'b0000000 ;
 wire	l251lmz4doui09q9_820 ;
 reg	wquc8wbrcvv8bqkzb_19;	 initial wquc8wbrcvv8bqkzb_19 = 1'b1 ;
 reg	iq2wz5s3jjaojz6avli0823voj95c7_691;	 initial iq2wz5s3jjaojz6avli0823voj95c7_691 = 1'b0 ;
 reg	ek2bb4dmvfkdegleigc_145;	 initial ek2bb4dmvfkdegleigc_145 = 1'b1 ;
 reg	jqh5pvfxn395dni0l8y_93;	 initial jqh5pvfxn395dni0l8y_93 = 1'b0 ;
 wire [4:0] z4gc2o1n3uy8w7reu_148 ;
 wire [6:0] ldyk05a5z9qcrs9xy1ltp2m6nibu7f1_843 ;
 wire	esz9dnimg545ci39faiw8lv0djy_518 ;
 wire	x884g515hmuuz9e085ch_469 ;
 wire	f8z05c3a57932u9iqrabu_642 ;
 wire	p2u25un1bv18e179tmetugxste1pj0_699 ;
 wire	i9nygzjwkxlkxlkcsnuvysqsbe_197 ;
 wire	tvbhd088v2xon6ftgf_283 ;
 wire	qrcy8c3hneunbtvslvts5401yab3i_691 ;
 wire	w703s82k0n49249en_828 ;
 wire	av9gotrwjgvh9gcy68_856 ;
 wire	shvwsxv21xnjztbcie_73 ;
 wire	gnpdissnkv0co1zy004n3fro2k66_531 ;
 wire	snq4whm9g82pzafnaflyrsvgvi0yy_164 ;


 assign z4gc2o1n3uy8w7reu_148 = 
	v5eymxr0kovlqwk89mn7fh5v80npg_206 + 1 ;
 assign ldyk05a5z9qcrs9xy1ltp2m6nibu7f1_843 = 
	irl0qtdw2ic78t9cky39yq_18 + 1 ;
 assign esz9dnimg545ci39faiw8lv0djy_518 = (
	((v5eymxr0kovlqwk89mn7fh5v80npg_206 > 5'b00000))?1'b1:
	0)  ;
 assign x884g515hmuuz9e085ch_469 = 
	rst | q5q3eutmoiwcq8jwalqyr9f6u9hada_486 ;
 assign f8z05c3a57932u9iqrabu_642 = 
	x884g515hmuuz9e085ch_469 | esz9dnimg545ci39faiw8lv0djy_518 ;
 assign p2u25un1bv18e179tmetugxste1pj0_699 = (
	((q5q3eutmoiwcq8jwalqyr9f6u9hada_486 == 1'b1) && (snq4whm9g82pzafnaflyrsvgvi0yy_164 == 1'b1) && (v5eymxr0kovlqwk89mn7fh5v80npg_206 == 5'b00000))?1'b1:
	((v5eymxr0kovlqwk89mn7fh5v80npg_206 != 5'b00000) && (q5q3eutmoiwcq8jwalqyr9f6u9hada_486 != 1'b1))?1'b1:
	0)  ;
 assign i9nygzjwkxlkxlkcsnuvysqsbe_197 = (
	((ycfohyxvkopzfog4e2cisqnmbg7_875 == 1'b1))?1'b1:
	0)  ;
 assign tvbhd088v2xon6ftgf_283 = (
	((v5eymxr0kovlqwk89mn7fh5v80npg_206 == 5'b01111) && (q5q3eutmoiwcq8jwalqyr9f6u9hada_486 != 1'b1) && (snq4whm9g82pzafnaflyrsvgvi0yy_164 == 1'b1))?1'b1:
	((irl0qtdw2ic78t9cky39yq_18 != 7'b0000000) && (irl0qtdw2ic78t9cky39yq_18 != 7'b0111111) && (q5q3eutmoiwcq8jwalqyr9f6u9hada_486 != 1'b1) && (snq4whm9g82pzafnaflyrsvgvi0yy_164 == 1'b1))?1'b1:
	0)  ;
 assign qrcy8c3hneunbtvslvts5401yab3i_691 = (
	((irl0qtdw2ic78t9cky39yq_18 == 7'b0111111))?1'b1:
	0)  ;
 assign w703s82k0n49249en_828 = 
	1'b1 ;
 assign av9gotrwjgvh9gcy68_856 = 
	1'b0 ;
 assign shvwsxv21xnjztbcie_73 = 
	 ~(l251lmz4doui09q9_820) ;
 assign gnpdissnkv0co1zy004n3fro2k66_531 = (
	((irl0qtdw2ic78t9cky39yq_18 == 7'b0111111))?1'b1:
	0)  ;
 assign snq4whm9g82pzafnaflyrsvgvi0yy_164 = 
	1'b1 ;
 assign reset_out_active_high 	= ek2bb4dmvfkdegleigc_145 ;
 assign reset_out_active_low 	= jqh5pvfxn395dni0l8y_93 ;


assign l251lmz4doui09q9_820 = (
	((f8z05c3a57932u9iqrabu_642 == 1'b1) && (v5eymxr0kovlqwk89mn7fh5v80npg_206 < 5'b10000))?w703s82k0n49249en_828 :
1'b0) ;



always @(posedge clk)
begin
		ycfohyxvkopzfog4e2cisqnmbg7_875 <= rst ;
		q5q3eutmoiwcq8jwalqyr9f6u9hada_486 <= ycfohyxvkopzfog4e2cisqnmbg7_875 ;
	if (i9nygzjwkxlkxlkcsnuvysqsbe_197) 
	begin 
	  v5eymxr0kovlqwk89mn7fh5v80npg_206 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (p2u25un1bv18e179tmetugxste1pj0_699) 
		begin 
			v5eymxr0kovlqwk89mn7fh5v80npg_206 <= z4gc2o1n3uy8w7reu_148 ;
		end 
	end 
	if (i9nygzjwkxlkxlkcsnuvysqsbe_197) 
	begin 
	  irl0qtdw2ic78t9cky39yq_18 <= 7'b0000000 ;
	 end 
	else 
	begin 
		if (tvbhd088v2xon6ftgf_283) 
		begin 
			irl0qtdw2ic78t9cky39yq_18 <= ldyk05a5z9qcrs9xy1ltp2m6nibu7f1_843 ;
		end 
	end 
	if (rst) 
	begin 
	  wquc8wbrcvv8bqkzb_19 <= 1'b1 ;
	 end 
	else 
	begin 
			wquc8wbrcvv8bqkzb_19 <= l251lmz4doui09q9_820 ;
	end 
	if (rst) 
	begin 
	  iq2wz5s3jjaojz6avli0823voj95c7_691 <= 1'b0 ;
	 end 
	else 
	begin 
			iq2wz5s3jjaojz6avli0823voj95c7_691 <= shvwsxv21xnjztbcie_73 ;
	end 
	if (rst) 
	begin 
	  ek2bb4dmvfkdegleigc_145 <= 1'b1 ;
	 end 
	else 
	begin 
			ek2bb4dmvfkdegleigc_145 <= wquc8wbrcvv8bqkzb_19 ;
	end 
	if (rst) 
	begin 
	  jqh5pvfxn395dni0l8y_93 <= 1'b0 ;
	 end 
	else 
	begin 
			jqh5pvfxn395dni0l8y_93 <= iq2wz5s3jjaojz6avli0823voj95c7_691 ;
	end 
		init_done <= gnpdissnkv0co1zy004n3fro2k66_531 ;
end

endmodule 
