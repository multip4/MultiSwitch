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
// File created: 2019/11/21 22:45:49
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
 input	 [21:0] tuple_in_TUPLE1_DATA ;
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
 output	 [21:0] tuple_out_TUPLE1_DATA ;
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






 reg	w51wyqbqv4lm8gck75x0a9501qrtt_82;	 initial w51wyqbqv4lm8gck75x0a9501qrtt_82 = 1'b0 ;
 wire	osn6xmkt6fpev7mnbbqz_722 ;
 wire [265:0] qv75hlg2mrubo20gs1iozcvzzt072b6h_849 ;
 wire	blmx0sev21peltfbl_231 ;
 wire	fcyifx48eh4ai7swobzavhz_787 ;
 wire	xvehmf9ugptf3f7o48c3wpi18ml_57 ;
 wire [8:0] exckwktus3z92d2qhjw_717 ;
 wire [8:0] us52bt6tdjabeagvpi205r26muw7_444 ;
 wire	ut1mzz0791civ6aok2jddwby3jfiil39_428 ;
 wire	m35vkottsa1n6jvd6ec08e_480 ;
 wire	e81u8z2n27u353nyjnmkxk3wd8cg4_734 ;
 wire	w4b8be1by123e4abc487i53w81_407 ;
 wire	hft4fssi5zc8vdi3k6kid_104 ;
 wire	s3git20hjczhifna7b_380 ;
 wire	ndjo2gej6efqer3gv0kcsj0rulgqay_321 ;
 wire	qeve3iau8mtq3b0ee93td29iha35di_306 ;
 wire	xf62om2h1e835dykhptwku4_115 ;
 wire	iggmew2ut2cb0eklqexx4xsil5c_11 ;
 wire	yunsknw8c7tpl5gjmzuq_487 ;
 reg	tft015pb5xxlgkzf_495;	 initial tft015pb5xxlgkzf_495 = 1'b0 ;
 wire	mk1xaj8iqn3wdrxgz44_518 ;
 reg	vht851kt80zdn7bh93_567;	 initial vht851kt80zdn7bh93_567 = 1'b0 ;
 reg	qdwlxb98lfffky8mqmwnuz_577;	 initial qdwlxb98lfffky8mqmwnuz_577 = 1'b0 ;
 wire	ohvxwgc64muveaqdz22i_486 ;
 wire [0:0] ipu07q6t5nz3wkrswub23m2mty7gyiu_417 ;
 wire	duq5mpnvm1fiacsz7c4q7tlc87gn86x_461 ;
 wire	jmdt9p2mz6vpiujyucbn1ajk_477 ;
 wire	j17hn5i030truc6faeohhuyk8x4ttud8_384 ;
 wire [8:0] vekvecwndn9fhu73yg26gut29q3_54 ;
 wire [8:0] v5pn53akm7q5le2k5m6g484oh5t10h_68 ;
 wire	e7s5pgeudow3k0wcxa4d_431 ;
 wire	e2zulq8xqazc2um1y_471 ;
 wire	bq8t7c8jwddnsm7us2uh7n0ef7lj_297 ;
 wire	roisf6d36pzw0q7akkvyktx5i_213 ;
 wire	fezle49ueubh2ghazcdxyo9_487 ;
 wire	p2m0e32hgq9tz0lnmdmrhu_317 ;
 wire	cqrs0ueywxmy8fw87jxg476dkdu4m_544 ;
 wire	ziifhteolfqg211wzxl4oa3t8_681 ;
 wire	g660szh0hzb7s607_895 ;
 wire	z5eaex7v63s9hhwo1r34ux_394 ;
 reg [8:0] dkg7lvtyqi6dbs372lytk6p6pkz_707;	 initial dkg7lvtyqi6dbs372lytk6p6pkz_707 = 9'b000000000 ;
 reg	ycus5giubhheb9ljii_811;	 initial ycus5giubhheb9ljii_811 = 1'b0 ;
 wire	mk7m00txcgsrief823exe_51 ;
 wire [159:0] dewgeypzsf29pcll_863 ;
 wire	y1y2sw2i5wga6b63j01y2cqc5_111 ;
 wire	rtaaeli9bd8fwjd0ws1wf2wjtqt17h6e_904 ;
 wire	ey5xqts1fr5b9kxu8cfffg5t_737 ;
 wire [7:0] op5s49ugiy0lhoubb4blfvy_69 ;
 wire [7:0] l7o8jmm6j0njjp65_529 ;
 wire	s8ejmu55mm853yv5zl7rt0jfobaecs_898 ;
 wire	tkgzaogw2vlfzu9g5n7rt266fv1u_42 ;
 wire	h0xo6kjc3j92d419w_564 ;
 wire	gedrjw2t3lykosu0e8am46j6t1goq5mx_727 ;
 wire	btoy3ud8vp1qwhi4l6e_264 ;
 wire	ssvrto3r3hygy3cj9hz08sqbo_30 ;
 wire	zp7rj1shkc744kvk7ftn_335 ;
 wire	qlal1eafotgp9629t5epo8ipvsui_713 ;
 wire	w6rmev6aerb15bhz7fnhbm4_128 ;
 wire	szuz45k9l9icm19re5ejs72_726 ;
 wire	xltss2zz5scsu04n_60 ;
 wire [21:0] wh5upzra5cfryibg_278 ;
 wire	g95m4dxfr26rfjb1d_37 ;
 wire	b7nt0qt2oulng0aeat1s9a0ox_886 ;
 wire	d0wzdgzo263l1g2zrq4y3mpgxlnlntj4_242 ;
 wire [7:0] s57u1iql7ynj4hkgyxd1e_252 ;
 wire [7:0] ku4g69vkn8ti937b9z1sznp_482 ;
 wire	njfmwuub38p3wukjn7n86yqx9fa49o_403 ;
 wire	wv5ep72fbwb430zpm61_723 ;
 wire	cucq3mbjyap7vg0okbmi8y56_311 ;
 wire	q94yba6jblsq4o0jzsfcjsybzq8r_687 ;
 wire	qa2n0pbkojkozwcorjcq9w8hlg8s7ny_537 ;
 wire	si8u89e1mweuwdn257fr83pvzlfi_218 ;
 wire	wihy015lhogbgefw4eeaj7lv7nua0d_518 ;
 wire	ejlsnp71m52czpewuit8jfa_238 ;
 wire	b7ntggrz8ip35xuf2esc_818 ;
 wire	myi2czih5l55xqt1wrj6ld7_186 ;
 reg	ibjlbyai17mclwmju40a_11;	 initial ibjlbyai17mclwmju40a_11 = 1'b0 ;
 reg	vuik7yygk6ai9kreanh_558;	 initial vuik7yygk6ai9kreanh_558 = 1'b0 ;
 reg	zy67kris7id1sx0ogenqjx7ur_444;	 initial zy67kris7id1sx0ogenqjx7ur_444 = 1'b0 ;
 wire	axua6a3eplebqa5e78l2_305 ;
 wire [265:0] tml90dhv83w2k06hz_836 ;
 wire	ad389jq36n7cistwz_886 ;
 wire [265:0] o9lktds2wcl8bshv_56 ;
 wire	y33v6ay8e4sctib6k_668 ;
 wire	fr1hm4lfi0mxr1mfwc3w5y1abolt_304 ;
 wire	cg6ymvkvatlzbwf2vix8nrjf9a1ar_450 ;
 wire	xl5st9g68xdt2fwm1mfwzxkbnjuj_897 ;
 wire	qne3kriivijtbb4pbmiduzqqxeklc9n6_591 ;
 wire	w13nm6eysrim3ldeuanfxk6fojc9nuvm_236 ;
 wire	hqsbddtophviz15b_720 ;
 wire	br5okeutno4k2wqupg_850 ;
 wire	pqns7rmgz4cgdm0ws7vyyo3o1atcp_162 ;
 wire	vic8tad2rd9gn6t56jdk_510 ;
 wire [5:0] l4k6o50py9r5l4kq785_336 ;
 wire [255:0] g6rdewrvtib2ym50r28p4zh07k5sv3_523 ;
 wire	w5hn1psshko7irdbp64u7kafkta5m6_786 ;
 wire	gk7pczgdyf6xe62yivwzz7nkbelvs1k_436 ;
 wire	vv2hfnzzd1hjkn9h3aepi2km65s2_366 ;
 wire	lc8elg8ejdca96p4p675uek13ptqzw_740 ;
 wire	p12cb239pwqwqkdz0e66916g8ro7y_506 ;
 wire [0:0] rx3lsgjuxwsnyq6c_313 ;
 wire	uu5jnr1d4yd41q6bazuuyf7gqsp17p1_897 ;
 wire	eg8osdegrebft14003vnn3wgrm_216 ;
 wire [8:0] kf1afz2ptj83d2nq1p8081t_198 ;
 wire	bpildvu93uo36m7y1_79 ;
 wire	ilewdsbu05xazm2e9_790 ;
 wire	epe5evg91hy4noydkz8o3mq73v_481 ;
 wire	jv7uofjqatm5gsfwtusbhjdsrjbas3_337 ;
 wire	sasdxn3f1i8yfgmoqo28_335 ;
 wire	rmhprios7d93qxpnr_4 ;
 wire	i0vxwiv2y718k27oekxi565mgqk_672 ;
 wire [159:0] w0p5o1k50zmhycw1uv8li7uwb_177 ;
 wire	ur5b43ag8acecp02vpd3isqid6j9_874 ;
 wire [159:0] kg19kav9dzjzb4y5qkd3e7o6jma_667 ;
 wire	y154k93km7lxujxli7yr0y_493 ;
 wire	mvn7bwi5fiekllc4fwbk6593_638 ;
 wire	h3stpbljedatdoyglaqih283v_65 ;
 wire [21:0] lmpo2uhbswbdo5gaq6yfv_207 ;
 wire	a6hntoee0tqtq01ptolnmpr7dt42g_707 ;
 wire [21:0] qsp2iet0776axc1t_229 ;
 wire	bajim9ct7w08ynw7z_190 ;
 wire	z0eorp3t37zeetz6s83dxy_409 ;
 wire	yenshnu0o4j1sbvok7a65hn6w_399 ;
 wire	u6auvvmsejc8llwska9ifz_239 ;
 wire	oa8k6kzfyajkil1fwds_543 ;


 assign axua6a3eplebqa5e78l2_305 = 
	 ~(backpressure_in) ;
 assign tml90dhv83w2k06hz_836 = 
	{packet_in_PACKET2_SOF, packet_in_PACKET2_EOF, packet_in_PACKET2_VAL, packet_in_PACKET2_DAT, packet_in_PACKET2_CNT, packet_in_PACKET2_ERR} ;
 assign ad389jq36n7cistwz_886 	= packet_in_PACKET2_VAL ;
 assign o9lktds2wcl8bshv_56 	= tml90dhv83w2k06hz_836[265:0] ;
 assign y33v6ay8e4sctib6k_668 = 
	jv7uofjqatm5gsfwtusbhjdsrjbas3_337 | u6auvvmsejc8llwska9ifz_239 ;
 assign fr1hm4lfi0mxr1mfwc3w5y1abolt_304 = 
	1'b0 ;
 assign cg6ymvkvatlzbwf2vix8nrjf9a1ar_450 = 
	1'b1 ;
 assign xl5st9g68xdt2fwm1mfwzxkbnjuj_897 = 
	 ~(mk1xaj8iqn3wdrxgz44_518) ;
 assign qne3kriivijtbb4pbmiduzqqxeklc9n6_591 = 
	axua6a3eplebqa5e78l2_305 & rmhprios7d93qxpnr_4 & y33v6ay8e4sctib6k_668 ;
 assign w13nm6eysrim3ldeuanfxk6fojc9nuvm_236 	= qne3kriivijtbb4pbmiduzqqxeklc9n6_591 ;
 assign hqsbddtophviz15b_720 	= w13nm6eysrim3ldeuanfxk6fojc9nuvm_236 ;
 assign br5okeutno4k2wqupg_850 = 
	1'b0 ;
 assign pqns7rmgz4cgdm0ws7vyyo3o1atcp_162 = 
	 ~(blmx0sev21peltfbl_231) ;
 assign vic8tad2rd9gn6t56jdk_510 	= qv75hlg2mrubo20gs1iozcvzzt072b6h_849[0] ;
 assign l4k6o50py9r5l4kq785_336 	= qv75hlg2mrubo20gs1iozcvzzt072b6h_849[6:1] ;
 assign g6rdewrvtib2ym50r28p4zh07k5sv3_523 	= qv75hlg2mrubo20gs1iozcvzzt072b6h_849[262:7] ;
 assign w5hn1psshko7irdbp64u7kafkta5m6_786 	= qv75hlg2mrubo20gs1iozcvzzt072b6h_849[263] ;
 assign gk7pczgdyf6xe62yivwzz7nkbelvs1k_436 	= qv75hlg2mrubo20gs1iozcvzzt072b6h_849[264] ;
 assign vv2hfnzzd1hjkn9h3aepi2km65s2_366 	= qv75hlg2mrubo20gs1iozcvzzt072b6h_849[265] ;
 assign lc8elg8ejdca96p4p675uek13ptqzw_740 = 
	qdwlxb98lfffky8mqmwnuz_577 & w5hn1psshko7irdbp64u7kafkta5m6_786 ;
 assign p12cb239pwqwqkdz0e66916g8ro7y_506 	= packet_in_PACKET2_VAL ;
 assign rx3lsgjuxwsnyq6c_313 = packet_in_PACKET2_SOF ;
 assign uu5jnr1d4yd41q6bazuuyf7gqsp17p1_897 	= w13nm6eysrim3ldeuanfxk6fojc9nuvm_236 ;
 assign eg8osdegrebft14003vnn3wgrm_216 = 
	1'b0 ;
 assign kf1afz2ptj83d2nq1p8081t_198 	= vekvecwndn9fhu73yg26gut29q3_54[8:0] ;
 assign bpildvu93uo36m7y1_79 = (
	((kf1afz2ptj83d2nq1p8081t_198 != dkg7lvtyqi6dbs372lytk6p6pkz_707))?1'b1:
	0)  ;
 assign ilewdsbu05xazm2e9_790 = ipu07q6t5nz3wkrswub23m2mty7gyiu_417 ;
 assign epe5evg91hy4noydkz8o3mq73v_481 = ipu07q6t5nz3wkrswub23m2mty7gyiu_417 ;
 assign jv7uofjqatm5gsfwtusbhjdsrjbas3_337 = 
	 ~(epe5evg91hy4noydkz8o3mq73v_481) ;
 assign sasdxn3f1i8yfgmoqo28_335 	= duq5mpnvm1fiacsz7c4q7tlc87gn86x_461 ;
 assign rmhprios7d93qxpnr_4 = 
	 ~(duq5mpnvm1fiacsz7c4q7tlc87gn86x_461) ;
 assign i0vxwiv2y718k27oekxi565mgqk_672 = 
	axua6a3eplebqa5e78l2_305 & u6auvvmsejc8llwska9ifz_239 & rmhprios7d93qxpnr_4 & ilewdsbu05xazm2e9_790 ;
 assign w0p5o1k50zmhycw1uv8li7uwb_177 = 
	tuple_in_TUPLE0_DATA ;
 assign ur5b43ag8acecp02vpd3isqid6j9_874 	= tuple_in_TUPLE0_VALID ;
 assign kg19kav9dzjzb4y5qkd3e7o6jma_667 	= w0p5o1k50zmhycw1uv8li7uwb_177[159:0] ;
 assign y154k93km7lxujxli7yr0y_493 = 
	 ~(y1y2sw2i5wga6b63j01y2cqc5_111) ;
 assign mvn7bwi5fiekllc4fwbk6593_638 	= i0vxwiv2y718k27oekxi565mgqk_672 ;
 assign h3stpbljedatdoyglaqih283v_65 = 
	1'b0 ;
 assign lmpo2uhbswbdo5gaq6yfv_207 = 
	tuple_in_TUPLE1_DATA ;
 assign a6hntoee0tqtq01ptolnmpr7dt42g_707 	= tuple_in_TUPLE1_VALID ;
 assign qsp2iet0776axc1t_229 	= lmpo2uhbswbdo5gaq6yfv_207[21:0] ;
 assign bajim9ct7w08ynw7z_190 = 
	 ~(g95m4dxfr26rfjb1d_37) ;
 assign z0eorp3t37zeetz6s83dxy_409 	= i0vxwiv2y718k27oekxi565mgqk_672 ;
 assign yenshnu0o4j1sbvok7a65hn6w_399 = 
	1'b0 ;
 assign u6auvvmsejc8llwska9ifz_239 = 
	pqns7rmgz4cgdm0ws7vyyo3o1atcp_162 & y154k93km7lxujxli7yr0y_493 & bajim9ct7w08ynw7z_190 ;
 assign oa8k6kzfyajkil1fwds_543 = 
	ibjlbyai17mclwmju40a_11 | vuik7yygk6ai9kreanh_558 | zy67kris7id1sx0ogenqjx7ur_444 ;
 assign packet_out_PACKET2_SOF 	= vv2hfnzzd1hjkn9h3aepi2km65s2_366 ;
 assign packet_out_PACKET2_EOF 	= gk7pczgdyf6xe62yivwzz7nkbelvs1k_436 ;
 assign packet_out_PACKET2_VAL 	= lc8elg8ejdca96p4p675uek13ptqzw_740 ;
 assign packet_out_PACKET2_DAT 	= g6rdewrvtib2ym50r28p4zh07k5sv3_523[255:0] ;
 assign packet_out_PACKET2_CNT 	= l4k6o50py9r5l4kq785_336[5:0] ;
 assign packet_out_PACKET2_ERR 	= vic8tad2rd9gn6t56jdk_510 ;
 assign packet_in_PACKET2_RDY 	= packet_out_PACKET2_RDY ;
 assign tuple_out_TUPLE0_VALID 	= ycus5giubhheb9ljii_811 ;
 assign tuple_out_TUPLE0_DATA 	= dewgeypzsf29pcll_863[159:0] ;
 assign tuple_out_TUPLE1_VALID 	= ycus5giubhheb9ljii_811 ;
 assign tuple_out_TUPLE1_DATA 	= wh5upzra5cfryibg_278[21:0] ;


