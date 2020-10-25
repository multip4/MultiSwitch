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
// File created: 2020/10/08 13:42:06
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






 reg	vujjh11j0ctth43652xcsqw_110;	 initial vujjh11j0ctth43652xcsqw_110 = 1'b0 ;
 wire	lesaklf2j6h846pn719y3v19wbww_787 ;
 wire [289:0] szvhewqarkczrocnagpssil2j_431 ;
 wire	svcv0x94ktex3tqn44xykljhg_425 ;
 wire	kr8o01ku1hk85brnc_74 ;
 wire	injszbha5i31fxnmq06pk7ibix3hnb_316 ;
 wire [8:0] oio7aesn1ebrw8pbt4z3znnn4_270 ;
 wire [8:0] xzm3sli9ftu2mp5u1gi8lb2pfl7v3_382 ;
 wire	qzydyi3ba25r6j3k46cfopm_730 ;
 wire	y9867ur2icy2ejcfsd_250 ;
 wire	nit9p6pv66gcbj9sn2_422 ;
 wire	jy6cp1dv02numujyzpjgp7r5i0zn_447 ;
 wire	pis08w8vmzae8dnub_724 ;
 wire	vtjxx37yqvxcurvoqsxzqvj71gw7mx_837 ;
 wire	dmnseddzscp6kkjbhpcm5bxkij3unqg7_838 ;
 wire	ed1hw45t059cf4nfjak90fn9yxdcxg_678 ;
 wire	r2gk6bduvmugnjc0bkxwqhl0glqt4u_154 ;
 wire	x0wm9wxfrqh1y675dapzn7km8_666 ;
 wire	n8h12t0l4q1i5l3nsmnhgb204g2wmlj_131 ;
 reg	vfjid6uc95vkmi6cok75fhf0qa2_879;	 initial vfjid6uc95vkmi6cok75fhf0qa2_879 = 1'b0 ;
 wire	wkhxaaxjb6mt5jg7b5xvubna_211 ;
 reg	i6p9mu9zebtonsd6s2xfq5b1cieg_665;	 initial i6p9mu9zebtonsd6s2xfq5b1cieg_665 = 1'b0 ;
 reg	lhpfajzpxco4to0gkz9zg1zq_696;	 initial lhpfajzpxco4to0gkz9zg1zq_696 = 1'b0 ;
 wire	mglqafhp2slojwpk3m38feroid1r_491 ;
 wire [0:0] zu2esjnv57529skiq_645 ;
 wire	kwrsdwuay8jm1sutdkqudo8_484 ;
 wire	kd68pmbiralvxi4c_439 ;
 wire	oct3h4nhx6jiiw157q5mh_265 ;
 wire [8:0] xqw5nashwna5de1rqt_700 ;
 wire [8:0] kyyb3en8b79q213b3hdp2wvjh1wi1ub_208 ;
 wire	lx8cy1y06lolpzdt0fh7ff_252 ;
 wire	xx8zm09v3qfh6xdwcne6cb3z50h_238 ;
 wire	yhy085ik63dqp8q27fn1p7zx_899 ;
 wire	xo809kj3tn9o9w06alc3x3e_281 ;
 wire	m67yedpjee6ncbb5oqe7_47 ;
 wire	on3mmdoowj24or3y1h1nyc0ou0cn_590 ;
 wire	jbujc5omup8gtrt92cgvarpwelf28tb_21 ;
 wire	q8w7vt6qn9njc1ayeha3poyt_599 ;
 wire	rwf05eu7587bhcxs96749xr1ikud93_137 ;
 wire	mgva8l6m0gja89eb5hu_381 ;
 reg	hewpdnaypy942b3fvhtr98ho5589saq_92;	 initial hewpdnaypy942b3fvhtr98ho5589saq_92 = 1'b0 ;
 reg	awl1tpfawws2yu8y08ehh1yhzaa_288;	 initial awl1tpfawws2yu8y08ehh1yhzaa_288 = 1'b1 ;
 reg [8:0] exjwxs8io8ilfhoi_16;	 initial exjwxs8io8ilfhoi_16 = 9'b000000000 ;
 reg	wjav8flgvx2y4opmh7zrbqjdqwux5_14;	 initial wjav8flgvx2y4opmh7zrbqjdqwux5_14 = 1'b0 ;
 wire	t7srr2lruy8q0xs2bdfhyb3_289 ;
 wire [255:0] fxo6k7mrzecva19iuyr8hji5tjnr9v_192 ;
 wire	gh4yqcyok6zdjw8vygzvudl428c_870 ;
 wire	rtgxrmoknkaqldzsuupyljh_434 ;
 wire	pe5og3yw65cegdav9d5j7_566 ;
 wire [7:0] dl8bduvefixpcy83ql9o_450 ;
 wire [7:0] xeu7e2l0xxd7mjgiz4xsh8vf8ta_247 ;
 wire	v21rg4ni8lxnhtb3ojwkf59ud072oq_632 ;
 wire	e22b9bck6adq9zgvtji7ksj_199 ;
 wire	tzfg03sfe61zpln0h7_12 ;
 wire	wdvc00ehanzmox31llib7sd4_619 ;
 wire	ka440tpvp8ulgl2x4hl_510 ;
 wire	jrptbnh3b1deh19mpevfu915ajona7ds_519 ;
 wire	rgraioj8qng1ir0t86fsb9_400 ;
 wire	ep3v20doco66a8xjhqxtrbpv7frtkdzr_583 ;
 wire	e1nq3myxjc0jx1hxoxw2331mqr3wfmhy_91 ;
 wire	nbf8geunvd45k5y1mt_736 ;
 wire	kuo6wkac3jcvd1bl1xgoqkbfl53_383 ;
 wire [159:0] wnh9sy94gc6gkgjbv7ux1xkctvjt0l81_353 ;
 wire	yyyoo5uo7ohorpzncr_16 ;
 wire	pucue1kgcz5krf35mdn0_671 ;
 wire	p3fpptxl7do9gdysyjado5edfd4_430 ;
 wire [7:0] k64pr9l4dwknjak3spw_198 ;
 wire [7:0] ouuouoc2u0djsb50qb3xt3xdyg_839 ;
 wire	f4boapwtq1j4xcw2su_445 ;
 wire	undcc66pbmnmilhe7jwbs7r1omoowj_850 ;
 wire	ablc8r7s8hsmmlxrd9i5fvv2_515 ;
 wire	vywpsjbqwlxyzj8t4349_369 ;
 wire	r6rwdinlfmb6ofnm00mo0_424 ;
 wire	nm76cugb0m5hm0yjtghlv5w_217 ;
 wire	cj0ppl0zhtz29nasu0_826 ;
 wire	ejwcjnxf3tpxqq35d_145 ;
 wire	ydk8fmdp6hijbrsrnl5j31kqmqzp_628 ;
 wire	lsej2khnnap6mvao99ke4id3el9lf7c_322 ;
 reg	widxx5guw8swy2xt9r8vbdsqg_47;	 initial widxx5guw8swy2xt9r8vbdsqg_47 = 1'b0 ;
 reg	lx4gr8jvwomzla6immbgozpjulb3c1_100;	 initial lx4gr8jvwomzla6immbgozpjulb3c1_100 = 1'b0 ;
 reg	i8pyikfh8sng0k3lv2xfj3152w75qj_723;	 initial i8pyikfh8sng0k3lv2xfj3152w75qj_723 = 1'b0 ;
 wire	uqx1rjbbxpetqjn5714fynjjghj_458 ;
 wire [289:0] ih5fm33q5rz4ql138qh0s_37 ;
 wire	yqliivs2b2uvybpg_535 ;
 wire [289:0] ckm99wixk5r48kfgn6zn94oko3r_409 ;
 wire	h9lbgm2ncosab10nicsri5wd_106 ;
 wire	kdkplxwe6qzg4v2jt38gxb2_226 ;
 wire	zlx0lqrzhx0rhnv7xh5snpusu8_667 ;
 wire	lay8b6x3qp2woxg4cllr13_495 ;
 wire	pbeqw39v313a6wcnvcnmv645fuwgh_254 ;
 wire	birr3w9s0rp04qyy8_679 ;
 wire	wtpe5831e3ysjs4z82j8f2_477 ;
 wire	rpo132k4ms1s3308u8u_244 ;
 wire	bo61fycdzh4e4yp0mwtjx9sjkzniw1l5_262 ;
 wire	ldrtoi7ik26ox20f_685 ;
 wire	o4nf1e2ioti5huhskqo_246 ;
 wire	utev4y0rou5xw0v8azow4s9xw_0 ;
 wire	mhg4qdie78fw4zjjvk_320 ;
 wire	lpbu8m0a2gtf8x2gommn704p71jj_662 ;
 wire [31:0] bjkw6nf4ubpzjs2m53ho0s2roc_462 ;
 wire [255:0] ijyiaa28ekem12nfa25kmhlo_848 ;
 wire	qtyo0m4o7vnzvms7zj6warwcj88a6_753 ;
 wire	fguvi1l8iwr1834nr2ur_671 ;
 wire	d46j0yyvulii02owcq3t08yn_312 ;
 wire	eeow6xhhd3b0o0cory8fty_647 ;
 wire	b3hv57tu6zf23sge27cl2yh_67 ;
 wire	iqfcxg02qe6wd8k44b8oknru46133xj_168 ;
 wire	y2eifhyuhhvppdvcau3wh5zpbhyhwzh_904 ;
 wire	nd2pg2u7m3g5vacblkrr2_441 ;
 wire	zjn8demnoib31v5xn8lhscqgdia0k_212 ;
 wire	ptbe0umbeltswp48axj39056k_137 ;
 wire	jctjonktq8s8gl3bjxad3tdz2cnpqq_54 ;
 wire	kvqrbkfrnezrx55qapuw_189 ;
 wire	ywttleoo7zxg07200hxb_432 ;
 wire	vlfqzrs4jwa9irx2mi_160 ;
 wire	o18ouoath215cj1449nvml8b6sj3ucrd_437 ;
 wire	k8s3xywzw5gly5ob2b6cfhqerdttb_782 ;
 wire [0:0] j0toh1he7s3wbsdo_799 ;
 wire	tagv292r0gxd2pdlh89sjft_867 ;
 wire	h68hk7ng7yzspwvup_186 ;
 wire [8:0] dhyckpvq7rda1imzf_7 ;
 wire	wpcv6s37gmdg09e6bppu8t_362 ;
 wire	cdkwjudzee01or49_764 ;
 wire	m3ono2nrz48xyr8ju35tw2t45_325 ;
 wire	pnlqxd43ojr2dt7f8g00p3_378 ;
 wire	g1g11f0rsa83jw0n_559 ;
 wire	di6hxmuedonxa88dos3k43xx86_676 ;
 wire	uhzqx1sgt1a63thf3exqpwjkjoe_623 ;
 wire [255:0] o1wtw3yctsag3xr4t_828 ;
 wire	xsrspidrkxli2qcf_793 ;
 wire [255:0] omop81t9pk22lonq22fc4wqtw3o9_857 ;
 wire	s7q5dvk0r8hlqm2yek1_384 ;
 wire	jw12lf068n9m7uy5wadh_456 ;
 wire	fsoi0uvgb6cglwxycltq_904 ;
 wire [159:0] ak19zhpo0tifdkheg5s39gswb1y8_234 ;
 wire	kjxu5mf9fpum67nn9a26lgblmmcwznpr_577 ;
 wire [159:0] q8s4adu9y69918fqy3hzgg_187 ;
 wire	ucozcgb0skzjn51nim4j62gnja7i70_390 ;
 wire	bjefxpaa42gv7s4pgvp7tiushpr_325 ;
 wire	cftn9sd5vy6kns0bzsf5auruxd45_780 ;
 wire	htmsfknmac0pr3l8bylow6ry8aofw_444 ;
 wire	ssnoc0hwlvn6li8m_149 ;


 assign uqx1rjbbxpetqjn5714fynjjghj_458 = 
	 ~(backpressure_in) ;
 assign ih5fm33q5rz4ql138qh0s_37 = 
	{packet_in_PACKET2_TVALID, packet_in_PACKET2_TDATA, packet_in_PACKET2_TKEEP, packet_in_PACKET2_TLAST} ;
 assign yqliivs2b2uvybpg_535 	= packet_in_PACKET2_TVALID ;
 assign ckm99wixk5r48kfgn6zn94oko3r_409 	= ih5fm33q5rz4ql138qh0s_37[289:0] ;
 assign h9lbgm2ncosab10nicsri5wd_106 = 
	pnlqxd43ojr2dt7f8g00p3_378 | htmsfknmac0pr3l8bylow6ry8aofw_444 ;
 assign kdkplxwe6qzg4v2jt38gxb2_226 = 
	1'b0 ;
 assign zlx0lqrzhx0rhnv7xh5snpusu8_667 = 
	1'b1 ;
 assign lay8b6x3qp2woxg4cllr13_495 = 
	 ~(wkhxaaxjb6mt5jg7b5xvubna_211) ;
 assign pbeqw39v313a6wcnvcnmv645fuwgh_254 = 
	di6hxmuedonxa88dos3k43xx86_676 & h9lbgm2ncosab10nicsri5wd_106 & mhg4qdie78fw4zjjvk_320 ;
 assign birr3w9s0rp04qyy8_679 = 
	lay8b6x3qp2woxg4cllr13_495 & vfjid6uc95vkmi6cok75fhf0qa2_879 & mhg4qdie78fw4zjjvk_320 & pnlqxd43ojr2dt7f8g00p3_378 & di6hxmuedonxa88dos3k43xx86_676 ;
 assign wtpe5831e3ysjs4z82j8f2_477 = 
	pbeqw39v313a6wcnvcnmv645fuwgh_254 | birr3w9s0rp04qyy8_679 ;
 assign rpo132k4ms1s3308u8u_244 = 
	uqx1rjbbxpetqjn5714fynjjghj_458 & wtpe5831e3ysjs4z82j8f2_477 ;
 assign bo61fycdzh4e4yp0mwtjx9sjkzniw1l5_262 = 
	backpressure_in & vujjh11j0ctth43652xcsqw_110 & di6hxmuedonxa88dos3k43xx86_676 & m3ono2nrz48xyr8ju35tw2t45_325 & htmsfknmac0pr3l8bylow6ry8aofw_444 & lay8b6x3qp2woxg4cllr13_495 ;
 assign ldrtoi7ik26ox20f_685 = 
	rpo132k4ms1s3308u8u_244 | bo61fycdzh4e4yp0mwtjx9sjkzniw1l5_262 ;
 assign o4nf1e2ioti5huhskqo_246 	= ldrtoi7ik26ox20f_685 ;
 assign utev4y0rou5xw0v8azow4s9xw_0 = 
	1'b0 ;
 assign mhg4qdie78fw4zjjvk_320 = 
	 ~(svcv0x94ktex3tqn44xykljhg_425) ;
 assign lpbu8m0a2gtf8x2gommn704p71jj_662 	= szvhewqarkczrocnagpssil2j_431[0] ;
 assign bjkw6nf4ubpzjs2m53ho0s2roc_462 	= szvhewqarkczrocnagpssil2j_431[32:1] ;
 assign ijyiaa28ekem12nfa25kmhlo_848 	= szvhewqarkczrocnagpssil2j_431[288:33] ;
 assign qtyo0m4o7vnzvms7zj6warwcj88a6_753 	= szvhewqarkczrocnagpssil2j_431[289] ;
 assign fguvi1l8iwr1834nr2ur_671 = 
	vujjh11j0ctth43652xcsqw_110 | lhpfajzpxco4to0gkz9zg1zq_696 ;
 assign d46j0yyvulii02owcq3t08yn_312 = 
	i6p9mu9zebtonsd6s2xfq5b1cieg_665 | mhg4qdie78fw4zjjvk_320 ;
 assign eeow6xhhd3b0o0cory8fty_647 = 
	d46j0yyvulii02owcq3t08yn_312 & di6hxmuedonxa88dos3k43xx86_676 & h9lbgm2ncosab10nicsri5wd_106 ;
 assign b3hv57tu6zf23sge27cl2yh_67 = 
	eeow6xhhd3b0o0cory8fty_647 | vfjid6uc95vkmi6cok75fhf0qa2_879 ;
 assign iqfcxg02qe6wd8k44b8oknru46133xj_168 = 
	backpressure_in & qtyo0m4o7vnzvms7zj6warwcj88a6_753 & b3hv57tu6zf23sge27cl2yh_67 ;
 assign y2eifhyuhhvppdvcau3wh5zpbhyhwzh_904 = 
	m3ono2nrz48xyr8ju35tw2t45_325 & wjav8flgvx2y4opmh7zrbqjdqwux5_14 ;
 assign nd2pg2u7m3g5vacblkrr2_441 = 
	y2eifhyuhhvppdvcau3wh5zpbhyhwzh_904 | pnlqxd43ojr2dt7f8g00p3_378 | lpbu8m0a2gtf8x2gommn704p71jj_662 ;
 assign zjn8demnoib31v5xn8lhscqgdia0k_212 = 
	uqx1rjbbxpetqjn5714fynjjghj_458 & vfjid6uc95vkmi6cok75fhf0qa2_879 & qtyo0m4o7vnzvms7zj6warwcj88a6_753 & nd2pg2u7m3g5vacblkrr2_441 ;
 assign ptbe0umbeltswp48axj39056k_137 	= vfjid6uc95vkmi6cok75fhf0qa2_879 ;
 assign jctjonktq8s8gl3bjxad3tdz2cnpqq_54 	= packet_in_PACKET2_TVALID ;
 assign kvqrbkfrnezrx55qapuw_189 = 
	1'b0 ;
 assign ywttleoo7zxg07200hxb_432 = 
	1'b1 ;
 assign vlfqzrs4jwa9irx2mi_160 = (
	((hewpdnaypy942b3fvhtr98ho5589saq_92 == 1'b1) && (packet_in_PACKET2_TVALID == 1'b1))?1'b1:
	((awl1tpfawws2yu8y08ehh1yhzaa_288 == 1'b1) && (packet_in_PACKET2_TVALID == 1'b1))?1'b1:
	0)  ;
 assign o18ouoath215cj1449nvml8b6sj3ucrd_437 = (
	((packet_in_PACKET2_TVALID == 1'b1) && (packet_in_PACKET2_TLAST == 1'b1))?1'b1:
	0)  ;
 assign k8s3xywzw5gly5ob2b6cfhqerdttb_782 = (
	((packet_in_PACKET2_TVALID == 1'b1) && (packet_in_PACKET2_TLAST == 1'b0))?1'b1:
	0)  ;
 assign j0toh1he7s3wbsdo_799 = vlfqzrs4jwa9irx2mi_160 ;
 assign tagv292r0gxd2pdlh89sjft_867 	= ldrtoi7ik26ox20f_685 ;
 assign h68hk7ng7yzspwvup_186 = 
	1'b0 ;
 assign dhyckpvq7rda1imzf_7 	= xqw5nashwna5de1rqt_700[8:0] ;
 assign wpcv6s37gmdg09e6bppu8t_362 = (
	((dhyckpvq7rda1imzf_7 != exjwxs8io8ilfhoi_16))?1'b1:
	0)  ;
 assign cdkwjudzee01or49_764 = zu2esjnv57529skiq_645 ;
 assign m3ono2nrz48xyr8ju35tw2t45_325 = zu2esjnv57529skiq_645 ;
 assign pnlqxd43ojr2dt7f8g00p3_378 = 
	 ~(m3ono2nrz48xyr8ju35tw2t45_325) ;
 assign g1g11f0rsa83jw0n_559 	= kwrsdwuay8jm1sutdkqudo8_484 ;
 assign di6hxmuedonxa88dos3k43xx86_676 = 
	 ~(kwrsdwuay8jm1sutdkqudo8_484) ;
 assign uhzqx1sgt1a63thf3exqpwjkjoe_623 = 
	htmsfknmac0pr3l8bylow6ry8aofw_444 & di6hxmuedonxa88dos3k43xx86_676 & cdkwjudzee01or49_764 & ldrtoi7ik26ox20f_685 ;
 assign o1wtw3yctsag3xr4t_828 = 
	tuple_in_TUPLE0_DATA ;
 assign xsrspidrkxli2qcf_793 	= tuple_in_TUPLE0_VALID ;
 assign omop81t9pk22lonq22fc4wqtw3o9_857 	= o1wtw3yctsag3xr4t_828[255:0] ;
 assign s7q5dvk0r8hlqm2yek1_384 = 
	 ~(gh4yqcyok6zdjw8vygzvudl428c_870) ;
 assign jw12lf068n9m7uy5wadh_456 	= uhzqx1sgt1a63thf3exqpwjkjoe_623 ;
 assign fsoi0uvgb6cglwxycltq_904 = 
	1'b0 ;
 assign ak19zhpo0tifdkheg5s39gswb1y8_234 = 
	tuple_in_TUPLE1_DATA ;
 assign kjxu5mf9fpum67nn9a26lgblmmcwznpr_577 	= tuple_in_TUPLE1_VALID ;
 assign q8s4adu9y69918fqy3hzgg_187 	= ak19zhpo0tifdkheg5s39gswb1y8_234[159:0] ;
 assign ucozcgb0skzjn51nim4j62gnja7i70_390 = 
	 ~(yyyoo5uo7ohorpzncr_16) ;
 assign bjefxpaa42gv7s4pgvp7tiushpr_325 	= uhzqx1sgt1a63thf3exqpwjkjoe_623 ;
 assign cftn9sd5vy6kns0bzsf5auruxd45_780 = 
	1'b0 ;
 assign htmsfknmac0pr3l8bylow6ry8aofw_444 = 
	mhg4qdie78fw4zjjvk_320 & s7q5dvk0r8hlqm2yek1_384 & ucozcgb0skzjn51nim4j62gnja7i70_390 ;
 assign ssnoc0hwlvn6li8m_149 = 
	widxx5guw8swy2xt9r8vbdsqg_47 | lx4gr8jvwomzla6immbgozpjulb3c1_100 | i8pyikfh8sng0k3lv2xfj3152w75qj_723 ;
 assign packet_out_PACKET2_TVALID 	= ptbe0umbeltswp48axj39056k_137 ;
 assign packet_out_PACKET2_TDATA 	= ijyiaa28ekem12nfa25kmhlo_848[255:0] ;
 assign packet_out_PACKET2_TKEEP 	= bjkw6nf4ubpzjs2m53ho0s2roc_462[31:0] ;
 assign packet_out_PACKET2_TLAST 	= lpbu8m0a2gtf8x2gommn704p71jj_662 ;
 assign packet_in_PACKET2_TREADY 	= packet_out_PACKET2_TREADY ;
 assign tuple_out_TUPLE0_VALID 	= wjav8flgvx2y4opmh7zrbqjdqwux5_14 ;
 assign tuple_out_TUPLE0_DATA 	= fxo6k7mrzecva19iuyr8hji5tjnr9v_192[255:0] ;
 assign tuple_out_TUPLE1_VALID 	= wjav8flgvx2y4opmh7zrbqjdqwux5_14 ;
 assign tuple_out_TUPLE1_DATA 	= wnh9sy94gc6gkgjbv7ux1xkctvjt0l81_353[159:0] ;


