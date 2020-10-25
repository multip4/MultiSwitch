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
// File created: 2020/10/07 15:07:46
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






 reg	anoexf8iypvimhg10h8zhheq1gzh87g_72;	 initial anoexf8iypvimhg10h8zhheq1gzh87g_72 = 1'b0 ;
 wire	dpn5mvw6wglxeqhs7c2aln5bn_131 ;
 wire [265:0] uy4yfh73ej7gif9r4i_566 ;
 wire	r8dqb1zmfw3wzufay1gnj7fl3kb4qvoi_361 ;
 wire	rz6o2lh7rnixt7z9vsm4kj5473p9v_654 ;
 wire	lk3xbkbghmxrofp05874g6u_165 ;
 wire [8:0] awjqrzsb2chgegz2hrtwl4f_158 ;
 wire [8:0] dkiwp80zfv5mktankwi_860 ;
 wire	piflb9crki2d8sg0dhm2n5nathbc6d06_643 ;
 wire	eskcracq9232fndg1tyd3wjq7rymu9z_341 ;
 wire	u9tn4145qndef867a3hkpuafdg_840 ;
 wire	jun07wp01jogy6pccob16m603gpls4wj_381 ;
 wire	jfefdja5prr251y51golpty4y7i5ho9c_678 ;
 wire	dzu9shpx5fgfrpgh1pksgw4j_8 ;
 wire	f2ykp34c13ofjs6jz0lchmo4i_535 ;
 wire	ax9h4imypi4h4ia2v_462 ;
 wire	xoqb4v6t57yll1kt245t9muf8a54g_287 ;
 wire	hbsjngrbta6na4seakf_713 ;
 wire	q8wfv7y58vj1olsi_5 ;
 reg	zik5ovcmk9xlgxirixgwsx1vlht6uh_227;	 initial zik5ovcmk9xlgxirixgwsx1vlht6uh_227 = 1'b0 ;
 wire	dlpopnl87rvfenhgyra_452 ;
 reg	ata4qcklm0sal7thfij7m71_480;	 initial ata4qcklm0sal7thfij7m71_480 = 1'b0 ;
 reg	ifi41ljv9nk1npoaimnb5kzci_673;	 initial ifi41ljv9nk1npoaimnb5kzci_673 = 1'b0 ;
 wire	xwhtqmjpp59rq8qe8rz8y_233 ;
 wire [0:0] jhq0xi0msvi0or4jox95tkhmyxkqw_76 ;
 wire	c5a52m2epxxq4zp9ryirdbhiegcbazf_388 ;
 wire	mhs8p14xmglv79rgzz3g7sybae_570 ;
 wire	etys76lah9phk6410qz2d28_533 ;
 wire [8:0] jv7mu60pb3wk2wh6_452 ;
 wire [8:0] veaodyjzp6mquxil6os1ug0k_772 ;
 wire	u6icths4vxluoiekfmyw84hl_465 ;
 wire	uckt8dgk5rmbbbk3_633 ;
 wire	bdejqcxvqp28fmo3zc2yl_441 ;
 wire	e7q0ti1shy582m07pwvwpbyoz_356 ;
 wire	i78ippx9nkn8tlwd9_847 ;
 wire	aq2marqcj8hzydhdwqjek0j9x_754 ;
 wire	mrkcdpm7zm391bvwgud_423 ;
 wire	ng2j1qaalqpxl73r_238 ;
 wire	e091helhdeygshg4h_469 ;
 wire	d72prkh08sk6w1pttmhz_728 ;
 reg [8:0] ckf1xhu6f48ehvt7g_160;	 initial ckf1xhu6f48ehvt7g_160 = 9'b000000000 ;
 reg	jo2g2p6bx5k46l30u8n9kjep4_187;	 initial jo2g2p6bx5k46l30u8n9kjep4_187 = 1'b0 ;
 wire	la7wzx86aisssbs1py87igt_233 ;
 wire [159:0] c3mnu3sjr5j4q4sdq40yyql76hg_381 ;
 wire	gtyaqhc755bxcxsd2hm49le_490 ;
 wire	tgh52r04wtj7n1t3gy2zp_134 ;
 wire	cjsm95a3gb1bixooncijla7jr_779 ;
 wire [7:0] riu0y8rpe8w8ftk1lqyg8c5s1gopz_776 ;
 wire [7:0] fby2cwkixjfnp5hivkoj1m1j_90 ;
 wire	hnjluh942om0ctdm5wmw08ym65i3l_757 ;
 wire	ucyxvg1c4839i0xfi896l_871 ;
 wire	puo9qxi6401nolrih5in5roe0e_150 ;
 wire	v9ctlh326eorbe38q_456 ;
 wire	okqf94py6wnpie1xmgpmtox6qu_274 ;
 wire	sv0ps34ht8m4r9kjq8ba7_717 ;
 wire	rwl43fm1rvg2g98qf9w84_764 ;
 wire	ellx8s9ahylvzqj0rbv3iubfjpkab_343 ;
 wire	rap6y8r0q9pedn1ualq8_632 ;
 wire	g3rx0sjyc62di479o_65 ;
 wire	gie8ks3qei5xthop6f605kbz4yqa_749 ;
 wire [23:0] fzs7segirfr7u0nl6yet_683 ;
 wire	dp74kzh7jglwrr225unyz6toqedh_710 ;
 wire	tlunbipojero0deghnpa3kv1i1f_45 ;
 wire	bs3da6d31hwr1h1fnbs5lp7rlf_64 ;
 wire [7:0] s9sl58l4e1s0fa0k8eii_132 ;
 wire [7:0] is8o2jzzwqfo6lfgbzpb3_349 ;
 wire	d9vem75rw5gk4osmcc5jm8vebbc01oa8_830 ;
 wire	fnzje5ijp7z216bxkyu36emq3x_891 ;
 wire	iozoan5c99c09y36ge7rqioykbkbp42_539 ;
 wire	swbqkj98yylovglhe0erhi5_33 ;
 wire	o1c7z1shx9mqe74jh_556 ;
 wire	hjlj8s18isaz4jfwfd6is88e66w3r2_622 ;
 wire	tgo8agtus4oh1lr13kpunlsaw4het4a_764 ;
 wire	v8lf1eitauv5seijmgto9688oceh1x_528 ;
 wire	phefn9043x96tn4afqf1xp6f73m_574 ;
 wire	lrvegba9pm1gezdeyxszhhqr_570 ;
 reg	k7p1lx5wujynnylo31ofwb_472;	 initial k7p1lx5wujynnylo31ofwb_472 = 1'b0 ;
 reg	n8tzu7k0ysupidcjwboh5ywob_274;	 initial n8tzu7k0ysupidcjwboh5ywob_274 = 1'b0 ;
 reg	x0nd3uzb9591jzhpiwvuk_556;	 initial x0nd3uzb9591jzhpiwvuk_556 = 1'b0 ;
 wire	pylfdba9g7dibysmdpa7oefl7yc_78 ;
 wire [265:0] b5srbqhjlr41330q293h5qtxu_500 ;
 wire	p6jega5g536lbaete6nbqag_550 ;
 wire [265:0] wspndjnknqhky2fu3opuahdo4mv_826 ;
 wire	trxzikpuvzx70wafbbzke5mmob1p9az_8 ;
 wire	bwzxo8jbj97qs91tqife1ew_725 ;
 wire	sowq0tmizvgb86z7th9l6to2_634 ;
 wire	qplur02ut8xow1x9xfkgrdmawuh711_180 ;
 wire	rf8kgj7er0gnr05nkq4niuo0q1idkmc_506 ;
 wire	b9508phfxr1nuxixsygxdccasnxkia_212 ;
 wire	l4j63z5mg1gcw5qcxysag5ok_754 ;
 wire	lp41mv9vh4dssyffqzj_257 ;
 wire	pvnvoy83a93k1ha3q2mtyadr4v5_308 ;
 wire	p1d5pnbkeeeqobt1vrqgwpyodna_332 ;
 wire [5:0] jbtzfkvgndeobagzacwqa_214 ;
 wire [255:0] mnl5i5imqvolm85fx1g_651 ;
 wire	gpt3rrwzxcjcoehhg9bi_478 ;
 wire	vhsihma5swcgo73seypxdfjl_568 ;
 wire	m1qihbd21r0uplxfh2wg1s_219 ;
 wire	fnzj0mxhxphwrz0tkrslj3c7hi0_170 ;
 wire	n8o6mm4dp340u8u1nw5xgtr6fcmg_459 ;
 wire [0:0] e10v96rrwsd0qxzd4cnlcu33fkp_35 ;
 wire	o5izjfa3bn3kepktzpm_839 ;
 wire	hgj4jager1ijf0c1cqzbj1o5gszvfsh_750 ;
 wire [8:0] p0j5pwnra3ei01nwd4mpgdz7_447 ;
 wire	e36kb2cfsrkv6xgnoo8c_848 ;
 wire	v91p5oqc0pqcaw8d25156on9d0k_534 ;
 wire	s2ojng0ywa4r74xaof2nj_183 ;
 wire	z48qdf3xe5nbp1wv_489 ;
 wire	v0qsbx1z3ifi7gvhax2bj4d_81 ;
 wire	zv8l7479ped1jlkwjtup_76 ;
 wire	e6gho4rzh9ijswc0_407 ;
 wire [159:0] es2n5jpj6k84szuhcvgrso5oxkp8nnva_74 ;
 wire	nl0g93hk486pr3u4na1iv_276 ;
 wire [159:0] noi48gtjru7r7xtbv0p2nj99umbvm_203 ;
 wire	hqxqhs6b0fwoaqj5f52ncc_3 ;
 wire	f6mbr4q31nuj63zdkxql6ne_240 ;
 wire	rgyimmt26yp4kirzs5051_46 ;
 wire [23:0] lxx2p4ebhumathoy4rwx9_43 ;
 wire	x6ohfsem97dvbic17o_827 ;
 wire [23:0] xqvrplmxh0v0uummml45ect8_716 ;
 wire	qi2by7xp2rkxngjjsam89aispx3q79h_411 ;
 wire	zezkt8hymseazbj2rn9k8b_491 ;
 wire	rjyiyhlseuq77txcrp32l7fjg_310 ;
 wire	u3djol0u753x5a485sb5qxmqzkq1pcc_459 ;
 wire	fnq7fkhidsa9h64su7sadsqag_816 ;


 assign pylfdba9g7dibysmdpa7oefl7yc_78 = 
	 ~(backpressure_in) ;
 assign b5srbqhjlr41330q293h5qtxu_500 = 
	{packet_in_PACKET2_SOF, packet_in_PACKET2_EOF, packet_in_PACKET2_VAL, packet_in_PACKET2_DAT, packet_in_PACKET2_CNT, packet_in_PACKET2_ERR} ;
 assign p6jega5g536lbaete6nbqag_550 	= packet_in_PACKET2_VAL ;
 assign wspndjnknqhky2fu3opuahdo4mv_826 	= b5srbqhjlr41330q293h5qtxu_500[265:0] ;
 assign trxzikpuvzx70wafbbzke5mmob1p9az_8 = 
	z48qdf3xe5nbp1wv_489 | u3djol0u753x5a485sb5qxmqzkq1pcc_459 ;
 assign bwzxo8jbj97qs91tqife1ew_725 = 
	1'b0 ;
 assign sowq0tmizvgb86z7th9l6to2_634 = 
	1'b1 ;
 assign qplur02ut8xow1x9xfkgrdmawuh711_180 = 
	 ~(dlpopnl87rvfenhgyra_452) ;
 assign rf8kgj7er0gnr05nkq4niuo0q1idkmc_506 = 
	pylfdba9g7dibysmdpa7oefl7yc_78 & zv8l7479ped1jlkwjtup_76 & trxzikpuvzx70wafbbzke5mmob1p9az_8 ;
 assign b9508phfxr1nuxixsygxdccasnxkia_212 	= rf8kgj7er0gnr05nkq4niuo0q1idkmc_506 ;
 assign l4j63z5mg1gcw5qcxysag5ok_754 	= b9508phfxr1nuxixsygxdccasnxkia_212 ;
 assign lp41mv9vh4dssyffqzj_257 = 
	1'b0 ;
 assign pvnvoy83a93k1ha3q2mtyadr4v5_308 = 
	 ~(r8dqb1zmfw3wzufay1gnj7fl3kb4qvoi_361) ;
 assign p1d5pnbkeeeqobt1vrqgwpyodna_332 	= uy4yfh73ej7gif9r4i_566[0] ;
 assign jbtzfkvgndeobagzacwqa_214 	= uy4yfh73ej7gif9r4i_566[6:1] ;
 assign mnl5i5imqvolm85fx1g_651 	= uy4yfh73ej7gif9r4i_566[262:7] ;
 assign gpt3rrwzxcjcoehhg9bi_478 	= uy4yfh73ej7gif9r4i_566[263] ;
 assign vhsihma5swcgo73seypxdfjl_568 	= uy4yfh73ej7gif9r4i_566[264] ;
 assign m1qihbd21r0uplxfh2wg1s_219 	= uy4yfh73ej7gif9r4i_566[265] ;
 assign fnzj0mxhxphwrz0tkrslj3c7hi0_170 = 
	ifi41ljv9nk1npoaimnb5kzci_673 & gpt3rrwzxcjcoehhg9bi_478 ;
 assign n8o6mm4dp340u8u1nw5xgtr6fcmg_459 	= packet_in_PACKET2_VAL ;
 assign e10v96rrwsd0qxzd4cnlcu33fkp_35 = packet_in_PACKET2_SOF ;
 assign o5izjfa3bn3kepktzpm_839 	= b9508phfxr1nuxixsygxdccasnxkia_212 ;
 assign hgj4jager1ijf0c1cqzbj1o5gszvfsh_750 = 
	1'b0 ;
 assign p0j5pwnra3ei01nwd4mpgdz7_447 	= jv7mu60pb3wk2wh6_452[8:0] ;
 assign e36kb2cfsrkv6xgnoo8c_848 = (
	((p0j5pwnra3ei01nwd4mpgdz7_447 != ckf1xhu6f48ehvt7g_160))?1'b1:
	0)  ;
 assign v91p5oqc0pqcaw8d25156on9d0k_534 = jhq0xi0msvi0or4jox95tkhmyxkqw_76 ;
 assign s2ojng0ywa4r74xaof2nj_183 = jhq0xi0msvi0or4jox95tkhmyxkqw_76 ;
 assign z48qdf3xe5nbp1wv_489 = 
	 ~(s2ojng0ywa4r74xaof2nj_183) ;
 assign v0qsbx1z3ifi7gvhax2bj4d_81 	= c5a52m2epxxq4zp9ryirdbhiegcbazf_388 ;
 assign zv8l7479ped1jlkwjtup_76 = 
	 ~(c5a52m2epxxq4zp9ryirdbhiegcbazf_388) ;
 assign e6gho4rzh9ijswc0_407 = 
	pylfdba9g7dibysmdpa7oefl7yc_78 & u3djol0u753x5a485sb5qxmqzkq1pcc_459 & zv8l7479ped1jlkwjtup_76 & v91p5oqc0pqcaw8d25156on9d0k_534 ;
 assign es2n5jpj6k84szuhcvgrso5oxkp8nnva_74 = 
	tuple_in_TUPLE0_DATA ;
 assign nl0g93hk486pr3u4na1iv_276 	= tuple_in_TUPLE0_VALID ;
 assign noi48gtjru7r7xtbv0p2nj99umbvm_203 	= es2n5jpj6k84szuhcvgrso5oxkp8nnva_74[159:0] ;
 assign hqxqhs6b0fwoaqj5f52ncc_3 = 
	 ~(gtyaqhc755bxcxsd2hm49le_490) ;
 assign f6mbr4q31nuj63zdkxql6ne_240 	= e6gho4rzh9ijswc0_407 ;
 assign rgyimmt26yp4kirzs5051_46 = 
	1'b0 ;
 assign lxx2p4ebhumathoy4rwx9_43 = 
	tuple_in_TUPLE1_DATA ;
 assign x6ohfsem97dvbic17o_827 	= tuple_in_TUPLE1_VALID ;
 assign xqvrplmxh0v0uummml45ect8_716 	= lxx2p4ebhumathoy4rwx9_43[23:0] ;
 assign qi2by7xp2rkxngjjsam89aispx3q79h_411 = 
	 ~(dp74kzh7jglwrr225unyz6toqedh_710) ;
 assign zezkt8hymseazbj2rn9k8b_491 	= e6gho4rzh9ijswc0_407 ;
 assign rjyiyhlseuq77txcrp32l7fjg_310 = 
	1'b0 ;
 assign u3djol0u753x5a485sb5qxmqzkq1pcc_459 = 
	pvnvoy83a93k1ha3q2mtyadr4v5_308 & hqxqhs6b0fwoaqj5f52ncc_3 & qi2by7xp2rkxngjjsam89aispx3q79h_411 ;
 assign fnq7fkhidsa9h64su7sadsqag_816 = 
	k7p1lx5wujynnylo31ofwb_472 | n8tzu7k0ysupidcjwboh5ywob_274 | x0nd3uzb9591jzhpiwvuk_556 ;
 assign packet_out_PACKET2_SOF 	= m1qihbd21r0uplxfh2wg1s_219 ;
 assign packet_out_PACKET2_EOF 	= vhsihma5swcgo73seypxdfjl_568 ;
 assign packet_out_PACKET2_VAL 	= fnzj0mxhxphwrz0tkrslj3c7hi0_170 ;
 assign packet_out_PACKET2_DAT 	= mnl5i5imqvolm85fx1g_651[255:0] ;
 assign packet_out_PACKET2_CNT 	= jbtzfkvgndeobagzacwqa_214[5:0] ;
 assign packet_out_PACKET2_ERR 	= p1d5pnbkeeeqobt1vrqgwpyodna_332 ;
 assign packet_in_PACKET2_RDY 	= packet_out_PACKET2_RDY ;
 assign tuple_out_TUPLE0_VALID 	= jo2g2p6bx5k46l30u8n9kjep4_187 ;
 assign tuple_out_TUPLE0_DATA 	= c3mnu3sjr5j4q4sdq40yyql76hg_381[159:0] ;
 assign tuple_out_TUPLE1_VALID 	= jo2g2p6bx5k46l30u8n9kjep4_187 ;
 assign tuple_out_TUPLE1_DATA 	= fzs7segirfr7u0nl6yet_683[23:0] ;


