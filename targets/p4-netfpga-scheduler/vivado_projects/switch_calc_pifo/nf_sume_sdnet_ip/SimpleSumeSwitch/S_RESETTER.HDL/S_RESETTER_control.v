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
// File created: 2019/12/09 21:12:17
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






 reg	vy2pbinyo6wody5z2vll7ibjqarkz_235;	 initial vy2pbinyo6wody5z2vll7ibjqarkz_235 = 1'b0 ;
 reg	o2422ed5ni5nfrquculk_100;	 initial o2422ed5ni5nfrquculk_100 = 1'b0 ;
 reg [4:0] eswwmqx4fea9zlp0krccw5gn3i_321;	 initial eswwmqx4fea9zlp0krccw5gn3i_321 = 5'b00000 ;
 reg [6:0] szi8gleeby48opa1rarfvmqf5vt_720;	 initial szi8gleeby48opa1rarfvmqf5vt_720 = 7'b0000000 ;
 wire	k3jm3k6eogfksnseqp0hl9zezo57a7m_592 ;
 reg	mms93vde8ha4g57t_44;	 initial mms93vde8ha4g57t_44 = 1'b1 ;
 reg	i7sfbcx1gjklm83b9a2p49wodjcj7_363;	 initial i7sfbcx1gjklm83b9a2p49wodjcj7_363 = 1'b0 ;
 reg	hhcyfkprt5r38hll92gcsby37c7s_331;	 initial hhcyfkprt5r38hll92gcsby37c7s_331 = 1'b1 ;
 reg	wy2ug2nfagu9us31c3_121;	 initial wy2ug2nfagu9us31c3_121 = 1'b0 ;
 wire [4:0] gx51w0xlvgr92xuppb_624 ;
 wire [6:0] itlrlc7vb553hwajy_159 ;
 wire	ua6ncyswuk7yufq1u3ltfz2jpuqw8gr_193 ;
 wire	rkbal6urposi25inwph5j4metp3ydut_178 ;
 wire	g5w2gga9j8074in9f9_16 ;
 wire	gxhs1du72bamplzt1a5ir6fbm77q6_731 ;
 wire	h1q94872b88du3ns5_235 ;
 wire	vg4juttkcdj3mia8x14o0nk8c3qu_764 ;
 wire	mjr3qrraj92rveyf6_652 ;
 wire	bgl07dgp4r0l470t8mk29o1uzcuj_282 ;
 wire	wf6p20gtb0wk1cwfs86l5lw1go3xzrre_270 ;
 wire	f7gf7e9ymuovb1rppys3ui5hzyo_719 ;
 wire	zhy82qeiohtw2j3xclnse_781 ;
 wire	r4n5ghunp2ypw47j3jumr5ez1a_560 ;


 assign gx51w0xlvgr92xuppb_624 = 
	eswwmqx4fea9zlp0krccw5gn3i_321 + 1 ;
 assign itlrlc7vb553hwajy_159 = 
	szi8gleeby48opa1rarfvmqf5vt_720 + 1 ;
 assign ua6ncyswuk7yufq1u3ltfz2jpuqw8gr_193 = (
	((eswwmqx4fea9zlp0krccw5gn3i_321 > 5'b00000))?1'b1:
	0)  ;
 assign rkbal6urposi25inwph5j4metp3ydut_178 = 
	rst | o2422ed5ni5nfrquculk_100 ;
 assign g5w2gga9j8074in9f9_16 = 
	rkbal6urposi25inwph5j4metp3ydut_178 | ua6ncyswuk7yufq1u3ltfz2jpuqw8gr_193 ;
 assign gxhs1du72bamplzt1a5ir6fbm77q6_731 = (
	((o2422ed5ni5nfrquculk_100 == 1'b1) && (r4n5ghunp2ypw47j3jumr5ez1a_560 == 1'b1) && (eswwmqx4fea9zlp0krccw5gn3i_321 == 5'b00000))?1'b1:
	((eswwmqx4fea9zlp0krccw5gn3i_321 != 5'b00000) && (o2422ed5ni5nfrquculk_100 != 1'b1))?1'b1:
	0)  ;
 assign h1q94872b88du3ns5_235 = (
	((vy2pbinyo6wody5z2vll7ibjqarkz_235 == 1'b1))?1'b1:
	0)  ;
 assign vg4juttkcdj3mia8x14o0nk8c3qu_764 = (
	((eswwmqx4fea9zlp0krccw5gn3i_321 == 5'b01111) && (o2422ed5ni5nfrquculk_100 != 1'b1) && (r4n5ghunp2ypw47j3jumr5ez1a_560 == 1'b1))?1'b1:
	((szi8gleeby48opa1rarfvmqf5vt_720 != 7'b0000000) && (szi8gleeby48opa1rarfvmqf5vt_720 != 7'b0111111) && (o2422ed5ni5nfrquculk_100 != 1'b1) && (r4n5ghunp2ypw47j3jumr5ez1a_560 == 1'b1))?1'b1:
	0)  ;
 assign mjr3qrraj92rveyf6_652 = (
	((szi8gleeby48opa1rarfvmqf5vt_720 == 7'b0111111))?1'b1:
	0)  ;
 assign bgl07dgp4r0l470t8mk29o1uzcuj_282 = 
	1'b1 ;
 assign wf6p20gtb0wk1cwfs86l5lw1go3xzrre_270 = 
	1'b0 ;
 assign f7gf7e9ymuovb1rppys3ui5hzyo_719 = 
	 ~(k3jm3k6eogfksnseqp0hl9zezo57a7m_592) ;
 assign zhy82qeiohtw2j3xclnse_781 = (
	((szi8gleeby48opa1rarfvmqf5vt_720 == 7'b0111111))?1'b1:
	0)  ;
 assign r4n5ghunp2ypw47j3jumr5ez1a_560 = 
	1'b1 ;
 assign reset_out_active_high 	= hhcyfkprt5r38hll92gcsby37c7s_331 ;
 assign reset_out_active_low 	= wy2ug2nfagu9us31c3_121 ;


assign k3jm3k6eogfksnseqp0hl9zezo57a7m_592 = (
	((g5w2gga9j8074in9f9_16 == 1'b1) && (eswwmqx4fea9zlp0krccw5gn3i_321 < 5'b10000))?bgl07dgp4r0l470t8mk29o1uzcuj_282 :
1'b0) ;



always @(posedge clk)
begin
		vy2pbinyo6wody5z2vll7ibjqarkz_235 <= rst ;
		o2422ed5ni5nfrquculk_100 <= vy2pbinyo6wody5z2vll7ibjqarkz_235 ;
	if (h1q94872b88du3ns5_235) 
	begin 
	  eswwmqx4fea9zlp0krccw5gn3i_321 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (gxhs1du72bamplzt1a5ir6fbm77q6_731) 
		begin 
			eswwmqx4fea9zlp0krccw5gn3i_321 <= gx51w0xlvgr92xuppb_624 ;
		end 
	end 
	if (h1q94872b88du3ns5_235) 
	begin 
	  szi8gleeby48opa1rarfvmqf5vt_720 <= 7'b0000000 ;
	 end 
	else 
	begin 
		if (vg4juttkcdj3mia8x14o0nk8c3qu_764) 
		begin 
			szi8gleeby48opa1rarfvmqf5vt_720 <= itlrlc7vb553hwajy_159 ;
		end 
	end 
	if (rst) 
	begin 
	  mms93vde8ha4g57t_44 <= 1'b1 ;
	 end 
	else 
	begin 
			mms93vde8ha4g57t_44 <= k3jm3k6eogfksnseqp0hl9zezo57a7m_592 ;
	end 
	if (rst) 
	begin 
	  i7sfbcx1gjklm83b9a2p49wodjcj7_363 <= 1'b0 ;
	 end 
	else 
	begin 
			i7sfbcx1gjklm83b9a2p49wodjcj7_363 <= f7gf7e9ymuovb1rppys3ui5hzyo_719 ;
	end 
	if (rst) 
	begin 
	  hhcyfkprt5r38hll92gcsby37c7s_331 <= 1'b1 ;
	 end 
	else 
	begin 
			hhcyfkprt5r38hll92gcsby37c7s_331 <= mms93vde8ha4g57t_44 ;
	end 
	if (rst) 
	begin 
	  wy2ug2nfagu9us31c3_121 <= 1'b0 ;
	 end 
	else 
	begin 
			wy2ug2nfagu9us31c3_121 <= i7sfbcx1gjklm83b9a2p49wodjcj7_363 ;
	end 
		init_done <= zhy82qeiohtw2j3xclnse_781 ;
end

endmodule 
