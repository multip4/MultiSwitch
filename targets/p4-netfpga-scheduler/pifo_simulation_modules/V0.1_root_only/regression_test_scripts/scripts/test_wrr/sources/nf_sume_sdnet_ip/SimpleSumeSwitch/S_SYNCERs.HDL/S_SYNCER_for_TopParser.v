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
// File created: 2020/10/08 13:42:06
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






 reg	nq5gb91buo1hxqgj6vrg2v6s2_607;	 initial nq5gb91buo1hxqgj6vrg2v6s2_607 = 1'b0 ;
 wire	xep06uejvyc4dpgzw2sn7agpajxcyb9u_132 ;
 wire [265:0] up6tm3j6pt9uu2unlt3etzit3qto_894 ;
 wire	xxhm2rt7jqdrxmdib0_61 ;
 wire	q9avq8qc82f5unlzhgb0sg0ne_599 ;
 wire	yseseclme06ujubitvlfxz_221 ;
 wire [8:0] ruh0yrgdtbfsz4hhr29h8fa_293 ;
 wire [8:0] yvcgpufgwiq0ekmtkl2f8hx_386 ;
 wire	ocjz7s47op1qb2b5t8u5268_578 ;
 wire	xbtuhjd2l7lup84wn4lvbi56d_163 ;
 wire	iybdjnu88qppevo2b2ak_887 ;
 wire	kbegx5ufhenoyom0w2ld4jift15ac3s_252 ;
 wire	l3p94oaxx3n54380tewsr4wwierxe54y_539 ;
 wire	qsehjxzp0cvofprgsg6405h4rf81ej5_580 ;
 wire	sx46jo4lw0ae9akoy_334 ;
 wire	znohf0etu5cfdrg8m4k6mi8s_108 ;
 wire	iqmy15wb5s5lvhqdzd0phf3iy_827 ;
 wire	mtdxt6jy9hyr9wkrbbqrudd46p3veq_132 ;
 wire	hj3znhefh69a1qjasx8gwu7ciax45j3v_796 ;
 reg	y6wp9hxipzgktlgi4dugvh8t34wbg6n_849;	 initial y6wp9hxipzgktlgi4dugvh8t34wbg6n_849 = 1'b0 ;
 wire	rospnkwmv8qogywouv059jssw634_326 ;
 reg	k5t15auff7na2mtekdi2t_406;	 initial k5t15auff7na2mtekdi2t_406 = 1'b0 ;
 reg	gky9c5bpkoh3t8odiz25k3q4jff_806;	 initial gky9c5bpkoh3t8odiz25k3q4jff_806 = 1'b0 ;
 wire	ybrutjowcixazrvgesjdfk4og8g0j_745 ;
 wire [0:0] nvlcjj5p0wl62vk2im3x03xf_340 ;
 wire	vxl88gtdakhirezkf50u40k9wzdvta_253 ;
 wire	qchqnlyviundndf0i5c2rhlv_433 ;
 wire	k4fcdrakn11o0jscad4q_126 ;
 wire [8:0] hom1cli3q6y96z5ih_798 ;
 wire [8:0] k715x52mpkwbebwrzf_699 ;
 wire	polom1201amplg0myaxsaox_604 ;
 wire	re69rqyda6gypcupj9moseb1_432 ;
 wire	zi6nio5gtufweem0fp6_126 ;
 wire	kuzzz5p2h1ulnqrhmndqphh3dgtmt7_560 ;
 wire	ibgw67cqhtkc6qb3hs_449 ;
 wire	g60ri20b7laup6kvulzcrk3w945mmf_220 ;
 wire	pgo85nt5tuez3xfmtk_282 ;
 wire	a6665qcqp1cbxiuylzy5d1wbjk46zgng_594 ;
 wire	zm4xf0jsczqdpobb1jcq_446 ;
 wire	y0h0dbh30rmx69v09710oprwws_15 ;
 reg [8:0] z03ysdbu7nrrgtk3ax8sp64huarvef_122;	 initial z03ysdbu7nrrgtk3ax8sp64huarvef_122 = 9'b000000000 ;
 reg	v2um9wnyj0lb1xiv1hhi8wh0g_3;	 initial v2um9wnyj0lb1xiv1hhi8wh0g_3 = 1'b0 ;
 wire	p4xngxmigzh5s3d8c_56 ;
 wire [159:0] oyl098ppe42fi4w2fy0730imnay00miq_143 ;
 wire	xp8pfhfvpt87jb8w6gs4c6v5i6z_54 ;
 wire	btxgxjgy4oiixcozyk437pf1suiq_714 ;
 wire	lk5c3j4ew4u1v4ghxklo0_775 ;
 wire [7:0] f16gq5ae3t6i1z3k4vk5de8i_519 ;
 wire [7:0] b8bs2p6a65uc2exrexyvor8_358 ;
 wire	piqjfpnkksj03lj9l4v4i71xw_446 ;
 wire	uuqatgxfc26ox74fvg_336 ;
 wire	tlw0t38eurj33vvz_737 ;
 wire	zsydpoo2pat7adrmzi59mtszt3uec_738 ;
 wire	c6if7yarx5s3ycrkh97w64gz_514 ;
 wire	h5rj98xghpw8qkkek5c0g33tfyvzw_641 ;
 wire	i7ar4u7d8x0i5v2w4l5xp7gcr_438 ;
 wire	c28m239ulnyp411m2f4mq8do0jpzm_797 ;
 wire	qobcrmpoxf96u58gaeqvjgbv_650 ;
 wire	riot6n9hff8ljrgzn4iq9jtoo0iq_342 ;
 wire	np8x1my9oig8lkbaj_906 ;
 wire [23:0] tqbpwdhu80lp4pqzd3isg_17 ;
 wire	wgtsudr1ebvasuc7o7lc_253 ;
 wire	h48c5b3chyetvp9we1vxy83qa8po5qi_66 ;
 wire	a5571csk3i2vo4qbqz8y_444 ;
 wire [7:0] tysp3meyx2t7stcxdqf8_762 ;
 wire [7:0] gw78iie5ui3xvdr724opg820_568 ;
 wire	oqvtzjlaic6ychpwzj_300 ;
 wire	op8fre2lhlomwnk0njj0y_783 ;
 wire	mpeo9tezocg9kvtgbv04f0jzdgfhd749_412 ;
 wire	z0itrupgn9x8zbydsuwj386dszz_269 ;
 wire	s7sbco3l3twv57mc2566magfttmp_328 ;
 wire	enh8k68bxhqfpeh1w0nnyvgpri9_527 ;
 wire	bignfxvgqrl50jf1ixu6z_373 ;
 wire	m2fffym8bu586vpaeili0xkusjni2_629 ;
 wire	qdgwecjrhwxyfus8vo2ovr_712 ;
 wire	tt5sq1b66t8agsftavg6_123 ;
 reg	hy7vit1nar4f0i0s0mub0n74ytwqsg8o_232;	 initial hy7vit1nar4f0i0s0mub0n74ytwqsg8o_232 = 1'b0 ;
 reg	f9mq6wnghq4m64sll_521;	 initial f9mq6wnghq4m64sll_521 = 1'b0 ;
 reg	yg9qinde5isyuy5kdb6pb9tzb_679;	 initial yg9qinde5isyuy5kdb6pb9tzb_679 = 1'b0 ;
 wire	wf5g4701erol22f66_537 ;
 wire [265:0] gx88hvz7q32p58z8hb31vcuj6_336 ;
 wire	hp1edwonuzv1o1gbtgzogjkr3mr93o7_505 ;
 wire [265:0] setyfbzohlsg0g2wzow1xp1s6ia1obo_59 ;
 wire	htl2jkmx9t6x9xx0kb00lhqyq0713_28 ;
 wire	i7s5smau61ocs5gcrfqikok1_136 ;
 wire	rpuv2onckwlgd7xq_775 ;
 wire	awev1qgefm66joijav0h_304 ;
 wire	bbqexm7n4c9fp938lhqj30mu1tu39_718 ;
 wire	d9p9c0xcohq5fuvn_506 ;
 wire	o6ssqnywmemkyuef2r6wzw_764 ;
 wire	rh19ri027tsfjnzc0v0uoh3x6nf_882 ;
 wire	v8fdipcbsgi77vatyj1s3frvtnesmi_643 ;
 wire	b3camosszmqkugcz0u_210 ;
 wire [5:0] bjge59c5clxq5gvb0bg77t0cq9_873 ;
 wire [255:0] p8zp7c51czjkg1l5_413 ;
 wire	t6v5da1t3b3cez6y0_475 ;
 wire	zvvebbzjuaxub0sa8jtrb5enx50cm_166 ;
 wire	dfwr6lytawdtjxghj_889 ;
 wire	sq039tudlec7148aptiy2mnzvd3p_210 ;
 wire	cfxkfool1ufpj51p_590 ;
 wire [0:0] daerrt79mzkwqwrrj0d8o6rlbf8w6_755 ;
 wire	kbwnm7p5w8ds613a3kwmbh_782 ;
 wire	nmo1w4m4x6h88uqk4wixl1zktqy_810 ;
 wire [8:0] srmqmpm830lk2udkic1843qg4u1_30 ;
 wire	csns0k93y6w9do51_263 ;
 wire	cmsti7p18s49orpzzcmmknd_253 ;
 wire	igphjtn79kk7j8hqu0xdrk35wmzs_631 ;
 wire	kdj8aippmxjzl75rnp90bie84_369 ;
 wire	p23dxaa5myv4798fjnd9pcm1h0i6p5cb_638 ;
 wire	r9vkd1fq3s1f0oes5ifcupz0_480 ;
 wire	b2bbagv20tbk8m50bvhsnv0ygs1njxj_421 ;
 wire [159:0] gs8bjm2nwasb8p0u7wvk0fsffkikmat_417 ;
 wire	q3hr2a3gvu1tbbulswq7_826 ;
 wire [159:0] gaxnj7p0o7unzczrmd7ojjldqiw_119 ;
 wire	s3zjzs34q63jb4k10hk5ibxce2wkvizv_534 ;
 wire	wlhevpwv8dcgdxui8_364 ;
 wire	y1eysijgbohlrfi2b0wc3d_776 ;
 wire [23:0] vcvay6vhefcwkn5l518ccynbq_797 ;
 wire	oteq45h8qe9n2p9tbvz_69 ;
 wire [23:0] yciw90463hptyjvx_278 ;
 wire	owcfkt4nt9gsgpnkx5ees60qkoq5j_810 ;
 wire	x5yx79fd8a15qbi57_820 ;
 wire	ur1kp4czlc9es8uixt9dhavca_799 ;
 wire	a4onewqoyr1zrsdjoc7pu3xcj6_869 ;
 wire	o1j1o7oy9lq8s3j9_267 ;


 assign wf5g4701erol22f66_537 = 
	 ~(backpressure_in) ;
 assign gx88hvz7q32p58z8hb31vcuj6_336 = 
	{packet_in_PACKET2_SOF, packet_in_PACKET2_EOF, packet_in_PACKET2_VAL, packet_in_PACKET2_DAT, packet_in_PACKET2_CNT, packet_in_PACKET2_ERR} ;
 assign hp1edwonuzv1o1gbtgzogjkr3mr93o7_505 	= packet_in_PACKET2_VAL ;
 assign setyfbzohlsg0g2wzow1xp1s6ia1obo_59 	= gx88hvz7q32p58z8hb31vcuj6_336[265:0] ;
 assign htl2jkmx9t6x9xx0kb00lhqyq0713_28 = 
	kdj8aippmxjzl75rnp90bie84_369 | a4onewqoyr1zrsdjoc7pu3xcj6_869 ;
 assign i7s5smau61ocs5gcrfqikok1_136 = 
	1'b0 ;
 assign rpuv2onckwlgd7xq_775 = 
	1'b1 ;
 assign awev1qgefm66joijav0h_304 = 
	 ~(rospnkwmv8qogywouv059jssw634_326) ;
 assign bbqexm7n4c9fp938lhqj30mu1tu39_718 = 
	wf5g4701erol22f66_537 & r9vkd1fq3s1f0oes5ifcupz0_480 & htl2jkmx9t6x9xx0kb00lhqyq0713_28 ;
 assign d9p9c0xcohq5fuvn_506 	= bbqexm7n4c9fp938lhqj30mu1tu39_718 ;
 assign o6ssqnywmemkyuef2r6wzw_764 	= d9p9c0xcohq5fuvn_506 ;
 assign rh19ri027tsfjnzc0v0uoh3x6nf_882 = 
	1'b0 ;
 assign v8fdipcbsgi77vatyj1s3frvtnesmi_643 = 
	 ~(xxhm2rt7jqdrxmdib0_61) ;
 assign b3camosszmqkugcz0u_210 	= up6tm3j6pt9uu2unlt3etzit3qto_894[0] ;
 assign bjge59c5clxq5gvb0bg77t0cq9_873 	= up6tm3j6pt9uu2unlt3etzit3qto_894[6:1] ;
 assign p8zp7c51czjkg1l5_413 	= up6tm3j6pt9uu2unlt3etzit3qto_894[262:7] ;
 assign t6v5da1t3b3cez6y0_475 	= up6tm3j6pt9uu2unlt3etzit3qto_894[263] ;
 assign zvvebbzjuaxub0sa8jtrb5enx50cm_166 	= up6tm3j6pt9uu2unlt3etzit3qto_894[264] ;
 assign dfwr6lytawdtjxghj_889 	= up6tm3j6pt9uu2unlt3etzit3qto_894[265] ;
 assign sq039tudlec7148aptiy2mnzvd3p_210 = 
	gky9c5bpkoh3t8odiz25k3q4jff_806 & t6v5da1t3b3cez6y0_475 ;
 assign cfxkfool1ufpj51p_590 	= packet_in_PACKET2_VAL ;
 assign daerrt79mzkwqwrrj0d8o6rlbf8w6_755 = packet_in_PACKET2_SOF ;
 assign kbwnm7p5w8ds613a3kwmbh_782 	= d9p9c0xcohq5fuvn_506 ;
 assign nmo1w4m4x6h88uqk4wixl1zktqy_810 = 
	1'b0 ;
 assign srmqmpm830lk2udkic1843qg4u1_30 	= hom1cli3q6y96z5ih_798[8:0] ;
 assign csns0k93y6w9do51_263 = (
	((srmqmpm830lk2udkic1843qg4u1_30 != z03ysdbu7nrrgtk3ax8sp64huarvef_122))?1'b1:
	0)  ;
 assign cmsti7p18s49orpzzcmmknd_253 = nvlcjj5p0wl62vk2im3x03xf_340 ;
 assign igphjtn79kk7j8hqu0xdrk35wmzs_631 = nvlcjj5p0wl62vk2im3x03xf_340 ;
 assign kdj8aippmxjzl75rnp90bie84_369 = 
	 ~(igphjtn79kk7j8hqu0xdrk35wmzs_631) ;
 assign p23dxaa5myv4798fjnd9pcm1h0i6p5cb_638 	= vxl88gtdakhirezkf50u40k9wzdvta_253 ;
 assign r9vkd1fq3s1f0oes5ifcupz0_480 = 
	 ~(vxl88gtdakhirezkf50u40k9wzdvta_253) ;
 assign b2bbagv20tbk8m50bvhsnv0ygs1njxj_421 = 
	wf5g4701erol22f66_537 & a4onewqoyr1zrsdjoc7pu3xcj6_869 & r9vkd1fq3s1f0oes5ifcupz0_480 & cmsti7p18s49orpzzcmmknd_253 ;
 assign gs8bjm2nwasb8p0u7wvk0fsffkikmat_417 = 
	tuple_in_TUPLE0_DATA ;
 assign q3hr2a3gvu1tbbulswq7_826 	= tuple_in_TUPLE0_VALID ;
 assign gaxnj7p0o7unzczrmd7ojjldqiw_119 	= gs8bjm2nwasb8p0u7wvk0fsffkikmat_417[159:0] ;
 assign s3zjzs34q63jb4k10hk5ibxce2wkvizv_534 = 
	 ~(xp8pfhfvpt87jb8w6gs4c6v5i6z_54) ;
 assign wlhevpwv8dcgdxui8_364 	= b2bbagv20tbk8m50bvhsnv0ygs1njxj_421 ;
 assign y1eysijgbohlrfi2b0wc3d_776 = 
	1'b0 ;
 assign vcvay6vhefcwkn5l518ccynbq_797 = 
	tuple_in_TUPLE1_DATA ;
 assign oteq45h8qe9n2p9tbvz_69 	= tuple_in_TUPLE1_VALID ;
 assign yciw90463hptyjvx_278 	= vcvay6vhefcwkn5l518ccynbq_797[23:0] ;
 assign owcfkt4nt9gsgpnkx5ees60qkoq5j_810 = 
	 ~(wgtsudr1ebvasuc7o7lc_253) ;
 assign x5yx79fd8a15qbi57_820 	= b2bbagv20tbk8m50bvhsnv0ygs1njxj_421 ;
 assign ur1kp4czlc9es8uixt9dhavca_799 = 
	1'b0 ;
 assign a4onewqoyr1zrsdjoc7pu3xcj6_869 = 
	v8fdipcbsgi77vatyj1s3frvtnesmi_643 & s3zjzs34q63jb4k10hk5ibxce2wkvizv_534 & owcfkt4nt9gsgpnkx5ees60qkoq5j_810 ;
 assign o1j1o7oy9lq8s3j9_267 = 
	hy7vit1nar4f0i0s0mub0n74ytwqsg8o_232 | f9mq6wnghq4m64sll_521 | yg9qinde5isyuy5kdb6pb9tzb_679 ;
 assign packet_out_PACKET2_SOF 	= dfwr6lytawdtjxghj_889 ;
 assign packet_out_PACKET2_EOF 	= zvvebbzjuaxub0sa8jtrb5enx50cm_166 ;
 assign packet_out_PACKET2_VAL 	= sq039tudlec7148aptiy2mnzvd3p_210 ;
 assign packet_out_PACKET2_DAT 	= p8zp7c51czjkg1l5_413[255:0] ;
 assign packet_out_PACKET2_CNT 	= bjge59c5clxq5gvb0bg77t0cq9_873[5:0] ;
 assign packet_out_PACKET2_ERR 	= b3camosszmqkugcz0u_210 ;
 assign packet_in_PACKET2_RDY 	= packet_out_PACKET2_RDY ;
 assign tuple_out_TUPLE0_VALID 	= v2um9wnyj0lb1xiv1hhi8wh0g_3 ;
 assign tuple_out_TUPLE0_DATA 	= oyl098ppe42fi4w2fy0730imnay00miq_143[159:0] ;
 assign tuple_out_TUPLE1_VALID 	= v2um9wnyj0lb1xiv1hhi8wh0g_3 ;
 assign tuple_out_TUPLE1_DATA 	= tqbpwdhu80lp4pqzd3isg_17[23:0] ;


