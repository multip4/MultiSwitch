# Set variables.
set design "Output_Queue_Sim"
set top output_queue_v0_1_with_cpu
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





set SCHE_BUFFER_DEPTH 4096
set SCHE_ADDR_TABLE_WIDTH 12
set SCHE_PIFO_CALENDAR_DEPTH 512


set SCHE_PKT_BUFFER_WIDTH 289
set SCHE_META_BUFFER_WIDTH 128
set SCHE_PIFO_BUFFER_WIDTH 32

exec python $::env(P4_PROJECT_PIFO_MODULES_DIR)/addr_table_coe_gen.py ${SCHE_BUFFER_DEPTH} $::env(P4_PROJECT_PIFO_MODULES_DIR)/coe/addr_table.coe

# Porting Jinkook's tcl source.
#1. pkt addr coe
create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.4 -module_name addr_table_12_4096_with_coe
set_property -dict [list CONFIG.Memory_Type {True_Dual_Port_RAM} CONFIG.Assume_Synchronous_Clk {true} CONFIG.Write_Width_A ${SCHE_ADDR_TABLE_WIDTH} CONFIG.Write_Depth_A ${SCHE_BUFFER_DEPTH} CONFIG.Read_Width_A ${SCHE_ADDR_TABLE_WIDTH} CONFIG.Operating_Mode_A {WRITE_FIRST} CONFIG.Enable_A {Always_Enabled} CONFIG.Write_Width_B ${SCHE_ADDR_TABLE_WIDTH} CONFIG.Read_Width_B ${SCHE_ADDR_TABLE_WIDTH} CONFIG.Operating_Mode_B {READ_FIRST} CONFIG.Enable_B {Always_Enabled} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Load_Init_File {true} CONFIG.Coe_File $::env(P4_PROJECT_PIFO_MODULES_DIR)/coe/addr_table.coe CONFIG.Port_B_Clock {100} CONFIG.Port_B_Write_Rate {50} CONFIG.Port_B_Enable_Rate {100}] [get_ips addr_table_12_4096_with_coe]
generate_target all [get_ips addr_table_12_4096_with_coe]

#2. pkt buffer
create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.4 -module_name buffer_pkt_289_4096
set_property -dict [list CONFIG.Memory_Type {True_Dual_Port_RAM} CONFIG.Assume_Synchronous_Clk {true} CONFIG.Write_Width_A ${SCHE_PKT_BUFFER_WIDTH} CONFIG.Write_Depth_A ${SCHE_BUFFER_DEPTH} CONFIG.Read_Width_A ${SCHE_PKT_BUFFER_WIDTH} CONFIG.Operating_Mode_A {READ_FIRST} CONFIG.Enable_A {Always_Enabled} CONFIG.Write_Width_B ${SCHE_PKT_BUFFER_WIDTH} CONFIG.Read_Width_B ${SCHE_PKT_BUFFER_WIDTH} CONFIG.Operating_Mode_B {READ_FIRST} CONFIG.Enable_B {Always_Enabled} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Write_Rate {50} CONFIG.Port_B_Enable_Rate {100}] [get_ips buffer_pkt_289_4096]
generate_target all [get_ips buffer_pkt_289_4096]

#3. sume meta buffer
create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.4 -module_name buffer_meta_128_4096
#set_property -dict [list CONFIG.Component_Name {buffer_meta_128_4096} CONFIG.Memory_Type {Simple_Dual_Port_RAM} CONFIG.Assume_Synchronous_Clk {true} CONFIG.Write_Width_A {128} CONFIG.Write_Depth_A {4096} CONFIG.Read_Width_A {128} CONFIG.Operating_Mode_A {WRITE_FIRST} CONFIG.Enable_A {Always_Enabled} CONFIG.Write_Width_B {128} CONFIG.Read_Width_B {128} CONFIG.Operating_Mode_B {READ_FIRST} CONFIG.Enable_B {Always_Enabled} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100}] [get_ips buffer_meta_128_4096]
set_property -dict [list CONFIG.Memory_Type {True_Dual_Port_RAM} CONFIG.Assume_Synchronous_Clk {true} CONFIG.Write_Width_A ${SCHE_META_BUFFER_WIDTH} CONFIG.Write_Depth_A ${SCHE_BUFFER_DEPTH} CONFIG.Read_Width_A ${SCHE_META_BUFFER_WIDTH} CONFIG.Operating_Mode_A {READ_FIRST} CONFIG.Enable_A {Always_Enabled} CONFIG.Write_Width_B ${SCHE_META_BUFFER_WIDTH} CONFIG.Read_Width_B ${SCHE_META_BUFFER_WIDTH} CONFIG.Operating_Mode_B {READ_FIRST} CONFIG.Enable_B {Always_Enabled} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Write_Rate {50} CONFIG.Port_B_Enable_Rate {100}] [get_ips buffer_meta_128_4096]
generate_target all [get_ips buffer_meta_128_4096]

