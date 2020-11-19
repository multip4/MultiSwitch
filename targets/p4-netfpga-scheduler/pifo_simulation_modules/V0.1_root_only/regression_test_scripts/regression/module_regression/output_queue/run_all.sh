#!/bin/bash
function run_test(){
test_case=$1
STOP_FAIL=$2
test_folder=$(pwd)/test_data/${test_case}

data_in_path=${test_folder}/data_in.txt
data_exp_path=${test_folder}/data_exp.txt
log_path=$(pwd)/log_${test_case}_$(date '+%d%m%Y_%H%M%S').txt


echo ${data_in_path}
echo ${data_exp_path}

echo ${log_path}


rm -rfv project;\
rm -rfv vivado*;\
rm -rfv .Xil;\

echo "Create reference project under folder /project";\
vivado -mode batch -source ./tcl/output_queue_sim.tcl -tclargs ${data_in_path} ${data_exp_path} ${log_path} ${STOP_FAIL}
}





cd test_data
TEST_CASES=$(ls -d *);
cd ..


for test in ${TEST_CASES}; do
    echo "$test"

    run_test ${test} 0;

done

rm -rfv project;\
rm -rfv vivado*;\
rm -rfv .Xil;\