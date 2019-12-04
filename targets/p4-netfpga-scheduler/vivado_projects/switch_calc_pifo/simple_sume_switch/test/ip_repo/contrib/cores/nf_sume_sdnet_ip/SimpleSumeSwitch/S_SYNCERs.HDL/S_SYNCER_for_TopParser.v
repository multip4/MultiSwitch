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
// File created: 2019/12/04 18:15:52
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
 input	 [19:0] tuple_in_TUPLE1_DATA ;
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
 output	 [19:0] tuple_out_TUPLE1_DATA ;
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






 reg	kqmaj3nmjoajl6gwm1u4vwbyrja_170;	 initial kqmaj3nmjoajl6gwm1u4vwbyrja_170 = 1'b0 ;
 wire	ynqgxfw4aog3t33r47xmoa41_822 ;
 wire [265:0] z2a5b26ptvj0jadli5vxkw182wvi33_845 ;
 wire	x7j0cfl7qiu65altezt8py8f6qb_743 ;
 wire	g35094sl3ek4ah2byirkdmk_203 ;
 wire	gfrno6wtoj1y1t1y6jbpn8g6eowp6g_362 ;
 wire [8:0] ikvbvz6xphi10dldhz9rw_485 ;
 wire [8:0] zxk8xlhztxhxup54ta599_736 ;
 wire	c9o1apljc6u951jzt_722 ;
 wire	i4qr6cbm62xu8zsti4hwp3q1hu0_134 ;
 wire	yue1f3fbv7rbjjh3iruwac7kyeinhk_629 ;
 wire	tgisyn1ktmjxrzd5xuz3iq1n_694 ;
 wire	lsbrra4i4bnwudeombxhvb7l7fhy_505 ;
 wire	tecdtpf75vloqztbtvd61_389 ;
 wire	cktiwexylf5grdsc2kw28e_529 ;
 wire	dnfw5poagnogirbuj_567 ;
 wire	y7eyvi1a50z747dlea_558 ;
 wire	s4vf28nl7xb1gkum6mx7_643 ;
 wire	l5nlz28y0ngx84kbtc_230 ;
 reg	kdnhwuycw4oovbkxn_40;	 initial kdnhwuycw4oovbkxn_40 = 1'b0 ;
 wire	p8t942conbcjfkm9ar0v6xz74eq0qsq_186 ;
 reg	w2kqj4r2rvcnw13d3xa7w_632;	 initial w2kqj4r2rvcnw13d3xa7w_632 = 1'b0 ;
 reg	lqc5axq81ep46yyzdw7fs_878;	 initial lqc5axq81ep46yyzdw7fs_878 = 1'b0 ;
 wire	e7n5cxrxn8g2t8zxhgymvodtazzw8e_736 ;
 wire [0:0] nm2fs4dbt6m8y6e7mc8sgq7azf00vkzz_352 ;
 wire	n9tgablx8mxxbnyah_225 ;
 wire	ofccqvveeiwblot5_563 ;
 wire	xjv7dtqlspt4jfy1rt4jz0vhovyh4ee_898 ;
 wire [8:0] w21z8hathl61b25lh08_515 ;
 wire [8:0] cd8eq3b10v02jzngpc3957nqq51p9_273 ;
 wire	u7qu1gm3co3tzmyopwrk84l1kk1aufs_514 ;
 wire	mfeiswhrsa290ue9hd2a1_737 ;
 wire	effh3vzu13l4yyniph_540 ;
 wire	guro394t9j3ajd1mdh2qh_856 ;
 wire	jq90bro2obm29kno1jm3t_662 ;
 wire	qjw7uisyuqdtys8r_695 ;
 wire	ay9s6s2qeqh5bg1mblpqxm3scp_165 ;
 wire	y7or9aw6qwkcymap4zxrqpp_669 ;
 wire	wvusa9dlq59imkg53l2_236 ;
 wire	nqeq6uz65b7rdon31tjt973oeip23b4x_351 ;
 reg [8:0] tan5uu4gnzco2mmmzionyn2bbs_429;	 initial tan5uu4gnzco2mmmzionyn2bbs_429 = 9'b000000000 ;
 reg	r0nji2kpfl7nh6d5czbpkw9154_897;	 initial r0nji2kpfl7nh6d5czbpkw9154_897 = 1'b0 ;
 wire	ncwd2dy1xtxq8zew_508 ;
 wire [159:0] qzkyyv81rti8sh76l4ec_284 ;
 wire	tlt57b74w0eptf26mr2_822 ;
 wire	hp33tu4eisvbiqpza1021sj_414 ;
 wire	os3edr4iinyilb6w7f9ds_178 ;
 wire [7:0] w9di6zdpj3nmrks6n03qj4_532 ;
 wire [7:0] m4awy8yg1y12tv35b6w04cg73d9uzr5n_906 ;
 wire	njgj4y9f87efnnycbxqr_411 ;
 wire	ldr7asnt17c4x5vyiwzs8v_869 ;
 wire	j6h45pu4xvs40hgzg7jse5rujkqnbs_625 ;
 wire	rxlutci6e20at3for7lznhfa_769 ;
 wire	gguz1afjta9uhhy0xbs1yj_434 ;
 wire	qcc5zheirb2edhrt28rqmgc7_862 ;
 wire	tlm6jqyvtd4orava8w_583 ;
 wire	b6pnftk4u5jstdiumjqlamk72z8_200 ;
 wire	dit305fd3odocqmazc4m0jv1cfi_28 ;
 wire	spcxakenrk11pvyfqsv64xxzfhgi_564 ;
 wire	qreljdwglxzfyzadxww2ddlz7vooe_557 ;
 wire [19:0] au2ukw5ja82zfq3ae1k7gy_177 ;
 wire	pefpi68psunzvy9ggbusonle_190 ;
 wire	f7f8io0mkjb38ckqay1529r_123 ;
 wire	p0m8tb3hpagek28ut4d4kdmfjo7ecf_31 ;
 wire [7:0] arm6jbvblrj4qiaph24kx9j_205 ;
 wire [7:0] am4c6vbnl4tgkplev3zngrd_792 ;
 wire	l1cy5pnj5t5rusa82b426_74 ;
 wire	aimlhqm8u24x9hoshlq6n_36 ;
 wire	t0zz5jtf3rxunhe9czgf2zje_145 ;
 wire	xk56r0w1px5pzlk92k0w_549 ;
 wire	q2bqe77t9jyu8c99mww7jica1bk2h6_124 ;
 wire	yxd10mj9p9l0ks721_382 ;
 wire	j25o5ewlaqqoryl8h6kgq_32 ;
 wire	enhejc0w6prm1nxglhp_374 ;
 wire	qq9slol0mqmtcbqa_876 ;
 wire	y0ou4fc3igc524i5xuldnt65gv45ghj_659 ;
 reg	fjyk38fjrwueq31lld83wmzvy_654;	 initial fjyk38fjrwueq31lld83wmzvy_654 = 1'b0 ;
 reg	rrt8oe7oq479bz8e8rh606_27;	 initial rrt8oe7oq479bz8e8rh606_27 = 1'b0 ;
 reg	px52k2n8v5nhcel3pnrmp_403;	 initial px52k2n8v5nhcel3pnrmp_403 = 1'b0 ;
 wire	wn34vncneie8252c_672 ;
 wire [265:0] mulzybdzh0woth7a5b6is8obvrkr6c_47 ;
 wire	hvbyvibx3glnw7nr6la2qyijq65266y_619 ;
 wire [265:0] nwtd7nwap7j0chq4juh2_422 ;
 wire	czgxcocpse2j0l2ex1kqe3bdtjp_409 ;
 wire	onrw6i68dee0jcn5fzl2_846 ;
 wire	uitwfrqwetvi5ij8_470 ;
 wire	te393jia38epuoo4kck8_583 ;
 wire	cbocxkyza8f2kr0zhmtc2k_576 ;
 wire	te8tbs6hu9t5rq27tpqm1bsaimm8xpe_599 ;
 wire	xpzzktokjc88nkwbf9x2kgmxq_9 ;
 wire	m0aqr8ht18rm5rlm6omn7cn1wh6n5b_722 ;
 wire	jyigpcw60bvzs34db1be0_128 ;
 wire	fuf2iw5g5slbzlbx3zkq_51 ;
 wire [5:0] motziaqabtg618i9c4wbqmyly42_101 ;
 wire [255:0] t6fhqizf95kpl14ozh95a77r2mwd9s3c_90 ;
 wire	l0k2cbsmgsh2euhpetcuml9qhx_175 ;
 wire	til3esru8afpfcu56rn3_62 ;
 wire	kpwsnusdjkyfao66octsrpb5n7r_574 ;
 wire	ohffaeywp8bacly2x7mhb1_169 ;
 wire	gwe8q5v7ccozkruk545vbmbootrxm6g_44 ;
 wire [0:0] ipow8p3ndvrzylku5hlk_705 ;
 wire	zadg3cl09juko13zft0e7k9daoqxzo1_676 ;
 wire	wskkjl88udxzx3kz2sf12dz9_74 ;
 wire [8:0] cvuflthfqmc3mcbizgarz5_606 ;
 wire	gyc1wr7lom4oyg99m1g2ht06d_33 ;
 wire	ksfds56lgqdtuoel47p1mtu4b5_140 ;
 wire	hxtin4t02ywoa8s9az7ge2h_32 ;
 wire	aq41qvhpha2gtxeszoxvi2t_69 ;
 wire	jncp7wpzqc5v3e5uor_649 ;
 wire	dgsyux7cx6dk0va7kn6h_355 ;
 wire	ro8dbx0p2v8lbc1juimye60id0azj_84 ;
 wire [159:0] it8ocmvu0zpxgir3fkfol_58 ;
 wire	nrynlq8gyubwo1vzrq7pf1pqludg1pt8_383 ;
 wire [159:0] tcq2rulb468lvo2ep6othsevz_364 ;
 wire	y5qm6lm3r4uwjs51a2r_831 ;
 wire	rdrhdh784986iqzl6pcyr9nvl1mfod_176 ;
 wire	jpnrkchen97seg1gryfj_350 ;
 wire [19:0] j6dldtpui62vdf1srx4uyvbiy66_23 ;
 wire	v8vltrjba64cbf9vl_576 ;
 wire [19:0] o8v4rukq0o3bqhvbac83d255gz8xug2_844 ;
 wire	wcb5v8vvr0q4nu9fn3_650 ;
 wire	ul76y0f1klfodr9t32b24qnzqpj_567 ;
 wire	qpz4hkvo5qzbvmlylvdyk803_441 ;
 wire	j4jxlxbajjghtxtu6d5gi7_118 ;
 wire	gs4li29oc43kwphwprptw7nb_24 ;


 assign wn34vncneie8252c_672 = 
	 ~(backpressure_in) ;
 assign mulzybdzh0woth7a5b6is8obvrkr6c_47 = 
	{packet_in_PACKET2_SOF, packet_in_PACKET2_EOF, packet_in_PACKET2_VAL, packet_in_PACKET2_DAT, packet_in_PACKET2_CNT, packet_in_PACKET2_ERR} ;
 assign hvbyvibx3glnw7nr6la2qyijq65266y_619 	= packet_in_PACKET2_VAL ;
 assign nwtd7nwap7j0chq4juh2_422 	= mulzybdzh0woth7a5b6is8obvrkr6c_47[265:0] ;
 assign czgxcocpse2j0l2ex1kqe3bdtjp_409 = 
	aq41qvhpha2gtxeszoxvi2t_69 | j4jxlxbajjghtxtu6d5gi7_118 ;
 assign onrw6i68dee0jcn5fzl2_846 = 
	1'b0 ;
 assign uitwfrqwetvi5ij8_470 = 
	1'b1 ;
 assign te393jia38epuoo4kck8_583 = 
	 ~(p8t942conbcjfkm9ar0v6xz74eq0qsq_186) ;
 assign cbocxkyza8f2kr0zhmtc2k_576 = 
	wn34vncneie8252c_672 & dgsyux7cx6dk0va7kn6h_355 & czgxcocpse2j0l2ex1kqe3bdtjp_409 ;
 assign te8tbs6hu9t5rq27tpqm1bsaimm8xpe_599 	= cbocxkyza8f2kr0zhmtc2k_576 ;
 assign xpzzktokjc88nkwbf9x2kgmxq_9 	= te8tbs6hu9t5rq27tpqm1bsaimm8xpe_599 ;
 assign m0aqr8ht18rm5rlm6omn7cn1wh6n5b_722 = 
	1'b0 ;
 assign jyigpcw60bvzs34db1be0_128 = 
	 ~(x7j0cfl7qiu65altezt8py8f6qb_743) ;
 assign fuf2iw5g5slbzlbx3zkq_51 	= z2a5b26ptvj0jadli5vxkw182wvi33_845[0] ;
 assign motziaqabtg618i9c4wbqmyly42_101 	= z2a5b26ptvj0jadli5vxkw182wvi33_845[6:1] ;
 assign t6fhqizf95kpl14ozh95a77r2mwd9s3c_90 	= z2a5b26ptvj0jadli5vxkw182wvi33_845[262:7] ;
 assign l0k2cbsmgsh2euhpetcuml9qhx_175 	= z2a5b26ptvj0jadli5vxkw182wvi33_845[263] ;
 assign til3esru8afpfcu56rn3_62 	= z2a5b26ptvj0jadli5vxkw182wvi33_845[264] ;
 assign kpwsnusdjkyfao66octsrpb5n7r_574 	= z2a5b26ptvj0jadli5vxkw182wvi33_845[265] ;
 assign ohffaeywp8bacly2x7mhb1_169 = 
	lqc5axq81ep46yyzdw7fs_878 & l0k2cbsmgsh2euhpetcuml9qhx_175 ;
 assign gwe8q5v7ccozkruk545vbmbootrxm6g_44 	= packet_in_PACKET2_VAL ;
 assign ipow8p3ndvrzylku5hlk_705 = packet_in_PACKET2_SOF ;
 assign zadg3cl09juko13zft0e7k9daoqxzo1_676 	= te8tbs6hu9t5rq27tpqm1bsaimm8xpe_599 ;
 assign wskkjl88udxzx3kz2sf12dz9_74 = 
	1'b0 ;
 assign cvuflthfqmc3mcbizgarz5_606 	= w21z8hathl61b25lh08_515[8:0] ;
 assign gyc1wr7lom4oyg99m1g2ht06d_33 = (
	((cvuflthfqmc3mcbizgarz5_606 != tan5uu4gnzco2mmmzionyn2bbs_429))?1'b1:
	0)  ;
 assign ksfds56lgqdtuoel47p1mtu4b5_140 = nm2fs4dbt6m8y6e7mc8sgq7azf00vkzz_352 ;
 assign hxtin4t02ywoa8s9az7ge2h_32 = nm2fs4dbt6m8y6e7mc8sgq7azf00vkzz_352 ;
 assign aq41qvhpha2gtxeszoxvi2t_69 = 
	 ~(hxtin4t02ywoa8s9az7ge2h_32) ;
 assign jncp7wpzqc5v3e5uor_649 	= n9tgablx8mxxbnyah_225 ;
 assign dgsyux7cx6dk0va7kn6h_355 = 
	 ~(n9tgablx8mxxbnyah_225) ;
 assign ro8dbx0p2v8lbc1juimye60id0azj_84 = 
	wn34vncneie8252c_672 & j4jxlxbajjghtxtu6d5gi7_118 & dgsyux7cx6dk0va7kn6h_355 & ksfds56lgqdtuoel47p1mtu4b5_140 ;
 assign it8ocmvu0zpxgir3fkfol_58 = 
	tuple_in_TUPLE0_DATA ;
 assign nrynlq8gyubwo1vzrq7pf1pqludg1pt8_383 	= tuple_in_TUPLE0_VALID ;
 assign tcq2rulb468lvo2ep6othsevz_364 	= it8ocmvu0zpxgir3fkfol_58[159:0] ;
 assign y5qm6lm3r4uwjs51a2r_831 = 
	 ~(tlt57b74w0eptf26mr2_822) ;
 assign rdrhdh784986iqzl6pcyr9nvl1mfod_176 	= ro8dbx0p2v8lbc1juimye60id0azj_84 ;
 assign jpnrkchen97seg1gryfj_350 = 
	1'b0 ;
 assign j6dldtpui62vdf1srx4uyvbiy66_23 = 
	tuple_in_TUPLE1_DATA ;
 assign v8vltrjba64cbf9vl_576 	= tuple_in_TUPLE1_VALID ;
 assign o8v4rukq0o3bqhvbac83d255gz8xug2_844 	= j6dldtpui62vdf1srx4uyvbiy66_23[19:0] ;
 assign wcb5v8vvr0q4nu9fn3_650 = 
	 ~(pefpi68psunzvy9ggbusonle_190) ;
 assign ul76y0f1klfodr9t32b24qnzqpj_567 	= ro8dbx0p2v8lbc1juimye60id0azj_84 ;
 assign qpz4hkvo5qzbvmlylvdyk803_441 = 
	1'b0 ;
 assign j4jxlxbajjghtxtu6d5gi7_118 = 
	jyigpcw60bvzs34db1be0_128 & y5qm6lm3r4uwjs51a2r_831 & wcb5v8vvr0q4nu9fn3_650 ;
 assign gs4li29oc43kwphwprptw7nb_24 = 
	fjyk38fjrwueq31lld83wmzvy_654 | rrt8oe7oq479bz8e8rh606_27 | px52k2n8v5nhcel3pnrmp_403 ;
 assign packet_out_PACKET2_SOF 	= kpwsnusdjkyfao66octsrpb5n7r_574 ;
 assign packet_out_PACKET2_EOF 	= til3esru8afpfcu56rn3_62 ;
 assign packet_out_PACKET2_VAL 	= ohffaeywp8bacly2x7mhb1_169 ;
 assign packet_out_PACKET2_DAT 	= t6fhqizf95kpl14ozh95a77r2mwd9s3c_90[255:0] ;
 assign packet_out_PACKET2_CNT 	= motziaqabtg618i9c4wbqmyly42_101[5:0] ;
 assign packet_out_PACKET2_ERR 	= fuf2iw5g5slbzlbx3zkq_51 ;
 assign packet_in_PACKET2_RDY 	= packet_out_PACKET2_RDY ;
 assign tuple_out_TUPLE0_VALID 	= r0nji2kpfl7nh6d5czbpkw9154_897 ;
 assign tuple_out_TUPLE0_DATA 	= qzkyyv81rti8sh76l4ec_284[159:0] ;
 assign tuple_out_TUPLE1_VALID 	= r0nji2kpfl7nh6d5czbpkw9154_897 ;
 assign tuple_out_TUPLE1_DATA 	= au2ukw5ja82zfq3ae1k7gy_177[19:0] ;


