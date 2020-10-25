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
// File created: 2020/10/03 20:31:33
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
 input	 [23:0] tuple_in_TUPLE1_DATA ;
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
 output	 [23:0] tuple_out_TUPLE1_DATA ;
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






 reg	akt3a3vo00vuq19i107dr124vnqo3_72;	 initial akt3a3vo00vuq19i107dr124vnqo3_72 = 1'b0 ;
 wire	guwgkid4sq3a0t6yk_330 ;
 wire [265:0] lwgefvlom0ps9nni_631 ;
 wire	k9s6z925b5ldx50zgtll9irq_705 ;
 wire	rx8bgcw7i83dr51l_227 ;
 wire	ks73yblwhmy9okihlnbigokqses0k_893 ;
 wire [8:0] ko0uantq1t5nphqkv0jzxp90hbbt_569 ;
 wire [8:0] oht065qqmn7unefkut_766 ;
 wire	vw7dbp16eoqsqjkkb8hz3ueernuvzy_411 ;
 wire	gv6rz44jytcahn1s5twy5t7q_702 ;
 wire	jpymieorq4y3bo7dgl_745 ;
 wire	lq4w0ovqxc2lhy96s6xpvugbx6wxxpg_809 ;
 wire	s899ea80aed3h7wvh9ko8vkltnn_577 ;
 wire	wzi4iazh2xc6i0znr_329 ;
 wire	y15z9gmaocxtjahr0vo9qpo7t_332 ;
 wire	vypwppgqei7jkm6mtr0cleia_515 ;
 wire	qmai2o2rqtbnikcoz6v42_661 ;
 wire	bbdcmg8hwyfisczlag_299 ;
 wire	iepo7m8yraxb424i_760 ;
 reg	h2twgktop7gu9x0mc_843;	 initial h2twgktop7gu9x0mc_843 = 1'b0 ;
 wire	vwl63derrrxwogrjrlb3ltj7_170 ;
 reg	nqcjakzu3mthy7dh4201jogo7kl7_335;	 initial nqcjakzu3mthy7dh4201jogo7kl7_335 = 1'b0 ;
 reg	tbmnd061ne29spf68_394;	 initial tbmnd061ne29spf68_394 = 1'b0 ;
 wire	qaxed6vgd6yxx7yap29rp0p_141 ;
 wire [0:0] gmnqyq27blsxxzb603qmome39y1_243 ;
 wire	kywvizqek8dp80rdpu9j1ad_42 ;
 wire	or48ex97cxk5uqhy_884 ;
 wire	eiqhlrl4fp3xyvfn_704 ;
 wire [8:0] nb9ayytbvlbvc5lkit96io5s_595 ;
 wire [8:0] avmnz80oboxlfxd46tqnxlrn3chpz0s_663 ;
 wire	ahzromwhpl57jhrmrikbyxhvpqe2lbge_54 ;
 wire	va9odiiaxaofzm9obm2k3ioqgaw_696 ;
 wire	yw4v1tllysg4kcq8zpn8zgqea5wxcrp5_713 ;
 wire	y36hi1rrdbxsfhppfrvtu_758 ;
 wire	g250ngj7owvsu17yyha_58 ;
 wire	p22rxsw7pp3nq0l6cp3ld5fdz92f0sxe_394 ;
 wire	qsatw8ledm93kgpkf9z4dqf5ys5b2w_788 ;
 wire	kx9pkgoah9kuytkkjwz0gz1ob_409 ;
 wire	k5o4v0rm8ehudo5h_570 ;
 wire	iisahqmu5myg8yh0dm1kagg1j9u_116 ;
 reg [8:0] tu6u6jwh425l19jonidzqn_44;	 initial tu6u6jwh425l19jonidzqn_44 = 9'b000000000 ;
 reg	at2r8g0tpyrjr4b4805wz9362miu_308;	 initial at2r8g0tpyrjr4b4805wz9362miu_308 = 1'b0 ;
 wire	m3q57geoo6ebdvxucnwkeat7y8d8zvpj_612 ;
 wire [159:0] ylkivrtqac18m09go8ka_607 ;
 wire	dtw7n91d9eomelgrn_15 ;
 wire	b6k9fqf97hworl9mblcgcgpf_547 ;
 wire	e00rrrsi2rcmttcdy8_840 ;
 wire [7:0] vkeqj1ec2vdayh585m_373 ;
 wire [7:0] pvfedo2sk65nx4x6c87p9yv_713 ;
 wire	ijpvw2teyf23oj8oovxfbz6no2ihd_434 ;
 wire	mjq3lspt5avemtby4nszb5tb_46 ;
 wire	u6m1tza2b60ik53w_178 ;
 wire	ed0t17b5x7rf0pd8l1lf_853 ;
 wire	w9j1omh5yxdljh4kry8pu4f_1 ;
 wire	r9506ux0tbt9hbal99ab_807 ;
 wire	xmd8jrlgjnvy5f4m6a9_896 ;
 wire	b4erb1kkx28aj2wdugw1086jahfk6u_766 ;
 wire	r03qvawgdpcio5sko94wvn1c9p0ef_654 ;
 wire	g6jhmhegspap09yum4wtn0fe8jy0hu_854 ;
 wire	syotc8mfv12y4aipbndf3mttfwi2_417 ;
 wire [23:0] mizswmmbf655j2v9qg_320 ;
 wire	teq3s4l21kj2rfff9x8_136 ;
 wire	qqz3pug8shlkiif0_709 ;
 wire	y3y5faltmdn8q4jffp5vix_584 ;
 wire [7:0] q13v0f3xdg6jtk75ffn_4 ;
 wire [7:0] qeahcoq08ojfyj21i5vurvr8eb_686 ;
 wire	g03x7n6etvjjxg4orovoej0p3ex6xm0k_547 ;
 wire	j8jtzhw8bsoj5d5sxm98zptyu9r_558 ;
 wire	voy0j8bcfftq64uo182_383 ;
 wire	g2j0j5fqh8fhnap5c2lctdi_658 ;
 wire	ufbt9iey4b4c12f6pznondap42_824 ;
 wire	dqnq86pfpm5wfe4zzgo7dw4jlh_33 ;
 wire	vks7e97v68xjpa3xwwbpmt3ima6jvn8_114 ;
 wire	yr9uk7rq6vkfrg8tqqu_219 ;
 wire	wi8leodnkfi64ahvrj5y3aju1rvmwiw_517 ;
 wire	huky014zuotl8mczp5ueza_306 ;
 reg	qpkljy9eytmy8pj5_767;	 initial qpkljy9eytmy8pj5_767 = 1'b0 ;
 reg	vxi79xx9zbqzsjwuxddo9cvs6potczsu_168;	 initial vxi79xx9zbqzsjwuxddo9cvs6potczsu_168 = 1'b0 ;
 reg	m63jdw78n7sc9rsyg54t5niqh_734;	 initial m63jdw78n7sc9rsyg54t5niqh_734 = 1'b0 ;
 wire	j60h0owca9xudwkyymwxa7qhpb6ij_729 ;
 wire [265:0] cpq5bc4p4zm2rj2qtg49mgn_723 ;
 wire	d0hcmuf9il7v38o94_831 ;
 wire [265:0] vrt17xuyzwz55lprm1a0q0rbtc_79 ;
 wire	kz51lrhdinxh1129364oyub4s0_218 ;
 wire	rotw32u0bdug8n4a5gjt1gur2akw_668 ;
 wire	mlu3zwr4b4df2p52obefekz8_217 ;
 wire	i1dx8sy3wbqzuvr1bkp3lfnl_744 ;
 wire	diowqif5pynmg7fstya_242 ;
 wire	wyx5a3fi10rkhb7ac0pamye31p5jxldx_731 ;
 wire	an16r9z5j90oqlkqw9aa68h2ejhfqr4n_116 ;
 wire	bvv2srv30b4bnraaw_701 ;
 wire	gyhkxxxjlyv4zj91kxlu3vzgf9buxck1_414 ;
 wire	a8sidro0r20m6avg8e6377vlfzx26p_155 ;
 wire [5:0] ca5f2jnrmyckurgqjlaiks374d_584 ;
 wire [255:0] g7ktdf7en07i79tz2_577 ;
 wire	ru1dwgn1i3gk1buxyzolft4wzjbk_241 ;
 wire	xn3oszz3pgdlk0oe8tvytt5r_138 ;
 wire	ue36mhswfunbkwhqkx5r_717 ;
 wire	l4z7tiqhgkdytf4faxfn9v_784 ;
 wire	g0o64b5tdhmrgpymcy4y89trsbd9j_168 ;
 wire [0:0] wlepig59m9h0kh2ohfjm9_524 ;
 wire	aztjuu0snyfe7wr5y_855 ;
 wire	lr0bspf9n7akiskmuq29w826s_85 ;
 wire [8:0] h466nzlgjb2sevba7o94b04_707 ;
 wire	olufddezjhoeo17b_455 ;
 wire	i2qrjzw9ae3nqzqfji5tn5huy44ir6v0_449 ;
 wire	xflj75mlj7l4f69265a_566 ;
 wire	gi0qktguy62usmrk0b2t4h05qfmahin_697 ;
 wire	igfs05pjx8gv91qi_815 ;
 wire	hbvzr7opov2ykr8jdruevszju8el3g_95 ;
 wire	ezpdc820fokis066ytfg9_145 ;
 wire [159:0] qu8jejzuyb55ycs2boyp3_354 ;
 wire	n1b6v8g6kt9y9rm7zev4q2_282 ;
 wire [159:0] qe491tfqjblh5z01b_76 ;
 wire	c8v1hcs5agyuzqhrvo124ooaxael19n8_484 ;
 wire	tkdw8kygwt7e5bvk0nwzxcfruq_103 ;
 wire	oc27co70m5endy71_244 ;
 wire [23:0] aizmu7ut9sr013vu_15 ;
 wire	mfuuyxqem4eblufkjv_66 ;
 wire [23:0] setjc3rp53vndlso0_186 ;
 wire	ydu4yn1ynobzb40v1zq_84 ;
 wire	vomw29pks01qq2k8ujdfzidhx8xi33l_483 ;
 wire	j6q3x1quskyimyjx4vzwtu1f71i_686 ;
 wire	j6b5t0w1hlsjtfdsk_745 ;
 wire	owdfrobr9d5vq1lxk2ori0wk3kb3_121 ;


 assign j60h0owca9xudwkyymwxa7qhpb6ij_729 = 
	 ~(backpressure_in) ;
 assign cpq5bc4p4zm2rj2qtg49mgn_723 = 
	{packet_in_PACKET2_SOF, packet_in_PACKET2_EOF, packet_in_PACKET2_VAL, packet_in_PACKET2_DAT, packet_in_PACKET2_CNT, packet_in_PACKET2_ERR} ;
 assign d0hcmuf9il7v38o94_831 	= packet_in_PACKET2_VAL ;
 assign vrt17xuyzwz55lprm1a0q0rbtc_79 	= cpq5bc4p4zm2rj2qtg49mgn_723[265:0] ;
 assign kz51lrhdinxh1129364oyub4s0_218 = 
	gi0qktguy62usmrk0b2t4h05qfmahin_697 | j6b5t0w1hlsjtfdsk_745 ;
 assign rotw32u0bdug8n4a5gjt1gur2akw_668 = 
	1'b0 ;
 assign mlu3zwr4b4df2p52obefekz8_217 = 
	1'b1 ;
 assign i1dx8sy3wbqzuvr1bkp3lfnl_744 = 
	 ~(vwl63derrrxwogrjrlb3ltj7_170) ;
 assign diowqif5pynmg7fstya_242 = 
	j60h0owca9xudwkyymwxa7qhpb6ij_729 & hbvzr7opov2ykr8jdruevszju8el3g_95 & kz51lrhdinxh1129364oyub4s0_218 ;
 assign wyx5a3fi10rkhb7ac0pamye31p5jxldx_731 	= diowqif5pynmg7fstya_242 ;
 assign an16r9z5j90oqlkqw9aa68h2ejhfqr4n_116 	= wyx5a3fi10rkhb7ac0pamye31p5jxldx_731 ;
 assign bvv2srv30b4bnraaw_701 = 
	1'b0 ;
 assign gyhkxxxjlyv4zj91kxlu3vzgf9buxck1_414 = 
	 ~(k9s6z925b5ldx50zgtll9irq_705) ;
 assign a8sidro0r20m6avg8e6377vlfzx26p_155 	= lwgefvlom0ps9nni_631[0] ;
 assign ca5f2jnrmyckurgqjlaiks374d_584 	= lwgefvlom0ps9nni_631[6:1] ;
 assign g7ktdf7en07i79tz2_577 	= lwgefvlom0ps9nni_631[262:7] ;
 assign ru1dwgn1i3gk1buxyzolft4wzjbk_241 	= lwgefvlom0ps9nni_631[263] ;
 assign xn3oszz3pgdlk0oe8tvytt5r_138 	= lwgefvlom0ps9nni_631[264] ;
 assign ue36mhswfunbkwhqkx5r_717 	= lwgefvlom0ps9nni_631[265] ;
 assign l4z7tiqhgkdytf4faxfn9v_784 = 
	tbmnd061ne29spf68_394 & ru1dwgn1i3gk1buxyzolft4wzjbk_241 ;
 assign g0o64b5tdhmrgpymcy4y89trsbd9j_168 	= packet_in_PACKET2_VAL ;
 assign wlepig59m9h0kh2ohfjm9_524 = packet_in_PACKET2_SOF ;
 assign aztjuu0snyfe7wr5y_855 	= wyx5a3fi10rkhb7ac0pamye31p5jxldx_731 ;
 assign lr0bspf9n7akiskmuq29w826s_85 = 
	1'b0 ;
 assign h466nzlgjb2sevba7o94b04_707 	= nb9ayytbvlbvc5lkit96io5s_595[8:0] ;
 assign olufddezjhoeo17b_455 = (
	((h466nzlgjb2sevba7o94b04_707 != tu6u6jwh425l19jonidzqn_44))?1'b1:
	0)  ;
 assign i2qrjzw9ae3nqzqfji5tn5huy44ir6v0_449 = gmnqyq27blsxxzb603qmome39y1_243 ;
 assign xflj75mlj7l4f69265a_566 = gmnqyq27blsxxzb603qmome39y1_243 ;
 assign gi0qktguy62usmrk0b2t4h05qfmahin_697 = 
	 ~(xflj75mlj7l4f69265a_566) ;
 assign igfs05pjx8gv91qi_815 	= kywvizqek8dp80rdpu9j1ad_42 ;
 assign hbvzr7opov2ykr8jdruevszju8el3g_95 = 
	 ~(kywvizqek8dp80rdpu9j1ad_42) ;
 assign ezpdc820fokis066ytfg9_145 = 
	j60h0owca9xudwkyymwxa7qhpb6ij_729 & j6b5t0w1hlsjtfdsk_745 & hbvzr7opov2ykr8jdruevszju8el3g_95 & i2qrjzw9ae3nqzqfji5tn5huy44ir6v0_449 ;
 assign qu8jejzuyb55ycs2boyp3_354 = 
	tuple_in_TUPLE0_DATA ;
 assign n1b6v8g6kt9y9rm7zev4q2_282 	= tuple_in_TUPLE0_VALID ;
 assign qe491tfqjblh5z01b_76 	= qu8jejzuyb55ycs2boyp3_354[159:0] ;
 assign c8v1hcs5agyuzqhrvo124ooaxael19n8_484 = 
	 ~(dtw7n91d9eomelgrn_15) ;
 assign tkdw8kygwt7e5bvk0nwzxcfruq_103 	= ezpdc820fokis066ytfg9_145 ;
 assign oc27co70m5endy71_244 = 
	1'b0 ;
 assign aizmu7ut9sr013vu_15 = 
	tuple_in_TUPLE1_DATA ;
 assign mfuuyxqem4eblufkjv_66 	= tuple_in_TUPLE1_VALID ;
 assign setjc3rp53vndlso0_186 	= aizmu7ut9sr013vu_15[23:0] ;
 assign ydu4yn1ynobzb40v1zq_84 = 
	 ~(teq3s4l21kj2rfff9x8_136) ;
 assign vomw29pks01qq2k8ujdfzidhx8xi33l_483 	= ezpdc820fokis066ytfg9_145 ;
 assign j6q3x1quskyimyjx4vzwtu1f71i_686 = 
	1'b0 ;
 assign j6b5t0w1hlsjtfdsk_745 = 
	gyhkxxxjlyv4zj91kxlu3vzgf9buxck1_414 & c8v1hcs5agyuzqhrvo124ooaxael19n8_484 & ydu4yn1ynobzb40v1zq_84 ;
 assign owdfrobr9d5vq1lxk2ori0wk3kb3_121 = 
	qpkljy9eytmy8pj5_767 | vxi79xx9zbqzsjwuxddo9cvs6potczsu_168 | m63jdw78n7sc9rsyg54t5niqh_734 ;
 assign packet_out_PACKET2_SOF 	= ue36mhswfunbkwhqkx5r_717 ;
 assign packet_out_PACKET2_EOF 	= xn3oszz3pgdlk0oe8tvytt5r_138 ;
 assign packet_out_PACKET2_VAL 	= l4z7tiqhgkdytf4faxfn9v_784 ;
 assign packet_out_PACKET2_DAT 	= g7ktdf7en07i79tz2_577[255:0] ;
 assign packet_out_PACKET2_CNT 	= ca5f2jnrmyckurgqjlaiks374d_584[5:0] ;
 assign packet_out_PACKET2_ERR 	= a8sidro0r20m6avg8e6377vlfzx26p_155 ;
 assign packet_in_PACKET2_RDY 	= packet_out_PACKET2_RDY ;
 assign tuple_out_TUPLE0_VALID 	= at2r8g0tpyrjr4b4805wz9362miu_308 ;
 assign tuple_out_TUPLE0_DATA 	= ylkivrtqac18m09go8ka_607[159:0] ;
 assign tuple_out_TUPLE1_VALID 	= at2r8g0tpyrjr4b4805wz9362miu_308 ;
 assign tuple_out_TUPLE1_DATA 	= mizswmmbf655j2v9qg_320[23:0] ;


