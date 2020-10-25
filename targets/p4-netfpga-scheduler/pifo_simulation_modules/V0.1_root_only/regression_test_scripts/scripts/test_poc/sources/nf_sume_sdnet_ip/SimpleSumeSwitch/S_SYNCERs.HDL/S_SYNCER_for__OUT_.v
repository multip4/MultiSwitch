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
// File created: 2020/10/08 15:24:15
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






 reg	e3wluroomaw1pvti95hfmib2jl_776;	 initial e3wluroomaw1pvti95hfmib2jl_776 = 1'b0 ;
 wire	kbl4jfw8777fmi0s9wxfjzf37yz_531 ;
 wire [289:0] la8yn32c5dsnt00wdzznfpmvf8_10 ;
 wire	pawria2xeqo2knjypteb_129 ;
 wire	y70xk0au8agoez6cyvb7gxd8tbu5cd1_509 ;
 wire	u8apfje16isjrgo3xaesdko32aqtzob5_835 ;
 wire [8:0] h3fnbkb68x2idu83zsu81ux_689 ;
 wire [8:0] g939wve5sl8aks0iiaest3u6eoovfv_785 ;
 wire	s81wdm4uzc736oz96xn2yq8_117 ;
 wire	hsfsxqsyn75iwh4g5113o46e_520 ;
 wire	izrhqfu68w8o35xvlbxs7ethkzxt_276 ;
 wire	farklu8zchyqqmph7_96 ;
 wire	h57ujtnuomefkk9u3_79 ;
 wire	d8ye3ma36853kpnb27_232 ;
 wire	zsq3ag4v9i6nsrrp8ir9yclw5g_591 ;
 wire	asgj3ocdw38zx85dnh4idrqxof_583 ;
 wire	tlkl7oe8ymqkkvifru9ynml6y7_10 ;
 wire	bg8w5jpsokxlw3yd3lbdct_149 ;
 wire	c5l1w37k4koubxxw3py8bh6w3zr5x_194 ;
 reg	r6yaone9frwm18ux38bon3h5_292;	 initial r6yaone9frwm18ux38bon3h5_292 = 1'b0 ;
 wire	yqwe82uzb396k4878_126 ;
 reg	so4vp0rfq409fl0mbwa_57;	 initial so4vp0rfq409fl0mbwa_57 = 1'b0 ;
 reg	twh2hto19glegtpzwgza2gku_685;	 initial twh2hto19glegtpzwgza2gku_685 = 1'b0 ;
 wire	i2oa0e96v8wfaazzq70f8svpflu3dodm_53 ;
 wire [0:0] m7efron6ej79cemh6_710 ;
 wire	oxp7okpn2y8nds2jeg7lr_881 ;
 wire	nfokd0it7j0bt5oa0xdd0e521f3zex_750 ;
 wire	uk6pxpjzmuoix2cu98kswayr4urn5he7_377 ;
 wire [8:0] us7gexub88s4rkwtyc_222 ;
 wire [8:0] aszgvokngqc8lypqcs9j_695 ;
 wire	iwmtoibnkx4zyw8gq90hle_557 ;
 wire	f30iwrltlj9sa7h5s0o9toszu5nb_610 ;
 wire	umykotp1dv5zluka2_304 ;
 wire	n2h21zhevcm6zo1kz5_343 ;
 wire	agd07lcwvgoo4qyrwi_132 ;
 wire	tqwkctcetf6hoa7d880eotabs3f_713 ;
 wire	i0f4cuipuw2twufrpw49eok5cvau4y4_808 ;
 wire	xuquqznlqy967vked_299 ;
 wire	kef085ufflqnbhe4qw7qrd135oo5a_137 ;
 wire	ximew9y94tj5wje6_428 ;
 reg	wgca90sykn5jr8r3cgfbn_334;	 initial wgca90sykn5jr8r3cgfbn_334 = 1'b0 ;
 reg	crj4ryav9xxqfg250ay5v1qb737_519;	 initial crj4ryav9xxqfg250ay5v1qb737_519 = 1'b1 ;
 reg [8:0] d1v6fdhdj6hqll7uiup4sep_79;	 initial d1v6fdhdj6hqll7uiup4sep_79 = 9'b000000000 ;
 reg	rycno3yidgj08ocm_897;	 initial rycno3yidgj08ocm_897 = 1'b0 ;
 wire	g3kltcujmt0bdjuwvmhtehqeot1tta_700 ;
 wire [255:0] slare5spsydxir8ekbg54rixdywz7b_898 ;
 wire	ijksayib6ih5eg8ntc44_595 ;
 wire	iautwrlj1ibjtklzluexzx94qbv69r_789 ;
 wire	wf8lwc3e3s3el7q5q_506 ;
 wire [7:0] tgi7khppi2p8402ug4dhr1vl1n3_410 ;
 wire [7:0] tmol39go8cakc3hhx_855 ;
 wire	gy0ynok4aojxlsdjnhqhhvslrv_368 ;
 wire	o3xaemqnx1rbygjpwu3f0sjmjh6t_25 ;
 wire	qrjwwo9wppkui2bv7jpx0ju090c_280 ;
 wire	lrn4x2flid3uikwfdmq109c_377 ;
 wire	u0h2yarjgrbs0lxh55da6e50u9g8_709 ;
 wire	bthpxs8s89zqdkiusjjwv146js_754 ;
 wire	qwzkex7avne7bo7hr9_410 ;
 wire	j8cgxdt87321eg71qi8kavnlpvpk7tj_144 ;
 wire	hvpslzgd3co4m6w3_582 ;
 wire	v5f26prkzcyyv3s1rg8ms89r2jn8_74 ;
 wire	e02bb01t2ichpdcb5l031g0_553 ;
 wire [159:0] pw0q84va0xi10n2ilb23w5osgdh_782 ;
 wire	odsi2bj8p2jmq58vpowfzo9u2vrb_415 ;
 wire	u7irfdfkpnrghehcu_550 ;
 wire	gwdd0itcegf139qefayrvqzmfyhh_808 ;
 wire [7:0] l8ra25bz99th3hoehxpmz4smm5pz881_217 ;
 wire [7:0] irj00xt9k6mgqgytiwuo7afbc7u_513 ;
 wire	dp7oz12i24pbjxuypk5qrehqk4_69 ;
 wire	ojpu4sogecttkh9f5k8qlw4gw_372 ;
 wire	rgvhiatqgzmhnvbd51pj2zb066gqrk_260 ;
 wire	ph3j3z30q8hl5m5slg7u4tgak1wx_830 ;
 wire	yjtyyuu1v9z8908ehyrdf7u_204 ;
 wire	ls45hmbug4fqlhqqizy_753 ;
 wire	ozvzixxcrwtg8j58ax_342 ;
 wire	vekb4y5q8jdulnleg05e5pnzbk1qjja_593 ;
 wire	ot9bnac7shcs7gbkiuge5mdaavcvk_189 ;
 wire	f0jt5v2yfcdx3ceaoyyevail8_675 ;
 reg	reofhhld0rj41vo1tytq710w_336;	 initial reofhhld0rj41vo1tytq710w_336 = 1'b0 ;
 reg	md98dflt39g3nx2y56t9y_575;	 initial md98dflt39g3nx2y56t9y_575 = 1'b0 ;
 reg	smbxpwly2y7ycxbq4jispa1c_510;	 initial smbxpwly2y7ycxbq4jispa1c_510 = 1'b0 ;
 wire	kpyohc9kg57mna55tudyf5dg7q_648 ;
 wire [289:0] dqenu8n0prrgb0q802d72tx242ht_122 ;
 wire	az0t877ybya29t8k567_810 ;
 wire [289:0] jphigcj3zv1r4oz08g6pq4e5pgzitlz_313 ;
 wire	xbn44i1a3ztdbz4wgryy6vb_536 ;
 wire	rx14b9sct9afngfnsrm_813 ;
 wire	uup9hpiip016jc9cace9cpz8f8_341 ;
 wire	jpjp9xhsjfn64f0q4zrrkd_299 ;
 wire	zbns8xj0wkkughzaqhg2x1t_189 ;
 wire	z9iwen5ofm5q3xvqzkc79p7bth_677 ;
 wire	fj8rfgihc91kxrhb_751 ;
 wire	ln1rug0ye6p7abfyiutzm_869 ;
 wire	ve1m47ewxfpd4n6v2t8w_751 ;
 wire	k661u2bdsjhp8h56onlsf9ax9op_849 ;
 wire	hngi9t4dvc67bjwmhn47bi7zlwvdyp1_323 ;
 wire	jjwzfa4vmk2vd93q0xu2hwooe3l_269 ;
 wire	wubm9hrecb60fiurpqh_358 ;
 wire	itn0sjbgjtgbstjzqbml8yj99mfuohk_727 ;
 wire [31:0] w1i609m3jkht7lc7gsu9nmxp10_616 ;
 wire [255:0] padg8j4kem76lwz33fvwpaa5o5ljt3_678 ;
 wire	yb1x3vw3tr5qu07ecejn_754 ;
 wire	d9ydi2bzgn4gg4jprkoabkdr5jh4il9_76 ;
 wire	n1jol55m32d8yfe7_246 ;
 wire	cmxmwcnajacpvhfhzpo8xa_490 ;
 wire	sn2kir4lp4vh9mw4q_269 ;
 wire	d2foz3lg0tthb15u2br7e_896 ;
 wire	rut2yprr3ofj6lquqb7t821juj7v93_734 ;
 wire	u9bmf1u1ddnaw5csalty62ndr_521 ;
 wire	atz2udrwkdxuwj2qmukzl7xrt_642 ;
 wire	zhhfhgx8wdrfby13v9qod4gfu2hzb9_789 ;
 wire	rll37gh39hsa0ovww4e5sbbs0_173 ;
 wire	guebsicm4aigc6f5m5lca6r_250 ;
 wire	juhwo95qn6rasrz1jc0ag0px_490 ;
 wire	tdcetshwzypa6vjfvt3f5txit09v4t_161 ;
 wire	e9uven2dezbhuncw5h2y6oj0j4_853 ;
 wire	pitoo9qkz3vx068sio_210 ;
 wire [0:0] uls50vnd3u1cdapbf6f1inpa20kqltgf_83 ;
 wire	pbhmdyj1wa8e7c334windr4_830 ;
 wire	xfqir1dr3x08hpcdto5tnxdr_700 ;
 wire [8:0] peweyw80m0mswyyglbalsfo5d7g_194 ;
 wire	fnn54z1lrrmdtfd0_43 ;
 wire	dckl76ecw4bg31pnqr8uy1xp_72 ;
 wire	t93hcl0jt8beojaubmpyxx8uw3egv_525 ;
 wire	nox5k9d926z6ss64joiz4sorfox0q_22 ;
 wire	sb1pof6wpmtd3mcd_93 ;
 wire	ho8mt1w48iwlmoszdw1t7gxggp0psjcf_644 ;
 wire	ute0ssv5dn408h4w66_578 ;
 wire [255:0] mdtn75wry8mae0wlxsv_705 ;
 wire	u8oyrdtifutwcraw9oiaret4redhg85y_55 ;
 wire [255:0] rxd305mrutbkdvv2alqtlzfx_638 ;
 wire	g9kn91aeezaz69aih0dh_55 ;
 wire	qiabxan2fejigtkcoddpwuylozo7kq_95 ;
 wire	b9cqbl2uoy21i757gjmk3wdur_341 ;
 wire [159:0] paye9mkap0d8qo2svmb7_592 ;
 wire	p0hvt3oue8iytktj3xy7_595 ;
 wire [159:0] rpk0951jqywgxqj312jpzwl0y8_0 ;
 wire	bev2rkoh45sko9m4sr_569 ;
 wire	vtpcoewvpwq1neh1v7ud25exfqu0_866 ;
 wire	x56qetulkf099ezn494agjkeuqtcm7q7_527 ;
 wire	ih8nez6xrarblqvctfmy4q1n2q_749 ;
 wire	gsiwvhvdbri0eg2i5tvknbzj2ot8_847 ;


 assign kpyohc9kg57mna55tudyf5dg7q_648 = 
	 ~(backpressure_in) ;
 assign dqenu8n0prrgb0q802d72tx242ht_122 = 
	{packet_in_PACKET2_TVALID, packet_in_PACKET2_TDATA, packet_in_PACKET2_TKEEP, packet_in_PACKET2_TLAST} ;
 assign az0t877ybya29t8k567_810 	= packet_in_PACKET2_TVALID ;
 assign jphigcj3zv1r4oz08g6pq4e5pgzitlz_313 	= dqenu8n0prrgb0q802d72tx242ht_122[289:0] ;
 assign xbn44i1a3ztdbz4wgryy6vb_536 = 
	nox5k9d926z6ss64joiz4sorfox0q_22 | ih8nez6xrarblqvctfmy4q1n2q_749 ;
 assign rx14b9sct9afngfnsrm_813 = 
	1'b0 ;
 assign uup9hpiip016jc9cace9cpz8f8_341 = 
	1'b1 ;
 assign jpjp9xhsjfn64f0q4zrrkd_299 = 
	 ~(yqwe82uzb396k4878_126) ;
 assign zbns8xj0wkkughzaqhg2x1t_189 = 
	ho8mt1w48iwlmoszdw1t7gxggp0psjcf_644 & xbn44i1a3ztdbz4wgryy6vb_536 & wubm9hrecb60fiurpqh_358 ;
 assign z9iwen5ofm5q3xvqzkc79p7bth_677 = 
	jpjp9xhsjfn64f0q4zrrkd_299 & r6yaone9frwm18ux38bon3h5_292 & wubm9hrecb60fiurpqh_358 & nox5k9d926z6ss64joiz4sorfox0q_22 & ho8mt1w48iwlmoszdw1t7gxggp0psjcf_644 ;
 assign fj8rfgihc91kxrhb_751 = 
	zbns8xj0wkkughzaqhg2x1t_189 | z9iwen5ofm5q3xvqzkc79p7bth_677 ;
 assign ln1rug0ye6p7abfyiutzm_869 = 
	kpyohc9kg57mna55tudyf5dg7q_648 & fj8rfgihc91kxrhb_751 ;
 assign ve1m47ewxfpd4n6v2t8w_751 = 
	backpressure_in & e3wluroomaw1pvti95hfmib2jl_776 & ho8mt1w48iwlmoszdw1t7gxggp0psjcf_644 & t93hcl0jt8beojaubmpyxx8uw3egv_525 & ih8nez6xrarblqvctfmy4q1n2q_749 & jpjp9xhsjfn64f0q4zrrkd_299 ;
 assign k661u2bdsjhp8h56onlsf9ax9op_849 = 
	ln1rug0ye6p7abfyiutzm_869 | ve1m47ewxfpd4n6v2t8w_751 ;
 assign hngi9t4dvc67bjwmhn47bi7zlwvdyp1_323 	= k661u2bdsjhp8h56onlsf9ax9op_849 ;
 assign jjwzfa4vmk2vd93q0xu2hwooe3l_269 = 
	1'b0 ;
 assign wubm9hrecb60fiurpqh_358 = 
	 ~(pawria2xeqo2knjypteb_129) ;
 assign itn0sjbgjtgbstjzqbml8yj99mfuohk_727 	= la8yn32c5dsnt00wdzznfpmvf8_10[0] ;
 assign w1i609m3jkht7lc7gsu9nmxp10_616 	= la8yn32c5dsnt00wdzznfpmvf8_10[32:1] ;
 assign padg8j4kem76lwz33fvwpaa5o5ljt3_678 	= la8yn32c5dsnt00wdzznfpmvf8_10[288:33] ;
 assign yb1x3vw3tr5qu07ecejn_754 	= la8yn32c5dsnt00wdzznfpmvf8_10[289] ;
 assign d9ydi2bzgn4gg4jprkoabkdr5jh4il9_76 = 
	e3wluroomaw1pvti95hfmib2jl_776 | twh2hto19glegtpzwgza2gku_685 ;
 assign n1jol55m32d8yfe7_246 = 
	so4vp0rfq409fl0mbwa_57 | wubm9hrecb60fiurpqh_358 ;
 assign cmxmwcnajacpvhfhzpo8xa_490 = 
	n1jol55m32d8yfe7_246 & ho8mt1w48iwlmoszdw1t7gxggp0psjcf_644 & xbn44i1a3ztdbz4wgryy6vb_536 ;
 assign sn2kir4lp4vh9mw4q_269 = 
	cmxmwcnajacpvhfhzpo8xa_490 | r6yaone9frwm18ux38bon3h5_292 ;
 assign d2foz3lg0tthb15u2br7e_896 = 
	backpressure_in & yb1x3vw3tr5qu07ecejn_754 & sn2kir4lp4vh9mw4q_269 ;
 assign rut2yprr3ofj6lquqb7t821juj7v93_734 = 
	t93hcl0jt8beojaubmpyxx8uw3egv_525 & rycno3yidgj08ocm_897 ;
 assign u9bmf1u1ddnaw5csalty62ndr_521 = 
	rut2yprr3ofj6lquqb7t821juj7v93_734 | nox5k9d926z6ss64joiz4sorfox0q_22 | itn0sjbgjtgbstjzqbml8yj99mfuohk_727 ;
 assign atz2udrwkdxuwj2qmukzl7xrt_642 = 
	kpyohc9kg57mna55tudyf5dg7q_648 & r6yaone9frwm18ux38bon3h5_292 & yb1x3vw3tr5qu07ecejn_754 & u9bmf1u1ddnaw5csalty62ndr_521 ;
 assign zhhfhgx8wdrfby13v9qod4gfu2hzb9_789 	= r6yaone9frwm18ux38bon3h5_292 ;
 assign rll37gh39hsa0ovww4e5sbbs0_173 	= packet_in_PACKET2_TVALID ;
 assign guebsicm4aigc6f5m5lca6r_250 = 
	1'b0 ;
 assign juhwo95qn6rasrz1jc0ag0px_490 = 
	1'b1 ;
 assign tdcetshwzypa6vjfvt3f5txit09v4t_161 = (
	((wgca90sykn5jr8r3cgfbn_334 == 1'b1) && (packet_in_PACKET2_TVALID == 1'b1))?1'b1:
	((crj4ryav9xxqfg250ay5v1qb737_519 == 1'b1) && (packet_in_PACKET2_TVALID == 1'b1))?1'b1:
	0)  ;
 assign e9uven2dezbhuncw5h2y6oj0j4_853 = (
	((packet_in_PACKET2_TVALID == 1'b1) && (packet_in_PACKET2_TLAST == 1'b1))?1'b1:
	0)  ;
 assign pitoo9qkz3vx068sio_210 = (
	((packet_in_PACKET2_TVALID == 1'b1) && (packet_in_PACKET2_TLAST == 1'b0))?1'b1:
	0)  ;
 assign uls50vnd3u1cdapbf6f1inpa20kqltgf_83 = tdcetshwzypa6vjfvt3f5txit09v4t_161 ;
 assign pbhmdyj1wa8e7c334windr4_830 	= k661u2bdsjhp8h56onlsf9ax9op_849 ;
 assign xfqir1dr3x08hpcdto5tnxdr_700 = 
	1'b0 ;
 assign peweyw80m0mswyyglbalsfo5d7g_194 	= us7gexub88s4rkwtyc_222[8:0] ;
 assign fnn54z1lrrmdtfd0_43 = (
	((peweyw80m0mswyyglbalsfo5d7g_194 != d1v6fdhdj6hqll7uiup4sep_79))?1'b1:
	0)  ;
 assign dckl76ecw4bg31pnqr8uy1xp_72 = m7efron6ej79cemh6_710 ;
 assign t93hcl0jt8beojaubmpyxx8uw3egv_525 = m7efron6ej79cemh6_710 ;
 assign nox5k9d926z6ss64joiz4sorfox0q_22 = 
	 ~(t93hcl0jt8beojaubmpyxx8uw3egv_525) ;
 assign sb1pof6wpmtd3mcd_93 	= oxp7okpn2y8nds2jeg7lr_881 ;
 assign ho8mt1w48iwlmoszdw1t7gxggp0psjcf_644 = 
	 ~(oxp7okpn2y8nds2jeg7lr_881) ;
 assign ute0ssv5dn408h4w66_578 = 
	ih8nez6xrarblqvctfmy4q1n2q_749 & ho8mt1w48iwlmoszdw1t7gxggp0psjcf_644 & dckl76ecw4bg31pnqr8uy1xp_72 & k661u2bdsjhp8h56onlsf9ax9op_849 ;
 assign mdtn75wry8mae0wlxsv_705 = 
	tuple_in_TUPLE0_DATA ;
 assign u8oyrdtifutwcraw9oiaret4redhg85y_55 	= tuple_in_TUPLE0_VALID ;
 assign rxd305mrutbkdvv2alqtlzfx_638 	= mdtn75wry8mae0wlxsv_705[255:0] ;
 assign g9kn91aeezaz69aih0dh_55 = 
	 ~(ijksayib6ih5eg8ntc44_595) ;
 assign qiabxan2fejigtkcoddpwuylozo7kq_95 	= ute0ssv5dn408h4w66_578 ;
 assign b9cqbl2uoy21i757gjmk3wdur_341 = 
	1'b0 ;
 assign paye9mkap0d8qo2svmb7_592 = 
	tuple_in_TUPLE1_DATA ;
 assign p0hvt3oue8iytktj3xy7_595 	= tuple_in_TUPLE1_VALID ;
 assign rpk0951jqywgxqj312jpzwl0y8_0 	= paye9mkap0d8qo2svmb7_592[159:0] ;
 assign bev2rkoh45sko9m4sr_569 = 
	 ~(odsi2bj8p2jmq58vpowfzo9u2vrb_415) ;
 assign vtpcoewvpwq1neh1v7ud25exfqu0_866 	= ute0ssv5dn408h4w66_578 ;
 assign x56qetulkf099ezn494agjkeuqtcm7q7_527 = 
	1'b0 ;
 assign ih8nez6xrarblqvctfmy4q1n2q_749 = 
	wubm9hrecb60fiurpqh_358 & g9kn91aeezaz69aih0dh_55 & bev2rkoh45sko9m4sr_569 ;
 assign gsiwvhvdbri0eg2i5tvknbzj2ot8_847 = 
	reofhhld0rj41vo1tytq710w_336 | md98dflt39g3nx2y56t9y_575 | smbxpwly2y7ycxbq4jispa1c_510 ;
 assign packet_out_PACKET2_TVALID 	= zhhfhgx8wdrfby13v9qod4gfu2hzb9_789 ;
 assign packet_out_PACKET2_TDATA 	= padg8j4kem76lwz33fvwpaa5o5ljt3_678[255:0] ;
 assign packet_out_PACKET2_TKEEP 	= w1i609m3jkht7lc7gsu9nmxp10_616[31:0] ;
 assign packet_out_PACKET2_TLAST 	= itn0sjbgjtgbstjzqbml8yj99mfuohk_727 ;
 assign packet_in_PACKET2_TREADY 	= packet_out_PACKET2_TREADY ;
 assign tuple_out_TUPLE0_VALID 	= rycno3yidgj08ocm_897 ;
 assign tuple_out_TUPLE0_DATA 	= slare5spsydxir8ekbg54rixdywz7b_898[255:0] ;
 assign tuple_out_TUPLE1_VALID 	= rycno3yidgj08ocm_897 ;
 assign tuple_out_TUPLE1_DATA 	= pw0q84va0xi10n2ilb23w5osgdh_782[159:0] ;


