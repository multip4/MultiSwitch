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
// File created: 2020/04/16 20:38:09
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






 reg	vujio7qr62mopdp82zfqle5joxbgpb_287;	 initial vujio7qr62mopdp82zfqle5joxbgpb_287 = 1'b0 ;
 wire	c1aguztukingskxwgsy_818 ;
 wire [289:0] lxzgsk1794a9wtlp5on14kxv_270 ;
 wire	ypi8uvof73z6v0bfvz_823 ;
 wire	rzaa9tio4o2av6ib156965k46_316 ;
 wire	qjv0u8rms9qb82lfyj_446 ;
 wire [8:0] iwecws74rvlu7g0nz2_833 ;
 wire [8:0] ko48vyu3gc5iuo97plcnowej4612_629 ;
 wire	yfe3aoubggwbg569vhv49uevifzo09gc_419 ;
 wire	uuohp3izvha88ptc9day1kl5h1yq_586 ;
 wire	z2xkacj3rh2us9ye2060l_708 ;
 wire	ano8u6o8pc85ux7htf1kqfib_52 ;
 wire	g74wfp1t6vino0qv4zqj4du6_760 ;
 wire	d7bf606xrucm46nmdz4xq3j53yk_259 ;
 wire	rgs3blbezz2fq29ctbpavlh716q0n3_285 ;
 wire	z9wwh0uuia4y383qu_721 ;
 wire	ks20ezmie5hp88w3mmkklgo3irz1eeiw_550 ;
 wire	cfnxq5vrrcbkg2oya6_146 ;
 wire	cqxu54r2k40kmxp4ppbxgxjt1_729 ;
 reg	dq9j3zksqbg985yyv73z_270;	 initial dq9j3zksqbg985yyv73z_270 = 1'b0 ;
 wire	kbvdo64km34r5mbnykt_2 ;
 reg	kb5fqonodbuu3b9x8bfvz9ks_602;	 initial kb5fqonodbuu3b9x8bfvz9ks_602 = 1'b0 ;
 reg	zbohjdkkrx17py9wxj_639;	 initial zbohjdkkrx17py9wxj_639 = 1'b0 ;
 wire	jf8ydfcg9w10nxj8n_47 ;
 wire [0:0] ixvvlix1nds1qnr9_465 ;
 wire	ngrdmt45za01wb3v5y1vd_654 ;
 wire	dje7zzu9mz57j8xfkv46up2t71d_145 ;
 wire	harzgquwlkm9xzebcu82tr8sk51h9_801 ;
 wire [8:0] o66if6maapvmqx9bja_839 ;
 wire [8:0] flloykatipz1gd2t45dwlj6xvxhmue_810 ;
 wire	b2gsqpzbdmx9srxuhc8y7_551 ;
 wire	d716mexcw0f5td8y_43 ;
 wire	r5kvd07pmpop1g1tp82dou5q588_810 ;
 wire	p0r9w9blkenk3pd9xnoe7sfue_13 ;
 wire	sei7vwujzadafflh0vjpgq00dgmqwk_791 ;
 wire	m1wwe8s3hcxglx6jh8jiypa_559 ;
 wire	ugfaqxc3e0iwmwitmfoe5_275 ;
 wire	yvhba89e3gykpncs78ie6x3b_503 ;
 wire	fcf7at1nk661cxg3b3cwz8eieutlptq_691 ;
 wire	ep9ub61g8rc0hs5bpnbhlacxrc8b5h4r_386 ;
 reg	xhhbmfayzdpgz8gc7bjclhcn_580;	 initial xhhbmfayzdpgz8gc7bjclhcn_580 = 1'b0 ;
 reg	pxvtwyregqdjd100c5kez0y_173;	 initial pxvtwyregqdjd100c5kez0y_173 = 1'b1 ;
 reg [8:0] f16v0hxghpw4or2mwl4_573;	 initial f16v0hxghpw4or2mwl4_573 = 9'b000000000 ;
 reg	fly9cly4dzpszqncyqx3akh08ng5thv_86;	 initial fly9cly4dzpszqncyqx3akh08ng5thv_86 = 1'b0 ;
 wire	bomwdz36xfkrya22krar_825 ;
 wire [255:0] cyw7fyd0504bxnsr1zamvx_802 ;
 wire	vx9hfl7bqyotp48un2hv4wd3_225 ;
 wire	sm18lixumxg3tbwti0y_376 ;
 wire	cunfpi70dcwr9p73j84bk5w_361 ;
 wire [7:0] ah68sviqey3oi80rb598pwrcbjnd_739 ;
 wire [7:0] ex7w0csp32s13d8frmdq_727 ;
 wire	omfroba1fq2lks1swdoiztududuv1i_660 ;
 wire	emrhf8f0zrrw8enyz8e_746 ;
 wire	urtx1ftze3q3ss9segir50rofpbegux_419 ;
 wire	uwalatvgpkhoqlcef2g5tqy7blr93_642 ;
 wire	yfl1y1k78yhp63c12s7bku43d_777 ;
 wire	wirngs16136aq51zk4zs3czloekusy_777 ;
 wire	qq1zofkikkc3ob7xpmdu29qcyzeybn9y_372 ;
 wire	o5uje6na8gspgqnpxdh1khx5muxi_51 ;
 wire	hxiwbqijmuxq8zzaj283cqam15o6_314 ;
 wire	sw7gcdio5wd4zx5syzyko9adzs_280 ;
 wire	vfhv60zivdzkd4g2n6ax7uhkgnv18t_208 ;
 wire [159:0] mzlme66axieqikeuhen9g6cdd3aah8_206 ;
 wire	ffad56jva4auuhh7a1nantyiqbkjn_847 ;
 wire	wjpzmmbdjzqttqlfujvuentlkf86_432 ;
 wire	uxkvzn6ftrszwmxeq2_408 ;
 wire [7:0] oy2y8t47a8d311a9ws4jjx_231 ;
 wire [7:0] avla4yjdkyqpiq4v_326 ;
 wire	g62tny9ygfth5rwwclwyrxig0quq1_722 ;
 wire	qr49809d8dlyvtrolfsia6orjz0_663 ;
 wire	vctpieeayq6s6xbiyqw_184 ;
 wire	lna5ll6fnzny0cjv1v2p1fjq4k_12 ;
 wire	q2191ygy2j0lhigyvkxyp6l032u1642_747 ;
 wire	k8ayshf8yoid984g_586 ;
 wire	ro09y5faqi336o5e3506zghc_557 ;
 wire	fm8v85wpo9ufdbburx4dpf16xewwz2_476 ;
 wire	zhpkbr96vgmqsjpt9z_372 ;
 wire	ehmdevlnuhimb8oondx5_684 ;
 reg	g1otly9oxjeww2r3trexx4qn00uktid_149;	 initial g1otly9oxjeww2r3trexx4qn00uktid_149 = 1'b0 ;
 reg	ztsqm8yfo5hr7ygb4fs8n_444;	 initial ztsqm8yfo5hr7ygb4fs8n_444 = 1'b0 ;
 reg	v81qv0y1cxyn7j6vrl9vextro6cp1p9_765;	 initial v81qv0y1cxyn7j6vrl9vextro6cp1p9_765 = 1'b0 ;
 wire	qbs2pfe8f5lgb39vn87n0w84_872 ;
 wire [289:0] dggtp9w8ypyzcy1vqx6q1aw9xi_864 ;
 wire	lwg025qikvci84hy4q4a3pv7604_811 ;
 wire [289:0] h7j3qhzco61zw3byh9n8t0f_92 ;
 wire	ou70r8icsuujz6oiz6vmd32k_99 ;
 wire	n1ipgl7x2e8qdxb3xi7wwzyqc_16 ;
 wire	ur6bx1szos3f5y8aijb05r16xjzcn370_114 ;
 wire	lv1z2ou08511yjsks0wica_233 ;
 wire	kmp0vmrbsu5qtwbt7hu_905 ;
 wire	x4ychha0c5jl4ez8gcxtj_428 ;
 wire	xj2w5zvns8p3jf6cummdw7wujr_646 ;
 wire	zof4zx3s0f3dzz4t5ie5gelc0wqv_799 ;
 wire	rfbh5x4pi9f55q3hoop3_0 ;
 wire	l3lorsxc05f0e6kxhtog0nf5z1dzc_547 ;
 wire	y267cw7tstrz1nu0wywyig4kjvztfo_589 ;
 wire	cl8b1lipsqrhl1ovmukyoa7laovar_369 ;
 wire	gfjoy8o5juowxx1n41t0knf76xe_509 ;
 wire	psg8oex43i5rrindwt37rt4qv74q5vt2_556 ;
 wire [31:0] j8wg7sa1w5j9j0sy4wmibt_493 ;
 wire [255:0] ad1l2e0babbdwoiwf3ms_776 ;
 wire	kkhsylg0dpzdde8axjwhb4xoaeum_654 ;
 wire	nwvhjncjlswdfug0lchx4ujtzw0s7t_850 ;
 wire	htqkklf9fosd3i19mkeu4y8zu_523 ;
 wire	xywg82uzp9442m36f_159 ;
 wire	vc1enqmhi93ln04olaevaahbys2_200 ;
 wire	daz7nddt5f1hhck2uw_814 ;
 wire	durayjemlgwu9s829tk_725 ;
 wire	a4n74kdbr0r9k4b2gk5x1o7aw0x_155 ;
 wire	f1rvu7jx3znk9tggp3ehpi_657 ;
 wire	jnxy8d9we5dpwyhvy2zz1nkw_104 ;
 wire	idnsl5b03rh9lt1xoaq1fp2cq30i_766 ;
 wire	n5vop9u3nhpdab99bd_52 ;
 wire	psb3zrpph42me5d6tjr2vamj5eali_233 ;
 wire	r46fzhr6eq8bfsj73fc_785 ;
 wire	e2bv9iyu9gbc8roahhjunczujouku31_135 ;
 wire	osvhh9n22bhdsi0omvp67ar6f1z_664 ;
 wire [0:0] s3f9nene1c14g2f69p4tmzk_265 ;
 wire	syo9qumbm7nc678h9t9xi_654 ;
 wire	kqnl4dex7k21ktgn_191 ;
 wire [8:0] ohto9jm647duhjbt8yztshqownxil_347 ;
 wire	xt4znau4wa9wv6b13jgk3lkgwja2ezc_89 ;
 wire	e4r8i4gzf04u1pxl4012ec5fem9yw_513 ;
 wire	xd43d0skh14sakbhfy2e1_52 ;
 wire	pcms268zv36vz7hg1bxaytrvmz_906 ;
 wire	cb59wzct4071th3wlbo6m0bg_171 ;
 wire	onh85t1bgxy47hhf69bsa9mods_51 ;
 wire	za7fij2nxni6fc1ppjo7hyo8fe8cc_269 ;
 wire [255:0] rkn3jqk89eex1awqfifx1zu_556 ;
 wire	qkf8z6sfxzxksduw_850 ;
 wire [255:0] yaanly78x4ovr4kor9_120 ;
 wire	d9fkn1b4pyyzvqz5z4mkdzkp_824 ;
 wire	hzkxqga8ixjor5j53k_706 ;
 wire	ak8tewpcpybrxcp4ywfczjl5nbw2m_789 ;
 wire [159:0] cmug0deqozr1gani56jp_252 ;
 wire	jtokd15itqfnby1pc_744 ;
 wire [159:0] n95z4f6fos3iocd7uwys2165x0mu2_436 ;
 wire	rzbdwsdvfhk8swca1qh_859 ;
 wire	b620o9z1b6l7k5tup7dkjsc3z_393 ;
 wire	p8aw2kqrz7wjx3kh4_868 ;
 wire	yg23d1jzhwrcxduvcfvm3mhjpj_546 ;
 wire	oboq7qje5l4tf3c4kcttr2zls6ks_65 ;


 assign qbs2pfe8f5lgb39vn87n0w84_872 = 
	 ~(backpressure_in) ;
 assign dggtp9w8ypyzcy1vqx6q1aw9xi_864 = 
	{packet_in_PACKET2_TVALID, packet_in_PACKET2_TDATA, packet_in_PACKET2_TKEEP, packet_in_PACKET2_TLAST} ;
 assign lwg025qikvci84hy4q4a3pv7604_811 	= packet_in_PACKET2_TVALID ;
 assign h7j3qhzco61zw3byh9n8t0f_92 	= dggtp9w8ypyzcy1vqx6q1aw9xi_864[289:0] ;
 assign ou70r8icsuujz6oiz6vmd32k_99 = 
	pcms268zv36vz7hg1bxaytrvmz_906 | yg23d1jzhwrcxduvcfvm3mhjpj_546 ;
 assign n1ipgl7x2e8qdxb3xi7wwzyqc_16 = 
	1'b0 ;
 assign ur6bx1szos3f5y8aijb05r16xjzcn370_114 = 
	1'b1 ;
 assign lv1z2ou08511yjsks0wica_233 = 
	 ~(kbvdo64km34r5mbnykt_2) ;
 assign kmp0vmrbsu5qtwbt7hu_905 = 
	onh85t1bgxy47hhf69bsa9mods_51 & ou70r8icsuujz6oiz6vmd32k_99 & gfjoy8o5juowxx1n41t0knf76xe_509 ;
 assign x4ychha0c5jl4ez8gcxtj_428 = 
	lv1z2ou08511yjsks0wica_233 & dq9j3zksqbg985yyv73z_270 & gfjoy8o5juowxx1n41t0knf76xe_509 & pcms268zv36vz7hg1bxaytrvmz_906 & onh85t1bgxy47hhf69bsa9mods_51 ;
 assign xj2w5zvns8p3jf6cummdw7wujr_646 = 
	kmp0vmrbsu5qtwbt7hu_905 | x4ychha0c5jl4ez8gcxtj_428 ;
 assign zof4zx3s0f3dzz4t5ie5gelc0wqv_799 = 
	qbs2pfe8f5lgb39vn87n0w84_872 & xj2w5zvns8p3jf6cummdw7wujr_646 ;
 assign rfbh5x4pi9f55q3hoop3_0 = 
	backpressure_in & vujio7qr62mopdp82zfqle5joxbgpb_287 & onh85t1bgxy47hhf69bsa9mods_51 & xd43d0skh14sakbhfy2e1_52 & yg23d1jzhwrcxduvcfvm3mhjpj_546 & lv1z2ou08511yjsks0wica_233 ;
 assign l3lorsxc05f0e6kxhtog0nf5z1dzc_547 = 
	zof4zx3s0f3dzz4t5ie5gelc0wqv_799 | rfbh5x4pi9f55q3hoop3_0 ;
 assign y267cw7tstrz1nu0wywyig4kjvztfo_589 	= l3lorsxc05f0e6kxhtog0nf5z1dzc_547 ;
 assign cl8b1lipsqrhl1ovmukyoa7laovar_369 = 
	1'b0 ;
 assign gfjoy8o5juowxx1n41t0knf76xe_509 = 
	 ~(ypi8uvof73z6v0bfvz_823) ;
 assign psg8oex43i5rrindwt37rt4qv74q5vt2_556 	= lxzgsk1794a9wtlp5on14kxv_270[0] ;
 assign j8wg7sa1w5j9j0sy4wmibt_493 	= lxzgsk1794a9wtlp5on14kxv_270[32:1] ;
 assign ad1l2e0babbdwoiwf3ms_776 	= lxzgsk1794a9wtlp5on14kxv_270[288:33] ;
 assign kkhsylg0dpzdde8axjwhb4xoaeum_654 	= lxzgsk1794a9wtlp5on14kxv_270[289] ;
 assign nwvhjncjlswdfug0lchx4ujtzw0s7t_850 = 
	vujio7qr62mopdp82zfqle5joxbgpb_287 | zbohjdkkrx17py9wxj_639 ;
 assign htqkklf9fosd3i19mkeu4y8zu_523 = 
	kb5fqonodbuu3b9x8bfvz9ks_602 | gfjoy8o5juowxx1n41t0knf76xe_509 ;
 assign xywg82uzp9442m36f_159 = 
	htqkklf9fosd3i19mkeu4y8zu_523 & onh85t1bgxy47hhf69bsa9mods_51 & ou70r8icsuujz6oiz6vmd32k_99 ;
 assign vc1enqmhi93ln04olaevaahbys2_200 = 
	xywg82uzp9442m36f_159 | dq9j3zksqbg985yyv73z_270 ;
 assign daz7nddt5f1hhck2uw_814 = 
	backpressure_in & kkhsylg0dpzdde8axjwhb4xoaeum_654 & vc1enqmhi93ln04olaevaahbys2_200 ;
 assign durayjemlgwu9s829tk_725 = 
	xd43d0skh14sakbhfy2e1_52 & fly9cly4dzpszqncyqx3akh08ng5thv_86 ;
 assign a4n74kdbr0r9k4b2gk5x1o7aw0x_155 = 
	durayjemlgwu9s829tk_725 | pcms268zv36vz7hg1bxaytrvmz_906 | psg8oex43i5rrindwt37rt4qv74q5vt2_556 ;
 assign f1rvu7jx3znk9tggp3ehpi_657 = 
	qbs2pfe8f5lgb39vn87n0w84_872 & dq9j3zksqbg985yyv73z_270 & kkhsylg0dpzdde8axjwhb4xoaeum_654 & a4n74kdbr0r9k4b2gk5x1o7aw0x_155 ;
 assign jnxy8d9we5dpwyhvy2zz1nkw_104 	= dq9j3zksqbg985yyv73z_270 ;
 assign idnsl5b03rh9lt1xoaq1fp2cq30i_766 	= packet_in_PACKET2_TVALID ;
 assign n5vop9u3nhpdab99bd_52 = 
	1'b0 ;
 assign psb3zrpph42me5d6tjr2vamj5eali_233 = 
	1'b1 ;
 assign r46fzhr6eq8bfsj73fc_785 = (
	((xhhbmfayzdpgz8gc7bjclhcn_580 == 1'b1) && (packet_in_PACKET2_TVALID == 1'b1))?1'b1:
	((pxvtwyregqdjd100c5kez0y_173 == 1'b1) && (packet_in_PACKET2_TVALID == 1'b1))?1'b1:
	0)  ;
 assign e2bv9iyu9gbc8roahhjunczujouku31_135 = (
	((packet_in_PACKET2_TVALID == 1'b1) && (packet_in_PACKET2_TLAST == 1'b1))?1'b1:
	0)  ;
 assign osvhh9n22bhdsi0omvp67ar6f1z_664 = (
	((packet_in_PACKET2_TVALID == 1'b1) && (packet_in_PACKET2_TLAST == 1'b0))?1'b1:
	0)  ;
 assign s3f9nene1c14g2f69p4tmzk_265 = r46fzhr6eq8bfsj73fc_785 ;
 assign syo9qumbm7nc678h9t9xi_654 	= l3lorsxc05f0e6kxhtog0nf5z1dzc_547 ;
 assign kqnl4dex7k21ktgn_191 = 
	1'b0 ;
 assign ohto9jm647duhjbt8yztshqownxil_347 	= o66if6maapvmqx9bja_839[8:0] ;
 assign xt4znau4wa9wv6b13jgk3lkgwja2ezc_89 = (
	((ohto9jm647duhjbt8yztshqownxil_347 != f16v0hxghpw4or2mwl4_573))?1'b1:
	0)  ;
 assign e4r8i4gzf04u1pxl4012ec5fem9yw_513 = ixvvlix1nds1qnr9_465 ;
 assign xd43d0skh14sakbhfy2e1_52 = ixvvlix1nds1qnr9_465 ;
 assign pcms268zv36vz7hg1bxaytrvmz_906 = 
	 ~(xd43d0skh14sakbhfy2e1_52) ;
 assign cb59wzct4071th3wlbo6m0bg_171 	= ngrdmt45za01wb3v5y1vd_654 ;
 assign onh85t1bgxy47hhf69bsa9mods_51 = 
	 ~(ngrdmt45za01wb3v5y1vd_654) ;
 assign za7fij2nxni6fc1ppjo7hyo8fe8cc_269 = 
	yg23d1jzhwrcxduvcfvm3mhjpj_546 & onh85t1bgxy47hhf69bsa9mods_51 & e4r8i4gzf04u1pxl4012ec5fem9yw_513 & l3lorsxc05f0e6kxhtog0nf5z1dzc_547 ;
 assign rkn3jqk89eex1awqfifx1zu_556 = 
	tuple_in_TUPLE0_DATA ;
 assign qkf8z6sfxzxksduw_850 	= tuple_in_TUPLE0_VALID ;
 assign yaanly78x4ovr4kor9_120 	= rkn3jqk89eex1awqfifx1zu_556[255:0] ;
 assign d9fkn1b4pyyzvqz5z4mkdzkp_824 = 
	 ~(vx9hfl7bqyotp48un2hv4wd3_225) ;
 assign hzkxqga8ixjor5j53k_706 	= za7fij2nxni6fc1ppjo7hyo8fe8cc_269 ;
 assign ak8tewpcpybrxcp4ywfczjl5nbw2m_789 = 
	1'b0 ;
 assign cmug0deqozr1gani56jp_252 = 
	tuple_in_TUPLE1_DATA ;
 assign jtokd15itqfnby1pc_744 	= tuple_in_TUPLE1_VALID ;
 assign n95z4f6fos3iocd7uwys2165x0mu2_436 	= cmug0deqozr1gani56jp_252[159:0] ;
 assign rzbdwsdvfhk8swca1qh_859 = 
	 ~(ffad56jva4auuhh7a1nantyiqbkjn_847) ;
 assign b620o9z1b6l7k5tup7dkjsc3z_393 	= za7fij2nxni6fc1ppjo7hyo8fe8cc_269 ;
 assign p8aw2kqrz7wjx3kh4_868 = 
	1'b0 ;
 assign yg23d1jzhwrcxduvcfvm3mhjpj_546 = 
	gfjoy8o5juowxx1n41t0knf76xe_509 & d9fkn1b4pyyzvqz5z4mkdzkp_824 & rzbdwsdvfhk8swca1qh_859 ;
 assign oboq7qje5l4tf3c4kcttr2zls6ks_65 = 
	g1otly9oxjeww2r3trexx4qn00uktid_149 | ztsqm8yfo5hr7ygb4fs8n_444 | v81qv0y1cxyn7j6vrl9vextro6cp1p9_765 ;
 assign packet_out_PACKET2_TVALID 	= jnxy8d9we5dpwyhvy2zz1nkw_104 ;
 assign packet_out_PACKET2_TDATA 	= ad1l2e0babbdwoiwf3ms_776[255:0] ;
 assign packet_out_PACKET2_TKEEP 	= j8wg7sa1w5j9j0sy4wmibt_493[31:0] ;
 assign packet_out_PACKET2_TLAST 	= psg8oex43i5rrindwt37rt4qv74q5vt2_556 ;
 assign packet_in_PACKET2_TREADY 	= packet_out_PACKET2_TREADY ;
 assign tuple_out_TUPLE0_VALID 	= fly9cly4dzpszqncyqx3akh08ng5thv_86 ;
 assign tuple_out_TUPLE0_DATA 	= cyw7fyd0504bxnsr1zamvx_802[255:0] ;
 assign tuple_out_TUPLE1_VALID 	= fly9cly4dzpszqncyqx3akh08ng5thv_86 ;
 assign tuple_out_TUPLE1_DATA 	= mzlme66axieqikeuhen9g6cdd3aah8_206[159:0] ;


