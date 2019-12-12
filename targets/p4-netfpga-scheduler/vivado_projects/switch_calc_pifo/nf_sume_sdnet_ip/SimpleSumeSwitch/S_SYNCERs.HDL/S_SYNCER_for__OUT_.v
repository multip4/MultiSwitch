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
// File created: 2019/12/09 21:12:17
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






 reg	pcv03l68rcdxknww_150;	 initial pcv03l68rcdxknww_150 = 1'b0 ;
 wire	mypzt2gbn4valrq0wlkou937hia_8 ;
 wire [289:0] bexb47ozrl07oo7t812_229 ;
 wire	u89p8qs56ysh396q9cc95s9_672 ;
 wire	z3fl9go2r42r6byi_140 ;
 wire	m6twcfp68hwga4xu9j_556 ;
 wire [8:0] zjlfn929muthb5lddzrk75t_516 ;
 wire [8:0] s5qf4prgoal901wffl35_151 ;
 wire	wsmw3x9p1itzk1ioma5wne9gfh6w_120 ;
 wire	ufuecrxrrkm3gcyxv9vmsk60t_239 ;
 wire	mmt6y309zsm36n7a0sr_169 ;
 wire	q76bd1ntdh553o95i6m5_790 ;
 wire	qqiox8hyoz8a46jir4ku1rn42aqj3gn6_879 ;
 wire	kiuom98wbzlbtikhlstdtwolat8_698 ;
 wire	y8q2lpfjwu5e4bodth54o2eo_230 ;
 wire	ba4ii9rib6s9d54k57dzxuq9s2prx_753 ;
 wire	a9eikulm93mqe2q6uyb7si4_886 ;
 wire	hz517kgriyreziqt4201vj8_177 ;
 wire	uqbv6c8akyew0mzzz6otagt6hy9fpjm_305 ;
 reg	swgo17t8azx91tq4uza7q_784;	 initial swgo17t8azx91tq4uza7q_784 = 1'b0 ;
 wire	bg96mkhgoam94mztq0_205 ;
 reg	ms96cqylbnte34zv5ndpv_792;	 initial ms96cqylbnte34zv5ndpv_792 = 1'b0 ;
 reg	bz2w5au6zsi83jxycxa7b4w_112;	 initial bz2w5au6zsi83jxycxa7b4w_112 = 1'b0 ;
 wire	yfuva9f5rzzucqqf1l6a_634 ;
 wire [0:0] zr0ct44srcv0yxpk_346 ;
 wire	tf0l34t5w2oxu8fhw2ti_628 ;
 wire	i4oev1zf3l2zcpfzmc6_737 ;
 wire	pvqumz0tpqca5j43y0tj55xayq0xzkb_233 ;
 wire [8:0] wk7tp55zzo9shkwbiosq76nz62w1_876 ;
 wire [8:0] utuz25uibnbbfiisb2cv4giiuq75g_366 ;
 wire	uygl5nmprk98kklkka_290 ;
 wire	vi40lhsk5dwjadfv6tvnsr3ftz6y_106 ;
 wire	n9qkllgryduhl9v7jetic9lv7y1_380 ;
 wire	suid2qse78e5xuif4e_188 ;
 wire	fil3i91bzmsrlapz4d27oijpr1cx_869 ;
 wire	vadcj2axii9rkeq7g33w7rd5as_344 ;
 wire	su6macv6cab7tfe7m_617 ;
 wire	rwv04yjj7c8otqqormmry3rctk3yeo_184 ;
 wire	gjmt4g46gl7ss7eyjae7bwm7mrb_48 ;
 wire	ynydi307lxfnkpp39i8yu_559 ;
 reg	vyu9tgkel0y2rc0o7zqma85_860;	 initial vyu9tgkel0y2rc0o7zqma85_860 = 1'b0 ;
 reg	e4rqahpn6locxlp8vh48e4zvsw8l1vq3_501;	 initial e4rqahpn6locxlp8vh48e4zvsw8l1vq3_501 = 1'b1 ;
 reg [8:0] bnqhfswwgptzggjrj_828;	 initial bnqhfswwgptzggjrj_828 = 9'b000000000 ;
 reg	x19vtfoeox1e139tr725_646;	 initial x19vtfoeox1e139tr725_646 = 1'b0 ;
 wire	w3pnfzudr1wp2ee4swfbh5b2v866zorz_223 ;
 wire [255:0] jxhx05nu78lybdbgm01gc0u23btwh9w_300 ;
 wire	sh7piwvr900xiqaprw4gsrgki2wj5he_163 ;
 wire	cfpask5j2btt5862eow82np_120 ;
 wire	n633kv1khn3xic519y6l32lqoy25d9yx_721 ;
 wire [7:0] w0g478958jsgsnbaao0_224 ;
 wire [7:0] csi1etcuz6kpqh8pl7u6eyto6a0_64 ;
 wire	vkna6qz77o0vz6kcp8183l1d0df0_788 ;
 wire	vl2p98zpknmb7hwiv19j1t9i98ai4wzi_842 ;
 wire	e13ii9l4ev02iaeqtncrnp8p84ekv_285 ;
 wire	x9igvr84gleb2go5euvaz6a_740 ;
 wire	lvdq5d36s9vbq8cbultmj9fqu6u_425 ;
 wire	mwp5j9wr99fj32b9_810 ;
 wire	h3tvjc2mzc2l0hnouu5la2g_347 ;
 wire	hnskihil0smnzzhu2qwqo7mja_883 ;
 wire	d369s9yeyiwmtohi7_185 ;
 wire	pc97n6tp2uyei5oqs382dha1km0x9_89 ;
 wire	u47t1ti7pjf0d2b4kmej8g6_633 ;
 wire [159:0] rxx931uizw268sc82dnfs8y_277 ;
 wire	wv93igz4zsnykehz1x430oc_47 ;
 wire	bgm9bt7e1q4dr9ogmg_133 ;
 wire	fw4w43pvfonlpbum2x17xo5ne_21 ;
 wire [7:0] x08z5ctiv8u14wjbjilq3sicm74k_559 ;
 wire [7:0] dypi2l1sq065p36kpp54tq_438 ;
 wire	j4g7e0b2q78dsigat5c9kt_272 ;
 wire	lab3mtxmf6zkgaw7_671 ;
 wire	pzbx76ppn2bjh484v_578 ;
 wire	xfibou7w4qws2j79cbijcj6hajldss5_347 ;
 wire	pm2kpc6rme6pdahnujqejzoioqoz64z_408 ;
 wire	u2w994v99s7w2dt3qmqhwumdx_645 ;
 wire	ip45lbwnkbk7n6e58esrsaq0sobkmakf_628 ;
 wire	g2hze5zdjqnw5za6zi7d728d1wl8r_815 ;
 wire	zshowwx67wjc7wn1n35f_135 ;
 wire	vzqfvd5jfvhbk2kgxy4qesdk4l_890 ;
 reg	bh1aqvimppyagx83kqoxlpi8ygf_138;	 initial bh1aqvimppyagx83kqoxlpi8ygf_138 = 1'b0 ;
 reg	pm55ebm7pyuu1uby_389;	 initial pm55ebm7pyuu1uby_389 = 1'b0 ;
 reg	h1fsxsw8gwurhux55o6nzrewz3_391;	 initial h1fsxsw8gwurhux55o6nzrewz3_391 = 1'b0 ;
 wire	jxfmcf9matolrzlz2u19nmr2b2nv_544 ;
 wire [289:0] xuaz1x7hjo1bq4wnh5odnc6_449 ;
 wire	zhs7vcodtcm3fr7gzshb3_57 ;
 wire [289:0] ucdn7jlknnjm5xf7danhrw1pfy9t_172 ;
 wire	hkdki9a6aqwf3ljzvaf_392 ;
 wire	xar150gkmo5k3zbuix4nlrl_325 ;
 wire	x3rubs4wsl4k4r6eycog8ngue4ry1i0_141 ;
 wire	zi86ld22peutngbv1ir6o2n9lme0y_137 ;
 wire	mb4c3rzgjhsj7yhg7_800 ;
 wire	d5mj80dcupmd95vjh7vjy6_245 ;
 wire	e05eaikok29pf8av8e8wov_312 ;
 wire	e76c1z9u6lyqw6t7zxh4_342 ;
 wire	wrl0d0431cm1nqvdpyvcqsgy5qu_893 ;
 wire	yoo0kszuor0v25yi5fo3lpysj_674 ;
 wire	k6hpbnwl8gr3zy5fzevauiyibz_302 ;
 wire	lx7x8bo0zo998v6y0efqj_282 ;
 wire	wpz8cseisu1u0cslyv4c_494 ;
 wire	scshkycj6t4y29nzf4wv40izw44hd_730 ;
 wire [31:0] mlfps3cc15aqpp2gs64k_893 ;
 wire [255:0] rzapdzkjayzltx33zwixyird14wqt_366 ;
 wire	mb7jili97fn762hq_147 ;
 wire	o3azm4h8ig2d84le9_655 ;
 wire	cz6vsqnfk3je67f59hw1cti4fkl7_692 ;
 wire	kqdcui2e5114ldysbdk1ukm8wnx1xmh_786 ;
 wire	k4vtg7zhaccba5dy0hno4_728 ;
 wire	s5p0vayr97l7z0x3vy9g2mpnra_496 ;
 wire	dv52n3gbg13x7rwxfrkgq_553 ;
 wire	h26vj16t1qrhkbjhksu_744 ;
 wire	zbsvdqy4de2iihsj7qth47zhbec1_773 ;
 wire	b2r0xb4bhg5nhespiacb0ua81_280 ;
 wire	z1s6lgxxn187pwyh52hopy6eww8_224 ;
 wire	zfy659ptolst16g0pe6_488 ;
 wire	eex87akir8dyb3a2xlxdggy91v44y1j7_812 ;
 wire	n9zaw263eh18vl2qq5fbvio_658 ;
 wire	nydz43pxqoise5l8kvi6_617 ;
 wire	wti1p31j3immw4qgetx7we_631 ;
 wire [0:0] f4hw6gs1liuq3rertmu8tvsh_341 ;
 wire	kgtsdj7zgejer2low8ptr_179 ;
 wire	pv0ps6opdj6p1hlfiildj_725 ;
 wire [8:0] yppwpx4tnilrwpf1_452 ;
 wire	o461igpp4a079bkwpoqm4mbz3oce_831 ;
 wire	p08273rqqdyimco1ay8z74ybimzaf0l_443 ;
 wire	uy7tp4jxsmfl3pn4_8 ;
 wire	nizw6u8nlmrgygcygv4jbj5t397k_455 ;
 wire	ezjbo0hpuyi42ltrbo56jg7k1cahpkx7_141 ;
 wire	n8d1v6lz9ade1z9oc406jgfnm_532 ;
 wire	hpfqog5cbk5v9tl4yf6funnzqczs3_66 ;
 wire [255:0] c9nywfwm90407k0wep9vc11cxqegqi_855 ;
 wire	ebgp0eqga5weijqvxo3mkfeq105h_695 ;
 wire [255:0] cu51yqgoxvkpynd189t4h781s75stiis_587 ;
 wire	j67o603sowkyqfa1v_878 ;
 wire	x4zu49nu4xjncdwctgm8v_633 ;
 wire	w82l5o9qc59dwadm0tz5x9hyqz7tbh_793 ;
 wire [159:0] zdroawf8lc5zz4povon88c7whxi_45 ;
 wire	nlsq9g9nx9cup4whr6us2ulf_630 ;
 wire [159:0] cuzk77n17aowh0i6rs4s_471 ;
 wire	gzcl97mam4d8zizhv_832 ;
 wire	duigmplli0ctwldfn_387 ;
 wire	e67kpotvstkpdp5hhe1152olpc2jw15_666 ;
 wire	y3bmg362hugt52l2n0612_665 ;
 wire	zotv328f4nglt2vqge_235 ;


 assign jxfmcf9matolrzlz2u19nmr2b2nv_544 = 
	 ~(backpressure_in) ;
 assign xuaz1x7hjo1bq4wnh5odnc6_449 = 
	{packet_in_PACKET2_TVALID, packet_in_PACKET2_TDATA, packet_in_PACKET2_TKEEP, packet_in_PACKET2_TLAST} ;
 assign zhs7vcodtcm3fr7gzshb3_57 	= packet_in_PACKET2_TVALID ;
 assign ucdn7jlknnjm5xf7danhrw1pfy9t_172 	= xuaz1x7hjo1bq4wnh5odnc6_449[289:0] ;
 assign hkdki9a6aqwf3ljzvaf_392 = 
	nizw6u8nlmrgygcygv4jbj5t397k_455 | y3bmg362hugt52l2n0612_665 ;
 assign xar150gkmo5k3zbuix4nlrl_325 = 
	1'b0 ;
 assign x3rubs4wsl4k4r6eycog8ngue4ry1i0_141 = 
	1'b1 ;
 assign zi86ld22peutngbv1ir6o2n9lme0y_137 = 
	 ~(bg96mkhgoam94mztq0_205) ;
 assign mb4c3rzgjhsj7yhg7_800 = 
	n8d1v6lz9ade1z9oc406jgfnm_532 & hkdki9a6aqwf3ljzvaf_392 & wpz8cseisu1u0cslyv4c_494 ;
 assign d5mj80dcupmd95vjh7vjy6_245 = 
	zi86ld22peutngbv1ir6o2n9lme0y_137 & swgo17t8azx91tq4uza7q_784 & wpz8cseisu1u0cslyv4c_494 & nizw6u8nlmrgygcygv4jbj5t397k_455 & n8d1v6lz9ade1z9oc406jgfnm_532 ;
 assign e05eaikok29pf8av8e8wov_312 = 
	mb4c3rzgjhsj7yhg7_800 | d5mj80dcupmd95vjh7vjy6_245 ;
 assign e76c1z9u6lyqw6t7zxh4_342 = 
	jxfmcf9matolrzlz2u19nmr2b2nv_544 & e05eaikok29pf8av8e8wov_312 ;
 assign wrl0d0431cm1nqvdpyvcqsgy5qu_893 = 
	backpressure_in & pcv03l68rcdxknww_150 & n8d1v6lz9ade1z9oc406jgfnm_532 & uy7tp4jxsmfl3pn4_8 & y3bmg362hugt52l2n0612_665 & zi86ld22peutngbv1ir6o2n9lme0y_137 ;
 assign yoo0kszuor0v25yi5fo3lpysj_674 = 
	e76c1z9u6lyqw6t7zxh4_342 | wrl0d0431cm1nqvdpyvcqsgy5qu_893 ;
 assign k6hpbnwl8gr3zy5fzevauiyibz_302 	= yoo0kszuor0v25yi5fo3lpysj_674 ;
 assign lx7x8bo0zo998v6y0efqj_282 = 
	1'b0 ;
 assign wpz8cseisu1u0cslyv4c_494 = 
	 ~(u89p8qs56ysh396q9cc95s9_672) ;
 assign scshkycj6t4y29nzf4wv40izw44hd_730 	= bexb47ozrl07oo7t812_229[0] ;
 assign mlfps3cc15aqpp2gs64k_893 	= bexb47ozrl07oo7t812_229[32:1] ;
 assign rzapdzkjayzltx33zwixyird14wqt_366 	= bexb47ozrl07oo7t812_229[288:33] ;
 assign mb7jili97fn762hq_147 	= bexb47ozrl07oo7t812_229[289] ;
 assign o3azm4h8ig2d84le9_655 = 
	pcv03l68rcdxknww_150 | bz2w5au6zsi83jxycxa7b4w_112 ;
 assign cz6vsqnfk3je67f59hw1cti4fkl7_692 = 
	ms96cqylbnte34zv5ndpv_792 | wpz8cseisu1u0cslyv4c_494 ;
 assign kqdcui2e5114ldysbdk1ukm8wnx1xmh_786 = 
	cz6vsqnfk3je67f59hw1cti4fkl7_692 & n8d1v6lz9ade1z9oc406jgfnm_532 & hkdki9a6aqwf3ljzvaf_392 ;
 assign k4vtg7zhaccba5dy0hno4_728 = 
	kqdcui2e5114ldysbdk1ukm8wnx1xmh_786 | swgo17t8azx91tq4uza7q_784 ;
 assign s5p0vayr97l7z0x3vy9g2mpnra_496 = 
	backpressure_in & mb7jili97fn762hq_147 & k4vtg7zhaccba5dy0hno4_728 ;
 assign dv52n3gbg13x7rwxfrkgq_553 = 
	uy7tp4jxsmfl3pn4_8 & x19vtfoeox1e139tr725_646 ;
 assign h26vj16t1qrhkbjhksu_744 = 
	dv52n3gbg13x7rwxfrkgq_553 | nizw6u8nlmrgygcygv4jbj5t397k_455 | scshkycj6t4y29nzf4wv40izw44hd_730 ;
 assign zbsvdqy4de2iihsj7qth47zhbec1_773 = 
	jxfmcf9matolrzlz2u19nmr2b2nv_544 & swgo17t8azx91tq4uza7q_784 & mb7jili97fn762hq_147 & h26vj16t1qrhkbjhksu_744 ;
 assign b2r0xb4bhg5nhespiacb0ua81_280 	= swgo17t8azx91tq4uza7q_784 ;
 assign z1s6lgxxn187pwyh52hopy6eww8_224 	= packet_in_PACKET2_TVALID ;
 assign zfy659ptolst16g0pe6_488 = 
	1'b0 ;
 assign eex87akir8dyb3a2xlxdggy91v44y1j7_812 = 
	1'b1 ;
 assign n9zaw263eh18vl2qq5fbvio_658 = (
	((vyu9tgkel0y2rc0o7zqma85_860 == 1'b1) && (packet_in_PACKET2_TVALID == 1'b1))?1'b1:
	((e4rqahpn6locxlp8vh48e4zvsw8l1vq3_501 == 1'b1) && (packet_in_PACKET2_TVALID == 1'b1))?1'b1:
	0)  ;
 assign nydz43pxqoise5l8kvi6_617 = (
	((packet_in_PACKET2_TVALID == 1'b1) && (packet_in_PACKET2_TLAST == 1'b1))?1'b1:
	0)  ;
 assign wti1p31j3immw4qgetx7we_631 = (
	((packet_in_PACKET2_TVALID == 1'b1) && (packet_in_PACKET2_TLAST == 1'b0))?1'b1:
	0)  ;
 assign f4hw6gs1liuq3rertmu8tvsh_341 = n9zaw263eh18vl2qq5fbvio_658 ;
 assign kgtsdj7zgejer2low8ptr_179 	= yoo0kszuor0v25yi5fo3lpysj_674 ;
 assign pv0ps6opdj6p1hlfiildj_725 = 
	1'b0 ;
 assign yppwpx4tnilrwpf1_452 	= wk7tp55zzo9shkwbiosq76nz62w1_876[8:0] ;
 assign o461igpp4a079bkwpoqm4mbz3oce_831 = (
	((yppwpx4tnilrwpf1_452 != bnqhfswwgptzggjrj_828))?1'b1:
	0)  ;
 assign p08273rqqdyimco1ay8z74ybimzaf0l_443 = zr0ct44srcv0yxpk_346 ;
 assign uy7tp4jxsmfl3pn4_8 = zr0ct44srcv0yxpk_346 ;
 assign nizw6u8nlmrgygcygv4jbj5t397k_455 = 
	 ~(uy7tp4jxsmfl3pn4_8) ;
 assign ezjbo0hpuyi42ltrbo56jg7k1cahpkx7_141 	= tf0l34t5w2oxu8fhw2ti_628 ;
 assign n8d1v6lz9ade1z9oc406jgfnm_532 = 
	 ~(tf0l34t5w2oxu8fhw2ti_628) ;
 assign hpfqog5cbk5v9tl4yf6funnzqczs3_66 = 
	y3bmg362hugt52l2n0612_665 & n8d1v6lz9ade1z9oc406jgfnm_532 & p08273rqqdyimco1ay8z74ybimzaf0l_443 & yoo0kszuor0v25yi5fo3lpysj_674 ;
 assign c9nywfwm90407k0wep9vc11cxqegqi_855 = 
	tuple_in_TUPLE0_DATA ;
 assign ebgp0eqga5weijqvxo3mkfeq105h_695 	= tuple_in_TUPLE0_VALID ;
 assign cu51yqgoxvkpynd189t4h781s75stiis_587 	= c9nywfwm90407k0wep9vc11cxqegqi_855[255:0] ;
 assign j67o603sowkyqfa1v_878 = 
	 ~(sh7piwvr900xiqaprw4gsrgki2wj5he_163) ;
 assign x4zu49nu4xjncdwctgm8v_633 	= hpfqog5cbk5v9tl4yf6funnzqczs3_66 ;
 assign w82l5o9qc59dwadm0tz5x9hyqz7tbh_793 = 
	1'b0 ;
 assign zdroawf8lc5zz4povon88c7whxi_45 = 
	tuple_in_TUPLE1_DATA ;
 assign nlsq9g9nx9cup4whr6us2ulf_630 	= tuple_in_TUPLE1_VALID ;
 assign cuzk77n17aowh0i6rs4s_471 	= zdroawf8lc5zz4povon88c7whxi_45[159:0] ;
 assign gzcl97mam4d8zizhv_832 = 
	 ~(wv93igz4zsnykehz1x430oc_47) ;
 assign duigmplli0ctwldfn_387 	= hpfqog5cbk5v9tl4yf6funnzqczs3_66 ;
 assign e67kpotvstkpdp5hhe1152olpc2jw15_666 = 
	1'b0 ;
 assign y3bmg362hugt52l2n0612_665 = 
	wpz8cseisu1u0cslyv4c_494 & j67o603sowkyqfa1v_878 & gzcl97mam4d8zizhv_832 ;
 assign zotv328f4nglt2vqge_235 = 
	bh1aqvimppyagx83kqoxlpi8ygf_138 | pm55ebm7pyuu1uby_389 | h1fsxsw8gwurhux55o6nzrewz3_391 ;
 assign packet_out_PACKET2_TVALID 	= b2r0xb4bhg5nhespiacb0ua81_280 ;
 assign packet_out_PACKET2_TDATA 	= rzapdzkjayzltx33zwixyird14wqt_366[255:0] ;
 assign packet_out_PACKET2_TKEEP 	= mlfps3cc15aqpp2gs64k_893[31:0] ;
 assign packet_out_PACKET2_TLAST 	= scshkycj6t4y29nzf4wv40izw44hd_730 ;
 assign packet_in_PACKET2_TREADY 	= packet_out_PACKET2_TREADY ;
 assign tuple_out_TUPLE0_VALID 	= x19vtfoeox1e139tr725_646 ;
 assign tuple_out_TUPLE0_DATA 	= jxhx05nu78lybdbgm01gc0u23btwh9w_300[255:0] ;
 assign tuple_out_TUPLE1_VALID 	= x19vtfoeox1e139tr725_646 ;
 assign tuple_out_TUPLE1_DATA 	= rxx931uizw268sc82dnfs8y_277[159:0] ;