assign q8wfv7y58vj1olsi_5 = (
	((b9508phfxr1nuxixsygxdccasnxkia_212 == 1'b1))?sowq0tmizvgb86z7th9l6to2_634 :
	((pylfdba9g7dibysmdpa7oefl7yc_78 == 1'b1))?bwzxo8jbj97qs91tqife1ew_725 :
	zik5ovcmk9xlgxirixgwsx1vlht6uh_227 ) ;

assign dlpopnl87rvfenhgyra_452 = (
	((zik5ovcmk9xlgxirixgwsx1vlht6uh_227 == 1'b1) && (pylfdba9g7dibysmdpa7oefl7yc_78 == 1'b1))?bwzxo8jbj97qs91tqife1ew_725 :
	zik5ovcmk9xlgxirixgwsx1vlht6uh_227 ) ;



always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	anoexf8iypvimhg10h8zhheq1gzh87g_72 <= 1'b0 ;
	zik5ovcmk9xlgxirixgwsx1vlht6uh_227 <= 1'b0 ;
	ata4qcklm0sal7thfij7m71_480 <= 1'b0 ;
	ifi41ljv9nk1npoaimnb5kzci_673 <= 1'b0 ;
	ckf1xhu6f48ehvt7g_160 <= 9'b000000000 ;
	k7p1lx5wujynnylo31ofwb_472 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		anoexf8iypvimhg10h8zhheq1gzh87g_72 <= backpressure_in ;
		zik5ovcmk9xlgxirixgwsx1vlht6uh_227 <= q8wfv7y58vj1olsi_5 ;
		ata4qcklm0sal7thfij7m71_480 <= pvnvoy83a93k1ha3q2mtyadr4v5_308 ;
		ifi41ljv9nk1npoaimnb5kzci_673 <= b9508phfxr1nuxixsygxdccasnxkia_212 ;
		ckf1xhu6f48ehvt7g_160 <= p0j5pwnra3ei01nwd4mpgdz7_447 ;
		k7p1lx5wujynnylo31ofwb_472 <= rz6o2lh7rnixt7z9vsm4kj5473p9v_654 ;
		backpressure_out <= fnq7fkhidsa9h64su7sadsqag_816 ;
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	jo2g2p6bx5k46l30u8n9kjep4_187 <= 1'b0 ;
	n8tzu7k0ysupidcjwboh5ywob_274 <= 1'b0 ;
   end
  else
  begin
		jo2g2p6bx5k46l30u8n9kjep4_187 <= e6gho4rzh9ijswc0_407 ;
		n8tzu7k0ysupidcjwboh5ywob_274 <= tgh52r04wtj7n1t3gy2zp_134 ;
  end
end

always @(posedge clk_out_2)
begin
  if (rst_in_0) 
  begin
	x0nd3uzb9591jzhpiwvuk_556 <= 1'b0 ;
   end
  else
  begin
		x0nd3uzb9591jzhpiwvuk_556 <= tlunbipojero0deghnpa3kv1i1f_45 ;
  end
end

defparam v9rmdt0tuuceat1jtw7jl48ttqh_816.WRITE_DATA_WIDTH = 266; 
defparam v9rmdt0tuuceat1jtw7jl48ttqh_816.FIFO_WRITE_DEPTH = 512; 
defparam v9rmdt0tuuceat1jtw7jl48ttqh_816.PROG_FULL_THRESH = 129; 
defparam v9rmdt0tuuceat1jtw7jl48ttqh_816.PROG_EMPTY_THRESH = 129; 
defparam v9rmdt0tuuceat1jtw7jl48ttqh_816.READ_MODE = "STD"; 
defparam v9rmdt0tuuceat1jtw7jl48ttqh_816.WR_DATA_COUNT_WIDTH = 9; 
defparam v9rmdt0tuuceat1jtw7jl48ttqh_816.RD_DATA_COUNT_WIDTH = 9; 
defparam v9rmdt0tuuceat1jtw7jl48ttqh_816.DOUT_RESET_VALUE = "0"; 
defparam v9rmdt0tuuceat1jtw7jl48ttqh_816.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_sync v9rmdt0tuuceat1jtw7jl48ttqh_816 (
	.wr_en(p6jega5g536lbaete6nbqag_550),
	.din(wspndjnknqhky2fu3opuahdo4mv_826),
	.rd_en(l4j63z5mg1gcw5qcxysag5ok_754),
	.sleep(lp41mv9vh4dssyffqzj_257),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(dpn5mvw6wglxeqhs7c2aln5bn_131), 
	.dout(uy4yfh73ej7gif9r4i_566), 
	.empty(r8dqb1zmfw3wzufay1gnj7fl3kb4qvoi_361), 
	.prog_full(rz6o2lh7rnixt7z9vsm4kj5473p9v_654), 
	.full(lk3xbkbghmxrofp05874g6u_165), 
	.rd_data_count(awjqrzsb2chgegz2hrtwl4f_158), 
	.wr_data_count(dkiwp80zfv5mktankwi_860), 
	.wr_rst_busy(piflb9crki2d8sg0dhm2n5nathbc6d06_643), 
	.rd_rst_busy(eskcracq9232fndg1tyd3wjq7rymu9z_341), 
	.overflow(u9tn4145qndef867a3hkpuafdg_840), 
	.underflow(jun07wp01jogy6pccob16m603gpls4wj_381), 
	.sbiterr(jfefdja5prr251y51golpty4y7i5ho9c_678), 
	.dbiterr(dzu9shpx5fgfrpgh1pksgw4j_8), 
	.almost_empty(f2ykp34c13ofjs6jz0lchmo4i_535), 
	.almost_full(ax9h4imypi4h4ia2v_462), 
	.wr_ack(xoqb4v6t57yll1kt245t9muf8a54g_287), 
	.data_valid(hbsjngrbta6na4seakf_713), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam ihkdvlxj96vrcmly_2645.WRITE_DATA_WIDTH = 1; 
defparam ihkdvlxj96vrcmly_2645.FIFO_WRITE_DEPTH = 512; 
defparam ihkdvlxj96vrcmly_2645.PROG_FULL_THRESH = 129; 
defparam ihkdvlxj96vrcmly_2645.PROG_EMPTY_THRESH = 129; 
defparam ihkdvlxj96vrcmly_2645.READ_MODE = "FWFT"; 
defparam ihkdvlxj96vrcmly_2645.WR_DATA_COUNT_WIDTH = 9; 
defparam ihkdvlxj96vrcmly_2645.RD_DATA_COUNT_WIDTH = 9; 
defparam ihkdvlxj96vrcmly_2645.DOUT_RESET_VALUE = "0"; 
defparam ihkdvlxj96vrcmly_2645.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_sync ihkdvlxj96vrcmly_2645 (
	.wr_en(n8o6mm4dp340u8u1nw5xgtr6fcmg_459),
	.din(e10v96rrwsd0qxzd4cnlcu33fkp_35),
	.rd_en(o5izjfa3bn3kepktzpm_839),
	.sleep(hgj4jager1ijf0c1cqzbj1o5gszvfsh_750),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(xwhtqmjpp59rq8qe8rz8y_233), 
	.dout(jhq0xi0msvi0or4jox95tkhmyxkqw_76), 
	.empty(c5a52m2epxxq4zp9ryirdbhiegcbazf_388), 
	.prog_full(mhs8p14xmglv79rgzz3g7sybae_570), 
	.full(etys76lah9phk6410qz2d28_533), 
	.rd_data_count(jv7mu60pb3wk2wh6_452), 
	.wr_data_count(veaodyjzp6mquxil6os1ug0k_772), 
	.wr_rst_busy(u6icths4vxluoiekfmyw84hl_465), 
	.rd_rst_busy(uckt8dgk5rmbbbk3_633), 
	.overflow(bdejqcxvqp28fmo3zc2yl_441), 
	.underflow(e7q0ti1shy582m07pwvwpbyoz_356), 
	.sbiterr(i78ippx9nkn8tlwd9_847), 
	.dbiterr(aq2marqcj8hzydhdwqjek0j9x_754), 
	.almost_empty(mrkcdpm7zm391bvwgud_423), 
	.almost_full(ng2j1qaalqpxl73r_238), 
	.wr_ack(e091helhdeygshg4h_469), 
	.data_valid(d72prkh08sk6w1pttmhz_728), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam iear8rakpq3nhcrzlhcfj00gkwqtxj_2287.WRITE_DATA_WIDTH = 160; 
defparam iear8rakpq3nhcrzlhcfj00gkwqtxj_2287.FIFO_WRITE_DEPTH = 256; 
defparam iear8rakpq3nhcrzlhcfj00gkwqtxj_2287.PROG_FULL_THRESH = 66; 
defparam iear8rakpq3nhcrzlhcfj00gkwqtxj_2287.PROG_EMPTY_THRESH = 66; 
defparam iear8rakpq3nhcrzlhcfj00gkwqtxj_2287.READ_MODE = "STD"; 
defparam iear8rakpq3nhcrzlhcfj00gkwqtxj_2287.WR_DATA_COUNT_WIDTH = 8; 
defparam iear8rakpq3nhcrzlhcfj00gkwqtxj_2287.RD_DATA_COUNT_WIDTH = 8; 
defparam iear8rakpq3nhcrzlhcfj00gkwqtxj_2287.DOUT_RESET_VALUE = "0"; 
defparam iear8rakpq3nhcrzlhcfj00gkwqtxj_2287.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async iear8rakpq3nhcrzlhcfj00gkwqtxj_2287 (
	.wr_en(nl0g93hk486pr3u4na1iv_276),
	.din(noi48gtjru7r7xtbv0p2nj99umbvm_203),
	.rd_en(f6mbr4q31nuj63zdkxql6ne_240),
	.sleep(rgyimmt26yp4kirzs5051_46),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(la7wzx86aisssbs1py87igt_233), 
	.dout(c3mnu3sjr5j4q4sdq40yyql76hg_381), 
	.empty(gtyaqhc755bxcxsd2hm49le_490), 
	.prog_full(tgh52r04wtj7n1t3gy2zp_134), 
	.full(cjsm95a3gb1bixooncijla7jr_779), 
	.rd_data_count(riu0y8rpe8w8ftk1lqyg8c5s1gopz_776), 
	.wr_data_count(fby2cwkixjfnp5hivkoj1m1j_90), 
	.wr_rst_busy(hnjluh942om0ctdm5wmw08ym65i3l_757), 
	.rd_rst_busy(ucyxvg1c4839i0xfi896l_871), 
	.overflow(puo9qxi6401nolrih5in5roe0e_150), 
	.underflow(v9ctlh326eorbe38q_456), 
	.sbiterr(okqf94py6wnpie1xmgpmtox6qu_274), 
	.dbiterr(sv0ps34ht8m4r9kjq8ba7_717), 
	.almost_empty(rwl43fm1rvg2g98qf9w84_764), 
	.almost_full(ellx8s9ahylvzqj0rbv3iubfjpkab_343), 
	.wr_ack(rap6y8r0q9pedn1ualq8_632), 
	.data_valid(g3rx0sjyc62di479o_65), 

	.wr_clk(clk_in_1), 

	.rd_clk(clk_out_1), 
	.rst(rst_in_1) 
); 

defparam ypujgwfofqr5u6g9b4zwzrfi_2364.WRITE_DATA_WIDTH = 24; 
defparam ypujgwfofqr5u6g9b4zwzrfi_2364.FIFO_WRITE_DEPTH = 256; 
defparam ypujgwfofqr5u6g9b4zwzrfi_2364.PROG_FULL_THRESH = 65; 
defparam ypujgwfofqr5u6g9b4zwzrfi_2364.PROG_EMPTY_THRESH = 65; 
defparam ypujgwfofqr5u6g9b4zwzrfi_2364.READ_MODE = "STD"; 
defparam ypujgwfofqr5u6g9b4zwzrfi_2364.WR_DATA_COUNT_WIDTH = 8; 
defparam ypujgwfofqr5u6g9b4zwzrfi_2364.RD_DATA_COUNT_WIDTH = 8; 
defparam ypujgwfofqr5u6g9b4zwzrfi_2364.DOUT_RESET_VALUE = "0"; 
defparam ypujgwfofqr5u6g9b4zwzrfi_2364.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_async ypujgwfofqr5u6g9b4zwzrfi_2364 (
	.wr_en(x6ohfsem97dvbic17o_827),
	.din(xqvrplmxh0v0uummml45ect8_716),
	.rd_en(zezkt8hymseazbj2rn9k8b_491),
	.sleep(rjyiyhlseuq77txcrp32l7fjg_310),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(gie8ks3qei5xthop6f605kbz4yqa_749), 
	.dout(fzs7segirfr7u0nl6yet_683), 
	.empty(dp74kzh7jglwrr225unyz6toqedh_710), 
	.prog_full(tlunbipojero0deghnpa3kv1i1f_45), 
	.full(bs3da6d31hwr1h1fnbs5lp7rlf_64), 
	.rd_data_count(s9sl58l4e1s0fa0k8eii_132), 
	.wr_data_count(is8o2jzzwqfo6lfgbzpb3_349), 
	.wr_rst_busy(d9vem75rw5gk4osmcc5jm8vebbc01oa8_830), 
	.rd_rst_busy(fnzje5ijp7z216bxkyu36emq3x_891), 
	.overflow(iozoan5c99c09y36ge7rqioykbkbp42_539), 
	.underflow(swbqkj98yylovglhe0erhi5_33), 
	.sbiterr(o1c7z1shx9mqe74jh_556), 
	.dbiterr(hjlj8s18isaz4jfwfd6is88e66w3r2_622), 
	.almost_empty(tgo8agtus4oh1lr13kpunlsaw4het4a_764), 
	.almost_full(v8lf1eitauv5seijmgto9688oceh1x_528), 
	.wr_ack(phefn9043x96tn4afqf1xp6f73m_574), 
	.data_valid(lrvegba9pm1gezdeyxszhhqr_570), 

	.wr_clk(clk_in_2), 

	.rd_clk(clk_out_2), 
	.rst(rst_in_2) 
); 

endmodule 
