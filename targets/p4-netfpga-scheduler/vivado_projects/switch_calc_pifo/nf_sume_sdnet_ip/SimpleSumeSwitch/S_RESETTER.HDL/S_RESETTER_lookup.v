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
// File created: 2019/12/04 18:15:53
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






 reg	b0k8dgz7k9enfahvjoiz8_890;	 initial b0k8dgz7k9enfahvjoiz8_890 = 1'b0 ;
 reg	onyl55jiqdtslgt4o_115;	 initial onyl55jiqdtslgt4o_115 = 1'b0 ;
 reg [4:0] pd4odzikmygul1vmbcfzyx_225;	 initial pd4odzikmygul1vmbcfzyx_225 = 5'b00000 ;
 reg [7:0] yjvbcout3mc1rxy0qmaxowf63sg0y5_553;	 initial yjvbcout3mc1rxy0qmaxowf63sg0y5_553 = 8'h00 ;
 wire	q9vykqjsbco6kn1144q_307 ;
 reg	gasc57y8x5cm4285vnk9lyx_501;	 initial gasc57y8x5cm4285vnk9lyx_501 = 1'b1 ;
 reg	n6c7add6e8k90nn5lt0dwrbko8g_30;	 initial n6c7add6e8k90nn5lt0dwrbko8g_30 = 1'b0 ;
 reg	jv330clb0wf1wqx2gw8ggz99hgmqbuc_526;	 initial jv330clb0wf1wqx2gw8ggz99hgmqbuc_526 = 1'b1 ;
 reg	n6r9vo1sdzbuj51uyjlwtmysy_660;	 initial n6r9vo1sdzbuj51uyjlwtmysy_660 = 1'b0 ;
 wire [4:0] xcenjcxo8e4owhi28it1jfct_202 ;
 wire [7:0] cjzbs8m6mg22r1w8pz1d_1 ;
 wire	nymn67myyr3djhtuvsmb9nxde5wszyxz_634 ;
 wire	zlqbdbep2kyduq128_61 ;
 wire	tnp9re9vr4c9nvl849i_751 ;
 wire	tt1q3z6m2rttykqb1k_344 ;
 wire	xwf3p2w6qv8pxhuogtc1wjobjzvy_340 ;
 wire	vcd5zmtci6gy6hrrmrtb9jd_885 ;
 wire	gpzunqc5g4j7vehfogug_110 ;
 wire	if0r8w80t7xk863eft3_296 ;
 wire	y9v9zxac8u49cvdapqwmw0u25u_867 ;
 wire	qnrsmpsw15w750akbq_658 ;
 wire	uxk96ow8if7c0mhq0jt99q3k4y2gwxs_68 ;
 wire	dtt70uxr94qs1jb5_530 ;


 assign xcenjcxo8e4owhi28it1jfct_202 = 
	pd4odzikmygul1vmbcfzyx_225 + 1 ;
 assign cjzbs8m6mg22r1w8pz1d_1 = 
	yjvbcout3mc1rxy0qmaxowf63sg0y5_553 + 1 ;
 assign nymn67myyr3djhtuvsmb9nxde5wszyxz_634 = (
	((pd4odzikmygul1vmbcfzyx_225 > 5'b00000))?1'b1:
	0)  ;
 assign zlqbdbep2kyduq128_61 = 
	rst | onyl55jiqdtslgt4o_115 ;
 assign tnp9re9vr4c9nvl849i_751 = 
	zlqbdbep2kyduq128_61 | nymn67myyr3djhtuvsmb9nxde5wszyxz_634 ;
 assign tt1q3z6m2rttykqb1k_344 = (
	((onyl55jiqdtslgt4o_115 == 1'b1) && (dtt70uxr94qs1jb5_530 == 1'b1) && (pd4odzikmygul1vmbcfzyx_225 == 5'b00000))?1'b1:
	((pd4odzikmygul1vmbcfzyx_225 != 5'b00000) && (onyl55jiqdtslgt4o_115 != 1'b1))?1'b1:
	0)  ;
 assign xwf3p2w6qv8pxhuogtc1wjobjzvy_340 = (
	((b0k8dgz7k9enfahvjoiz8_890 == 1'b1))?1'b1:
	0)  ;
 assign vcd5zmtci6gy6hrrmrtb9jd_885 = (
	((pd4odzikmygul1vmbcfzyx_225 == 5'b01111) && (onyl55jiqdtslgt4o_115 != 1'b1) && (dtt70uxr94qs1jb5_530 == 1'b1))?1'b1:
	((yjvbcout3mc1rxy0qmaxowf63sg0y5_553 != 8'h00) && (yjvbcout3mc1rxy0qmaxowf63sg0y5_553 != 8'h86) && (onyl55jiqdtslgt4o_115 != 1'b1) && (dtt70uxr94qs1jb5_530 == 1'b1))?1'b1:
	0)  ;
 assign gpzunqc5g4j7vehfogug_110 = (
	((yjvbcout3mc1rxy0qmaxowf63sg0y5_553 == 8'h86))?1'b1:
	0)  ;
 assign if0r8w80t7xk863eft3_296 = 
	1'b1 ;
 assign y9v9zxac8u49cvdapqwmw0u25u_867 = 
	1'b0 ;
 assign qnrsmpsw15w750akbq_658 = 
	 ~(q9vykqjsbco6kn1144q_307) ;
 assign uxk96ow8if7c0mhq0jt99q3k4y2gwxs_68 = (
	((yjvbcout3mc1rxy0qmaxowf63sg0y5_553 == 8'h86))?1'b1:
	0)  ;
 assign dtt70uxr94qs1jb5_530 = 
	1'b1 ;
 assign reset_out_active_high 	= jv330clb0wf1wqx2gw8ggz99hgmqbuc_526 ;
 assign reset_out_active_low 	= n6r9vo1sdzbuj51uyjlwtmysy_660 ;


assign q9vykqjsbco6kn1144q_307 = (
	((tnp9re9vr4c9nvl849i_751 == 1'b1) && (pd4odzikmygul1vmbcfzyx_225 < 5'b10000))?if0r8w80t7xk863eft3_296 :
1'b0) ;



always @(posedge clk)
begin
		b0k8dgz7k9enfahvjoiz8_890 <= rst ;
		onyl55jiqdtslgt4o_115 <= b0k8dgz7k9enfahvjoiz8_890 ;
	if (xwf3p2w6qv8pxhuogtc1wjobjzvy_340) 
	begin 
	  pd4odzikmygul1vmbcfzyx_225 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (tt1q3z6m2rttykqb1k_344) 
		begin 
			pd4odzikmygul1vmbcfzyx_225 <= xcenjcxo8e4owhi28it1jfct_202 ;
		end 
	end 
	if (xwf3p2w6qv8pxhuogtc1wjobjzvy_340) 
	begin 
	  yjvbcout3mc1rxy0qmaxowf63sg0y5_553 <= 8'h00 ;
	 end 
	else 
	begin 
		if (vcd5zmtci6gy6hrrmrtb9jd_885) 
		begin 
			yjvbcout3mc1rxy0qmaxowf63sg0y5_553 <= cjzbs8m6mg22r1w8pz1d_1 ;
		end 
	end 
	if (rst) 
	begin 
	  gasc57y8x5cm4285vnk9lyx_501 <= 1'b1 ;
	 end 
	else 
	begin 
			gasc57y8x5cm4285vnk9lyx_501 <= q9vykqjsbco6kn1144q_307 ;
	end 
	if (rst) 
	begin 
	  n6c7add6e8k90nn5lt0dwrbko8g_30 <= 1'b0 ;
	 end 
	else 
	begin 
			n6c7add6e8k90nn5lt0dwrbko8g_30 <= qnrsmpsw15w750akbq_658 ;
	end 
	if (rst) 
	begin 
	  jv330clb0wf1wqx2gw8ggz99hgmqbuc_526 <= 1'b1 ;
	 end 
	else 
	begin 
			jv330clb0wf1wqx2gw8ggz99hgmqbuc_526 <= gasc57y8x5cm4285vnk9lyx_501 ;
	end 
	if (rst) 
	begin 
	  n6r9vo1sdzbuj51uyjlwtmysy_660 <= 1'b0 ;
	 end 
	else 
	begin 
			n6r9vo1sdzbuj51uyjlwtmysy_660 <= n6c7add6e8k90nn5lt0dwrbko8g_30 ;
	end 
		init_done <= uxk96ow8if7c0mhq0jt99q3k4y2gwxs_68 ;
end

endmodule 