assign cqxu54r2k40kmxp4ppbxgxjt1_729 = (
	((l3lorsxc05f0e6kxhtog0nf5z1dzc_547 == 1'b1))?ur6bx1szos3f5y8aijb05r16xjzcn370_114 :
	((qbs2pfe8f5lgb39vn87n0w84_872 == 1'b1))?n1ipgl7x2e8qdxb3xi7wwzyqc_16 :
	dq9j3zksqbg985yyv73z_270 ) ;

assign kbvdo64km34r5mbnykt_2 = (
	((dq9j3zksqbg985yyv73z_270 == 1'b1) && (qbs2pfe8f5lgb39vn87n0w84_872 == 1'b1))?n1ipgl7x2e8qdxb3xi7wwzyqc_16 :
	dq9j3zksqbg985yyv73z_270 ) ;



always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	vujio7qr62mopdp82zfqle5joxbgpb_287 <= 1'b0 ;
	dq9j3zksqbg985yyv73z_270 <= 1'b0 ;
	kb5fqonodbuu3b9x8bfvz9ks_602 <= 1'b0 ;
	zbohjdkkrx17py9wxj_639 <= 1'b0 ;
	f16v0hxghpw4or2mwl4_573 <= 9'b000000000 ;
	g1otly9oxjeww2r3trexx4qn00uktid_149 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		vujio7qr62mopdp82zfqle5joxbgpb_287 <= backpressure_in ;
		dq9j3zksqbg985yyv73z_270 <= cqxu54r2k40kmxp4ppbxgxjt1_729 ;
		kb5fqonodbuu3b9x8bfvz9ks_602 <= gfjoy8o5juowxx1n41t0knf76xe_509 ;
		zbohjdkkrx17py9wxj_639 <= l3lorsxc05f0e6kxhtog0nf5z1dzc_547 ;
		f16v0hxghpw4or2mwl4_573 <= ohto9jm647duhjbt8yztshqownxil_347 ;
		g1otly9oxjeww2r3trexx4qn00uktid_149 <= rzaa9tio4o2av6ib156965k46_316 ;
		backpressure_out <= oboq7qje5l4tf3c4kcttr2zls6ks_65 ;
  end
end

always @(posedge clk_in_0)
begin
  if (rst_in_0) 
  begin
	xhhbmfayzdpgz8gc7bjclhcn_580 <= 1'b0 ;
	pxvtwyregqdjd100c5kez0y_173 <= 1'b1 ;
   end
  else
  begin
	if (osvhh9n22bhdsi0omvp67ar6f1z_664) 
	begin 
	  xhhbmfayzdpgz8gc7bjclhcn_580 <= 1'b0 ;
	 end 
	else 
	begin 
		if (e2bv9iyu9gbc8roahhjunczujouku31_135) 
		begin 
			xhhbmfayzdpgz8gc7bjclhcn_580 <= psb3zrpph42me5d6tjr2vamj5eali_233 ;
		end 
	end 
	if (r46fzhr6eq8bfsj73fc_785) 
	begin 
		pxvtwyregqdjd100c5kez0y_173 <= n5vop9u3nhpdab99bd_52 ;
	end 
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	fly9cly4dzpszqncyqx3akh08ng5thv_86 <= 1'b0 ;
	ztsqm8yfo5hr7ygb4fs8n_444 <= 1'b0 ;
   end
  else
  begin
		fly9cly4dzpszqncyqx3akh08ng5thv_86 <= za7fij2nxni6fc1ppjo7hyo8fe8cc_269 ;
		ztsqm8yfo5hr7ygb4fs8n_444 <= sm18lixumxg3tbwti0y_376 ;
  end
end

always @(posedge clk_out_2)
begin
  if (rst_in_0) 
  begin
	v81qv0y1cxyn7j6vrl9vextro6cp1p9_765 <= 1'b0 ;
   end
  else
  begin
		v81qv0y1cxyn7j6vrl9vextro6cp1p9_765 <= wjpzmmbdjzqttqlfujvuentlkf86_432 ;
  end
end

defparam alcy9p1tlhe36yhhrnrmh6_1450.WRITE_DATA_WIDTH = 290; 
defparam alcy9p1tlhe36yhhrnrmh6_1450.FIFO_WRITE_DEPTH = 512; 
defparam alcy9p1tlhe36yhhrnrmh6_1450.PROG_FULL_THRESH = 135; 
defparam alcy9p1tlhe36yhhrnrmh6_1450.PROG_EMPTY_THRESH = 135; 
defparam alcy9p1tlhe36yhhrnrmh6_1450.READ_MODE = "STD"; 
defparam alcy9p1tlhe36yhhrnrmh6_1450.WR_DATA_COUNT_WIDTH = 9; 
defparam alcy9p1tlhe36yhhrnrmh6_1450.RD_DATA_COUNT_WIDTH = 9; 
defparam alcy9p1tlhe36yhhrnrmh6_1450.DOUT_RESET_VALUE = "0"; 
defparam alcy9p1tlhe36yhhrnrmh6_1450.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_sync alcy9p1tlhe36yhhrnrmh6_1450 (
	.wr_en(lwg025qikvci84hy4q4a3pv7604_811),
	.din(h7j3qhzco61zw3byh9n8t0f_92),
	.rd_en(y267cw7tstrz1nu0wywyig4kjvztfo_589),
	.sleep(cl8b1lipsqrhl1ovmukyoa7laovar_369),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(c1aguztukingskxwgsy_818), 
	.dout(lxzgsk1794a9wtlp5on14kxv_270), 
	.empty(ypi8uvof73z6v0bfvz_823), 
	.prog_full(rzaa9tio4o2av6ib156965k46_316), 
	.full(qjv0u8rms9qb82lfyj_446), 
	.rd_data_count(iwecws74rvlu7g0nz2_833), 
	.wr_data_count(ko48vyu3gc5iuo97plcnowej4612_629), 
	.wr_rst_busy(yfe3aoubggwbg569vhv49uevifzo09gc_419), 
	.rd_rst_busy(uuohp3izvha88ptc9day1kl5h1yq_586), 
	.overflow(z2xkacj3rh2us9ye2060l_708), 
	.underflow(ano8u6o8pc85ux7htf1kqfib_52), 
	.sbiterr(g74wfp1t6vino0qv4zqj4du6_760), 
	.dbiterr(d7bf606xrucm46nmdz4xq3j53yk_259), 
	.almost_empty(rgs3blbezz2fq29ctbpavlh716q0n3_285), 
	.almost_full(z9wwh0uuia4y383qu_721), 
	.wr_ack(ks20ezmie5hp88w3mmkklgo3irz1eeiw_550), 
	.data_valid(cfnxq5vrrcbkg2oya6_146), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam yjj8b6a1js995h161f0aihrsbpf1j4e_7.WRITE_DATA_WIDTH = 1; 
defparam yjj8b6a1js995h161f0aihrsbpf1j4e_7.FIFO_WRITE_DEPTH = 512; 
defparam yjj8b6a1js995h161f0aihrsbpf1j4e_7.PROG_FULL_THRESH = 135; 
defparam yjj8b6a1js995h161f0aihrsbpf1j4e_7.PROG_EMPTY_THRESH = 135; 
defparam yjj8b6a1js995h161f0aihrsbpf1j4e_7.READ_MODE = "FWFT"; 
defparam yjj8b6a1js995h161f0aihrsbpf1j4e_7.WR_DATA_COUNT_WIDTH = 9; 
defparam yjj8b6a1js995h161f0aihrsbpf1j4e_7.RD_DATA_COUNT_WIDTH = 9; 
defparam yjj8b6a1js995h161f0aihrsbpf1j4e_7.DOUT_RESET_VALUE = "0"; 
defparam yjj8b6a1js995h161f0aihrsbpf1j4e_7.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_sync yjj8b6a1js995h161f0aihrsbpf1j4e_7 (
	.wr_en(idnsl5b03rh9lt1xoaq1fp2cq30i_766),
	.din(s3f9nene1c14g2f69p4tmzk_265),
	.rd_en(syo9qumbm7nc678h9t9xi_654),
	.sleep(kqnl4dex7k21ktgn_191),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(jf8ydfcg9w10nxj8n_47), 
	.dout(ixvvlix1nds1qnr9_465), 
	.empty(ngrdmt45za01wb3v5y1vd_654), 
	.prog_full(dje7zzu9mz57j8xfkv46up2t71d_145), 
	.full(harzgquwlkm9xzebcu82tr8sk51h9_801), 
	.rd_data_count(o66if6maapvmqx9bja_839), 
	.wr_data_count(flloykatipz1gd2t45dwlj6xvxhmue_810), 
	.wr_rst_busy(b2gsqpzbdmx9srxuhc8y7_551), 
	.rd_rst_busy(d716mexcw0f5td8y_43), 
	.overflow(r5kvd07pmpop1g1tp82dou5q588_810), 
	.underflow(p0r9w9blkenk3pd9xnoe7sfue_13), 
	.sbiterr(sei7vwujzadafflh0vjpgq00dgmqwk_791), 
	.dbiterr(m1wwe8s3hcxglx6jh8jiypa_559), 
	.almost_empty(ugfaqxc3e0iwmwitmfoe5_275), 
	.almost_full(yvhba89e3gykpncs78ie6x3b_503), 
	.wr_ack(fcf7at1nk661cxg3b3cwz8eieutlptq_691), 
	.data_valid(ep9ub61g8rc0hs5bpnbhlacxrc8b5h4r_386), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam jqkz1wdii608lowllgnxgg9hufbyyw_984.WRITE_DATA_WIDTH = 256; 
defparam jqkz1wdii608lowllgnxgg9hufbyyw_984.FIFO_WRITE_DEPTH = 256; 
defparam jqkz1wdii608lowllgnxgg9hufbyyw_984.PROG_FULL_THRESH = 66; 
defparam jqkz1wdii608lowllgnxgg9hufbyyw_984.PROG_EMPTY_THRESH = 66; 
defparam jqkz1wdii608lowllgnxgg9hufbyyw_984.READ_MODE = "STD"; 
defparam jqkz1wdii608lowllgnxgg9hufbyyw_984.WR_DATA_COUNT_WIDTH = 8; 
defparam jqkz1wdii608lowllgnxgg9hufbyyw_984.RD_DATA_COUNT_WIDTH = 8; 
defparam jqkz1wdii608lowllgnxgg9hufbyyw_984.DOUT_RESET_VALUE = "0"; 
defparam jqkz1wdii608lowllgnxgg9hufbyyw_984.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async jqkz1wdii608lowllgnxgg9hufbyyw_984 (
	.wr_en(qkf8z6sfxzxksduw_850),
	.din(yaanly78x4ovr4kor9_120),
	.rd_en(hzkxqga8ixjor5j53k_706),
	.sleep(ak8tewpcpybrxcp4ywfczjl5nbw2m_789),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(bomwdz36xfkrya22krar_825), 
	.dout(cyw7fyd0504bxnsr1zamvx_802), 
	.empty(vx9hfl7bqyotp48un2hv4wd3_225), 
	.prog_full(sm18lixumxg3tbwti0y_376), 
	.full(cunfpi70dcwr9p73j84bk5w_361), 
	.rd_data_count(ah68sviqey3oi80rb598pwrcbjnd_739), 
	.wr_data_count(ex7w0csp32s13d8frmdq_727), 
	.wr_rst_busy(omfroba1fq2lks1swdoiztududuv1i_660), 
	.rd_rst_busy(emrhf8f0zrrw8enyz8e_746), 
	.overflow(urtx1ftze3q3ss9segir50rofpbegux_419), 
	.underflow(uwalatvgpkhoqlcef2g5tqy7blr93_642), 
	.sbiterr(yfl1y1k78yhp63c12s7bku43d_777), 
	.dbiterr(wirngs16136aq51zk4zs3czloekusy_777), 
	.almost_empty(qq1zofkikkc3ob7xpmdu29qcyzeybn9y_372), 
	.almost_full(o5uje6na8gspgqnpxdh1khx5muxi_51), 
	.wr_ack(hxiwbqijmuxq8zzaj283cqam15o6_314), 
	.data_valid(sw7gcdio5wd4zx5syzyko9adzs_280), 

	.wr_clk(clk_in_1), 

	.rd_clk(clk_out_1), 
	.rst(rst_in_1) 
); 

defparam j7gdiqsewo8fxj3oky04z_726.WRITE_DATA_WIDTH = 160; 
defparam j7gdiqsewo8fxj3oky04z_726.FIFO_WRITE_DEPTH = 256; 
defparam j7gdiqsewo8fxj3oky04z_726.PROG_FULL_THRESH = 66; 
defparam j7gdiqsewo8fxj3oky04z_726.PROG_EMPTY_THRESH = 66; 
defparam j7gdiqsewo8fxj3oky04z_726.READ_MODE = "STD"; 
defparam j7gdiqsewo8fxj3oky04z_726.WR_DATA_COUNT_WIDTH = 8; 
defparam j7gdiqsewo8fxj3oky04z_726.RD_DATA_COUNT_WIDTH = 8; 
defparam j7gdiqsewo8fxj3oky04z_726.DOUT_RESET_VALUE = "0"; 
defparam j7gdiqsewo8fxj3oky04z_726.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async j7gdiqsewo8fxj3oky04z_726 (
	.wr_en(jtokd15itqfnby1pc_744),
	.din(n95z4f6fos3iocd7uwys2165x0mu2_436),
	.rd_en(b620o9z1b6l7k5tup7dkjsc3z_393),
	.sleep(p8aw2kqrz7wjx3kh4_868),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(vfhv60zivdzkd4g2n6ax7uhkgnv18t_208), 
	.dout(mzlme66axieqikeuhen9g6cdd3aah8_206), 
	.empty(ffad56jva4auuhh7a1nantyiqbkjn_847), 
	.prog_full(wjpzmmbdjzqttqlfujvuentlkf86_432), 
	.full(uxkvzn6ftrszwmxeq2_408), 
	.rd_data_count(oy2y8t47a8d311a9ws4jjx_231), 
	.wr_data_count(avla4yjdkyqpiq4v_326), 
	.wr_rst_busy(g62tny9ygfth5rwwclwyrxig0quq1_722), 
	.rd_rst_busy(qr49809d8dlyvtrolfsia6orjz0_663), 
	.overflow(vctpieeayq6s6xbiyqw_184), 
	.underflow(lna5ll6fnzny0cjv1v2p1fjq4k_12), 
	.sbiterr(q2191ygy2j0lhigyvkxyp6l032u1642_747), 
	.dbiterr(k8ayshf8yoid984g_586), 
	.almost_empty(ro09y5faqi336o5e3506zghc_557), 
	.almost_full(fm8v85wpo9ufdbburx4dpf16xewwz2_476), 
	.wr_ack(zhpkbr96vgmqsjpt9z_372), 
	.data_valid(ehmdevlnuhimb8oondx5_684), 

	.wr_clk(clk_in_2), 

	.rd_clk(clk_out_2), 
	.rst(rst_in_2) 
); 

endmodule 
