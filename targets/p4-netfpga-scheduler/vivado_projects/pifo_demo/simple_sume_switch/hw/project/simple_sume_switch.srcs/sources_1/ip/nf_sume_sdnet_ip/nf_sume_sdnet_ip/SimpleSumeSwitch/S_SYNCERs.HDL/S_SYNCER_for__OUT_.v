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
// File created: 2019/11/21 22:45:49
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






 reg	syhmdhlrq8hq92f7kp0vd1gf_371;	 initial syhmdhlrq8hq92f7kp0vd1gf_371 = 1'b0 ;
 wire	s00kkkei3thcewk0tb9t_368 ;
 wire [289:0] befz1om885zmdfr1tvoqpodl8t_511 ;
 wire	idyxoij8t44zrl2x25lc7soetvqi8sl_417 ;
 wire	beenbt2yafrhn7eztgpagzgumljw_193 ;
 wire	s6d6xdu829pi09ukpveyqplr24gn_230 ;
 wire [8:0] k18d5idk5w0yay3sooling8l8p4_498 ;
 wire [8:0] kxqj0y7bo10i0z4x8fm4_757 ;
 wire	ayh81mkhjua4x88xsrlqgo6zzpy0e_91 ;
 wire	acefzcp12rtedws17gvdkmz33sm_896 ;
 wire	lounj37t6w802dnuwwmbhzdatgrav9o7_119 ;
 wire	feg8f3963kbufpngzbykrugpli099b_475 ;
 wire	q4l9du4fi3b878b63oqx7bhvdc385_767 ;
 wire	rytxi3vixbcjfm9fdn296yhphsdqk1_353 ;
 wire	vi4yaabay744uzu16dfcoe6ajdt_906 ;
 wire	ev7tg2vrjw1ihpnh3oq1n2gyltk3i_762 ;
 wire	nsg2vj5lgo48f586u265lkp_99 ;
 wire	ptsk7flazeqei74g5p0g_723 ;
 wire	t0d31eqqii874sgd4sevy_663 ;
 reg	x5lvo8npvn33lw452vgz_308;	 initial x5lvo8npvn33lw452vgz_308 = 1'b0 ;
 wire	g95brezqn4mc704p3tbv_28 ;
 reg	fa055fze17lk75k6pnsisou_196;	 initial fa055fze17lk75k6pnsisou_196 = 1'b0 ;
 reg	dwo1oyl04rpj9lv2x2_371;	 initial dwo1oyl04rpj9lv2x2_371 = 1'b0 ;
 wire	m60x9e5m3gzdkx9xf2ivs_435 ;
 wire [0:0] jhlq9ekhhmsp9eqt_636 ;
 wire	sne1xj5jraetit312n7rrnuisa8_775 ;
 wire	u1198gm2kb7ctfcpwfwh35t_108 ;
 wire	necrpzgihw62g36lqgnxc_269 ;
 wire [8:0] coeixg5mbvdfdqswxvxqrjp_509 ;
 wire [8:0] xxyn505lstus2o9vp_644 ;
 wire	yen33odx8e9dqqzbg90elc8v8xo_534 ;
 wire	bam00xe0148ljqzf2u5b6cox7ammkn3_85 ;
 wire	n5twg3w133gsdr4jml79px_343 ;
 wire	fkw7lhoud22tacmr7r2xjz_599 ;
 wire	vvsvu2rsoeb5izhw2twwnlbh40wx93yr_147 ;
 wire	x0mjpcnyhvuy8qyyj0vx3z236ck06hsd_266 ;
 wire	i38n7mkxo1iwmqr82fi7tjuk8_200 ;
 wire	lhdir26rqylk55jkv9_364 ;
 wire	qutx7tbpx9558labff6vtb5qt_298 ;
 wire	mwmn97v8mq5328m3_394 ;
 reg	gelyksnt5d0kcfitpq81bbwfmurii_154;	 initial gelyksnt5d0kcfitpq81bbwfmurii_154 = 1'b0 ;
 reg	u6ss4rdtel85w28r50ycb1h7x_351;	 initial u6ss4rdtel85w28r50ycb1h7x_351 = 1'b1 ;
 reg [8:0] cu06rfutkd8rajet_527;	 initial cu06rfutkd8rajet_527 = 9'b000000000 ;
 reg	shk295smovublu05a3c1qxu7o70hzz_834;	 initial shk295smovublu05a3c1qxu7o70hzz_834 = 1'b0 ;
 wire	x8z94b43ya9kem1h98vrwcw_580 ;
 wire [255:0] gixv1nkqtngi93c210_414 ;
 wire	r0cbbbnslvbjc9yoolhuxebyw_216 ;
 wire	dkti3j6lgjk6vvzi7bffq6bkuk_414 ;
 wire	z7p3fn8lo9fwdhard_611 ;
 wire [7:0] ti1ketu6t6qc3oafyjdymp13pj_247 ;
 wire [7:0] t7v5d0zpi0g79x1sqmhylqikithnhf43_588 ;
 wire	pxr99zjx6yeeck0a_494 ;
 wire	clxv0lmvn61vi3nvoe4x_206 ;
 wire	z3ns7252n0q7c1avcvg71bp709hcw4m_658 ;
 wire	amhxy5kw542siqlo_205 ;
 wire	bsy9tugoom2h5zauesofm15_758 ;
 wire	t5yrt93d7qa0tm7xm8vs2ah6_697 ;
 wire	nh65cxv8h5lamzgb7v9vd0dmv54v3_64 ;
 wire	vab0gaxzv0ucb0xx_123 ;
 wire	hmn3woapt3u4nhvjr8k0i3l0fzaa4xb8_450 ;
 wire	x002ngatqlo9e1ig7hp4hso253rjrm0_592 ;
 wire	q4wnialg8f2omn0iy92_530 ;
 wire [159:0] uzhdhjb7wiq6jh767ea8_110 ;
 wire	eb2ivhy39mjx0ljp_616 ;
 wire	h6tv6asdztkyyowjsedwmp_447 ;
 wire	qwpm2p66p77ihb3qv2a_397 ;
 wire [7:0] gek6oti3hh3geokvp77l0m5pxmnkapw_84 ;
 wire [7:0] hq7499z98av4luv77q4vadtg6l_541 ;
 wire	uvdcfem0s5nzfxkb5s08gh_217 ;
 wire	mhk8vphr43gwq65e7t_638 ;
 wire	qvjlaeu4qrhnjwza_235 ;
 wire	xrnz0fqrmdyfcqs3o9ylhd4_41 ;
 wire	i2va8gf2e1a94tto_79 ;
 wire	wyvt8p4cbcrxl6k72druqgrmj_739 ;
 wire	a9piefh6nfbpp9vt2wcb690417cwx_757 ;
 wire	artf1ezcdgz8ha52ftv644rlaxl50z_537 ;
 wire	cl2wys1x5tjk1u576x6zxx_606 ;
 wire	w3rdkm45n5bf7ryxvn4m7_185 ;
 reg	az4dmtyuoeg3ywxgymewvzqwnxix1_283;	 initial az4dmtyuoeg3ywxgymewvzqwnxix1_283 = 1'b0 ;
 reg	ewlrrb59wpcjj2i7b269u_288;	 initial ewlrrb59wpcjj2i7b269u_288 = 1'b0 ;
 reg	a6swfp03824njr1im_290;	 initial a6swfp03824njr1im_290 = 1'b0 ;
 wire	zsnbmbyby7izs7l4qxqdyr8jo5_605 ;
 wire [289:0] v0hrbpzfivfqxp40xk9l0mu_373 ;
 wire	imkh18wv2e3vntxot_598 ;
 wire [289:0] syqj2cjdhjnibymjtux28ooaynyck775_24 ;
 wire	m0wyb6my1h8m2gxez_593 ;
 wire	yf2si2biylnff69aqc9g_746 ;
 wire	ys2a5itzd0ien7b4hc3ema1iipn6za_228 ;
 wire	nu9qo32v2b3qns4be25g0cydcjz_22 ;
 wire	jplpqvdhza9583ejcv7hc_362 ;
 wire	upjtng0cibmh1u2icsq0yng40z_432 ;
 wire	qoxoc77cwu9imvc75xdeut4s_93 ;
 wire	h3vu9bbbp8uchv04e7_424 ;
 wire	gc7ki6lvh5xnxhteb_368 ;
 wire	egszzve4pci0a5zuszsz_721 ;
 wire	r0qtf48qvubupqtppvo9do29_183 ;
 wire	ageld3n8ecxncnxjzt7pybf6da34oa9_787 ;
 wire	uxp54nzjxbadi4eeyhvulgydjn4o_883 ;
 wire	lvsyco0u4kvczdyjy6uwni9j_208 ;
 wire [31:0] lbrd7vzj3czfj0c93v3j3_107 ;
 wire [255:0] wh87g0kg2l2u6v2tpxbg7s3v3tryn_241 ;
 wire	akaog7flg8mjjaolw2qj2a000nm09_669 ;
 wire	fgxa7j14ze8oo8sul6160q6lzl6hzp34_77 ;
 wire	y4ekuv2n22iia8a4e_40 ;
 wire	xolw53v3r0rqrrfo36_433 ;
 wire	th94dszld5wd5wlp9to0h0gvig7r1z9u_97 ;
 wire	x4h995my3gao3s0pltg6j_529 ;
 wire	eg633wbzqcxc627q4u1s1m_807 ;
 wire	btawaux3yps3nw2vriq7_282 ;
 wire	xv9uy0exvhx4c4czu8prkdg7h_813 ;
 wire	xoxmpf34fv5c4u8sa4coo3x7_596 ;
 wire	jkg8igu76p8uat5mtwcdirh5df_625 ;
 wire	jzji7l84hxhu1kgqww21q2mr2qajhbq_428 ;
 wire	kns28plwnd9zzr3b39guufsj5x0i42k2_276 ;
 wire	otjhk6cvx7g0w89x1dn41sqlmmcwbyfh_170 ;
 wire	t5x58k42d7dxm8hwz7u_540 ;
 wire	bghmtn1jdjkwzia2pb3cbh_165 ;
 wire [0:0] uaniu72glpmlttkb_862 ;
 wire	dxv2pixkauig6ym3u5yxbyoffsx_357 ;
 wire	sjiz8ed9rnlvpuvb_525 ;
 wire [8:0] gzh0ol6ymiz20qvlgwqawyyvu_816 ;
 wire	cvs59xbihtnmvhqysobvgod1gns_672 ;
 wire	dbowuwqp1ubhlrldrta0lu90w8p_704 ;
 wire	eut453x6to7jxzquyu2u_277 ;
 wire	se56w5xme6ng3jd7tfsjj465_865 ;
 wire	yw2svm94hlqmd01aua9bin_605 ;
 wire	wvxfsvki17hwivqcxsv_234 ;
 wire	rwfam3and5qvwilrgvgaz_630 ;
 wire [255:0] zjbiy1l4doaoqk22upaglebcx_375 ;
 wire	kt0vk0vzdho1aqwodl_179 ;
 wire [255:0] cpcx18uglzcf4l0ntl_562 ;
 wire	rgwg5vopl3hfbnva7tec_194 ;
 wire	h1s8nwivtioerpspthi20lb8r5tac0f_706 ;
 wire	wgsc70ooaic4jttin617knl097gmpkxx_726 ;
 wire [159:0] qvmwgwz9jm4a9moge6u8lq_748 ;
 wire	gxcm4p9m0sznwn3da53ys1_88 ;
 wire [159:0] qmvhif9gj9wysf3albuaux_605 ;
 wire	znwz7legyammhonrtvyq2bmfo06_551 ;
 wire	j63rwv7jyi6by326cr3qbk40_760 ;
 wire	b9v673plygcydhp33m6zotsnb_728 ;
 wire	w4c5ie6tebcrowtgrso_653 ;
 wire	q2bw3fp66ayq47z31j_813 ;


 assign zsnbmbyby7izs7l4qxqdyr8jo5_605 = 
	 ~(backpressure_in) ;
 assign v0hrbpzfivfqxp40xk9l0mu_373 = 
	{packet_in_PACKET2_TVALID, packet_in_PACKET2_TDATA, packet_in_PACKET2_TKEEP, packet_in_PACKET2_TLAST} ;
 assign imkh18wv2e3vntxot_598 	= packet_in_PACKET2_TVALID ;
 assign syqj2cjdhjnibymjtux28ooaynyck775_24 	= v0hrbpzfivfqxp40xk9l0mu_373[289:0] ;
 assign m0wyb6my1h8m2gxez_593 = 
	se56w5xme6ng3jd7tfsjj465_865 | w4c5ie6tebcrowtgrso_653 ;
 assign yf2si2biylnff69aqc9g_746 = 
	1'b0 ;
 assign ys2a5itzd0ien7b4hc3ema1iipn6za_228 = 
	1'b1 ;
 assign nu9qo32v2b3qns4be25g0cydcjz_22 = 
	 ~(g95brezqn4mc704p3tbv_28) ;
 assign jplpqvdhza9583ejcv7hc_362 = 
	wvxfsvki17hwivqcxsv_234 & m0wyb6my1h8m2gxez_593 & uxp54nzjxbadi4eeyhvulgydjn4o_883 ;
 assign upjtng0cibmh1u2icsq0yng40z_432 = 
	nu9qo32v2b3qns4be25g0cydcjz_22 & x5lvo8npvn33lw452vgz_308 & uxp54nzjxbadi4eeyhvulgydjn4o_883 & se56w5xme6ng3jd7tfsjj465_865 & wvxfsvki17hwivqcxsv_234 ;
 assign qoxoc77cwu9imvc75xdeut4s_93 = 
	jplpqvdhza9583ejcv7hc_362 | upjtng0cibmh1u2icsq0yng40z_432 ;
 assign h3vu9bbbp8uchv04e7_424 = 
	zsnbmbyby7izs7l4qxqdyr8jo5_605 & qoxoc77cwu9imvc75xdeut4s_93 ;
 assign gc7ki6lvh5xnxhteb_368 = 
	backpressure_in & syhmdhlrq8hq92f7kp0vd1gf_371 & wvxfsvki17hwivqcxsv_234 & eut453x6to7jxzquyu2u_277 & w4c5ie6tebcrowtgrso_653 & nu9qo32v2b3qns4be25g0cydcjz_22 ;
 assign egszzve4pci0a5zuszsz_721 = 
	h3vu9bbbp8uchv04e7_424 | gc7ki6lvh5xnxhteb_368 ;
 assign r0qtf48qvubupqtppvo9do29_183 	= egszzve4pci0a5zuszsz_721 ;
 assign ageld3n8ecxncnxjzt7pybf6da34oa9_787 = 
	1'b0 ;
 assign uxp54nzjxbadi4eeyhvulgydjn4o_883 = 
	 ~(idyxoij8t44zrl2x25lc7soetvqi8sl_417) ;
 assign lvsyco0u4kvczdyjy6uwni9j_208 	= befz1om885zmdfr1tvoqpodl8t_511[0] ;
 assign lbrd7vzj3czfj0c93v3j3_107 	= befz1om885zmdfr1tvoqpodl8t_511[32:1] ;
 assign wh87g0kg2l2u6v2tpxbg7s3v3tryn_241 	= befz1om885zmdfr1tvoqpodl8t_511[288:33] ;
 assign akaog7flg8mjjaolw2qj2a000nm09_669 	= befz1om885zmdfr1tvoqpodl8t_511[289] ;
 assign fgxa7j14ze8oo8sul6160q6lzl6hzp34_77 = 
	syhmdhlrq8hq92f7kp0vd1gf_371 | dwo1oyl04rpj9lv2x2_371 ;
 assign y4ekuv2n22iia8a4e_40 = 
	fa055fze17lk75k6pnsisou_196 | uxp54nzjxbadi4eeyhvulgydjn4o_883 ;
 assign xolw53v3r0rqrrfo36_433 = 
	y4ekuv2n22iia8a4e_40 & wvxfsvki17hwivqcxsv_234 & m0wyb6my1h8m2gxez_593 ;
 assign th94dszld5wd5wlp9to0h0gvig7r1z9u_97 = 
	xolw53v3r0rqrrfo36_433 | x5lvo8npvn33lw452vgz_308 ;
 assign x4h995my3gao3s0pltg6j_529 = 
	backpressure_in & akaog7flg8mjjaolw2qj2a000nm09_669 & th94dszld5wd5wlp9to0h0gvig7r1z9u_97 ;
 assign eg633wbzqcxc627q4u1s1m_807 = 
	eut453x6to7jxzquyu2u_277 & shk295smovublu05a3c1qxu7o70hzz_834 ;
 assign btawaux3yps3nw2vriq7_282 = 
	eg633wbzqcxc627q4u1s1m_807 | se56w5xme6ng3jd7tfsjj465_865 | lvsyco0u4kvczdyjy6uwni9j_208 ;
 assign xv9uy0exvhx4c4czu8prkdg7h_813 = 
	zsnbmbyby7izs7l4qxqdyr8jo5_605 & x5lvo8npvn33lw452vgz_308 & akaog7flg8mjjaolw2qj2a000nm09_669 & btawaux3yps3nw2vriq7_282 ;
 assign xoxmpf34fv5c4u8sa4coo3x7_596 	= x5lvo8npvn33lw452vgz_308 ;
 assign jkg8igu76p8uat5mtwcdirh5df_625 	= packet_in_PACKET2_TVALID ;
 assign jzji7l84hxhu1kgqww21q2mr2qajhbq_428 = 
	1'b0 ;
 assign kns28plwnd9zzr3b39guufsj5x0i42k2_276 = 
	1'b1 ;
 assign otjhk6cvx7g0w89x1dn41sqlmmcwbyfh_170 = (
	((gelyksnt5d0kcfitpq81bbwfmurii_154 == 1'b1) && (packet_in_PACKET2_TVALID == 1'b1))?1'b1:
	((u6ss4rdtel85w28r50ycb1h7x_351 == 1'b1) && (packet_in_PACKET2_TVALID == 1'b1))?1'b1:
	0)  ;
 assign t5x58k42d7dxm8hwz7u_540 = (
	((packet_in_PACKET2_TVALID == 1'b1) && (packet_in_PACKET2_TLAST == 1'b1))?1'b1:
	0)  ;
 assign bghmtn1jdjkwzia2pb3cbh_165 = (
	((packet_in_PACKET2_TVALID == 1'b1) && (packet_in_PACKET2_TLAST == 1'b0))?1'b1:
	0)  ;
 assign uaniu72glpmlttkb_862 = otjhk6cvx7g0w89x1dn41sqlmmcwbyfh_170 ;
 assign dxv2pixkauig6ym3u5yxbyoffsx_357 	= egszzve4pci0a5zuszsz_721 ;
 assign sjiz8ed9rnlvpuvb_525 = 
	1'b0 ;
 assign gzh0ol6ymiz20qvlgwqawyyvu_816 	= coeixg5mbvdfdqswxvxqrjp_509[8:0] ;
 assign cvs59xbihtnmvhqysobvgod1gns_672 = (
	((gzh0ol6ymiz20qvlgwqawyyvu_816 != cu06rfutkd8rajet_527))?1'b1:
	0)  ;
 assign dbowuwqp1ubhlrldrta0lu90w8p_704 = jhlq9ekhhmsp9eqt_636 ;
 assign eut453x6to7jxzquyu2u_277 = jhlq9ekhhmsp9eqt_636 ;
 assign se56w5xme6ng3jd7tfsjj465_865 = 
	 ~(eut453x6to7jxzquyu2u_277) ;
 assign yw2svm94hlqmd01aua9bin_605 	= sne1xj5jraetit312n7rrnuisa8_775 ;
 assign wvxfsvki17hwivqcxsv_234 = 
	 ~(sne1xj5jraetit312n7rrnuisa8_775) ;
 assign rwfam3and5qvwilrgvgaz_630 = 
	w4c5ie6tebcrowtgrso_653 & wvxfsvki17hwivqcxsv_234 & dbowuwqp1ubhlrldrta0lu90w8p_704 & egszzve4pci0a5zuszsz_721 ;
 assign zjbiy1l4doaoqk22upaglebcx_375 = 
	tuple_in_TUPLE0_DATA ;
 assign kt0vk0vzdho1aqwodl_179 	= tuple_in_TUPLE0_VALID ;
 assign cpcx18uglzcf4l0ntl_562 	= zjbiy1l4doaoqk22upaglebcx_375[255:0] ;
 assign rgwg5vopl3hfbnva7tec_194 = 
	 ~(r0cbbbnslvbjc9yoolhuxebyw_216) ;
 assign h1s8nwivtioerpspthi20lb8r5tac0f_706 	= rwfam3and5qvwilrgvgaz_630 ;
 assign wgsc70ooaic4jttin617knl097gmpkxx_726 = 
	1'b0 ;
 assign qvmwgwz9jm4a9moge6u8lq_748 = 
	tuple_in_TUPLE1_DATA ;
 assign gxcm4p9m0sznwn3da53ys1_88 	= tuple_in_TUPLE1_VALID ;
 assign qmvhif9gj9wysf3albuaux_605 	= qvmwgwz9jm4a9moge6u8lq_748[159:0] ;
 assign znwz7legyammhonrtvyq2bmfo06_551 = 
	 ~(eb2ivhy39mjx0ljp_616) ;
 assign j63rwv7jyi6by326cr3qbk40_760 	= rwfam3and5qvwilrgvgaz_630 ;
 assign b9v673plygcydhp33m6zotsnb_728 = 
	1'b0 ;
 assign w4c5ie6tebcrowtgrso_653 = 
	uxp54nzjxbadi4eeyhvulgydjn4o_883 & rgwg5vopl3hfbnva7tec_194 & znwz7legyammhonrtvyq2bmfo06_551 ;
 assign q2bw3fp66ayq47z31j_813 = 
	az4dmtyuoeg3ywxgymewvzqwnxix1_283 | ewlrrb59wpcjj2i7b269u_288 | a6swfp03824njr1im_290 ;
 assign packet_out_PACKET2_TVALID 	= xoxmpf34fv5c4u8sa4coo3x7_596 ;
 assign packet_out_PACKET2_TDATA 	= wh87g0kg2l2u6v2tpxbg7s3v3tryn_241[255:0] ;
 assign packet_out_PACKET2_TKEEP 	= lbrd7vzj3czfj0c93v3j3_107[31:0] ;
 assign packet_out_PACKET2_TLAST 	= lvsyco0u4kvczdyjy6uwni9j_208 ;
 assign packet_in_PACKET2_TREADY 	= packet_out_PACKET2_TREADY ;
 assign tuple_out_TUPLE0_VALID 	= shk295smovublu05a3c1qxu7o70hzz_834 ;
 assign tuple_out_TUPLE0_DATA 	= gixv1nkqtngi93c210_414[255:0] ;
 assign tuple_out_TUPLE1_VALID 	= shk295smovublu05a3c1qxu7o70hzz_834 ;
 assign tuple_out_TUPLE1_DATA 	= uzhdhjb7wiq6jh767ea8_110[159:0] ;


