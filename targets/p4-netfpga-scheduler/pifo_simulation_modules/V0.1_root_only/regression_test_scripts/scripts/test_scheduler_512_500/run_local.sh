#!/bin/bash

P4_PROJECT_DEMO_TCL=p4_pifo_demo 
CUR_PATH=$(pwd)
echo "go to project path"
cd ${P4_PROJECT_DIR}

cd nf_sume_sdnet_ip/SimpleSumeSwitch/
./vivado_sim.bash


# echo "<addr, data>: (00000641, 00000001)" >> config_writes.txt
# echo "<addr, data>: (00000642, 0000000a)" >> config_writes.txt
# echo "<addr, data>: (00000643, 000000aa)" >> config_writes.txt

cd my_extern_calc_0_t.HDL
echo "SED: insert DRR init code"
sed -i '/ \/\/div_gen macro/a \\	);' my_extern_calc_0_t.v
sed -i '/ \/\/div_gen macro/a \\	    .aclk(clk_lookup)' my_extern_calc_0_t.v
sed -i '/ \/\/div_gen macro/a \\	    .m_axis_dout_tdata({w_div_out_quotient,w_div_out_remain}),' my_extern_calc_0_t.v
sed -i '/ \/\/div_gen macro/a \\	    .m_axis_dout_tvalid(w_div_out_valid),' my_extern_calc_0_t.v
sed -i '/ \/\/div_gen macro/a \\	    .s_axis_dividend_tdata(w_div_pkt_size),' my_extern_calc_0_t.v
sed -i '/ \/\/div_gen macro/a \\	    .s_axis_dividend_tvalid(tuple_in_my_extern_calc_input_VALID),' my_extern_calc_0_t.v
sed -i '/ \/\/div_gen macro/a \\	    .s_axis_divisor_tdata(w_div_divisor),    ' my_extern_calc_0_t.v
sed -i '/ \/\/div_gen macro/a \\	    .s_axis_divisor_tvalid(tuple_in_my_extern_calc_input_VALID),' my_extern_calc_0_t.v
sed -i '/ \/\/div_gen macro/a \\	(' my_extern_calc_0_t.v
sed -i '/ \/\/div_gen macro/a \\	div_gen_drr_inst' my_extern_calc_0_t.v
sed -i  '/ \/\/div_gen macro/a \\	div_gen_drr' my_extern_calc_0_t.v
echo "Done SED: insert DRR init code"

cd ${CUR_PATH}


