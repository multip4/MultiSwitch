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
// File name: S_SYNCER_for_TopParser.v
// File created: 2019/12/09 21:12:16
// Created by: Xilinx SDNet Compiler version 2018.2, build 2342300

//----------------------------------------------------------------------------

`timescale 1 ns / 100 ps

module S_SYNCER_for_TopParser (
     packet_in_PACKET2_SOF, 
     packet_in_PACKET2_EOF, 
     packet_in_PACKET2_VAL, 
     packet_in_PACKET2_DAT, 
     packet_in_PACKET2_CNT, 
     packet_in_PACKET2_ERR, 
     packet_out_PACKET2_RDY, 
     tuple_in_TUPLE0_VALID, 
     tuple_in_TUPLE0_DATA, 
     tuple_in_TUPLE1_VALID, 
     tuple_in_TUPLE1_DATA, 
     backpressure_in, 


     packet_out_PACKET2_SOF, 
     packet_out_PACKET2_EOF, 
     packet_out_PACKET2_VAL, 
     packet_out_PACKET2_DAT, 
     packet_out_PACKET2_CNT, 
     packet_out_PACKET2_ERR, 
     packet_in_PACKET2_RDY, 
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
 input		packet_in_PACKET2_SOF ;
 input		packet_in_PACKET2_EOF ;
 input		packet_in_PACKET2_VAL ;
 input	 [255:0] packet_in_PACKET2_DAT ;
 input	 [5:0] packet_in_PACKET2_CNT ;
 input		packet_in_PACKET2_ERR ;
 input		packet_out_PACKET2_RDY ;
 input		tuple_in_TUPLE0_VALID ;
 input	 [159:0] tuple_in_TUPLE0_DATA ;
 input		tuple_in_TUPLE1_VALID ;
 input	 [20:0] tuple_in_TUPLE1_DATA ;
 input		backpressure_in ;
 output		packet_out_PACKET2_SOF ;
 output		packet_out_PACKET2_EOF ;
 output		packet_out_PACKET2_VAL ;
 output	 [255:0] packet_out_PACKET2_DAT ;
 output	 [5:0] packet_out_PACKET2_CNT ;
 output		packet_out_PACKET2_ERR ;
 output		packet_in_PACKET2_RDY ;
 output		tuple_out_TUPLE0_VALID ;
 output	 [159:0] tuple_out_TUPLE0_DATA ;
 output		tuple_out_TUPLE1_VALID ;
 output	 [20:0] tuple_out_TUPLE1_DATA ;
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






 reg	cqj21ezznpumn1o7n0_88;	 initial cqj21ezznpumn1o7n0_88 = 1'b0 ;
 wire	vgqzvlzzy0yg9sttljy5_89 ;
 wire [265:0] uu554qz8zunzwumam8aazd1k_448 ;
 wire	rhf54uorrad3hynubtmk6ppiirteaai_662 ;
 wire	jfogc4riyk4xwlobwk69kz4qg_396 ;
 wire	tq2ip3oci6mg49bu0ovnrk5ac7_521 ;
 wire [8:0] l6axzsfohime3kmips7cl0_165 ;
 wire [8:0] nclgqncsngdbwc4req67p3_532 ;
 wire	qwehl1vvpz287sf4gmppg_130 ;
 wire	qa8ga4eb8eeqxrqbbna0_828 ;
 wire	upiyj2rhkcij48ipgxcygl48skqp_738 ;
 wire	y4jpyqucyipuftekn4xeo_868 ;
 wire	qjf3cglygkm5n5j1_102 ;
 wire	xizaun5hwlhtc6lu2i1cygqdf_686 ;
 wire	l8yigk8qbkmyk5ed78w_459 ;
 wire	el0yvx4zxl65exig9u0ymjkupejtty1_677 ;
 wire	xoqufn6acg3fcqlceyk_77 ;
 wire	kiovki3kdqjbg3yey_105 ;
 wire	hrfmql0gomvkjxcpcn7qx7oo_196 ;
 reg	ar8xntzh86m95nizvuv414593n4y_248;	 initial ar8xntzh86m95nizvuv414593n4y_248 = 1'b0 ;
 wire	m0dani2mpmjwxh9jpvdr191d1r_265 ;
 reg	bwffawe39yy4skplvleqwvw0g1woay_8;	 initial bwffawe39yy4skplvleqwvw0g1woay_8 = 1'b0 ;
 reg	ml2z3lyqiey842kes3xfz7gea_902;	 initial ml2z3lyqiey842kes3xfz7gea_902 = 1'b0 ;
 wire	xjvf3fjdrma9pxrcy52_253 ;
 wire [0:0] wetdpuqo7enswh7getfg19hagb2rtlaa_566 ;
 wire	g673lax3rf220hnpose8e5ghjwoe_792 ;
 wire	qoscmjrzloqw642v_119 ;
 wire	afffd9hbmc0dle6qoi4jnyozn0w_855 ;
 wire [8:0] u94665epl5hsbwm69wf76jr2xb_620 ;
 wire [8:0] oi115pcbzbleicfbxjlb0v8vzd4nbrjw_161 ;
 wire	oyvux1x9z9vlao4yhuf_90 ;
 wire	p4bbyg35djbyr59kxzi4ro5tn_636 ;
 wire	c3ej481bbuljj45vvi_219 ;
 wire	ztqhc1prd7v4n1iai9ps5u8bpf_413 ;
 wire	filz36oei52g0rdupnvcw_54 ;
 wire	u1okr660p2fdks4xutu7c2_77 ;
 wire	zb0h6mlkjcbarimmc03p32txkj4_1 ;
 wire	as3yx9493cspw41638kftmdw7_587 ;
 wire	nfw94p17pfqgle7ij8flrnq5_315 ;
 wire	o9gekl9yb4zl16yhoc_498 ;
 reg [8:0] jet3c2sqycrb4m41cv98tkj7f94f_816;	 initial jet3c2sqycrb4m41cv98tkj7f94f_816 = 9'b000000000 ;
 reg	m8j5ocplirla1y3g4p0fv_144;	 initial m8j5ocplirla1y3g4p0fv_144 = 1'b0 ;
 wire	urw3hs8j2rit7250vjk3xn_328 ;
 wire [159:0] cwvva0ql2y8lnpsq4aei23_274 ;
 wire	gutwfo8ggfu0atyqbqa1p_95 ;
 wire	eqvayi8joc5b36yaqg2_822 ;
 wire	cjkwhmncdzsbgpe1_260 ;
 wire [7:0] m2qfwjz8bce90jj2c_268 ;
 wire [7:0] yktwl3dzud5b9kkq_626 ;
 wire	ca036u9c8orj9ch9qbd8ryby7ahu_454 ;
 wire	hwqqky6puim2wd3foz08fxt_401 ;
 wire	k8oeoe4wlzcaxevc3t0c7k_32 ;
 wire	jkzps7d7q2ua2qdo7inb7cudrpf7_639 ;
 wire	r8jfmmecm8m3ls4radp90nu3juz9fc_876 ;
 wire	f410xkggtupyau3vc5yw0uccjo4w_323 ;
 wire	ucv5uc61qidh86pkcwoxv8dj_659 ;
 wire	oj3yzmthuikegcoe5w2bb9ass7_461 ;
 wire	r5qs3b4jsxrzkvhvfarru6fcylw9aag_263 ;
 wire	z2mldworv4jdb9cyztqqc_458 ;
 wire	ukjpt4gk2vvfuw8bc_453 ;
 wire [20:0] qdqrl9dhm8h3l5naiedwwr2q1040ztz_512 ;
 wire	ie1i2tlv1ioq1vnvoo3_566 ;
 wire	ncoel2re6k840f3x3pswdgy_906 ;
 wire	dj08pig7ntfyjnruxyyro_315 ;
 wire [7:0] pdi4av4qsa9v0h0vbd_50 ;
 wire [7:0] kyieymfhubab2pe6e_60 ;
 wire	ol0r13el9xc2af1twaj_569 ;
 wire	lbu99bl5psu78dhyx99po3n_496 ;
 wire	ga1ggquov4u3kcc8h1_750 ;
 wire	vsrljfcq3ox5571r49ac39lexp9_487 ;
 wire	w6o3ohkt6n3b41l1kyyvfg6wdlq_515 ;
 wire	r28j8r7wx6mv8v108ysp42_809 ;
 wire	fnhar501bdq3gh66tqg_511 ;
 wire	hft7tcrdyltq8hlb1ws4fb6xbnaft72_746 ;
 wire	sct112fn2uyzm5g0kjjtn_528 ;
 wire	es99i2kpzm56fkiexr92nw9jae0_195 ;
 reg	xzw99ca7suzbl8iwo7i3qrh3mgr8_853;	 initial xzw99ca7suzbl8iwo7i3qrh3mgr8_853 = 1'b0 ;
 reg	t5vp0vig8g1rojjt83v_115;	 initial t5vp0vig8g1rojjt83v_115 = 1'b0 ;
 reg	fag7x5lgmnx8dqrvr6eijshekd8u5ud7_265;	 initial fag7x5lgmnx8dqrvr6eijshekd8u5ud7_265 = 1'b0 ;
 wire	dor42oo0k1t4kgw3mrhxgfjay63xrkp8_190 ;
 wire [265:0] ji0xaxmxvdcdtif1tryt7tnt2os46_851 ;
 wire	p1fd50sce637q9z1jn271imi986i_770 ;
 wire [265:0] bpxogat3jsz0ir4rf0h2spzt2_233 ;
 wire	eq85m0dsr4oi1lihe9ovchzxihgslys_381 ;
 wire	abz6uih4vaq5k0n71m6ycliouyd0a_893 ;
 wire	mq98jk15kfjlx6fx3usv_328 ;
 wire	g3x0pdczns5kuo8zeothp_522 ;
 wire	jfiu2622kfbw72s8wu_122 ;
 wire	xd2h0tane9d08kuojc6b9y_487 ;
 wire	y6ycc8q7wf4quuitnmrhsr9p_106 ;
 wire	i8wm21yfz3632b5q438ps06_577 ;
 wire	uamz22mx96vf5ekzjeg_639 ;
 wire	oupvpy9ozn77w9od4l_768 ;
 wire [5:0] su4dvo1h88ai8666fqpzn_292 ;
 wire [255:0] wbav3ziqo59px9xq09_12 ;
 wire	ck2nlkqnglzy80ro41wiitatwspp_849 ;
 wire	hhv8cxp6od46c0zj29e57_696 ;
 wire	xbbvmripg8xjyib7t_405 ;
 wire	z2ycgg15fmfyxc8g8bbhz423u_578 ;
 wire	gx8ahoedcvde4gofxxch9thr_132 ;
 wire [0:0] yhsajudo7l1fauwhkg00_362 ;
 wire	h2bobvkupq6q37wd4x9e9hgqdu_583 ;
 wire	ojssl5yl6lqk3txwhtqu13ehzqm0bb_867 ;
 wire [8:0] rhlk2jx1ka7dfrazil_801 ;
 wire	clbbwl336mwo0no4g7rp0b_59 ;
 wire	gdgv0nr55qexiwilbohhk_767 ;
 wire	b37wymiqzrjm6dwy7dzyza2_273 ;
 wire	p3gcze9b2c3xrtdxwe1yoq16fwug44qw_91 ;
 wire	awq8iubxlpr2v4pd6_817 ;
 wire	xz8tesuvbho5uvh15353dzthoam8wlxq_521 ;
 wire	lnef1dbrvs21uqcaywg5mow_263 ;
 wire [159:0] q5zqtmldqd7ahv2tth_133 ;
 wire	zzfcfd76d86jktmx5e9ww9ex8oapm1_357 ;
 wire [159:0] ud89udhxvgos0vivpxz6_208 ;
 wire	ephl8gpowgae2hho_295 ;
 wire	m4secg7o2kdmfjs8p5mongxohl2_4 ;
 wire	j77niunw2votp6ej0_643 ;
 wire [20:0] tazzltvesq864r8pxcp17pp_513 ;
 wire	jgd7r3kyln2rq1qvz9rn8ufss_789 ;
 wire [20:0] zljv3ap12k4jxnp7tegho_193 ;
 wire	morzo2mxysh8iam5wjo50hgsxo7gs8vb_154 ;
 wire	b2gl5msp8gkw3x22dk_876 ;
 wire	r5nn28wnscgcgjxafrnei2uqdk_640 ;
 wire	cw95oqsjtask407rxxmpqfdcxyvwopzj_492 ;
 wire	pko55t3qvaes34o0x9036xwsbprw_274 ;


 assign dor42oo0k1t4kgw3mrhxgfjay63xrkp8_190 = 
	 ~(backpressure_in) ;
 assign ji0xaxmxvdcdtif1tryt7tnt2os46_851 = 
	{packet_in_PACKET2_SOF, packet_in_PACKET2_EOF, packet_in_PACKET2_VAL, packet_in_PACKET2_DAT, packet_in_PACKET2_CNT, packet_in_PACKET2_ERR} ;
 assign p1fd50sce637q9z1jn271imi986i_770 	= packet_in_PACKET2_VAL ;
 assign bpxogat3jsz0ir4rf0h2spzt2_233 	= ji0xaxmxvdcdtif1tryt7tnt2os46_851[265:0] ;
 assign eq85m0dsr4oi1lihe9ovchzxihgslys_381 = 
	p3gcze9b2c3xrtdxwe1yoq16fwug44qw_91 | cw95oqsjtask407rxxmpqfdcxyvwopzj_492 ;
 assign abz6uih4vaq5k0n71m6ycliouyd0a_893 = 
	1'b0 ;
 assign mq98jk15kfjlx6fx3usv_328 = 
	1'b1 ;
 assign g3x0pdczns5kuo8zeothp_522 = 
	 ~(m0dani2mpmjwxh9jpvdr191d1r_265) ;
 assign jfiu2622kfbw72s8wu_122 = 
	dor42oo0k1t4kgw3mrhxgfjay63xrkp8_190 & xz8tesuvbho5uvh15353dzthoam8wlxq_521 & eq85m0dsr4oi1lihe9ovchzxihgslys_381 ;
 assign xd2h0tane9d08kuojc6b9y_487 	= jfiu2622kfbw72s8wu_122 ;
 assign y6ycc8q7wf4quuitnmrhsr9p_106 	= xd2h0tane9d08kuojc6b9y_487 ;
 assign i8wm21yfz3632b5q438ps06_577 = 
	1'b0 ;
 assign uamz22mx96vf5ekzjeg_639 = 
	 ~(rhf54uorrad3hynubtmk6ppiirteaai_662) ;
 assign oupvpy9ozn77w9od4l_768 	= uu554qz8zunzwumam8aazd1k_448[0] ;
 assign su4dvo1h88ai8666fqpzn_292 	= uu554qz8zunzwumam8aazd1k_448[6:1] ;
 assign wbav3ziqo59px9xq09_12 	= uu554qz8zunzwumam8aazd1k_448[262:7] ;
 assign ck2nlkqnglzy80ro41wiitatwspp_849 	= uu554qz8zunzwumam8aazd1k_448[263] ;
 assign hhv8cxp6od46c0zj29e57_696 	= uu554qz8zunzwumam8aazd1k_448[264] ;
 assign xbbvmripg8xjyib7t_405 	= uu554qz8zunzwumam8aazd1k_448[265] ;
 assign z2ycgg15fmfyxc8g8bbhz423u_578 = 
	ml2z3lyqiey842kes3xfz7gea_902 & ck2nlkqnglzy80ro41wiitatwspp_849 ;
 assign gx8ahoedcvde4gofxxch9thr_132 	= packet_in_PACKET2_VAL ;
 assign yhsajudo7l1fauwhkg00_362 = packet_in_PACKET2_SOF ;
 assign h2bobvkupq6q37wd4x9e9hgqdu_583 	= xd2h0tane9d08kuojc6b9y_487 ;
 assign ojssl5yl6lqk3txwhtqu13ehzqm0bb_867 = 
	1'b0 ;
 assign rhlk2jx1ka7dfrazil_801 	= u94665epl5hsbwm69wf76jr2xb_620[8:0] ;
 assign clbbwl336mwo0no4g7rp0b_59 = (
	((rhlk2jx1ka7dfrazil_801 != jet3c2sqycrb4m41cv98tkj7f94f_816))?1'b1:
	0)  ;
 assign gdgv0nr55qexiwilbohhk_767 = wetdpuqo7enswh7getfg19hagb2rtlaa_566 ;
 assign b37wymiqzrjm6dwy7dzyza2_273 = wetdpuqo7enswh7getfg19hagb2rtlaa_566 ;
 assign p3gcze9b2c3xrtdxwe1yoq16fwug44qw_91 = 
	 ~(b37wymiqzrjm6dwy7dzyza2_273) ;
 assign awq8iubxlpr2v4pd6_817 	= g673lax3rf220hnpose8e5ghjwoe_792 ;
 assign xz8tesuvbho5uvh15353dzthoam8wlxq_521 = 
	 ~(g673lax3rf220hnpose8e5ghjwoe_792) ;
 assign lnef1dbrvs21uqcaywg5mow_263 = 
	dor42oo0k1t4kgw3mrhxgfjay63xrkp8_190 & cw95oqsjtask407rxxmpqfdcxyvwopzj_492 & xz8tesuvbho5uvh15353dzthoam8wlxq_521 & gdgv0nr55qexiwilbohhk_767 ;
 assign q5zqtmldqd7ahv2tth_133 = 
	tuple_in_TUPLE0_DATA ;
 assign zzfcfd76d86jktmx5e9ww9ex8oapm1_357 	= tuple_in_TUPLE0_VALID ;
 assign ud89udhxvgos0vivpxz6_208 	= q5zqtmldqd7ahv2tth_133[159:0] ;
 assign ephl8gpowgae2hho_295 = 
	 ~(gutwfo8ggfu0atyqbqa1p_95) ;
 assign m4secg7o2kdmfjs8p5mongxohl2_4 	= lnef1dbrvs21uqcaywg5mow_263 ;
 assign j77niunw2votp6ej0_643 = 
	1'b0 ;
 assign tazzltvesq864r8pxcp17pp_513 = 
	tuple_in_TUPLE1_DATA ;
 assign jgd7r3kyln2rq1qvz9rn8ufss_789 	= tuple_in_TUPLE1_VALID ;
 assign zljv3ap12k4jxnp7tegho_193 	= tazzltvesq864r8pxcp17pp_513[20:0] ;
 assign morzo2mxysh8iam5wjo50hgsxo7gs8vb_154 = 
	 ~(ie1i2tlv1ioq1vnvoo3_566) ;
 assign b2gl5msp8gkw3x22dk_876 	= lnef1dbrvs21uqcaywg5mow_263 ;
 assign r5nn28wnscgcgjxafrnei2uqdk_640 = 
	1'b0 ;
 assign cw95oqsjtask407rxxmpqfdcxyvwopzj_492 = 
	uamz22mx96vf5ekzjeg_639 & ephl8gpowgae2hho_295 & morzo2mxysh8iam5wjo50hgsxo7gs8vb_154 ;
 assign pko55t3qvaes34o0x9036xwsbprw_274 = 
	xzw99ca7suzbl8iwo7i3qrh3mgr8_853 | t5vp0vig8g1rojjt83v_115 | fag7x5lgmnx8dqrvr6eijshekd8u5ud7_265 ;
 assign packet_out_PACKET2_SOF 	= xbbvmripg8xjyib7t_405 ;
 assign packet_out_PACKET2_EOF 	= hhv8cxp6od46c0zj29e57_696 ;
 assign packet_out_PACKET2_VAL 	= z2ycgg15fmfyxc8g8bbhz423u_578 ;
 assign packet_out_PACKET2_DAT 	= wbav3ziqo59px9xq09_12[255:0] ;
 assign packet_out_PACKET2_CNT 	= su4dvo1h88ai8666fqpzn_292[5:0] ;
 assign packet_out_PACKET2_ERR 	= oupvpy9ozn77w9od4l_768 ;
 assign packet_in_PACKET2_RDY 	= packet_out_PACKET2_RDY ;
 assign tuple_out_TUPLE0_VALID 	= m8j5ocplirla1y3g4p0fv_144 ;
 assign tuple_out_TUPLE0_DATA 	= cwvva0ql2y8lnpsq4aei23_274[159:0] ;
 assign tuple_out_TUPLE1_VALID 	= m8j5ocplirla1y3g4p0fv_144 ;
 assign tuple_out_TUPLE1_DATA 	= qdqrl9dhm8h3l5naiedwwr2q1040ztz_512[20:0] ;


assign hrfmql0gomvkjxcpcn7qx7oo_196 = (
	((xd2h0tane9d08kuojc6b9y_487 == 1'b1))?mq98jk15kfjlx6fx3usv_328 :
	((dor42oo0k1t4kgw3mrhxgfjay63xrkp8_190 == 1'b1))?abz6uih4vaq5k0n71m6ycliouyd0a_893 :
	ar8xntzh86m95nizvuv414593n4y_248 ) ;

assign m0dani2mpmjwxh9jpvdr191d1r_265 = (
	((ar8xntzh86m95nizvuv414593n4y_248 == 1'b1) && (dor42oo0k1t4kgw3mrhxgfjay63xrkp8_190 == 1'b1))?abz6uih4vaq5k0n71m6ycliouyd0a_893 :
	ar8xntzh86m95nizvuv414593n4y_248 ) ;



always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	cqj21ezznpumn1o7n0_88 <= 1'b0 ;
	ar8xntzh86m95nizvuv414593n4y_248 <= 1'b0 ;
	bwffawe39yy4skplvleqwvw0g1woay_8 <= 1'b0 ;
	ml2z3lyqiey842kes3xfz7gea_902 <= 1'b0 ;
	jet3c2sqycrb4m41cv98tkj7f94f_816 <= 9'b000000000 ;
	xzw99ca7suzbl8iwo7i3qrh3mgr8_853 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		cqj21ezznpumn1o7n0_88 <= backpressure_in ;
		ar8xntzh86m95nizvuv414593n4y_248 <= hrfmql0gomvkjxcpcn7qx7oo_196 ;
		bwffawe39yy4skplvleqwvw0g1woay_8 <= uamz22mx96vf5ekzjeg_639 ;
		ml2z3lyqiey842kes3xfz7gea_902 <= xd2h0tane9d08kuojc6b9y_487 ;
		jet3c2sqycrb4m41cv98tkj7f94f_816 <= rhlk2jx1ka7dfrazil_801 ;
		xzw99ca7suzbl8iwo7i3qrh3mgr8_853 <= jfogc4riyk4xwlobwk69kz4qg_396 ;
		backpressure_out <= pko55t3qvaes34o0x9036xwsbprw_274 ;
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	m8j5ocplirla1y3g4p0fv_144 <= 1'b0 ;
	t5vp0vig8g1rojjt83v_115 <= 1'b0 ;
   end
  else
  begin
		m8j5ocplirla1y3g4p0fv_144 <= lnef1dbrvs21uqcaywg5mow_263 ;
		t5vp0vig8g1rojjt83v_115 <= eqvayi8joc5b36yaqg2_822 ;
  end
end

always @(posedge clk_out_2)
begin
  if (rst_in_0) 
  begin
	fag7x5lgmnx8dqrvr6eijshekd8u5ud7_265 <= 1'b0 ;
   end
  else
  begin
		fag7x5lgmnx8dqrvr6eijshekd8u5ud7_265 <= ncoel2re6k840f3x3pswdgy_906 ;
  end
end

defparam fk1b53yrrnkxc77k5w_1188.WRITE_DATA_WIDTH = 266; 
defparam fk1b53yrrnkxc77k5w_1188.FIFO_WRITE_DEPTH = 512; 
defparam fk1b53yrrnkxc77k5w_1188.PROG_FULL_THRESH = 129; 
defparam fk1b53yrrnkxc77k5w_1188.PROG_EMPTY_THRESH = 129; 
defparam fk1b53yrrnkxc77k5w_1188.READ_MODE = "STD"; 
defparam fk1b53yrrnkxc77k5w_1188.WR_DATA_COUNT_WIDTH = 9; 
defparam fk1b53yrrnkxc77k5w_1188.RD_DATA_COUNT_WIDTH = 9; 
defparam fk1b53yrrnkxc77k5w_1188.DOUT_RESET_VALUE = "0"; 
defparam fk1b53yrrnkxc77k5w_1188.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_sync fk1b53yrrnkxc77k5w_1188 (
	.wr_en(p1fd50sce637q9z1jn271imi986i_770),
	.din(bpxogat3jsz0ir4rf0h2spzt2_233),
	.rd_en(y6ycc8q7wf4quuitnmrhsr9p_106),
	.sleep(i8wm21yfz3632b5q438ps06_577),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(vgqzvlzzy0yg9sttljy5_89), 
	.dout(uu554qz8zunzwumam8aazd1k_448), 
	.empty(rhf54uorrad3hynubtmk6ppiirteaai_662), 
	.prog_full(jfogc4riyk4xwlobwk69kz4qg_396), 
	.full(tq2ip3oci6mg49bu0ovnrk5ac7_521), 
	.rd_data_count(l6axzsfohime3kmips7cl0_165), 
	.wr_data_count(nclgqncsngdbwc4req67p3_532), 
	.wr_rst_busy(qwehl1vvpz287sf4gmppg_130), 
	.rd_rst_busy(qa8ga4eb8eeqxrqbbna0_828), 
	.overflow(upiyj2rhkcij48ipgxcygl48skqp_738), 
	.underflow(y4jpyqucyipuftekn4xeo_868), 
	.sbiterr(qjf3cglygkm5n5j1_102), 
	.dbiterr(xizaun5hwlhtc6lu2i1cygqdf_686), 
	.almost_empty(l8yigk8qbkmyk5ed78w_459), 
	.almost_full(el0yvx4zxl65exig9u0ymjkupejtty1_677), 
	.wr_ack(xoqufn6acg3fcqlceyk_77), 
	.data_valid(kiovki3kdqjbg3yey_105), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam bq2dq9ym88w7ma945p561ahy6ocen6_117.WRITE_DATA_WIDTH = 1; 
defparam bq2dq9ym88w7ma945p561ahy6ocen6_117.FIFO_WRITE_DEPTH = 512; 
defparam bq2dq9ym88w7ma945p561ahy6ocen6_117.PROG_FULL_THRESH = 129; 
defparam bq2dq9ym88w7ma945p561ahy6ocen6_117.PROG_EMPTY_THRESH = 129; 
defparam bq2dq9ym88w7ma945p561ahy6ocen6_117.READ_MODE = "FWFT"; 
defparam bq2dq9ym88w7ma945p561ahy6ocen6_117.WR_DATA_COUNT_WIDTH = 9; 
defparam bq2dq9ym88w7ma945p561ahy6ocen6_117.RD_DATA_COUNT_WIDTH = 9; 
defparam bq2dq9ym88w7ma945p561ahy6ocen6_117.DOUT_RESET_VALUE = "0"; 
defparam bq2dq9ym88w7ma945p561ahy6ocen6_117.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_sync bq2dq9ym88w7ma945p561ahy6ocen6_117 (
	.wr_en(gx8ahoedcvde4gofxxch9thr_132),
	.din(yhsajudo7l1fauwhkg00_362),
	.rd_en(h2bobvkupq6q37wd4x9e9hgqdu_583),
	.sleep(ojssl5yl6lqk3txwhtqu13ehzqm0bb_867),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(xjvf3fjdrma9pxrcy52_253), 
	.dout(wetdpuqo7enswh7getfg19hagb2rtlaa_566), 
	.empty(g673lax3rf220hnpose8e5ghjwoe_792), 
	.prog_full(qoscmjrzloqw642v_119), 
	.full(afffd9hbmc0dle6qoi4jnyozn0w_855), 
	.rd_data_count(u94665epl5hsbwm69wf76jr2xb_620), 
	.wr_data_count(oi115pcbzbleicfbxjlb0v8vzd4nbrjw_161), 
	.wr_rst_busy(oyvux1x9z9vlao4yhuf_90), 
	.rd_rst_busy(p4bbyg35djbyr59kxzi4ro5tn_636), 
	.overflow(c3ej481bbuljj45vvi_219), 
	.underflow(ztqhc1prd7v4n1iai9ps5u8bpf_413), 
	.sbiterr(filz36oei52g0rdupnvcw_54), 
	.dbiterr(u1okr660p2fdks4xutu7c2_77), 
	.almost_empty(zb0h6mlkjcbarimmc03p32txkj4_1), 
	.almost_full(as3yx9493cspw41638kftmdw7_587), 
	.wr_ack(nfw94p17pfqgle7ij8flrnq5_315), 
	.data_valid(o9gekl9yb4zl16yhoc_498), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam kislkoumgxk7751uo3sa3pyrnc810q_2100.WRITE_DATA_WIDTH = 160; 
defparam kislkoumgxk7751uo3sa3pyrnc810q_2100.FIFO_WRITE_DEPTH = 256; 
defparam kislkoumgxk7751uo3sa3pyrnc810q_2100.PROG_FULL_THRESH = 66; 
defparam kislkoumgxk7751uo3sa3pyrnc810q_2100.PROG_EMPTY_THRESH = 66; 
defparam kislkoumgxk7751uo3sa3pyrnc810q_2100.READ_MODE = "STD"; 
defparam kislkoumgxk7751uo3sa3pyrnc810q_2100.WR_DATA_COUNT_WIDTH = 8; 
defparam kislkoumgxk7751uo3sa3pyrnc810q_2100.RD_DATA_COUNT_WIDTH = 8; 
defparam kislkoumgxk7751uo3sa3pyrnc810q_2100.DOUT_RESET_VALUE = "0"; 
defparam kislkoumgxk7751uo3sa3pyrnc810q_2100.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async kislkoumgxk7751uo3sa3pyrnc810q_2100 (
	.wr_en(zzfcfd76d86jktmx5e9ww9ex8oapm1_357),
	.din(ud89udhxvgos0vivpxz6_208),
	.rd_en(m4secg7o2kdmfjs8p5mongxohl2_4),
	.sleep(j77niunw2votp6ej0_643),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(urw3hs8j2rit7250vjk3xn_328), 
	.dout(cwvva0ql2y8lnpsq4aei23_274), 
	.empty(gutwfo8ggfu0atyqbqa1p_95), 
	.prog_full(eqvayi8joc5b36yaqg2_822), 
	.full(cjkwhmncdzsbgpe1_260), 
	.rd_data_count(m2qfwjz8bce90jj2c_268), 
	.wr_data_count(yktwl3dzud5b9kkq_626), 
	.wr_rst_busy(ca036u9c8orj9ch9qbd8ryby7ahu_454), 
	.rd_rst_busy(hwqqky6puim2wd3foz08fxt_401), 
	.overflow(k8oeoe4wlzcaxevc3t0c7k_32), 
	.underflow(jkzps7d7q2ua2qdo7inb7cudrpf7_639), 
	.sbiterr(r8jfmmecm8m3ls4radp90nu3juz9fc_876), 
	.dbiterr(f410xkggtupyau3vc5yw0uccjo4w_323), 
	.almost_empty(ucv5uc61qidh86pkcwoxv8dj_659), 
	.almost_full(oj3yzmthuikegcoe5w2bb9ass7_461), 
	.wr_ack(r5qs3b4jsxrzkvhvfarru6fcylw9aag_263), 
	.data_valid(z2mldworv4jdb9cyztqqc_458), 

	.wr_clk(clk_in_1), 

	.rd_clk(clk_out_1), 
	.rst(rst_in_1) 
); 

defparam etrjbpg8mz8e982ofoucoie7117xc2b_2634.WRITE_DATA_WIDTH = 21; 
defparam etrjbpg8mz8e982ofoucoie7117xc2b_2634.FIFO_WRITE_DEPTH = 256; 
defparam etrjbpg8mz8e982ofoucoie7117xc2b_2634.PROG_FULL_THRESH = 65; 
defparam etrjbpg8mz8e982ofoucoie7117xc2b_2634.PROG_EMPTY_THRESH = 65; 
defparam etrjbpg8mz8e982ofoucoie7117xc2b_2634.READ_MODE = "STD"; 
defparam etrjbpg8mz8e982ofoucoie7117xc2b_2634.WR_DATA_COUNT_WIDTH = 8; 
defparam etrjbpg8mz8e982ofoucoie7117xc2b_2634.RD_DATA_COUNT_WIDTH = 8; 
defparam etrjbpg8mz8e982ofoucoie7117xc2b_2634.DOUT_RESET_VALUE = "0"; 
defparam etrjbpg8mz8e982ofoucoie7117xc2b_2634.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_async etrjbpg8mz8e982ofoucoie7117xc2b_2634 (
	.wr_en(jgd7r3kyln2rq1qvz9rn8ufss_789),
	.din(zljv3ap12k4jxnp7tegho_193),
	.rd_en(b2gl5msp8gkw3x22dk_876),
	.sleep(r5nn28wnscgcgjxafrnei2uqdk_640),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(ukjpt4gk2vvfuw8bc_453), 
	.dout(qdqrl9dhm8h3l5naiedwwr2q1040ztz_512), 
	.empty(ie1i2tlv1ioq1vnvoo3_566), 
	.prog_full(ncoel2re6k840f3x3pswdgy_906), 
	.full(dj08pig7ntfyjnruxyyro_315), 
	.rd_data_count(pdi4av4qsa9v0h0vbd_50), 
	.wr_data_count(kyieymfhubab2pe6e_60), 
	.wr_rst_busy(ol0r13el9xc2af1twaj_569), 
	.rd_rst_busy(lbu99bl5psu78dhyx99po3n_496), 
	.overflow(ga1ggquov4u3kcc8h1_750), 
	.underflow(vsrljfcq3ox5571r49ac39lexp9_487), 
	.sbiterr(w6o3ohkt6n3b41l1kyyvfg6wdlq_515), 
	.dbiterr(r28j8r7wx6mv8v108ysp42_809), 
	.almost_empty(fnhar501bdq3gh66tqg_511), 
	.almost_full(hft7tcrdyltq8hlb1ws4fb6xbnaft72_746), 
	.wr_ack(sct112fn2uyzm5g0kjjtn_528), 
	.data_valid(es99i2kpzm56fkiexr92nw9jae0_195), 

	.wr_clk(clk_in_2), 

	.rd_clk(clk_out_2), 
	.rst(rst_in_2) 
); 

endmodule 
