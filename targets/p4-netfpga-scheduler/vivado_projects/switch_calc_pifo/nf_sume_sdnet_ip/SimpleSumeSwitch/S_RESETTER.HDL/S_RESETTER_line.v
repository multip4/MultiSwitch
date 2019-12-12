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
// File created: 2019/12/09 21:12:17
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






 reg	u6jexn4eb5532yh5wjxzeu8mso4evqj_15;	 initial u6jexn4eb5532yh5wjxzeu8mso4evqj_15 = 1'b0 ;
 reg	nbz3h0o5cyzsu5op8z39dnz_830;	 initial nbz3h0o5cyzsu5op8z39dnz_830 = 1'b0 ;
 reg [4:0] cs4zs7c8cdau3a0zp0f20ski2ui_441;	 initial cs4zs7c8cdau3a0zp0f20ski2ui_441 = 5'b00000 ;
 reg [6:0] uapdn1nmhfxdfscppm04hcrv222h4xo_650;	 initial uapdn1nmhfxdfscppm04hcrv222h4xo_650 = 7'b0000000 ;
 wire	dhpz9aw00m1l4rr30ztfvbyuzmv29_439 ;
 reg	cdlh6ghdl21vd30h2mf3o6l_249;	 initial cdlh6ghdl21vd30h2mf3o6l_249 = 1'b1 ;
 reg	y5lvx2rgq7z02hxdsxcl0sn6_472;	 initial y5lvx2rgq7z02hxdsxcl0sn6_472 = 1'b0 ;
 reg	oi3c66ixvvaozq1z4814oszner1grnl_159;	 initial oi3c66ixvvaozq1z4814oszner1grnl_159 = 1'b1 ;
 reg	iul2qjxyn7h0l22sik1xxvj5f6jvjtpg_117;	 initial iul2qjxyn7h0l22sik1xxvj5f6jvjtpg_117 = 1'b0 ;
 wire [4:0] u9t3tg0m9m1g209n1pm_899 ;
 wire [6:0] lpyibwsjx7t7rknw79y9uzv_324 ;
 wire	plyffm7q3rsxo1ybj5t90m_362 ;
 wire	q9dc3nol1ck126ubornq_439 ;
 wire	i0rzjiinj9qa05l3cel_704 ;
 wire	hhwr0yf2eg9gms8sxtivd9ik3xu_361 ;
 wire	jk9634t93ugxxn61_800 ;
 wire	w8fnzmudqlgtanhx7_820 ;
 wire	yesgfhofju2dsmw4wu59tfuix_499 ;
 wire	yp8qdfzwn84omg1h65_127 ;
 wire	y17pyphrcfpcp8iwn8x5cj7qb_761 ;
 wire	r9ukldr0w8hnviskx_768 ;
 wire	drcxjynhr4ir8rpds11ysvxd4t1vk_642 ;
 wire	otsqeekj17x31nkx_184 ;


 assign u9t3tg0m9m1g209n1pm_899 = 
	cs4zs7c8cdau3a0zp0f20ski2ui_441 + 1 ;
 assign lpyibwsjx7t7rknw79y9uzv_324 = 
	uapdn1nmhfxdfscppm04hcrv222h4xo_650 + 1 ;
 assign plyffm7q3rsxo1ybj5t90m_362 = (
	((cs4zs7c8cdau3a0zp0f20ski2ui_441 > 5'b00000))?1'b1:
	0)  ;
 assign q9dc3nol1ck126ubornq_439 = 
	rst | nbz3h0o5cyzsu5op8z39dnz_830 ;
 assign i0rzjiinj9qa05l3cel_704 = 
	q9dc3nol1ck126ubornq_439 | plyffm7q3rsxo1ybj5t90m_362 ;
 assign hhwr0yf2eg9gms8sxtivd9ik3xu_361 = (
	((nbz3h0o5cyzsu5op8z39dnz_830 == 1'b1) && (otsqeekj17x31nkx_184 == 1'b1) && (cs4zs7c8cdau3a0zp0f20ski2ui_441 == 5'b00000))?1'b1:
	((cs4zs7c8cdau3a0zp0f20ski2ui_441 != 5'b00000) && (nbz3h0o5cyzsu5op8z39dnz_830 != 1'b1))?1'b1:
	0)  ;
 assign jk9634t93ugxxn61_800 = (
	((u6jexn4eb5532yh5wjxzeu8mso4evqj_15 == 1'b1))?1'b1:
	0)  ;
 assign w8fnzmudqlgtanhx7_820 = (
	((cs4zs7c8cdau3a0zp0f20ski2ui_441 == 5'b01111) && (nbz3h0o5cyzsu5op8z39dnz_830 != 1'b1) && (otsqeekj17x31nkx_184 == 1'b1))?1'b1:
	((uapdn1nmhfxdfscppm04hcrv222h4xo_650 != 7'b0000000) && (uapdn1nmhfxdfscppm04hcrv222h4xo_650 != 7'b0111111) && (nbz3h0o5cyzsu5op8z39dnz_830 != 1'b1) && (otsqeekj17x31nkx_184 == 1'b1))?1'b1:
	0)  ;
 assign yesgfhofju2dsmw4wu59tfuix_499 = (
	((uapdn1nmhfxdfscppm04hcrv222h4xo_650 == 7'b0111111))?1'b1:
	0)  ;
 assign yp8qdfzwn84omg1h65_127 = 
	1'b1 ;
 assign y17pyphrcfpcp8iwn8x5cj7qb_761 = 
	1'b0 ;
 assign r9ukldr0w8hnviskx_768 = 
	 ~(dhpz9aw00m1l4rr30ztfvbyuzmv29_439) ;
 assign drcxjynhr4ir8rpds11ysvxd4t1vk_642 = (
	((uapdn1nmhfxdfscppm04hcrv222h4xo_650 == 7'b0111111))?1'b1:
	0)  ;
 assign otsqeekj17x31nkx_184 = 
	1'b1 ;
 assign reset_out_active_high 	= oi3c66ixvvaozq1z4814oszner1grnl_159 ;
 assign reset_out_active_low 	= iul2qjxyn7h0l22sik1xxvj5f6jvjtpg_117 ;


assign dhpz9aw00m1l4rr30ztfvbyuzmv29_439 = (
	((i0rzjiinj9qa05l3cel_704 == 1'b1) && (cs4zs7c8cdau3a0zp0f20ski2ui_441 < 5'b10000))?yp8qdfzwn84omg1h65_127 :
1'b0) ;



always @(posedge clk)
begin
		u6jexn4eb5532yh5wjxzeu8mso4evqj_15 <= rst ;
		nbz3h0o5cyzsu5op8z39dnz_830 <= u6jexn4eb5532yh5wjxzeu8mso4evqj_15 ;
	if (jk9634t93ugxxn61_800) 
	begin 
	  cs4zs7c8cdau3a0zp0f20ski2ui_441 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (hhwr0yf2eg9gms8sxtivd9ik3xu_361) 
		begin 
			cs4zs7c8cdau3a0zp0f20ski2ui_441 <= u9t3tg0m9m1g209n1pm_899 ;
		end 
	end 
	if (jk9634t93ugxxn61_800) 
	begin 
	  uapdn1nmhfxdfscppm04hcrv222h4xo_650 <= 7'b0000000 ;
	 end 
	else 
	begin 
		if (w8fnzmudqlgtanhx7_820) 
		begin 
			uapdn1nmhfxdfscppm04hcrv222h4xo_650 <= lpyibwsjx7t7rknw79y9uzv_324 ;
		end 
	end 
	if (rst) 
	begin 
	  cdlh6ghdl21vd30h2mf3o6l_249 <= 1'b1 ;
	 end 
	else 
	begin 
			cdlh6ghdl21vd30h2mf3o6l_249 <= dhpz9aw00m1l4rr30ztfvbyuzmv29_439 ;
	end 
	if (rst) 
	begin 
	  y5lvx2rgq7z02hxdsxcl0sn6_472 <= 1'b0 ;
	 end 
	else 
	begin 
			y5lvx2rgq7z02hxdsxcl0sn6_472 <= r9ukldr0w8hnviskx_768 ;
	end 
	if (rst) 
	begin 
	  oi3c66ixvvaozq1z4814oszner1grnl_159 <= 1'b1 ;
	 end 
	else 
	begin 
			oi3c66ixvvaozq1z4814oszner1grnl_159 <= cdlh6ghdl21vd30h2mf3o6l_249 ;
	end 
	if (rst) 
	begin 
	  iul2qjxyn7h0l22sik1xxvj5f6jvjtpg_117 <= 1'b0 ;
	 end 
	else 
	begin 
			iul2qjxyn7h0l22sik1xxvj5f6jvjtpg_117 <= y5lvx2rgq7z02hxdsxcl0sn6_472 ;
	end 
		init_done <= drcxjynhr4ir8rpds11ysvxd4t1vk_642 ;
end

endmodule 
