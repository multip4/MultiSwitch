#!/bin/bash

CUR_PATH=$(pwd)
echo "go to project path"
cd ${P4_PROJECT_DIR}

cd nf_sume_sdnet_ip/SimpleSumeSwitch/
./vivado_sim.bash

cd ${CUR_PATH}