#!/bin/bash

NF_DATAPATH_NAME=nf_datapath_chain3210
CUR_PATH=$(pwd)
echo "go to project path"
cd ${P4_PROJECT_DIR}

cd ${P4_PROJECT_DIR}
./run_global_sim_gui.sh

cd ${CUR_PATH}