assign c5l1w37k4koubxxw3py8bh6w3zr5x_194 = (
	((k661u2bdsjhp8h56onlsf9ax9op_849 == 1'b1))?uup9hpiip016jc9cace9cpz8f8_341 :
	((kpyohc9kg57mna55tudyf5dg7q_648 == 1'b1))?rx14b9sct9afngfnsrm_813 :
	r6yaone9frwm18ux38bon3h5_292 ) ;

assign yqwe82uzb396k4878_126 = (
	((r6yaone9frwm18ux38bon3h5_292 == 1'b1) && (kpyohc9kg57mna55tudyf5dg7q_648 == 1'b1))?rx14b9sct9afngfnsrm_813 :
	r6yaone9frwm18ux38bon3h5_292 ) ;



always @(posedge clk_out_0)
begin
  if (rst_in_0) 
  begin
	e3wluroomaw1pvti95hfmib2jl_776 <= 1'b0 ;
	r6yaone9frwm18ux38bon3h5_292 <= 1'b0 ;
	so4vp0rfq409fl0mbwa_57 <= 1'b0 ;
	twh2hto19glegtpzwgza2gku_685 <= 1'b0 ;
	d1v6fdhdj6hqll7uiup4sep_79 <= 9'b000000000 ;
	reofhhld0rj41vo1tytq710w_336 <= 1'b0 ;
	backpressure_out <= 1'b0 ;
   end
  else
  begin
		e3wluroomaw1pvti95hfmib2jl_776 <= backpressure_in ;
		r6yaone9frwm18ux38bon3h5_292 <= c5l1w37k4koubxxw3py8bh6w3zr5x_194 ;
		so4vp0rfq409fl0mbwa_57 <= wubm9hrecb60fiurpqh_358 ;
		twh2hto19glegtpzwgza2gku_685 <= k661u2bdsjhp8h56onlsf9ax9op_849 ;
		d1v6fdhdj6hqll7uiup4sep_79 <= peweyw80m0mswyyglbalsfo5d7g_194 ;
		reofhhld0rj41vo1tytq710w_336 <= y70xk0au8agoez6cyvb7gxd8tbu5cd1_509 ;
		backpressure_out <= gsiwvhvdbri0eg2i5tvknbzj2ot8_847 ;
  end
end

always @(posedge clk_in_0)
begin
  if (rst_in_0) 
  begin
	wgca90sykn5jr8r3cgfbn_334 <= 1'b0 ;
	crj4ryav9xxqfg250ay5v1qb737_519 <= 1'b1 ;
   end
  else
  begin
	if (pitoo9qkz3vx068sio_210) 
	begin 
	  wgca90sykn5jr8r3cgfbn_334 <= 1'b0 ;
	 end 
	else 
	begin 
		if (e9uven2dezbhuncw5h2y6oj0j4_853) 
		begin 
			wgca90sykn5jr8r3cgfbn_334 <= juhwo95qn6rasrz1jc0ag0px_490 ;
		end 
	end 
	if (tdcetshwzypa6vjfvt3f5txit09v4t_161) 
	begin 
		crj4ryav9xxqfg250ay5v1qb737_519 <= guebsicm4aigc6f5m5lca6r_250 ;
	end 
  end
end

always @(posedge clk_out_1)
begin
  if (rst_in_0) 
  begin
	rycno3yidgj08ocm_897 <= 1'b0 ;
	md98dflt39g3nx2y56t9y_575 <= 1'b0 ;
   end
  else
  begin
		rycno3yidgj08ocm_897 <= ute0ssv5dn408h4w66_578 ;
		md98dflt39g3nx2y56t9y_575 <= iautwrlj1ibjtklzluexzx94qbv69r_789 ;
  end
end

always @(posedge clk_out_2)
begin
  if (rst_in_0) 
  begin
	smbxpwly2y7ycxbq4jispa1c_510 <= 1'b0 ;
   end
  else
  begin
		smbxpwly2y7ycxbq4jispa1c_510 <= u7irfdfkpnrghehcu_550 ;
  end
end

defparam vvs5qmsd38gqd6v6gl86vy7_210.WRITE_DATA_WIDTH = 290; 
defparam vvs5qmsd38gqd6v6gl86vy7_210.FIFO_WRITE_DEPTH = 512; 
defparam vvs5qmsd38gqd6v6gl86vy7_210.PROG_FULL_THRESH = 177; 
defparam vvs5qmsd38gqd6v6gl86vy7_210.PROG_EMPTY_THRESH = 177; 
defparam vvs5qmsd38gqd6v6gl86vy7_210.READ_MODE = "STD"; 
defparam vvs5qmsd38gqd6v6gl86vy7_210.WR_DATA_COUNT_WIDTH = 9; 
defparam vvs5qmsd38gqd6v6gl86vy7_210.RD_DATA_COUNT_WIDTH = 9; 
defparam vvs5qmsd38gqd6v6gl86vy7_210.DOUT_RESET_VALUE = "0"; 
defparam vvs5qmsd38gqd6v6gl86vy7_210.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_sync vvs5qmsd38gqd6v6gl86vy7_210 (
	.wr_en(az0t877ybya29t8k567_810),
	.din(jphigcj3zv1r4oz08g6pq4e5pgzitlz_313),
	.rd_en(hngi9t4dvc67bjwmhn47bi7zlwvdyp1_323),
	.sleep(jjwzfa4vmk2vd93q0xu2hwooe3l_269),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(kbl4jfw8777fmi0s9wxfjzf37yz_531), 
	.dout(la8yn32c5dsnt00wdzznfpmvf8_10), 
	.empty(pawria2xeqo2knjypteb_129), 
	.prog_full(y70xk0au8agoez6cyvb7gxd8tbu5cd1_509), 
	.full(u8apfje16isjrgo3xaesdko32aqtzob5_835), 
	.rd_data_count(h3fnbkb68x2idu83zsu81ux_689), 
	.wr_data_count(g939wve5sl8aks0iiaest3u6eoovfv_785), 
	.wr_rst_busy(s81wdm4uzc736oz96xn2yq8_117), 
	.rd_rst_busy(hsfsxqsyn75iwh4g5113o46e_520), 
	.overflow(izrhqfu68w8o35xvlbxs7ethkzxt_276), 
	.underflow(farklu8zchyqqmph7_96), 
	.sbiterr(h57ujtnuomefkk9u3_79), 
	.dbiterr(d8ye3ma36853kpnb27_232), 
	.almost_empty(zsq3ag4v9i6nsrrp8ir9yclw5g_591), 
	.almost_full(asgj3ocdw38zx85dnh4idrqxof_583), 
	.wr_ack(tlkl7oe8ymqkkvifru9ynml6y7_10), 
	.data_valid(bg8w5jpsokxlw3yd3lbdct_149), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam ygcgsylam63rre55h_2432.WRITE_DATA_WIDTH = 1; 
defparam ygcgsylam63rre55h_2432.FIFO_WRITE_DEPTH = 512; 
defparam ygcgsylam63rre55h_2432.PROG_FULL_THRESH = 177; 
defparam ygcgsylam63rre55h_2432.PROG_EMPTY_THRESH = 177; 
defparam ygcgsylam63rre55h_2432.READ_MODE = "FWFT"; 
defparam ygcgsylam63rre55h_2432.WR_DATA_COUNT_WIDTH = 9; 
defparam ygcgsylam63rre55h_2432.RD_DATA_COUNT_WIDTH = 9; 
defparam ygcgsylam63rre55h_2432.DOUT_RESET_VALUE = "0"; 
defparam ygcgsylam63rre55h_2432.FIFO_MEMORY_TYPE = "lutram"; 

xpm_fifo_sync ygcgsylam63rre55h_2432 (
	.wr_en(rll37gh39hsa0ovww4e5sbbs0_173),
	.din(uls50vnd3u1cdapbf6f1inpa20kqltgf_83),
	.rd_en(pbhmdyj1wa8e7c334windr4_830),
	.sleep(xfqir1dr3x08hpcdto5tnxdr_700),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(i2oa0e96v8wfaazzq70f8svpflu3dodm_53), 
	.dout(m7efron6ej79cemh6_710), 
	.empty(oxp7okpn2y8nds2jeg7lr_881), 
	.prog_full(nfokd0it7j0bt5oa0xdd0e521f3zex_750), 
	.full(uk6pxpjzmuoix2cu98kswayr4urn5he7_377), 
	.rd_data_count(us7gexub88s4rkwtyc_222), 
	.wr_data_count(aszgvokngqc8lypqcs9j_695), 
	.wr_rst_busy(iwmtoibnkx4zyw8gq90hle_557), 
	.rd_rst_busy(f30iwrltlj9sa7h5s0o9toszu5nb_610), 
	.overflow(umykotp1dv5zluka2_304), 
	.underflow(n2h21zhevcm6zo1kz5_343), 
	.sbiterr(agd07lcwvgoo4qyrwi_132), 
	.dbiterr(tqwkctcetf6hoa7d880eotabs3f_713), 
	.almost_empty(i0f4cuipuw2twufrpw49eok5cvau4y4_808), 
	.almost_full(xuquqznlqy967vked_299), 
	.wr_ack(kef085ufflqnbhe4qw7qrd135oo5a_137), 
	.data_valid(ximew9y94tj5wje6_428), 

	.wr_clk(clk_in_0), 
	.rst(rst_in_0) 
); 

defparam ttix8n57n4f36bwuqjf477eohn_624.WRITE_DATA_WIDTH = 256; 
defparam ttix8n57n4f36bwuqjf477eohn_624.FIFO_WRITE_DEPTH = 256; 
defparam ttix8n57n4f36bwuqjf477eohn_624.PROG_FULL_THRESH = 66; 
defparam ttix8n57n4f36bwuqjf477eohn_624.PROG_EMPTY_THRESH = 66; 
defparam ttix8n57n4f36bwuqjf477eohn_624.READ_MODE = "STD"; 
defparam ttix8n57n4f36bwuqjf477eohn_624.WR_DATA_COUNT_WIDTH = 8; 
defparam ttix8n57n4f36bwuqjf477eohn_624.RD_DATA_COUNT_WIDTH = 8; 
defparam ttix8n57n4f36bwuqjf477eohn_624.DOUT_RESET_VALUE = "0"; 
defparam ttix8n57n4f36bwuqjf477eohn_624.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async ttix8n57n4f36bwuqjf477eohn_624 (
	.wr_en(u8oyrdtifutwcraw9oiaret4redhg85y_55),
	.din(rxd305mrutbkdvv2alqtlzfx_638),
	.rd_en(qiabxan2fejigtkcoddpwuylozo7kq_95),
	.sleep(b9cqbl2uoy21i757gjmk3wdur_341),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(g3kltcujmt0bdjuwvmhtehqeot1tta_700), 
	.dout(slare5spsydxir8ekbg54rixdywz7b_898), 
	.empty(ijksayib6ih5eg8ntc44_595), 
	.prog_full(iautwrlj1ibjtklzluexzx94qbv69r_789), 
	.full(wf8lwc3e3s3el7q5q_506), 
	.rd_data_count(tgi7khppi2p8402ug4dhr1vl1n3_410), 
	.wr_data_count(tmol39go8cakc3hhx_855), 
	.wr_rst_busy(gy0ynok4aojxlsdjnhqhhvslrv_368), 
	.rd_rst_busy(o3xaemqnx1rbygjpwu3f0sjmjh6t_25), 
	.overflow(qrjwwo9wppkui2bv7jpx0ju090c_280), 
	.underflow(lrn4x2flid3uikwfdmq109c_377), 
	.sbiterr(u0h2yarjgrbs0lxh55da6e50u9g8_709), 
	.dbiterr(bthpxs8s89zqdkiusjjwv146js_754), 
	.almost_empty(qwzkex7avne7bo7hr9_410), 
	.almost_full(j8cgxdt87321eg71qi8kavnlpvpk7tj_144), 
	.wr_ack(hvpslzgd3co4m6w3_582), 
	.data_valid(v5f26prkzcyyv3s1rg8ms89r2jn8_74), 

	.wr_clk(clk_in_1), 

	.rd_clk(clk_out_1), 
	.rst(rst_in_1) 
); 

defparam iqgha4k7p8asvqz6yak5v5hjbto1pt_2380.WRITE_DATA_WIDTH = 160; 
defparam iqgha4k7p8asvqz6yak5v5hjbto1pt_2380.FIFO_WRITE_DEPTH = 256; 
defparam iqgha4k7p8asvqz6yak5v5hjbto1pt_2380.PROG_FULL_THRESH = 66; 
defparam iqgha4k7p8asvqz6yak5v5hjbto1pt_2380.PROG_EMPTY_THRESH = 66; 
defparam iqgha4k7p8asvqz6yak5v5hjbto1pt_2380.READ_MODE = "STD"; 
defparam iqgha4k7p8asvqz6yak5v5hjbto1pt_2380.WR_DATA_COUNT_WIDTH = 8; 
defparam iqgha4k7p8asvqz6yak5v5hjbto1pt_2380.RD_DATA_COUNT_WIDTH = 8; 
defparam iqgha4k7p8asvqz6yak5v5hjbto1pt_2380.DOUT_RESET_VALUE = "0"; 
defparam iqgha4k7p8asvqz6yak5v5hjbto1pt_2380.FIFO_MEMORY_TYPE = "bram"; 

xpm_fifo_async iqgha4k7p8asvqz6yak5v5hjbto1pt_2380 (
	.wr_en(p0hvt3oue8iytktj3xy7_595),
	.din(rpk0951jqywgxqj312jpzwl0y8_0),
	.rd_en(vtpcoewvpwq1neh1v7ud25exfqu0_866),
	.sleep(x56qetulkf099ezn494agjkeuqtcm7q7_527),
	.injectsbiterr(),
	.injectdbiterr(),


	.prog_empty(e02bb01t2ichpdcb5l031g0_553), 
	.dout(pw0q84va0xi10n2ilb23w5osgdh_782), 
	.empty(odsi2bj8p2jmq58vpowfzo9u2vrb_415), 
	.prog_full(u7irfdfkpnrghehcu_550), 
	.full(gwdd0itcegf139qefayrvqzmfyhh_808), 
	.rd_data_count(l8ra25bz99th3hoehxpmz4smm5pz881_217), 
	.wr_data_count(irj00xt9k6mgqgytiwuo7afbc7u_513), 
	.wr_rst_busy(dp7oz12i24pbjxuypk5qrehqk4_69), 
	.rd_rst_busy(ojpu4sogecttkh9f5k8qlw4gw_372), 
	.overflow(rgvhiatqgzmhnvbd51pj2zb066gqrk_260), 
	.underflow(ph3j3z30q8hl5m5slg7u4tgak1wx_830), 
	.sbiterr(yjtyyuu1v9z8908ehyrdf7u_204), 
	.dbiterr(ls45hmbug4fqlhqqizy_753), 
	.almost_empty(ozvzixxcrwtg8j58ax_342), 
	.almost_full(vekb4y5q8jdulnleg05e5pnzbk1qjja_593), 
	.wr_ack(ot9bnac7shcs7gbkiuge5mdaavcvk_189), 
	.data_valid(f0jt5v2yfcdx3ceaoyyevail8_675), 

	.wr_clk(clk_in_2), 

	.rd_clk(clk_out_2), 
	.rst(rst_in_2) 
); 

endmodule 
