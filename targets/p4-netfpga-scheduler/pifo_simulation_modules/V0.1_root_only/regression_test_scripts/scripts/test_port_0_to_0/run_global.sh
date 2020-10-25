#!/bin/bash

P4_PROJECT_DEMO_TCL=p4_pifo_demo 
CUR_PATH=$(pwd)
echo "go to project path"
cd ${P4_PROJECT_DIR}

cd testdata
python ./gen_testdata.py

cd ${P4_PROJECT_DIR}
./run_global_sim.sh

cd ${CUR_PATH}