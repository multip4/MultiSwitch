#!/bin/bash

test_case=$1

test_folder=$(pwd)/test_data/${test_case}

data_in_path=${test_folder}/data_in.txt
data_exp_path=${test_folder}/data_exp.txt
log_path=$(date '+%d%m%Y_%H_%M_%S')_log_${test_case}.txt


echo ${data_in_path}
echo ${data_exp_path}

echo ${log_path}

rm -rfv project;\
rm -rfv vivado*;\
rm -rfv .Xil;\

echo "Create reference project under folder /project";\
vivado -mode gui -source ./tcl/pifo_calendar_sim.tcl -tclargs ${data_in_path} ${data_exp_path} ${log_path}


