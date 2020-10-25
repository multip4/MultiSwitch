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
// File created: 2020/10/08 15:24:14
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






 reg	qa5531gqyw3svfi56lefhk28k_630;	 initial qa5531gqyw3svfi56lefhk28k_630 = 1'b0 ;
 wire	qgaa97krqcevihik551u9xfmvwb_121 ;
 wire [265:0] gtfi0kyw6ewz1yj2nki60on7bgzo_318 ;
 wire	oygm3hkzes9grmpyc4upy_739 ;
 wire	ri6b8n1mhmugfbfr7qbm7t6oz5o_799 ;
 wire	wm6k027w1m4klib1q11ug7gpvgyyaw_371 ;
 wire [8:0] v047lsuec693o9mh0r4iczl_599 ;
 wire [8:0] q5bi6vtyfcnrja1w713wu_363 ;
 wire	v68p7i29p4jnkrda0kde_797 ;
 wire	v0q550tg1l2jkc8t_634 ;
 wire	rjbv7qb0xib99xy4hdghzj6hkj4sem_697 ;
 wire	ssz13fg07f8ubh1wt1saeuvkdkt1y_516 ;
 wire	ozzy0b5fpkt5vi0jicxxmhdorr41_825 ;
 wire	d196jjboxh4wxncr3ozn_476 ;
 wire	ktxpwkay6cxl6hpft4uqaq24llk9d3_745 ;
 wire	tprk1sssxyqavciufd9qz7yi0_884 ;
 wire	d9qtotwzb0kgmz5zsdj8dny8tm85kd_786 ;
 wire	acg9a3v3tfv915x8u11nma0_746 ;
 wire	h22n3fea91commzkxsqe_466 ;
 reg	bh230l0u2aye6b4l20gegep11iwe6sx_560;	 initial bh230l0u2aye6b4l20gegep11iwe6sx_560 = 1'b0 ;
 wire	n8kkytnxbhhlhuc42_815 ;
 reg	cysxs5e037mz681hprast2df0_336;	 initial cysxs5e037mz681hprast2df0_336 = 1'b0 ;
 reg	pmvcwlmqzq9w6s5ys5_545;	 initial pmvcwlmqzq9w6s5ys5_545 = 1'b0 ;
 wire	lprl91vko83511r6bibr7p5v5m8ngoc_807 ;
 wire [0:0] o4sv7ghgy36g5livq12zeuwwdyc_4 ;
 wire	dgfumv7hy9n7dr5r6jsm9pvfwcl9bpl_523 ;
 wire	xaafzvnpyv34427f4nz_390 ;
 wire	ko8lw5gw9vivbqovtj1iau65oo9p9_841 ;
 wire [8:0] jreue1ltmk7j4my8o4cl5kn_439 ;
 wire [8:0] oj2dcf7hy8ocmv9ww_567 ;
 wire	p9suyfuj9ja7xaa4a14_205 ;
 wire	fdmt4shwnfghrjklbaq7ota7vab3t6_80 ;
 wire	awc06riocb2usi8n6ymt2dzsqrhw_664 ;
 wire	frli6kasm6r5o9byxwa8zoy0w4u_152 ;
 wire	knc6i2zx1wx35ep1tkgqffcei_528 ;
 wire	fig03ua64w4asswab8vpjscponpdj7_74 ;
 wire	tac6z2y560nabvgp8uepw2zqytglrghd_491 ;
 wire	ulkqfjx9fmsenquow_708 ;
 wire	tchnizq5y7ya2rneo3p9twpduuckilf_138 ;
 wire	y0bpead8qhl0mzrg3wwz57j2qsubtusj_65 ;
 reg [8:0] dzvd4ifhk75y29fl090praj_260;	 initial dzvd4ifhk75y29fl090praj_260 = 9'b000000000 ;
 reg	gguyd94ocnt47ot4bj9z01_225;	 initial gguyd94ocnt47ot4bj9z01_225 = 1'b0 ;
 wire	wgq9c8i1fdtrbcjm1sk4i04at3u_61 ;
 wire [159:0] p3ikm86lgwhp2bwi2xpcosrj7e88_559 ;
 wire	gbsp04jzb7wt26iz51ddcn5yjuv8_866 ;
 wire	wbuqwoz6o3089ibuptepkh4wf_251 ;
 wire	g9sp50efje973kxyk52okggdjg_787 ;
 wire [7:0] c4orr1d2bsk12920acysamf0x3ho_715 ;
 wire [7:0] xil3ws7wdqze03ygg6v5k2o3_66 ;
 wire	eyigfd6ka6fsva6cq7et5z2xy8_645 ;
 wire	y07b48t8hlmm9avd9i7sraaocbl7spy_843 ;
 wire	k7edny0ooiknc8pd9_510 ;
 wire	hmj7hrlnmrg57vn7ib_239 ;
 wire	qz65ddzc2a2i8as09i_29 ;
 wire	wxpavhkc6qa0ujgne9huw6gu6_161 ;
 wire	tcr9vo72tfnov0u9875gs066a9_361 ;
 wire	rlgvk7x1ng6dvh1kjlomm1vq_459 ;
 wire	p95f17bqzy5awxev6h5b_285 ;
 wire	k01htbc199c52dxv8m4nc_730 ;
 wire	uk7fudk4kr1gh1ub4mhkvdgbfcgp0uzd_79 ;
 wire [23:0] eglmpg5ysxljqhzaqds1g5mw63e4sd_766 ;
 wire	tfp11pvpab086ha9jcrxqp499zvvhk_774 ;
 wire	bkm617n8s7hnpdt9ruyb6mak_320 ;
 wire	fpmqveoai6jibk51jcw66n0p42u3dwz_497 ;
 wire [7:0] heqtylr8s21m75aepne7a785n21xu33_348 ;
 wire [7:0] oedhj6x0w9vo1rmp_519 ;
 wire	sr0vdcj0rm95gzegf34n1hwumfid6_868 ;
 wire	y2clciwk2t53cl5xqpvts0rgq7fr4k_257 ;
 wire	mc5u7eqwvhspj6gwym1v_489 ;
 wire	yfwinu2rfq47tsmppzaggsaxtqgr3_371 ;
 wire	z20t0fjz0hwdzm7dt7vcc_331 ;
 wire	on99tbjyi93ex1csm6vg_374 ;
 wire	fvi4ezzbp9i5ujpau0_22 ;
 wire	ntaassdura4yybf3_660 ;
 wire	fsad26gn86cepazp48jpo_338 ;
 wire	k2arjcw2tdrf2ra467on7fjlcemyl_221 ;
 reg	ucrt7is97s9nxaa5x3l1l3yf_406;	 initial ucrt7is97s9nxaa5x3l1l3yf_406 = 1'b0 ;
 reg	x09gknfuy9givgg3f4lkenoyjg_128;	 initial x09gknfuy9givgg3f4lkenoyjg_128 = 1'b0 ;
 reg	i6ai857hs463rm7wb4rv9dh3q6_444;	 initial i6ai857hs463rm7wb4rv9dh3q6_444 = 1'b0 ;
 wire	ckjq9vd7gxc37cxv2e7xkd3z5zeriwk_209 ;
 wire [265:0] gyyqshzjhcyn0flk_410 ;
 wire	ambh7x2ovmjz9gya_86 ;
 wire [265:0] djt0c57kh3xvky8oywq_605 ;
 wire	fj13owg0e4yzi2ec4y329qr3_242 ;
 wire	a8o6lbzhgw9n5piskhuo430s1_617 ;
 wire	lmwx4hn32dzb849l83orwfc8_595 ;
 wire	bfux81ihvoqgdav8eethek_698 ;
 wire	rsg9e79xxx2whtgx7_110 ;
 wire	r84c49x28kuplv0l9iy7bb42jrdp_501 ;
 wire	s2v51u84158anjcqo5x_571 ;
 wire	dzskhkda1bnb7bw6sfr7_121 ;
 wire	dz8figces8k7vgcm_838 ;
 wire	bob7c9zcso9wz8zoc522zyp6_763 ;
 wire [5:0] qhqoxt1g9g0k63wj8ppov38uo3719k_858 ;
 wire [255:0] cct4lexbtkbdo6k7_29 ;
 wire	prrhncayqwu8t4rs0hcopqwl5_468 ;
 wire	co8jxw29dxy3u0nstdlagam7b_67 ;
 wire	wafuka85nr4bw5fpa3_525 ;
 wire	o9hfgvpgqvwoe02cv16gq1uazxbarq9_642 ;
 wire	mpok8p8h7crr8xl48l7z_263 ;
 wire [0:0] w5ah6so9vnsgmyoh_720 ;
 wire	jpzxv21bwc4kjbvafqj0i88c70dd_154 ;
 wire	k3exntgafrrsdxkqze3867304cukk_322 ;
 wire [8:0] mcgc8phy7idmpeeybc8po_384 ;
 wire	bwh5zbknpsqifl2kdrn_585 ;
 wire	jsraxu9r5r6sx6nwe5lt2jf4jr8kz_804 ;
 wire	mgw9ihtfe7xk1zx27fz_278 ;
 wire	m3gexrl06ar003qhkazbf9dj6g3qx_116 ;
 wire	qqjt5zywvt1lqvxin8lxkx423v_805 ;
 wire	en4bb3dw5xa2wfch_312 ;
 wire	sdpyog2uhrrmp7r9msci43pv5_77 ;
 wire [159:0] ewyavuvda5zrj5k3znolwd_295 ;
 wire	tf0845ldbrf5i9rw7havzme6f7_768 ;
 wire [159:0] kj3syfbq2rrzo1dqvya_788 ;
 wire	jmqrjsf29b20uhbq_290 ;
 wire	mddtx2ubjx8ax5omxp9awwn_14 ;
 wire	or9qci17a0y30n8l9foes_110 ;
 wire [23:0] kvm1hthzedwn5moy7anitk_101 ;
 wire	ihyhcouk2woiulo9cpp_665 ;
 wire [23:0] xz24opf3o8rmdo4k1ctjhlj_735 ;
 wire	kpkdemr0qqavbn73tii0z1dqt0_594 ;
 wire	eu7uf7g1ihafr9lugu_896 ;
 wire	ilb44p6oif2dc20zsb25a7_83 ;
 wire	n2ud37ksyzb4efh4eg4hhufrmh1vg_564 ;
 wire	srq4199atxi004lrmt1e9b77uqhb44km_318 ;


 assign ckjq9vd7gxc37cxv2e7xkd3z5zeriwk_209 = 
	 ~(backpressure_in) ;
 assign gyyqshzjhcyn0flk_410 = 
	{packet_in_PACKET2_SOF, packet_in_PACKET2_EOF, packet_in_PACKET2_VAL, packet_in_PACKET2_DAT, packet_in_PACKET2_CNT, packet_in_PACKET2_ERR} ;
 assign ambh7x2ovmjz9gya_86 	= packet_in_PACKET2_VAL ;
 assign djt0c57kh3xvky8oywq_605 	= gyyqshzjhcyn0flk_410[265:0] ;
 assign fj13owg0e4yzi2ec4y329qr3_242 = 
	m3gexrl06ar003qhkazbf9dj6g3qx_116 | n2ud37ksyzb4efh4eg4hhufrmh1vg_564 ;
 assign a8o6lbzhgw9n5piskhuo430s1_617 = 
	1'b0 ;
 assign lmwx4hn32dzb849l83orwfc8_595 = 
	1'b1 ;
 assign bfux81ihvoqgdav8eethek_698 = 
	 ~(n8kkytnxbhhlhuc42_815) ;
 assign rsg9e79xxx2whtgx7_110 = 
	ckjq9vd7gxc37cxv2e7xkd3z5zeriwk_209 & en4bb3dw5xa2wfch_312 & fj13owg0e4yzi2ec4y329qr3_242 ;
 assign r84c49x28kuplv0l9iy7bb42jrdp_501 	= rsg9e79xxx2whtgx7_110 ;
 assign s2v51u84158anjcqo5x_571 	= r84c49x28kuplv0l9iy7bb42jrdp_501 ;
 assign dzskhkda1bnb7bw6sfr7_121 = 
	1'b0 ;
 assign dz8figces8k7vgcm_838 = 
	 ~(oygm3hkzes9grmpyc4upy_739) ;
 assign bob7c9zcso9wz8zoc522zyp6_763 	= gtfi0kyw6ewz1yj2nki60on7bgzo_318[0] ;
 assign qhqoxt1g9g0k63wj8ppov38uo3719k_858 	= gtfi0kyw6ewz1yj2nki60on7bgzo_318[6:1] ;
 assign cct4lexbtkbdo6k7_29 	= gtfi0kyw6ewz1yj2nki60on7bgzo_318[262:7] ;
 assign prrhncayqwu8t4rs0hcopqwl5_468 	= gtfi0kyw6ewz1yj2nki60on7bgzo_318[263] ;
 assign co8jxw29dxy3u0nstdlagam7b_67 	= gtfi0kyw6ewz1yj2nki60on7bgzo_318[264] ;
 assign wafuka85nr4bw5fpa3_525 	= gtfi0kyw6ewz1yj2nki60on7bgzo_318[265] ;
 assign o9hfgvpgqvwoe02cv16gq1uazxbarq9_642 = 
	pmvcwlmqzq9w6s5ys5_545 & prrhncayqwu8t4rs0hcopqwl5_468 ;
 assign mpok8p8h7crr8xl48l7z_263 	= packet_in_PACKET2_VAL ;
 assign w5ah6so9vnsgmyoh_720 = packet_in_PACKET2_SOF ;
 assign jpzxv21bwc4kjbvafqj0i88c70dd_154 	= r84c49x28kuplv0l9iy7bb42jrdp_501 ;
 assign k3exntgafrrsdxkqze3867304cukk_322 = 
	1'b0 ;
 assign mcgc8phy7idmpeeybc8po_384 	= jreue1ltmk7j4my8o4cl5kn_439[8:0] ;
 assign bwh5zbknpsqifl2kdrn_585 = (
	((mcgc8phy7idmpeeybc8po_384 != dzvd4ifhk75y29fl090praj_260))?1'b1:
	0)  ;
 assign jsraxu9r5r6sx6nwe5lt2jf4jr8kz_804 = o4sv7ghgy36g5livq12zeuwwdyc_4 ;
 assign mgw9ihtfe7xk1zx27fz_278 = o4sv7ghgy36g5livq12zeuwwdyc_4 ;
 assign m3gexrl06ar003qhkazbf9dj6g3qx_116 = 
	 ~(mgw9ihtfe7xk1zx27fz_278) ;
 assign qqjt5zywvt1lqvxin8lxkx423v_805 	= dgfumv7hy9n7dr5r6jsm9pvfwcl9bpl_523 ;
 assign en4bb3dw5xa2wfch_312 = 
	 ~(dgfumv7hy9n7dr5r6jsm9pvfwcl9bpl_523) ;
 assign sdpyog2uhrrmp7r9msci43pv5_77 = 
	ckjq9vd7gxc37cxv2e7xkd3z5zeriwk_209 & n2ud37ksyzb4efh4eg4hhufrmh1vg_564 & en4bb3dw5xa2wfch_312 & jsraxu9r5r6sx6nwe5lt2jf4jr8kz_804 ;
 assign ewyavuvda5zrj5k3znolwd_295 = 
	tuple_in_TUPLE0_DATA ;
 assign tf0845ldbrf5i9rw7havzme6f7_768 	= tuple_in_TUPLE0_VALID ;
 assign kj3syfbq2rrzo1dqvya_788 	= ewyavuvda5zrj5k3znolwd_295[159:0] ;
 assign jmqrjsf29b20uhbq_290 = 
	 ~(gbsp04jzb7wt26iz51ddcn5yjuv8_866) ;
 assign mddtx2ubjx8ax5omxp9awwn_14 	= sdpyog2uhrrmp7r9msci43pv5_77 ;
 assign or9qci17a0y30n8l9foes_110 = 
	1'b0 ;
 assign kvm1hthzedwn5moy7anitk_101 = 
	tuple_in_TUPLE1_DATA ;
 assign ihyhcouk2woiulo9cpp_665 	= tuple_in_TUPLE1_VALID ;
 assign xz24opf3o8rmdo4k1ctjhlj_735 	= kvm1hthzedwn5moy7anitk_101[23:0] ;
 assign kpkdemr0qqavbn73tii0z1dqt0_594 = 
	 ~(tfp11pvpab086ha9jcrxqp499zvvhk_774) ;
 assign eu7uf7g1ihafr9lugu_896 	= sdpyog2uhrrmp7r9msci43pv5_77 ;
 assign ilb44p6oif2dc20zsb25a7_83 = 
	1'b0 ;
 assign n2ud37ksyzb4efh4eg4hhufrmh1vg_564 = 
	dz8figces8k7vgcm_838 & jmqrjsf29b20uhbq_290 & kpkdemr0qqavbn73tii0z1dqt0_594 ;
 assign srq4199atxi004lrmt1e9b77uqhb44km_318 = 
	ucrt7is97s9nxaa5x3l1l3yf_406 | x09gknfuy9givgg3f4lkenoyjg_128 | i6ai857hs463rm7wb4rv9dh3q6_444 ;
 assign packet_out_PACKET2_SOF 	= wafuka85nr4bw5fpa3_525 ;
 assign packet_out_PACKET2_EOF 	= co8jxw29dxy3u0nstdlagam7b_67 ;
 assign packet_out_PACKET2_VAL 	= o9hfgvpgqvwoe02cv16gq1uazxbarq9_642 ;
 assign packet_out_PACKET2_DAT 	= cct4lexbtkbdo6k7_29[255:0] ;
 assign packet_out_PACKET2_CNT 	= qhqoxt1g9g0k63wj8ppov38uo3719k_858[5:0] ;
 assign packet_out_PACKET2_ERR 	= bob7c9zcso9wz8zoc522zyp6_763 ;
 assign packet_in_PACKET2_RDY 	= packet_out_PACKET2_RDY ;
 assign tuple_out_TUPLE0_VALID 	= gguyd94ocnt47ot4bj9z01_225 ;
 assign tuple_out_TUPLE0_DATA 	= p3ikm86lgwhp2bwi2xpcosrj7e88_559[159:0] ;
 assign tuple_out_TUPLE1_VALID 	= gguyd94ocnt47ot4bj9z01_225 ;
 assign tuple_out_TUPLE1_DATA 	= eglmpg5ysxljqhzaqds1g5mw63e4sd_766[23:0] ;


