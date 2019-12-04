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
// File created: 2019/12/04 18:15:52
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






 reg	op84ii2qe396s2ya6sf0mdc_893;	 initial op84ii2qe396s2ya6sf0mdc_893 = 1'b0 ;
 wire	sdoeqlgihckuoix6km6w1d66ngr5_47 ;
 wire [289:0] d6kr5jt7oc55qlsd9_98 ;
 wire	o8ukbnnw3wkp12838bnv_211 ;
 wire	aaguprtmiilknyh3_164 ;
 wire	qluk8fj43yby2exyl6r7_829 ;
 wire [8:0] myge2lflqem27r9e2h5v639zg67egxmi_876 ;
 wire [8:0] sot0179pi7z8dfqx4y8aabbhnt_423 ;
 wire	ybs6fgrwaki9arg1f18c7amkwl_550 ;
 wire	pzac2m3xx1szaywn1g9_285 ;
 wire	wvm6b0l6mc7ohuusgd_310 ;
 wire	iwz3y7vckwpmdtty89e9x4ko5_1 ;
 wire	hh25suusbwf4l33olnumdvg1h70xj8s_783 ;
 wire	iz0xmtszzt7a68c7amst3b5z_100 ;
 wire	g07mmnc2eitsc5bsefp1oq8rz3n0f95_378 ;
 wire	wpprqa4n0uamudphhb_557 ;
 wire	lt9lg55152bgs0bd8v3a_265 ;
 wire	dsr98p2e9zj2e9cax9eqd9bnfgdm_295 ;
 wire	ix9yetaspum9p6goyqlrwq97ttrx_72 ;
 reg	zuu4rb8webxl648hza2938k3p5d_455;	 initial zuu4rb8webxl648hza2938k3p5d_455 = 1'b0 ;
 wire	cv8owfjvihs2epi7ma23f29ura5j9897_515 ;
 reg	m1v2x72gccgmnd1p9a16fqe_688;	 initial m1v2x72gccgmnd1p9a16fqe_688 = 1'b0 ;
 reg	q2php13hq3qconicyarnw096badfqx_602;	 initial q2php13hq3qconicyarnw096badfqx_602 = 1'b0 ;
 wire	lax752oi2a6m67mpo7ra7d_263 ;
 wire [0:0] aq1ymwll2lnrue6s_537 ;
 wire	fc5h9arn9202uarc1csscrn_480 ;
 wire	wzwvwexx3d8bansz4bajor_736 ;
 wire	nykcs2xiolwgczu5cnueanmju_212 ;
 wire [8:0] dbwz23v4zfn3xs4xch3ngzb8h1t_504 ;
 wire [8:0] jm11ew4jt6cx9mcdw1a_253 ;
 wire	vua6a9nkgqlun7m2_47 ;
 wire	usld2xra9mrlb5rbu_540 ;
 wire	yskdh8a3ap7h2rcj_664 ;
 wire	cjnqmug4s761romym5yziewxyu_356 ;
 wire	ttec9zxpy2odo4roqqp78faqm2mq86ma_28 ;
 wire	vlqmn5laj66egzfqa0meb8rtp68sd_518 ;
 wire	a7ec1nyomjy4iwwwytv_394 ;
 wire	taf7w2n29fjdlu2nn9mlg9qbj_635 ;
 wire	z2n2xoqia4v0tj9vlqwbaoxm_760 ;
 wire	c0qopcuehmcca2wxjfecvr8dnmlf_280 ;
 reg	say0rpp3m4f0uxfxafo_138;	 initial say0rpp3m4f0uxfxafo_138 = 1'b0 ;
 reg	bio5vvnv12pc4wje_663;	 initial bio5vvnv12pc4wje_663 = 1'b1 ;
 reg [8:0] q73nkd6zwm6uild31f1_888;	 initial q73nkd6zwm6uild31f1_888 = 9'b000000000 ;
 reg	kaxy4ong3lcte4nodf6whwmocz840f_443;	 initial kaxy4ong3lcte4nodf6whwmocz840f_443 = 1'b0 ;
 wire	lw785zx3vxeylraha60_599 ;
 wire [255:0] t4ibtbytt3konegy_76 ;
 wire	k0r64xedyg4pbkwqhgezvk7u9lgcfgf_531 ;
 wire	vr4shknjjtnn6m1vvt7e68_275 ;
 wire	xc3lwzt4p8p9vmdxaix3d3n6sdryp_11 ;
 wire [7:0] sglcbqel2nxwsg7lzoz6t0gpat_454 ;
 wire [7:0] x9pqngojyytz3te3qkzl7m4_770 ;
 wire	rrsaibn1jfw2k2ya62t1m6vgl_374 ;
 wire	tlu6r20hje6baayrwi2g5tdx_162 ;
 wire	wdoafdvbkgpk5y9xzx91obn77ipx4a5_782 ;
 wire	m20mjpw5hapfiuh162r4bji_151 ;
 wire	n17124dql02ephuo4i6z7ozp8bc429_545 ;
 wire	zgj39oqfyi4jaucjivxazew5_337 ;
 wire	hjmqj3rpgqhlxlltqwx0l_154 ;
 wire	g2x5hhbtgsawgzub_667 ;
 wire	c7jz3rd1qrs4t0wg31vvuul951r5t_145 ;
 wire	r210s3f7cs5ra7v9kiirs2qtsvdpoj_415 ;
 wire	ycsu2c3eyzovkp0lipjbdqjemmmj9_100 ;
 wire [159:0] cw1c6881q3egtjovg03ws2x9_856 ;
 wire	wxe93r2p7okxj3202qx73ym1iu0bg_31 ;
 wire	tj1yyuqrye9zp3t8ns4ys4oxk1zs431_790 ;
 wire	e2gnq2eegio4868qprh_434 ;
 wire [7:0] dwwyx8p0bf5ss9ylbhy_901 ;
 wire [7:0] frktr7zmgkh5t5hw_534 ;
 wire	iohc8wm964dy49kobt13pcvivup1j_155 ;
 wire	rt8koy23e7ogw08rgaktpbh_809 ;
 wire	gm28he2ch07071zhry0wgsy4_470 ;
 wire	z55peyzwe53nwiudzistrzetnjhz_348 ;
 wire	z7gi7cqm9ikpzef1wcku2fa_811 ;
 wire	gqnofczjm0pyimgm8jsdg52ff_502 ;
 wire	l46c38nzr1c753gbd1ldf0_305 ;
 wire	iawsy9vggd4gx364aptzie746j3d_439 ;
 wire	pm99idoqm8sw0zemtidhwylh2l2x2_532 ;
 wire	gs900qlgk0wldyk8f_14 ;
 reg	js40x22gona8a74mv_356;	 initial js40x22gona8a74mv_356 = 1'b0 ;
 reg	s0qyz625jfzpm7u8zc757xsaw7i3q_805;	 initial s0qyz625jfzpm7u8zc757xsaw7i3q_805 = 1'b0 ;
 reg	ya8320nk2jyxpdmd4qwyljfbito0d_346;	 initial ya8320nk2jyxpdmd4qwyljfbito0d_346 = 1'b0 ;
 wire	rwhxwnmbg3nj7bh1m2f1udmrli_66 ;
 wire [289:0] ni6u0wy4w4m2f897l07uv0frqeias64p_671 ;
 wire	amwwitxzirhfoy5bg1rz_423 ;
 wire [289:0] hv8b6hhg4fjwyixi7nvwo69d49d_506 ;
 wire	yyjycqecslq25ri4b_434 ;
 wire	pqhyx5kjkp8h1ucubq_764 ;
 wire	a3lawewloxu7nxo67aj0brw_412 ;
 wire	ss1foqugdhs1g2455wj9g1l_65 ;
 wire	xs1y75prwgldqy39swwmsfapd9p469h_805 ;
 wire	ti4jglkor138o8m7_788 ;
 wire	vp7mti25ttefu5a5lzis3kogscl_71 ;
 wire	lumssq9woagrgj50ehgf_754 ;
 wire	gbv1yx29zem3c3294i_491 ;
 wire	fzvnhcdd5w3v39l6v_393 ;
 wire	xkuvr3avbgsfww1rfola_595 ;
 wire	xyx96r91t2pjvxawb_596 ;
 wire	gb60rf40j81u2n69_838 ;
 wire	ufl0ufz4816bqgwg9a246_561 ;
 wire [31:0] xicr7uy60ow7itzjlsw9a0_365 ;
 wire [255:0] r03yplt7truyfwvj7z9kztqit_512 ;
 wire	g59zpbla74xhl174p64lyb_186 ;
 wire	k1u8rmf1pmzyz3e6cdp7wt0cc_646 ;
 wire	tizhq2hcjip8v1wp1bbzkvwzkf_892 ;
 wire	sp8mqhjcj28ygn9i5dtjmi2rwroyge_426 ;
 wire	fxn1ix5ryoewib0x65yio936cxn_384 ;
 wire	bull08pe545n983tffj7_885 ;
 wire	a7j4l3eb61amkqw1414xdd37ubaoae_679 ;
 wire	rijmgsnrbzjmyvqth1in_234 ;
 wire	lbdt1snvfiassricqwgdsrjpcq0qx_506 ;
 wire	gwu7xxz68x5ksbd8f304fcdpqzs_871 ;
 wire	vtwrtfi3zq3o2qt04f1mmkjxlwuajuyi_125 ;
 wire	ovv1u95kqhp4oy3tlt837hb3np_708 ;
 wire	jy926vyn92czd5ulp3tu_39 ;
 wire	osw3eubdwz0dicn8yxr_121 ;
 wire	l2ysbo0wwl7e6qhf5jrxk3_264 ;
 wire	qqx3gfpfzx16wxh17ruej73wrtv8l1du_306 ;
 wire [0:0] pqln2dknvx3d97hpcnlg9o54k_147 ;
 wire	mblp324ud93qj0ookvnwcwyamci4c0s_200 ;
 wire	p8drpr0aqnupk9c7wc3djy_523 ;
 wire [8:0] umxaslprezuw39ux_514 ;
 wire	jmjlvapoz5gfq5swgqy_323 ;
 wire	wkpdq6ut8ew5bd8456toplctljgesxws_24 ;
 wire	hjgs4be1z03g5kskz7glz2z5_196 ;
 wire	i35cm8pzo7cc06hao7b7_604 ;
 wire	gscx3nl7n6lrpw9qls_617 ;
 wire	nsc94lf27v2up8jgd8_284 ;
 wire	v75f83f8awsghb2yf5pk1ixswjy07z_532 ;
 wire [255:0] prp2wf6sdb694lroqi7p0a_200 ;
 wire	hzt4kxxesr9pb4xo_630 ;
 wire [255:0] ry6zexxjo5lbe7359r01491e4qf5or_682 ;
 wire	zuv7ygkjwovgfvk3oi17gby_314 ;
 wire	vwcp6hugn72ss3uyvk_756 ;
 wire	ve7fn0jnroojfrhm_735 ;
 wire [159:0] sd0ybc7mip92m20l5irc0r3b9vb3o41c_270 ;
 wire	i267wi13ieqcl20tk9zwyhvs_803 ;
 wire [159:0] exrrjdem69qx702v9lmzvkljoo6oye1_347 ;
 wire	n4qvscyj68a20fk3igndeg2dd8r90_555 ;
 wire	rhxldclphrkm6p0fhanvl6jj_39 ;
 wire	kguh3svkf78luwquiww_719 ;
 wire	dqjqprh32cu3yrx6qsxetdrdvno_109 ;
 wire	nlmy6v3ytbtiudh4w5n65b_118 ;


 assign rwhxwnmbg3nj7bh1m2f1udmrli_66 = 
	 ~(backpressure_in) ;
 assign ni6u0wy4w4m2f897l07uv0frqeias64p_671 = 
	{packet_in_PACKET2_TVALID, packet_in_PACKET2_TDATA, packet_in_PACKET2_TKEEP, packet_in_PACKET2_TLAST} ;
 assign amwwitxzirhfoy5bg1rz_423 	= packet_in_PACKET2_TVALID ;
 assign hv8b6hhg4fjwyixi7nvwo69d49d_506 	= ni6u0wy4w4m2f897l07uv0frqeias64p_671[289:0] ;
 assign yyjycqecslq25ri4b_434 = 
	i35cm8pzo7cc06hao7b7_604 | dqjqprh32cu3yrx6qsxetdrdvno_109 ;
 assign pqhyx5kjkp8h1ucubq_764 = 
	1'b0 ;
 assign a3lawewloxu7nxo67aj0brw_412 = 
	1'b1 ;
 assign ss1foqugdhs1g2455wj9g1l_65 = 
	 ~(cv8owfjvihs2epi7ma23f29ura5j9897_515) ;
 assign xs1y75prwgldqy39swwmsfapd9p469h_805 = 
	nsc94lf27v2up8jgd8_284 & yyjycqecslq25ri4b_434 & gb60rf40j81u2n69_838 ;
 assign ti4jglkor138o8m7_788 = 
	ss1foqugdhs1g2455wj9g1l_65 & zuu4rb8webxl648hza2938k3p5d_455 & gb60rf40j81u2n69_838 & i35cm8pzo7cc06hao7b7_604 & nsc94lf27v2up8jgd8_284 ;
 assign vp7mti25ttefu5a5lzis3kogscl_71 = 
	xs1y75prwgldqy39swwmsfapd9p469h_805 | ti4jglkor138o8m7_788 ;
 assign lumssq9woagrgj50ehgf_754 = 
	rwhxwnmbg3nj7bh1m2f1udmrli_66 & vp7mti25ttefu5a5lzis3kogscl_71 ;
 assign gbv1yx29zem3c3294i_491 = 
	backpressure_in & op84ii2qe396s2ya6sf0mdc_893 & nsc94lf27v2up8jgd8_284 & hjgs4be1z03g5kskz7glz2z5_196 & dqjqprh32cu3yrx6qsxetdrdvno_109 & ss1foqugdhs1g2455wj9g1l_65 ;
 assign fzvnhcdd5w3v39l6v_393 = 
	lumssq9woagrgj50ehgf_754 | gbv1yx29zem3c3294i_491 ;
 assign xkuvr3avbgsfww1rfola_595 	= fzvnhcdd5w3v39l6v_393 ;
 assign xyx96r91t2pjvxawb_596 = 
	1'b0 ;
 assign gb60rf40j81u2n69_838 = 
	 ~(o8ukbnnw3wkp12838bnv_211) ;
 assign ufl0ufz4816bqgwg9a246_561 	= d6kr5jt7oc55qlsd9_98[0] ;
 assign xicr7uy60ow7itzjlsw9a0_365 	= d6kr5jt7oc55qlsd9_98[32:1] ;
 assign r03yplt7truyfwvj7z9kztqit_512 	= d6kr5jt7oc55qlsd9_98[288:33] ;
 assign g59zpbla74xhl174p64lyb_186 	= d6kr5jt7oc55qlsd9_98[289] ;
 assign k1u8rmf1pmzyz3e6cdp7wt0cc_646 = 
	op84ii2qe396s2ya6sf0mdc_893 | q2php13hq3qconicyarnw096badfqx_602 ;
 assign tizhq2hcjip8v1wp1bbzkvwzkf_892 = 
	m1v2x72gccgmnd1p9a16fqe_688 | gb60rf40j81u2n69_838 ;
 assign sp8mqhjcj28ygn9i5dtjmi2rwroyge_426 = 
	tizhq2hcjip8v1wp1bbzkvwzkf_892 & nsc94lf27v2up8jgd8_284 & yyjycqecslq25ri4b_434 ;
 assign fxn1ix5ryoewib0x65yio936cxn_384 = 
	sp8mqhjcj28ygn9i5dtjmi2rwroyge_426 | zuu4rb8webxl648hza2938k3p5d_455 ;
 assign bull08pe545n983tffj7_885 = 
	backpressure_in & g59zpbla74xhl174p64lyb_186 & fxn1ix5ryoewib0x65yio936cxn_384 ;
 assign a7j4l3eb61amkqw1414xdd37ubaoae_679 = 
	hjgs4be1z03g5kskz7glz2z5_196 & kaxy4ong3lcte4nodf6whwmocz840f_443 ;
 assign rijmgsnrbzjmyvqth1in_234 = 
	a7j4l3eb61amkqw1414xdd37ubaoae_679 | i35cm8pzo7cc06hao7b7_604 | ufl0ufz4816bqgwg9a246_561 ;
 assign lbdt1snvfiassricqwgdsrjpcq0qx_506 = 
	rwhxwnmbg3nj7bh1m2f1udmrli_66 & zuu4rb8webxl648hza2938k3p5d_455 & g59zpbla74xhl174p64lyb_186 & rijmgsnrbzjmyvqth1in_234 ;
 assign gwu7xxz68x5ksbd8f304fcdpqzs_871 	= zuu4rb8webxl648hza2938k3p5d_455 ;
 assign vtwrtfi3zq3o2qt04f1mmkjxlwuajuyi_125 	= packet_in_PACKET2_TVALID ;
 assign ovv1u95kqhp4oy3tlt837hb3np_708 = 
	1'b0 ;
 assign jy926vyn92czd5ulp3tu_39 = 
	1'b1 ;
 assign osw3eubdwz0dicn8yxr_121 = (
	((say0rpp3m4f0uxfxafo_138 == 1'b1) && (packet_in_PACKET2_TVALID == 1'b1))?1'b1:
	((bio5vvnv12pc4wje_663 == 1'b1) && (packet_in_PACKET2_TVALID == 1'b1))?1'b1:
	0)  ;
 assign l2ysbo0wwl7e6qhf5jrxk3_264 = (
	((packet_in_PACKET2_TVALID == 1'b1) && (packet_in_PACKET2_TLAST == 1'b1))?1'b1:
	0)  ;
 assign qqx3gfpfzx16wxh17ruej73wrtv8l1du_306 = (
	((packet_in_PACKET2_TVALID == 1'b1) && (packet_in_PACKET2_TLAST == 1'b0))?1'b1:
	0)  ;
 assign pqln2dknvx3d97hpcnlg9o54k_147 = osw3eubdwz0dicn8yxr_121 ;
 assign mblp324ud93qj0ookvnwcwyamci4c0s_200 	= fzvnhcdd5w3v39l6v_393 ;
 assign p8drpr0aqnupk9c7wc3djy_523 = 
	1'b0 ;
 assign umxaslprezuw39ux_514 	= dbwz23v4zfn3xs4xch3ngzb8h1t_504[8:0] ;
 assign jmjlvapoz5gfq5swgqy_323 = (
	((umxaslprezuw39ux_514 != q73nkd6zwm6uild31f1_888))?1'b1:
	0)  ;
 assign wkpdq6ut8ew5bd8456toplctljgesxws_24 = aq1ymwll2lnrue6s_537 ;
 assign hjgs4be1z03g5kskz7glz2z5_196 = aq1ymwll2lnrue6s_537 ;
 assign i35cm8pzo7cc06hao7b7_604 = 
	 ~(hjgs4be1z03g5kskz7glz2z5_196) ;
 assign gscx3nl7n6lrpw9qls_617 	= fc5h9arn9202uarc1csscrn_480 ;
 assign nsc94lf27v2up8jgd8_284 = 
	 ~(fc5h9arn9202uarc1csscrn_480) ;
 assign v75f83f8awsghb2yf5pk1ixswjy07z_532 = 
	dqjqprh32cu3yrx6qsxetdrdvno_109 & nsc94lf27v2up8jgd8_284 & wkpdq6ut8ew5bd8456toplctljgesxws_24 & fzvnhcdd5w3v39l6v_393 ;
 assign prp2wf6sdb694lroqi7p0a_200 = 
	tuple_in_TUPLE0_DATA ;
 assign hzt4kxxesr9pb4xo_630 	= tuple_in_TUPLE0_VALID ;
 assign ry6zexxjo5lbe7359r01491e4qf5or_682 	= prp2wf6sdb694lroqi7p0a_200[255:0] ;
 assign zuv7ygkjwovgfvk3oi17gby_314 = 
	 ~(k0r64xedyg4pbkwqhgezvk7u9lgcfgf_531) ;
 assign vwcp6hugn72ss3uyvk_756 	= v75f83f8awsghb2yf5pk1ixswjy07z_532 ;
 assign ve7fn0jnroojfrhm_735 = 
	1'b0 ;
 assign sd0ybc7mip92m20l5irc0r3b9vb3o41c_270 = 
	tuple_in_TUPLE1_DATA ;
 assign i267wi13ieqcl20tk9zwyhvs_803 	= tuple_in_TUPLE1_VALID ;
 assign exrrjdem69qx702v9lmzvkljoo6oye1_347 	= sd0ybc7mip92m20l5irc0r3b9vb3o41c_270[159:0] ;
 assign n4qvscyj68a20fk3igndeg2dd8r90_555 = 
	 ~(wxe93r2p7okxj3202qx73ym1iu0bg_31) ;
 assign rhxldclphrkm6p0fhanvl6jj_39 	= v75f83f8awsghb2yf5pk1ixswjy07z_532 ;
 assign kguh3svkf78luwquiww_719 = 
	1'b0 ;
 assign dqjqprh32cu3yrx6qsxetdrdvno_109 = 
	gb60rf40j81u2n69_838 & zuv7ygkjwovgfvk3oi17gby_314 & n4qvscyj68a20fk3igndeg2dd8r90_555 ;
 assign nlmy6v3ytbtiudh4w5n65b_118 = 
	js40x22gona8a74mv_356 | s0qyz625jfzpm7u8zc757xsaw7i3q_805 | ya8320nk2jyxpdmd4qwyljfbito0d_346 ;
 assign packet_out_PACKET2_TVALID 	= gwu7xxz68x5ksbd8f304fcdpqzs_871 ;
 assign packet_out_PACKET2_TDATA 	= r03yplt7truyfwvj7z9kztqit_512[255:0] ;
 assign packet_out_PACKET2_TKEEP 	= xicr7uy60ow7itzjlsw9a0_365[31:0] ;
 assign packet_out_PACKET2_TLAST 	= ufl0ufz4816bqgwg9a246_561 ;
 assign packet_in_PACKET2_TREADY 	= packet_out_PACKET2_TREADY ;
 assign tuple_out_TUPLE0_VALID 	= kaxy4ong3lcte4nodf6whwmocz840f_443 ;
 assign tuple_out_TUPLE0_DATA 	= t4ibtbytt3konegy_76[255:0] ;
 assign tuple_out_TUPLE1_VALID 	= kaxy4ong3lcte4nodf6whwmocz840f_443 ;
 assign tuple_out_TUPLE1_DATA 	= cw1c6881q3egtjovg03ws2x9_856[159:0] ;