assign uqbv6c8akyew0mzzz6otagt6hy9fpjm_305 = (
	((yoo0kszuor0v25yi5fo3lpysj_674 == 1'b1))?x3rubs4wsl4k4r6eycog8ngue4ry1i0_141 :
	((jxfmcf9matolrzlz2u19nmr2b2nv_544 == 1'b1))?xar150gkmo5k3zbuix4nlrl_325 :
	swgo17t8azx91tq4uza7q_784 ) ;

assign bg96mkhgoam94mztq0_205 = (
	((swgo17t8azx91tq4uza7q_784 == 1'b1) && (jxfmcf9matolrzlz2u19nmr2b2nv_544 == 1'b1))?xar150gkmo5k3zbuix4nlrl_325 :
	swgo17t8azx91tq4uza7q_784 ) ;



always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	pcv03l68rcdxknww_150 <= 1'b0 ;
	swgo17t8azx91tq4uza7q_784 <= 1'b0 ;
	ms96cqylbnte34zv5ndpv_792 <= 1'b0 ;
	bz2w5au6zsi83jxycxa7b4w_112 <= 1'b0 ;
	bnqhfswwgptzggjrj_828 <= 9'b000000000 ;
	bh1aqvimppyagx83kqoxlpi8ygf_138 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		pcv03l68rcdxknww_150 <= backpressure_in ;
		swgo17t8azx91tq4uza7q_784 <= uqbv6c8akyew0mzzz6otagt6hy9fpjm_305 ;
		ms96cqylbnte34zv5ndpv_792 <= wpz8cseisu1u0cslyv4c_494 ;
		bz2w5au6zsi83jxycxa7b4w_112 <= yoo0kszuor0v25yi5fo3lpysj_674 ;
		bnqhfswwgptzggjrj_828 <= yppwpx4tnilrwpf1_452 ;
		bh1aqvimppyagx83kqoxlpi8ygf_138 <= z3fl9go2r42r6byi_140 ;
		backpressure_out <= zotv328f4nglt2vqge_235 ;
  end
end

always @(posedge clk_in_0)
begin
  if (rst_in_0) 
  begin
	vyu9tgkel0y2rc0o7zqma85_860 <= 1'b0 ;
	e4rqahpn6locxlp8vh48e4zvsw8l1vq3_501 <= 1'b1 ;
   end
  else
  begin
	if (wti1p31j3immw4qgetx7we_631) 
	begin 
	  vyu9tgkel0y2rc0o7zqma85_860 <= 1'b0 ;
	 end 
	else 
	begin 
		if (nydz43pxqoise5l8kvi6_617) 
		begin 
			vyu9tgkel0y2rc0o7zqma85_860 <= eex87akir8dyb3a2xlxdggy91v44y1j7_812 ;
		end 
	end 
	if (n9zaw263eh18vl2qq5fbvio_658) 
	begin 
		e4rqahpn6locxlp8vh48e4zvsw8l1vq3_501 <= zfy659ptolst16g0pe6_488 ;
	end 
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	x19vtfoeox1e139tr725_646 <= 1'b0 ;
	pm55ebm7pyuu1uby_389 <= 1'b0 ;
   end
  else
  begin
		x19vtfoeox1e139tr725_646 <= hpfqog5cbk5v9tl4yf6funnzqczs3_66 ;
		pm55ebm7pyuu1uby_389 <= cfpask5j2btt5862eow82np_120 ;
  end
end

always @(posedge clk_out_2)
begin
  if (rst_in_0) 
  begin
	h1fsxsw8gwurhux55o6nzrewz3_391 <= 1'b0 ;
   end
  else
  begin
		h1fsxsw8gwurhux55o6nzrewz3_391 <= bgm9bt7e1q4dr9ogmg_133 ;
  end
end

defparam q45x4ybr0vqfulsh386g0_410.WRITE_DATA_WIDTH = 290; 
defparam q45x4ybr0vqfulsh386g0_410.FIFO_WRITE_DEPTH = 512; 
defparam q45x4ybr0vqfulsh386g0_410.PROG_FULL_THRESH = 135; 
defparam q45x4ybr0vqfulsh386g0_410.PROG_EMPTY_THRESH = 135; 
defparam q45x4ybr0vqfulsh386g0_410.READ_MODE = "STD"; 
defparam q45x4ybr0vqfulsh386g0_410.WR_DATA_COUNT_WIDTH = 9; 
defparam q45x4ybr0vqfulsh386g0_410.RD_DATA_COUNT_WIDTH = 9; 
defparam q45x4ybr0vqfulsh386g0_410.DOUT_RESET_VALUE = "0"; 
defparam q45x4ybr0vqfulsh386g0_410.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_sync q45x4ybr0vqfulsh386g0_410 (
	.wr_en(zhs7vcodtcm3fr7gzshb3_57),
	.din(ucdn7jlknnjm5xf7danhrw1pfy9t_172),
	.rd_en(k6hpbnwl8gr3zy5fzevauiyibz_302),
	.sleep(lx7x8bo0zo998v6y0efqj_282),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(mypzt2gbn4valrq0wlkou937hia_8), 
	.dout(bexb47ozrl07oo7t812_229), 
	.empty(u89p8qs56ysh396q9cc95s9_672), 
	.prog_full(z3fl9go2r42r6byi_140), 
	.full(m6twcfp68hwga4xu9j_556), 
	.rd_data_count(zjlfn929muthb5lddzrk75t_516), 
	.wr_data_count(s5qf4prgoal901wffl35_151), 
	.wr_rst_busy(wsmw3x9p1itzk1ioma5wne9gfh6w_120), 
	.rd_rst_busy(ufuecrxrrkm3gcyxv9vmsk60t_239), 
	.overflow(mmt6y309zsm36n7a0sr_169), 
	.underflow(q76bd1ntdh553o95i6m5_790), 
	.sbiterr(qqiox8hyoz8a46jir4ku1rn42aqj3gn6_879), 
	.dbiterr(kiuom98wbzlbtikhlstdtwolat8_698), 
	.almost_empty(y8q2lpfjwu5e4bodth54o2eo_230), 
	.almost_full(ba4ii9rib6s9d54k57dzxuq9s2prx_753), 
	.wr_ack(a9eikulm93mqe2q6uyb7si4_886), 
	.data_valid(hz517kgriyreziqt4201vj8_177), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam b7zgv2o4x88ee9xg6m68gnh1aox6bo_710.WRITE_DATA_WIDTH = 1; 
defparam b7zgv2o4x88ee9xg6m68gnh1aox6bo_710.FIFO_WRITE_DEPTH = 512; 
defparam b7zgv2o4x88ee9xg6m68gnh1aox6bo_710.PROG_FULL_THRESH = 135; 
defparam b7zgv2o4x88ee9xg6m68gnh1aox6bo_710.PROG_EMPTY_THRESH = 135; 
defparam b7zgv2o4x88ee9xg6m68gnh1aox6bo_710.READ_MODE = "FWFT"; 
defparam b7zgv2o4x88ee9xg6m68gnh1aox6bo_710.WR_DATA_COUNT_WIDTH = 9; 
defparam b7zgv2o4x88ee9xg6m68gnh1aox6bo_710.RD_DATA_COUNT_WIDTH = 9; 
defparam b7zgv2o4x88ee9xg6m68gnh1aox6bo_710.DOUT_RESET_VALUE = "0"; 
defparam b7zgv2o4x88ee9xg6m68gnh1aox6bo_710.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_sync b7zgv2o4x88ee9xg6m68gnh1aox6bo_710 (
	.wr_en(z1s6lgxxn187pwyh52hopy6eww8_224),
	.din(f4hw6gs1liuq3rertmu8tvsh_341),
	.rd_en(kgtsdj7zgejer2low8ptr_179),
	.sleep(pv0ps6opdj6p1hlfiildj_725),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(yfuva9f5rzzucqqf1l6a_634), 
	.dout(zr0ct44srcv0yxpk_346), 
	.empty(tf0l34t5w2oxu8fhw2ti_628), 
	.prog_full(i4oev1zf3l2zcpfzmc6_737), 
	.full(pvqumz0tpqca5j43y0tj55xayq0xzkb_233), 
	.rd_data_count(wk7tp55zzo9shkwbiosq76nz62w1_876), 
	.wr_data_count(utuz25uibnbbfiisb2cv4giiuq75g_366), 
	.wr_rst_busy(uygl5nmprk98kklkka_290), 
	.rd_rst_busy(vi40lhsk5dwjadfv6tvnsr3ftz6y_106), 
	.overflow(n9qkllgryduhl9v7jetic9lv7y1_380), 
	.underflow(suid2qse78e5xuif4e_188), 
	.sbiterr(fil3i91bzmsrlapz4d27oijpr1cx_869), 
	.dbiterr(vadcj2axii9rkeq7g33w7rd5as_344), 
	.almost_empty(su6macv6cab7tfe7m_617), 
	.almost_full(rwv04yjj7c8otqqormmry3rctk3yeo_184), 
	.wr_ack(gjmt4g46gl7ss7eyjae7bwm7mrb_48), 
	.data_valid(ynydi307lxfnkpp39i8yu_559), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam cienfihf4jncu2zl_2528.WRITE_DATA_WIDTH = 256; 
defparam cienfihf4jncu2zl_2528.FIFO_WRITE_DEPTH = 256; 
defparam cienfihf4jncu2zl_2528.PROG_FULL_THRESH = 66; 
defparam cienfihf4jncu2zl_2528.PROG_EMPTY_THRESH = 66; 
defparam cienfihf4jncu2zl_2528.READ_MODE = "STD"; 
defparam cienfihf4jncu2zl_2528.WR_DATA_COUNT_WIDTH = 8; 
defparam cienfihf4jncu2zl_2528.RD_DATA_COUNT_WIDTH = 8; 
defparam cienfihf4jncu2zl_2528.DOUT_RESET_VALUE = "0"; 
defparam cienfihf4jncu2zl_2528.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async cienfihf4jncu2zl_2528 (
	.wr_en(ebgp0eqga5weijqvxo3mkfeq105h_695),
	.din(cu51yqgoxvkpynd189t4h781s75stiis_587),
	.rd_en(x4zu49nu4xjncdwctgm8v_633),
	.sleep(w82l5o9qc59dwadm0tz5x9hyqz7tbh_793),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(w3pnfzudr1wp2ee4swfbh5b2v866zorz_223), 
	.dout(jxhx05nu78lybdbgm01gc0u23btwh9w_300), 
	.empty(sh7piwvr900xiqaprw4gsrgki2wj5he_163), 
	.prog_full(cfpask5j2btt5862eow82np_120), 
	.full(n633kv1khn3xic519y6l32lqoy25d9yx_721), 
	.rd_data_count(w0g478958jsgsnbaao0_224), 
	.wr_data_count(csi1etcuz6kpqh8pl7u6eyto6a0_64), 
	.wr_rst_busy(vkna6qz77o0vz6kcp8183l1d0df0_788), 
	.rd_rst_busy(vl2p98zpknmb7hwiv19j1t9i98ai4wzi_842), 
	.overflow(e13ii9l4ev02iaeqtncrnp8p84ekv_285), 
	.underflow(x9igvr84gleb2go5euvaz6a_740), 
	.sbiterr(lvdq5d36s9vbq8cbultmj9fqu6u_425), 
	.dbiterr(mwp5j9wr99fj32b9_810), 
	.almost_empty(h3tvjc2mzc2l0hnouu5la2g_347), 
	.almost_full(hnskihil0smnzzhu2qwqo7mja_883), 
	.wr_ack(d369s9yeyiwmtohi7_185), 
	.data_valid(pc97n6tp2uyei5oqs382dha1km0x9_89), 

	.wr_clk(clk_in_1), 

	.rd_clk(clk_out_1), 
	.rst(rst_in_1) 
); 

defparam d2md577gif637sj8_482.WRITE_DATA_WIDTH = 160; 
defparam d2md577gif637sj8_482.FIFO_WRITE_DEPTH = 256; 
defparam d2md577gif637sj8_482.PROG_FULL_THRESH = 66; 
defparam d2md577gif637sj8_482.PROG_EMPTY_THRESH = 66; 
defparam d2md577gif637sj8_482.READ_MODE = "STD"; 
defparam d2md577gif637sj8_482.WR_DATA_COUNT_WIDTH = 8; 
defparam d2md577gif637sj8_482.RD_DATA_COUNT_WIDTH = 8; 
defparam d2md577gif637sj8_482.DOUT_RESET_VALUE = "0"; 
defparam d2md577gif637sj8_482.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async d2md577gif637sj8_482 (
	.wr_en(nlsq9g9nx9cup4whr6us2ulf_630),
	.din(cuzk77n17aowh0i6rs4s_471),
	.rd_en(duigmplli0ctwldfn_387),
	.sleep(e67kpotvstkpdp5hhe1152olpc2jw15_666),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(u47t1ti7pjf0d2b4kmej8g6_633), 
	.dout(rxx931uizw268sc82dnfs8y_277), 
	.empty(wv93igz4zsnykehz1x430oc_47), 
	.prog_full(bgm9bt7e1q4dr9ogmg_133), 
	.full(fw4w43pvfonlpbum2x17xo5ne_21), 
	.rd_data_count(x08z5ctiv8u14wjbjilq3sicm74k_559), 
	.wr_data_count(dypi2l1sq065p36kpp54tq_438), 
	.wr_rst_busy(j4g7e0b2q78dsigat5c9kt_272), 
	.rd_rst_busy(lab3mtxmf6zkgaw7_671), 
	.overflow(pzbx76ppn2bjh484v_578), 
	.underflow(xfibou7w4qws2j79cbijcj6hajldss5_347), 
	.sbiterr(pm2kpc6rme6pdahnujqejzoioqoz64z_408), 
	.dbiterr(u2w994v99s7w2dt3qmqhwumdx_645), 
	.almost_empty(ip45lbwnkbk7n6e58esrsaq0sobkmakf_628), 
	.almost_full(g2hze5zdjqnw5za6zi7d728d1wl8r_815), 
	.wr_ack(zshowwx67wjc7wn1n35f_135), 
	.data_valid(vzqfvd5jfvhbk2kgxy4qesdk4l_890), 

	.wr_clk(clk_in_2), 

	.rd_clk(clk_out_2), 
	.rst(rst_in_2) 
); 

endmodule 