assign h22n3fea91commzkxsqe_466 = (
	((r84c49x28kuplv0l9iy7bb42jrdp_501 == 1'b1))?lmwx4hn32dzb849l83orwfc8_595 :
	((ckjq9vd7gxc37cxv2e7xkd3z5zeriwk_209 == 1'b1))?a8o6lbzhgw9n5piskhuo430s1_617 :
	bh230l0u2aye6b4l20gegep11iwe6sx_560 ) ;

assign n8kkytnxbhhlhuc42_815 = (
	((bh230l0u2aye6b4l20gegep11iwe6sx_560 == 1'b1) && (ckjq9vd7gxc37cxv2e7xkd3z5zeriwk_209 == 1'b1))?a8o6lbzhgw9n5piskhuo430s1_617 :
	bh230l0u2aye6b4l20gegep11iwe6sx_560 ) ;



always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	qa5531gqyw3svfi56lefhk28k_630 <= 1'b0 ;
	bh230l0u2aye6b4l20gegep11iwe6sx_560 <= 1'b0 ;
	cysxs5e037mz681hprast2df0_336 <= 1'b0 ;
	pmvcwlmqzq9w6s5ys5_545 <= 1'b0 ;
	dzvd4ifhk75y29fl090praj_260 <= 9'b000000000 ;
	ucrt7is97s9nxaa5x3l1l3yf_406 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		qa5531gqyw3svfi56lefhk28k_630 <= backpressure_in ;
		bh230l0u2aye6b4l20gegep11iwe6sx_560 <= h22n3fea91commzkxsqe_466 ;
		cysxs5e037mz681hprast2df0_336 <= dz8figces8k7vgcm_838 ;
		pmvcwlmqzq9w6s5ys5_545 <= r84c49x28kuplv0l9iy7bb42jrdp_501 ;
		dzvd4ifhk75y29fl090praj_260 <= mcgc8phy7idmpeeybc8po_384 ;
		ucrt7is97s9nxaa5x3l1l3yf_406 <= ri6b8n1mhmugfbfr7qbm7t6oz5o_799 ;
		backpressure_out <= srq4199atxi004lrmt1e9b77uqhb44km_318 ;
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	gguyd94ocnt47ot4bj9z01_225 <= 1'b0 ;
	x09gknfuy9givgg3f4lkenoyjg_128 <= 1'b0 ;
   end
  else
  begin
		gguyd94ocnt47ot4bj9z01_225 <= sdpyog2uhrrmp7r9msci43pv5_77 ;
		x09gknfuy9givgg3f4lkenoyjg_128 <= wbuqwoz6o3089ibuptepkh4wf_251 ;
  end
end

always @(posedge clk_out_2)
begin
  if (rst_in_0) 
  begin
	i6ai857hs463rm7wb4rv9dh3q6_444 <= 1'b0 ;
   end
  else
  begin
		i6ai857hs463rm7wb4rv9dh3q6_444 <= bkm617n8s7hnpdt9ruyb6mak_320 ;
  end
end

defparam vz8m5031flyd8ten80fk_750.WRITE_DATA_WIDTH = 266; 
defparam vz8m5031flyd8ten80fk_750.FIFO_WRITE_DEPTH = 512; 
defparam vz8m5031flyd8ten80fk_750.PROG_FULL_THRESH = 129; 
defparam vz8m5031flyd8ten80fk_750.PROG_EMPTY_THRESH = 129; 
defparam vz8m5031flyd8ten80fk_750.READ_MODE = "STD"; 
defparam vz8m5031flyd8ten80fk_750.WR_DATA_COUNT_WIDTH = 9; 
defparam vz8m5031flyd8ten80fk_750.RD_DATA_COUNT_WIDTH = 9; 
defparam vz8m5031flyd8ten80fk_750.DOUT_RESET_VALUE = "0"; 
defparam vz8m5031flyd8ten80fk_750.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_sync vz8m5031flyd8ten80fk_750 (
	.wr_en(ambh7x2ovmjz9gya_86),
	.din(djt0c57kh3xvky8oywq_605),
	.rd_en(s2v51u84158anjcqo5x_571),
	.sleep(dzskhkda1bnb7bw6sfr7_121),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(qgaa97krqcevihik551u9xfmvwb_121), 
	.dout(gtfi0kyw6ewz1yj2nki60on7bgzo_318), 
	.empty(oygm3hkzes9grmpyc4upy_739), 
	.prog_full(ri6b8n1mhmugfbfr7qbm7t6oz5o_799), 
	.full(wm6k027w1m4klib1q11ug7gpvgyyaw_371), 
	.rd_data_count(v047lsuec693o9mh0r4iczl_599), 
	.wr_data_count(q5bi6vtyfcnrja1w713wu_363), 
	.wr_rst_busy(v68p7i29p4jnkrda0kde_797), 
	.rd_rst_busy(v0q550tg1l2jkc8t_634), 
	.overflow(rjbv7qb0xib99xy4hdghzj6hkj4sem_697), 
	.underflow(ssz13fg07f8ubh1wt1saeuvkdkt1y_516), 
	.sbiterr(ozzy0b5fpkt5vi0jicxxmhdorr41_825), 
	.dbiterr(d196jjboxh4wxncr3ozn_476), 
	.almost_empty(ktxpwkay6cxl6hpft4uqaq24llk9d3_745), 
	.almost_full(tprk1sssxyqavciufd9qz7yi0_884), 
	.wr_ack(d9qtotwzb0kgmz5zsdj8dny8tm85kd_786), 
	.data_valid(acg9a3v3tfv915x8u11nma0_746), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam zbse62l1raxc6ejt82hx4nwjhga_1368.WRITE_DATA_WIDTH = 1; 
defparam zbse62l1raxc6ejt82hx4nwjhga_1368.FIFO_WRITE_DEPTH = 512; 
defparam zbse62l1raxc6ejt82hx4nwjhga_1368.PROG_FULL_THRESH = 129; 
defparam zbse62l1raxc6ejt82hx4nwjhga_1368.PROG_EMPTY_THRESH = 129; 
defparam zbse62l1raxc6ejt82hx4nwjhga_1368.READ_MODE = "FWFT"; 
defparam zbse62l1raxc6ejt82hx4nwjhga_1368.WR_DATA_COUNT_WIDTH = 9; 
defparam zbse62l1raxc6ejt82hx4nwjhga_1368.RD_DATA_COUNT_WIDTH = 9; 
defparam zbse62l1raxc6ejt82hx4nwjhga_1368.DOUT_RESET_VALUE = "0"; 
defparam zbse62l1raxc6ejt82hx4nwjhga_1368.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_sync zbse62l1raxc6ejt82hx4nwjhga_1368 (
	.wr_en(mpok8p8h7crr8xl48l7z_263),
	.din(w5ah6so9vnsgmyoh_720),
	.rd_en(jpzxv21bwc4kjbvafqj0i88c70dd_154),
	.sleep(k3exntgafrrsdxkqze3867304cukk_322),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(lprl91vko83511r6bibr7p5v5m8ngoc_807), 
	.dout(o4sv7ghgy36g5livq12zeuwwdyc_4), 
	.empty(dgfumv7hy9n7dr5r6jsm9pvfwcl9bpl_523), 
	.prog_full(xaafzvnpyv34427f4nz_390), 
	.full(ko8lw5gw9vivbqovtj1iau65oo9p9_841), 
	.rd_data_count(jreue1ltmk7j4my8o4cl5kn_439), 
	.wr_data_count(oj2dcf7hy8ocmv9ww_567), 
	.wr_rst_busy(p9suyfuj9ja7xaa4a14_205), 
	.rd_rst_busy(fdmt4shwnfghrjklbaq7ota7vab3t6_80), 
	.overflow(awc06riocb2usi8n6ymt2dzsqrhw_664), 
	.underflow(frli6kasm6r5o9byxwa8zoy0w4u_152), 
	.sbiterr(knc6i2zx1wx35ep1tkgqffcei_528), 
	.dbiterr(fig03ua64w4asswab8vpjscponpdj7_74), 
	.almost_empty(tac6z2y560nabvgp8uepw2zqytglrghd_491), 
	.almost_full(ulkqfjx9fmsenquow_708), 
	.wr_ack(tchnizq5y7ya2rneo3p9twpduuckilf_138), 
	.data_valid(y0bpead8qhl0mzrg3wwz57j2qsubtusj_65), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam kpfvz7qxbe58z567u0iofeuoinzggxg_1463.WRITE_DATA_WIDTH = 160; 
defparam kpfvz7qxbe58z567u0iofeuoinzggxg_1463.FIFO_WRITE_DEPTH = 256; 
defparam kpfvz7qxbe58z567u0iofeuoinzggxg_1463.PROG_FULL_THRESH = 66; 
defparam kpfvz7qxbe58z567u0iofeuoinzggxg_1463.PROG_EMPTY_THRESH = 66; 
defparam kpfvz7qxbe58z567u0iofeuoinzggxg_1463.READ_MODE = "STD"; 
defparam kpfvz7qxbe58z567u0iofeuoinzggxg_1463.WR_DATA_COUNT_WIDTH = 8; 
defparam kpfvz7qxbe58z567u0iofeuoinzggxg_1463.RD_DATA_COUNT_WIDTH = 8; 
defparam kpfvz7qxbe58z567u0iofeuoinzggxg_1463.DOUT_RESET_VALUE = "0"; 
defparam kpfvz7qxbe58z567u0iofeuoinzggxg_1463.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async kpfvz7qxbe58z567u0iofeuoinzggxg_1463 (
	.wr_en(tf0845ldbrf5i9rw7havzme6f7_768),
	.din(kj3syfbq2rrzo1dqvya_788),
	.rd_en(mddtx2ubjx8ax5omxp9awwn_14),
	.sleep(or9qci17a0y30n8l9foes_110),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(wgq9c8i1fdtrbcjm1sk4i04at3u_61), 
	.dout(p3ikm86lgwhp2bwi2xpcosrj7e88_559), 
	.empty(gbsp04jzb7wt26iz51ddcn5yjuv8_866), 
	.prog_full(wbuqwoz6o3089ibuptepkh4wf_251), 
	.full(g9sp50efje973kxyk52okggdjg_787), 
	.rd_data_count(c4orr1d2bsk12920acysamf0x3ho_715), 
	.wr_data_count(xil3ws7wdqze03ygg6v5k2o3_66), 
	.wr_rst_busy(eyigfd6ka6fsva6cq7et5z2xy8_645), 
	.rd_rst_busy(y07b48t8hlmm9avd9i7sraaocbl7spy_843), 
	.overflow(k7edny0ooiknc8pd9_510), 
	.underflow(hmj7hrlnmrg57vn7ib_239), 
	.sbiterr(qz65ddzc2a2i8as09i_29), 
	.dbiterr(wxpavhkc6qa0ujgne9huw6gu6_161), 
	.almost_empty(tcr9vo72tfnov0u9875gs066a9_361), 
	.almost_full(rlgvk7x1ng6dvh1kjlomm1vq_459), 
	.wr_ack(p95f17bqzy5awxev6h5b_285), 
	.data_valid(k01htbc199c52dxv8m4nc_730), 

	.wr_clk(clk_in_1), 

	.rd_clk(clk_out_1), 
	.rst(rst_in_1) 
); 

defparam nf4hi0n1owbmtklz9z16b_1595.WRITE_DATA_WIDTH = 24; 
defparam nf4hi0n1owbmtklz9z16b_1595.FIFO_WRITE_DEPTH = 256; 
defparam nf4hi0n1owbmtklz9z16b_1595.PROG_FULL_THRESH = 65; 
defparam nf4hi0n1owbmtklz9z16b_1595.PROG_EMPTY_THRESH = 65; 
defparam nf4hi0n1owbmtklz9z16b_1595.READ_MODE = "STD"; 
defparam nf4hi0n1owbmtklz9z16b_1595.WR_DATA_COUNT_WIDTH = 8; 
defparam nf4hi0n1owbmtklz9z16b_1595.RD_DATA_COUNT_WIDTH = 8; 
defparam nf4hi0n1owbmtklz9z16b_1595.DOUT_RESET_VALUE = "0"; 
defparam nf4hi0n1owbmtklz9z16b_1595.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_async nf4hi0n1owbmtklz9z16b_1595 (
	.wr_en(ihyhcouk2woiulo9cpp_665),
	.din(xz24opf3o8rmdo4k1ctjhlj_735),
	.rd_en(eu7uf7g1ihafr9lugu_896),
	.sleep(ilb44p6oif2dc20zsb25a7_83),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(uk7fudk4kr1gh1ub4mhkvdgbfcgp0uzd_79), 
	.dout(eglmpg5ysxljqhzaqds1g5mw63e4sd_766), 
	.empty(tfp11pvpab086ha9jcrxqp499zvvhk_774), 
	.prog_full(bkm617n8s7hnpdt9ruyb6mak_320), 
	.full(fpmqveoai6jibk51jcw66n0p42u3dwz_497), 
	.rd_data_count(heqtylr8s21m75aepne7a785n21xu33_348), 
	.wr_data_count(oedhj6x0w9vo1rmp_519), 
	.wr_rst_busy(sr0vdcj0rm95gzegf34n1hwumfid6_868), 
	.rd_rst_busy(y2clciwk2t53cl5xqpvts0rgq7fr4k_257), 
	.overflow(mc5u7eqwvhspj6gwym1v_489), 
	.underflow(yfwinu2rfq47tsmppzaggsaxtqgr3_371), 
	.sbiterr(z20t0fjz0hwdzm7dt7vcc_331), 
	.dbiterr(on99tbjyi93ex1csm6vg_374), 
	.almost_empty(fvi4ezzbp9i5ujpau0_22), 
	.almost_full(ntaassdura4yybf3_660), 
	.wr_ack(fsad26gn86cepazp48jpo_338), 
	.data_valid(k2arjcw2tdrf2ra467on7fjlcemyl_221), 

	.wr_clk(clk_in_2), 

	.rd_clk(clk_out_2), 
	.rst(rst_in_2) 
); 

endmodule 
