# Set variables.
set design "Extern_Calc_Sim"
set top my_extern_calc_0_t
set sim_top top_sim_tb
set device  xc7vx690t-3-ffg1761
set proj_dir ./project
# set public_repo_dir $::env(SUME_FOLDER)/lib/hw/
set xilinx_repo_dir $::env(XILINX_VIVADO)/data/ip/xilinx/
set repo_dir $::env(PROJECT_IP_PATH)
puts "repo_dir ${repo_dir}"

set bit_settings $::env(CONSTRAINTS)/generic_bit.xdc 
set project_constraints $::env(NF_DESIGN_DIR)/hw/constraints/nf_sume_general.xdc
set nf_10g_constraints $::env(NF_DESIGN_DIR)/hw/constraints/nf_sume_10g.xdc

set file_path_data_in [lindex $argv 0]
set file_path_data_exp [lindex $argv 1]
set file_path_data_log [lindex $argv 2]
set STOP_FAIL [lindex $argv 3]


#####################################
# Read IP Addresses and export registers
#####################################
# source $::env(NF_DESIGN_DIR)/hw/tcl/$::env(NF_PROJECT_NAME)_defines.tcl

# Build project.
create_project -name ${design} -force -dir "${proj_dir}" -part ${device}
set_property source_mgmt_mode DisplayOnly [current_project]  
set_property top ${top} [current_fileset]
# set_property ip_repo_paths   [current_fileset]
puts "Creating User Datapath reference project"


create_fileset -constrset -quiet constraints
# file copy ${public_repo_dir}/ ${repo_dir}
set_property ip_repo_paths ${repo_dir} [current_fileset]
update_ip_catalog


# # add pifo related sources
# # Zhenguo Cui.

read_verilog "./top_sim_tb.v"
read_verilog "./my_extern_calc_0_t.v"

read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/templates/extern_calc_no_cpu/hdl/drr_engine_pipe.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/templates/extern_calc_no_cpu/hdl/wrr_engine_pipe.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/templates/extern_calc_no_cpu/hdl/wfq_engine_pipe.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/templates/extern_calc_no_cpu/hdl/extern_fallthrough_small_fifo.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/templates/extern_calc_no_cpu/hdl/extern_small_fifo.v"

create_ip -name div_gen -vendor xilinx.com -library ip -version 5.1 -module_name div_gen_drr
set_property -dict [list CONFIG.operand_sign {Unsigned} CONFIG.latency {18}] [get_ips div_gen_drr]
#set_property -dict [list CONFIG.algorithm_type {Radix2} CONFIG.dividend_and_quotient_width {16} CONFIG.divisor_width {16} CONFIG.divisor_has_tlast {false} CONFIG.operand_sign {Unsigned} CONFIG.clocks_per_division {1} CONFIG.FlowControl {NonBlocking} CONFIG.latency_configuration {Automatic} CONFIG.remainder_type {Remainder} CONFIG.fractional_width {16} CONFIG.OptimizeGoal {Performance} CONFIG.OutTLASTBehv {Null} CONFIG.latency {18}] [get_ips div_gen_drr]
#set_property -dict [list CONFIG.operand_sign {Unsigned} CONFIG.FlowControl {Blocking} CONFIG.OptimizeGoal {Resources} CONFIG.latency {19}] [get_ips div_gen_drr]
generate_target all [get_ips div_gen_drr]


create_ip -name sim_stim_general -vendor NetFPGA -library NetFPGA -version 1.00 -module_name sim_stim_general_ip
# reset_target all [get_ips sim_stim_general_ip]
# set_property -dict [list CONFIG.FILE_PATH "./dummy.txt"][get_ips sim_stim_general_ip]
# set_property -dict [list CONFIG.DATA_0_WIDTH {10}}][get_ips sim_stim_general_ip]


#valid, stateful_valid, output_port, class_id, class_weight, pkt_size, calc_type
set_property -dict [list CONFIG.DATA_COUNT {9}    \
CONFIG.HAND_SHAKE {0} \
CONFIG.DATA_0_WIDTH {1} \
CONFIG.DATA_1_WIDTH {1} \
CONFIG.DATA_2_WIDTH {8} \
CONFIG.DATA_3_WIDTH {5} \
CONFIG.DATA_4_WIDTH {16} \
CONFIG.DATA_5_WIDTH {16} \
CONFIG.DATA_6_WIDTH {8} \
CONFIG.DATA_7_WIDTH {32} \
CONFIG.DATA_8_WIDTH {32} \
CONFIG.FILE_PATH ${file_path_data_in}] [get_ips sim_stim_general_ip]
generate_target all [get_ips sim_stim_general_ip]

create_ip -name sim_checker_general -vendor NetFPGA -library NetFPGA -version 1.00 -module_name sim_checker_general_ip

#valid, data
set_property -dict [list CONFIG.DATA_COUNT {2} \
CONFIG.DATA_0_WIDTH {1} \
CONFIG.DATA_1_WIDTH {32} \
CONFIG.STOP_FAIL ${STOP_FAIL} \
CONFIG.FILE_PATH ${file_path_data_exp} \
CONFIG.LOG_FILE_PATH ${file_path_data_log}] [get_ips sim_checker_general_ip]
generate_target all [get_ips sim_checker_general_ip]

update_compile_order -fileset sources_1
update_compile_order -fileset sim_1

set_property top ${sim_top} [get_filesets sim_1]
set_property include_dirs ${proj_dir} [get_filesets sim_1]
set_property simulator_language Mixed [current_project]
set_property verilog_define { {SIMULATION=1} } [get_filesets sim_1]
set_property -name xsim.more_options -value {-testplusarg TESTNAME=basic_test} -objects [get_filesets sim_1]
set_property runtime {} [get_filesets sim_1]
set_property target_simulator xsim [current_project]
set_property compxlib.xsim_compiled_library_dir {} [current_project]
set_property top_lib xil_defaultlib [get_filesets sim_1]
update_compile_order -fileset sim_1

# set output [exec python $::env(NF_DESIGN_DIR)/test/${test_name}/run.py]
# puts $output

set_property xsim.view {} [get_filesets sim_1]
launch_simulation -simset sim_1 -mode behavioral
run 60us