assign t0d31eqqii874sgd4sevy_663 = (
	((egszzve4pci0a5zuszsz_721 == 1'b1))?ys2a5itzd0ien7b4hc3ema1iipn6za_228 :
	((zsnbmbyby7izs7l4qxqdyr8jo5_605 == 1'b1))?yf2si2biylnff69aqc9g_746 :
	x5lvo8npvn33lw452vgz_308 ) ;

assign g95brezqn4mc704p3tbv_28 = (
	((x5lvo8npvn33lw452vgz_308 == 1'b1) && (zsnbmbyby7izs7l4qxqdyr8jo5_605 == 1'b1))?yf2si2biylnff69aqc9g_746 :
	x5lvo8npvn33lw452vgz_308 ) ;



always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	syhmdhlrq8hq92f7kp0vd1gf_371 <= 1'b0 ;
	x5lvo8npvn33lw452vgz_308 <= 1'b0 ;
	fa055fze17lk75k6pnsisou_196 <= 1'b0 ;
	dwo1oyl04rpj9lv2x2_371 <= 1'b0 ;
	cu06rfutkd8rajet_527 <= 9'b000000000 ;
	az4dmtyuoeg3ywxgymewvzqwnxix1_283 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		syhmdhlrq8hq92f7kp0vd1gf_371 <= backpressure_in ;
		x5lvo8npvn33lw452vgz_308 <= t0d31eqqii874sgd4sevy_663 ;
		fa055fze17lk75k6pnsisou_196 <= uxp54nzjxbadi4eeyhvulgydjn4o_883 ;
		dwo1oyl04rpj9lv2x2_371 <= egszzve4pci0a5zuszsz_721 ;
		cu06rfutkd8rajet_527 <= gzh0ol6ymiz20qvlgwqawyyvu_816 ;
		az4dmtyuoeg3ywxgymewvzqwnxix1_283 <= beenbt2yafrhn7eztgpagzgumljw_193 ;
		backpressure_out <= q2bw3fp66ayq47z31j_813 ;
  end
end

always @(posedge clk_in_0)
begin
  if (rst_in_0) 
  begin
	gelyksnt5d0kcfitpq81bbwfmurii_154 <= 1'b0 ;
	u6ss4rdtel85w28r50ycb1h7x_351 <= 1'b1 ;
   end
  else
  begin
	if (bghmtn1jdjkwzia2pb3cbh_165) 
	begin 
	  gelyksnt5d0kcfitpq81bbwfmurii_154 <= 1'b0 ;
	 end 
	else 
	begin 
		if (t5x58k42d7dxm8hwz7u_540) 
		begin 
			gelyksnt5d0kcfitpq81bbwfmurii_154 <= kns28plwnd9zzr3b39guufsj5x0i42k2_276 ;
		end 
	end 
	if (otjhk6cvx7g0w89x1dn41sqlmmcwbyfh_170) 
	begin 
		u6ss4rdtel85w28r50ycb1h7x_351 <= jzji7l84hxhu1kgqww21q2mr2qajhbq_428 ;
	end 
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	shk295smovublu05a3c1qxu7o70hzz_834 <= 1'b0 ;
	ewlrrb59wpcjj2i7b269u_288 <= 1'b0 ;
   end
  else
  begin
		shk295smovublu05a3c1qxu7o70hzz_834 <= rwfam3and5qvwilrgvgaz_630 ;
		ewlrrb59wpcjj2i7b269u_288 <= dkti3j6lgjk6vvzi7bffq6bkuk_414 ;
  end
end

always @(posedge clk_out_2)
begin
  if (rst_in_0) 
  begin
	a6swfp03824njr1im_290 <= 1'b0 ;
   end
  else
  begin
		a6swfp03824njr1im_290 <= h6tv6asdztkyyowjsedwmp_447 ;
  end
end

defparam yhu80vqbp5xnvbfe6atz0_1413.WRITE_DATA_WIDTH = 290; 
defparam yhu80vqbp5xnvbfe6atz0_1413.FIFO_WRITE_DEPTH = 512; 
defparam yhu80vqbp5xnvbfe6atz0_1413.PROG_FULL_THRESH = 177; 
defparam yhu80vqbp5xnvbfe6atz0_1413.PROG_EMPTY_THRESH = 177; 
defparam yhu80vqbp5xnvbfe6atz0_1413.READ_MODE = "STD"; 
defparam yhu80vqbp5xnvbfe6atz0_1413.WR_DATA_COUNT_WIDTH = 9; 
defparam yhu80vqbp5xnvbfe6atz0_1413.RD_DATA_COUNT_WIDTH = 9; 
defparam yhu80vqbp5xnvbfe6atz0_1413.DOUT_RESET_VALUE = "0"; 
defparam yhu80vqbp5xnvbfe6atz0_1413.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_sync yhu80vqbp5xnvbfe6atz0_1413 (
	.wr_en(imkh18wv2e3vntxot_598),
	.din(syqj2cjdhjnibymjtux28ooaynyck775_24),
	.rd_en(r0qtf48qvubupqtppvo9do29_183),
	.sleep(ageld3n8ecxncnxjzt7pybf6da34oa9_787),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(s00kkkei3thcewk0tb9t_368), 
	.dout(befz1om885zmdfr1tvoqpodl8t_511), 
	.empty(idyxoij8t44zrl2x25lc7soetvqi8sl_417), 
	.prog_full(beenbt2yafrhn7eztgpagzgumljw_193), 
	.full(s6d6xdu829pi09ukpveyqplr24gn_230), 
	.rd_data_count(k18d5idk5w0yay3sooling8l8p4_498), 
	.wr_data_count(kxqj0y7bo10i0z4x8fm4_757), 
	.wr_rst_busy(ayh81mkhjua4x88xsrlqgo6zzpy0e_91), 
	.rd_rst_busy(acefzcp12rtedws17gvdkmz33sm_896), 
	.overflow(lounj37t6w802dnuwwmbhzdatgrav9o7_119), 
	.underflow(feg8f3963kbufpngzbykrugpli099b_475), 
	.sbiterr(q4l9du4fi3b878b63oqx7bhvdc385_767), 
	.dbiterr(rytxi3vixbcjfm9fdn296yhphsdqk1_353), 
	.almost_empty(vi4yaabay744uzu16dfcoe6ajdt_906), 
	.almost_full(ev7tg2vrjw1ihpnh3oq1n2gyltk3i_762), 
	.wr_ack(nsg2vj5lgo48f586u265lkp_99), 
	.data_valid(ptsk7flazeqei74g5p0g_723), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam q6xjv8ygg185w8mi0ruwi_905.WRITE_DATA_WIDTH = 1; 
defparam q6xjv8ygg185w8mi0ruwi_905.FIFO_WRITE_DEPTH = 512; 
defparam q6xjv8ygg185w8mi0ruwi_905.PROG_FULL_THRESH = 177; 
defparam q6xjv8ygg185w8mi0ruwi_905.PROG_EMPTY_THRESH = 177; 
defparam q6xjv8ygg185w8mi0ruwi_905.READ_MODE = "FWFT"; 
defparam q6xjv8ygg185w8mi0ruwi_905.WR_DATA_COUNT_WIDTH = 9; 
defparam q6xjv8ygg185w8mi0ruwi_905.RD_DATA_COUNT_WIDTH = 9; 
defparam q6xjv8ygg185w8mi0ruwi_905.DOUT_RESET_VALUE = "0"; 
defparam q6xjv8ygg185w8mi0ruwi_905.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_sync q6xjv8ygg185w8mi0ruwi_905 (
	.wr_en(jkg8igu76p8uat5mtwcdirh5df_625),
	.din(uaniu72glpmlttkb_862),
	.rd_en(dxv2pixkauig6ym3u5yxbyoffsx_357),
	.sleep(sjiz8ed9rnlvpuvb_525),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(m60x9e5m3gzdkx9xf2ivs_435), 
	.dout(jhlq9ekhhmsp9eqt_636), 
	.empty(sne1xj5jraetit312n7rrnuisa8_775), 
	.prog_full(u1198gm2kb7ctfcpwfwh35t_108), 
	.full(necrpzgihw62g36lqgnxc_269), 
	.rd_data_count(coeixg5mbvdfdqswxvxqrjp_509), 
	.wr_data_count(xxyn505lstus2o9vp_644), 
	.wr_rst_busy(yen33odx8e9dqqzbg90elc8v8xo_534), 
	.rd_rst_busy(bam00xe0148ljqzf2u5b6cox7ammkn3_85), 
	.overflow(n5twg3w133gsdr4jml79px_343), 
	.underflow(fkw7lhoud22tacmr7r2xjz_599), 
	.sbiterr(vvsvu2rsoeb5izhw2twwnlbh40wx93yr_147), 
	.dbiterr(x0mjpcnyhvuy8qyyj0vx3z236ck06hsd_266), 
	.almost_empty(i38n7mkxo1iwmqr82fi7tjuk8_200), 
	.almost_full(lhdir26rqylk55jkv9_364), 
	.wr_ack(qutx7tbpx9558labff6vtb5qt_298), 
	.data_valid(mwmn97v8mq5328m3_394), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam etoilea47dfarfwtwmbs2eg_197.WRITE_DATA_WIDTH = 256; 
defparam etoilea47dfarfwtwmbs2eg_197.FIFO_WRITE_DEPTH = 256; 
defparam etoilea47dfarfwtwmbs2eg_197.PROG_FULL_THRESH = 66; 
defparam etoilea47dfarfwtwmbs2eg_197.PROG_EMPTY_THRESH = 66; 
defparam etoilea47dfarfwtwmbs2eg_197.READ_MODE = "STD"; 
defparam etoilea47dfarfwtwmbs2eg_197.WR_DATA_COUNT_WIDTH = 8; 
defparam etoilea47dfarfwtwmbs2eg_197.RD_DATA_COUNT_WIDTH = 8; 
defparam etoilea47dfarfwtwmbs2eg_197.DOUT_RESET_VALUE = "0"; 
defparam etoilea47dfarfwtwmbs2eg_197.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async etoilea47dfarfwtwmbs2eg_197 (
	.wr_en(kt0vk0vzdho1aqwodl_179),
	.din(cpcx18uglzcf4l0ntl_562),
	.rd_en(h1s8nwivtioerpspthi20lb8r5tac0f_706),
	.sleep(wgsc70ooaic4jttin617knl097gmpkxx_726),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(x8z94b43ya9kem1h98vrwcw_580), 
	.dout(gixv1nkqtngi93c210_414), 
	.empty(r0cbbbnslvbjc9yoolhuxebyw_216), 
	.prog_full(dkti3j6lgjk6vvzi7bffq6bkuk_414), 
	.full(z7p3fn8lo9fwdhard_611), 
	.rd_data_count(ti1ketu6t6qc3oafyjdymp13pj_247), 
	.wr_data_count(t7v5d0zpi0g79x1sqmhylqikithnhf43_588), 
	.wr_rst_busy(pxr99zjx6yeeck0a_494), 
	.rd_rst_busy(clxv0lmvn61vi3nvoe4x_206), 
	.overflow(z3ns7252n0q7c1avcvg71bp709hcw4m_658), 
	.underflow(amhxy5kw542siqlo_205), 
	.sbiterr(bsy9tugoom2h5zauesofm15_758), 
	.dbiterr(t5yrt93d7qa0tm7xm8vs2ah6_697), 
	.almost_empty(nh65cxv8h5lamzgb7v9vd0dmv54v3_64), 
	.almost_full(vab0gaxzv0ucb0xx_123), 
	.wr_ack(hmn3woapt3u4nhvjr8k0i3l0fzaa4xb8_450), 
	.data_valid(x002ngatqlo9e1ig7hp4hso253rjrm0_592), 

	.wr_clk(clk_in_1), 

	.rd_clk(clk_out_1), 
	.rst(rst_in_1) 
); 

defparam b4sto42egz8c7k8ije3wf70750nr_1408.WRITE_DATA_WIDTH = 160; 
defparam b4sto42egz8c7k8ije3wf70750nr_1408.FIFO_WRITE_DEPTH = 256; 
defparam b4sto42egz8c7k8ije3wf70750nr_1408.PROG_FULL_THRESH = 66; 
defparam b4sto42egz8c7k8ije3wf70750nr_1408.PROG_EMPTY_THRESH = 66; 
defparam b4sto42egz8c7k8ije3wf70750nr_1408.READ_MODE = "STD"; 
defparam b4sto42egz8c7k8ije3wf70750nr_1408.WR_DATA_COUNT_WIDTH = 8; 
defparam b4sto42egz8c7k8ije3wf70750nr_1408.RD_DATA_COUNT_WIDTH = 8; 
defparam b4sto42egz8c7k8ije3wf70750nr_1408.DOUT_RESET_VALUE = "0"; 
defparam b4sto42egz8c7k8ije3wf70750nr_1408.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async b4sto42egz8c7k8ije3wf70750nr_1408 (
	.wr_en(gxcm4p9m0sznwn3da53ys1_88),
	.din(qmvhif9gj9wysf3albuaux_605),
	.rd_en(j63rwv7jyi6by326cr3qbk40_760),
	.sleep(b9v673plygcydhp33m6zotsnb_728),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(q4wnialg8f2omn0iy92_530), 
	.dout(uzhdhjb7wiq6jh767ea8_110), 
	.empty(eb2ivhy39mjx0ljp_616), 
	.prog_full(h6tv6asdztkyyowjsedwmp_447), 
	.full(qwpm2p66p77ihb3qv2a_397), 
	.rd_data_count(gek6oti3hh3geokvp77l0m5pxmnkapw_84), 
	.wr_data_count(hq7499z98av4luv77q4vadtg6l_541), 
	.wr_rst_busy(uvdcfem0s5nzfxkb5s08gh_217), 
	.rd_rst_busy(mhk8vphr43gwq65e7t_638), 
	.overflow(qvjlaeu4qrhnjwza_235), 
	.underflow(xrnz0fqrmdyfcqs3o9ylhd4_41), 
	.sbiterr(i2va8gf2e1a94tto_79), 
	.dbiterr(wyvt8p4cbcrxl6k72druqgrmj_739), 
	.almost_empty(a9piefh6nfbpp9vt2wcb690417cwx_757), 
	.almost_full(artf1ezcdgz8ha52ftv644rlaxl50z_537), 
	.wr_ack(cl2wys1x5tjk1u576x6zxx_606), 
	.data_valid(w3rdkm45n5bf7ryxvn4m7_185), 

	.wr_clk(clk_in_2), 

	.rd_clk(clk_out_2), 
	.rst(rst_in_2) 
); 

endmodule 
