#!/bin/bash

P4_PROJECT_DEMO_TCL=p4_pifo_demo 
CUR_PATH=$(pwd)
echo "go to project path"
cd ${P4_PROJECT_DIR}

echo "Remove Previous Logs/Files"

rm -rf nf_sume_sdnet_ip
rm -rf src/project_demo_solution.p4
rm -rf src/commands.txt

# cp -r ${CUR_PATH}/nf_sume_sdnet_ip ./
cp ${CUR_PATH}/sources/commands.txt ./src/
cp ${CUR_PATH}/sources/project_demo_solution.p4 ./src/
cp ${CUR_PATH}/sources/gen_testdata.py ./testdata/

make

cd nf_sume_sdnet_ip/SimpleSumeSwitch/

echo "Add last pifo info signals to the SimpleSumeSwitch.v"
sed -i  '/clk_control,/a  \\tlast_pkt_info0,' SimpleSumeSwitch.v
sed -i  '/clk_control,/a  \\tlast_pkt_info1,' SimpleSumeSwitch.v
sed -i  '/clk_control,/a  \\tlast_pkt_info2,' SimpleSumeSwitch.v
sed -i  '/clk_control,/a  \\tlast_pkt_info3,' SimpleSumeSwitch.v
sed -i  '/clk_control,/a  \\tlast_pkt_info4,' SimpleSumeSwitch.v

sed -i '/output \[0:0\] internal_rst_done ;/a input \t [31:0] \t last_pkt_info0;' SimpleSumeSwitch.v
sed -i '/output \[0:0\] internal_rst_done ;/a input \t [31:0] \t last_pkt_info1;' SimpleSumeSwitch.v
sed -i '/output \[0:0\] internal_rst_done ;/a input \t [31:0] \t last_pkt_info2;' SimpleSumeSwitch.v
sed -i '/output \[0:0\] internal_rst_done ;/a input \t [31:0] \t last_pkt_info3;' SimpleSumeSwitch.v
sed -i '/output \[0:0\] internal_rst_done ;/a input \t [31:0] \t last_pkt_info4;' SimpleSumeSwitch.v

sed -i '/.tuple_out_my_extern_calc_output_DATA/a .last_pifo_info0(last_pkt_info0),' SimpleSumeSwitch.v
sed -i '/.tuple_out_my_extern_calc_output_DATA/a .last_pifo_info1(last_pkt_info1),' SimpleSumeSwitch.v
sed -i '/.tuple_out_my_extern_calc_output_DATA/a .last_pifo_info2(last_pkt_info2),' SimpleSumeSwitch.v
sed -i '/.tuple_out_my_extern_calc_output_DATA/a .last_pifo_info3(last_pkt_info3),' SimpleSumeSwitch.v
sed -i '/.tuple_out_my_extern_calc_output_DATA/a .last_pifo_info4(last_pkt_info4),' SimpleSumeSwitch.v

cd ${CUR_PATH}