assign yunsknw8c7tpl5gjmzuq_487 = (
	((w13nm6eysrim3ldeuanfxk6fojc9nuvm_236 == 1'b1))?cg6ymvkvatlzbwf2vix8nrjf9a1ar_450 :
	((axua6a3eplebqa5e78l2_305 == 1'b1))?fr1hm4lfi0mxr1mfwc3w5y1abolt_304 :
	tft015pb5xxlgkzf_495 ) ;

assign mk1xaj8iqn3wdrxgz44_518 = (
	((tft015pb5xxlgkzf_495 == 1'b1) && (axua6a3eplebqa5e78l2_305 == 1'b1))?fr1hm4lfi0mxr1mfwc3w5y1abolt_304 :
	tft015pb5xxlgkzf_495 ) ;



always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	w51wyqbqv4lm8gck75x0a9501qrtt_82 <= 1'b0 ;
	tft015pb5xxlgkzf_495 <= 1'b0 ;
	vht851kt80zdn7bh93_567 <= 1'b0 ;
	qdwlxb98lfffky8mqmwnuz_577 <= 1'b0 ;
	dkg7lvtyqi6dbs372lytk6p6pkz_707 <= 9'b000000000 ;
	ibjlbyai17mclwmju40a_11 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		w51wyqbqv4lm8gck75x0a9501qrtt_82 <= backpressure_in ;
		tft015pb5xxlgkzf_495 <= yunsknw8c7tpl5gjmzuq_487 ;
		vht851kt80zdn7bh93_567 <= pqns7rmgz4cgdm0ws7vyyo3o1atcp_162 ;
		qdwlxb98lfffky8mqmwnuz_577 <= w13nm6eysrim3ldeuanfxk6fojc9nuvm_236 ;
		dkg7lvtyqi6dbs372lytk6p6pkz_707 <= kf1afz2ptj83d2nq1p8081t_198 ;
		ibjlbyai17mclwmju40a_11 <= fcyifx48eh4ai7swobzavhz_787 ;
		backpressure_out <= oa8k6kzfyajkil1fwds_543 ;
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	ycus5giubhheb9ljii_811 <= 1'b0 ;
	vuik7yygk6ai9kreanh_558 <= 1'b0 ;
   end
  else
  begin
		ycus5giubhheb9ljii_811 <= i0vxwiv2y718k27oekxi565mgqk_672 ;
		vuik7yygk6ai9kreanh_558 <= rtaaeli9bd8fwjd0ws1wf2wjtqt17h6e_904 ;
  end
end

always @(posedge clk_out_2)
begin
  if (rst_in_0) 
  begin
	zy67kris7id1sx0ogenqjx7ur_444 <= 1'b0 ;
   end
  else
  begin
		zy67kris7id1sx0ogenqjx7ur_444 <= b7nt0qt2oulng0aeat1s9a0ox_886 ;
  end
end

defparam trjj2tshd05n3fejqgec_2322.WRITE_DATA_WIDTH = 266; 
defparam trjj2tshd05n3fejqgec_2322.FIFO_WRITE_DEPTH = 512; 
defparam trjj2tshd05n3fejqgec_2322.PROG_FULL_THRESH = 129; 
defparam trjj2tshd05n3fejqgec_2322.PROG_EMPTY_THRESH = 129; 
defparam trjj2tshd05n3fejqgec_2322.READ_MODE = "STD"; 
defparam trjj2tshd05n3fejqgec_2322.WR_DATA_COUNT_WIDTH = 9; 
defparam trjj2tshd05n3fejqgec_2322.RD_DATA_COUNT_WIDTH = 9; 
defparam trjj2tshd05n3fejqgec_2322.DOUT_RESET_VALUE = "0"; 
defparam trjj2tshd05n3fejqgec_2322.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_sync trjj2tshd05n3fejqgec_2322 (
	.wr_en(ad389jq36n7cistwz_886),
	.din(o9lktds2wcl8bshv_56),
	.rd_en(hqsbddtophviz15b_720),
	.sleep(br5okeutno4k2wqupg_850),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(osn6xmkt6fpev7mnbbqz_722), 
	.dout(qv75hlg2mrubo20gs1iozcvzzt072b6h_849), 
	.empty(blmx0sev21peltfbl_231), 
	.prog_full(fcyifx48eh4ai7swobzavhz_787), 
	.full(xvehmf9ugptf3f7o48c3wpi18ml_57), 
	.rd_data_count(exckwktus3z92d2qhjw_717), 
	.wr_data_count(us52bt6tdjabeagvpi205r26muw7_444), 
	.wr_rst_busy(ut1mzz0791civ6aok2jddwby3jfiil39_428), 
	.rd_rst_busy(m35vkottsa1n6jvd6ec08e_480), 
	.overflow(e81u8z2n27u353nyjnmkxk3wd8cg4_734), 
	.underflow(w4b8be1by123e4abc487i53w81_407), 
	.sbiterr(hft4fssi5zc8vdi3k6kid_104), 
	.dbiterr(s3git20hjczhifna7b_380), 
	.almost_empty(ndjo2gej6efqer3gv0kcsj0rulgqay_321), 
	.almost_full(qeve3iau8mtq3b0ee93td29iha35di_306), 
	.wr_ack(xf62om2h1e835dykhptwku4_115), 
	.data_valid(iggmew2ut2cb0eklqexx4xsil5c_11), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam chxsj1j94tdvjfpjy_1384.WRITE_DATA_WIDTH = 1; 
defparam chxsj1j94tdvjfpjy_1384.FIFO_WRITE_DEPTH = 512; 
defparam chxsj1j94tdvjfpjy_1384.PROG_FULL_THRESH = 129; 
defparam chxsj1j94tdvjfpjy_1384.PROG_EMPTY_THRESH = 129; 
defparam chxsj1j94tdvjfpjy_1384.READ_MODE = "FWFT"; 
defparam chxsj1j94tdvjfpjy_1384.WR_DATA_COUNT_WIDTH = 9; 
defparam chxsj1j94tdvjfpjy_1384.RD_DATA_COUNT_WIDTH = 9; 
defparam chxsj1j94tdvjfpjy_1384.DOUT_RESET_VALUE = "0"; 
defparam chxsj1j94tdvjfpjy_1384.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_sync chxsj1j94tdvjfpjy_1384 (
	.wr_en(p12cb239pwqwqkdz0e66916g8ro7y_506),
	.din(rx3lsgjuxwsnyq6c_313),
	.rd_en(uu5jnr1d4yd41q6bazuuyf7gqsp17p1_897),
	.sleep(eg8osdegrebft14003vnn3wgrm_216),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(ohvxwgc64muveaqdz22i_486), 
	.dout(ipu07q6t5nz3wkrswub23m2mty7gyiu_417), 
	.empty(duq5mpnvm1fiacsz7c4q7tlc87gn86x_461), 
	.prog_full(jmdt9p2mz6vpiujyucbn1ajk_477), 
	.full(j17hn5i030truc6faeohhuyk8x4ttud8_384), 
	.rd_data_count(vekvecwndn9fhu73yg26gut29q3_54), 
	.wr_data_count(v5pn53akm7q5le2k5m6g484oh5t10h_68), 
	.wr_rst_busy(e7s5pgeudow3k0wcxa4d_431), 
	.rd_rst_busy(e2zulq8xqazc2um1y_471), 
	.overflow(bq8t7c8jwddnsm7us2uh7n0ef7lj_297), 
	.underflow(roisf6d36pzw0q7akkvyktx5i_213), 
	.sbiterr(fezle49ueubh2ghazcdxyo9_487), 
	.dbiterr(p2m0e32hgq9tz0lnmdmrhu_317), 
	.almost_empty(cqrs0ueywxmy8fw87jxg476dkdu4m_544), 
	.almost_full(ziifhteolfqg211wzxl4oa3t8_681), 
	.wr_ack(g660szh0hzb7s607_895), 
	.data_valid(z5eaex7v63s9hhwo1r34ux_394), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam bp5bzoshcgfve3wrcf9beq3yh55_1523.WRITE_DATA_WIDTH = 160; 
defparam bp5bzoshcgfve3wrcf9beq3yh55_1523.FIFO_WRITE_DEPTH = 256; 
defparam bp5bzoshcgfve3wrcf9beq3yh55_1523.PROG_FULL_THRESH = 66; 
defparam bp5bzoshcgfve3wrcf9beq3yh55_1523.PROG_EMPTY_THRESH = 66; 
defparam bp5bzoshcgfve3wrcf9beq3yh55_1523.READ_MODE = "STD"; 
defparam bp5bzoshcgfve3wrcf9beq3yh55_1523.WR_DATA_COUNT_WIDTH = 8; 
defparam bp5bzoshcgfve3wrcf9beq3yh55_1523.RD_DATA_COUNT_WIDTH = 8; 
defparam bp5bzoshcgfve3wrcf9beq3yh55_1523.DOUT_RESET_VALUE = "0"; 
defparam bp5bzoshcgfve3wrcf9beq3yh55_1523.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async bp5bzoshcgfve3wrcf9beq3yh55_1523 (
	.wr_en(ur5b43ag8acecp02vpd3isqid6j9_874),
	.din(kg19kav9dzjzb4y5qkd3e7o6jma_667),
	.rd_en(mvn7bwi5fiekllc4fwbk6593_638),
	.sleep(h3stpbljedatdoyglaqih283v_65),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(mk7m00txcgsrief823exe_51), 
	.dout(dewgeypzsf29pcll_863), 
	.empty(y1y2sw2i5wga6b63j01y2cqc5_111), 
	.prog_full(rtaaeli9bd8fwjd0ws1wf2wjtqt17h6e_904), 
	.full(ey5xqts1fr5b9kxu8cfffg5t_737), 
	.rd_data_count(op5s49ugiy0lhoubb4blfvy_69), 
	.wr_data_count(l7o8jmm6j0njjp65_529), 
	.wr_rst_busy(s8ejmu55mm853yv5zl7rt0jfobaecs_898), 
	.rd_rst_busy(tkgzaogw2vlfzu9g5n7rt266fv1u_42), 
	.overflow(h0xo6kjc3j92d419w_564), 
	.underflow(gedrjw2t3lykosu0e8am46j6t1goq5mx_727), 
	.sbiterr(btoy3ud8vp1qwhi4l6e_264), 
	.dbiterr(ssvrto3r3hygy3cj9hz08sqbo_30), 
	.almost_empty(zp7rj1shkc744kvk7ftn_335), 
	.almost_full(qlal1eafotgp9629t5epo8ipvsui_713), 
	.wr_ack(w6rmev6aerb15bhz7fnhbm4_128), 
	.data_valid(szuz45k9l9icm19re5ejs72_726), 

	.wr_clk(clk_in_1), 

	.rd_clk(clk_out_1), 
	.rst(rst_in_1) 
); 

defparam o0fdm4m1ybpyfexyon79_167.WRITE_DATA_WIDTH = 22; 
defparam o0fdm4m1ybpyfexyon79_167.FIFO_WRITE_DEPTH = 256; 
defparam o0fdm4m1ybpyfexyon79_167.PROG_FULL_THRESH = 65; 
defparam o0fdm4m1ybpyfexyon79_167.PROG_EMPTY_THRESH = 65; 
defparam o0fdm4m1ybpyfexyon79_167.READ_MODE = "STD"; 
defparam o0fdm4m1ybpyfexyon79_167.WR_DATA_COUNT_WIDTH = 8; 
defparam o0fdm4m1ybpyfexyon79_167.RD_DATA_COUNT_WIDTH = 8; 
defparam o0fdm4m1ybpyfexyon79_167.DOUT_RESET_VALUE = "0"; 
defparam o0fdm4m1ybpyfexyon79_167.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_async o0fdm4m1ybpyfexyon79_167 (
	.wr_en(a6hntoee0tqtq01ptolnmpr7dt42g_707),
	.din(qsp2iet0776axc1t_229),
	.rd_en(z0eorp3t37zeetz6s83dxy_409),
	.sleep(yenshnu0o4j1sbvok7a65hn6w_399),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(xltss2zz5scsu04n_60), 
	.dout(wh5upzra5cfryibg_278), 
	.empty(g95m4dxfr26rfjb1d_37), 
	.prog_full(b7nt0qt2oulng0aeat1s9a0ox_886), 
	.full(d0wzdgzo263l1g2zrq4y3mpgxlnlntj4_242), 
	.rd_data_count(s57u1iql7ynj4hkgyxd1e_252), 
	.wr_data_count(ku4g69vkn8ti937b9z1sznp_482), 
	.wr_rst_busy(njfmwuub38p3wukjn7n86yqx9fa49o_403), 
	.rd_rst_busy(wv5ep72fbwb430zpm61_723), 
	.overflow(cucq3mbjyap7vg0okbmi8y56_311), 
	.underflow(q94yba6jblsq4o0jzsfcjsybzq8r_687), 
	.sbiterr(qa2n0pbkojkozwcorjcq9w8hlg8s7ny_537), 
	.dbiterr(si8u89e1mweuwdn257fr83pvzlfi_218), 
	.almost_empty(wihy015lhogbgefw4eeaj7lv7nua0d_518), 
	.almost_full(ejlsnp71m52czpewuit8jfa_238), 
	.wr_ack(b7ntggrz8ip35xuf2esc_818), 
	.data_valid(myi2czih5l55xqt1wrj6ld7_186), 

	.wr_clk(clk_in_2), 

	.rd_clk(clk_out_2), 
	.rst(rst_in_2) 
); 

endmodule 
