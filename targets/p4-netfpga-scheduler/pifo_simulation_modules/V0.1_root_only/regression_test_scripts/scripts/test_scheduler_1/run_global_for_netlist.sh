#!/bin/bash

NF_DATAPATH_NAME=nf_datapath
CUR_PATH=$(pwd)
echo "go to project path"
cd ${P4_PROJECT_DIR}

cd testdata
python ./gen_testdata.py

cd ${P4_PROJECT_DIR}
./run_global_sim.sh

cd ${CUR_PATH}