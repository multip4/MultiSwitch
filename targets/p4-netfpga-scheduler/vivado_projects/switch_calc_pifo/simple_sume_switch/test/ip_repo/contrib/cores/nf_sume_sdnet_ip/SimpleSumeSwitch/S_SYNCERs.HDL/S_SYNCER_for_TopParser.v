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
// File created: 2020/04/16 20:38:09
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
 input	 [18:0] tuple_in_TUPLE1_DATA ;
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
 output	 [18:0] tuple_out_TUPLE1_DATA ;
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






 reg	rz1q2t2ixbaxdm1a0dft_609;	 initial rz1q2t2ixbaxdm1a0dft_609 = 1'b0 ;
 wire	upgfhzya6vv0ef00l13687i5lic0x2rn_741 ;
 wire [265:0] m2ny8ed88ae61aadur861brn_353 ;
 wire	q4dc5p5fbm2x4xcrkcf3_800 ;
 wire	fucf7xdy6jj8iij8nkl8_129 ;
 wire	jjajcchzcvcmsrqra9qkmoi_806 ;
 wire [8:0] jas3zvwswy7dc6kny2stcje_663 ;
 wire [8:0] n0zxp1846p0extxp4oxxea_750 ;
 wire	h64ukf3ipmzi4lavtv704hh1x087_115 ;
 wire	g6porxozzi8p79ui96177d33eqajyb4d_615 ;
 wire	zl8yabm15y7u3q19ydz0fdql_423 ;
 wire	m9vlq3pdl5ssgxnzl0an1tzk2iormr_771 ;
 wire	kzen4keayygiqoi8bads18bj6w2aj_82 ;
 wire	khtuzqqm53hezhq0ebgqemp_551 ;
 wire	mbevqxsqs35upzp9f4d_717 ;
 wire	n5ixc5887l042yqowokq03val0k1_30 ;
 wire	xnady31thb8q5x9m1etya02dthqs_35 ;
 wire	k7lg27iiw82jodqm1ey_552 ;
 wire	jdypvgonjziirx2aexwluv3jz1_347 ;
 reg	t9uiqhzc17fyypft4j0mqas_32;	 initial t9uiqhzc17fyypft4j0mqas_32 = 1'b0 ;
 wire	wmafqzyy0jpfnio5lfsxes_581 ;
 reg	tvfd3cwq8ba5tkv80l931bknz4r_163;	 initial tvfd3cwq8ba5tkv80l931bknz4r_163 = 1'b0 ;
 reg	uxzwccd41wn7rfo1b0e0641yyqvxy_199;	 initial uxzwccd41wn7rfo1b0e0641yyqvxy_199 = 1'b0 ;
 wire	hak6bj4gbd87e9ec6rglsshu1nax_322 ;
 wire [0:0] no23d6qqh464mb2y6qg8k8e83_25 ;
 wire	d2jmlu3lw73rrt6yw0aoku81b10xl_397 ;
 wire	lalzyfypggybv8ve9d1gd8ijebj_621 ;
 wire	fq7msy3xtzeztzpm3vab35z0ep2fv_177 ;
 wire [8:0] s4i9wffr16pj16rj3_576 ;
 wire [8:0] olzoj0obd6px0o4drkicv1ymc_260 ;
 wire	c6vpdriwt1421vsk4pvos1ayz_548 ;
 wire	m9eu6s6d3n8d6e1313iij1o_15 ;
 wire	mv4c3zdp3jwiqi670gwzd_445 ;
 wire	f738gn5rtt8nbk96e42w1lqvw1h_514 ;
 wire	h9609gm1yw8og81oxp7wbtuhvqkt_775 ;
 wire	vu8ndn11ibgqabfc7ql1gjkw41_610 ;
 wire	covmrlo6xvu9aiomd97k7az_824 ;
 wire	nbqsrlnx8zl6cma72slyan9gp_73 ;
 wire	jc691ri27ujbajb6zb0vc77qpmenvhs_441 ;
 wire	zhdh6euweojsks6c0cnn_129 ;
 reg [8:0] jay3f5r68n26ew999zqjcaob4q_80;	 initial jay3f5r68n26ew999zqjcaob4q_80 = 9'b000000000 ;
 reg	xnroudzwknq9tf8g2zlsf_291;	 initial xnroudzwknq9tf8g2zlsf_291 = 1'b0 ;
 wire	pih48lelh5gyngsipn0wj3ye578op_214 ;
 wire [159:0] gs5to6pojcoii72aq_700 ;
 wire	gtx1gqvqstw88yp6ng_468 ;
 wire	xkbrzed1iw3kaeobn_505 ;
 wire	zpds4gmq1j49ayvlnxz_96 ;
 wire [7:0] apocunkag3zs7n2tvfe4ua5fud8g_79 ;
 wire [7:0] cm4pu4rte5qakr7ebncbc18w0ax892_851 ;
 wire	nbnubosudv7ylmnulet8puhun_550 ;
 wire	ck225n5apjzok7lzlof_165 ;
 wire	bmbzwmemx935v3s03szuhar4m512jxm_431 ;
 wire	uscbcp32ciba3u0it0xydo0l3p9w_662 ;
 wire	ysji8c6a7hy2x1jo5_700 ;
 wire	nf1tqae3q4ada57sf6ghyzll18exmtk_724 ;
 wire	fb685o5dk9inv07wucjuebqur5_427 ;
 wire	l4getzd4h9itjrxh8ktjyy7r25s_681 ;
 wire	px55cg7u5mxh78s2edwqa56zkm8dz21_345 ;
 wire	a6hhqli4e09ltfq7tb_75 ;
 wire	b2pbuxaw3ll9mqjj_553 ;
 wire [18:0] ij0mne5pno3foiwtbvjt6_394 ;
 wire	g4rleau62tmdxn2tjmzmdk2l_375 ;
 wire	lrzvqbozbhxr3jozniga4evzek_480 ;
 wire	othyeu2942s0rxkf6jgs4e0ugc3f3x2_834 ;
 wire [7:0] nrmsgkfv4qu6ljeve7c60qudff0g_543 ;
 wire [7:0] bkj9scjh2n1y0ysrek5_885 ;
 wire	x3kuvuv8qeay2tiora5_171 ;
 wire	x97d557af873467hjfurbm_257 ;
 wire	yfsk313pc8o91gaw7dhm_168 ;
 wire	hcggr5xc7hu2wvleht_62 ;
 wire	ruu0frjj80a20y7t4k3aln02mig_312 ;
 wire	gn0qskso5m8hcf06ap9yk17279y_736 ;
 wire	om0zrqkph6fxv7nhz_719 ;
 wire	kyuljfzr2ektp75dzjdxkusgv52ve4a_766 ;
 wire	ngfpvn7n9635f8c8d1o_514 ;
 wire	bxp7xubkytoc8codrcgigopp89s_617 ;
 reg	amylttcjzyvais1h_3;	 initial amylttcjzyvais1h_3 = 1'b0 ;
 reg	whmwkoiec710yn4j15ljqcr_317;	 initial whmwkoiec710yn4j15ljqcr_317 = 1'b0 ;
 reg	nb28avsyi6uxwi1hn2p2kyg8h_761;	 initial nb28avsyi6uxwi1hn2p2kyg8h_761 = 1'b0 ;
 wire	zy40b9db4be9hxsm_355 ;
 wire [265:0] zncx78kif8ttv8razztu_385 ;
 wire	z4cmkfaoya2b49sks2ch_538 ;
 wire [265:0] nw3kwe3kd8kb0ur7cn_186 ;
 wire	ir2t8r8lpzg96v79l5iv5u_832 ;
 wire	zdda20bw9ups77tca7x0yhu513_542 ;
 wire	sxggys48d059cg9a2se23e0pby9w_386 ;
 wire	h0c5yxl8g1w7n1ojwyh_396 ;
 wire	e95g9qii2nwuhxturn_546 ;
 wire	lctlhxvh5r85sy6vy9rnedcye_559 ;
 wire	hit43rkq9srx7dhcb3qda62rox_474 ;
 wire	p47h9dg8ddkpu8x20_518 ;
 wire	nvxp9gcu1w2b9jzu1_759 ;
 wire	w8v3v4yo9w5gub8d_640 ;
 wire [5:0] tsqttxhtkind05sg9e7rhqkz5t_506 ;
 wire [255:0] heb7btmvvujgtwzyk3yne0srrxdyf_636 ;
 wire	fnvassyv2ju7sneznk3yugqpj3afmcm_536 ;
 wire	uvzh374erhrhl5uolk0qsdb2lvpn6zh_503 ;
 wire	ffn24914vtuvkiduiahaocy0_505 ;
 wire	zg56cy52pepwh02md8rni18wy5x1_305 ;
 wire	z36ghdt2egzlrqn7v8crmfm53j6vcmgx_474 ;
 wire [0:0] td3hsb9tmthzmywiets_78 ;
 wire	kbu0hp9o7qxi5if9ppaosr7ye4n_325 ;
 wire	t6ntcbyi54osslzvjckoxymprc0udrxm_455 ;
 wire [8:0] mgm6z2ejz2ropkotbvqxu8c0xvm4n31_485 ;
 wire	as9xqobd5y00m3p0i9bo_432 ;
 wire	nj6uwsa1kp0l0qdo1n5bpaa0ytt_579 ;
 wire	wpm4hh7etp8kv8niz3vbr1cwjiqklk_725 ;
 wire	rjglyehtk79h7r5qquy_447 ;
 wire	tf3kdelor5hva61j4ezj87e96zi_786 ;
 wire	z959jsmtg4kk266la2qdo33muwafpb8n_59 ;
 wire	nho84z1mq3hgeqq1kb3akf1fsaj0bfdw_674 ;
 wire [159:0] r1y94hv4n8qzrv7qgo9h2bavkmz_674 ;
 wire	ax7hlniwa7i5macozw0k6h3k020el_847 ;
 wire [159:0] uk4mtcllz8u2wcbokixvjbzohvs34iw3_112 ;
 wire	zv8hpklxz1t06pyixl7spqqkthtxobj_363 ;
 wire	tmrrdoxzzkbeare5nmt2hoiqx_563 ;
 wire	u1pktojxqn330autzxxkcrvzqmcx_720 ;
 wire [18:0] nnxch772b96ksvopzwbp_594 ;
 wire	dga2h0bcpx0al83ruwt4efcyk_821 ;
 wire [18:0] cuys409ky3cevym1vdnyyfe4ecq_492 ;
 wire	w23vcior1lpgrawmu_82 ;
 wire	s2zv6k3bw4ufvz6mv4vl_683 ;
 wire	lx0yl9yg38d50y1z72hnz9ym5j9q_522 ;
 wire	f29wxr3xtovfwrcxo9zmv9va24oup2_626 ;
 wire	xcphsupufx726krkhfxs8i_874 ;


 assign zy40b9db4be9hxsm_355 = 
	 ~(backpressure_in) ;
 assign zncx78kif8ttv8razztu_385 = 
	{packet_in_PACKET2_SOF, packet_in_PACKET2_EOF, packet_in_PACKET2_VAL, packet_in_PACKET2_DAT, packet_in_PACKET2_CNT, packet_in_PACKET2_ERR} ;
 assign z4cmkfaoya2b49sks2ch_538 	= packet_in_PACKET2_VAL ;
 assign nw3kwe3kd8kb0ur7cn_186 	= zncx78kif8ttv8razztu_385[265:0] ;
 assign ir2t8r8lpzg96v79l5iv5u_832 = 
	rjglyehtk79h7r5qquy_447 | f29wxr3xtovfwrcxo9zmv9va24oup2_626 ;
 assign zdda20bw9ups77tca7x0yhu513_542 = 
	1'b0 ;
 assign sxggys48d059cg9a2se23e0pby9w_386 = 
	1'b1 ;
 assign h0c5yxl8g1w7n1ojwyh_396 = 
	 ~(wmafqzyy0jpfnio5lfsxes_581) ;
 assign e95g9qii2nwuhxturn_546 = 
	zy40b9db4be9hxsm_355 & z959jsmtg4kk266la2qdo33muwafpb8n_59 & ir2t8r8lpzg96v79l5iv5u_832 ;
 assign lctlhxvh5r85sy6vy9rnedcye_559 	= e95g9qii2nwuhxturn_546 ;
 assign hit43rkq9srx7dhcb3qda62rox_474 	= lctlhxvh5r85sy6vy9rnedcye_559 ;
 assign p47h9dg8ddkpu8x20_518 = 
	1'b0 ;
 assign nvxp9gcu1w2b9jzu1_759 = 
	 ~(q4dc5p5fbm2x4xcrkcf3_800) ;
 assign w8v3v4yo9w5gub8d_640 	= m2ny8ed88ae61aadur861brn_353[0] ;
 assign tsqttxhtkind05sg9e7rhqkz5t_506 	= m2ny8ed88ae61aadur861brn_353[6:1] ;
 assign heb7btmvvujgtwzyk3yne0srrxdyf_636 	= m2ny8ed88ae61aadur861brn_353[262:7] ;
 assign fnvassyv2ju7sneznk3yugqpj3afmcm_536 	= m2ny8ed88ae61aadur861brn_353[263] ;
 assign uvzh374erhrhl5uolk0qsdb2lvpn6zh_503 	= m2ny8ed88ae61aadur861brn_353[264] ;
 assign ffn24914vtuvkiduiahaocy0_505 	= m2ny8ed88ae61aadur861brn_353[265] ;
 assign zg56cy52pepwh02md8rni18wy5x1_305 = 
	uxzwccd41wn7rfo1b0e0641yyqvxy_199 & fnvassyv2ju7sneznk3yugqpj3afmcm_536 ;
 assign z36ghdt2egzlrqn7v8crmfm53j6vcmgx_474 	= packet_in_PACKET2_VAL ;
 assign td3hsb9tmthzmywiets_78 = packet_in_PACKET2_SOF ;
 assign kbu0hp9o7qxi5if9ppaosr7ye4n_325 	= lctlhxvh5r85sy6vy9rnedcye_559 ;
 assign t6ntcbyi54osslzvjckoxymprc0udrxm_455 = 
	1'b0 ;
 assign mgm6z2ejz2ropkotbvqxu8c0xvm4n31_485 	= s4i9wffr16pj16rj3_576[8:0] ;
 assign as9xqobd5y00m3p0i9bo_432 = (
	((mgm6z2ejz2ropkotbvqxu8c0xvm4n31_485 != jay3f5r68n26ew999zqjcaob4q_80))?1'b1:
	0)  ;
 assign nj6uwsa1kp0l0qdo1n5bpaa0ytt_579 = no23d6qqh464mb2y6qg8k8e83_25 ;
 assign wpm4hh7etp8kv8niz3vbr1cwjiqklk_725 = no23d6qqh464mb2y6qg8k8e83_25 ;
 assign rjglyehtk79h7r5qquy_447 = 
	 ~(wpm4hh7etp8kv8niz3vbr1cwjiqklk_725) ;
 assign tf3kdelor5hva61j4ezj87e96zi_786 	= d2jmlu3lw73rrt6yw0aoku81b10xl_397 ;
 assign z959jsmtg4kk266la2qdo33muwafpb8n_59 = 
	 ~(d2jmlu3lw73rrt6yw0aoku81b10xl_397) ;
 assign nho84z1mq3hgeqq1kb3akf1fsaj0bfdw_674 = 
	zy40b9db4be9hxsm_355 & f29wxr3xtovfwrcxo9zmv9va24oup2_626 & z959jsmtg4kk266la2qdo33muwafpb8n_59 & nj6uwsa1kp0l0qdo1n5bpaa0ytt_579 ;
 assign r1y94hv4n8qzrv7qgo9h2bavkmz_674 = 
	tuple_in_TUPLE0_DATA ;
 assign ax7hlniwa7i5macozw0k6h3k020el_847 	= tuple_in_TUPLE0_VALID ;
 assign uk4mtcllz8u2wcbokixvjbzohvs34iw3_112 	= r1y94hv4n8qzrv7qgo9h2bavkmz_674[159:0] ;
 assign zv8hpklxz1t06pyixl7spqqkthtxobj_363 = 
	 ~(gtx1gqvqstw88yp6ng_468) ;
 assign tmrrdoxzzkbeare5nmt2hoiqx_563 	= nho84z1mq3hgeqq1kb3akf1fsaj0bfdw_674 ;
 assign u1pktojxqn330autzxxkcrvzqmcx_720 = 
	1'b0 ;
 assign nnxch772b96ksvopzwbp_594 = 
	tuple_in_TUPLE1_DATA ;
 assign dga2h0bcpx0al83ruwt4efcyk_821 	= tuple_in_TUPLE1_VALID ;
 assign cuys409ky3cevym1vdnyyfe4ecq_492 	= nnxch772b96ksvopzwbp_594[18:0] ;
 assign w23vcior1lpgrawmu_82 = 
	 ~(g4rleau62tmdxn2tjmzmdk2l_375) ;
 assign s2zv6k3bw4ufvz6mv4vl_683 	= nho84z1mq3hgeqq1kb3akf1fsaj0bfdw_674 ;
 assign lx0yl9yg38d50y1z72hnz9ym5j9q_522 = 
	1'b0 ;
 assign f29wxr3xtovfwrcxo9zmv9va24oup2_626 = 
	nvxp9gcu1w2b9jzu1_759 & zv8hpklxz1t06pyixl7spqqkthtxobj_363 & w23vcior1lpgrawmu_82 ;
 assign xcphsupufx726krkhfxs8i_874 = 
	amylttcjzyvais1h_3 | whmwkoiec710yn4j15ljqcr_317 | nb28avsyi6uxwi1hn2p2kyg8h_761 ;
 assign packet_out_PACKET2_SOF 	= ffn24914vtuvkiduiahaocy0_505 ;
 assign packet_out_PACKET2_EOF 	= uvzh374erhrhl5uolk0qsdb2lvpn6zh_503 ;
 assign packet_out_PACKET2_VAL 	= zg56cy52pepwh02md8rni18wy5x1_305 ;
 assign packet_out_PACKET2_DAT 	= heb7btmvvujgtwzyk3yne0srrxdyf_636[255:0] ;
 assign packet_out_PACKET2_CNT 	= tsqttxhtkind05sg9e7rhqkz5t_506[5:0] ;
 assign packet_out_PACKET2_ERR 	= w8v3v4yo9w5gub8d_640 ;
 assign packet_in_PACKET2_RDY 	= packet_out_PACKET2_RDY ;
 assign tuple_out_TUPLE0_VALID 	= xnroudzwknq9tf8g2zlsf_291 ;
 assign tuple_out_TUPLE0_DATA 	= gs5to6pojcoii72aq_700[159:0] ;
 assign tuple_out_TUPLE1_VALID 	= xnroudzwknq9tf8g2zlsf_291 ;
 assign tuple_out_TUPLE1_DATA 	= ij0mne5pno3foiwtbvjt6_394[18:0] ;