assign n8h12t0l4q1i5l3nsmnhgb204g2wmlj_131 = (
	((ldrtoi7ik26ox20f_685 == 1'b1))?zlx0lqrzhx0rhnv7xh5snpusu8_667 :
	((uqx1rjbbxpetqjn5714fynjjghj_458 == 1'b1))?kdkplxwe6qzg4v2jt38gxb2_226 :
	vfjid6uc95vkmi6cok75fhf0qa2_879 ) ;

assign wkhxaaxjb6mt5jg7b5xvubna_211 = (
	((vfjid6uc95vkmi6cok75fhf0qa2_879 == 1'b1) && (uqx1rjbbxpetqjn5714fynjjghj_458 == 1'b1))?kdkplxwe6qzg4v2jt38gxb2_226 :
	vfjid6uc95vkmi6cok75fhf0qa2_879 ) ;



always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	vujjh11j0ctth43652xcsqw_110 <= 1'b0 ;
	vfjid6uc95vkmi6cok75fhf0qa2_879 <= 1'b0 ;
	i6p9mu9zebtonsd6s2xfq5b1cieg_665 <= 1'b0 ;
	lhpfajzpxco4to0gkz9zg1zq_696 <= 1'b0 ;
	exjwxs8io8ilfhoi_16 <= 9'b000000000 ;
	widxx5guw8swy2xt9r8vbdsqg_47 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		vujjh11j0ctth43652xcsqw_110 <= backpressure_in ;
		vfjid6uc95vkmi6cok75fhf0qa2_879 <= n8h12t0l4q1i5l3nsmnhgb204g2wmlj_131 ;
		i6p9mu9zebtonsd6s2xfq5b1cieg_665 <= mhg4qdie78fw4zjjvk_320 ;
		lhpfajzpxco4to0gkz9zg1zq_696 <= ldrtoi7ik26ox20f_685 ;
		exjwxs8io8ilfhoi_16 <= dhyckpvq7rda1imzf_7 ;
		widxx5guw8swy2xt9r8vbdsqg_47 <= kr8o01ku1hk85brnc_74 ;
		backpressure_out <= ssnoc0hwlvn6li8m_149 ;
  end
end

always @(posedge clk_in_0)
begin
  if (rst_in_0) 
  begin
	hewpdnaypy942b3fvhtr98ho5589saq_92 <= 1'b0 ;
	awl1tpfawws2yu8y08ehh1yhzaa_288 <= 1'b1 ;
   end
  else
  begin
	if (k8s3xywzw5gly5ob2b6cfhqerdttb_782) 
	begin 
	  hewpdnaypy942b3fvhtr98ho5589saq_92 <= 1'b0 ;
	 end 
	else 
	begin 
		if (o18ouoath215cj1449nvml8b6sj3ucrd_437) 
		begin 
			hewpdnaypy942b3fvhtr98ho5589saq_92 <= ywttleoo7zxg07200hxb_432 ;
		end 
	end 
	if (vlfqzrs4jwa9irx2mi_160) 
	begin 
		awl1tpfawws2yu8y08ehh1yhzaa_288 <= kvqrbkfrnezrx55qapuw_189 ;
	end 
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	wjav8flgvx2y4opmh7zrbqjdqwux5_14 <= 1'b0 ;
	lx4gr8jvwomzla6immbgozpjulb3c1_100 <= 1'b0 ;
   end
  else
  begin
		wjav8flgvx2y4opmh7zrbqjdqwux5_14 <= uhzqx1sgt1a63thf3exqpwjkjoe_623 ;
		lx4gr8jvwomzla6immbgozpjulb3c1_100 <= rtgxrmoknkaqldzsuupyljh_434 ;
  end
end

always @(posedge clk_out_2)
begin
  if (rst_in_0) 
  begin
	i8pyikfh8sng0k3lv2xfj3152w75qj_723 <= 1'b0 ;
   end
  else
  begin
		i8pyikfh8sng0k3lv2xfj3152w75qj_723 <= pucue1kgcz5krf35mdn0_671 ;
  end
end

defparam ijqy1xlryiaqy3ctts_1175.WRITE_DATA_WIDTH = 290; 
defparam ijqy1xlryiaqy3ctts_1175.FIFO_WRITE_DEPTH = 512; 
defparam ijqy1xlryiaqy3ctts_1175.PROG_FULL_THRESH = 177; 
defparam ijqy1xlryiaqy3ctts_1175.PROG_EMPTY_THRESH = 177; 
defparam ijqy1xlryiaqy3ctts_1175.READ_MODE = "STD"; 
defparam ijqy1xlryiaqy3ctts_1175.WR_DATA_COUNT_WIDTH = 9; 
defparam ijqy1xlryiaqy3ctts_1175.RD_DATA_COUNT_WIDTH = 9; 
defparam ijqy1xlryiaqy3ctts_1175.DOUT_RESET_VALUE = "0"; 
defparam ijqy1xlryiaqy3ctts_1175.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_sync ijqy1xlryiaqy3ctts_1175 (
	.wr_en(yqliivs2b2uvybpg_535),
	.din(ckm99wixk5r48kfgn6zn94oko3r_409),
	.rd_en(o4nf1e2ioti5huhskqo_246),
	.sleep(utev4y0rou5xw0v8azow4s9xw_0),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(lesaklf2j6h846pn719y3v19wbww_787), 
	.dout(szvhewqarkczrocnagpssil2j_431), 
	.empty(svcv0x94ktex3tqn44xykljhg_425), 
	.prog_full(kr8o01ku1hk85brnc_74), 
	.full(injszbha5i31fxnmq06pk7ibix3hnb_316), 
	.rd_data_count(oio7aesn1ebrw8pbt4z3znnn4_270), 
	.wr_data_count(xzm3sli9ftu2mp5u1gi8lb2pfl7v3_382), 
	.wr_rst_busy(qzydyi3ba25r6j3k46cfopm_730), 
	.rd_rst_busy(y9867ur2icy2ejcfsd_250), 
	.overflow(nit9p6pv66gcbj9sn2_422), 
	.underflow(jy6cp1dv02numujyzpjgp7r5i0zn_447), 
	.sbiterr(pis08w8vmzae8dnub_724), 
	.dbiterr(vtjxx37yqvxcurvoqsxzqvj71gw7mx_837), 
	.almost_empty(dmnseddzscp6kkjbhpcm5bxkij3unqg7_838), 
	.almost_full(ed1hw45t059cf4nfjak90fn9yxdcxg_678), 
	.wr_ack(r2gk6bduvmugnjc0bkxwqhl0glqt4u_154), 
	.data_valid(x0wm9wxfrqh1y675dapzn7km8_666), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam t0xrphe5na9p44n55608ulrfnfnsv_1637.WRITE_DATA_WIDTH = 1; 
defparam t0xrphe5na9p44n55608ulrfnfnsv_1637.FIFO_WRITE_DEPTH = 512; 
defparam t0xrphe5na9p44n55608ulrfnfnsv_1637.PROG_FULL_THRESH = 177; 
defparam t0xrphe5na9p44n55608ulrfnfnsv_1637.PROG_EMPTY_THRESH = 177; 
defparam t0xrphe5na9p44n55608ulrfnfnsv_1637.READ_MODE = "FWFT"; 
defparam t0xrphe5na9p44n55608ulrfnfnsv_1637.WR_DATA_COUNT_WIDTH = 9; 
defparam t0xrphe5na9p44n55608ulrfnfnsv_1637.RD_DATA_COUNT_WIDTH = 9; 
defparam t0xrphe5na9p44n55608ulrfnfnsv_1637.DOUT_RESET_VALUE = "0"; 
defparam t0xrphe5na9p44n55608ulrfnfnsv_1637.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_sync t0xrphe5na9p44n55608ulrfnfnsv_1637 (
	.wr_en(jctjonktq8s8gl3bjxad3tdz2cnpqq_54),
	.din(j0toh1he7s3wbsdo_799),
	.rd_en(tagv292r0gxd2pdlh89sjft_867),
	.sleep(h68hk7ng7yzspwvup_186),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(mglqafhp2slojwpk3m38feroid1r_491), 
	.dout(zu2esjnv57529skiq_645), 
	.empty(kwrsdwuay8jm1sutdkqudo8_484), 
	.prog_full(kd68pmbiralvxi4c_439), 
	.full(oct3h4nhx6jiiw157q5mh_265), 
	.rd_data_count(xqw5nashwna5de1rqt_700), 
	.wr_data_count(kyyb3en8b79q213b3hdp2wvjh1wi1ub_208), 
	.wr_rst_busy(lx8cy1y06lolpzdt0fh7ff_252), 
	.rd_rst_busy(xx8zm09v3qfh6xdwcne6cb3z50h_238), 
	.overflow(yhy085ik63dqp8q27fn1p7zx_899), 
	.underflow(xo809kj3tn9o9w06alc3x3e_281), 
	.sbiterr(m67yedpjee6ncbb5oqe7_47), 
	.dbiterr(on3mmdoowj24or3y1h1nyc0ou0cn_590), 
	.almost_empty(jbujc5omup8gtrt92cgvarpwelf28tb_21), 
	.almost_full(q8w7vt6qn9njc1ayeha3poyt_599), 
	.wr_ack(rwf05eu7587bhcxs96749xr1ikud93_137), 
	.data_valid(mgva8l6m0gja89eb5hu_381), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam aqftuu45qzhsoxcpr2d480pdxidnbno_1995.WRITE_DATA_WIDTH = 256; 
defparam aqftuu45qzhsoxcpr2d480pdxidnbno_1995.FIFO_WRITE_DEPTH = 256; 
defparam aqftuu45qzhsoxcpr2d480pdxidnbno_1995.PROG_FULL_THRESH = 66; 
defparam aqftuu45qzhsoxcpr2d480pdxidnbno_1995.PROG_EMPTY_THRESH = 66; 
defparam aqftuu45qzhsoxcpr2d480pdxidnbno_1995.READ_MODE = "STD"; 
defparam aqftuu45qzhsoxcpr2d480pdxidnbno_1995.WR_DATA_COUNT_WIDTH = 8; 
defparam aqftuu45qzhsoxcpr2d480pdxidnbno_1995.RD_DATA_COUNT_WIDTH = 8; 
defparam aqftuu45qzhsoxcpr2d480pdxidnbno_1995.DOUT_RESET_VALUE = "0"; 
defparam aqftuu45qzhsoxcpr2d480pdxidnbno_1995.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async aqftuu45qzhsoxcpr2d480pdxidnbno_1995 (
	.wr_en(xsrspidrkxli2qcf_793),
	.din(omop81t9pk22lonq22fc4wqtw3o9_857),
	.rd_en(jw12lf068n9m7uy5wadh_456),
	.sleep(fsoi0uvgb6cglwxycltq_904),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(t7srr2lruy8q0xs2bdfhyb3_289), 
	.dout(fxo6k7mrzecva19iuyr8hji5tjnr9v_192), 
	.empty(gh4yqcyok6zdjw8vygzvudl428c_870), 
	.prog_full(rtgxrmoknkaqldzsuupyljh_434), 
	.full(pe5og3yw65cegdav9d5j7_566), 
	.rd_data_count(dl8bduvefixpcy83ql9o_450), 
	.wr_data_count(xeu7e2l0xxd7mjgiz4xsh8vf8ta_247), 
	.wr_rst_busy(v21rg4ni8lxnhtb3ojwkf59ud072oq_632), 
	.rd_rst_busy(e22b9bck6adq9zgvtji7ksj_199), 
	.overflow(tzfg03sfe61zpln0h7_12), 
	.underflow(wdvc00ehanzmox31llib7sd4_619), 
	.sbiterr(ka440tpvp8ulgl2x4hl_510), 
	.dbiterr(jrptbnh3b1deh19mpevfu915ajona7ds_519), 
	.almost_empty(rgraioj8qng1ir0t86fsb9_400), 
	.almost_full(ep3v20doco66a8xjhqxtrbpv7frtkdzr_583), 
	.wr_ack(e1nq3myxjc0jx1hxoxw2331mqr3wfmhy_91), 
	.data_valid(nbf8geunvd45k5y1mt_736), 

	.wr_clk(clk_in_1), 

	.rd_clk(clk_out_1), 
	.rst(rst_in_1) 
); 

defparam xfq4ujr8zdhfibqtodjthqiqns36n2_1296.WRITE_DATA_WIDTH = 160; 
defparam xfq4ujr8zdhfibqtodjthqiqns36n2_1296.FIFO_WRITE_DEPTH = 256; 
defparam xfq4ujr8zdhfibqtodjthqiqns36n2_1296.PROG_FULL_THRESH = 66; 
defparam xfq4ujr8zdhfibqtodjthqiqns36n2_1296.PROG_EMPTY_THRESH = 66; 
defparam xfq4ujr8zdhfibqtodjthqiqns36n2_1296.READ_MODE = "STD"; 
defparam xfq4ujr8zdhfibqtodjthqiqns36n2_1296.WR_DATA_COUNT_WIDTH = 8; 
defparam xfq4ujr8zdhfibqtodjthqiqns36n2_1296.RD_DATA_COUNT_WIDTH = 8; 
defparam xfq4ujr8zdhfibqtodjthqiqns36n2_1296.DOUT_RESET_VALUE = "0"; 
defparam xfq4ujr8zdhfibqtodjthqiqns36n2_1296.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async xfq4ujr8zdhfibqtodjthqiqns36n2_1296 (
	.wr_en(kjxu5mf9fpum67nn9a26lgblmmcwznpr_577),
	.din(q8s4adu9y69918fqy3hzgg_187),
	.rd_en(bjefxpaa42gv7s4pgvp7tiushpr_325),
	.sleep(cftn9sd5vy6kns0bzsf5auruxd45_780),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(kuo6wkac3jcvd1bl1xgoqkbfl53_383), 
	.dout(wnh9sy94gc6gkgjbv7ux1xkctvjt0l81_353), 
	.empty(yyyoo5uo7ohorpzncr_16), 
	.prog_full(pucue1kgcz5krf35mdn0_671), 
	.full(p3fpptxl7do9gdysyjado5edfd4_430), 
	.rd_data_count(k64pr9l4dwknjak3spw_198), 
	.wr_data_count(ouuouoc2u0djsb50qb3xt3xdyg_839), 
	.wr_rst_busy(f4boapwtq1j4xcw2su_445), 
	.rd_rst_busy(undcc66pbmnmilhe7jwbs7r1omoowj_850), 
	.overflow(ablc8r7s8hsmmlxrd9i5fvv2_515), 
	.underflow(vywpsjbqwlxyzj8t4349_369), 
	.sbiterr(r6rwdinlfmb6ofnm00mo0_424), 
	.dbiterr(nm76cugb0m5hm0yjtghlv5w_217), 
	.almost_empty(cj0ppl0zhtz29nasu0_826), 
	.almost_full(ejwcjnxf3tpxqq35d_145), 
	.wr_ack(ydk8fmdp6hijbrsrnl5j31kqmqzp_628), 
	.data_valid(lsej2khnnap6mvao99ke4id3el9lf7c_322), 

	.wr_clk(clk_in_2), 

	.rd_clk(clk_out_2), 
	.rst(rst_in_2) 
); 

endmodule 
