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
// File created: 2020/10/07 15:07:47
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






 reg	k8msmlubcppakkvm9i0tvx_652;	 initial k8msmlubcppakkvm9i0tvx_652 = 1'b0 ;
 reg	b2jpn6dhon3qsi5rq_873;	 initial b2jpn6dhon3qsi5rq_873 = 1'b0 ;
 reg [4:0] hg4t943ykd2qdffv4h9lh4sth4t_148;	 initial hg4t943ykd2qdffv4h9lh4sth4t_148 = 5'b00000 ;
 reg [6:0] tg00pr06u9dbj2u38jx_180;	 initial tg00pr06u9dbj2u38jx_180 = 7'b0000000 ;
 wire	z5q996vna3en4m4yakmriwso9nhk_897 ;
 reg	v9rch62943zz3l0yhn253lncb84a3z_272;	 initial v9rch62943zz3l0yhn253lncb84a3z_272 = 1'b1 ;
 reg	gda9jbfnhbn2nnzf1ptzfe9l97qby1_351;	 initial gda9jbfnhbn2nnzf1ptzfe9l97qby1_351 = 1'b0 ;
 reg	yq4cc9oariuuqm2b8pqjsy_794;	 initial yq4cc9oariuuqm2b8pqjsy_794 = 1'b1 ;
 reg	wsj53k8pvzzx413x39idb9dyyvk093_655;	 initial wsj53k8pvzzx413x39idb9dyyvk093_655 = 1'b0 ;
 wire [4:0] bimpth7d1p1zix5h5knaq_78 ;
 wire [6:0] ip6xawwfbd6xu3bwneikfodfc_708 ;
 wire	fszuretcuaw02oxu4h36_830 ;
 wire	g2oljle7amre7xp5xqff4tefodxz79e_336 ;
 wire	nkj28h0lqm6nxjrlnafukvbh_183 ;
 wire	dr8hzzozjyhe1gstomj5y23u9ycv9f_759 ;
 wire	jgbsozdy2w7iq9v7j5mkwg_371 ;
 wire	ty3vxmqk1vy1mfc5njiw902xttrm_891 ;
 wire	h3uq4xnwx85y2x61_0 ;
 wire	hmma8fji7g1eoi9ui349bie_281 ;
 wire	nbsgnz1anfsu0k3ndq_392 ;
 wire	kiwpolxjuru2q8ewjk6d0ptad_162 ;
 wire	gp7m7a44m2uuj7018_315 ;
 wire	wb3dckfeqom3i1go8v97j8r7yv2m9elu_683 ;


 assign bimpth7d1p1zix5h5knaq_78 = 
	hg4t943ykd2qdffv4h9lh4sth4t_148 + 1 ;
 assign ip6xawwfbd6xu3bwneikfodfc_708 = 
	tg00pr06u9dbj2u38jx_180 + 1 ;
 assign fszuretcuaw02oxu4h36_830 = (
	((hg4t943ykd2qdffv4h9lh4sth4t_148 > 5'b00000))?1'b1:
	0)  ;
 assign g2oljle7amre7xp5xqff4tefodxz79e_336 = 
	rst | b2jpn6dhon3qsi5rq_873 ;
 assign nkj28h0lqm6nxjrlnafukvbh_183 = 
	g2oljle7amre7xp5xqff4tefodxz79e_336 | fszuretcuaw02oxu4h36_830 ;
 assign dr8hzzozjyhe1gstomj5y23u9ycv9f_759 = (
	((b2jpn6dhon3qsi5rq_873 == 1'b1) && (wb3dckfeqom3i1go8v97j8r7yv2m9elu_683 == 1'b1) && (hg4t943ykd2qdffv4h9lh4sth4t_148 == 5'b00000))?1'b1:
	((hg4t943ykd2qdffv4h9lh4sth4t_148 != 5'b00000) && (b2jpn6dhon3qsi5rq_873 != 1'b1))?1'b1:
	0)  ;
 assign jgbsozdy2w7iq9v7j5mkwg_371 = (
	((k8msmlubcppakkvm9i0tvx_652 == 1'b1))?1'b1:
	0)  ;
 assign ty3vxmqk1vy1mfc5njiw902xttrm_891 = (
	((hg4t943ykd2qdffv4h9lh4sth4t_148 == 5'b01111) && (b2jpn6dhon3qsi5rq_873 != 1'b1) && (wb3dckfeqom3i1go8v97j8r7yv2m9elu_683 == 1'b1))?1'b1:
	((tg00pr06u9dbj2u38jx_180 != 7'b0000000) && (tg00pr06u9dbj2u38jx_180 != 7'b0111111) && (b2jpn6dhon3qsi5rq_873 != 1'b1) && (wb3dckfeqom3i1go8v97j8r7yv2m9elu_683 == 1'b1))?1'b1:
	0)  ;
 assign h3uq4xnwx85y2x61_0 = (
	((tg00pr06u9dbj2u38jx_180 == 7'b0111111))?1'b1:
	0)  ;
 assign hmma8fji7g1eoi9ui349bie_281 = 
	1'b1 ;
 assign nbsgnz1anfsu0k3ndq_392 = 
	1'b0 ;
 assign kiwpolxjuru2q8ewjk6d0ptad_162 = 
	 ~(z5q996vna3en4m4yakmriwso9nhk_897) ;
 assign gp7m7a44m2uuj7018_315 = (
	((tg00pr06u9dbj2u38jx_180 == 7'b0111111))?1'b1:
	0)  ;
 assign wb3dckfeqom3i1go8v97j8r7yv2m9elu_683 = 
	1'b1 ;
 assign reset_out_active_high 	= yq4cc9oariuuqm2b8pqjsy_794 ;
 assign reset_out_active_low 	= wsj53k8pvzzx413x39idb9dyyvk093_655 ;


assign z5q996vna3en4m4yakmriwso9nhk_897 = (
	((nkj28h0lqm6nxjrlnafukvbh_183 == 1'b1) && (hg4t943ykd2qdffv4h9lh4sth4t_148 < 5'b10000))?hmma8fji7g1eoi9ui349bie_281 :
1'b0) ;



always @(posedge clk)
begin
		k8msmlubcppakkvm9i0tvx_652 <= rst ;
		b2jpn6dhon3qsi5rq_873 <= k8msmlubcppakkvm9i0tvx_652 ;
	if (jgbsozdy2w7iq9v7j5mkwg_371) 
	begin 
	  hg4t943ykd2qdffv4h9lh4sth4t_148 <= 5'b00000 ;
	 end 
	else 
	begin 
		if (dr8hzzozjyhe1gstomj5y23u9ycv9f_759) 
		begin 
			hg4t943ykd2qdffv4h9lh4sth4t_148 <= bimpth7d1p1zix5h5knaq_78 ;
		end 
	end 
	if (jgbsozdy2w7iq9v7j5mkwg_371) 
	begin 
	  tg00pr06u9dbj2u38jx_180 <= 7'b0000000 ;
	 end 
	else 
	begin 
		if (ty3vxmqk1vy1mfc5njiw902xttrm_891) 
		begin 
			tg00pr06u9dbj2u38jx_180 <= ip6xawwfbd6xu3bwneikfodfc_708 ;
		end 
	end 
	if (rst) 
	begin 
	  v9rch62943zz3l0yhn253lncb84a3z_272 <= 1'b1 ;
	 end 
	else 
	begin 
			v9rch62943zz3l0yhn253lncb84a3z_272 <= z5q996vna3en4m4yakmriwso9nhk_897 ;
	end 
	if (rst) 
	begin 
	  gda9jbfnhbn2nnzf1ptzfe9l97qby1_351 <= 1'b0 ;
	 end 
	else 
	begin 
			gda9jbfnhbn2nnzf1ptzfe9l97qby1_351 <= kiwpolxjuru2q8ewjk6d0ptad_162 ;
	end 
	if (rst) 
	begin 
	  yq4cc9oariuuqm2b8pqjsy_794 <= 1'b1 ;
	 end 
	else 
	begin 
			yq4cc9oariuuqm2b8pqjsy_794 <= v9rch62943zz3l0yhn253lncb84a3z_272 ;
	end 
	if (rst) 
	begin 
	  wsj53k8pvzzx413x39idb9dyyvk093_655 <= 1'b0 ;
	 end 
	else 
	begin 
			wsj53k8pvzzx413x39idb9dyyvk093_655 <= gda9jbfnhbn2nnzf1ptzfe9l97qby1_351 ;
	end 
		init_done <= gp7m7a44m2uuj7018_315 ;
end

endmodule 
