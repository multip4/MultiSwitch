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
// File created: 2020/04/16 20:38:09
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






 reg	vtteqeryghfszxo8ytfk20wtb_244;	 initial vtteqeryghfszxo8ytfk20wtb_244 = 1'b0 ;
 reg	ylo9ofyc4e1ajjaq6uo6x52u_563;	 initial ylo9ofyc4e1ajjaq6uo6x52u_563 = 1'b0 ;
 reg [4:0] x9pid45wispr282spakxw6dz40n5722_343;	 initial x9pid45wispr282spakxw6dz40n5722_343 = 5'b00000 ;
 reg [7:0] n3n4yjj20r9ed8bhn64uwpt8_742;	 initial n3n4yjj20r9ed8bhn64uwpt8_742 = 8'h00 ;
 wire	nor8fgp5bjz1yfuoj9zeu8418kx58p_783 ;
 reg	ubvhdtin5y9zt7t5u5w39_383;	 initial ubvhdtin5y9zt7t5u5w39_383 = 1'b1 ;
 reg	w7wgdzg1opodzh9pujzcvft3cre_56;	 initial w7wgdzg1opodzh9pujzcvft3cre_56 = 1'b0 ;
 reg	lqnuhof97bz2moz6b81l_436;	 initial lqnuhof97bz2moz6b81l_436 = 1'b1 ;
 reg	hhw0zfusybgw6rzlu399qe_701;	 initial hhw0zfusybgw6rzlu399qe_701 = 1'b0 ;
 wire [4:0] vxsvbz9xgmtjelkcc0z78h6_735 ;
 wire [7:0] sxtazq2nlranmorl8kzlub47_859 ;
 wire	bnyzl8264v8gzerc2pnr4fulvj_527 ;
 wire	jtbzf1phot8h5e46742_380 ;
 wire	v0vnug871miqlm5a38sx1gbvjqw5vb0_289 ;
 wire	ylw4bxcr6m1uozkrd45prfuw1hr_314 ;
 wire	iazxo2wx836ytczff4tsghte4jo4_611 ;
 wire	b0y438uufusptg226ui97g0aj78ti_866 ;
 wire	p7cvzhbt66z9yfe1zz2_361 ;
 wire	aejuuj3vmyfitk0eo3a4z2gnf05ymmz_132 ;
 wire	pv1zxbqutln04smltx2v9bmiyl9ixx_573 ;
 wire	racur4vc5pg5gti66tnrjt4gyxt_906 ;
 wire	vm5r60zux8b0g9ij_632 ;
 wire	xkfnj059ehnb4vqb_29 ;


 assign vxsvbz9xgmtjelkcc0z78h6_735 = 
	x9pid45wispr282spakxw6dz40n5722_343 + 1 ;
 assign sxtazq2nlranmorl8kzlub47_859 = 
	n3n4yjj20r9ed8bhn64uwpt8_742 + 1 ;
 assign bnyzl8264v8gzerc2pnr4fulvj_527 = (
	((x9pid45wispr282spakxw6dz40n5722_343 > 5'b00000))?1'b1:
	0)  ;
 assign jtbzf1phot8h5e46742_380 = 
	rst | ylo9ofyc4e1ajjaq6uo6x52u_563 ;
 assign v0vnug871miqlm5a38sx1gbvjqw5vb0_289 = 
	jtbzf1phot8h5e46742_380 | bnyzl8264v8gzerc2pnr4fulvj_527 ;
 assign ylw4bxcr6m1uozkrd45prfuw1hr_314 = (
	((ylo9ofyc4e1ajjaq6uo6x52u_563 == 1'b1) && (xkfnj059ehnb4vqb_29 == 1'b1) && (x9pid45wispr282spakxw6dz40n5722_343 == 5'b00000))?1'b1:
	((x9pid45wispr282spakxw6dz40n5722_343 != 5'b00000) && (ylo9ofyc4e1ajjaq6uo6x52u_563 != 1'b1))?1'b1:
	0)  ;
 assign iazxo2wx836ytczff4tsghte4jo4_611 = (
	((vtteqeryghfszxo8ytfk20wtb_244 == 1'b1))?1'b1:
	0)  ;
 assign b0y438uufusptg226ui97g0aj78ti_866 = (
	((x9pid45wispr282spakxw6dz40n5722_343 == 5'b01111) && (ylo9ofyc4e1ajjaq6uo6x52u_563 != 1'b1) && (xkfnj059ehnb4vqb_29 == 1'b1))?1'b1:
	((n3n4yjj20r9ed8bhn64uwpt8_742 != 8'h00) && (n3n4yjj20r9ed8bhn64uwpt8_742 != 8'h86) && (ylo9ofyc4e1ajjaq6uo6x52u_563 != 1'b1) && (xkfnj059ehnb4vqb_29 == 1'b1))?1'b1:
	0)  ;
 assign p7cvzhbt66z9yfe1zz2_361 = (
	((n3n4yjj20r9ed8bhn64uwpt8_742 == 8'h86))?1'b1:
	0)  ;
 assign aejuuj3vmyfitk0eo3a4z2gnf05ymmz_132 = 
	1'b1 ;
 assign pv1zxbqutln04smltx2v9bmiyl9ixx_573 = 
	1'b0 ;
 assign racur4vc5pg5gti66tnrjt4gyxt_906 = 
	 ~(nor8fgp5bjz1yfuoj9zeu8418kx58p_783) ;
 assign vm5r60zux8b0g9ij_632 = (
	((n3n4yjj20r9ed8bhn64uwpt8_742 == 8'h86))?1'b1:
	0)  ;
 assign xkfnj059ehnb4vqb_29 = 
	1'b1 ;
 assign reset_out_active_high 	= lqnuhof97bz2moz6b81l_436 ;
 assign reset_out_active_low 	= hhw0zfusybgw6rzlu399qe_701 ;


assign nor8fgp5bjz1yfuoj9zeu8418kx58p_783 = (
	((v0vnug871miqlm5a38sx1gbvjqw5vb0_289 == 1'b1) && (x9pid45wispr282spakxw6dz40n5722_343 < 5'b10000))?aejuuj3vmyfitk0eo3a4z2gnf05ymmz_132 :
1'b0) ;



always @(posedge clk)
begin
		vtteqeryghfszxo8ytfk20wtb_244 <= rst ;
		ylo9ofyc4e1ajjaq6uo6x52u_563 <= vtteqeryghfszxo8ytfk20wtb_244 ;
	if (iazxo2wx836ytczff4tsghte4jo4_611) 
	begin 
	  x9pid45wispr282spakxw6dz40n5722_343 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (ylw4bxcr6m1uozkrd45prfuw1hr_314) 
		begin 
			x9pid45wispr282spakxw6dz40n5722_343 <= vxsvbz9xgmtjelkcc0z78h6_735 ;
		end 
	end 
	if (iazxo2wx836ytczff4tsghte4jo4_611) 
	begin 
	  n3n4yjj20r9ed8bhn64uwpt8_742 <= 8'h00 ;
	 end 
	else 
	begin 
		if (b0y438uufusptg226ui97g0aj78ti_866) 
		begin 
			n3n4yjj20r9ed8bhn64uwpt8_742 <= sxtazq2nlranmorl8kzlub47_859 ;
		end 
	end 
	if (rst) 
	begin 
	  ubvhdtin5y9zt7t5u5w39_383 <= 1'b1 ;
	 end 
	else 
	begin 
			ubvhdtin5y9zt7t5u5w39_383 <= nor8fgp5bjz1yfuoj9zeu8418kx58p_783 ;
	end 
	if (rst) 
	begin 
	  w7wgdzg1opodzh9pujzcvft3cre_56 <= 1'b0 ;
	 end 
	else 
	begin 
			w7wgdzg1opodzh9pujzcvft3cre_56 <= racur4vc5pg5gti66tnrjt4gyxt_906 ;
	end 
	if (rst) 
	begin 
	  lqnuhof97bz2moz6b81l_436 <= 1'b1 ;
	 end 
	else 
	begin 
			lqnuhof97bz2moz6b81l_436 <= ubvhdtin5y9zt7t5u5w39_383 ;
	end 
	if (rst) 
	begin 
	  hhw0zfusybgw6rzlu399qe_701 <= 1'b0 ;
	 end 
	else 
	begin 
			hhw0zfusybgw6rzlu399qe_701 <= w7wgdzg1opodzh9pujzcvft3cre_56 ;
	end 
		init_done <= vm5r60zux8b0g9ij_632 ;
end

endmodule 
