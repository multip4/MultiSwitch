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
// File created: 2020/10/03 20:31:34
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






 reg	flqie224my36dmd5s43_296;	 initial flqie224my36dmd5s43_296 = 1'b0 ;
 reg	zmnuxi057exagtpxi09wkowqlqqgq_238;	 initial zmnuxi057exagtpxi09wkowqlqqgq_238 = 1'b0 ;
 reg [4:0] i7vq4jhd6h9crpt7k83j70mv232ly4_467;	 initial i7vq4jhd6h9crpt7k83j70mv232ly4_467 = 5'b00000 ;
 reg [6:0] sihi8ccfam7hxfrakr6o5y1eq3p6z_674;	 initial sihi8ccfam7hxfrakr6o5y1eq3p6z_674 = 7'b0000000 ;
 wire	rgb7egi02kafs0460lludjmvh_444 ;
 reg	agw1dwpnf5p4zfn0bx7_403;	 initial agw1dwpnf5p4zfn0bx7_403 = 1'b1 ;
 reg	du4jshdgbax5v03awwez6v23_488;	 initial du4jshdgbax5v03awwez6v23_488 = 1'b0 ;
 reg	jp0hvlz1znshtdvvi8ryw295esinx_167;	 initial jp0hvlz1znshtdvvi8ryw295esinx_167 = 1'b1 ;
 reg	e2hg26lo9xmdy33mg9jj_630;	 initial e2hg26lo9xmdy33mg9jj_630 = 1'b0 ;
 wire [4:0] jtgu3kyihf75a3txnvl_510 ;
 wire [6:0] c8svmgjed32efyp37lh5fo6j_862 ;
 wire	viw6w9x9oesunahvs_11 ;
 wire	atpt3lswmqltcnas4_669 ;
 wire	kzhk13c80gz33oeovdf5ltsydc9p_120 ;
 wire	yuywnfwxa4sl7hwtomvc_257 ;
 wire	xni954i1imcpex9o6k23or4yp7oh_160 ;
 wire	nee4xvy7qj5ozmfg77g4rp4n57uja_305 ;
 wire	bg804dsih7xdc7yfxrkf9ohtkl6iec_755 ;
 wire	bhozglgqddhzk7loeh6jk_880 ;
 wire	hmhovlf9vlhg591s_276 ;
 wire	pgq1x04v4yco46hciznhg7d16_535 ;
 wire	f7p0stfzmnd5bzufvb8_321 ;
 wire	lmbjauc3e4xp8val6grxtcmsn_707 ;


 assign jtgu3kyihf75a3txnvl_510 = 
	i7vq4jhd6h9crpt7k83j70mv232ly4_467 + 1 ;
 assign c8svmgjed32efyp37lh5fo6j_862 = 
	sihi8ccfam7hxfrakr6o5y1eq3p6z_674 + 1 ;
 assign viw6w9x9oesunahvs_11 = (
	((i7vq4jhd6h9crpt7k83j70mv232ly4_467 > 5'b00000))?1'b1:
	0)  ;
 assign atpt3lswmqltcnas4_669 = 
	rst | zmnuxi057exagtpxi09wkowqlqqgq_238 ;
 assign kzhk13c80gz33oeovdf5ltsydc9p_120 = 
	atpt3lswmqltcnas4_669 | viw6w9x9oesunahvs_11 ;
 assign yuywnfwxa4sl7hwtomvc_257 = (
	((zmnuxi057exagtpxi09wkowqlqqgq_238 == 1'b1) && (lmbjauc3e4xp8val6grxtcmsn_707 == 1'b1) && (i7vq4jhd6h9crpt7k83j70mv232ly4_467 == 5'b00000))?1'b1:
	((i7vq4jhd6h9crpt7k83j70mv232ly4_467 != 5'b00000) && (zmnuxi057exagtpxi09wkowqlqqgq_238 != 1'b1))?1'b1:
	0)  ;
 assign xni954i1imcpex9o6k23or4yp7oh_160 = (
	((flqie224my36dmd5s43_296 == 1'b1))?1'b1:
	0)  ;
 assign nee4xvy7qj5ozmfg77g4rp4n57uja_305 = (
	((i7vq4jhd6h9crpt7k83j70mv232ly4_467 == 5'b01111) && (zmnuxi057exagtpxi09wkowqlqqgq_238 != 1'b1) && (lmbjauc3e4xp8val6grxtcmsn_707 == 1'b1))?1'b1:
	((sihi8ccfam7hxfrakr6o5y1eq3p6z_674 != 7'b0000000) && (sihi8ccfam7hxfrakr6o5y1eq3p6z_674 != 7'b0111111) && (zmnuxi057exagtpxi09wkowqlqqgq_238 != 1'b1) && (lmbjauc3e4xp8val6grxtcmsn_707 == 1'b1))?1'b1:
	0)  ;
 assign bg804dsih7xdc7yfxrkf9ohtkl6iec_755 = (
	((sihi8ccfam7hxfrakr6o5y1eq3p6z_674 == 7'b0111111))?1'b1:
	0)  ;
 assign bhozglgqddhzk7loeh6jk_880 = 
	1'b1 ;
 assign hmhovlf9vlhg591s_276 = 
	1'b0 ;
 assign pgq1x04v4yco46hciznhg7d16_535 = 
	 ~(rgb7egi02kafs0460lludjmvh_444) ;
 assign f7p0stfzmnd5bzufvb8_321 = (
	((sihi8ccfam7hxfrakr6o5y1eq3p6z_674 == 7'b0111111))?1'b1:
	0)  ;
 assign lmbjauc3e4xp8val6grxtcmsn_707 = 
	1'b1 ;
 assign reset_out_active_high 	= jp0hvlz1znshtdvvi8ryw295esinx_167 ;
 assign reset_out_active_low 	= e2hg26lo9xmdy33mg9jj_630 ;


assign rgb7egi02kafs0460lludjmvh_444 = (
	((kzhk13c80gz33oeovdf5ltsydc9p_120 == 1'b1) && (i7vq4jhd6h9crpt7k83j70mv232ly4_467 < 5'b10000))?bhozglgqddhzk7loeh6jk_880 :
1'b0) ;



always @(posedge clk)
begin
		flqie224my36dmd5s43_296 <= rst ;
		zmnuxi057exagtpxi09wkowqlqqgq_238 <= flqie224my36dmd5s43_296 ;
	if (xni954i1imcpex9o6k23or4yp7oh_160) 
	begin 
	  i7vq4jhd6h9crpt7k83j70mv232ly4_467 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (yuywnfwxa4sl7hwtomvc_257) 
		begin 
			i7vq4jhd6h9crpt7k83j70mv232ly4_467 <= jtgu3kyihf75a3txnvl_510 ;
		end 
	end 
	if (xni954i1imcpex9o6k23or4yp7oh_160) 
	begin 
	  sihi8ccfam7hxfrakr6o5y1eq3p6z_674 <= 7'b0000000 ;
	 end 
	else 
	begin 
		if (nee4xvy7qj5ozmfg77g4rp4n57uja_305) 
		begin 
			sihi8ccfam7hxfrakr6o5y1eq3p6z_674 <= c8svmgjed32efyp37lh5fo6j_862 ;
		end 
	end 
	if (rst) 
	begin 
	  agw1dwpnf5p4zfn0bx7_403 <= 1'b1 ;
	 end 
	else 
	begin 
			agw1dwpnf5p4zfn0bx7_403 <= rgb7egi02kafs0460lludjmvh_444 ;
	end 
	if (rst) 
	begin 
	  du4jshdgbax5v03awwez6v23_488 <= 1'b0 ;
	 end 
	else 
	begin 
			du4jshdgbax5v03awwez6v23_488 <= pgq1x04v4yco46hciznhg7d16_535 ;
	end 
	if (rst) 
	begin 
	  jp0hvlz1znshtdvvi8ryw295esinx_167 <= 1'b1 ;
	 end 
	else 
	begin 
			jp0hvlz1znshtdvvi8ryw295esinx_167 <= agw1dwpnf5p4zfn0bx7_403 ;
	end 
	if (rst) 
	begin 
	  e2hg26lo9xmdy33mg9jj_630 <= 1'b0 ;
	 end 
	else 
	begin 
			e2hg26lo9xmdy33mg9jj_630 <= du4jshdgbax5v03awwez6v23_488 ;
	end 
		init_done <= f7p0stfzmnd5bzufvb8_321 ;
end

endmodule 
