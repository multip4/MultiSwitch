#!/bin/bash

P4_PROJECT_DEMO_TCL=p4_pifo_demo 
CUR_PATH=$(pwd)
echo "go to project path"
cd ${P4_PROJECT_DIR}

echo "Remove Previous Logs/Files"

rm -rf nf_sume_sdnet_ip
rm -rf src/project_demo_solution.p4
rm -rf src/commands.txt

cp -r ${CUR_PATH}/sources/nf_sume_sdnet_ip ./
# cp ${CUR_PATH}/commands.txt ./src/
# cp ${CUR_PATH}/project_demo_solution.p4 ./src/
cp ${CUR_PATH}/sources/gen_testdata.py ./testdata/

rm -f testdata/*.pcap

rm -f simple_sume_switch/test/*.axi

cd testdata
python ./gen_testdata.py

cd ${CUR_PATH}