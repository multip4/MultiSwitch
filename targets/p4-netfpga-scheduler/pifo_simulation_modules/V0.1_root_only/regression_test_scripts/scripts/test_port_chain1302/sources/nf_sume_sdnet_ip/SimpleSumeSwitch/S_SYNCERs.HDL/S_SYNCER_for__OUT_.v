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
// File name: S_SYNCER_for__OUT_.v
// File created: 2020/10/07 15:07:47
// Created by: Xilinx SDNet Compiler version 2018.2, build 2342300

//----------------------------------------------------------------------------

`timescale 1 ns / 100 ps

module S_SYNCER_for__OUT_ (
     packet_in_PACKET2_TVALID, 
     packet_in_PACKET2_TDATA, 
     packet_in_PACKET2_TKEEP, 
     packet_in_PACKET2_TLAST, 
     packet_out_PACKET2_TREADY, 
     tuple_in_TUPLE0_VALID, 
     tuple_in_TUPLE0_DATA, 
     tuple_in_TUPLE1_VALID, 
     tuple_in_TUPLE1_DATA, 
     backpressure_in, 


     packet_out_PACKET2_TVALID, 
     packet_out_PACKET2_TDATA, 
     packet_out_PACKET2_TKEEP, 
     packet_out_PACKET2_TLAST, 
     packet_in_PACKET2_TREADY, 
     tuple_out_TUPLE0_VALID, 
     tuple_out_TUPLE0_DATA, 
     tuple_out_TUPLE1_VALID, 
     tuple_out_TUPLE1_DATA, 
     backpressure_out, 

     clk_in_0, 
     clk_out_0, 
     clk_in_1, 
     clk_out_1, 
     clk_in_2, 
     clk_out_2, 
     rst_in_0, 
     rst_out_0, 
     rst_in_1, 
     rst_out_1, 
     rst_in_2, 
     rst_out_2 

);

//-------------------------------------------------------------
// I/O
//-------------------------------------------------------------
 input		packet_in_PACKET2_TVALID ;
 input	 [255:0] packet_in_PACKET2_TDATA ;
 input	 [31:0] packet_in_PACKET2_TKEEP ;
 input		packet_in_PACKET2_TLAST ;
 input		packet_out_PACKET2_TREADY ;
 input		tuple_in_TUPLE0_VALID ;
 input	 [255:0] tuple_in_TUPLE0_DATA ;
 input		tuple_in_TUPLE1_VALID ;
 input	 [159:0] tuple_in_TUPLE1_DATA ;
 input		backpressure_in ;
 output		packet_out_PACKET2_TVALID ;
 output	 [255:0] packet_out_PACKET2_TDATA ;
 output	 [31:0] packet_out_PACKET2_TKEEP ;
 output		packet_out_PACKET2_TLAST ;
 output		packet_in_PACKET2_TREADY ;
 output		tuple_out_TUPLE0_VALID ;
 output	 [255:0] tuple_out_TUPLE0_DATA ;
 output		tuple_out_TUPLE1_VALID ;
 output	 [159:0] tuple_out_TUPLE1_DATA ;
 output	reg	backpressure_out ;
 input		clk_in_0 ;
 input		clk_out_0 ;
 input		clk_in_1 ;
 input		clk_out_1 ;
 input		clk_in_2 ;
 input		clk_out_2 ;
 input		rst_in_0 ;
 input		rst_out_0 ;
 input		rst_in_1 ;
 input		rst_out_1 ;
 input		rst_in_2 ;
 input		rst_out_2 ;






 reg	yesearcl6g5q1b3j1vdeobiend167scn_278;	 initial yesearcl6g5q1b3j1vdeobiend167scn_278 = 1'b0 ;
 wire	dznnb94t3rcqpruq4q8tjj_189 ;
 wire [289:0] go7v0ttvb9ebk1xgfw0v5n9py7ow_83 ;
 wire	ub586wrmc7m9wuuurx7sphbrwyr55_662 ;
 wire	xyss2zt06rujjm87g93fhe7jfikti0_139 ;
 wire	jba1ciqs76d5h7uc41_110 ;
 wire [8:0] i1wfeuu9jv4fpvbaxyl72yeghfuhv_387 ;
 wire [8:0] jl26vidcfxmakyw63_170 ;
 wire	qbbc7qrhqpjv88cx0rgm9bjsq9pncu_802 ;
 wire	cw9dqg2xbib0wxutrwsynaafj_876 ;
 wire	gp2p9kinifx8ausx846i83_433 ;
 wire	mqycmunqpk1smskxamutgf9kkd86yr4_548 ;
 wire	odkmlfiw11zt81hb3helqmwr78ux5_549 ;
 wire	asorqqjpwurrcfcf2tgnxzw3gmr3gx_625 ;
 wire	fmq9quacj6lns23f_128 ;
 wire	csphkv3mb7d8vw7aj_374 ;
 wire	mb7fcxf3xjsyqbeescxrw1ksnq_657 ;
 wire	srf0ctn04nr7nmws7_723 ;
 wire	zj8o7d7d6otyjkhzlx4wr9f_108 ;
 reg	lvpw65nniwbialk31p6eabu7koxp_865;	 initial lvpw65nniwbialk31p6eabu7koxp_865 = 1'b0 ;
 wire	zgab4ibtzzck2m85vaybzpd07vs58s_0 ;
 reg	gtvnalutd53kmxq8jd0pce5c2par8_222;	 initial gtvnalutd53kmxq8jd0pce5c2par8_222 = 1'b0 ;
 reg	ip6tjncqjksg1zy7stlv7obwiywpi_245;	 initial ip6tjncqjksg1zy7stlv7obwiywpi_245 = 1'b0 ;
 wire	tohqvg1yrwov7fydc57q7vtsm75egr4t_202 ;
 wire [0:0] q1eldzg2hp2y1oqam8wvy7dilfwhzou_388 ;
 wire	mufkyf5cvwln62opwzslxodz_509 ;
 wire	un9crh1l9ndbp3roz8m0i1aw_238 ;
 wire	lg9yl0bo80gne73vjsyppt988dxffl5_238 ;
 wire [8:0] tdsy9yzi143wijdvt3_844 ;
 wire [8:0] vbfxtcs4uy5sua9kdhv_116 ;
 wire	b9jm1r6a0nrkmy4gu3gljw4eehhl_458 ;
 wire	x724d34gem6mv3tos1sj6xa1kp8t4_880 ;
 wire	fvvbx5nhw94jf1e9pjlizfv9uuf2h_430 ;
 wire	o8wc81bbfv0c0fh9cy21l4n_617 ;
 wire	vyqil9jw60fwwpe3a3xeed9f4th_294 ;
 wire	t0ylbfipyfh2wwi78rajayel8cwvf_844 ;
 wire	vydghy19vo731u3v68p3di_872 ;
 wire	br10m1n4oe3pskt2ggg_166 ;
 wire	wv8d4rbqdgxp6c95uygtx8g_592 ;
 wire	revy7p72nd9awsmx3h37eb9tp3_443 ;
 reg	tgpa4t618evwkc9x7gm_159;	 initial tgpa4t618evwkc9x7gm_159 = 1'b0 ;
 reg	bai9bpnb5iyja638h_810;	 initial bai9bpnb5iyja638h_810 = 1'b1 ;
 reg [8:0] ed4ku3c0l68l402od97j0v6jbq2jc_677;	 initial ed4ku3c0l68l402od97j0v6jbq2jc_677 = 9'b000000000 ;
 reg	ecgj69dphbf6a0863rj9hhi3vuuh6fh_270;	 initial ecgj69dphbf6a0863rj9hhi3vuuh6fh_270 = 1'b0 ;
 wire	fzmm0kvlu2x6bsgm_649 ;
 wire [255:0] m3ns720bqk5d57toityiga3_819 ;
 wire	n0f2pha00tkl3wptzhrvxs9rrxso6b_220 ;
 wire	qhx84j9kdlwzlvpiysx7_322 ;
 wire	esm1f7cjx8h9yakhdtk6220j0tnm_356 ;
 wire [7:0] i4tvzarq86psnhsbfrp_637 ;
 wire [7:0] z6t4qobw9yag1t3h9e_590 ;
 wire	pcqzytf37kjjn8h9q64h96ba_251 ;
 wire	y4q7xzbz5n2kiupu0irnoefhyyul_861 ;
 wire	r8okec0wmz8rcwf48gjp7buxm_34 ;
 wire	uq048chxwq2igpqfqku1gpudc4no0kq_776 ;
 wire	jvh961antky7lsdt374ly34cutic4bm_210 ;
 wire	q9n43j6l1dd5e47up_511 ;
 wire	bsmc92iawgyrhaf6c24qxc0ek_321 ;
 wire	em33c4xd9e0lcjcuj4m_319 ;
 wire	qpqzyicvnn43fnklnqdpkm5zwv1f_580 ;
 wire	o0uvtw1ynggeutn763wdojrjx98_775 ;
 wire	jzwzhntuz6bqlxfya_862 ;
 wire [159:0] mp61bai1zlvq0vxeay9f_872 ;
 wire	gg1q8nbmmdg2dyd0nmzcwbcgtwvj0_857 ;
 wire	a7d45bk4sqmoubbx6w8_860 ;
 wire	fsswr72oqd1r07vw42dshnd93_242 ;
 wire [7:0] or6c6y57arvy5g6pwytj320zxpuc4t_426 ;
 wire [7:0] uv02oxyof997t6uh39f3wd7g6_808 ;
 wire	fej8xe9v206lhv1rv5zjc60meriuce_503 ;
 wire	deogv3vo6mpg696a1fk531m8z_736 ;
 wire	zcnhp3jdr4njt2ke1iqes6yuj2pc3za_39 ;
 wire	mubut61fy9trpimaf7f1xjl5_745 ;
 wire	vqk6ht0c2e7ciedqs2ddamqodaaybio_234 ;
 wire	fb57ai9utiahdsnmyuqb8v6vdve_901 ;
 wire	ngd6c0ui5lbwtsyvpv94l_318 ;
 wire	dkpvz6b2ufwgd1euf5ft_676 ;
 wire	cfcn2y2eib7igmjd01mykd0ajvrsusry_390 ;
 wire	vgvi2shamalqhjxc57et3ev_577 ;
 reg	ntssrkps52fmaxlkv8fvtu_308;	 initial ntssrkps52fmaxlkv8fvtu_308 = 1'b0 ;
 reg	ltavhojekruefjcghapb4trtg1hmr_860;	 initial ltavhojekruefjcghapb4trtg1hmr_860 = 1'b0 ;
 reg	cvvhrygnbab1l697ij0l6d2sjuazln03_261;	 initial cvvhrygnbab1l697ij0l6d2sjuazln03_261 = 1'b0 ;
 wire	eap6axsf4v2e8ozpw0m3_555 ;
 wire [289:0] xsb4j4erutk0kjnepv52egx_294 ;
 wire	hufva9elarxkngc3n2rcbitfnu_767 ;
 wire [289:0] uqenv1jp515xqkpzrmru_823 ;
 wire	aem0ugfawm24rn7b8tx_710 ;
 wire	fisth9jmtlorrflpkk_609 ;
 wire	anei2xc46exfj29t2rkuozgzm0q4b6jw_33 ;
 wire	wysgmtvlvy5c7eckhs_349 ;
 wire	a99edfvi2r1r447bnwgk4dbh347sd72_533 ;
 wire	skj637rck2ptrcnpf_0 ;
 wire	mw365yhbpvfca4wwl8f_194 ;
 wire	ml8plr4g88znf7cibn6p34zc9rt4_47 ;
 wire	elktq0tonnzb65y8z49bkfvcquhqq_838 ;
 wire	n683mlse7tp3oivquweffgt_842 ;
 wire	i6v9swfdeg34l4s4v3o1heyh9rhnyl_449 ;
 wire	zqulsyttl6cmzhjr3_428 ;
 wire	r7cvw3oxz9w4zcomzh862ss7_751 ;
 wire	evciiib4es4ggosdo74_178 ;
 wire [31:0] n8d9uw5ltbulhiu3gvpqdzd5yqx_173 ;
 wire [255:0] xvbie7fa3m9yux9m752e8r_904 ;
 wire	f4nf1vpxxq883g7c3k17v4por_647 ;
 wire	hhqs01895l35yrgzkhrt7s26b0uv2_73 ;
 wire	to7hhirtmc5tbmjend_419 ;
 wire	tj1tb6clo38wxs7fxzm7c_194 ;
 wire	jdot6nx9mn2tebuinn_875 ;
 wire	jyl7ld4eelrhohws7u9rmryrgc77budf_284 ;
 wire	l5k9m5fquxdpnq2v3ya6a8bko_335 ;
 wire	wua3gs6j4ijx1jsi33ick_464 ;
 wire	d0rfibizh4cuhvnijvpl2qxyh5_577 ;
 wire	ziohmuynqc632p4wv1h6kect0t6x_422 ;
 wire	anocr8732s7n6pzcbxcfyxzo76_725 ;
 wire	sziz59hfh6dhbkio4s3fcjhqg2b1d_357 ;
 wire	i7lgn8tnfmjxe7owdbmdzxfz1ld_113 ;
 wire	cce1shwk4bzsp8ahduoq7_793 ;
 wire	gwla7uu3h38h2j6ie54jfnagse4p3kjx_11 ;
 wire	by1j8rkhjiubsi02nyf7yal3iajsd_716 ;
 wire [0:0] t1gh5bhe1a6nfa3cadx2v6a1_758 ;
 wire	v4ky0exxi98kfjaysfooajey_518 ;
 wire	hs1cdre8w9fz5rvq0e233m_792 ;
 wire [8:0] p7yz30zwocav1myj3vbhab21t31_339 ;
 wire	v5pf8jzdigibldakz8u_568 ;
 wire	h7xy5yihqbas9ootl9lg_653 ;
 wire	fbcb1kx5mkb7ubmt_806 ;
 wire	hrz5kxtnjo1aneoio1rl7jg8eton6hfh_88 ;
 wire	gfosig7numl89m98og3hx267rlzgrfil_471 ;
 wire	qk9v9joz0jmstrptv8mnis97_307 ;
 wire	j0y23hvogdif8so6x7tas8qnii2n5_731 ;
 wire [255:0] c5s6qjc95frvcvp1se68ncdn36no_441 ;
 wire	j381yh3n1k3bih8girzuy7xj79bryr3f_430 ;
 wire [255:0] mze3n4yisikbqxye6f_766 ;
 wire	cppc86i40n0zoxctgpudrf2_85 ;
 wire	uo8creu2r25dvzro98_898 ;
 wire	l48xy8yxlpepbqv05_857 ;
 wire [159:0] pjcccmf9otyctyx3akvp69_499 ;
 wire	a8wzwr5zwsl48w42sfatib_365 ;
 wire [159:0] zemar44iowrz7jln8hpfcwb_775 ;
 wire	ue35ph8ssr7nuhjhgtq8q_816 ;
 wire	rkkdleurv7am0gpdmq41a3mo7al8i7ic_91 ;
 wire	bm8doaa5kxxcom7ec_331 ;
 wire	ihedibsz6zm1ubjsjd1mqih760dz_308 ;
 wire	f2q3b4yhgnaui9cqmn_786 ;


 assign eap6axsf4v2e8ozpw0m3_555 = 
	 ~(backpressure_in) ;
 assign xsb4j4erutk0kjnepv52egx_294 = 
	{packet_in_PACKET2_TVALID, packet_in_PACKET2_TDATA, packet_in_PACKET2_TKEEP, packet_in_PACKET2_TLAST} ;
 assign hufva9elarxkngc3n2rcbitfnu_767 	= packet_in_PACKET2_TVALID ;
 assign uqenv1jp515xqkpzrmru_823 	= xsb4j4erutk0kjnepv52egx_294[289:0] ;
 assign aem0ugfawm24rn7b8tx_710 = 
	hrz5kxtnjo1aneoio1rl7jg8eton6hfh_88 | ihedibsz6zm1ubjsjd1mqih760dz_308 ;
 assign fisth9jmtlorrflpkk_609 = 
	1'b0 ;
 assign anei2xc46exfj29t2rkuozgzm0q4b6jw_33 = 
	1'b1 ;
 assign wysgmtvlvy5c7eckhs_349 = 
	 ~(zgab4ibtzzck2m85vaybzpd07vs58s_0) ;
 assign a99edfvi2r1r447bnwgk4dbh347sd72_533 = 
	qk9v9joz0jmstrptv8mnis97_307 & aem0ugfawm24rn7b8tx_710 & r7cvw3oxz9w4zcomzh862ss7_751 ;
 assign skj637rck2ptrcnpf_0 = 
	wysgmtvlvy5c7eckhs_349 & lvpw65nniwbialk31p6eabu7koxp_865 & r7cvw3oxz9w4zcomzh862ss7_751 & hrz5kxtnjo1aneoio1rl7jg8eton6hfh_88 & qk9v9joz0jmstrptv8mnis97_307 ;
 assign mw365yhbpvfca4wwl8f_194 = 
	a99edfvi2r1r447bnwgk4dbh347sd72_533 | skj637rck2ptrcnpf_0 ;
 assign ml8plr4g88znf7cibn6p34zc9rt4_47 = 
	eap6axsf4v2e8ozpw0m3_555 & mw365yhbpvfca4wwl8f_194 ;
 assign elktq0tonnzb65y8z49bkfvcquhqq_838 = 
	backpressure_in & yesearcl6g5q1b3j1vdeobiend167scn_278 & qk9v9joz0jmstrptv8mnis97_307 & fbcb1kx5mkb7ubmt_806 & ihedibsz6zm1ubjsjd1mqih760dz_308 & wysgmtvlvy5c7eckhs_349 ;
 assign n683mlse7tp3oivquweffgt_842 = 
	ml8plr4g88znf7cibn6p34zc9rt4_47 | elktq0tonnzb65y8z49bkfvcquhqq_838 ;
 assign i6v9swfdeg34l4s4v3o1heyh9rhnyl_449 	= n683mlse7tp3oivquweffgt_842 ;
 assign zqulsyttl6cmzhjr3_428 = 
	1'b0 ;
 assign r7cvw3oxz9w4zcomzh862ss7_751 = 
	 ~(ub586wrmc7m9wuuurx7sphbrwyr55_662) ;
 assign evciiib4es4ggosdo74_178 	= go7v0ttvb9ebk1xgfw0v5n9py7ow_83[0] ;
 assign n8d9uw5ltbulhiu3gvpqdzd5yqx_173 	= go7v0ttvb9ebk1xgfw0v5n9py7ow_83[32:1] ;
 assign xvbie7fa3m9yux9m752e8r_904 	= go7v0ttvb9ebk1xgfw0v5n9py7ow_83[288:33] ;
 assign f4nf1vpxxq883g7c3k17v4por_647 	= go7v0ttvb9ebk1xgfw0v5n9py7ow_83[289] ;
 assign hhqs01895l35yrgzkhrt7s26b0uv2_73 = 
	yesearcl6g5q1b3j1vdeobiend167scn_278 | ip6tjncqjksg1zy7stlv7obwiywpi_245 ;
 assign to7hhirtmc5tbmjend_419 = 
	gtvnalutd53kmxq8jd0pce5c2par8_222 | r7cvw3oxz9w4zcomzh862ss7_751 ;
 assign tj1tb6clo38wxs7fxzm7c_194 = 
	to7hhirtmc5tbmjend_419 & qk9v9joz0jmstrptv8mnis97_307 & aem0ugfawm24rn7b8tx_710 ;
 assign jdot6nx9mn2tebuinn_875 = 
	tj1tb6clo38wxs7fxzm7c_194 | lvpw65nniwbialk31p6eabu7koxp_865 ;
 assign jyl7ld4eelrhohws7u9rmryrgc77budf_284 = 
	backpressure_in & f4nf1vpxxq883g7c3k17v4por_647 & jdot6nx9mn2tebuinn_875 ;
 assign l5k9m5fquxdpnq2v3ya6a8bko_335 = 
	fbcb1kx5mkb7ubmt_806 & ecgj69dphbf6a0863rj9hhi3vuuh6fh_270 ;
 assign wua3gs6j4ijx1jsi33ick_464 = 
	l5k9m5fquxdpnq2v3ya6a8bko_335 | hrz5kxtnjo1aneoio1rl7jg8eton6hfh_88 | evciiib4es4ggosdo74_178 ;
 assign d0rfibizh4cuhvnijvpl2qxyh5_577 = 
	eap6axsf4v2e8ozpw0m3_555 & lvpw65nniwbialk31p6eabu7koxp_865 & f4nf1vpxxq883g7c3k17v4por_647 & wua3gs6j4ijx1jsi33ick_464 ;
 assign ziohmuynqc632p4wv1h6kect0t6x_422 	= lvpw65nniwbialk31p6eabu7koxp_865 ;
 assign anocr8732s7n6pzcbxcfyxzo76_725 	= packet_in_PACKET2_TVALID ;
 assign sziz59hfh6dhbkio4s3fcjhqg2b1d_357 = 
	1'b0 ;
 assign i7lgn8tnfmjxe7owdbmdzxfz1ld_113 = 
	1'b1 ;
 assign cce1shwk4bzsp8ahduoq7_793 = (
	((tgpa4t618evwkc9x7gm_159 == 1'b1) && (packet_in_PACKET2_TVALID == 1'b1))?1'b1:
	((bai9bpnb5iyja638h_810 == 1'b1) && (packet_in_PACKET2_TVALID == 1'b1))?1'b1:
	0)  ;
 assign gwla7uu3h38h2j6ie54jfnagse4p3kjx_11 = (
	((packet_in_PACKET2_TVALID == 1'b1) && (packet_in_PACKET2_TLAST == 1'b1))?1'b1:
	0)  ;
 assign by1j8rkhjiubsi02nyf7yal3iajsd_716 = (
	((packet_in_PACKET2_TVALID == 1'b1) && (packet_in_PACKET2_TLAST == 1'b0))?1'b1:
	0)  ;
 assign t1gh5bhe1a6nfa3cadx2v6a1_758 = cce1shwk4bzsp8ahduoq7_793 ;
 assign v4ky0exxi98kfjaysfooajey_518 	= n683mlse7tp3oivquweffgt_842 ;
 assign hs1cdre8w9fz5rvq0e233m_792 = 
	1'b0 ;
 assign p7yz30zwocav1myj3vbhab21t31_339 	= tdsy9yzi143wijdvt3_844[8:0] ;
 assign v5pf8jzdigibldakz8u_568 = (
	((p7yz30zwocav1myj3vbhab21t31_339 != ed4ku3c0l68l402od97j0v6jbq2jc_677))?1'b1:
	0)  ;
 assign h7xy5yihqbas9ootl9lg_653 = q1eldzg2hp2y1oqam8wvy7dilfwhzou_388 ;
 assign fbcb1kx5mkb7ubmt_806 = q1eldzg2hp2y1oqam8wvy7dilfwhzou_388 ;
 assign hrz5kxtnjo1aneoio1rl7jg8eton6hfh_88 = 
	 ~(fbcb1kx5mkb7ubmt_806) ;
 assign gfosig7numl89m98og3hx267rlzgrfil_471 	= mufkyf5cvwln62opwzslxodz_509 ;
 assign qk9v9joz0jmstrptv8mnis97_307 = 
	 ~(mufkyf5cvwln62opwzslxodz_509) ;
 assign j0y23hvogdif8so6x7tas8qnii2n5_731 = 
	ihedibsz6zm1ubjsjd1mqih760dz_308 & qk9v9joz0jmstrptv8mnis97_307 & h7xy5yihqbas9ootl9lg_653 & n683mlse7tp3oivquweffgt_842 ;
 assign c5s6qjc95frvcvp1se68ncdn36no_441 = 
	tuple_in_TUPLE0_DATA ;
 assign j381yh3n1k3bih8girzuy7xj79bryr3f_430 	= tuple_in_TUPLE0_VALID ;
 assign mze3n4yisikbqxye6f_766 	= c5s6qjc95frvcvp1se68ncdn36no_441[255:0] ;
 assign cppc86i40n0zoxctgpudrf2_85 = 
	 ~(n0f2pha00tkl3wptzhrvxs9rrxso6b_220) ;
 assign uo8creu2r25dvzro98_898 	= j0y23hvogdif8so6x7tas8qnii2n5_731 ;
 assign l48xy8yxlpepbqv05_857 = 
	1'b0 ;
 assign pjcccmf9otyctyx3akvp69_499 = 
	tuple_in_TUPLE1_DATA ;
 assign a8wzwr5zwsl48w42sfatib_365 	= tuple_in_TUPLE1_VALID ;
 assign zemar44iowrz7jln8hpfcwb_775 	= pjcccmf9otyctyx3akvp69_499[159:0] ;
 assign ue35ph8ssr7nuhjhgtq8q_816 = 
	 ~(gg1q8nbmmdg2dyd0nmzcwbcgtwvj0_857) ;
 assign rkkdleurv7am0gpdmq41a3mo7al8i7ic_91 	= j0y23hvogdif8so6x7tas8qnii2n5_731 ;
 assign bm8doaa5kxxcom7ec_331 = 
	1'b0 ;
 assign ihedibsz6zm1ubjsjd1mqih760dz_308 = 
	r7cvw3oxz9w4zcomzh862ss7_751 & cppc86i40n0zoxctgpudrf2_85 & ue35ph8ssr7nuhjhgtq8q_816 ;
 assign f2q3b4yhgnaui9cqmn_786 = 
	ntssrkps52fmaxlkv8fvtu_308 | ltavhojekruefjcghapb4trtg1hmr_860 | cvvhrygnbab1l697ij0l6d2sjuazln03_261 ;
 assign packet_out_PACKET2_TVALID 	= ziohmuynqc632p4wv1h6kect0t6x_422 ;
 assign packet_out_PACKET2_TDATA 	= xvbie7fa3m9yux9m752e8r_904[255:0] ;
 assign packet_out_PACKET2_TKEEP 	= n8d9uw5ltbulhiu3gvpqdzd5yqx_173[31:0] ;
 assign packet_out_PACKET2_TLAST 	= evciiib4es4ggosdo74_178 ;
 assign packet_in_PACKET2_TREADY 	= packet_out_PACKET2_TREADY ;
 assign tuple_out_TUPLE0_VALID 	= ecgj69dphbf6a0863rj9hhi3vuuh6fh_270 ;
 assign tuple_out_TUPLE0_DATA 	= m3ns720bqk5d57toityiga3_819[255:0] ;
 assign tuple_out_TUPLE1_VALID 	= ecgj69dphbf6a0863rj9hhi3vuuh6fh_270 ;
 assign tuple_out_TUPLE1_DATA 	= mp61bai1zlvq0vxeay9f_872[159:0] ;


assign zj8o7d7d6otyjkhzlx4wr9f_108 = (
	((n683mlse7tp3oivquweffgt_842 == 1'b1))?anei2xc46exfj29t2rkuozgzm0q4b6jw_33 :
	((eap6axsf4v2e8ozpw0m3_555 == 1'b1))?fisth9jmtlorrflpkk_609 :
	lvpw65nniwbialk31p6eabu7koxp_865 ) ;

assign zgab4ibtzzck2m85vaybzpd07vs58s_0 = (
	((lvpw65nniwbialk31p6eabu7koxp_865 == 1'b1) && (eap6axsf4v2e8ozpw0m3_555 == 1'b1))?fisth9jmtlorrflpkk_609 :
	lvpw65nniwbialk31p6eabu7koxp_865 ) ;



always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	yesearcl6g5q1b3j1vdeobiend167scn_278 <= 1'b0 ;
	lvpw65nniwbialk31p6eabu7koxp_865 <= 1'b0 ;
	gtvnalutd53kmxq8jd0pce5c2par8_222 <= 1'b0 ;
	ip6tjncqjksg1zy7stlv7obwiywpi_245 <= 1'b0 ;
	ed4ku3c0l68l402od97j0v6jbq2jc_677 <= 9'b000000000 ;
	ntssrkps52fmaxlkv8fvtu_308 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		yesearcl6g5q1b3j1vdeobiend167scn_278 <= backpressure_in ;
		lvpw65nniwbialk31p6eabu7koxp_865 <= zj8o7d7d6otyjkhzlx4wr9f_108 ;
		gtvnalutd53kmxq8jd0pce5c2par8_222 <= r7cvw3oxz9w4zcomzh862ss7_751 ;
		ip6tjncqjksg1zy7stlv7obwiywpi_245 <= n683mlse7tp3oivquweffgt_842 ;
		ed4ku3c0l68l402od97j0v6jbq2jc_677 <= p7yz30zwocav1myj3vbhab21t31_339 ;
		ntssrkps52fmaxlkv8fvtu_308 <= xyss2zt06rujjm87g93fhe7jfikti0_139 ;
		backpressure_out <= f2q3b4yhgnaui9cqmn_786 ;
  end
end

always @(posedge clk_in_0)
begin
  if (rst_in_0) 
  begin
	tgpa4t618evwkc9x7gm_159 <= 1'b0 ;
	bai9bpnb5iyja638h_810 <= 1'b1 ;
   end
  else
  begin
	if (by1j8rkhjiubsi02nyf7yal3iajsd_716) 
	begin 
	  tgpa4t618evwkc9x7gm_159 <= 1'b0 ;
	 end 
	else 
	begin 
		if (gwla7uu3h38h2j6ie54jfnagse4p3kjx_11) 
		begin 
			tgpa4t618evwkc9x7gm_159 <= i7lgn8tnfmjxe7owdbmdzxfz1ld_113 ;
		end 
	end 
	if (cce1shwk4bzsp8ahduoq7_793) 
	begin 
		bai9bpnb5iyja638h_810 <= sziz59hfh6dhbkio4s3fcjhqg2b1d_357 ;
	end 
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	ecgj69dphbf6a0863rj9hhi3vuuh6fh_270 <= 1'b0 ;
	ltavhojekruefjcghapb4trtg1hmr_860 <= 1'b0 ;
   end
  else
  begin
		ecgj69dphbf6a0863rj9hhi3vuuh6fh_270 <= j0y23hvogdif8so6x7tas8qnii2n5_731 ;
		ltavhojekruefjcghapb4trtg1hmr_860 <= qhx84j9kdlwzlvpiysx7_322 ;
  end
end

always @(posedge clk_out_2)
begin
  if (rst_in_0) 
  begin
	cvvhrygnbab1l697ij0l6d2sjuazln03_261 <= 1'b0 ;
   end
  else
  begin
		cvvhrygnbab1l697ij0l6d2sjuazln03_261 <= a7d45bk4sqmoubbx6w8_860 ;
  end
end

defparam mvw77k50wu5eusfhs3f24cv0su_1267.WRITE_DATA_WIDTH = 290; 
defparam mvw77k50wu5eusfhs3f24cv0su_1267.FIFO_WRITE_DEPTH = 512; 
defparam mvw77k50wu5eusfhs3f24cv0su_1267.PROG_FULL_THRESH = 177; 
defparam mvw77k50wu5eusfhs3f24cv0su_1267.PROG_EMPTY_THRESH = 177; 
defparam mvw77k50wu5eusfhs3f24cv0su_1267.READ_MODE = "STD"; 
defparam mvw77k50wu5eusfhs3f24cv0su_1267.WR_DATA_COUNT_WIDTH = 9; 
defparam mvw77k50wu5eusfhs3f24cv0su_1267.RD_DATA_COUNT_WIDTH = 9; 
defparam mvw77k50wu5eusfhs3f24cv0su_1267.DOUT_RESET_VALUE = "0"; 
defparam mvw77k50wu5eusfhs3f24cv0su_1267.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_sync mvw77k50wu5eusfhs3f24cv0su_1267 (
	.wr_en(hufva9elarxkngc3n2rcbitfnu_767),
	.din(uqenv1jp515xqkpzrmru_823),
	.rd_en(i6v9swfdeg34l4s4v3o1heyh9rhnyl_449),
	.sleep(zqulsyttl6cmzhjr3_428),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(dznnb94t3rcqpruq4q8tjj_189), 
	.dout(go7v0ttvb9ebk1xgfw0v5n9py7ow_83), 
	.empty(ub586wrmc7m9wuuurx7sphbrwyr55_662), 
	.prog_full(xyss2zt06rujjm87g93fhe7jfikti0_139), 
	.full(jba1ciqs76d5h7uc41_110), 
	.rd_data_count(i1wfeuu9jv4fpvbaxyl72yeghfuhv_387), 
	.wr_data_count(jl26vidcfxmakyw63_170), 
	.wr_rst_busy(qbbc7qrhqpjv88cx0rgm9bjsq9pncu_802), 
	.rd_rst_busy(cw9dqg2xbib0wxutrwsynaafj_876), 
	.overflow(gp2p9kinifx8ausx846i83_433), 
	.underflow(mqycmunqpk1smskxamutgf9kkd86yr4_548), 
	.sbiterr(odkmlfiw11zt81hb3helqmwr78ux5_549), 
	.dbiterr(asorqqjpwurrcfcf2tgnxzw3gmr3gx_625), 
	.almost_empty(fmq9quacj6lns23f_128), 
	.almost_full(csphkv3mb7d8vw7aj_374), 
	.wr_ack(mb7fcxf3xjsyqbeescxrw1ksnq_657), 
	.data_valid(srf0ctn04nr7nmws7_723), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam gokatjjmfkc2w4f1xzpazo2978ijfxo_1103.WRITE_DATA_WIDTH = 1; 
defparam gokatjjmfkc2w4f1xzpazo2978ijfxo_1103.FIFO_WRITE_DEPTH = 512; 
defparam gokatjjmfkc2w4f1xzpazo2978ijfxo_1103.PROG_FULL_THRESH = 177; 
defparam gokatjjmfkc2w4f1xzpazo2978ijfxo_1103.PROG_EMPTY_THRESH = 177; 
defparam gokatjjmfkc2w4f1xzpazo2978ijfxo_1103.READ_MODE = "FWFT"; 
defparam gokatjjmfkc2w4f1xzpazo2978ijfxo_1103.WR_DATA_COUNT_WIDTH = 9; 
defparam gokatjjmfkc2w4f1xzpazo2978ijfxo_1103.RD_DATA_COUNT_WIDTH = 9; 
defparam gokatjjmfkc2w4f1xzpazo2978ijfxo_1103.DOUT_RESET_VALUE = "0"; 
defparam gokatjjmfkc2w4f1xzpazo2978ijfxo_1103.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_sync gokatjjmfkc2w4f1xzpazo2978ijfxo_1103 (
	.wr_en(anocr8732s7n6pzcbxcfyxzo76_725),
	.din(t1gh5bhe1a6nfa3cadx2v6a1_758),
	.rd_en(v4ky0exxi98kfjaysfooajey_518),
	.sleep(hs1cdre8w9fz5rvq0e233m_792),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(tohqvg1yrwov7fydc57q7vtsm75egr4t_202), 
	.dout(q1eldzg2hp2y1oqam8wvy7dilfwhzou_388), 
	.empty(mufkyf5cvwln62opwzslxodz_509), 
	.prog_full(un9crh1l9ndbp3roz8m0i1aw_238), 
	.full(lg9yl0bo80gne73vjsyppt988dxffl5_238), 
	.rd_data_count(tdsy9yzi143wijdvt3_844), 
	.wr_data_count(vbfxtcs4uy5sua9kdhv_116), 
	.wr_rst_busy(b9jm1r6a0nrkmy4gu3gljw4eehhl_458), 
	.rd_rst_busy(x724d34gem6mv3tos1sj6xa1kp8t4_880), 
	.overflow(fvvbx5nhw94jf1e9pjlizfv9uuf2h_430), 
	.underflow(o8wc81bbfv0c0fh9cy21l4n_617), 
	.sbiterr(vyqil9jw60fwwpe3a3xeed9f4th_294), 
	.dbiterr(t0ylbfipyfh2wwi78rajayel8cwvf_844), 
	.almost_empty(vydghy19vo731u3v68p3di_872), 
	.almost_full(br10m1n4oe3pskt2ggg_166), 
	.wr_ack(wv8d4rbqdgxp6c95uygtx8g_592), 
	.data_valid(revy7p72nd9awsmx3h37eb9tp3_443), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam lohq29vyswbfmj317mn5s6t69_1559.WRITE_DATA_WIDTH = 256; 
defparam lohq29vyswbfmj317mn5s6t69_1559.FIFO_WRITE_DEPTH = 256; 
defparam lohq29vyswbfmj317mn5s6t69_1559.PROG_FULL_THRESH = 66; 
defparam lohq29vyswbfmj317mn5s6t69_1559.PROG_EMPTY_THRESH = 66; 
defparam lohq29vyswbfmj317mn5s6t69_1559.READ_MODE = "STD"; 
defparam lohq29vyswbfmj317mn5s6t69_1559.WR_DATA_COUNT_WIDTH = 8; 
defparam lohq29vyswbfmj317mn5s6t69_1559.RD_DATA_COUNT_WIDTH = 8; 
defparam lohq29vyswbfmj317mn5s6t69_1559.DOUT_RESET_VALUE = "0"; 
defparam lohq29vyswbfmj317mn5s6t69_1559.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async lohq29vyswbfmj317mn5s6t69_1559 (
	.wr_en(j381yh3n1k3bih8girzuy7xj79bryr3f_430),
	.din(mze3n4yisikbqxye6f_766),
	.rd_en(uo8creu2r25dvzro98_898),
	.sleep(l48xy8yxlpepbqv05_857),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(fzmm0kvlu2x6bsgm_649), 
	.dout(m3ns720bqk5d57toityiga3_819), 
	.empty(n0f2pha00tkl3wptzhrvxs9rrxso6b_220), 
	.prog_full(qhx84j9kdlwzlvpiysx7_322), 
	.full(esm1f7cjx8h9yakhdtk6220j0tnm_356), 
	.rd_data_count(i4tvzarq86psnhsbfrp_637), 
	.wr_data_count(z6t4qobw9yag1t3h9e_590), 
	.wr_rst_busy(pcqzytf37kjjn8h9q64h96ba_251), 
	.rd_rst_busy(y4q7xzbz5n2kiupu0irnoefhyyul_861), 
	.overflow(r8okec0wmz8rcwf48gjp7buxm_34), 
	.underflow(uq048chxwq2igpqfqku1gpudc4no0kq_776), 
	.sbiterr(jvh961antky7lsdt374ly34cutic4bm_210), 
	.dbiterr(q9n43j6l1dd5e47up_511), 
	.almost_empty(bsmc92iawgyrhaf6c24qxc0ek_321), 
	.almost_full(em33c4xd9e0lcjcuj4m_319), 
	.wr_ack(qpqzyicvnn43fnklnqdpkm5zwv1f_580), 
	.data_valid(o0uvtw1ynggeutn763wdojrjx98_775), 

	.wr_clk(clk_in_1), 

	.rd_clk(clk_out_1), 
	.rst(rst_in_1) 
); 

defparam teta80rnpdwljtiy5ke0x_2368.WRITE_DATA_WIDTH = 160; 
defparam teta80rnpdwljtiy5ke0x_2368.FIFO_WRITE_DEPTH = 256; 
defparam teta80rnpdwljtiy5ke0x_2368.PROG_FULL_THRESH = 66; 
defparam teta80rnpdwljtiy5ke0x_2368.PROG_EMPTY_THRESH = 66; 
defparam teta80rnpdwljtiy5ke0x_2368.READ_MODE = "STD"; 
defparam teta80rnpdwljtiy5ke0x_2368.WR_DATA_COUNT_WIDTH = 8; 
defparam teta80rnpdwljtiy5ke0x_2368.RD_DATA_COUNT_WIDTH = 8; 
defparam teta80rnpdwljtiy5ke0x_2368.DOUT_RESET_VALUE = "0"; 
defparam teta80rnpdwljtiy5ke0x_2368.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async teta80rnpdwljtiy5ke0x_2368 (
	.wr_en(a8wzwr5zwsl48w42sfatib_365),
	.din(zemar44iowrz7jln8hpfcwb_775),
	.rd_en(rkkdleurv7am0gpdmq41a3mo7al8i7ic_91),
	.sleep(bm8doaa5kxxcom7ec_331),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(jzwzhntuz6bqlxfya_862), 
	.dout(mp61bai1zlvq0vxeay9f_872), 
	.empty(gg1q8nbmmdg2dyd0nmzcwbcgtwvj0_857), 
	.prog_full(a7d45bk4sqmoubbx6w8_860), 
	.full(fsswr72oqd1r07vw42dshnd93_242), 
	.rd_data_count(or6c6y57arvy5g6pwytj320zxpuc4t_426), 
	.wr_data_count(uv02oxyof997t6uh39f3wd7g6_808), 
	.wr_rst_busy(fej8xe9v206lhv1rv5zjc60meriuce_503), 
	.rd_rst_busy(deogv3vo6mpg696a1fk531m8z_736), 
	.overflow(zcnhp3jdr4njt2ke1iqes6yuj2pc3za_39), 
	.underflow(mubut61fy9trpimaf7f1xjl5_745), 
	.sbiterr(vqk6ht0c2e7ciedqs2ddamqodaaybio_234), 
	.dbiterr(fb57ai9utiahdsnmyuqb8v6vdve_901), 
	.almost_empty(ngd6c0ui5lbwtsyvpv94l_318), 
	.almost_full(dkpvz6b2ufwgd1euf5ft_676), 
	.wr_ack(cfcn2y2eib7igmjd01mykd0ajvrsusry_390), 
	.data_valid(vgvi2shamalqhjxc57et3ev_577), 

	.wr_clk(clk_in_2), 

	.rd_clk(clk_out_2), 
	.rst(rst_in_2) 
); 

endmodule 
