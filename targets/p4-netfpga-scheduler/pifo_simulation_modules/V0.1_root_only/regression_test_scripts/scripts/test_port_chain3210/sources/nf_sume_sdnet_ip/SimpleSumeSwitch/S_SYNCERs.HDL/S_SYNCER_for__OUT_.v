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
// File created: 2020/10/07 14:57:22
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






 reg	h6jyr6jmwic0rhrbu16duu1ezuw3_344;	 initial h6jyr6jmwic0rhrbu16duu1ezuw3_344 = 1'b0 ;
 wire	ff43snoe63i72zs6ueai_883 ;
 wire [289:0] pykl4w3rxuh5z3q4l2z9z89x6j_547 ;
 wire	mst9folg9ugexxgwwgmqbja13g0_445 ;
 wire	wdc8xabiy4q2ecfye6m0v5pw_832 ;
 wire	ow8bcrqk34s6z5n6ivt6dg2u1sox3mz_477 ;
 wire [8:0] cxn1b2a7uv86hv3czf_535 ;
 wire [8:0] i9nddkxgbik6ntzhfz587ehh_171 ;
 wire	oazvi9047wrv17oj15j2ndd_834 ;
 wire	xgr3q8zelgbg9ajgv_853 ;
 wire	ph5il27c8rntsa1i12w_392 ;
 wire	hf7vg52u2t0bshk7knrh8b_136 ;
 wire	wgaw3i6t10rzhikxyzg51iuglim_746 ;
 wire	h1zpodkq7pwiqqm40huy10_717 ;
 wire	h4tuptlg3wk4iy1lhbhxhqj7_328 ;
 wire	mhrnji4kvyf6oqf6cg0no4_185 ;
 wire	q9elp99pmzqxgco1gd2_403 ;
 wire	ne1ku7nsj9wkhcyfikzpmb5oh_211 ;
 wire	wgecqmyli35qdbxgb74vm_536 ;
 reg	k96ub665cin1cjbqqwcca5_242;	 initial k96ub665cin1cjbqqwcca5_242 = 1'b0 ;
 wire	hx4ms1f05dhjfhl1pfd3kjd5_891 ;
 reg	uf84rmwq5wc8mgwhlu4_363;	 initial uf84rmwq5wc8mgwhlu4_363 = 1'b0 ;
 reg	ibrijjsc94cx0a7z1_660;	 initial ibrijjsc94cx0a7z1_660 = 1'b0 ;
 wire	xxngiodfx38e1zas4itm7a6z3cyow5_260 ;
 wire [0:0] pnb3q0epnq7qyvm550_76 ;
 wire	methegf0hgimcjt37k9s4e051_153 ;
 wire	o2qv3wlayw1geewuk1d14v2dzchzqkd_3 ;
 wire	yyscbjll9wg2wnnepigjj2vq6uq2uj6_323 ;
 wire [8:0] zqk9n2fzzu0z62oy22_16 ;
 wire [8:0] dcor06510p54tcw8jel67crhc5iti_322 ;
 wire	ewdfl51qnr1q4ah1uzfwcu1j7hvs_748 ;
 wire	uqp67z2q6h1e2h5lnm_67 ;
 wire	s7ipq6550nzmzrd8f_810 ;
 wire	vniodbh3gv67kzlgni90ab_78 ;
 wire	z1hplsvryjxl42q2y_314 ;
 wire	fm0nekcpnrz93s74inxl71_592 ;
 wire	dnbi862a3v2wol25b7pu7nhs_304 ;
 wire	du26ctgj7m8rh6thamf8byljjh8i_107 ;
 wire	diokctb9kdhrralalha7tbbcbcr9_424 ;
 wire	wq0bgz0l5546gn38nq13y_824 ;
 reg	v9rh0hsayz46yi9fsbhogk_400;	 initial v9rh0hsayz46yi9fsbhogk_400 = 1'b0 ;
 reg	rbl0tvx9qi3gyhpj0nb0oz5m_172;	 initial rbl0tvx9qi3gyhpj0nb0oz5m_172 = 1'b1 ;
 reg [8:0] x1g2ca7cvn89o21ekv3im2f7r700a_664;	 initial x1g2ca7cvn89o21ekv3im2f7r700a_664 = 9'b000000000 ;
 reg	kkp9rijiygpwt3e6dyroesoffj_21;	 initial kkp9rijiygpwt3e6dyroesoffj_21 = 1'b0 ;
 wire	osrxkm7m2tufk71brt8xinyfa_162 ;
 wire [255:0] bfewk1udl9w3j50e_424 ;
 wire	bqis67y8sfv283s9nad0xztj05krz51a_444 ;
 wire	t0nb09wxto1qggm43ilfc_640 ;
 wire	szlaml2n06gmx5pt_834 ;
 wire [7:0] u1oby4ur7pbo6vm1ixfu3astggxa5jb_49 ;
 wire [7:0] r9c5h31ay13qbrmnvp6s_903 ;
 wire	zfgrm3oofog1f473h47b5rq7uo9z_881 ;
 wire	xpi2vsy79nkivlh4rghu_157 ;
 wire	t7dg6tuptsmzezqyhelujr6nq9cp_723 ;
 wire	xzwcct1vn6sats9w_597 ;
 wire	usxjphq00zt2lp5q7w_210 ;
 wire	ea4j94fzul3xl6f4zvrd7u2wxwfu_503 ;
 wire	bazt5f6cdtn2qb9mr_455 ;
 wire	rgvejunun38vm827r1t9klq3_130 ;
 wire	nuw012ef2q9lp8ot4y_684 ;
 wire	mr982gssuozv072tht1g_666 ;
 wire	i526mkt9q7sq9hraunw8pd_873 ;
 wire [159:0] jwc0073khj6fe5g85xhkcy_690 ;
 wire	c1jmxz0hn645s5kw5cft_827 ;
 wire	g01zk684a2v0vqozm3ga2yhkbfnrjt1_104 ;
 wire	r9jt33n65y6b7qu6yu7bfq4i4i_258 ;
 wire [7:0] zky9o66c9m8qoktk7nlq97pkn_579 ;
 wire [7:0] e8bbrnuxba25y1e5vw91xp_169 ;
 wire	xxkbfvt1gdjxfy6w4ot7hr4x62tlkbm_863 ;
 wire	m1e5d646645lsztea7m9l0zvbt1uqj_599 ;
 wire	mkvkgudnjy3zsrxw_292 ;
 wire	efb6xft0lnk4a847a4bpuc29_674 ;
 wire	a4gecet99v74ew9ubxguqn5ip7kclfz_740 ;
 wire	go60ok36zilkwzizqypz_146 ;
 wire	wdp8x4v49w3phtame_672 ;
 wire	v8s93chitlyrcg5jnlndj4xdmj6yw_603 ;
 wire	ncrn6hddeukka1n9j0fu9gw_337 ;
 wire	h9a5jty0y7cxkyfa3yx6afh58tq9cz_72 ;
 reg	efch6apa6wjeiaxld0hynszvs_406;	 initial efch6apa6wjeiaxld0hynszvs_406 = 1'b0 ;
 reg	e8octlpm2xlrsioj84fctr38wul6qqh_432;	 initial e8octlpm2xlrsioj84fctr38wul6qqh_432 = 1'b0 ;
 reg	qwpxc03nos0m76enkzh8_196;	 initial qwpxc03nos0m76enkzh8_196 = 1'b0 ;
 wire	k0z38yodnfscw6nucqqpms1jtdg_539 ;
 wire [289:0] rp34lnkrglg2ccty8qlcx53z_419 ;
 wire	absthicla7h299e09l3_173 ;
 wire [289:0] q8mc91v84d8e3wao9ck0t95r7l4v_553 ;
 wire	jh0ynsng0p65huj43jb_712 ;
 wire	o4twx22odrn7k9gqa3g5i5y_616 ;
 wire	b5440p3csom0pwkl91_7 ;
 wire	hd6a4lupa367wapc9tp2j_347 ;
 wire	ejh5n8809lb77v8vuehmt3y_308 ;
 wire	cyln19lmwveniztf03k_45 ;
 wire	wzjm58x6zdyf5m3w_597 ;
 wire	gepxs3vdz7i4lineb0nob6zq_188 ;
 wire	kb6yihc7nvav6y5oe2kqju4_443 ;
 wire	veowlehxw0q3196hffhtj_411 ;
 wire	ynkt1mu4zirehi32k7nbqte9p6h_21 ;
 wire	h8wcbil1o3pd4jkgkk6_239 ;
 wire	vx3o9qh3hw75arjbjcca3_842 ;
 wire	mlqrwtpyb9v00hdmu_148 ;
 wire [31:0] kjr2qtqjrlziuiyas44qeksge_272 ;
 wire [255:0] gd03ssogmqcaeklrb26c84ksew07q2o6_445 ;
 wire	v2hbqw9qrd1ozvgw975s7syperu6_688 ;
 wire	hmkdi9nimkgdrz82ssqf0zjk7iau_198 ;
 wire	u8behn7bmbrj2f5bf39sydxa52e2_142 ;
 wire	g5he3roqm3fk2h9ny94cn5rpb_391 ;
 wire	kdkj74l3m4l4wtks4_766 ;
 wire	vm0rwk7xibob9t56rz0rjjai_229 ;
 wire	w6wzwpue7xcr511sj_205 ;
 wire	sq2aa8g819lg1w30w1wtvds0evbrf_658 ;
 wire	taag7868uplscwnkdw_396 ;
 wire	ds968j1wg2q3exa0438dywuq_206 ;
 wire	o596xp0o04w3uw2rs6d7_559 ;
 wire	g3e6lrtfdo3jh3nm02m33lfvy57_641 ;
 wire	zo95no2m0qrirce13p_27 ;
 wire	ac08mxvz5bil4w5mix4a2x9i683fju0_888 ;
 wire	gi15uki8aikbj3bcn8uemdazhw4q22j_785 ;
 wire	a0lilcsn0trpgk8si1t_216 ;
 wire [0:0] gsl8vve0kt1telu1uuh75gpbwv_318 ;
 wire	z8idanfz3cwx032quf7p7t4jbj6m2rm_265 ;
 wire	x8p6vohbgphpef3nm7yz019p_490 ;
 wire [8:0] xkk13xazfsb46llyvrca0xz2xhoz_417 ;
 wire	hmbkax17dezje3ctu30xfrt_634 ;
 wire	rb1q483vr48uwymxkf4t6l4uf0nm9dyx_99 ;
 wire	v66695f1ue2wnra07k952n5tl_23 ;
 wire	oq96vdmqm8xhgq3na32k76a9v_633 ;
 wire	ffemk9ld4am6r2yzyk7_797 ;
 wire	sjzcr18l9ernrfrv0_278 ;
 wire	rebo8l8dp070rtcind7w_25 ;
 wire [255:0] b2psin7tuln4hahpora_410 ;
 wire	u0t4anuojkr7hopzobq_765 ;
 wire [255:0] xcq1xqwidvsxc95c_901 ;
 wire	pjrubrp7imeemwqghs4kz_458 ;
 wire	l92v6oqmnrdxoy2z98xn9_850 ;
 wire	etqx9lw9s4pt4nzhmpc47l_800 ;
 wire [159:0] bnlectrvx1ssw5gkir18w2_602 ;
 wire	ltk70cfjc24vv3a6ngf5_269 ;
 wire [159:0] ni3onoghtzz1slzpselmhook7kxorw_634 ;
 wire	zhcurvmejg67yt4gdwvaf_678 ;
 wire	qxx19kj0ynp32z98ks_444 ;
 wire	betox72ej0dkq7iuz_888 ;
 wire	vq4p4ozgy4xs5j06_388 ;
 wire	uws3yl6n452947tc7q_115 ;


 assign k0z38yodnfscw6nucqqpms1jtdg_539 = 
	 ~(backpressure_in) ;
 assign rp34lnkrglg2ccty8qlcx53z_419 = 
	{packet_in_PACKET2_TVALID, packet_in_PACKET2_TDATA, packet_in_PACKET2_TKEEP, packet_in_PACKET2_TLAST} ;
 assign absthicla7h299e09l3_173 	= packet_in_PACKET2_TVALID ;
 assign q8mc91v84d8e3wao9ck0t95r7l4v_553 	= rp34lnkrglg2ccty8qlcx53z_419[289:0] ;
 assign jh0ynsng0p65huj43jb_712 = 
	oq96vdmqm8xhgq3na32k76a9v_633 | vq4p4ozgy4xs5j06_388 ;
 assign o4twx22odrn7k9gqa3g5i5y_616 = 
	1'b0 ;
 assign b5440p3csom0pwkl91_7 = 
	1'b1 ;
 assign hd6a4lupa367wapc9tp2j_347 = 
	 ~(hx4ms1f05dhjfhl1pfd3kjd5_891) ;
 assign ejh5n8809lb77v8vuehmt3y_308 = 
	sjzcr18l9ernrfrv0_278 & jh0ynsng0p65huj43jb_712 & vx3o9qh3hw75arjbjcca3_842 ;
 assign cyln19lmwveniztf03k_45 = 
	hd6a4lupa367wapc9tp2j_347 & k96ub665cin1cjbqqwcca5_242 & vx3o9qh3hw75arjbjcca3_842 & oq96vdmqm8xhgq3na32k76a9v_633 & sjzcr18l9ernrfrv0_278 ;
 assign wzjm58x6zdyf5m3w_597 = 
	ejh5n8809lb77v8vuehmt3y_308 | cyln19lmwveniztf03k_45 ;
 assign gepxs3vdz7i4lineb0nob6zq_188 = 
	k0z38yodnfscw6nucqqpms1jtdg_539 & wzjm58x6zdyf5m3w_597 ;
 assign kb6yihc7nvav6y5oe2kqju4_443 = 
	backpressure_in & h6jyr6jmwic0rhrbu16duu1ezuw3_344 & sjzcr18l9ernrfrv0_278 & v66695f1ue2wnra07k952n5tl_23 & vq4p4ozgy4xs5j06_388 & hd6a4lupa367wapc9tp2j_347 ;
 assign veowlehxw0q3196hffhtj_411 = 
	gepxs3vdz7i4lineb0nob6zq_188 | kb6yihc7nvav6y5oe2kqju4_443 ;
 assign ynkt1mu4zirehi32k7nbqte9p6h_21 	= veowlehxw0q3196hffhtj_411 ;
 assign h8wcbil1o3pd4jkgkk6_239 = 
	1'b0 ;
 assign vx3o9qh3hw75arjbjcca3_842 = 
	 ~(mst9folg9ugexxgwwgmqbja13g0_445) ;
 assign mlqrwtpyb9v00hdmu_148 	= pykl4w3rxuh5z3q4l2z9z89x6j_547[0] ;
 assign kjr2qtqjrlziuiyas44qeksge_272 	= pykl4w3rxuh5z3q4l2z9z89x6j_547[32:1] ;
 assign gd03ssogmqcaeklrb26c84ksew07q2o6_445 	= pykl4w3rxuh5z3q4l2z9z89x6j_547[288:33] ;
 assign v2hbqw9qrd1ozvgw975s7syperu6_688 	= pykl4w3rxuh5z3q4l2z9z89x6j_547[289] ;
 assign hmkdi9nimkgdrz82ssqf0zjk7iau_198 = 
	h6jyr6jmwic0rhrbu16duu1ezuw3_344 | ibrijjsc94cx0a7z1_660 ;
 assign u8behn7bmbrj2f5bf39sydxa52e2_142 = 
	uf84rmwq5wc8mgwhlu4_363 | vx3o9qh3hw75arjbjcca3_842 ;
 assign g5he3roqm3fk2h9ny94cn5rpb_391 = 
	u8behn7bmbrj2f5bf39sydxa52e2_142 & sjzcr18l9ernrfrv0_278 & jh0ynsng0p65huj43jb_712 ;
 assign kdkj74l3m4l4wtks4_766 = 
	g5he3roqm3fk2h9ny94cn5rpb_391 | k96ub665cin1cjbqqwcca5_242 ;
 assign vm0rwk7xibob9t56rz0rjjai_229 = 
	backpressure_in & v2hbqw9qrd1ozvgw975s7syperu6_688 & kdkj74l3m4l4wtks4_766 ;
 assign w6wzwpue7xcr511sj_205 = 
	v66695f1ue2wnra07k952n5tl_23 & kkp9rijiygpwt3e6dyroesoffj_21 ;
 assign sq2aa8g819lg1w30w1wtvds0evbrf_658 = 
	w6wzwpue7xcr511sj_205 | oq96vdmqm8xhgq3na32k76a9v_633 | mlqrwtpyb9v00hdmu_148 ;
 assign taag7868uplscwnkdw_396 = 
	k0z38yodnfscw6nucqqpms1jtdg_539 & k96ub665cin1cjbqqwcca5_242 & v2hbqw9qrd1ozvgw975s7syperu6_688 & sq2aa8g819lg1w30w1wtvds0evbrf_658 ;
 assign ds968j1wg2q3exa0438dywuq_206 	= k96ub665cin1cjbqqwcca5_242 ;
 assign o596xp0o04w3uw2rs6d7_559 	= packet_in_PACKET2_TVALID ;
 assign g3e6lrtfdo3jh3nm02m33lfvy57_641 = 
	1'b0 ;
 assign zo95no2m0qrirce13p_27 = 
	1'b1 ;
 assign ac08mxvz5bil4w5mix4a2x9i683fju0_888 = (
	((v9rh0hsayz46yi9fsbhogk_400 == 1'b1) && (packet_in_PACKET2_TVALID == 1'b1))?1'b1:
	((rbl0tvx9qi3gyhpj0nb0oz5m_172 == 1'b1) && (packet_in_PACKET2_TVALID == 1'b1))?1'b1:
	0)  ;
 assign gi15uki8aikbj3bcn8uemdazhw4q22j_785 = (
	((packet_in_PACKET2_TVALID == 1'b1) && (packet_in_PACKET2_TLAST == 1'b1))?1'b1:
	0)  ;
 assign a0lilcsn0trpgk8si1t_216 = (
	((packet_in_PACKET2_TVALID == 1'b1) && (packet_in_PACKET2_TLAST == 1'b0))?1'b1:
	0)  ;
 assign gsl8vve0kt1telu1uuh75gpbwv_318 = ac08mxvz5bil4w5mix4a2x9i683fju0_888 ;
 assign z8idanfz3cwx032quf7p7t4jbj6m2rm_265 	= veowlehxw0q3196hffhtj_411 ;
 assign x8p6vohbgphpef3nm7yz019p_490 = 
	1'b0 ;
 assign xkk13xazfsb46llyvrca0xz2xhoz_417 	= zqk9n2fzzu0z62oy22_16[8:0] ;
 assign hmbkax17dezje3ctu30xfrt_634 = (
	((xkk13xazfsb46llyvrca0xz2xhoz_417 != x1g2ca7cvn89o21ekv3im2f7r700a_664))?1'b1:
	0)  ;
 assign rb1q483vr48uwymxkf4t6l4uf0nm9dyx_99 = pnb3q0epnq7qyvm550_76 ;
 assign v66695f1ue2wnra07k952n5tl_23 = pnb3q0epnq7qyvm550_76 ;
 assign oq96vdmqm8xhgq3na32k76a9v_633 = 
	 ~(v66695f1ue2wnra07k952n5tl_23) ;
 assign ffemk9ld4am6r2yzyk7_797 	= methegf0hgimcjt37k9s4e051_153 ;
 assign sjzcr18l9ernrfrv0_278 = 
	 ~(methegf0hgimcjt37k9s4e051_153) ;
 assign rebo8l8dp070rtcind7w_25 = 
	vq4p4ozgy4xs5j06_388 & sjzcr18l9ernrfrv0_278 & rb1q483vr48uwymxkf4t6l4uf0nm9dyx_99 & veowlehxw0q3196hffhtj_411 ;
 assign b2psin7tuln4hahpora_410 = 
	tuple_in_TUPLE0_DATA ;
 assign u0t4anuojkr7hopzobq_765 	= tuple_in_TUPLE0_VALID ;
 assign xcq1xqwidvsxc95c_901 	= b2psin7tuln4hahpora_410[255:0] ;
 assign pjrubrp7imeemwqghs4kz_458 = 
	 ~(bqis67y8sfv283s9nad0xztj05krz51a_444) ;
 assign l92v6oqmnrdxoy2z98xn9_850 	= rebo8l8dp070rtcind7w_25 ;
 assign etqx9lw9s4pt4nzhmpc47l_800 = 
	1'b0 ;
 assign bnlectrvx1ssw5gkir18w2_602 = 
	tuple_in_TUPLE1_DATA ;
 assign ltk70cfjc24vv3a6ngf5_269 	= tuple_in_TUPLE1_VALID ;
 assign ni3onoghtzz1slzpselmhook7kxorw_634 	= bnlectrvx1ssw5gkir18w2_602[159:0] ;
 assign zhcurvmejg67yt4gdwvaf_678 = 
	 ~(c1jmxz0hn645s5kw5cft_827) ;
 assign qxx19kj0ynp32z98ks_444 	= rebo8l8dp070rtcind7w_25 ;
 assign betox72ej0dkq7iuz_888 = 
	1'b0 ;
 assign vq4p4ozgy4xs5j06_388 = 
	vx3o9qh3hw75arjbjcca3_842 & pjrubrp7imeemwqghs4kz_458 & zhcurvmejg67yt4gdwvaf_678 ;
 assign uws3yl6n452947tc7q_115 = 
	efch6apa6wjeiaxld0hynszvs_406 | e8octlpm2xlrsioj84fctr38wul6qqh_432 | qwpxc03nos0m76enkzh8_196 ;
 assign packet_out_PACKET2_TVALID 	= ds968j1wg2q3exa0438dywuq_206 ;
 assign packet_out_PACKET2_TDATA 	= gd03ssogmqcaeklrb26c84ksew07q2o6_445[255:0] ;
 assign packet_out_PACKET2_TKEEP 	= kjr2qtqjrlziuiyas44qeksge_272[31:0] ;
 assign packet_out_PACKET2_TLAST 	= mlqrwtpyb9v00hdmu_148 ;
 assign packet_in_PACKET2_TREADY 	= packet_out_PACKET2_TREADY ;
 assign tuple_out_TUPLE0_VALID 	= kkp9rijiygpwt3e6dyroesoffj_21 ;
 assign tuple_out_TUPLE0_DATA 	= bfewk1udl9w3j50e_424[255:0] ;
 assign tuple_out_TUPLE1_VALID 	= kkp9rijiygpwt3e6dyroesoffj_21 ;
 assign tuple_out_TUPLE1_DATA 	= jwc0073khj6fe5g85xhkcy_690[159:0] ;


