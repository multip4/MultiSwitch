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
// File created: 2019/11/21 22:45:49
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






 reg	w20p03ghv2xprgpb_157;	 initial w20p03ghv2xprgpb_157 = 1'b0 ;
 reg	x3y3fgbyebfnxddba0nnypsrzcph_454;	 initial x3y3fgbyebfnxddba0nnypsrzcph_454 = 1'b0 ;
 reg [4:0] ltatjuf8m2f87ald_529;	 initial ltatjuf8m2f87ald_529 = 5'b00000 ;
 reg [7:0] wh6v9l75t85vpgaayfr3ahopfd_175;	 initial wh6v9l75t85vpgaayfr3ahopfd_175 = 8'h00 ;
 wire	dv0ikokoc9srnk9z6va_549 ;
 reg	hdd1v6qbkstwzg8t0uxisw50_332;	 initial hdd1v6qbkstwzg8t0uxisw50_332 = 1'b1 ;
 reg	z7ye1uqbi3piv7z9t5c8lo3cp92uy5_240;	 initial z7ye1uqbi3piv7z9t5c8lo3cp92uy5_240 = 1'b0 ;
 reg	cptyexy7f42adpy3ra6tg9_309;	 initial cptyexy7f42adpy3ra6tg9_309 = 1'b1 ;
 reg	nuhm0iahkdqklxeyc5pdj26rp7n_316;	 initial nuhm0iahkdqklxeyc5pdj26rp7n_316 = 1'b0 ;
 wire [4:0] ooky5sasloe9qmnbuaaalkz_463 ;
 wire [7:0] nyp9ev9r96eomw1lbik_853 ;
 wire	cwsds374a3ybe4pd0jdnl_853 ;
 wire	a979qk7d5njem8xv23t95mtvr3vxwdiu_852 ;
 wire	gtzhfyniq9hepdqldyq_383 ;
 wire	zl5vmy01kpmw1ds8g0rxkzy_310 ;
 wire	fundaefng1p5tpxnjxvq693a_866 ;
 wire	lk1195kahrwcw7qwh_470 ;
 wire	k93c35vnysbw3okx_89 ;
 wire	rpwoo661rys1yiu4oe11_903 ;
 wire	i2wnqrqsma8h2m1jc3_435 ;
 wire	iqlivbom3roeutauustl9az7emj0_903 ;
 wire	nuskbx8qmbilicfk_616 ;
 wire	nakidz2fet2wf5cw7hvegazh2kd4xr9_824 ;


 assign ooky5sasloe9qmnbuaaalkz_463 = 
	ltatjuf8m2f87ald_529 + 1 ;
 assign nyp9ev9r96eomw1lbik_853 = 
	wh6v9l75t85vpgaayfr3ahopfd_175 + 1 ;
 assign cwsds374a3ybe4pd0jdnl_853 = (
	((ltatjuf8m2f87ald_529 > 5'b00000))?1'b1:
	0)  ;
 assign a979qk7d5njem8xv23t95mtvr3vxwdiu_852 = 
	rst | x3y3fgbyebfnxddba0nnypsrzcph_454 ;
 assign gtzhfyniq9hepdqldyq_383 = 
	a979qk7d5njem8xv23t95mtvr3vxwdiu_852 | cwsds374a3ybe4pd0jdnl_853 ;
 assign zl5vmy01kpmw1ds8g0rxkzy_310 = (
	((x3y3fgbyebfnxddba0nnypsrzcph_454 == 1'b1) && (nakidz2fet2wf5cw7hvegazh2kd4xr9_824 == 1'b1) && (ltatjuf8m2f87ald_529 == 5'b00000))?1'b1:
	((ltatjuf8m2f87ald_529 != 5'b00000) && (x3y3fgbyebfnxddba0nnypsrzcph_454 != 1'b1))?1'b1:
	0)  ;
 assign fundaefng1p5tpxnjxvq693a_866 = (
	((w20p03ghv2xprgpb_157 == 1'b1))?1'b1:
	0)  ;
 assign lk1195kahrwcw7qwh_470 = (
	((ltatjuf8m2f87ald_529 == 5'b01111) && (x3y3fgbyebfnxddba0nnypsrzcph_454 != 1'b1) && (nakidz2fet2wf5cw7hvegazh2kd4xr9_824 == 1'b1))?1'b1:
	((wh6v9l75t85vpgaayfr3ahopfd_175 != 8'h00) && (wh6v9l75t85vpgaayfr3ahopfd_175 != 8'h86) && (x3y3fgbyebfnxddba0nnypsrzcph_454 != 1'b1) && (nakidz2fet2wf5cw7hvegazh2kd4xr9_824 == 1'b1))?1'b1:
	0)  ;
 assign k93c35vnysbw3okx_89 = (
	((wh6v9l75t85vpgaayfr3ahopfd_175 == 8'h86))?1'b1:
	0)  ;
 assign rpwoo661rys1yiu4oe11_903 = 
	1'b1 ;
 assign i2wnqrqsma8h2m1jc3_435 = 
	1'b0 ;
 assign iqlivbom3roeutauustl9az7emj0_903 = 
	 ~(dv0ikokoc9srnk9z6va_549) ;
 assign nuskbx8qmbilicfk_616 = (
	((wh6v9l75t85vpgaayfr3ahopfd_175 == 8'h86))?1'b1:
	0)  ;
 assign nakidz2fet2wf5cw7hvegazh2kd4xr9_824 = 
	1'b1 ;
 assign reset_out_active_high 	= cptyexy7f42adpy3ra6tg9_309 ;
 assign reset_out_active_low 	= nuhm0iahkdqklxeyc5pdj26rp7n_316 ;


assign dv0ikokoc9srnk9z6va_549 = (
	((gtzhfyniq9hepdqldyq_383 == 1'b1) && (ltatjuf8m2f87ald_529 < 5'b10000))?rpwoo661rys1yiu4oe11_903 :
1'b0) ;



always @(posedge clk)
begin
		w20p03ghv2xprgpb_157 <= rst ;
		x3y3fgbyebfnxddba0nnypsrzcph_454 <= w20p03ghv2xprgpb_157 ;
	if (fundaefng1p5tpxnjxvq693a_866) 
	begin 
	  ltatjuf8m2f87ald_529 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (zl5vmy01kpmw1ds8g0rxkzy_310) 
		begin 
			ltatjuf8m2f87ald_529 <= ooky5sasloe9qmnbuaaalkz_463 ;
		end 
	end 
	if (fundaefng1p5tpxnjxvq693a_866) 
	begin 
	  wh6v9l75t85vpgaayfr3ahopfd_175 <= 8'h00 ;
	 end 
	else 
	begin 
		if (lk1195kahrwcw7qwh_470) 
		begin 
			wh6v9l75t85vpgaayfr3ahopfd_175 <= nyp9ev9r96eomw1lbik_853 ;
		end 
	end 
	if (rst) 
	begin 
	  hdd1v6qbkstwzg8t0uxisw50_332 <= 1'b1 ;
	 end 
	else 
	begin 
			hdd1v6qbkstwzg8t0uxisw50_332 <= dv0ikokoc9srnk9z6va_549 ;
	end 
	if (rst) 
	begin 
	  z7ye1uqbi3piv7z9t5c8lo3cp92uy5_240 <= 1'b0 ;
	 end 
	else 
	begin 
			z7ye1uqbi3piv7z9t5c8lo3cp92uy5_240 <= iqlivbom3roeutauustl9az7emj0_903 ;
	end 
	if (rst) 
	begin 
	  cptyexy7f42adpy3ra6tg9_309 <= 1'b1 ;
	 end 
	else 
	begin 
			cptyexy7f42adpy3ra6tg9_309 <= hdd1v6qbkstwzg8t0uxisw50_332 ;
	end 
	if (rst) 
	begin 
	  nuhm0iahkdqklxeyc5pdj26rp7n_316 <= 1'b0 ;
	 end 
	else 
	begin 
			nuhm0iahkdqklxeyc5pdj26rp7n_316 <= z7ye1uqbi3piv7z9t5c8lo3cp92uy5_240 ;
	end 
		init_done <= nuskbx8qmbilicfk_616 ;
end

endmodule 