assign iepo7m8yraxb424i_760 = (
	((wyx5a3fi10rkhb7ac0pamye31p5jxldx_731 == 1'b1))?mlu3zwr4b4df2p52obefekz8_217 :
	((j60h0owca9xudwkyymwxa7qhpb6ij_729 == 1'b1))?rotw32u0bdug8n4a5gjt1gur2akw_668 :
	h2twgktop7gu9x0mc_843 ) ;

assign vwl63derrrxwogrjrlb3ltj7_170 = (
	((h2twgktop7gu9x0mc_843 == 1'b1) && (j60h0owca9xudwkyymwxa7qhpb6ij_729 == 1'b1))?rotw32u0bdug8n4a5gjt1gur2akw_668 :
	h2twgktop7gu9x0mc_843 ) ;



always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	akt3a3vo00vuq19i107dr124vnqo3_72 <= 1'b0 ;
	h2twgktop7gu9x0mc_843 <= 1'b0 ;
	nqcjakzu3mthy7dh4201jogo7kl7_335 <= 1'b0 ;
	tbmnd061ne29spf68_394 <= 1'b0 ;
	tu6u6jwh425l19jonidzqn_44 <= 9'b000000000 ;
	qpkljy9eytmy8pj5_767 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		akt3a3vo00vuq19i107dr124vnqo3_72 <= backpressure_in ;
		h2twgktop7gu9x0mc_843 <= iepo7m8yraxb424i_760 ;
		nqcjakzu3mthy7dh4201jogo7kl7_335 <= gyhkxxxjlyv4zj91kxlu3vzgf9buxck1_414 ;
		tbmnd061ne29spf68_394 <= wyx5a3fi10rkhb7ac0pamye31p5jxldx_731 ;
		tu6u6jwh425l19jonidzqn_44 <= h466nzlgjb2sevba7o94b04_707 ;
		qpkljy9eytmy8pj5_767 <= rx8bgcw7i83dr51l_227 ;
		backpressure_out <= owdfrobr9d5vq1lxk2ori0wk3kb3_121 ;
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	at2r8g0tpyrjr4b4805wz9362miu_308 <= 1'b0 ;
	vxi79xx9zbqzsjwuxddo9cvs6potczsu_168 <= 1'b0 ;
   end
  else
  begin
		at2r8g0tpyrjr4b4805wz9362miu_308 <= ezpdc820fokis066ytfg9_145 ;
		vxi79xx9zbqzsjwuxddo9cvs6potczsu_168 <= b6k9fqf97hworl9mblcgcgpf_547 ;
  end
end

always @(posedge clk_out_2)
begin
  if (rst_in_0) 
  begin
	m63jdw78n7sc9rsyg54t5niqh_734 <= 1'b0 ;
   end
  else
  begin
		m63jdw78n7sc9rsyg54t5niqh_734 <= qqz3pug8shlkiif0_709 ;
  end
end

defparam u9ftmt1k8sird4bn5c6pmbg4cq2hnfm_1319.WRITE_DATA_WIDTH = 266; 
defparam u9ftmt1k8sird4bn5c6pmbg4cq2hnfm_1319.FIFO_WRITE_DEPTH = 512; 
defparam u9ftmt1k8sird4bn5c6pmbg4cq2hnfm_1319.PROG_FULL_THRESH = 129; 
defparam u9ftmt1k8sird4bn5c6pmbg4cq2hnfm_1319.PROG_EMPTY_THRESH = 129; 
defparam u9ftmt1k8sird4bn5c6pmbg4cq2hnfm_1319.READ_MODE = "STD"; 
defparam u9ftmt1k8sird4bn5c6pmbg4cq2hnfm_1319.WR_DATA_COUNT_WIDTH = 9; 
defparam u9ftmt1k8sird4bn5c6pmbg4cq2hnfm_1319.RD_DATA_COUNT_WIDTH = 9; 
defparam u9ftmt1k8sird4bn5c6pmbg4cq2hnfm_1319.DOUT_RESET_VALUE = "0"; 
defparam u9ftmt1k8sird4bn5c6pmbg4cq2hnfm_1319.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_sync u9ftmt1k8sird4bn5c6pmbg4cq2hnfm_1319 (
	.wr_en(d0hcmuf9il7v38o94_831),
	.din(vrt17xuyzwz55lprm1a0q0rbtc_79),
	.rd_en(an16r9z5j90oqlkqw9aa68h2ejhfqr4n_116),
	.sleep(bvv2srv30b4bnraaw_701),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(guwgkid4sq3a0t6yk_330), 
	.dout(lwgefvlom0ps9nni_631), 
	.empty(k9s6z925b5ldx50zgtll9irq_705), 
	.prog_full(rx8bgcw7i83dr51l_227), 
	.full(ks73yblwhmy9okihlnbigokqses0k_893), 
	.rd_data_count(ko0uantq1t5nphqkv0jzxp90hbbt_569), 
	.wr_data_count(oht065qqmn7unefkut_766), 
	.wr_rst_busy(vw7dbp16eoqsqjkkb8hz3ueernuvzy_411), 
	.rd_rst_busy(gv6rz44jytcahn1s5twy5t7q_702), 
	.overflow(jpymieorq4y3bo7dgl_745), 
	.underflow(lq4w0ovqxc2lhy96s6xpvugbx6wxxpg_809), 
	.sbiterr(s899ea80aed3h7wvh9ko8vkltnn_577), 
	.dbiterr(wzi4iazh2xc6i0znr_329), 
	.almost_empty(y15z9gmaocxtjahr0vo9qpo7t_332), 
	.almost_full(vypwppgqei7jkm6mtr0cleia_515), 
	.wr_ack(qmai2o2rqtbnikcoz6v42_661), 
	.data_valid(bbdcmg8hwyfisczlag_299), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam pbzh000od941zzfl8z05_2472.WRITE_DATA_WIDTH = 1; 
defparam pbzh000od941zzfl8z05_2472.FIFO_WRITE_DEPTH = 512; 
defparam pbzh000od941zzfl8z05_2472.PROG_FULL_THRESH = 129; 
defparam pbzh000od941zzfl8z05_2472.PROG_EMPTY_THRESH = 129; 
defparam pbzh000od941zzfl8z05_2472.READ_MODE = "FWFT"; 
defparam pbzh000od941zzfl8z05_2472.WR_DATA_COUNT_WIDTH = 9; 
defparam pbzh000od941zzfl8z05_2472.RD_DATA_COUNT_WIDTH = 9; 
defparam pbzh000od941zzfl8z05_2472.DOUT_RESET_VALUE = "0"; 
defparam pbzh000od941zzfl8z05_2472.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_sync pbzh000od941zzfl8z05_2472 (
	.wr_en(g0o64b5tdhmrgpymcy4y89trsbd9j_168),
	.din(wlepig59m9h0kh2ohfjm9_524),
	.rd_en(aztjuu0snyfe7wr5y_855),
	.sleep(lr0bspf9n7akiskmuq29w826s_85),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(qaxed6vgd6yxx7yap29rp0p_141), 
	.dout(gmnqyq27blsxxzb603qmome39y1_243), 
	.empty(kywvizqek8dp80rdpu9j1ad_42), 
	.prog_full(or48ex97cxk5uqhy_884), 
	.full(eiqhlrl4fp3xyvfn_704), 
	.rd_data_count(nb9ayytbvlbvc5lkit96io5s_595), 
	.wr_data_count(avmnz80oboxlfxd46tqnxlrn3chpz0s_663), 
	.wr_rst_busy(ahzromwhpl57jhrmrikbyxhvpqe2lbge_54), 
	.rd_rst_busy(va9odiiaxaofzm9obm2k3ioqgaw_696), 
	.overflow(yw4v1tllysg4kcq8zpn8zgqea5wxcrp5_713), 
	.underflow(y36hi1rrdbxsfhppfrvtu_758), 
	.sbiterr(g250ngj7owvsu17yyha_58), 
	.dbiterr(p22rxsw7pp3nq0l6cp3ld5fdz92f0sxe_394), 
	.almost_empty(qsatw8ledm93kgpkf9z4dqf5ys5b2w_788), 
	.almost_full(kx9pkgoah9kuytkkjwz0gz1ob_409), 
	.wr_ack(k5o4v0rm8ehudo5h_570), 
	.data_valid(iisahqmu5myg8yh0dm1kagg1j9u_116), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam bi8n5nall2y32fmmrchgun69_1373.WRITE_DATA_WIDTH = 160; 
defparam bi8n5nall2y32fmmrchgun69_1373.FIFO_WRITE_DEPTH = 256; 
defparam bi8n5nall2y32fmmrchgun69_1373.PROG_FULL_THRESH = 66; 
defparam bi8n5nall2y32fmmrchgun69_1373.PROG_EMPTY_THRESH = 66; 
defparam bi8n5nall2y32fmmrchgun69_1373.READ_MODE = "STD"; 
defparam bi8n5nall2y32fmmrchgun69_1373.WR_DATA_COUNT_WIDTH = 8; 
defparam bi8n5nall2y32fmmrchgun69_1373.RD_DATA_COUNT_WIDTH = 8; 
defparam bi8n5nall2y32fmmrchgun69_1373.DOUT_RESET_VALUE = "0"; 
defparam bi8n5nall2y32fmmrchgun69_1373.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async bi8n5nall2y32fmmrchgun69_1373 (
	.wr_en(n1b6v8g6kt9y9rm7zev4q2_282),
	.din(qe491tfqjblh5z01b_76),
	.rd_en(tkdw8kygwt7e5bvk0nwzxcfruq_103),
	.sleep(oc27co70m5endy71_244),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(m3q57geoo6ebdvxucnwkeat7y8d8zvpj_612), 
	.dout(ylkivrtqac18m09go8ka_607), 
	.empty(dtw7n91d9eomelgrn_15), 
	.prog_full(b6k9fqf97hworl9mblcgcgpf_547), 
	.full(e00rrrsi2rcmttcdy8_840), 
	.rd_data_count(vkeqj1ec2vdayh585m_373), 
	.wr_data_count(pvfedo2sk65nx4x6c87p9yv_713), 
	.wr_rst_busy(ijpvw2teyf23oj8oovxfbz6no2ihd_434), 
	.rd_rst_busy(mjq3lspt5avemtby4nszb5tb_46), 
	.overflow(u6m1tza2b60ik53w_178), 
	.underflow(ed0t17b5x7rf0pd8l1lf_853), 
	.sbiterr(w9j1omh5yxdljh4kry8pu4f_1), 
	.dbiterr(r9506ux0tbt9hbal99ab_807), 
	.almost_empty(xmd8jrlgjnvy5f4m6a9_896), 
	.almost_full(b4erb1kkx28aj2wdugw1086jahfk6u_766), 
	.wr_ack(r03qvawgdpcio5sko94wvn1c9p0ef_654), 
	.data_valid(g6jhmhegspap09yum4wtn0fe8jy0hu_854), 

	.wr_clk(clk_in_1), 

	.rd_clk(clk_out_1), 
	.rst(rst_in_1) 
); 

defparam bqpjpdeolia6g5npmermouypv_2059.WRITE_DATA_WIDTH = 24; 
defparam bqpjpdeolia6g5npmermouypv_2059.FIFO_WRITE_DEPTH = 256; 
defparam bqpjpdeolia6g5npmermouypv_2059.PROG_FULL_THRESH = 65; 
defparam bqpjpdeolia6g5npmermouypv_2059.PROG_EMPTY_THRESH = 65; 
defparam bqpjpdeolia6g5npmermouypv_2059.READ_MODE = "STD"; 
defparam bqpjpdeolia6g5npmermouypv_2059.WR_DATA_COUNT_WIDTH = 8; 
defparam bqpjpdeolia6g5npmermouypv_2059.RD_DATA_COUNT_WIDTH = 8; 
defparam bqpjpdeolia6g5npmermouypv_2059.DOUT_RESET_VALUE = "0"; 
defparam bqpjpdeolia6g5npmermouypv_2059.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_async bqpjpdeolia6g5npmermouypv_2059 (
	.wr_en(mfuuyxqem4eblufkjv_66),
	.din(setjc3rp53vndlso0_186),
	.rd_en(vomw29pks01qq2k8ujdfzidhx8xi33l_483),
	.sleep(j6q3x1quskyimyjx4vzwtu1f71i_686),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(syotc8mfv12y4aipbndf3mttfwi2_417), 
	.dout(mizswmmbf655j2v9qg_320), 
	.empty(teq3s4l21kj2rfff9x8_136), 
	.prog_full(qqz3pug8shlkiif0_709), 
	.full(y3y5faltmdn8q4jffp5vix_584), 
	.rd_data_count(q13v0f3xdg6jtk75ffn_4), 
	.wr_data_count(qeahcoq08ojfyj21i5vurvr8eb_686), 
	.wr_rst_busy(g03x7n6etvjjxg4orovoej0p3ex6xm0k_547), 
	.rd_rst_busy(j8jtzhw8bsoj5d5sxm98zptyu9r_558), 
	.overflow(voy0j8bcfftq64uo182_383), 
	.underflow(g2j0j5fqh8fhnap5c2lctdi_658), 
	.sbiterr(ufbt9iey4b4c12f6pznondap42_824), 
	.dbiterr(dqnq86pfpm5wfe4zzgo7dw4jlh_33), 
	.almost_empty(vks7e97v68xjpa3xwwbpmt3ima6jvn8_114), 
	.almost_full(yr9uk7rq6vkfrg8tqqu_219), 
	.wr_ack(wi8leodnkfi64ahvrj5y3aju1rvmwiw_517), 
	.data_valid(huky014zuotl8mczp5ueza_306), 

	.wr_clk(clk_in_2), 

	.rd_clk(clk_out_2), 
	.rst(rst_in_2) 
); 

endmodule 