assign wgecqmyli35qdbxgb74vm_536 = (
	((veowlehxw0q3196hffhtj_411 == 1'b1))?b5440p3csom0pwkl91_7 :
	((k0z38yodnfscw6nucqqpms1jtdg_539 == 1'b1))?o4twx22odrn7k9gqa3g5i5y_616 :
	k96ub665cin1cjbqqwcca5_242 ) ;

assign hx4ms1f05dhjfhl1pfd3kjd5_891 = (
	((k96ub665cin1cjbqqwcca5_242 == 1'b1) && (k0z38yodnfscw6nucqqpms1jtdg_539 == 1'b1))?o4twx22odrn7k9gqa3g5i5y_616 :
	k96ub665cin1cjbqqwcca5_242 ) ;



always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	h6jyr6jmwic0rhrbu16duu1ezuw3_344 <= 1'b0 ;
	k96ub665cin1cjbqqwcca5_242 <= 1'b0 ;
	uf84rmwq5wc8mgwhlu4_363 <= 1'b0 ;
	ibrijjsc94cx0a7z1_660 <= 1'b0 ;
	x1g2ca7cvn89o21ekv3im2f7r700a_664 <= 9'b000000000 ;
	efch6apa6wjeiaxld0hynszvs_406 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		h6jyr6jmwic0rhrbu16duu1ezuw3_344 <= backpressure_in ;
		k96ub665cin1cjbqqwcca5_242 <= wgecqmyli35qdbxgb74vm_536 ;
		uf84rmwq5wc8mgwhlu4_363 <= vx3o9qh3hw75arjbjcca3_842 ;
		ibrijjsc94cx0a7z1_660 <= veowlehxw0q3196hffhtj_411 ;
		x1g2ca7cvn89o21ekv3im2f7r700a_664 <= xkk13xazfsb46llyvrca0xz2xhoz_417 ;
		efch6apa6wjeiaxld0hynszvs_406 <= wdc8xabiy4q2ecfye6m0v5pw_832 ;
		backpressure_out <= uws3yl6n452947tc7q_115 ;
  end
end

always @(posedge clk_in_0)
begin
  if (rst_in_0) 
  begin
	v9rh0hsayz46yi9fsbhogk_400 <= 1'b0 ;
	rbl0tvx9qi3gyhpj0nb0oz5m_172 <= 1'b1 ;
   end
  else
  begin
	if (a0lilcsn0trpgk8si1t_216) 
	begin 
	  v9rh0hsayz46yi9fsbhogk_400 <= 1'b0 ;
	 end 
	else 
	begin 
		if (gi15uki8aikbj3bcn8uemdazhw4q22j_785) 
		begin 
			v9rh0hsayz46yi9fsbhogk_400 <= zo95no2m0qrirce13p_27 ;
		end 
	end 
	if (ac08mxvz5bil4w5mix4a2x9i683fju0_888) 
	begin 
		rbl0tvx9qi3gyhpj0nb0oz5m_172 <= g3e6lrtfdo3jh3nm02m33lfvy57_641 ;
	end 
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	kkp9rijiygpwt3e6dyroesoffj_21 <= 1'b0 ;
	e8octlpm2xlrsioj84fctr38wul6qqh_432 <= 1'b0 ;
   end
  else
  begin
		kkp9rijiygpwt3e6dyroesoffj_21 <= rebo8l8dp070rtcind7w_25 ;
		e8octlpm2xlrsioj84fctr38wul6qqh_432 <= t0nb09wxto1qggm43ilfc_640 ;
  end
end

always @(posedge clk_out_2)
begin
  if (rst_in_0) 
  begin
	qwpxc03nos0m76enkzh8_196 <= 1'b0 ;
   end
  else
  begin
		qwpxc03nos0m76enkzh8_196 <= g01zk684a2v0vqozm3ga2yhkbfnrjt1_104 ;
  end
end

defparam r68r0fuy3z5lsi4ljt01ur82f_1581.WRITE_DATA_WIDTH = 290; 
defparam r68r0fuy3z5lsi4ljt01ur82f_1581.FIFO_WRITE_DEPTH = 512; 
defparam r68r0fuy3z5lsi4ljt01ur82f_1581.PROG_FULL_THRESH = 177; 
defparam r68r0fuy3z5lsi4ljt01ur82f_1581.PROG_EMPTY_THRESH = 177; 
defparam r68r0fuy3z5lsi4ljt01ur82f_1581.READ_MODE = "STD"; 
defparam r68r0fuy3z5lsi4ljt01ur82f_1581.WR_DATA_COUNT_WIDTH = 9; 
defparam r68r0fuy3z5lsi4ljt01ur82f_1581.RD_DATA_COUNT_WIDTH = 9; 
defparam r68r0fuy3z5lsi4ljt01ur82f_1581.DOUT_RESET_VALUE = "0"; 
defparam r68r0fuy3z5lsi4ljt01ur82f_1581.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_sync r68r0fuy3z5lsi4ljt01ur82f_1581 (
	.wr_en(absthicla7h299e09l3_173),
	.din(q8mc91v84d8e3wao9ck0t95r7l4v_553),
	.rd_en(ynkt1mu4zirehi32k7nbqte9p6h_21),
	.sleep(h8wcbil1o3pd4jkgkk6_239),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(ff43snoe63i72zs6ueai_883), 
	.dout(pykl4w3rxuh5z3q4l2z9z89x6j_547), 
	.empty(mst9folg9ugexxgwwgmqbja13g0_445), 
	.prog_full(wdc8xabiy4q2ecfye6m0v5pw_832), 
	.full(ow8bcrqk34s6z5n6ivt6dg2u1sox3mz_477), 
	.rd_data_count(cxn1b2a7uv86hv3czf_535), 
	.wr_data_count(i9nddkxgbik6ntzhfz587ehh_171), 
	.wr_rst_busy(oazvi9047wrv17oj15j2ndd_834), 
	.rd_rst_busy(xgr3q8zelgbg9ajgv_853), 
	.overflow(ph5il27c8rntsa1i12w_392), 
	.underflow(hf7vg52u2t0bshk7knrh8b_136), 
	.sbiterr(wgaw3i6t10rzhikxyzg51iuglim_746), 
	.dbiterr(h1zpodkq7pwiqqm40huy10_717), 
	.almost_empty(h4tuptlg3wk4iy1lhbhxhqj7_328), 
	.almost_full(mhrnji4kvyf6oqf6cg0no4_185), 
	.wr_ack(q9elp99pmzqxgco1gd2_403), 
	.data_valid(ne1ku7nsj9wkhcyfikzpmb5oh_211), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam v5y75d88aatjqf7lixot90s76yn2zsll_1126.WRITE_DATA_WIDTH = 1; 
defparam v5y75d88aatjqf7lixot90s76yn2zsll_1126.FIFO_WRITE_DEPTH = 512; 
defparam v5y75d88aatjqf7lixot90s76yn2zsll_1126.PROG_FULL_THRESH = 177; 
defparam v5y75d88aatjqf7lixot90s76yn2zsll_1126.PROG_EMPTY_THRESH = 177; 
defparam v5y75d88aatjqf7lixot90s76yn2zsll_1126.READ_MODE = "FWFT"; 
defparam v5y75d88aatjqf7lixot90s76yn2zsll_1126.WR_DATA_COUNT_WIDTH = 9; 
defparam v5y75d88aatjqf7lixot90s76yn2zsll_1126.RD_DATA_COUNT_WIDTH = 9; 
defparam v5y75d88aatjqf7lixot90s76yn2zsll_1126.DOUT_RESET_VALUE = "0"; 
defparam v5y75d88aatjqf7lixot90s76yn2zsll_1126.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_sync v5y75d88aatjqf7lixot90s76yn2zsll_1126 (
	.wr_en(o596xp0o04w3uw2rs6d7_559),
	.din(gsl8vve0kt1telu1uuh75gpbwv_318),
	.rd_en(z8idanfz3cwx032quf7p7t4jbj6m2rm_265),
	.sleep(x8p6vohbgphpef3nm7yz019p_490),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(xxngiodfx38e1zas4itm7a6z3cyow5_260), 
	.dout(pnb3q0epnq7qyvm550_76), 
	.empty(methegf0hgimcjt37k9s4e051_153), 
	.prog_full(o2qv3wlayw1geewuk1d14v2dzchzqkd_3), 
	.full(yyscbjll9wg2wnnepigjj2vq6uq2uj6_323), 
	.rd_data_count(zqk9n2fzzu0z62oy22_16), 
	.wr_data_count(dcor06510p54tcw8jel67crhc5iti_322), 
	.wr_rst_busy(ewdfl51qnr1q4ah1uzfwcu1j7hvs_748), 
	.rd_rst_busy(uqp67z2q6h1e2h5lnm_67), 
	.overflow(s7ipq6550nzmzrd8f_810), 
	.underflow(vniodbh3gv67kzlgni90ab_78), 
	.sbiterr(z1hplsvryjxl42q2y_314), 
	.dbiterr(fm0nekcpnrz93s74inxl71_592), 
	.almost_empty(dnbi862a3v2wol25b7pu7nhs_304), 
	.almost_full(du26ctgj7m8rh6thamf8byljjh8i_107), 
	.wr_ack(diokctb9kdhrralalha7tbbcbcr9_424), 
	.data_valid(wq0bgz0l5546gn38nq13y_824), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam tm9msavv3a41yf3qpvw17_636.WRITE_DATA_WIDTH = 256; 
defparam tm9msavv3a41yf3qpvw17_636.FIFO_WRITE_DEPTH = 256; 
defparam tm9msavv3a41yf3qpvw17_636.PROG_FULL_THRESH = 66; 
defparam tm9msavv3a41yf3qpvw17_636.PROG_EMPTY_THRESH = 66; 
defparam tm9msavv3a41yf3qpvw17_636.READ_MODE = "STD"; 
defparam tm9msavv3a41yf3qpvw17_636.WR_DATA_COUNT_WIDTH = 8; 
defparam tm9msavv3a41yf3qpvw17_636.RD_DATA_COUNT_WIDTH = 8; 
defparam tm9msavv3a41yf3qpvw17_636.DOUT_RESET_VALUE = "0"; 
defparam tm9msavv3a41yf3qpvw17_636.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async tm9msavv3a41yf3qpvw17_636 (
	.wr_en(u0t4anuojkr7hopzobq_765),
	.din(xcq1xqwidvsxc95c_901),
	.rd_en(l92v6oqmnrdxoy2z98xn9_850),
	.sleep(etqx9lw9s4pt4nzhmpc47l_800),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(osrxkm7m2tufk71brt8xinyfa_162), 
	.dout(bfewk1udl9w3j50e_424), 
	.empty(bqis67y8sfv283s9nad0xztj05krz51a_444), 
	.prog_full(t0nb09wxto1qggm43ilfc_640), 
	.full(szlaml2n06gmx5pt_834), 
	.rd_data_count(u1oby4ur7pbo6vm1ixfu3astggxa5jb_49), 
	.wr_data_count(r9c5h31ay13qbrmnvp6s_903), 
	.wr_rst_busy(zfgrm3oofog1f473h47b5rq7uo9z_881), 
	.rd_rst_busy(xpi2vsy79nkivlh4rghu_157), 
	.overflow(t7dg6tuptsmzezqyhelujr6nq9cp_723), 
	.underflow(xzwcct1vn6sats9w_597), 
	.sbiterr(usxjphq00zt2lp5q7w_210), 
	.dbiterr(ea4j94fzul3xl6f4zvrd7u2wxwfu_503), 
	.almost_empty(bazt5f6cdtn2qb9mr_455), 
	.almost_full(rgvejunun38vm827r1t9klq3_130), 
	.wr_ack(nuw012ef2q9lp8ot4y_684), 
	.data_valid(mr982gssuozv072tht1g_666), 

	.wr_clk(clk_in_1), 

	.rd_clk(clk_out_1), 
	.rst(rst_in_1) 
); 

defparam u4vvfbwhzuy4pna8lfe9cmwmalg5d_286.WRITE_DATA_WIDTH = 160; 
defparam u4vvfbwhzuy4pna8lfe9cmwmalg5d_286.FIFO_WRITE_DEPTH = 256; 
defparam u4vvfbwhzuy4pna8lfe9cmwmalg5d_286.PROG_FULL_THRESH = 66; 
defparam u4vvfbwhzuy4pna8lfe9cmwmalg5d_286.PROG_EMPTY_THRESH = 66; 
defparam u4vvfbwhzuy4pna8lfe9cmwmalg5d_286.READ_MODE = "STD"; 
defparam u4vvfbwhzuy4pna8lfe9cmwmalg5d_286.WR_DATA_COUNT_WIDTH = 8; 
defparam u4vvfbwhzuy4pna8lfe9cmwmalg5d_286.RD_DATA_COUNT_WIDTH = 8; 
defparam u4vvfbwhzuy4pna8lfe9cmwmalg5d_286.DOUT_RESET_VALUE = "0"; 
defparam u4vvfbwhzuy4pna8lfe9cmwmalg5d_286.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async u4vvfbwhzuy4pna8lfe9cmwmalg5d_286 (
	.wr_en(ltk70cfjc24vv3a6ngf5_269),
	.din(ni3onoghtzz1slzpselmhook7kxorw_634),
	.rd_en(qxx19kj0ynp32z98ks_444),
	.sleep(betox72ej0dkq7iuz_888),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(i526mkt9q7sq9hraunw8pd_873), 
	.dout(jwc0073khj6fe5g85xhkcy_690), 
	.empty(c1jmxz0hn645s5kw5cft_827), 
	.prog_full(g01zk684a2v0vqozm3ga2yhkbfnrjt1_104), 
	.full(r9jt33n65y6b7qu6yu7bfq4i4i_258), 
	.rd_data_count(zky9o66c9m8qoktk7nlq97pkn_579), 
	.wr_data_count(e8bbrnuxba25y1e5vw91xp_169), 
	.wr_rst_busy(xxkbfvt1gdjxfy6w4ot7hr4x62tlkbm_863), 
	.rd_rst_busy(m1e5d646645lsztea7m9l0zvbt1uqj_599), 
	.overflow(mkvkgudnjy3zsrxw_292), 
	.underflow(efb6xft0lnk4a847a4bpuc29_674), 
	.sbiterr(a4gecet99v74ew9ubxguqn5ip7kclfz_740), 
	.dbiterr(go60ok36zilkwzizqypz_146), 
	.almost_empty(wdp8x4v49w3phtame_672), 
	.almost_full(v8s93chitlyrcg5jnlndj4xdmj6yw_603), 
	.wr_ack(ncrn6hddeukka1n9j0fu9gw_337), 
	.data_valid(h9a5jty0y7cxkyfa3yx6afh58tq9cz_72), 

	.wr_clk(clk_in_2), 

	.rd_clk(clk_out_2), 
	.rst(rst_in_2) 
); 

endmodule 
