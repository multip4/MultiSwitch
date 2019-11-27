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
// File created: 2019/11/21 22:45:49
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






 reg	d0vb2w885dfsh736dbp2xjin0b9c_522;	 initial d0vb2w885dfsh736dbp2xjin0b9c_522 = 1'b0 ;
 reg	h1snhityd62y0oi462mgw_829;	 initial h1snhityd62y0oi462mgw_829 = 1'b0 ;
 reg [4:0] unv6gw3qe7vzgamelpbrkoucpy6oh_446;	 initial unv6gw3qe7vzgamelpbrkoucpy6oh_446 = 5'b00000 ;
 reg [6:0] rmguufhck7yz6o3ib_759;	 initial rmguufhck7yz6o3ib_759 = 7'b0000000 ;
 wire	m1f7r311f7xdi8n5oio7hltvlywhzn_667 ;
 reg	y4u5bmfo2ljj7qrunu6ryr_298;	 initial y4u5bmfo2ljj7qrunu6ryr_298 = 1'b1 ;
 reg	pi5b3q3x6y3oqfbkckmi6_856;	 initial pi5b3q3x6y3oqfbkckmi6_856 = 1'b0 ;
 reg	afhlzbgoy1r3cim4do1jvk4vp_673;	 initial afhlzbgoy1r3cim4do1jvk4vp_673 = 1'b1 ;
 reg	wnj3mki3huk1g0lgrfgen51r2jjc_864;	 initial wnj3mki3huk1g0lgrfgen51r2jjc_864 = 1'b0 ;
 wire [4:0] jpos8a9indf2x5m3zrff1p857aemk_193 ;
 wire [6:0] uoz1wzy0xjw35wtpaehjp_795 ;
 wire	acce3rdab4p1lmnaaij_870 ;
 wire	zh3zhxb0cpvsy5by944wr13b_78 ;
 wire	fl4g7b0jtjkr44rekmtpmg26h_178 ;
 wire	dy1jys07i6p9wtfmwoh_768 ;
 wire	e152j28ia4nanaabqnl1vshnc4c7vi_50 ;
 wire	q11obbqv8c2742hcp_870 ;
 wire	p1nvmrbgaypkx4tltoc2_280 ;
 wire	gumvyg202oxbbrn0fb9pnirsx0a_455 ;
 wire	g9eus27li4ttosv92ke75q1tgu_448 ;
 wire	etzr6pz2qykie9i2l6jkl7_40 ;
 wire	rivms1bzfl4occw39jbsfwebe_786 ;
 wire	ihsgjfrn6605ky68261hrxps1pe1zld_563 ;


 assign jpos8a9indf2x5m3zrff1p857aemk_193 = 
	unv6gw3qe7vzgamelpbrkoucpy6oh_446 + 1 ;
 assign uoz1wzy0xjw35wtpaehjp_795 = 
	rmguufhck7yz6o3ib_759 + 1 ;
 assign acce3rdab4p1lmnaaij_870 = (
	((unv6gw3qe7vzgamelpbrkoucpy6oh_446 > 5'b00000))?1'b1:
	0)  ;
 assign zh3zhxb0cpvsy5by944wr13b_78 = 
	rst | h1snhityd62y0oi462mgw_829 ;
 assign fl4g7b0jtjkr44rekmtpmg26h_178 = 
	zh3zhxb0cpvsy5by944wr13b_78 | acce3rdab4p1lmnaaij_870 ;
 assign dy1jys07i6p9wtfmwoh_768 = (
	((h1snhityd62y0oi462mgw_829 == 1'b1) && (ihsgjfrn6605ky68261hrxps1pe1zld_563 == 1'b1) && (unv6gw3qe7vzgamelpbrkoucpy6oh_446 == 5'b00000))?1'b1:
	((unv6gw3qe7vzgamelpbrkoucpy6oh_446 != 5'b00000) && (h1snhityd62y0oi462mgw_829 != 1'b1))?1'b1:
	0)  ;
 assign e152j28ia4nanaabqnl1vshnc4c7vi_50 = (
	((d0vb2w885dfsh736dbp2xjin0b9c_522 == 1'b1))?1'b1:
	0)  ;
 assign q11obbqv8c2742hcp_870 = (
	((unv6gw3qe7vzgamelpbrkoucpy6oh_446 == 5'b01111) && (h1snhityd62y0oi462mgw_829 != 1'b1) && (ihsgjfrn6605ky68261hrxps1pe1zld_563 == 1'b1))?1'b1:
	((rmguufhck7yz6o3ib_759 != 7'b0000000) && (rmguufhck7yz6o3ib_759 != 7'b0111111) && (h1snhityd62y0oi462mgw_829 != 1'b1) && (ihsgjfrn6605ky68261hrxps1pe1zld_563 == 1'b1))?1'b1:
	0)  ;
 assign p1nvmrbgaypkx4tltoc2_280 = (
	((rmguufhck7yz6o3ib_759 == 7'b0111111))?1'b1:
	0)  ;
 assign gumvyg202oxbbrn0fb9pnirsx0a_455 = 
	1'b1 ;
 assign g9eus27li4ttosv92ke75q1tgu_448 = 
	1'b0 ;
 assign etzr6pz2qykie9i2l6jkl7_40 = 
	 ~(m1f7r311f7xdi8n5oio7hltvlywhzn_667) ;
 assign rivms1bzfl4occw39jbsfwebe_786 = (
	((rmguufhck7yz6o3ib_759 == 7'b0111111))?1'b1:
	0)  ;
 assign ihsgjfrn6605ky68261hrxps1pe1zld_563 = 
	1'b1 ;
 assign reset_out_active_high 	= afhlzbgoy1r3cim4do1jvk4vp_673 ;
 assign reset_out_active_low 	= wnj3mki3huk1g0lgrfgen51r2jjc_864 ;


assign m1f7r311f7xdi8n5oio7hltvlywhzn_667 = (
	((fl4g7b0jtjkr44rekmtpmg26h_178 == 1'b1) && (unv6gw3qe7vzgamelpbrkoucpy6oh_446 < 5'b10000))?gumvyg202oxbbrn0fb9pnirsx0a_455 :
1'b0) ;



always @(posedge clk)
begin
		d0vb2w885dfsh736dbp2xjin0b9c_522 <= rst ;
		h1snhityd62y0oi462mgw_829 <= d0vb2w885dfsh736dbp2xjin0b9c_522 ;
	if (e152j28ia4nanaabqnl1vshnc4c7vi_50) 
	begin 
	  unv6gw3qe7vzgamelpbrkoucpy6oh_446 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (dy1jys07i6p9wtfmwoh_768) 
		begin 
			unv6gw3qe7vzgamelpbrkoucpy6oh_446 <= jpos8a9indf2x5m3zrff1p857aemk_193 ;
		end 
	end 
	if (e152j28ia4nanaabqnl1vshnc4c7vi_50) 
	begin 
	  rmguufhck7yz6o3ib_759 <= 7'b0000000 ;
	 end 
	else 
	begin 
		if (q11obbqv8c2742hcp_870) 
		begin 
			rmguufhck7yz6o3ib_759 <= uoz1wzy0xjw35wtpaehjp_795 ;
		end 
	end 
	if (rst) 
	begin 
	  y4u5bmfo2ljj7qrunu6ryr_298 <= 1'b1 ;
	 end 
	else 
	begin 
			y4u5bmfo2ljj7qrunu6ryr_298 <= m1f7r311f7xdi8n5oio7hltvlywhzn_667 ;
	end 
	if (rst) 
	begin 
	  pi5b3q3x6y3oqfbkckmi6_856 <= 1'b0 ;
	 end 
	else 
	begin 
			pi5b3q3x6y3oqfbkckmi6_856 <= etzr6pz2qykie9i2l6jkl7_40 ;
	end 
	if (rst) 
	begin 
	  afhlzbgoy1r3cim4do1jvk4vp_673 <= 1'b1 ;
	 end 
	else 
	begin 
			afhlzbgoy1r3cim4do1jvk4vp_673 <= y4u5bmfo2ljj7qrunu6ryr_298 ;
	end 
	if (rst) 
	begin 
	  wnj3mki3huk1g0lgrfgen51r2jjc_864 <= 1'b0 ;
	 end 
	else 
	begin 
			wnj3mki3huk1g0lgrfgen51r2jjc_864 <= pi5b3q3x6y3oqfbkckmi6_856 ;
	end 
		init_done <= rivms1bzfl4occw39jbsfwebe_786 ;
end

endmodule 