assign jdypvgonjziirx2aexwluv3jz1_347 = (
	((lctlhxvh5r85sy6vy9rnedcye_559 == 1'b1))?sxggys48d059cg9a2se23e0pby9w_386 :
	((zy40b9db4be9hxsm_355 == 1'b1))?zdda20bw9ups77tca7x0yhu513_542 :
	t9uiqhzc17fyypft4j0mqas_32 ) ;

assign wmafqzyy0jpfnio5lfsxes_581 = (
	((t9uiqhzc17fyypft4j0mqas_32 == 1'b1) && (zy40b9db4be9hxsm_355 == 1'b1))?zdda20bw9ups77tca7x0yhu513_542 :
	t9uiqhzc17fyypft4j0mqas_32 ) ;



always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	rz1q2t2ixbaxdm1a0dft_609 <= 1'b0 ;
	t9uiqhzc17fyypft4j0mqas_32 <= 1'b0 ;
	tvfd3cwq8ba5tkv80l931bknz4r_163 <= 1'b0 ;
	uxzwccd41wn7rfo1b0e0641yyqvxy_199 <= 1'b0 ;
	jay3f5r68n26ew999zqjcaob4q_80 <= 9'b000000000 ;
	amylttcjzyvais1h_3 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		rz1q2t2ixbaxdm1a0dft_609 <= backpressure_in ;
		t9uiqhzc17fyypft4j0mqas_32 <= jdypvgonjziirx2aexwluv3jz1_347 ;
		tvfd3cwq8ba5tkv80l931bknz4r_163 <= nvxp9gcu1w2b9jzu1_759 ;
		uxzwccd41wn7rfo1b0e0641yyqvxy_199 <= lctlhxvh5r85sy6vy9rnedcye_559 ;
		jay3f5r68n26ew999zqjcaob4q_80 <= mgm6z2ejz2ropkotbvqxu8c0xvm4n31_485 ;
		amylttcjzyvais1h_3 <= fucf7xdy6jj8iij8nkl8_129 ;
		backpressure_out <= xcphsupufx726krkhfxs8i_874 ;
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	xnroudzwknq9tf8g2zlsf_291 <= 1'b0 ;
	whmwkoiec710yn4j15ljqcr_317 <= 1'b0 ;
   end
  else
  begin
		xnroudzwknq9tf8g2zlsf_291 <= nho84z1mq3hgeqq1kb3akf1fsaj0bfdw_674 ;
		whmwkoiec710yn4j15ljqcr_317 <= xkbrzed1iw3kaeobn_505 ;
  end
end

always @(posedge clk_out_2)
begin
  if (rst_in_0) 
  begin
	nb28avsyi6uxwi1hn2p2kyg8h_761 <= 1'b0 ;
   end
  else
  begin
		nb28avsyi6uxwi1hn2p2kyg8h_761 <= lrzvqbozbhxr3jozniga4evzek_480 ;
  end
end

defparam nimesgvxydeaprrkaowb7y9aa46w_210.WRITE_DATA_WIDTH = 266; 
defparam nimesgvxydeaprrkaowb7y9aa46w_210.FIFO_WRITE_DEPTH = 512; 
defparam nimesgvxydeaprrkaowb7y9aa46w_210.PROG_FULL_THRESH = 129; 
defparam nimesgvxydeaprrkaowb7y9aa46w_210.PROG_EMPTY_THRESH = 129; 
defparam nimesgvxydeaprrkaowb7y9aa46w_210.READ_MODE = "STD"; 
defparam nimesgvxydeaprrkaowb7y9aa46w_210.WR_DATA_COUNT_WIDTH = 9; 
defparam nimesgvxydeaprrkaowb7y9aa46w_210.RD_DATA_COUNT_WIDTH = 9; 
defparam nimesgvxydeaprrkaowb7y9aa46w_210.DOUT_RESET_VALUE = "0"; 
defparam nimesgvxydeaprrkaowb7y9aa46w_210.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_sync nimesgvxydeaprrkaowb7y9aa46w_210 (
	.wr_en(z4cmkfaoya2b49sks2ch_538),
	.din(nw3kwe3kd8kb0ur7cn_186),
	.rd_en(hit43rkq9srx7dhcb3qda62rox_474),
	.sleep(p47h9dg8ddkpu8x20_518),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(upgfhzya6vv0ef00l13687i5lic0x2rn_741), 
	.dout(m2ny8ed88ae61aadur861brn_353), 
	.empty(q4dc5p5fbm2x4xcrkcf3_800), 
	.prog_full(fucf7xdy6jj8iij8nkl8_129), 
	.full(jjajcchzcvcmsrqra9qkmoi_806), 
	.rd_data_count(jas3zvwswy7dc6kny2stcje_663), 
	.wr_data_count(n0zxp1846p0extxp4oxxea_750), 
	.wr_rst_busy(h64ukf3ipmzi4lavtv704hh1x087_115), 
	.rd_rst_busy(g6porxozzi8p79ui96177d33eqajyb4d_615), 
	.overflow(zl8yabm15y7u3q19ydz0fdql_423), 
	.underflow(m9vlq3pdl5ssgxnzl0an1tzk2iormr_771), 
	.sbiterr(kzen4keayygiqoi8bads18bj6w2aj_82), 
	.dbiterr(khtuzqqm53hezhq0ebgqemp_551), 
	.almost_empty(mbevqxsqs35upzp9f4d_717), 
	.almost_full(n5ixc5887l042yqowokq03val0k1_30), 
	.wr_ack(xnady31thb8q5x9m1etya02dthqs_35), 
	.data_valid(k7lg27iiw82jodqm1ey_552), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam oez4la1e7ud282lk0r070u_2156.WRITE_DATA_WIDTH = 1; 
defparam oez4la1e7ud282lk0r070u_2156.FIFO_WRITE_DEPTH = 512; 
defparam oez4la1e7ud282lk0r070u_2156.PROG_FULL_THRESH = 129; 
defparam oez4la1e7ud282lk0r070u_2156.PROG_EMPTY_THRESH = 129; 
defparam oez4la1e7ud282lk0r070u_2156.READ_MODE = "FWFT"; 
defparam oez4la1e7ud282lk0r070u_2156.WR_DATA_COUNT_WIDTH = 9; 
defparam oez4la1e7ud282lk0r070u_2156.RD_DATA_COUNT_WIDTH = 9; 
defparam oez4la1e7ud282lk0r070u_2156.DOUT_RESET_VALUE = "0"; 
defparam oez4la1e7ud282lk0r070u_2156.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_sync oez4la1e7ud282lk0r070u_2156 (
	.wr_en(z36ghdt2egzlrqn7v8crmfm53j6vcmgx_474),
	.din(td3hsb9tmthzmywiets_78),
	.rd_en(kbu0hp9o7qxi5if9ppaosr7ye4n_325),
	.sleep(t6ntcbyi54osslzvjckoxymprc0udrxm_455),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(hak6bj4gbd87e9ec6rglsshu1nax_322), 
	.dout(no23d6qqh464mb2y6qg8k8e83_25), 
	.empty(d2jmlu3lw73rrt6yw0aoku81b10xl_397), 
	.prog_full(lalzyfypggybv8ve9d1gd8ijebj_621), 
	.full(fq7msy3xtzeztzpm3vab35z0ep2fv_177), 
	.rd_data_count(s4i9wffr16pj16rj3_576), 
	.wr_data_count(olzoj0obd6px0o4drkicv1ymc_260), 
	.wr_rst_busy(c6vpdriwt1421vsk4pvos1ayz_548), 
	.rd_rst_busy(m9eu6s6d3n8d6e1313iij1o_15), 
	.overflow(mv4c3zdp3jwiqi670gwzd_445), 
	.underflow(f738gn5rtt8nbk96e42w1lqvw1h_514), 
	.sbiterr(h9609gm1yw8og81oxp7wbtuhvqkt_775), 
	.dbiterr(vu8ndn11ibgqabfc7ql1gjkw41_610), 
	.almost_empty(covmrlo6xvu9aiomd97k7az_824), 
	.almost_full(nbqsrlnx8zl6cma72slyan9gp_73), 
	.wr_ack(jc691ri27ujbajb6zb0vc77qpmenvhs_441), 
	.data_valid(zhdh6euweojsks6c0cnn_129), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam hohieo1cunbycw3776_593.WRITE_DATA_WIDTH = 160; 
defparam hohieo1cunbycw3776_593.FIFO_WRITE_DEPTH = 256; 
defparam hohieo1cunbycw3776_593.PROG_FULL_THRESH = 66; 
defparam hohieo1cunbycw3776_593.PROG_EMPTY_THRESH = 66; 
defparam hohieo1cunbycw3776_593.READ_MODE = "STD"; 
defparam hohieo1cunbycw3776_593.WR_DATA_COUNT_WIDTH = 8; 
defparam hohieo1cunbycw3776_593.RD_DATA_COUNT_WIDTH = 8; 
defparam hohieo1cunbycw3776_593.DOUT_RESET_VALUE = "0"; 
defparam hohieo1cunbycw3776_593.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async hohieo1cunbycw3776_593 (
	.wr_en(ax7hlniwa7i5macozw0k6h3k020el_847),
	.din(uk4mtcllz8u2wcbokixvjbzohvs34iw3_112),
	.rd_en(tmrrdoxzzkbeare5nmt2hoiqx_563),
	.sleep(u1pktojxqn330autzxxkcrvzqmcx_720),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(pih48lelh5gyngsipn0wj3ye578op_214), 
	.dout(gs5to6pojcoii72aq_700), 
	.empty(gtx1gqvqstw88yp6ng_468), 
	.prog_full(xkbrzed1iw3kaeobn_505), 
	.full(zpds4gmq1j49ayvlnxz_96), 
	.rd_data_count(apocunkag3zs7n2tvfe4ua5fud8g_79), 
	.wr_data_count(cm4pu4rte5qakr7ebncbc18w0ax892_851), 
	.wr_rst_busy(nbnubosudv7ylmnulet8puhun_550), 
	.rd_rst_busy(ck225n5apjzok7lzlof_165), 
	.overflow(bmbzwmemx935v3s03szuhar4m512jxm_431), 
	.underflow(uscbcp32ciba3u0it0xydo0l3p9w_662), 
	.sbiterr(ysji8c6a7hy2x1jo5_700), 
	.dbiterr(nf1tqae3q4ada57sf6ghyzll18exmtk_724), 
	.almost_empty(fb685o5dk9inv07wucjuebqur5_427), 
	.almost_full(l4getzd4h9itjrxh8ktjyy7r25s_681), 
	.wr_ack(px55cg7u5mxh78s2edwqa56zkm8dz21_345), 
	.data_valid(a6hhqli4e09ltfq7tb_75), 

	.wr_clk(clk_in_1), 

	.rd_clk(clk_out_1), 
	.rst(rst_in_1) 
); 

defparam hplcpn1ve6u1j46s8x0ow3cxgm1_1871.WRITE_DATA_WIDTH = 19; 
defparam hplcpn1ve6u1j46s8x0ow3cxgm1_1871.FIFO_WRITE_DEPTH = 256; 
defparam hplcpn1ve6u1j46s8x0ow3cxgm1_1871.PROG_FULL_THRESH = 65; 
defparam hplcpn1ve6u1j46s8x0ow3cxgm1_1871.PROG_EMPTY_THRESH = 65; 
defparam hplcpn1ve6u1j46s8x0ow3cxgm1_1871.READ_MODE = "STD"; 
defparam hplcpn1ve6u1j46s8x0ow3cxgm1_1871.WR_DATA_COUNT_WIDTH = 8; 
defparam hplcpn1ve6u1j46s8x0ow3cxgm1_1871.RD_DATA_COUNT_WIDTH = 8; 
defparam hplcpn1ve6u1j46s8x0ow3cxgm1_1871.DOUT_RESET_VALUE = "0"; 
defparam hplcpn1ve6u1j46s8x0ow3cxgm1_1871.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_async hplcpn1ve6u1j46s8x0ow3cxgm1_1871 (
	.wr_en(dga2h0bcpx0al83ruwt4efcyk_821),
	.din(cuys409ky3cevym1vdnyyfe4ecq_492),
	.rd_en(s2zv6k3bw4ufvz6mv4vl_683),
	.sleep(lx0yl9yg38d50y1z72hnz9ym5j9q_522),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(b2pbuxaw3ll9mqjj_553), 
	.dout(ij0mne5pno3foiwtbvjt6_394), 
	.empty(g4rleau62tmdxn2tjmzmdk2l_375), 
	.prog_full(lrzvqbozbhxr3jozniga4evzek_480), 
	.full(othyeu2942s0rxkf6jgs4e0ugc3f3x2_834), 
	.rd_data_count(nrmsgkfv4qu6ljeve7c60qudff0g_543), 
	.wr_data_count(bkj9scjh2n1y0ysrek5_885), 
	.wr_rst_busy(x3kuvuv8qeay2tiora5_171), 
	.rd_rst_busy(x97d557af873467hjfurbm_257), 
	.overflow(yfsk313pc8o91gaw7dhm_168), 
	.underflow(hcggr5xc7hu2wvleht_62), 
	.sbiterr(ruu0frjj80a20y7t4k3aln02mig_312), 
	.dbiterr(gn0qskso5m8hcf06ap9yk17279y_736), 
	.almost_empty(om0zrqkph6fxv7nhz_719), 
	.almost_full(kyuljfzr2ektp75dzjdxkusgv52ve4a_766), 
	.wr_ack(ngfpvn7n9635f8c8d1o_514), 
	.data_valid(bxp7xubkytoc8codrcgigopp89s_617), 

	.wr_clk(clk_in_2), 

	.rd_clk(clk_out_2), 
	.rst(rst_in_2) 
); 

endmodule 
