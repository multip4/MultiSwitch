#!/bin/bash

P4_PROJECT_DEMO_TCL=p4_pifo_demo 
CUR_PATH=$(pwd)
echo "go to project path"
cd ${P4_PROJECT_DIR}

echo "Remove Previous Logs/Files"

rm -rf nf_sume_sdnet_ip
rm src/project_demo_solution.p4
rm src/commands.txt

# cp -r ${CUR_PATH}/nf_sume_sdnet_ip ./
cp ${CUR_PATH}/sources/commands.txt ./src/
cp ${CUR_PATH}/../p4src/project_demo_solution.p4 ./src/
cp ${CUR_PATH}/sources/gen_testdata.py ./testdata/

make

cd nf_sume_sdnet_ip/SimpleSumeSwitch/

echo "Add last pifo info signals to the SimpleSumeSwitch.v"
sed -i  '/clk_control,/a  \\tlast_pkt_info0,' SimpleSumeSwitch.v
sed -i  '/clk_control,/a  \\tlast_pkt_info1,' SimpleSumeSwitch.v
sed -i  '/clk_control,/a  \\tlast_pkt_info2,' SimpleSumeSwitch.v
sed -i  '/clk_control,/a  \\tlast_pkt_info3,' SimpleSumeSwitch.v
sed -i  '/clk_control,/a  \\tlast_pkt_info4,' SimpleSumeSwitch.v

sed -i '/output \[0:0\] internal_rst_done ;/a reg \t [31:0] \t r_last_pkt_info0;' SimpleSumeSwitch.v
sed -i '/output \[0:0\] internal_rst_done ;/a reg \t [31:0] \t r_last_pkt_info1;' SimpleSumeSwitch.v
sed -i '/output \[0:0\] internal_rst_done ;/a reg \t [31:0] \t r_last_pkt_info2;' SimpleSumeSwitch.v
sed -i '/output \[0:0\] internal_rst_done ;/a reg \t [31:0] \t r_last_pkt_info3;' SimpleSumeSwitch.v
sed -i '/output \[0:0\] internal_rst_done ;/a reg \t [31:0] \t r_last_pkt_info4;' SimpleSumeSwitch.v


sed -i '/output \[0:0\] internal_rst_done ;/a input \t [31:0] \t last_pkt_info0;' SimpleSumeSwitch.v
sed -i '/output \[0:0\] internal_rst_done ;/a input \t [31:0] \t last_pkt_info1;' SimpleSumeSwitch.v
sed -i '/output \[0:0\] internal_rst_done ;/a input \t [31:0] \t last_pkt_info2;' SimpleSumeSwitch.v
sed -i '/output \[0:0\] internal_rst_done ;/a input \t [31:0] \t last_pkt_info3;' SimpleSumeSwitch.v
sed -i '/output \[0:0\] internal_rst_done ;/a input \t [31:0] \t last_pkt_info4;' SimpleSumeSwitch.v



sed -i '/.tuple_out_my_extern_calc_output_DATA/a .last_pifo_info0(r_last_pkt_info0),' SimpleSumeSwitch.v
sed -i '/.tuple_out_my_extern_calc_output_DATA/a .last_pifo_info1(r_last_pkt_info1),' SimpleSumeSwitch.v
sed -i '/.tuple_out_my_extern_calc_output_DATA/a .last_pifo_info2(r_last_pkt_info2),' SimpleSumeSwitch.v
sed -i '/.tuple_out_my_extern_calc_output_DATA/a .last_pifo_info3(r_last_pkt_info3),' SimpleSumeSwitch.v
sed -i '/.tuple_out_my_extern_calc_output_DATA/a .last_pifo_info4(r_last_pkt_info4),' SimpleSumeSwitch.v


# sed -i '/// black box\nmy_extern_calc_0_t/a )' SimpleSumeSwitch.v
# sed -i '/my_extern_calc_0_t\\n/a .DEBUG(0)' SimpleSumeSwitch.v
# sed -i '/my_extern_calc_0_t\\n/a #(' SimpleSumeSwitch.v

sed -i '/&& clk_control_init_done ) ;/a end' SimpleSumeSwitch.v
sed -i '/&& clk_control_init_done ) ;/a 	end' SimpleSumeSwitch.v
sed -i '/&& clk_control_init_done ) ;/a 		r_last_pkt_info4 <= last_pkt_info4;' SimpleSumeSwitch.v
sed -i '/&& clk_control_init_done ) ;/a 		r_last_pkt_info3 <= last_pkt_info3;' SimpleSumeSwitch.v
sed -i '/&& clk_control_init_done ) ;/a 		r_last_pkt_info2 <= last_pkt_info2;' SimpleSumeSwitch.v
sed -i '/&& clk_control_init_done ) ;/a 		r_last_pkt_info1 <= last_pkt_info1;' SimpleSumeSwitch.v
sed -i '/&& clk_control_init_done ) ;/a 		r_last_pkt_info0 <= last_pkt_info0;' SimpleSumeSwitch.v
sed -i '/&& clk_control_init_done ) ;/a 	else  begin' SimpleSumeSwitch.v
sed -i '/&& clk_control_init_done ) ;/a 	end' SimpleSumeSwitch.v
sed -i '/&& clk_control_init_done ) ;/a 		r_last_pkt_info4 <= 0;' SimpleSumeSwitch.v
sed -i '/&& clk_control_init_done ) ;/a 		r_last_pkt_info3 <= 0;' SimpleSumeSwitch.v
sed -i '/&& clk_control_init_done ) ;/a 		r_last_pkt_info2 <= 0;' SimpleSumeSwitch.v
sed -i '/&& clk_control_init_done ) ;/a 		r_last_pkt_info1 <= 0;' SimpleSumeSwitch.v
sed -i '/&& clk_control_init_done ) ;/a 		r_last_pkt_info0 <= 0;' SimpleSumeSwitch.v
sed -i '/&& clk_control_init_done ) ;/a 	if ( clk_line_rst_high ) begin' SimpleSumeSwitch.v
sed -i '/&& clk_control_init_done ) ;/a always @( posedge clk_line ) begin' SimpleSumeSwitch.v

cd ${CUR_PATH}