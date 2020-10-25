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
// File created: 2020/10/03 20:31:34
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






 reg	x4dkpsw51305whx1r4u2ut56_569;	 initial x4dkpsw51305whx1r4u2ut56_569 = 1'b0 ;
 wire	meng435y1p9s1zfbtvf8iz_736 ;
 wire [289:0] cd9yo44k5jmvjiwd7b2z7idhsy_812 ;
 wire	bpshgpej11atznknoyx3scxo3yy8_564 ;
 wire	dqpogcyvir38ykqsnlqyynighytmch_476 ;
 wire	wfut7rodipjsty1781o8vrqthx7b9_425 ;
 wire [8:0] omtql4f28gaiproy9jl_113 ;
 wire [8:0] lguc2aw576pqkvqijktgga_273 ;
 wire	dqnz4iiek0ielisfdrj496u8xkwa5b_182 ;
 wire	svi5ekrs1roni7frwgnx0asj4x5u3l1_618 ;
 wire	nt2ud0z0r7p9tu9bu8bc1ev1e7r3_116 ;
 wire	eil4wc61vcqnyklh7_71 ;
 wire	bt2r6atlvjyar7blofix0b1jk_422 ;
 wire	ky1u6esqtc0cra0m4cj2o8pa4igyzub_702 ;
 wire	wtfngjkljvvr3fbqpcxm_753 ;
 wire	nuwly2qfacbo4cg9i41ipw_115 ;
 wire	pzcc54wgvy8f70i3y_385 ;
 wire	wet8pnfgox3kxxlcdgmblu95h1p7qpd_616 ;
 wire	zm506s8za5fghylfpjwbh2dbgihf2j7_540 ;
 reg	eja0egol73ocj3p2i6k2nsefmxju1us_718;	 initial eja0egol73ocj3p2i6k2nsefmxju1us_718 = 1'b0 ;
 wire	r92pqpwp11c9i75255gf49b4_505 ;
 reg	tei8xuch71cwdq4zdejtmt_265;	 initial tei8xuch71cwdq4zdejtmt_265 = 1'b0 ;
 reg	oa4q29fvvb94khrb79o7hhcs3t4j_400;	 initial oa4q29fvvb94khrb79o7hhcs3t4j_400 = 1'b0 ;
 wire	l8vjovlekkoib7zl2shhvsx_757 ;
 wire [0:0] verfh11ins6lhjcwzv68uh6x1s774n_841 ;
 wire	l5b7e354dvr7esaz2o5cd69u0r6qr2un_96 ;
 wire	vntgjwbckwuxk3onzqti6_554 ;
 wire	ma30caa4lwj7do8yifvgsiv903ipdred_246 ;
 wire [8:0] xxki8da9wvkhximwptyubq_450 ;
 wire [8:0] p68f1ahqr5s74m33n2wbtl6gykju3o6e_835 ;
 wire	gvkbbz50k9eey87mkg6it5yv1f93efs_594 ;
 wire	c02r8n0c5xqyttpklm4wf5mgh5ehc_760 ;
 wire	amyx6os0422kjxg8v4mlfukekh74p_124 ;
 wire	w1o5mqc9ntn3lrv893if35_8 ;
 wire	djorteliknz0t9jabhrrwqcsi1yi0u_458 ;
 wire	f5qk0zhflta9tkdwroqyq6ud8_22 ;
 wire	viaq9hgz0c7ru3cse_333 ;
 wire	oess9wdw78amymrn5p68yss39ay_604 ;
 wire	vnhen30xirffo9jj0zu5cwx3ghd15_611 ;
 wire	k5nhnmhclvljuny2v_581 ;
 reg	ta9r6t3sd6dyu2yfy94xqol_728;	 initial ta9r6t3sd6dyu2yfy94xqol_728 = 1'b0 ;
 reg	sbmfi8i4xfzxo24u2oxrw_468;	 initial sbmfi8i4xfzxo24u2oxrw_468 = 1'b1 ;
 reg [8:0] l9yyywsjg1g4d0rrcz58_796;	 initial l9yyywsjg1g4d0rrcz58_796 = 9'b000000000 ;
 reg	u0f4cmddfdrhh8q50veo3w_260;	 initial u0f4cmddfdrhh8q50veo3w_260 = 1'b0 ;
 wire	zgmey44au2yukrzsld3fdbc3rt_106 ;
 wire [255:0] u1n4bxvd8hmto8ku3u4z9kic0qya_374 ;
 wire	bx3nkmweolt94uu4743u5heh5lm_691 ;
 wire	uevfw2p29rriv6eq_168 ;
 wire	mbwd2unj6ihan384e6_365 ;
 wire [7:0] lv8fnr4nc99xnfqswk6bs_301 ;
 wire [7:0] l09e04vp786kkz1kuta_359 ;
 wire	fmp80n9kjhs8yrkgqe_349 ;
 wire	iyq5r9csizebu6dk8pd71_31 ;
 wire	pexw6jpmmzl68i5p_741 ;
 wire	yxphskfday9k5b9jb8m6mfp_590 ;
 wire	r4ww86m842au972xnn0qo5vh80ym8ff_78 ;
 wire	qyzu2h7zihc5px28_536 ;
 wire	q7yi01xxplkufn72xz63rn4dyoebr_170 ;
 wire	plg6g7pgg4jjimzstgus_318 ;
 wire	ah02pn6qiiwpcoqwluzio3qhdy0_5 ;
 wire	cc1812l9j6tfxtqkwkuog8ld2_358 ;
 wire	jaiq8qt0syn0wtkok0qthug2chhl62a6_393 ;
 wire [159:0] v07be458rheq0jo1pgl3d8_119 ;
 wire	qy0kt04j5ioajijztcdyi5r1_219 ;
 wire	jdtdsl460qyc37ep4l83_164 ;
 wire	oh6unh25zbx1zik4yysk1arzq4c_524 ;
 wire [7:0] qtvwc6agr05palxzurh7onddra_304 ;
 wire [7:0] ocsnt3actri40ssjibarggn1os_717 ;
 wire	emups4s2us95ejpedlcxe_372 ;
 wire	dksbd5knu3lajuzo043x38_134 ;
 wire	imxpagq8tmdgh045ss9ci_673 ;
 wire	sydwoch48p8px6rzknom9yt8wer_59 ;
 wire	tintx1drrelvz9e3yx4thl333iut_691 ;
 wire	vdxurpf6g247qrpy9xzkpyn3nuna_301 ;
 wire	ebj8v7akwqs3ga8ayel3pun5w2l0od_691 ;
 wire	w8xh9wwu46lvwcwn_249 ;
 wire	di1y90cxtm34rdrqxsm2x_695 ;
 wire	bd2jys7qfyu7q7jtsmb90_750 ;
 reg	nerncta7rushr9mdssahvyq0j6106iff_44;	 initial nerncta7rushr9mdssahvyq0j6106iff_44 = 1'b0 ;
 reg	jkg083jfue4x0kv95rht_76;	 initial jkg083jfue4x0kv95rht_76 = 1'b0 ;
 reg	qyfqg3k7m3j4g1q5hvrgv0_175;	 initial qyfqg3k7m3j4g1q5hvrgv0_175 = 1'b0 ;
 wire	kcca635k6l4ia5y6cib79_529 ;
 wire [289:0] bolp3lvysjxpqpatojn_803 ;
 wire	upijd9qib90hgo2ms1g3yh95pjrke32_849 ;
 wire [289:0] tahh1gt4e1amei23bqaw4m1x9hhp8r_864 ;
 wire	k7inpp4njoysshb6uci3e8n_83 ;
 wire	ix5503c878z2nwtodmuesu1g2kp5_764 ;
 wire	mfv4rr223yu39os8ssl2a286q008o_551 ;
 wire	rxgd3o2o0j7ivq8tb687o4w9lftr8872_14 ;
 wire	pvfm6rmn2fkwr97vz58yiwr1_142 ;
 wire	pxs1s8judb3xqc0g7ffqk_383 ;
 wire	wa4kvphffw87w2vr283t1hzv1p8qdn7_178 ;
 wire	l0123nxl3ccycfgm4wxs6ur_578 ;
 wire	q30mic6aqifpscgxv1z4hr3w_102 ;
 wire	hygaa137idpzrtr4s0mv6pe2_106 ;
 wire	bzxp4tc9zw44q9fvpba2zeev0q2cux_157 ;
 wire	u9b7hd26tca3r0clhaclv2uzh_604 ;
 wire	nrg4lgqd5yzoujd4n0lr3r6_831 ;
 wire	adcye761hunaedgl4zpf_795 ;
 wire [31:0] ptadeylyykgpa35triesu2ohvkwo_662 ;
 wire [255:0] mucmcj18ggdfxjthqbuknn93gj_339 ;
 wire	aamzphgojcf0e422cv9d0_276 ;
 wire	htiuagv8b99l9jvkqebxet73_633 ;
 wire	p3rv7v45nzbrm7rqzdey3_419 ;
 wire	aw46wz9spo5bvuarof18zebmus7_869 ;
 wire	nkuglere7eg537dtwai_630 ;
 wire	g46e7hkotqieoyzku5h9e8tpmwxsr9_204 ;
 wire	pjkdddwe6wmrcwnuhgf6ge2qa2_854 ;
 wire	i2iletg21a46sr6vongjx10_156 ;
 wire	otmtnlkviou2ic0wj71t1afzgs_790 ;
 wire	ehdgv8bi2d6eg582wwtheqhuebjlz_220 ;
 wire	jnrsfzmq7ghggnb5c9vunmvae1_588 ;
 wire	lqvyucsqli2z0nak4aznq95eeon_858 ;
 wire	tq5ki7ppuvcx4q2ho_507 ;
 wire	be2fnxyymly1yccavvh7mt1grh_174 ;
 wire	t7qvv615d1wv4z3xsq6sp_48 ;
 wire	sn0kyuni07xyj91gy67bq3c2wa_775 ;
 wire [0:0] xhsj6kysnwxfzslq_174 ;
 wire	g0bu43svet4z2b6tamoqbf_13 ;
 wire	p39ehj3jvmdgm16n6_77 ;
 wire [8:0] q9gpan1qmyi09t460hxynlbrc1k_726 ;
 wire	g2ekgmiu8igwmb35et6c_898 ;
 wire	zg5n2d96f2dx6462_264 ;
 wire	vzupg7dghqql3nwg0og_86 ;
 wire	n27m3udxji91kn4t8_872 ;
 wire	kg51j6gd4abtvx5513_619 ;
 wire	vvejgp1unbk47clyhp1kzpzexy_656 ;
 wire	stq2m2l380xqepnpci_280 ;
 wire [255:0] iyxcip762mewjmxpcjibjyhc9z8wnjut_723 ;
 wire	decsm2yvemlkfedyqeigkxtm3_594 ;
 wire [255:0] i32lmurq2121xtus_605 ;
 wire	mg3uin0v00v32yd1dkctg_586 ;
 wire	yt8j1sd5hp50gzvbujb43eq0_456 ;
 wire	b64ltgn8kvb5j07zn4_672 ;
 wire [159:0] jzpnkdl4qcscew10_540 ;
 wire	a91g6962eoyy2cbi6ckffeywsxyyxb_726 ;
 wire [159:0] r21wve3gzn0349i61pihff3_7 ;
 wire	jq73nea61w94314wz8mtci2e_20 ;
 wire	d1dswes9rurfojhhyabuyn493yue9_703 ;
 wire	lcn9v8wkuc04t8oktgi1fhuhm9_734 ;
 wire	h566h4o3kuhk861cnv_249 ;
 wire	pi2s6ulcctmanl1zb3qf_215 ;


 assign kcca635k6l4ia5y6cib79_529 = 
	 ~(backpressure_in) ;
 assign bolp3lvysjxpqpatojn_803 = 
	{packet_in_PACKET2_TVALID, packet_in_PACKET2_TDATA, packet_in_PACKET2_TKEEP, packet_in_PACKET2_TLAST} ;
 assign upijd9qib90hgo2ms1g3yh95pjrke32_849 	= packet_in_PACKET2_TVALID ;
 assign tahh1gt4e1amei23bqaw4m1x9hhp8r_864 	= bolp3lvysjxpqpatojn_803[289:0] ;
 assign k7inpp4njoysshb6uci3e8n_83 = 
	n27m3udxji91kn4t8_872 | h566h4o3kuhk861cnv_249 ;
 assign ix5503c878z2nwtodmuesu1g2kp5_764 = 
	1'b0 ;
 assign mfv4rr223yu39os8ssl2a286q008o_551 = 
	1'b1 ;
 assign rxgd3o2o0j7ivq8tb687o4w9lftr8872_14 = 
	 ~(r92pqpwp11c9i75255gf49b4_505) ;
 assign pvfm6rmn2fkwr97vz58yiwr1_142 = 
	vvejgp1unbk47clyhp1kzpzexy_656 & k7inpp4njoysshb6uci3e8n_83 & nrg4lgqd5yzoujd4n0lr3r6_831 ;
 assign pxs1s8judb3xqc0g7ffqk_383 = 
	rxgd3o2o0j7ivq8tb687o4w9lftr8872_14 & eja0egol73ocj3p2i6k2nsefmxju1us_718 & nrg4lgqd5yzoujd4n0lr3r6_831 & n27m3udxji91kn4t8_872 & vvejgp1unbk47clyhp1kzpzexy_656 ;
 assign wa4kvphffw87w2vr283t1hzv1p8qdn7_178 = 
	pvfm6rmn2fkwr97vz58yiwr1_142 | pxs1s8judb3xqc0g7ffqk_383 ;
 assign l0123nxl3ccycfgm4wxs6ur_578 = 
	kcca635k6l4ia5y6cib79_529 & wa4kvphffw87w2vr283t1hzv1p8qdn7_178 ;
 assign q30mic6aqifpscgxv1z4hr3w_102 = 
	backpressure_in & x4dkpsw51305whx1r4u2ut56_569 & vvejgp1unbk47clyhp1kzpzexy_656 & vzupg7dghqql3nwg0og_86 & h566h4o3kuhk861cnv_249 & rxgd3o2o0j7ivq8tb687o4w9lftr8872_14 ;
 assign hygaa137idpzrtr4s0mv6pe2_106 = 
	l0123nxl3ccycfgm4wxs6ur_578 | q30mic6aqifpscgxv1z4hr3w_102 ;
 assign bzxp4tc9zw44q9fvpba2zeev0q2cux_157 	= hygaa137idpzrtr4s0mv6pe2_106 ;
 assign u9b7hd26tca3r0clhaclv2uzh_604 = 
	1'b0 ;
 assign nrg4lgqd5yzoujd4n0lr3r6_831 = 
	 ~(bpshgpej11atznknoyx3scxo3yy8_564) ;
 assign adcye761hunaedgl4zpf_795 	= cd9yo44k5jmvjiwd7b2z7idhsy_812[0] ;
 assign ptadeylyykgpa35triesu2ohvkwo_662 	= cd9yo44k5jmvjiwd7b2z7idhsy_812[32:1] ;
 assign mucmcj18ggdfxjthqbuknn93gj_339 	= cd9yo44k5jmvjiwd7b2z7idhsy_812[288:33] ;
 assign aamzphgojcf0e422cv9d0_276 	= cd9yo44k5jmvjiwd7b2z7idhsy_812[289] ;
 assign htiuagv8b99l9jvkqebxet73_633 = 
	x4dkpsw51305whx1r4u2ut56_569 | oa4q29fvvb94khrb79o7hhcs3t4j_400 ;
 assign p3rv7v45nzbrm7rqzdey3_419 = 
	tei8xuch71cwdq4zdejtmt_265 | nrg4lgqd5yzoujd4n0lr3r6_831 ;
 assign aw46wz9spo5bvuarof18zebmus7_869 = 
	p3rv7v45nzbrm7rqzdey3_419 & vvejgp1unbk47clyhp1kzpzexy_656 & k7inpp4njoysshb6uci3e8n_83 ;
 assign nkuglere7eg537dtwai_630 = 
	aw46wz9spo5bvuarof18zebmus7_869 | eja0egol73ocj3p2i6k2nsefmxju1us_718 ;
 assign g46e7hkotqieoyzku5h9e8tpmwxsr9_204 = 
	backpressure_in & aamzphgojcf0e422cv9d0_276 & nkuglere7eg537dtwai_630 ;
 assign pjkdddwe6wmrcwnuhgf6ge2qa2_854 = 
	vzupg7dghqql3nwg0og_86 & u0f4cmddfdrhh8q50veo3w_260 ;
 assign i2iletg21a46sr6vongjx10_156 = 
	pjkdddwe6wmrcwnuhgf6ge2qa2_854 | n27m3udxji91kn4t8_872 | adcye761hunaedgl4zpf_795 ;
 assign otmtnlkviou2ic0wj71t1afzgs_790 = 
	kcca635k6l4ia5y6cib79_529 & eja0egol73ocj3p2i6k2nsefmxju1us_718 & aamzphgojcf0e422cv9d0_276 & i2iletg21a46sr6vongjx10_156 ;
 assign ehdgv8bi2d6eg582wwtheqhuebjlz_220 	= eja0egol73ocj3p2i6k2nsefmxju1us_718 ;
 assign jnrsfzmq7ghggnb5c9vunmvae1_588 	= packet_in_PACKET2_TVALID ;
 assign lqvyucsqli2z0nak4aznq95eeon_858 = 
	1'b0 ;
 assign tq5ki7ppuvcx4q2ho_507 = 
	1'b1 ;
 assign be2fnxyymly1yccavvh7mt1grh_174 = (
	((ta9r6t3sd6dyu2yfy94xqol_728 == 1'b1) && (packet_in_PACKET2_TVALID == 1'b1))?1'b1:
	((sbmfi8i4xfzxo24u2oxrw_468 == 1'b1) && (packet_in_PACKET2_TVALID == 1'b1))?1'b1:
	0)  ;
 assign t7qvv615d1wv4z3xsq6sp_48 = (
	((packet_in_PACKET2_TVALID == 1'b1) && (packet_in_PACKET2_TLAST == 1'b1))?1'b1:
	0)  ;
 assign sn0kyuni07xyj91gy67bq3c2wa_775 = (
	((packet_in_PACKET2_TVALID == 1'b1) && (packet_in_PACKET2_TLAST == 1'b0))?1'b1:
	0)  ;
 assign xhsj6kysnwxfzslq_174 = be2fnxyymly1yccavvh7mt1grh_174 ;
 assign g0bu43svet4z2b6tamoqbf_13 	= hygaa137idpzrtr4s0mv6pe2_106 ;
 assign p39ehj3jvmdgm16n6_77 = 
	1'b0 ;
 assign q9gpan1qmyi09t460hxynlbrc1k_726 	= xxki8da9wvkhximwptyubq_450[8:0] ;
 assign g2ekgmiu8igwmb35et6c_898 = (
	((q9gpan1qmyi09t460hxynlbrc1k_726 != l9yyywsjg1g4d0rrcz58_796))?1'b1:
	0)  ;
 assign zg5n2d96f2dx6462_264 = verfh11ins6lhjcwzv68uh6x1s774n_841 ;
 assign vzupg7dghqql3nwg0og_86 = verfh11ins6lhjcwzv68uh6x1s774n_841 ;
 assign n27m3udxji91kn4t8_872 = 
	 ~(vzupg7dghqql3nwg0og_86) ;
 assign kg51j6gd4abtvx5513_619 	= l5b7e354dvr7esaz2o5cd69u0r6qr2un_96 ;
 assign vvejgp1unbk47clyhp1kzpzexy_656 = 
	 ~(l5b7e354dvr7esaz2o5cd69u0r6qr2un_96) ;
 assign stq2m2l380xqepnpci_280 = 
	h566h4o3kuhk861cnv_249 & vvejgp1unbk47clyhp1kzpzexy_656 & zg5n2d96f2dx6462_264 & hygaa137idpzrtr4s0mv6pe2_106 ;
 assign iyxcip762mewjmxpcjibjyhc9z8wnjut_723 = 
	tuple_in_TUPLE0_DATA ;
 assign decsm2yvemlkfedyqeigkxtm3_594 	= tuple_in_TUPLE0_VALID ;
 assign i32lmurq2121xtus_605 	= iyxcip762mewjmxpcjibjyhc9z8wnjut_723[255:0] ;
 assign mg3uin0v00v32yd1dkctg_586 = 
	 ~(bx3nkmweolt94uu4743u5heh5lm_691) ;
 assign yt8j1sd5hp50gzvbujb43eq0_456 	= stq2m2l380xqepnpci_280 ;
 assign b64ltgn8kvb5j07zn4_672 = 
	1'b0 ;
 assign jzpnkdl4qcscew10_540 = 
	tuple_in_TUPLE1_DATA ;
 assign a91g6962eoyy2cbi6ckffeywsxyyxb_726 	= tuple_in_TUPLE1_VALID ;
 assign r21wve3gzn0349i61pihff3_7 	= jzpnkdl4qcscew10_540[159:0] ;
 assign jq73nea61w94314wz8mtci2e_20 = 
	 ~(qy0kt04j5ioajijztcdyi5r1_219) ;
 assign d1dswes9rurfojhhyabuyn493yue9_703 	= stq2m2l380xqepnpci_280 ;
 assign lcn9v8wkuc04t8oktgi1fhuhm9_734 = 
	1'b0 ;
 assign h566h4o3kuhk861cnv_249 = 
	nrg4lgqd5yzoujd4n0lr3r6_831 & mg3uin0v00v32yd1dkctg_586 & jq73nea61w94314wz8mtci2e_20 ;
 assign pi2s6ulcctmanl1zb3qf_215 = 
	nerncta7rushr9mdssahvyq0j6106iff_44 | jkg083jfue4x0kv95rht_76 | qyfqg3k7m3j4g1q5hvrgv0_175 ;
 assign packet_out_PACKET2_TVALID 	= ehdgv8bi2d6eg582wwtheqhuebjlz_220 ;
 assign packet_out_PACKET2_TDATA 	= mucmcj18ggdfxjthqbuknn93gj_339[255:0] ;
 assign packet_out_PACKET2_TKEEP 	= ptadeylyykgpa35triesu2ohvkwo_662[31:0] ;
 assign packet_out_PACKET2_TLAST 	= adcye761hunaedgl4zpf_795 ;
 assign packet_in_PACKET2_TREADY 	= packet_out_PACKET2_TREADY ;
 assign tuple_out_TUPLE0_VALID 	= u0f4cmddfdrhh8q50veo3w_260 ;
 assign tuple_out_TUPLE0_DATA 	= u1n4bxvd8hmto8ku3u4z9kic0qya_374[255:0] ;
 assign tuple_out_TUPLE1_VALID 	= u0f4cmddfdrhh8q50veo3w_260 ;
 assign tuple_out_TUPLE1_DATA 	= v07be458rheq0jo1pgl3d8_119[159:0] ;


