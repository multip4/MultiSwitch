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

cd ${CUR_PATH}