assign ix9yetaspum9p6goyqlrwq97ttrx_72 = (
	((fzvnhcdd5w3v39l6v_393 == 1'b1))?a3lawewloxu7nxo67aj0brw_412 :
	((rwhxwnmbg3nj7bh1m2f1udmrli_66 == 1'b1))?pqhyx5kjkp8h1ucubq_764 :
	zuu4rb8webxl648hza2938k3p5d_455 ) ;

assign cv8owfjvihs2epi7ma23f29ura5j9897_515 = (
	((zuu4rb8webxl648hza2938k3p5d_455 == 1'b1) && (rwhxwnmbg3nj7bh1m2f1udmrli_66 == 1'b1))?pqhyx5kjkp8h1ucubq_764 :
	zuu4rb8webxl648hza2938k3p5d_455 ) ;



always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	op84ii2qe396s2ya6sf0mdc_893 <= 1'b0 ;
	zuu4rb8webxl648hza2938k3p5d_455 <= 1'b0 ;
	m1v2x72gccgmnd1p9a16fqe_688 <= 1'b0 ;
	q2php13hq3qconicyarnw096badfqx_602 <= 1'b0 ;
	q73nkd6zwm6uild31f1_888 <= 9'b000000000 ;
	js40x22gona8a74mv_356 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		op84ii2qe396s2ya6sf0mdc_893 <= backpressure_in ;
		zuu4rb8webxl648hza2938k3p5d_455 <= ix9yetaspum9p6goyqlrwq97ttrx_72 ;
		m1v2x72gccgmnd1p9a16fqe_688 <= gb60rf40j81u2n69_838 ;
		q2php13hq3qconicyarnw096badfqx_602 <= fzvnhcdd5w3v39l6v_393 ;
		q73nkd6zwm6uild31f1_888 <= umxaslprezuw39ux_514 ;
		js40x22gona8a74mv_356 <= aaguprtmiilknyh3_164 ;
		backpressure_out <= nlmy6v3ytbtiudh4w5n65b_118 ;
  end
end

always @(posedge clk_in_0)
begin
  if (rst_in_0) 
  begin
	say0rpp3m4f0uxfxafo_138 <= 1'b0 ;
	bio5vvnv12pc4wje_663 <= 1'b1 ;
   end
  else
  begin
	if (qqx3gfpfzx16wxh17ruej73wrtv8l1du_306) 
	begin 
	  say0rpp3m4f0uxfxafo_138 <= 1'b0 ;
	 end 
	else 
	begin 
		if (l2ysbo0wwl7e6qhf5jrxk3_264) 
		begin 
			say0rpp3m4f0uxfxafo_138 <= jy926vyn92czd5ulp3tu_39 ;
		end 
	end 
	if (osw3eubdwz0dicn8yxr_121) 
	begin 
		bio5vvnv12pc4wje_663 <= ovv1u95kqhp4oy3tlt837hb3np_708 ;
	end 
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	kaxy4ong3lcte4nodf6whwmocz840f_443 <= 1'b0 ;
	s0qyz625jfzpm7u8zc757xsaw7i3q_805 <= 1'b0 ;
   end
  else
  begin
		kaxy4ong3lcte4nodf6whwmocz840f_443 <= v75f83f8awsghb2yf5pk1ixswjy07z_532 ;
		s0qyz625jfzpm7u8zc757xsaw7i3q_805 <= vr4shknjjtnn6m1vvt7e68_275 ;
  end
end

always @(posedge clk_out_2)
begin
  if (rst_in_0) 
  begin
	ya8320nk2jyxpdmd4qwyljfbito0d_346 <= 1'b0 ;
   end
  else
  begin
		ya8320nk2jyxpdmd4qwyljfbito0d_346 <= tj1yyuqrye9zp3t8ns4ys4oxk1zs431_790 ;
  end
end

defparam mtl11qftctssdjfnft0877dvxdzlk2_280.WRITE_DATA_WIDTH = 290; 
defparam mtl11qftctssdjfnft0877dvxdzlk2_280.FIFO_WRITE_DEPTH = 512; 
defparam mtl11qftctssdjfnft0877dvxdzlk2_280.PROG_FULL_THRESH = 135; 
defparam mtl11qftctssdjfnft0877dvxdzlk2_280.PROG_EMPTY_THRESH = 135; 
defparam mtl11qftctssdjfnft0877dvxdzlk2_280.READ_MODE = "STD"; 
defparam mtl11qftctssdjfnft0877dvxdzlk2_280.WR_DATA_COUNT_WIDTH = 9; 
defparam mtl11qftctssdjfnft0877dvxdzlk2_280.RD_DATA_COUNT_WIDTH = 9; 
defparam mtl11qftctssdjfnft0877dvxdzlk2_280.DOUT_RESET_VALUE = "0"; 
defparam mtl11qftctssdjfnft0877dvxdzlk2_280.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_sync mtl11qftctssdjfnft0877dvxdzlk2_280 (
	.wr_en(amwwitxzirhfoy5bg1rz_423),
	.din(hv8b6hhg4fjwyixi7nvwo69d49d_506),
	.rd_en(xkuvr3avbgsfww1rfola_595),
	.sleep(xyx96r91t2pjvxawb_596),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(sdoeqlgihckuoix6km6w1d66ngr5_47), 
	.dout(d6kr5jt7oc55qlsd9_98), 
	.empty(o8ukbnnw3wkp12838bnv_211), 
	.prog_full(aaguprtmiilknyh3_164), 
	.full(qluk8fj43yby2exyl6r7_829), 
	.rd_data_count(myge2lflqem27r9e2h5v639zg67egxmi_876), 
	.wr_data_count(sot0179pi7z8dfqx4y8aabbhnt_423), 
	.wr_rst_busy(ybs6fgrwaki9arg1f18c7amkwl_550), 
	.rd_rst_busy(pzac2m3xx1szaywn1g9_285), 
	.overflow(wvm6b0l6mc7ohuusgd_310), 
	.underflow(iwz3y7vckwpmdtty89e9x4ko5_1), 
	.sbiterr(hh25suusbwf4l33olnumdvg1h70xj8s_783), 
	.dbiterr(iz0xmtszzt7a68c7amst3b5z_100), 
	.almost_empty(g07mmnc2eitsc5bsefp1oq8rz3n0f95_378), 
	.almost_full(wpprqa4n0uamudphhb_557), 
	.wr_ack(lt9lg55152bgs0bd8v3a_265), 
	.data_valid(dsr98p2e9zj2e9cax9eqd9bnfgdm_295), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam g4ikezkpu02wtgvr5f7gmn49ck_536.WRITE_DATA_WIDTH = 1; 
defparam g4ikezkpu02wtgvr5f7gmn49ck_536.FIFO_WRITE_DEPTH = 512; 
defparam g4ikezkpu02wtgvr5f7gmn49ck_536.PROG_FULL_THRESH = 135; 
defparam g4ikezkpu02wtgvr5f7gmn49ck_536.PROG_EMPTY_THRESH = 135; 
defparam g4ikezkpu02wtgvr5f7gmn49ck_536.READ_MODE = "FWFT"; 
defparam g4ikezkpu02wtgvr5f7gmn49ck_536.WR_DATA_COUNT_WIDTH = 9; 
defparam g4ikezkpu02wtgvr5f7gmn49ck_536.RD_DATA_COUNT_WIDTH = 9; 
defparam g4ikezkpu02wtgvr5f7gmn49ck_536.DOUT_RESET_VALUE = "0"; 
defparam g4ikezkpu02wtgvr5f7gmn49ck_536.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_sync g4ikezkpu02wtgvr5f7gmn49ck_536 (
	.wr_en(vtwrtfi3zq3o2qt04f1mmkjxlwuajuyi_125),
	.din(pqln2dknvx3d97hpcnlg9o54k_147),
	.rd_en(mblp324ud93qj0ookvnwcwyamci4c0s_200),
	.sleep(p8drpr0aqnupk9c7wc3djy_523),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(lax752oi2a6m67mpo7ra7d_263), 
	.dout(aq1ymwll2lnrue6s_537), 
	.empty(fc5h9arn9202uarc1csscrn_480), 
	.prog_full(wzwvwexx3d8bansz4bajor_736), 
	.full(nykcs2xiolwgczu5cnueanmju_212), 
	.rd_data_count(dbwz23v4zfn3xs4xch3ngzb8h1t_504), 
	.wr_data_count(jm11ew4jt6cx9mcdw1a_253), 
	.wr_rst_busy(vua6a9nkgqlun7m2_47), 
	.rd_rst_busy(usld2xra9mrlb5rbu_540), 
	.overflow(yskdh8a3ap7h2rcj_664), 
	.underflow(cjnqmug4s761romym5yziewxyu_356), 
	.sbiterr(ttec9zxpy2odo4roqqp78faqm2mq86ma_28), 
	.dbiterr(vlqmn5laj66egzfqa0meb8rtp68sd_518), 
	.almost_empty(a7ec1nyomjy4iwwwytv_394), 
	.almost_full(taf7w2n29fjdlu2nn9mlg9qbj_635), 
	.wr_ack(z2n2xoqia4v0tj9vlqwbaoxm_760), 
	.data_valid(c0qopcuehmcca2wxjfecvr8dnmlf_280), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam she1vcjqfg74cmpe0rj39gv62vg8rlq_2290.WRITE_DATA_WIDTH = 256; 
defparam she1vcjqfg74cmpe0rj39gv62vg8rlq_2290.FIFO_WRITE_DEPTH = 256; 
defparam she1vcjqfg74cmpe0rj39gv62vg8rlq_2290.PROG_FULL_THRESH = 66; 
defparam she1vcjqfg74cmpe0rj39gv62vg8rlq_2290.PROG_EMPTY_THRESH = 66; 
defparam she1vcjqfg74cmpe0rj39gv62vg8rlq_2290.READ_MODE = "STD"; 
defparam she1vcjqfg74cmpe0rj39gv62vg8rlq_2290.WR_DATA_COUNT_WIDTH = 8; 
defparam she1vcjqfg74cmpe0rj39gv62vg8rlq_2290.RD_DATA_COUNT_WIDTH = 8; 
defparam she1vcjqfg74cmpe0rj39gv62vg8rlq_2290.DOUT_RESET_VALUE = "0"; 
defparam she1vcjqfg74cmpe0rj39gv62vg8rlq_2290.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async she1vcjqfg74cmpe0rj39gv62vg8rlq_2290 (
	.wr_en(hzt4kxxesr9pb4xo_630),
	.din(ry6zexxjo5lbe7359r01491e4qf5or_682),
	.rd_en(vwcp6hugn72ss3uyvk_756),
	.sleep(ve7fn0jnroojfrhm_735),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(lw785zx3vxeylraha60_599), 
	.dout(t4ibtbytt3konegy_76), 
	.empty(k0r64xedyg4pbkwqhgezvk7u9lgcfgf_531), 
	.prog_full(vr4shknjjtnn6m1vvt7e68_275), 
	.full(xc3lwzt4p8p9vmdxaix3d3n6sdryp_11), 
	.rd_data_count(sglcbqel2nxwsg7lzoz6t0gpat_454), 
	.wr_data_count(x9pqngojyytz3te3qkzl7m4_770), 
	.wr_rst_busy(rrsaibn1jfw2k2ya62t1m6vgl_374), 
	.rd_rst_busy(tlu6r20hje6baayrwi2g5tdx_162), 
	.overflow(wdoafdvbkgpk5y9xzx91obn77ipx4a5_782), 
	.underflow(m20mjpw5hapfiuh162r4bji_151), 
	.sbiterr(n17124dql02ephuo4i6z7ozp8bc429_545), 
	.dbiterr(zgj39oqfyi4jaucjivxazew5_337), 
	.almost_empty(hjmqj3rpgqhlxlltqwx0l_154), 
	.almost_full(g2x5hhbtgsawgzub_667), 
	.wr_ack(c7jz3rd1qrs4t0wg31vvuul951r5t_145), 
	.data_valid(r210s3f7cs5ra7v9kiirs2qtsvdpoj_415), 

	.wr_clk(clk_in_1), 

	.rd_clk(clk_out_1), 
	.rst(rst_in_1) 
); 

defparam rie4kw77qbw02hgqxyzvyku_1437.WRITE_DATA_WIDTH = 160; 
defparam rie4kw77qbw02hgqxyzvyku_1437.FIFO_WRITE_DEPTH = 256; 
defparam rie4kw77qbw02hgqxyzvyku_1437.PROG_FULL_THRESH = 66; 
defparam rie4kw77qbw02hgqxyzvyku_1437.PROG_EMPTY_THRESH = 66; 
defparam rie4kw77qbw02hgqxyzvyku_1437.READ_MODE = "STD"; 
defparam rie4kw77qbw02hgqxyzvyku_1437.WR_DATA_COUNT_WIDTH = 8; 
defparam rie4kw77qbw02hgqxyzvyku_1437.RD_DATA_COUNT_WIDTH = 8; 
defparam rie4kw77qbw02hgqxyzvyku_1437.DOUT_RESET_VALUE = "0"; 
defparam rie4kw77qbw02hgqxyzvyku_1437.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async rie4kw77qbw02hgqxyzvyku_1437 (
	.wr_en(i267wi13ieqcl20tk9zwyhvs_803),
	.din(exrrjdem69qx702v9lmzvkljoo6oye1_347),
	.rd_en(rhxldclphrkm6p0fhanvl6jj_39),
	.sleep(kguh3svkf78luwquiww_719),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(ycsu2c3eyzovkp0lipjbdqjemmmj9_100), 
	.dout(cw1c6881q3egtjovg03ws2x9_856), 
	.empty(wxe93r2p7okxj3202qx73ym1iu0bg_31), 
	.prog_full(tj1yyuqrye9zp3t8ns4ys4oxk1zs431_790), 
	.full(e2gnq2eegio4868qprh_434), 
	.rd_data_count(dwwyx8p0bf5ss9ylbhy_901), 
	.wr_data_count(frktr7zmgkh5t5hw_534), 
	.wr_rst_busy(iohc8wm964dy49kobt13pcvivup1j_155), 
	.rd_rst_busy(rt8koy23e7ogw08rgaktpbh_809), 
	.overflow(gm28he2ch07071zhry0wgsy4_470), 
	.underflow(z55peyzwe53nwiudzistrzetnjhz_348), 
	.sbiterr(z7gi7cqm9ikpzef1wcku2fa_811), 
	.dbiterr(gqnofczjm0pyimgm8jsdg52ff_502), 
	.almost_empty(l46c38nzr1c753gbd1ldf0_305), 
	.almost_full(iawsy9vggd4gx364aptzie746j3d_439), 
	.wr_ack(pm99idoqm8sw0zemtidhwylh2l2x2_532), 
	.data_valid(gs900qlgk0wldyk8f_14), 

	.wr_clk(clk_in_2), 

	.rd_clk(clk_out_2), 
	.rst(rst_in_2) 
); 

endmodule 
