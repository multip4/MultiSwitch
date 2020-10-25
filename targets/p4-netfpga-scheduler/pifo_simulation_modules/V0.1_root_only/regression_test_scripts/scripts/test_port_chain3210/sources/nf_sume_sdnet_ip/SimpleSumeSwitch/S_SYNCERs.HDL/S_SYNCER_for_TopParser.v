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
// File created: 2020/10/07 14:57:22
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






 reg	coi0k0zcwvs1cjalxzlrhyjr4ohya_215;	 initial coi0k0zcwvs1cjalxzlrhyjr4ohya_215 = 1'b0 ;
 wire	nw7tnash9s6mfsdxuz086yw1p9_592 ;
 wire [265:0] m0a8tc9bu595vurhj2_395 ;
 wire	zahoew21qttq2awwc_109 ;
 wire	g1twavzc7otvmjri1nebjh2w6fg_328 ;
 wire	o3jqbrt6h3dww0pnonsiydovntxrwj5_318 ;
 wire [8:0] qqgaiyqlwoyegebo07_206 ;
 wire [8:0] lybej7x7mzuiuug1wg2f9nsvpwcudtq_769 ;
 wire	e8p8c08psx46ht5cea_895 ;
 wire	kpgk5zgt19dlklpqs5uc_65 ;
 wire	nv2sl5w0g83ev8oll1cezy678en0oxcr_521 ;
 wire	wu2uy4dkj3j07h7p9750tm98iia_475 ;
 wire	aomoc2srbo3xdprpchmqy3k_262 ;
 wire	nzbt49umaoveyizs5k4_51 ;
 wire	wrsccwzdtf8jq70ppz3tzhy4ilfkgj_497 ;
 wire	jcwji7trrs3k37e45jm0vt_402 ;
 wire	yaug9rxokbwcby1hem9q4uuldxkjq_457 ;
 wire	bdhd5kva72289ikiep8n9s9tc_571 ;
 wire	m48xw2b0qwrvgmj3_6 ;
 reg	wf89rjd13isl335ho55zzotghkb3vq4k_714;	 initial wf89rjd13isl335ho55zzotghkb3vq4k_714 = 1'b0 ;
 wire	i08t5gi59thgblducblyg1h3pcldiw_102 ;
 reg	fyuoduqr8zhtrzkuoqumrd_277;	 initial fyuoduqr8zhtrzkuoqumrd_277 = 1'b0 ;
 reg	foxoksy6nwvi14yuawm91ooh9d77b_236;	 initial foxoksy6nwvi14yuawm91ooh9d77b_236 = 1'b0 ;
 wire	u9kk6dnptqsilhesdv1lh813_129 ;
 wire [0:0] remxfkekb95b6dzuv246cbbge8tuz0_663 ;
 wire	a367j81rurxve4lybb_740 ;
 wire	o1yl4fn9cm4eeqcold9b63kti936l9_132 ;
 wire	s8gwgxjg5ss1sgqin261k2_437 ;
 wire [8:0] un9kh5y3zzhepfxrb_635 ;
 wire [8:0] zid9fdshg1de8ey6txocpdjddla4t_183 ;
 wire	amycr3zfdicpt9i35k_432 ;
 wire	bc5aebejlw5ta7my_590 ;
 wire	p8fnfzz1xv23djdizuhfs6umx7ggcik_722 ;
 wire	fk54vc1kvmsrgaxa5pjdb_894 ;
 wire	oli4z1doxzzg9kge312qq_381 ;
 wire	miywko94k0ru2g1cj_259 ;
 wire	vhms0j383f3lydugjap4fuekrxjbi_104 ;
 wire	jsz3zcz2hxzquyr5g7m_102 ;
 wire	a3eqc5nabubngddoic6jrbuvlbg2huhn_671 ;
 wire	mgb0hkdkciir288270c7zivf_371 ;
 reg [8:0] rlzum6hzczjfuroi7zqevi9b_497;	 initial rlzum6hzczjfuroi7zqevi9b_497 = 9'b000000000 ;
 reg	yazmioh2616iqakvdojaxocl_139;	 initial yazmioh2616iqakvdojaxocl_139 = 1'b0 ;
 wire	px9pa1n30qc8gxiexw67lo8qsxn0o9iz_184 ;
 wire [159:0] z62i13mhzgw2hd78fpkuvcllp1yn8e_881 ;
 wire	lggh48s6j5hzavvzjay7s7tu0k_530 ;
 wire	midth170mxe1ryy10g6foqnp4de_284 ;
 wire	foorxs9s9xwahtidf7m3xplj2cl_134 ;
 wire [7:0] ls7th5wb2dibbzqlzjxoxs78ul4tw9y_796 ;
 wire [7:0] xl4kb3d5n7pwyrghv_137 ;
 wire	iiu9n7ms6zieugpj_369 ;
 wire	mqeb28227iby6lfnjh42k5ebwnp8_896 ;
 wire	jwoij48j0min68eqkpa3fuqpujwgp3_445 ;
 wire	aq57s1xyz70r4ooi_516 ;
 wire	ummhyf0y9c5vwrf4hf42gldmwwwzs4_267 ;
 wire	mt6wk6zy3sqa0it51kr5piakwe_303 ;
 wire	yzj0jbhkphfotmbrg6ps9z6ya8rwt_221 ;
 wire	j4efhb21cbk1zqt1_306 ;
 wire	jt9l22hnee8y603a2u3lwwcpfyj6m80_885 ;
 wire	ciy8mvzk139askzq3n0riscfqx_140 ;
 wire	av9v4l9ruypbms5fc383zv_54 ;
 wire [23:0] kh1fu9dmpjcpb9now01z2cb67p8iv90_412 ;
 wire	y4m4sespbma8ed5x_682 ;
 wire	naynkag2amq2cczbtdb9nk3vuftilkw_670 ;
 wire	g0mb69sn1nw912s5co_852 ;
 wire [7:0] siuxx8owom56ypfg8xp6399iktan_550 ;
 wire [7:0] zdw01rj8pp19rts2gzk337oiew8nl_295 ;
 wire	ky8yapeeqm0r50oches2fdnyw8hscusz_640 ;
 wire	ftz2x0fd14ldtrblpfw4q15fwi5_401 ;
 wire	zoguhuv7mu8bbw0cj0q_67 ;
 wire	zyes3swc8gvlr0x0mf_884 ;
 wire	ryulks6mykgddubb217m_757 ;
 wire	q83c7s6tmdb38kwnv42db1lis_759 ;
 wire	msfch5axuw9vde27irs90e_468 ;
 wire	vddi8gep8nrlwgvz3_250 ;
 wire	lzx3ai5t37rrh2z1jh_333 ;
 wire	ebp51tfl6axjkt1pawjr9phpmz8fo6ki_318 ;
 reg	weax72tch3gd0okwgq_669;	 initial weax72tch3gd0okwgq_669 = 1'b0 ;
 reg	ct846adcxzhl6afyenuxzp8qdg9_864;	 initial ct846adcxzhl6afyenuxzp8qdg9_864 = 1'b0 ;
 reg	lmj2dlhlka0ljakww7erllez3k_402;	 initial lmj2dlhlka0ljakww7erllez3k_402 = 1'b0 ;
 wire	u48u7u68tt1hpacic_235 ;
 wire [265:0] iqy01f3yciq4oy7cy27tf7hvm08t_53 ;
 wire	jk7io2s4xbn6vacgyc_845 ;
 wire [265:0] qcorbj1q3ohk20ap_861 ;
 wire	tirfacvxg2unnhca2a6_461 ;
 wire	ctjf85bs7avihu2e2fe1wt4l071u_829 ;
 wire	hbqelh7ct161663h77q_73 ;
 wire	n7qyhqgdkjo81o8mtqtg44t_507 ;
 wire	h6rovoxeop5c276a4k3y_607 ;
 wire	ijwe7199mdgb5p94iw3_190 ;
 wire	vcs1mh2c82id7cfttpt1eb2cmuq_491 ;
 wire	rsi0oq1ny1d9x38l4lhih9xyzwc2_493 ;
 wire	zrk2qv3hvxx2hcpe_529 ;
 wire	xbtw2kyzt4aw89he8wnqy0_739 ;
 wire [5:0] mf701qfmyifcihodo8kg5vwy14br5_632 ;
 wire [255:0] eear1140zx81dpaomo70e_792 ;
 wire	nq62m06tql1b78m6rosnh6c4_483 ;
 wire	eg64dkikernzgqvf_837 ;
 wire	jtiad0fxxyksun5gt8gggdebdm_736 ;
 wire	o9yxh58p9vleeypf8_267 ;
 wire	osf0z4s40l8o9l08kkplviuns7dsp_303 ;
 wire [0:0] uc1ejk3pydxwsofsd8d79_600 ;
 wire	rh3ug412xuyp49gk_313 ;
 wire	vaw6gyjfht5o3zvunz5q_564 ;
 wire [8:0] o7i6yf6mv20rpasrfxomi7as5z1gwbu1_515 ;
 wire	kgchdl03ciahlg8xasmk_198 ;
 wire	e0zxf1u3zsq2b8w2k9oswwir9vj_137 ;
 wire	y4nmjmxh2tv5a9oy_849 ;
 wire	sw8ei47prfihh5rskguqvjx8z8m3_832 ;
 wire	uj650fp1hz585p0s8zykpc6anuo3459_202 ;
 wire	vt17nzjrj8r89sr8gvyb8l0yg9wylad6_690 ;
 wire	dkcqcwvgy7xxxak7useuehfvhk99amm8_87 ;
 wire [159:0] llx2id3f899aua48_591 ;
 wire	pa1srz3oeue2ha0yc_131 ;
 wire [159:0] jxpwvnw47p5hbje82sbog_739 ;
 wire	hlkx9d06f87nhq46gn_221 ;
 wire	xzfpwk0joju70bz4z7k8nzrtpg2t_345 ;
 wire	jqvc9jzc2olpczmn26vgih_134 ;
 wire [23:0] unec9t1fgmk8ip6txjra1ffcnxndce7_205 ;
 wire	c0ot5dqixvb9qr33bdtnr7_294 ;
 wire [23:0] ibjk05pzuwc7qmk8_217 ;
 wire	wl5n252ylc0hu7tecz7p9274agp_873 ;
 wire	f8qwguijy1jyszo0_261 ;
 wire	u6yhotfd9ta1cvtso6sxu0_665 ;
 wire	ymhuyoy0ggtpdsc5j8g3wfsbe6_72 ;
 wire	v6vzjimvxi1sdxxg6bcssb3iab67_623 ;


 assign u48u7u68tt1hpacic_235 = 
	 ~(backpressure_in) ;
 assign iqy01f3yciq4oy7cy27tf7hvm08t_53 = 
	{packet_in_PACKET2_SOF, packet_in_PACKET2_EOF, packet_in_PACKET2_VAL, packet_in_PACKET2_DAT, packet_in_PACKET2_CNT, packet_in_PACKET2_ERR} ;
 assign jk7io2s4xbn6vacgyc_845 	= packet_in_PACKET2_VAL ;
 assign qcorbj1q3ohk20ap_861 	= iqy01f3yciq4oy7cy27tf7hvm08t_53[265:0] ;
 assign tirfacvxg2unnhca2a6_461 = 
	sw8ei47prfihh5rskguqvjx8z8m3_832 | ymhuyoy0ggtpdsc5j8g3wfsbe6_72 ;
 assign ctjf85bs7avihu2e2fe1wt4l071u_829 = 
	1'b0 ;
 assign hbqelh7ct161663h77q_73 = 
	1'b1 ;
 assign n7qyhqgdkjo81o8mtqtg44t_507 = 
	 ~(i08t5gi59thgblducblyg1h3pcldiw_102) ;
 assign h6rovoxeop5c276a4k3y_607 = 
	u48u7u68tt1hpacic_235 & vt17nzjrj8r89sr8gvyb8l0yg9wylad6_690 & tirfacvxg2unnhca2a6_461 ;
 assign ijwe7199mdgb5p94iw3_190 	= h6rovoxeop5c276a4k3y_607 ;
 assign vcs1mh2c82id7cfttpt1eb2cmuq_491 	= ijwe7199mdgb5p94iw3_190 ;
 assign rsi0oq1ny1d9x38l4lhih9xyzwc2_493 = 
	1'b0 ;
 assign zrk2qv3hvxx2hcpe_529 = 
	 ~(zahoew21qttq2awwc_109) ;
 assign xbtw2kyzt4aw89he8wnqy0_739 	= m0a8tc9bu595vurhj2_395[0] ;
 assign mf701qfmyifcihodo8kg5vwy14br5_632 	= m0a8tc9bu595vurhj2_395[6:1] ;
 assign eear1140zx81dpaomo70e_792 	= m0a8tc9bu595vurhj2_395[262:7] ;
 assign nq62m06tql1b78m6rosnh6c4_483 	= m0a8tc9bu595vurhj2_395[263] ;
 assign eg64dkikernzgqvf_837 	= m0a8tc9bu595vurhj2_395[264] ;
 assign jtiad0fxxyksun5gt8gggdebdm_736 	= m0a8tc9bu595vurhj2_395[265] ;
 assign o9yxh58p9vleeypf8_267 = 
	foxoksy6nwvi14yuawm91ooh9d77b_236 & nq62m06tql1b78m6rosnh6c4_483 ;
 assign osf0z4s40l8o9l08kkplviuns7dsp_303 	= packet_in_PACKET2_VAL ;
 assign uc1ejk3pydxwsofsd8d79_600 = packet_in_PACKET2_SOF ;
 assign rh3ug412xuyp49gk_313 	= ijwe7199mdgb5p94iw3_190 ;
 assign vaw6gyjfht5o3zvunz5q_564 = 
	1'b0 ;
 assign o7i6yf6mv20rpasrfxomi7as5z1gwbu1_515 	= un9kh5y3zzhepfxrb_635[8:0] ;
 assign kgchdl03ciahlg8xasmk_198 = (
	((o7i6yf6mv20rpasrfxomi7as5z1gwbu1_515 != rlzum6hzczjfuroi7zqevi9b_497))?1'b1:
	0)  ;
 assign e0zxf1u3zsq2b8w2k9oswwir9vj_137 = remxfkekb95b6dzuv246cbbge8tuz0_663 ;
 assign y4nmjmxh2tv5a9oy_849 = remxfkekb95b6dzuv246cbbge8tuz0_663 ;
 assign sw8ei47prfihh5rskguqvjx8z8m3_832 = 
	 ~(y4nmjmxh2tv5a9oy_849) ;
 assign uj650fp1hz585p0s8zykpc6anuo3459_202 	= a367j81rurxve4lybb_740 ;
 assign vt17nzjrj8r89sr8gvyb8l0yg9wylad6_690 = 
	 ~(a367j81rurxve4lybb_740) ;
 assign dkcqcwvgy7xxxak7useuehfvhk99amm8_87 = 
	u48u7u68tt1hpacic_235 & ymhuyoy0ggtpdsc5j8g3wfsbe6_72 & vt17nzjrj8r89sr8gvyb8l0yg9wylad6_690 & e0zxf1u3zsq2b8w2k9oswwir9vj_137 ;
 assign llx2id3f899aua48_591 = 
	tuple_in_TUPLE0_DATA ;
 assign pa1srz3oeue2ha0yc_131 	= tuple_in_TUPLE0_VALID ;
 assign jxpwvnw47p5hbje82sbog_739 	= llx2id3f899aua48_591[159:0] ;
 assign hlkx9d06f87nhq46gn_221 = 
	 ~(lggh48s6j5hzavvzjay7s7tu0k_530) ;
 assign xzfpwk0joju70bz4z7k8nzrtpg2t_345 	= dkcqcwvgy7xxxak7useuehfvhk99amm8_87 ;
 assign jqvc9jzc2olpczmn26vgih_134 = 
	1'b0 ;
 assign unec9t1fgmk8ip6txjra1ffcnxndce7_205 = 
	tuple_in_TUPLE1_DATA ;
 assign c0ot5dqixvb9qr33bdtnr7_294 	= tuple_in_TUPLE1_VALID ;
 assign ibjk05pzuwc7qmk8_217 	= unec9t1fgmk8ip6txjra1ffcnxndce7_205[23:0] ;
 assign wl5n252ylc0hu7tecz7p9274agp_873 = 
	 ~(y4m4sespbma8ed5x_682) ;
 assign f8qwguijy1jyszo0_261 	= dkcqcwvgy7xxxak7useuehfvhk99amm8_87 ;
 assign u6yhotfd9ta1cvtso6sxu0_665 = 
	1'b0 ;
 assign ymhuyoy0ggtpdsc5j8g3wfsbe6_72 = 
	zrk2qv3hvxx2hcpe_529 & hlkx9d06f87nhq46gn_221 & wl5n252ylc0hu7tecz7p9274agp_873 ;
 assign v6vzjimvxi1sdxxg6bcssb3iab67_623 = 
	weax72tch3gd0okwgq_669 | ct846adcxzhl6afyenuxzp8qdg9_864 | lmj2dlhlka0ljakww7erllez3k_402 ;
 assign packet_out_PACKET2_SOF 	= jtiad0fxxyksun5gt8gggdebdm_736 ;
 assign packet_out_PACKET2_EOF 	= eg64dkikernzgqvf_837 ;
 assign packet_out_PACKET2_VAL 	= o9yxh58p9vleeypf8_267 ;
 assign packet_out_PACKET2_DAT 	= eear1140zx81dpaomo70e_792[255:0] ;
 assign packet_out_PACKET2_CNT 	= mf701qfmyifcihodo8kg5vwy14br5_632[5:0] ;
 assign packet_out_PACKET2_ERR 	= xbtw2kyzt4aw89he8wnqy0_739 ;
 assign packet_in_PACKET2_RDY 	= packet_out_PACKET2_RDY ;
 assign tuple_out_TUPLE0_VALID 	= yazmioh2616iqakvdojaxocl_139 ;
 assign tuple_out_TUPLE0_DATA 	= z62i13mhzgw2hd78fpkuvcllp1yn8e_881[159:0] ;
 assign tuple_out_TUPLE1_VALID 	= yazmioh2616iqakvdojaxocl_139 ;
 assign tuple_out_TUPLE1_DATA 	= kh1fu9dmpjcpb9now01z2cb67p8iv90_412[23:0] ;