#4. pifo info buffer
create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.4 -module_name buffer_pifo_32_4096
set_property -dict [list CONFIG.Memory_Type {True_Dual_Port_RAM} CONFIG.Assume_Synchronous_Clk {true} CONFIG.Write_Width_A ${SCHE_PIFO_BUFFER_WIDTH} CONFIG.Write_Depth_A ${SCHE_BUFFER_DEPTH} CONFIG.Read_Width_A ${SCHE_PIFO_BUFFER_WIDTH} CONFIG.Operating_Mode_A {READ_FIRST} CONFIG.Enable_A {Always_Enabled} CONFIG.Write_Width_B ${SCHE_PIFO_BUFFER_WIDTH} CONFIG.Read_Width_B ${SCHE_PIFO_BUFFER_WIDTH} CONFIG.Operating_Mode_B {READ_FIRST} CONFIG.Enable_B {Always_Enabled} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Write_Rate {50} CONFIG.Port_B_Enable_Rate {100}] [get_ips buffer_pifo_32_4096]
generate_target all [get_ips buffer_pifo_32_4096]





# # add pifo related sources
# # Zhenguo Cui.


read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/output_queue_v0_1_with_cpu.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/block_ram_wrapper.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/pifo_calendar_demo_v1.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/pifo_calendar_atom_v0_4.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/output_queue_bypass_checker.v"
# read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/eneueue_agent_v0_1.v"
read_verilog "./top_sim_tb.v"

create_ip -name sim_stim_general -vendor NetFPGA -library NetFPGA -version 1.00 -module_name sim_stim_general_ip
# reset_target all [get_ips sim_stim_general_ip]
# set_property -dict [list CONFIG.FILE_PATH "./dummy.txt"][get_ips sim_stim_general_ip]
# set_property -dict [list CONFIG.DATA_0_WIDTH {10}}][get_ips sim_stim_general_ip]

#
#0 valid, 
#1 last
#2 tdata
#3 keep
#4 user
#5 tpifo
#6 buffer wr
#7 pifo insert
#8 port_ready
set_property -dict [list CONFIG.DATA_COUNT {9} \
CONFIG.HAND_SHAKE {0} \
CONFIG.DATA_0_WIDTH {1} \
CONFIG.DATA_1_WIDTH {1} \
CONFIG.DATA_2_WIDTH {256} \
CONFIG.DATA_3_WIDTH {32} \
CONFIG.DATA_4_WIDTH {128} \
CONFIG.DATA_5_WIDTH {32} \
CONFIG.DATA_6_WIDTH {1} \
CONFIG.DATA_7_WIDTH {1} \
CONFIG.DATA_8_WIDTH {1} \
CONFIG.FILE_PATH ${file_path_data_in}] [get_ips sim_stim_general_ip]
generate_target all [get_ips sim_stim_general_ip]

create_ip -name sim_checker_general -vendor NetFPGA -library NetFPGA -version 1.00 -module_name sim_checker_general_ip

#0 valid, 
#1 last
#2 tdata
#3 keep
#4 user
#5 tpifo
#6 buffer full
#7 pifo full
#8 buffer counter

set_property -dict [list CONFIG.DATA_COUNT {6} \
CONFIG.DATA_0_WIDTH {1} \
CONFIG.DATA_1_WIDTH {1} \
CONFIG.DATA_2_WIDTH {256} \
CONFIG.DATA_3_WIDTH {32} \
CONFIG.DATA_4_WIDTH {128} \
CONFIG.DATA_5_WIDTH {32} \
CONFIG.DATA_6_WIDTH {1} \
CONFIG.DATA_7_WIDTH {1} \
CONFIG.DATA_8_WIDTH {12} \
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