assign hj3znhefh69a1qjasx8gwu7ciax45j3v_796 = (
	((d9p9c0xcohq5fuvn_506 == 1'b1))?rpuv2onckwlgd7xq_775 :
	((wf5g4701erol22f66_537 == 1'b1))?i7s5smau61ocs5gcrfqikok1_136 :
	y6wp9hxipzgktlgi4dugvh8t34wbg6n_849 ) ;

assign rospnkwmv8qogywouv059jssw634_326 = (
	((y6wp9hxipzgktlgi4dugvh8t34wbg6n_849 == 1'b1) && (wf5g4701erol22f66_537 == 1'b1))?i7s5smau61ocs5gcrfqikok1_136 :
	y6wp9hxipzgktlgi4dugvh8t34wbg6n_849 ) ;



always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	nq5gb91buo1hxqgj6vrg2v6s2_607 <= 1'b0 ;
	y6wp9hxipzgktlgi4dugvh8t34wbg6n_849 <= 1'b0 ;
	k5t15auff7na2mtekdi2t_406 <= 1'b0 ;
	gky9c5bpkoh3t8odiz25k3q4jff_806 <= 1'b0 ;
	z03ysdbu7nrrgtk3ax8sp64huarvef_122 <= 9'b000000000 ;
	hy7vit1nar4f0i0s0mub0n74ytwqsg8o_232 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		nq5gb91buo1hxqgj6vrg2v6s2_607 <= backpressure_in ;
		y6wp9hxipzgktlgi4dugvh8t34wbg6n_849 <= hj3znhefh69a1qjasx8gwu7ciax45j3v_796 ;
		k5t15auff7na2mtekdi2t_406 <= v8fdipcbsgi77vatyj1s3frvtnesmi_643 ;
		gky9c5bpkoh3t8odiz25k3q4jff_806 <= d9p9c0xcohq5fuvn_506 ;
		z03ysdbu7nrrgtk3ax8sp64huarvef_122 <= srmqmpm830lk2udkic1843qg4u1_30 ;
		hy7vit1nar4f0i0s0mub0n74ytwqsg8o_232 <= q9avq8qc82f5unlzhgb0sg0ne_599 ;
		backpressure_out <= o1j1o7oy9lq8s3j9_267 ;
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	v2um9wnyj0lb1xiv1hhi8wh0g_3 <= 1'b0 ;
	f9mq6wnghq4m64sll_521 <= 1'b0 ;
   end
  else
  begin
		v2um9wnyj0lb1xiv1hhi8wh0g_3 <= b2bbagv20tbk8m50bvhsnv0ygs1njxj_421 ;
		f9mq6wnghq4m64sll_521 <= btxgxjgy4oiixcozyk437pf1suiq_714 ;
  end
end

always @(posedge clk_out_2)
begin
  if (rst_in_0) 
  begin
	yg9qinde5isyuy5kdb6pb9tzb_679 <= 1'b0 ;
   end
  else
  begin
		yg9qinde5isyuy5kdb6pb9tzb_679 <= h48c5b3chyetvp9we1vxy83qa8po5qi_66 ;
  end
end

defparam y3jq84q76m1g1y2q9cyelpprs_2180.WRITE_DATA_WIDTH = 266; 
defparam y3jq84q76m1g1y2q9cyelpprs_2180.FIFO_WRITE_DEPTH = 512; 
defparam y3jq84q76m1g1y2q9cyelpprs_2180.PROG_FULL_THRESH = 129; 
defparam y3jq84q76m1g1y2q9cyelpprs_2180.PROG_EMPTY_THRESH = 129; 
defparam y3jq84q76m1g1y2q9cyelpprs_2180.READ_MODE = "STD"; 
defparam y3jq84q76m1g1y2q9cyelpprs_2180.WR_DATA_COUNT_WIDTH = 9; 
defparam y3jq84q76m1g1y2q9cyelpprs_2180.RD_DATA_COUNT_WIDTH = 9; 
defparam y3jq84q76m1g1y2q9cyelpprs_2180.DOUT_RESET_VALUE = "0"; 
defparam y3jq84q76m1g1y2q9cyelpprs_2180.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_sync y3jq84q76m1g1y2q9cyelpprs_2180 (
	.wr_en(hp1edwonuzv1o1gbtgzogjkr3mr93o7_505),
	.din(setyfbzohlsg0g2wzow1xp1s6ia1obo_59),
	.rd_en(o6ssqnywmemkyuef2r6wzw_764),
	.sleep(rh19ri027tsfjnzc0v0uoh3x6nf_882),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(xep06uejvyc4dpgzw2sn7agpajxcyb9u_132), 
	.dout(up6tm3j6pt9uu2unlt3etzit3qto_894), 
	.empty(xxhm2rt7jqdrxmdib0_61), 
	.prog_full(q9avq8qc82f5unlzhgb0sg0ne_599), 
	.full(yseseclme06ujubitvlfxz_221), 
	.rd_data_count(ruh0yrgdtbfsz4hhr29h8fa_293), 
	.wr_data_count(yvcgpufgwiq0ekmtkl2f8hx_386), 
	.wr_rst_busy(ocjz7s47op1qb2b5t8u5268_578), 
	.rd_rst_busy(xbtuhjd2l7lup84wn4lvbi56d_163), 
	.overflow(iybdjnu88qppevo2b2ak_887), 
	.underflow(kbegx5ufhenoyom0w2ld4jift15ac3s_252), 
	.sbiterr(l3p94oaxx3n54380tewsr4wwierxe54y_539), 
	.dbiterr(qsehjxzp0cvofprgsg6405h4rf81ej5_580), 
	.almost_empty(sx46jo4lw0ae9akoy_334), 
	.almost_full(znohf0etu5cfdrg8m4k6mi8s_108), 
	.wr_ack(iqmy15wb5s5lvhqdzd0phf3iy_827), 
	.data_valid(mtdxt6jy9hyr9wkrbbqrudd46p3veq_132), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam ohhktejemkxl516kbacbewwsjeamtx_2685.WRITE_DATA_WIDTH = 1; 
defparam ohhktejemkxl516kbacbewwsjeamtx_2685.FIFO_WRITE_DEPTH = 512; 
defparam ohhktejemkxl516kbacbewwsjeamtx_2685.PROG_FULL_THRESH = 129; 
defparam ohhktejemkxl516kbacbewwsjeamtx_2685.PROG_EMPTY_THRESH = 129; 
defparam ohhktejemkxl516kbacbewwsjeamtx_2685.READ_MODE = "FWFT"; 
defparam ohhktejemkxl516kbacbewwsjeamtx_2685.WR_DATA_COUNT_WIDTH = 9; 
defparam ohhktejemkxl516kbacbewwsjeamtx_2685.RD_DATA_COUNT_WIDTH = 9; 
defparam ohhktejemkxl516kbacbewwsjeamtx_2685.DOUT_RESET_VALUE = "0"; 
defparam ohhktejemkxl516kbacbewwsjeamtx_2685.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_sync ohhktejemkxl516kbacbewwsjeamtx_2685 (
	.wr_en(cfxkfool1ufpj51p_590),
	.din(daerrt79mzkwqwrrj0d8o6rlbf8w6_755),
	.rd_en(kbwnm7p5w8ds613a3kwmbh_782),
	.sleep(nmo1w4m4x6h88uqk4wixl1zktqy_810),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(ybrutjowcixazrvgesjdfk4og8g0j_745), 
	.dout(nvlcjj5p0wl62vk2im3x03xf_340), 
	.empty(vxl88gtdakhirezkf50u40k9wzdvta_253), 
	.prog_full(qchqnlyviundndf0i5c2rhlv_433), 
	.full(k4fcdrakn11o0jscad4q_126), 
	.rd_data_count(hom1cli3q6y96z5ih_798), 
	.wr_data_count(k715x52mpkwbebwrzf_699), 
	.wr_rst_busy(polom1201amplg0myaxsaox_604), 
	.rd_rst_busy(re69rqyda6gypcupj9moseb1_432), 
	.overflow(zi6nio5gtufweem0fp6_126), 
	.underflow(kuzzz5p2h1ulnqrhmndqphh3dgtmt7_560), 
	.sbiterr(ibgw67cqhtkc6qb3hs_449), 
	.dbiterr(g60ri20b7laup6kvulzcrk3w945mmf_220), 
	.almost_empty(pgo85nt5tuez3xfmtk_282), 
	.almost_full(a6665qcqp1cbxiuylzy5d1wbjk46zgng_594), 
	.wr_ack(zm4xf0jsczqdpobb1jcq_446), 
	.data_valid(y0h0dbh30rmx69v09710oprwws_15), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam j41rrc7s6yvp0anffqf2jkt7b74v3kt_1601.WRITE_DATA_WIDTH = 160; 
defparam j41rrc7s6yvp0anffqf2jkt7b74v3kt_1601.FIFO_WRITE_DEPTH = 256; 
defparam j41rrc7s6yvp0anffqf2jkt7b74v3kt_1601.PROG_FULL_THRESH = 66; 
defparam j41rrc7s6yvp0anffqf2jkt7b74v3kt_1601.PROG_EMPTY_THRESH = 66; 
defparam j41rrc7s6yvp0anffqf2jkt7b74v3kt_1601.READ_MODE = "STD"; 
defparam j41rrc7s6yvp0anffqf2jkt7b74v3kt_1601.WR_DATA_COUNT_WIDTH = 8; 
defparam j41rrc7s6yvp0anffqf2jkt7b74v3kt_1601.RD_DATA_COUNT_WIDTH = 8; 
defparam j41rrc7s6yvp0anffqf2jkt7b74v3kt_1601.DOUT_RESET_VALUE = "0"; 
defparam j41rrc7s6yvp0anffqf2jkt7b74v3kt_1601.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async j41rrc7s6yvp0anffqf2jkt7b74v3kt_1601 (
	.wr_en(q3hr2a3gvu1tbbulswq7_826),
	.din(gaxnj7p0o7unzczrmd7ojjldqiw_119),
	.rd_en(wlhevpwv8dcgdxui8_364),
	.sleep(y1eysijgbohlrfi2b0wc3d_776),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(p4xngxmigzh5s3d8c_56), 
	.dout(oyl098ppe42fi4w2fy0730imnay00miq_143), 
	.empty(xp8pfhfvpt87jb8w6gs4c6v5i6z_54), 
	.prog_full(btxgxjgy4oiixcozyk437pf1suiq_714), 
	.full(lk5c3j4ew4u1v4ghxklo0_775), 
	.rd_data_count(f16gq5ae3t6i1z3k4vk5de8i_519), 
	.wr_data_count(b8bs2p6a65uc2exrexyvor8_358), 
	.wr_rst_busy(piqjfpnkksj03lj9l4v4i71xw_446), 
	.rd_rst_busy(uuqatgxfc26ox74fvg_336), 
	.overflow(tlw0t38eurj33vvz_737), 
	.underflow(zsydpoo2pat7adrmzi59mtszt3uec_738), 
	.sbiterr(c6if7yarx5s3ycrkh97w64gz_514), 
	.dbiterr(h5rj98xghpw8qkkek5c0g33tfyvzw_641), 
	.almost_empty(i7ar4u7d8x0i5v2w4l5xp7gcr_438), 
	.almost_full(c28m239ulnyp411m2f4mq8do0jpzm_797), 
	.wr_ack(qobcrmpoxf96u58gaeqvjgbv_650), 
	.data_valid(riot6n9hff8ljrgzn4iq9jtoo0iq_342), 

	.wr_clk(clk_in_1), 

	.rd_clk(clk_out_1), 
	.rst(rst_in_1) 
); 

defparam jr7k1o2cmx4m44x9go_460.WRITE_DATA_WIDTH = 24; 
defparam jr7k1o2cmx4m44x9go_460.FIFO_WRITE_DEPTH = 256; 
defparam jr7k1o2cmx4m44x9go_460.PROG_FULL_THRESH = 65; 
defparam jr7k1o2cmx4m44x9go_460.PROG_EMPTY_THRESH = 65; 
defparam jr7k1o2cmx4m44x9go_460.READ_MODE = "STD"; 
defparam jr7k1o2cmx4m44x9go_460.WR_DATA_COUNT_WIDTH = 8; 
defparam jr7k1o2cmx4m44x9go_460.RD_DATA_COUNT_WIDTH = 8; 
defparam jr7k1o2cmx4m44x9go_460.DOUT_RESET_VALUE = "0"; 
defparam jr7k1o2cmx4m44x9go_460.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_async jr7k1o2cmx4m44x9go_460 (
	.wr_en(oteq45h8qe9n2p9tbvz_69),
	.din(yciw90463hptyjvx_278),
	.rd_en(x5yx79fd8a15qbi57_820),
	.sleep(ur1kp4czlc9es8uixt9dhavca_799),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(np8x1my9oig8lkbaj_906), 
	.dout(tqbpwdhu80lp4pqzd3isg_17), 
	.empty(wgtsudr1ebvasuc7o7lc_253), 
	.prog_full(h48c5b3chyetvp9we1vxy83qa8po5qi_66), 
	.full(a5571csk3i2vo4qbqz8y_444), 
	.rd_data_count(tysp3meyx2t7stcxdqf8_762), 
	.wr_data_count(gw78iie5ui3xvdr724opg820_568), 
	.wr_rst_busy(oqvtzjlaic6ychpwzj_300), 
	.rd_rst_busy(op8fre2lhlomwnk0njj0y_783), 
	.overflow(mpeo9tezocg9kvtgbv04f0jzdgfhd749_412), 
	.underflow(z0itrupgn9x8zbydsuwj386dszz_269), 
	.sbiterr(s7sbco3l3twv57mc2566magfttmp_328), 
	.dbiterr(enh8k68bxhqfpeh1w0nnyvgpri9_527), 
	.almost_empty(bignfxvgqrl50jf1ixu6z_373), 
	.almost_full(m2fffym8bu586vpaeili0xkusjni2_629), 
	.wr_ack(qdgwecjrhwxyfus8vo2ovr_712), 
	.data_valid(tt5sq1b66t8agsftavg6_123), 

	.wr_clk(clk_in_2), 

	.rd_clk(clk_out_2), 
	.rst(rst_in_2) 
); 

endmodule 