assign m48xw2b0qwrvgmj3_6 = (
	((ijwe7199mdgb5p94iw3_190 == 1'b1))?hbqelh7ct161663h77q_73 :
	((u48u7u68tt1hpacic_235 == 1'b1))?ctjf85bs7avihu2e2fe1wt4l071u_829 :
	wf89rjd13isl335ho55zzotghkb3vq4k_714 ) ;

assign i08t5gi59thgblducblyg1h3pcldiw_102 = (
	((wf89rjd13isl335ho55zzotghkb3vq4k_714 == 1'b1) && (u48u7u68tt1hpacic_235 == 1'b1))?ctjf85bs7avihu2e2fe1wt4l071u_829 :
	wf89rjd13isl335ho55zzotghkb3vq4k_714 ) ;



always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	coi0k0zcwvs1cjalxzlrhyjr4ohya_215 <= 1'b0 ;
	wf89rjd13isl335ho55zzotghkb3vq4k_714 <= 1'b0 ;
	fyuoduqr8zhtrzkuoqumrd_277 <= 1'b0 ;
	foxoksy6nwvi14yuawm91ooh9d77b_236 <= 1'b0 ;
	rlzum6hzczjfuroi7zqevi9b_497 <= 9'b000000000 ;
	weax72tch3gd0okwgq_669 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		coi0k0zcwvs1cjalxzlrhyjr4ohya_215 <= backpressure_in ;
		wf89rjd13isl335ho55zzotghkb3vq4k_714 <= m48xw2b0qwrvgmj3_6 ;
		fyuoduqr8zhtrzkuoqumrd_277 <= zrk2qv3hvxx2hcpe_529 ;
		foxoksy6nwvi14yuawm91ooh9d77b_236 <= ijwe7199mdgb5p94iw3_190 ;
		rlzum6hzczjfuroi7zqevi9b_497 <= o7i6yf6mv20rpasrfxomi7as5z1gwbu1_515 ;
		weax72tch3gd0okwgq_669 <= g1twavzc7otvmjri1nebjh2w6fg_328 ;
		backpressure_out <= v6vzjimvxi1sdxxg6bcssb3iab67_623 ;
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	yazmioh2616iqakvdojaxocl_139 <= 1'b0 ;
	ct846adcxzhl6afyenuxzp8qdg9_864 <= 1'b0 ;
   end
  else
  begin
		yazmioh2616iqakvdojaxocl_139 <= dkcqcwvgy7xxxak7useuehfvhk99amm8_87 ;
		ct846adcxzhl6afyenuxzp8qdg9_864 <= midth170mxe1ryy10g6foqnp4de_284 ;
  end
end

always @(posedge clk_out_2)
begin
  if (rst_in_0) 
  begin
	lmj2dlhlka0ljakww7erllez3k_402 <= 1'b0 ;
   end
  else
  begin
		lmj2dlhlka0ljakww7erllez3k_402 <= naynkag2amq2cczbtdb9nk3vuftilkw_670 ;
  end
end

defparam ssinpb35u74x5xa12hrlf21hq6wug_2684.WRITE_DATA_WIDTH = 266; 
defparam ssinpb35u74x5xa12hrlf21hq6wug_2684.FIFO_WRITE_DEPTH = 512; 
defparam ssinpb35u74x5xa12hrlf21hq6wug_2684.PROG_FULL_THRESH = 129; 
defparam ssinpb35u74x5xa12hrlf21hq6wug_2684.PROG_EMPTY_THRESH = 129; 
defparam ssinpb35u74x5xa12hrlf21hq6wug_2684.READ_MODE = "STD"; 
defparam ssinpb35u74x5xa12hrlf21hq6wug_2684.WR_DATA_COUNT_WIDTH = 9; 
defparam ssinpb35u74x5xa12hrlf21hq6wug_2684.RD_DATA_COUNT_WIDTH = 9; 
defparam ssinpb35u74x5xa12hrlf21hq6wug_2684.DOUT_RESET_VALUE = "0"; 
defparam ssinpb35u74x5xa12hrlf21hq6wug_2684.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_sync ssinpb35u74x5xa12hrlf21hq6wug_2684 (
	.wr_en(jk7io2s4xbn6vacgyc_845),
	.din(qcorbj1q3ohk20ap_861),
	.rd_en(vcs1mh2c82id7cfttpt1eb2cmuq_491),
	.sleep(rsi0oq1ny1d9x38l4lhih9xyzwc2_493),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(nw7tnash9s6mfsdxuz086yw1p9_592), 
	.dout(m0a8tc9bu595vurhj2_395), 
	.empty(zahoew21qttq2awwc_109), 
	.prog_full(g1twavzc7otvmjri1nebjh2w6fg_328), 
	.full(o3jqbrt6h3dww0pnonsiydovntxrwj5_318), 
	.rd_data_count(qqgaiyqlwoyegebo07_206), 
	.wr_data_count(lybej7x7mzuiuug1wg2f9nsvpwcudtq_769), 
	.wr_rst_busy(e8p8c08psx46ht5cea_895), 
	.rd_rst_busy(kpgk5zgt19dlklpqs5uc_65), 
	.overflow(nv2sl5w0g83ev8oll1cezy678en0oxcr_521), 
	.underflow(wu2uy4dkj3j07h7p9750tm98iia_475), 
	.sbiterr(aomoc2srbo3xdprpchmqy3k_262), 
	.dbiterr(nzbt49umaoveyizs5k4_51), 
	.almost_empty(wrsccwzdtf8jq70ppz3tzhy4ilfkgj_497), 
	.almost_full(jcwji7trrs3k37e45jm0vt_402), 
	.wr_ack(yaug9rxokbwcby1hem9q4uuldxkjq_457), 
	.data_valid(bdhd5kva72289ikiep8n9s9tc_571), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam tyaz5fh2377kbhkw8bdymr3vbexj_1582.WRITE_DATA_WIDTH = 1; 
defparam tyaz5fh2377kbhkw8bdymr3vbexj_1582.FIFO_WRITE_DEPTH = 512; 
defparam tyaz5fh2377kbhkw8bdymr3vbexj_1582.PROG_FULL_THRESH = 129; 
defparam tyaz5fh2377kbhkw8bdymr3vbexj_1582.PROG_EMPTY_THRESH = 129; 
defparam tyaz5fh2377kbhkw8bdymr3vbexj_1582.READ_MODE = "FWFT"; 
defparam tyaz5fh2377kbhkw8bdymr3vbexj_1582.WR_DATA_COUNT_WIDTH = 9; 
defparam tyaz5fh2377kbhkw8bdymr3vbexj_1582.RD_DATA_COUNT_WIDTH = 9; 
defparam tyaz5fh2377kbhkw8bdymr3vbexj_1582.DOUT_RESET_VALUE = "0"; 
defparam tyaz5fh2377kbhkw8bdymr3vbexj_1582.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_sync tyaz5fh2377kbhkw8bdymr3vbexj_1582 (
	.wr_en(osf0z4s40l8o9l08kkplviuns7dsp_303),
	.din(uc1ejk3pydxwsofsd8d79_600),
	.rd_en(rh3ug412xuyp49gk_313),
	.sleep(vaw6gyjfht5o3zvunz5q_564),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(u9kk6dnptqsilhesdv1lh813_129), 
	.dout(remxfkekb95b6dzuv246cbbge8tuz0_663), 
	.empty(a367j81rurxve4lybb_740), 
	.prog_full(o1yl4fn9cm4eeqcold9b63kti936l9_132), 
	.full(s8gwgxjg5ss1sgqin261k2_437), 
	.rd_data_count(un9kh5y3zzhepfxrb_635), 
	.wr_data_count(zid9fdshg1de8ey6txocpdjddla4t_183), 
	.wr_rst_busy(amycr3zfdicpt9i35k_432), 
	.rd_rst_busy(bc5aebejlw5ta7my_590), 
	.overflow(p8fnfzz1xv23djdizuhfs6umx7ggcik_722), 
	.underflow(fk54vc1kvmsrgaxa5pjdb_894), 
	.sbiterr(oli4z1doxzzg9kge312qq_381), 
	.dbiterr(miywko94k0ru2g1cj_259), 
	.almost_empty(vhms0j383f3lydugjap4fuekrxjbi_104), 
	.almost_full(jsz3zcz2hxzquyr5g7m_102), 
	.wr_ack(a3eqc5nabubngddoic6jrbuvlbg2huhn_671), 
	.data_valid(mgb0hkdkciir288270c7zivf_371), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam hmpy2og23bzqcobgtny24wmjj8_1091.WRITE_DATA_WIDTH = 160; 
defparam hmpy2og23bzqcobgtny24wmjj8_1091.FIFO_WRITE_DEPTH = 256; 
defparam hmpy2og23bzqcobgtny24wmjj8_1091.PROG_FULL_THRESH = 66; 
defparam hmpy2og23bzqcobgtny24wmjj8_1091.PROG_EMPTY_THRESH = 66; 
defparam hmpy2og23bzqcobgtny24wmjj8_1091.READ_MODE = "STD"; 
defparam hmpy2og23bzqcobgtny24wmjj8_1091.WR_DATA_COUNT_WIDTH = 8; 
defparam hmpy2og23bzqcobgtny24wmjj8_1091.RD_DATA_COUNT_WIDTH = 8; 
defparam hmpy2og23bzqcobgtny24wmjj8_1091.DOUT_RESET_VALUE = "0"; 
defparam hmpy2og23bzqcobgtny24wmjj8_1091.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async hmpy2og23bzqcobgtny24wmjj8_1091 (
	.wr_en(pa1srz3oeue2ha0yc_131),
	.din(jxpwvnw47p5hbje82sbog_739),
	.rd_en(xzfpwk0joju70bz4z7k8nzrtpg2t_345),
	.sleep(jqvc9jzc2olpczmn26vgih_134),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(px9pa1n30qc8gxiexw67lo8qsxn0o9iz_184), 
	.dout(z62i13mhzgw2hd78fpkuvcllp1yn8e_881), 
	.empty(lggh48s6j5hzavvzjay7s7tu0k_530), 
	.prog_full(midth170mxe1ryy10g6foqnp4de_284), 
	.full(foorxs9s9xwahtidf7m3xplj2cl_134), 
	.rd_data_count(ls7th5wb2dibbzqlzjxoxs78ul4tw9y_796), 
	.wr_data_count(xl4kb3d5n7pwyrghv_137), 
	.wr_rst_busy(iiu9n7ms6zieugpj_369), 
	.rd_rst_busy(mqeb28227iby6lfnjh42k5ebwnp8_896), 
	.overflow(jwoij48j0min68eqkpa3fuqpujwgp3_445), 
	.underflow(aq57s1xyz70r4ooi_516), 
	.sbiterr(ummhyf0y9c5vwrf4hf42gldmwwwzs4_267), 
	.dbiterr(mt6wk6zy3sqa0it51kr5piakwe_303), 
	.almost_empty(yzj0jbhkphfotmbrg6ps9z6ya8rwt_221), 
	.almost_full(j4efhb21cbk1zqt1_306), 
	.wr_ack(jt9l22hnee8y603a2u3lwwcpfyj6m80_885), 
	.data_valid(ciy8mvzk139askzq3n0riscfqx_140), 

	.wr_clk(clk_in_1), 

	.rd_clk(clk_out_1), 
	.rst(rst_in_1) 
); 

defparam t1ttwrl4xx3738n5m9si8bk50sahbt95_633.WRITE_DATA_WIDTH = 24; 
defparam t1ttwrl4xx3738n5m9si8bk50sahbt95_633.FIFO_WRITE_DEPTH = 256; 
defparam t1ttwrl4xx3738n5m9si8bk50sahbt95_633.PROG_FULL_THRESH = 65; 
defparam t1ttwrl4xx3738n5m9si8bk50sahbt95_633.PROG_EMPTY_THRESH = 65; 
defparam t1ttwrl4xx3738n5m9si8bk50sahbt95_633.READ_MODE = "STD"; 
defparam t1ttwrl4xx3738n5m9si8bk50sahbt95_633.WR_DATA_COUNT_WIDTH = 8; 
defparam t1ttwrl4xx3738n5m9si8bk50sahbt95_633.RD_DATA_COUNT_WIDTH = 8; 
defparam t1ttwrl4xx3738n5m9si8bk50sahbt95_633.DOUT_RESET_VALUE = "0"; 
defparam t1ttwrl4xx3738n5m9si8bk50sahbt95_633.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_async t1ttwrl4xx3738n5m9si8bk50sahbt95_633 (
	.wr_en(c0ot5dqixvb9qr33bdtnr7_294),
	.din(ibjk05pzuwc7qmk8_217),
	.rd_en(f8qwguijy1jyszo0_261),
	.sleep(u6yhotfd9ta1cvtso6sxu0_665),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(av9v4l9ruypbms5fc383zv_54), 
	.dout(kh1fu9dmpjcpb9now01z2cb67p8iv90_412), 
	.empty(y4m4sespbma8ed5x_682), 
	.prog_full(naynkag2amq2cczbtdb9nk3vuftilkw_670), 
	.full(g0mb69sn1nw912s5co_852), 
	.rd_data_count(siuxx8owom56ypfg8xp6399iktan_550), 
	.wr_data_count(zdw01rj8pp19rts2gzk337oiew8nl_295), 
	.wr_rst_busy(ky8yapeeqm0r50oches2fdnyw8hscusz_640), 
	.rd_rst_busy(ftz2x0fd14ldtrblpfw4q15fwi5_401), 
	.overflow(zoguhuv7mu8bbw0cj0q_67), 
	.underflow(zyes3swc8gvlr0x0mf_884), 
	.sbiterr(ryulks6mykgddubb217m_757), 
	.dbiterr(q83c7s6tmdb38kwnv42db1lis_759), 
	.almost_empty(msfch5axuw9vde27irs90e_468), 
	.almost_full(vddi8gep8nrlwgvz3_250), 
	.wr_ack(lzx3ai5t37rrh2z1jh_333), 
	.data_valid(ebp51tfl6axjkt1pawjr9phpmz8fo6ki_318), 

	.wr_clk(clk_in_2), 

	.rd_clk(clk_out_2), 
	.rst(rst_in_2) 
); 

endmodule 