assign l5nlz28y0ngx84kbtc_230 = (
	((te8tbs6hu9t5rq27tpqm1bsaimm8xpe_599 == 1'b1))?uitwfrqwetvi5ij8_470 :
	((wn34vncneie8252c_672 == 1'b1))?onrw6i68dee0jcn5fzl2_846 :
	kdnhwuycw4oovbkxn_40 ) ;

assign p8t942conbcjfkm9ar0v6xz74eq0qsq_186 = (
	((kdnhwuycw4oovbkxn_40 == 1'b1) && (wn34vncneie8252c_672 == 1'b1))?onrw6i68dee0jcn5fzl2_846 :
	kdnhwuycw4oovbkxn_40 ) ;



always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	kqmaj3nmjoajl6gwm1u4vwbyrja_170 <= 1'b0 ;
	kdnhwuycw4oovbkxn_40 <= 1'b0 ;
	w2kqj4r2rvcnw13d3xa7w_632 <= 1'b0 ;
	lqc5axq81ep46yyzdw7fs_878 <= 1'b0 ;
	tan5uu4gnzco2mmmzionyn2bbs_429 <= 9'b000000000 ;
	fjyk38fjrwueq31lld83wmzvy_654 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		kqmaj3nmjoajl6gwm1u4vwbyrja_170 <= backpressure_in ;
		kdnhwuycw4oovbkxn_40 <= l5nlz28y0ngx84kbtc_230 ;
		w2kqj4r2rvcnw13d3xa7w_632 <= jyigpcw60bvzs34db1be0_128 ;
		lqc5axq81ep46yyzdw7fs_878 <= te8tbs6hu9t5rq27tpqm1bsaimm8xpe_599 ;
		tan5uu4gnzco2mmmzionyn2bbs_429 <= cvuflthfqmc3mcbizgarz5_606 ;
		fjyk38fjrwueq31lld83wmzvy_654 <= g35094sl3ek4ah2byirkdmk_203 ;
		backpressure_out <= gs4li29oc43kwphwprptw7nb_24 ;
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	r0nji2kpfl7nh6d5czbpkw9154_897 <= 1'b0 ;
	rrt8oe7oq479bz8e8rh606_27 <= 1'b0 ;
   end
  else
  begin
		r0nji2kpfl7nh6d5czbpkw9154_897 <= ro8dbx0p2v8lbc1juimye60id0azj_84 ;
		rrt8oe7oq479bz8e8rh606_27 <= hp33tu4eisvbiqpza1021sj_414 ;
  end
end

always @(posedge clk_out_2)
begin
  if (rst_in_0) 
  begin
	px52k2n8v5nhcel3pnrmp_403 <= 1'b0 ;
   end
  else
  begin
		px52k2n8v5nhcel3pnrmp_403 <= f7f8io0mkjb38ckqay1529r_123 ;
  end
end

defparam ta4pwszaz1adkzee26tf1np_2099.WRITE_DATA_WIDTH = 266; 
defparam ta4pwszaz1adkzee26tf1np_2099.FIFO_WRITE_DEPTH = 512; 
defparam ta4pwszaz1adkzee26tf1np_2099.PROG_FULL_THRESH = 129; 
defparam ta4pwszaz1adkzee26tf1np_2099.PROG_EMPTY_THRESH = 129; 
defparam ta4pwszaz1adkzee26tf1np_2099.READ_MODE = "STD"; 
defparam ta4pwszaz1adkzee26tf1np_2099.WR_DATA_COUNT_WIDTH = 9; 
defparam ta4pwszaz1adkzee26tf1np_2099.RD_DATA_COUNT_WIDTH = 9; 
defparam ta4pwszaz1adkzee26tf1np_2099.DOUT_RESET_VALUE = "0"; 
defparam ta4pwszaz1adkzee26tf1np_2099.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_sync ta4pwszaz1adkzee26tf1np_2099 (
	.wr_en(hvbyvibx3glnw7nr6la2qyijq65266y_619),
	.din(nwtd7nwap7j0chq4juh2_422),
	.rd_en(xpzzktokjc88nkwbf9x2kgmxq_9),
	.sleep(m0aqr8ht18rm5rlm6omn7cn1wh6n5b_722),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(ynqgxfw4aog3t33r47xmoa41_822), 
	.dout(z2a5b26ptvj0jadli5vxkw182wvi33_845), 
	.empty(x7j0cfl7qiu65altezt8py8f6qb_743), 
	.prog_full(g35094sl3ek4ah2byirkdmk_203), 
	.full(gfrno6wtoj1y1t1y6jbpn8g6eowp6g_362), 
	.rd_data_count(ikvbvz6xphi10dldhz9rw_485), 
	.wr_data_count(zxk8xlhztxhxup54ta599_736), 
	.wr_rst_busy(c9o1apljc6u951jzt_722), 
	.rd_rst_busy(i4qr6cbm62xu8zsti4hwp3q1hu0_134), 
	.overflow(yue1f3fbv7rbjjh3iruwac7kyeinhk_629), 
	.underflow(tgisyn1ktmjxrzd5xuz3iq1n_694), 
	.sbiterr(lsbrra4i4bnwudeombxhvb7l7fhy_505), 
	.dbiterr(tecdtpf75vloqztbtvd61_389), 
	.almost_empty(cktiwexylf5grdsc2kw28e_529), 
	.almost_full(dnfw5poagnogirbuj_567), 
	.wr_ack(y7eyvi1a50z747dlea_558), 
	.data_valid(s4vf28nl7xb1gkum6mx7_643), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam uj6pjud7bjymawba6z0vffd_545.WRITE_DATA_WIDTH = 1; 
defparam uj6pjud7bjymawba6z0vffd_545.FIFO_WRITE_DEPTH = 512; 
defparam uj6pjud7bjymawba6z0vffd_545.PROG_FULL_THRESH = 129; 
defparam uj6pjud7bjymawba6z0vffd_545.PROG_EMPTY_THRESH = 129; 
defparam uj6pjud7bjymawba6z0vffd_545.READ_MODE = "FWFT"; 
defparam uj6pjud7bjymawba6z0vffd_545.WR_DATA_COUNT_WIDTH = 9; 
defparam uj6pjud7bjymawba6z0vffd_545.RD_DATA_COUNT_WIDTH = 9; 
defparam uj6pjud7bjymawba6z0vffd_545.DOUT_RESET_VALUE = "0"; 
defparam uj6pjud7bjymawba6z0vffd_545.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_sync uj6pjud7bjymawba6z0vffd_545 (
	.wr_en(gwe8q5v7ccozkruk545vbmbootrxm6g_44),
	.din(ipow8p3ndvrzylku5hlk_705),
	.rd_en(zadg3cl09juko13zft0e7k9daoqxzo1_676),
	.sleep(wskkjl88udxzx3kz2sf12dz9_74),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(e7n5cxrxn8g2t8zxhgymvodtazzw8e_736), 
	.dout(nm2fs4dbt6m8y6e7mc8sgq7azf00vkzz_352), 
	.empty(n9tgablx8mxxbnyah_225), 
	.prog_full(ofccqvveeiwblot5_563), 
	.full(xjv7dtqlspt4jfy1rt4jz0vhovyh4ee_898), 
	.rd_data_count(w21z8hathl61b25lh08_515), 
	.wr_data_count(cd8eq3b10v02jzngpc3957nqq51p9_273), 
	.wr_rst_busy(u7qu1gm3co3tzmyopwrk84l1kk1aufs_514), 
	.rd_rst_busy(mfeiswhrsa290ue9hd2a1_737), 
	.overflow(effh3vzu13l4yyniph_540), 
	.underflow(guro394t9j3ajd1mdh2qh_856), 
	.sbiterr(jq90bro2obm29kno1jm3t_662), 
	.dbiterr(qjw7uisyuqdtys8r_695), 
	.almost_empty(ay9s6s2qeqh5bg1mblpqxm3scp_165), 
	.almost_full(y7or9aw6qwkcymap4zxrqpp_669), 
	.wr_ack(wvusa9dlq59imkg53l2_236), 
	.data_valid(nqeq6uz65b7rdon31tjt973oeip23b4x_351), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam kgnophf5otjeekqvkes4_2222.WRITE_DATA_WIDTH = 160; 
defparam kgnophf5otjeekqvkes4_2222.FIFO_WRITE_DEPTH = 256; 
defparam kgnophf5otjeekqvkes4_2222.PROG_FULL_THRESH = 66; 
defparam kgnophf5otjeekqvkes4_2222.PROG_EMPTY_THRESH = 66; 
defparam kgnophf5otjeekqvkes4_2222.READ_MODE = "STD"; 
defparam kgnophf5otjeekqvkes4_2222.WR_DATA_COUNT_WIDTH = 8; 
defparam kgnophf5otjeekqvkes4_2222.RD_DATA_COUNT_WIDTH = 8; 
defparam kgnophf5otjeekqvkes4_2222.DOUT_RESET_VALUE = "0"; 
defparam kgnophf5otjeekqvkes4_2222.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async kgnophf5otjeekqvkes4_2222 (
	.wr_en(nrynlq8gyubwo1vzrq7pf1pqludg1pt8_383),
	.din(tcq2rulb468lvo2ep6othsevz_364),
	.rd_en(rdrhdh784986iqzl6pcyr9nvl1mfod_176),
	.sleep(jpnrkchen97seg1gryfj_350),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(ncwd2dy1xtxq8zew_508), 
	.dout(qzkyyv81rti8sh76l4ec_284), 
	.empty(tlt57b74w0eptf26mr2_822), 
	.prog_full(hp33tu4eisvbiqpza1021sj_414), 
	.full(os3edr4iinyilb6w7f9ds_178), 
	.rd_data_count(w9di6zdpj3nmrks6n03qj4_532), 
	.wr_data_count(m4awy8yg1y12tv35b6w04cg73d9uzr5n_906), 
	.wr_rst_busy(njgj4y9f87efnnycbxqr_411), 
	.rd_rst_busy(ldr7asnt17c4x5vyiwzs8v_869), 
	.overflow(j6h45pu4xvs40hgzg7jse5rujkqnbs_625), 
	.underflow(rxlutci6e20at3for7lznhfa_769), 
	.sbiterr(gguz1afjta9uhhy0xbs1yj_434), 
	.dbiterr(qcc5zheirb2edhrt28rqmgc7_862), 
	.almost_empty(tlm6jqyvtd4orava8w_583), 
	.almost_full(b6pnftk4u5jstdiumjqlamk72z8_200), 
	.wr_ack(dit305fd3odocqmazc4m0jv1cfi_28), 
	.data_valid(spcxakenrk11pvyfqsv64xxzfhgi_564), 

	.wr_clk(clk_in_1), 

	.rd_clk(clk_out_1), 
	.rst(rst_in_1) 
); 

defparam n7iwrlf40gd06wo4vwudzelpwbh3_2295.WRITE_DATA_WIDTH = 20; 
defparam n7iwrlf40gd06wo4vwudzelpwbh3_2295.FIFO_WRITE_DEPTH = 256; 
defparam n7iwrlf40gd06wo4vwudzelpwbh3_2295.PROG_FULL_THRESH = 65; 
defparam n7iwrlf40gd06wo4vwudzelpwbh3_2295.PROG_EMPTY_THRESH = 65; 
defparam n7iwrlf40gd06wo4vwudzelpwbh3_2295.READ_MODE = "STD"; 
defparam n7iwrlf40gd06wo4vwudzelpwbh3_2295.WR_DATA_COUNT_WIDTH = 8; 
defparam n7iwrlf40gd06wo4vwudzelpwbh3_2295.RD_DATA_COUNT_WIDTH = 8; 
defparam n7iwrlf40gd06wo4vwudzelpwbh3_2295.DOUT_RESET_VALUE = "0"; 
defparam n7iwrlf40gd06wo4vwudzelpwbh3_2295.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_async n7iwrlf40gd06wo4vwudzelpwbh3_2295 (
	.wr_en(v8vltrjba64cbf9vl_576),
	.din(o8v4rukq0o3bqhvbac83d255gz8xug2_844),
	.rd_en(ul76y0f1klfodr9t32b24qnzqpj_567),
	.sleep(qpz4hkvo5qzbvmlylvdyk803_441),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(qreljdwglxzfyzadxww2ddlz7vooe_557), 
	.dout(au2ukw5ja82zfq3ae1k7gy_177), 
	.empty(pefpi68psunzvy9ggbusonle_190), 
	.prog_full(f7f8io0mkjb38ckqay1529r_123), 
	.full(p0m8tb3hpagek28ut4d4kdmfjo7ecf_31), 
	.rd_data_count(arm6jbvblrj4qiaph24kx9j_205), 
	.wr_data_count(am4c6vbnl4tgkplev3zngrd_792), 
	.wr_rst_busy(l1cy5pnj5t5rusa82b426_74), 
	.rd_rst_busy(aimlhqm8u24x9hoshlq6n_36), 
	.overflow(t0zz5jtf3rxunhe9czgf2zje_145), 
	.underflow(xk56r0w1px5pzlk92k0w_549), 
	.sbiterr(q2bqe77t9jyu8c99mww7jica1bk2h6_124), 
	.dbiterr(yxd10mj9p9l0ks721_382), 
	.almost_empty(j25o5ewlaqqoryl8h6kgq_32), 
	.almost_full(enhejc0w6prm1nxglhp_374), 
	.wr_ack(qq9slol0mqmtcbqa_876), 
	.data_valid(y0ou4fc3igc524i5xuldnt65gv45ghj_659), 

	.wr_clk(clk_in_2), 

	.rd_clk(clk_out_2), 
	.rst(rst_in_2) 
); 

endmodule 