assign zm506s8za5fghylfpjwbh2dbgihf2j7_540 = (
	((hygaa137idpzrtr4s0mv6pe2_106 == 1'b1))?mfv4rr223yu39os8ssl2a286q008o_551 :
	((kcca635k6l4ia5y6cib79_529 == 1'b1))?ix5503c878z2nwtodmuesu1g2kp5_764 :
	eja0egol73ocj3p2i6k2nsefmxju1us_718 ) ;

assign r92pqpwp11c9i75255gf49b4_505 = (
	((eja0egol73ocj3p2i6k2nsefmxju1us_718 == 1'b1) && (kcca635k6l4ia5y6cib79_529 == 1'b1))?ix5503c878z2nwtodmuesu1g2kp5_764 :
	eja0egol73ocj3p2i6k2nsefmxju1us_718 ) ;



always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	x4dkpsw51305whx1r4u2ut56_569 <= 1'b0 ;
	eja0egol73ocj3p2i6k2nsefmxju1us_718 <= 1'b0 ;
	tei8xuch71cwdq4zdejtmt_265 <= 1'b0 ;
	oa4q29fvvb94khrb79o7hhcs3t4j_400 <= 1'b0 ;
	l9yyywsjg1g4d0rrcz58_796 <= 9'b000000000 ;
	nerncta7rushr9mdssahvyq0j6106iff_44 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		x4dkpsw51305whx1r4u2ut56_569 <= backpressure_in ;
		eja0egol73ocj3p2i6k2nsefmxju1us_718 <= zm506s8za5fghylfpjwbh2dbgihf2j7_540 ;
		tei8xuch71cwdq4zdejtmt_265 <= nrg4lgqd5yzoujd4n0lr3r6_831 ;
		oa4q29fvvb94khrb79o7hhcs3t4j_400 <= hygaa137idpzrtr4s0mv6pe2_106 ;
		l9yyywsjg1g4d0rrcz58_796 <= q9gpan1qmyi09t460hxynlbrc1k_726 ;
		nerncta7rushr9mdssahvyq0j6106iff_44 <= dqpogcyvir38ykqsnlqyynighytmch_476 ;
		backpressure_out <= pi2s6ulcctmanl1zb3qf_215 ;
  end
end

always @(posedge clk_in_0)
begin
  if (rst_in_0) 
  begin
	ta9r6t3sd6dyu2yfy94xqol_728 <= 1'b0 ;
	sbmfi8i4xfzxo24u2oxrw_468 <= 1'b1 ;
   end
  else
  begin
	if (sn0kyuni07xyj91gy67bq3c2wa_775) 
	begin 
	  ta9r6t3sd6dyu2yfy94xqol_728 <= 1'b0 ;
	 end 
	else 
	begin 
		if (t7qvv615d1wv4z3xsq6sp_48) 
		begin 
			ta9r6t3sd6dyu2yfy94xqol_728 <= tq5ki7ppuvcx4q2ho_507 ;
		end 
	end 
	if (be2fnxyymly1yccavvh7mt1grh_174) 
	begin 
		sbmfi8i4xfzxo24u2oxrw_468 <= lqvyucsqli2z0nak4aznq95eeon_858 ;
	end 
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	u0f4cmddfdrhh8q50veo3w_260 <= 1'b0 ;
	jkg083jfue4x0kv95rht_76 <= 1'b0 ;
   end
  else
  begin
		u0f4cmddfdrhh8q50veo3w_260 <= stq2m2l380xqepnpci_280 ;
		jkg083jfue4x0kv95rht_76 <= uevfw2p29rriv6eq_168 ;
  end
end

always @(posedge clk_out_2)
begin
  if (rst_in_0) 
  begin
	qyfqg3k7m3j4g1q5hvrgv0_175 <= 1'b0 ;
   end
  else
  begin
		qyfqg3k7m3j4g1q5hvrgv0_175 <= jdtdsl460qyc37ep4l83_164 ;
  end
end

defparam axb7nt7990q5kaqrpg09ayiefv_1629.WRITE_DATA_WIDTH = 290; 
defparam axb7nt7990q5kaqrpg09ayiefv_1629.FIFO_WRITE_DEPTH = 512; 
defparam axb7nt7990q5kaqrpg09ayiefv_1629.PROG_FULL_THRESH = 177; 
defparam axb7nt7990q5kaqrpg09ayiefv_1629.PROG_EMPTY_THRESH = 177; 
defparam axb7nt7990q5kaqrpg09ayiefv_1629.READ_MODE = "STD"; 
defparam axb7nt7990q5kaqrpg09ayiefv_1629.WR_DATA_COUNT_WIDTH = 9; 
defparam axb7nt7990q5kaqrpg09ayiefv_1629.RD_DATA_COUNT_WIDTH = 9; 
defparam axb7nt7990q5kaqrpg09ayiefv_1629.DOUT_RESET_VALUE = "0"; 
defparam axb7nt7990q5kaqrpg09ayiefv_1629.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_sync axb7nt7990q5kaqrpg09ayiefv_1629 (
	.wr_en(upijd9qib90hgo2ms1g3yh95pjrke32_849),
	.din(tahh1gt4e1amei23bqaw4m1x9hhp8r_864),
	.rd_en(bzxp4tc9zw44q9fvpba2zeev0q2cux_157),
	.sleep(u9b7hd26tca3r0clhaclv2uzh_604),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(meng435y1p9s1zfbtvf8iz_736), 
	.dout(cd9yo44k5jmvjiwd7b2z7idhsy_812), 
	.empty(bpshgpej11atznknoyx3scxo3yy8_564), 
	.prog_full(dqpogcyvir38ykqsnlqyynighytmch_476), 
	.full(wfut7rodipjsty1781o8vrqthx7b9_425), 
	.rd_data_count(omtql4f28gaiproy9jl_113), 
	.wr_data_count(lguc2aw576pqkvqijktgga_273), 
	.wr_rst_busy(dqnz4iiek0ielisfdrj496u8xkwa5b_182), 
	.rd_rst_busy(svi5ekrs1roni7frwgnx0asj4x5u3l1_618), 
	.overflow(nt2ud0z0r7p9tu9bu8bc1ev1e7r3_116), 
	.underflow(eil4wc61vcqnyklh7_71), 
	.sbiterr(bt2r6atlvjyar7blofix0b1jk_422), 
	.dbiterr(ky1u6esqtc0cra0m4cj2o8pa4igyzub_702), 
	.almost_empty(wtfngjkljvvr3fbqpcxm_753), 
	.almost_full(nuwly2qfacbo4cg9i41ipw_115), 
	.wr_ack(pzcc54wgvy8f70i3y_385), 
	.data_valid(wet8pnfgox3kxxlcdgmblu95h1p7qpd_616), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam kp71wbvlwuxct4x8kl5e8svjswsty_652.WRITE_DATA_WIDTH = 1; 
defparam kp71wbvlwuxct4x8kl5e8svjswsty_652.FIFO_WRITE_DEPTH = 512; 
defparam kp71wbvlwuxct4x8kl5e8svjswsty_652.PROG_FULL_THRESH = 177; 
defparam kp71wbvlwuxct4x8kl5e8svjswsty_652.PROG_EMPTY_THRESH = 177; 
defparam kp71wbvlwuxct4x8kl5e8svjswsty_652.READ_MODE = "FWFT"; 
defparam kp71wbvlwuxct4x8kl5e8svjswsty_652.WR_DATA_COUNT_WIDTH = 9; 
defparam kp71wbvlwuxct4x8kl5e8svjswsty_652.RD_DATA_COUNT_WIDTH = 9; 
defparam kp71wbvlwuxct4x8kl5e8svjswsty_652.DOUT_RESET_VALUE = "0"; 
defparam kp71wbvlwuxct4x8kl5e8svjswsty_652.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_sync kp71wbvlwuxct4x8kl5e8svjswsty_652 (
	.wr_en(jnrsfzmq7ghggnb5c9vunmvae1_588),
	.din(xhsj6kysnwxfzslq_174),
	.rd_en(g0bu43svet4z2b6tamoqbf_13),
	.sleep(p39ehj3jvmdgm16n6_77),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(l8vjovlekkoib7zl2shhvsx_757), 
	.dout(verfh11ins6lhjcwzv68uh6x1s774n_841), 
	.empty(l5b7e354dvr7esaz2o5cd69u0r6qr2un_96), 
	.prog_full(vntgjwbckwuxk3onzqti6_554), 
	.full(ma30caa4lwj7do8yifvgsiv903ipdred_246), 
	.rd_data_count(xxki8da9wvkhximwptyubq_450), 
	.wr_data_count(p68f1ahqr5s74m33n2wbtl6gykju3o6e_835), 
	.wr_rst_busy(gvkbbz50k9eey87mkg6it5yv1f93efs_594), 
	.rd_rst_busy(c02r8n0c5xqyttpklm4wf5mgh5ehc_760), 
	.overflow(amyx6os0422kjxg8v4mlfukekh74p_124), 
	.underflow(w1o5mqc9ntn3lrv893if35_8), 
	.sbiterr(djorteliknz0t9jabhrrwqcsi1yi0u_458), 
	.dbiterr(f5qk0zhflta9tkdwroqyq6ud8_22), 
	.almost_empty(viaq9hgz0c7ru3cse_333), 
	.almost_full(oess9wdw78amymrn5p68yss39ay_604), 
	.wr_ack(vnhen30xirffo9jj0zu5cwx3ghd15_611), 
	.data_valid(k5nhnmhclvljuny2v_581), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam g1z9oeq820nhtj76qt_226.WRITE_DATA_WIDTH = 256; 
defparam g1z9oeq820nhtj76qt_226.FIFO_WRITE_DEPTH = 256; 
defparam g1z9oeq820nhtj76qt_226.PROG_FULL_THRESH = 66; 
defparam g1z9oeq820nhtj76qt_226.PROG_EMPTY_THRESH = 66; 
defparam g1z9oeq820nhtj76qt_226.READ_MODE = "STD"; 
defparam g1z9oeq820nhtj76qt_226.WR_DATA_COUNT_WIDTH = 8; 
defparam g1z9oeq820nhtj76qt_226.RD_DATA_COUNT_WIDTH = 8; 
defparam g1z9oeq820nhtj76qt_226.DOUT_RESET_VALUE = "0"; 
defparam g1z9oeq820nhtj76qt_226.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async g1z9oeq820nhtj76qt_226 (
	.wr_en(decsm2yvemlkfedyqeigkxtm3_594),
	.din(i32lmurq2121xtus_605),
	.rd_en(yt8j1sd5hp50gzvbujb43eq0_456),
	.sleep(b64ltgn8kvb5j07zn4_672),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(zgmey44au2yukrzsld3fdbc3rt_106), 
	.dout(u1n4bxvd8hmto8ku3u4z9kic0qya_374), 
	.empty(bx3nkmweolt94uu4743u5heh5lm_691), 
	.prog_full(uevfw2p29rriv6eq_168), 
	.full(mbwd2unj6ihan384e6_365), 
	.rd_data_count(lv8fnr4nc99xnfqswk6bs_301), 
	.wr_data_count(l09e04vp786kkz1kuta_359), 
	.wr_rst_busy(fmp80n9kjhs8yrkgqe_349), 
	.rd_rst_busy(iyq5r9csizebu6dk8pd71_31), 
	.overflow(pexw6jpmmzl68i5p_741), 
	.underflow(yxphskfday9k5b9jb8m6mfp_590), 
	.sbiterr(r4ww86m842au972xnn0qo5vh80ym8ff_78), 
	.dbiterr(qyzu2h7zihc5px28_536), 
	.almost_empty(q7yi01xxplkufn72xz63rn4dyoebr_170), 
	.almost_full(plg6g7pgg4jjimzstgus_318), 
	.wr_ack(ah02pn6qiiwpcoqwluzio3qhdy0_5), 
	.data_valid(cc1812l9j6tfxtqkwkuog8ld2_358), 

	.wr_clk(clk_in_1), 

	.rd_clk(clk_out_1), 
	.rst(rst_in_1) 
); 

defparam s6ili8wkwnaz62091a4rhpkzd5_2036.WRITE_DATA_WIDTH = 160; 
defparam s6ili8wkwnaz62091a4rhpkzd5_2036.FIFO_WRITE_DEPTH = 256; 
defparam s6ili8wkwnaz62091a4rhpkzd5_2036.PROG_FULL_THRESH = 66; 
defparam s6ili8wkwnaz62091a4rhpkzd5_2036.PROG_EMPTY_THRESH = 66; 
defparam s6ili8wkwnaz62091a4rhpkzd5_2036.READ_MODE = "STD"; 
defparam s6ili8wkwnaz62091a4rhpkzd5_2036.WR_DATA_COUNT_WIDTH = 8; 
defparam s6ili8wkwnaz62091a4rhpkzd5_2036.RD_DATA_COUNT_WIDTH = 8; 
defparam s6ili8wkwnaz62091a4rhpkzd5_2036.DOUT_RESET_VALUE = "0"; 
defparam s6ili8wkwnaz62091a4rhpkzd5_2036.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async s6ili8wkwnaz62091a4rhpkzd5_2036 (
	.wr_en(a91g6962eoyy2cbi6ckffeywsxyyxb_726),
	.din(r21wve3gzn0349i61pihff3_7),
	.rd_en(d1dswes9rurfojhhyabuyn493yue9_703),
	.sleep(lcn9v8wkuc04t8oktgi1fhuhm9_734),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(jaiq8qt0syn0wtkok0qthug2chhl62a6_393), 
	.dout(v07be458rheq0jo1pgl3d8_119), 
	.empty(qy0kt04j5ioajijztcdyi5r1_219), 
	.prog_full(jdtdsl460qyc37ep4l83_164), 
	.full(oh6unh25zbx1zik4yysk1arzq4c_524), 
	.rd_data_count(qtvwc6agr05palxzurh7onddra_304), 
	.wr_data_count(ocsnt3actri40ssjibarggn1os_717), 
	.wr_rst_busy(emups4s2us95ejpedlcxe_372), 
	.rd_rst_busy(dksbd5knu3lajuzo043x38_134), 
	.overflow(imxpagq8tmdgh045ss9ci_673), 
	.underflow(sydwoch48p8px6rzknom9yt8wer_59), 
	.sbiterr(tintx1drrelvz9e3yx4thl333iut_691), 
	.dbiterr(vdxurpf6g247qrpy9xzkpyn3nuna_301), 
	.almost_empty(ebj8v7akwqs3ga8ayel3pun5w2l0od_691), 
	.almost_full(w8xh9wwu46lvwcwn_249), 
	.wr_ack(di1y90cxtm34rdrqxsm2x_695), 
	.data_valid(bd2jys7qfyu7q7jtsmb90_750), 

	.wr_clk(clk_in_2), 

	.rd_clk(clk_out_2), 
	.rst(rst_in_2) 
); 

endmodule 
