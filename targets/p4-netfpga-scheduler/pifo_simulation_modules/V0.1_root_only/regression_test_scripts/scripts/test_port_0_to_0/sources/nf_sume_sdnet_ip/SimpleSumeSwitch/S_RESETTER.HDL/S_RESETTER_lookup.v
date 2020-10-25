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
// File created: 2020/10/03 20:31:34
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






 reg	j90kb8l6qbiodlkdxcgpaz8nnm9mq_697;	 initial j90kb8l6qbiodlkdxcgpaz8nnm9mq_697 = 1'b0 ;
 reg	zzuh15aulynsod115gd1xxlnyxy_479;	 initial zzuh15aulynsod115gd1xxlnyxy_479 = 1'b0 ;
 reg [4:0] gifxhezx142y0s9e5y_866;	 initial gifxhezx142y0s9e5y_866 = 5'b00000 ;
 reg [7:0] h5srbyb39qf0cix9c6dw5_680;	 initial h5srbyb39qf0cix9c6dw5_680 = 8'h00 ;
 wire	ult4megd2x6sydmo0swjx_791 ;
 reg	qolch9mk25fy92mn2xdwcrzhpkrpo8fg_107;	 initial qolch9mk25fy92mn2xdwcrzhpkrpo8fg_107 = 1'b1 ;
 reg	r14gld1h8r45nwqehrozqr4q7mubj_165;	 initial r14gld1h8r45nwqehrozqr4q7mubj_165 = 1'b0 ;
 reg	ukijd2mk5s0bhd88930_176;	 initial ukijd2mk5s0bhd88930_176 = 1'b1 ;
 reg	rm66pna9xjy7nz357f7lodqmtcv_838;	 initial rm66pna9xjy7nz357f7lodqmtcv_838 = 1'b0 ;
 wire [4:0] mlrjf4l9lzbthdegfoi3vongqyhac17j_89 ;
 wire [7:0] rsllh8t2fo5v916niz26k8q25t_8 ;
 wire	vuopfxdw7lxkeknbyslfp4_72 ;
 wire	sfov1d9mfxnzbjmwa7_487 ;
 wire	xaece31jk36r6hj78_476 ;
 wire	e8jr1nqxwqhj2kmtwvi05zlvay62q_318 ;
 wire	k2vx3k74jdk5fysabfptqpgv_600 ;
 wire	em2g4l8vlcf4nlmg6zz197i5g6_719 ;
 wire	p5to9dpdti0m2qru041sji_729 ;
 wire	uo23jm61v0ym4lp7_79 ;
 wire	i9l8ejp007em57ad5ny_446 ;
 wire	qrmsiricxc9m5jprjf6mlxjtiyb_790 ;
 wire	mj631g402ko3b310sebxah_770 ;
 wire	lwfoti11xxysg9yo53s74e_672 ;


 assign mlrjf4l9lzbthdegfoi3vongqyhac17j_89 = 
	gifxhezx142y0s9e5y_866 + 1 ;
 assign rsllh8t2fo5v916niz26k8q25t_8 = 
	h5srbyb39qf0cix9c6dw5_680 + 1 ;
 assign vuopfxdw7lxkeknbyslfp4_72 = (
	((gifxhezx142y0s9e5y_866 > 5'b00000))?1'b1:
	0)  ;
 assign sfov1d9mfxnzbjmwa7_487 = 
	rst | zzuh15aulynsod115gd1xxlnyxy_479 ;
 assign xaece31jk36r6hj78_476 = 
	sfov1d9mfxnzbjmwa7_487 | vuopfxdw7lxkeknbyslfp4_72 ;
 assign e8jr1nqxwqhj2kmtwvi05zlvay62q_318 = (
	((zzuh15aulynsod115gd1xxlnyxy_479 == 1'b1) && (lwfoti11xxysg9yo53s74e_672 == 1'b1) && (gifxhezx142y0s9e5y_866 == 5'b00000))?1'b1:
	((gifxhezx142y0s9e5y_866 != 5'b00000) && (zzuh15aulynsod115gd1xxlnyxy_479 != 1'b1))?1'b1:
	0)  ;
 assign k2vx3k74jdk5fysabfptqpgv_600 = (
	((j90kb8l6qbiodlkdxcgpaz8nnm9mq_697 == 1'b1))?1'b1:
	0)  ;
 assign em2g4l8vlcf4nlmg6zz197i5g6_719 = (
	((gifxhezx142y0s9e5y_866 == 5'b01111) && (zzuh15aulynsod115gd1xxlnyxy_479 != 1'b1) && (lwfoti11xxysg9yo53s74e_672 == 1'b1))?1'b1:
	((h5srbyb39qf0cix9c6dw5_680 != 8'h00) && (h5srbyb39qf0cix9c6dw5_680 != 8'h86) && (zzuh15aulynsod115gd1xxlnyxy_479 != 1'b1) && (lwfoti11xxysg9yo53s74e_672 == 1'b1))?1'b1:
	0)  ;
 assign p5to9dpdti0m2qru041sji_729 = (
	((h5srbyb39qf0cix9c6dw5_680 == 8'h86))?1'b1:
	0)  ;
 assign uo23jm61v0ym4lp7_79 = 
	1'b1 ;
 assign i9l8ejp007em57ad5ny_446 = 
	1'b0 ;
 assign qrmsiricxc9m5jprjf6mlxjtiyb_790 = 
	 ~(ult4megd2x6sydmo0swjx_791) ;
 assign mj631g402ko3b310sebxah_770 = (
	((h5srbyb39qf0cix9c6dw5_680 == 8'h86))?1'b1:
	0)  ;
 assign lwfoti11xxysg9yo53s74e_672 = 
	1'b1 ;
 assign reset_out_active_high 	= ukijd2mk5s0bhd88930_176 ;
 assign reset_out_active_low 	= rm66pna9xjy7nz357f7lodqmtcv_838 ;


assign ult4megd2x6sydmo0swjx_791 = (
	((xaece31jk36r6hj78_476 == 1'b1) && (gifxhezx142y0s9e5y_866 < 5'b10000))?uo23jm61v0ym4lp7_79 :
1'b0) ;



always @(posedge clk)
begin
		j90kb8l6qbiodlkdxcgpaz8nnm9mq_697 <= rst ;
		zzuh15aulynsod115gd1xxlnyxy_479 <= j90kb8l6qbiodlkdxcgpaz8nnm9mq_697 ;
	if (k2vx3k74jdk5fysabfptqpgv_600) 
	begin 
	  gifxhezx142y0s9e5y_866 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (e8jr1nqxwqhj2kmtwvi05zlvay62q_318) 
		begin 
			gifxhezx142y0s9e5y_866 <= mlrjf4l9lzbthdegfoi3vongqyhac17j_89 ;
		end 
	end 
	if (k2vx3k74jdk5fysabfptqpgv_600) 
	begin 
	  h5srbyb39qf0cix9c6dw5_680 <= 8'h00 ;
	 end 
	else 
	begin 
		if (em2g4l8vlcf4nlmg6zz197i5g6_719) 
		begin 
			h5srbyb39qf0cix9c6dw5_680 <= rsllh8t2fo5v916niz26k8q25t_8 ;
		end 
	end 
	if (rst) 
	begin 
	  qolch9mk25fy92mn2xdwcrzhpkrpo8fg_107 <= 1'b1 ;
	 end 
	else 
	begin 
			qolch9mk25fy92mn2xdwcrzhpkrpo8fg_107 <= ult4megd2x6sydmo0swjx_791 ;
	end 
	if (rst) 
	begin 
	  r14gld1h8r45nwqehrozqr4q7mubj_165 <= 1'b0 ;
	 end 
	else 
	begin 
			r14gld1h8r45nwqehrozqr4q7mubj_165 <= qrmsiricxc9m5jprjf6mlxjtiyb_790 ;
	end 
	if (rst) 
	begin 
	  ukijd2mk5s0bhd88930_176 <= 1'b1 ;
	 end 
	else 
	begin 
			ukijd2mk5s0bhd88930_176 <= qolch9mk25fy92mn2xdwcrzhpkrpo8fg_107 ;
	end 
	if (rst) 
	begin 
	  rm66pna9xjy7nz357f7lodqmtcv_838 <= 1'b0 ;
	 end 
	else 
	begin 
			rm66pna9xjy7nz357f7lodqmtcv_838 <= r14gld1h8r45nwqehrozqr4q7mubj_165 ;
	end 
		init_done <= mj631g402ko3b310sebxah_770 ;
end

endmodule 
