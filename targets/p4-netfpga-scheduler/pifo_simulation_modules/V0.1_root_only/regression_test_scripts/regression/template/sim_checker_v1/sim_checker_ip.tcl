# Vivado Launch Script
#### Change design settings here #######
set design sim_checker_general
set top sim_checker_general
set device xc7vx690t-3-ffg1761
set proj_dir ./ip_proj
set ip_version 1.00
set lib_name NetFPGA
#####################################
# set IP paths
#####################################
# set axi_lite_ipif_ip_path ../../../xilinx/cores/axi_lite_ipif/source/
#####################################
# Project Settings
#####################################
create_project -name ${design} -force -dir "./${proj_dir}" -part ${device} -ip
set_property source_mgmt_mode All [current_project]  
set_property top ${top} [current_fileset]
set_property ip_repo_paths $::env(P4_PROJECT_PIFO_MODULES_DIR)/templates/ip/  [current_fileset]
puts "Creating pifo_calendar"
# Project Constraints
#####################################
# Project Structure & IP Build
#####################################

# read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/pifo_calendar_atom_v0_2.v"
read_verilog "./sim_checker_general.v"


update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
ipx::package_project

set_property name ${design} [ipx::current_core]
set_property library ${lib_name} [ipx::current_core]
set_property vendor_display_name {KoreaUniv} [ipx::current_core]
set_property company_url {http://www.korea.ac.kr} [ipx::current_core]
set_property vendor {NetFPGA} [ipx::current_core]
set_property supported_families {{virtex7} {Production}} [ipx::current_core]
set_property taxonomy {{/NetFPGA/Generic}} [ipx::current_core]
set_property version ${ip_version} [ipx::current_core]
set_property display_name ${design} [ipx::current_core]
set_property description ${design} [ipx::current_core]
ipx::infer_user_parameters [ipx::current_core]

ipx::add_user_parameter {DATA_COUNT} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameters DATA_COUNT]
set_property display_name {DATA_COUNT} [ipx::get_user_parameters DATA_COUNT]
set_property value {10} [ipx::get_user_parameters DATA_COUNT]
set_property value_format {long} [ipx::get_user_parameters DATA_COUNT]

ipx::add_user_parameter {FILE_PATH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameters FILE_PATH]
set_property display_name {FILE_PATH} [ipx::get_user_parameters FILE_PATH]
set_property value {"./dummy.txt"} [ipx::get_user_parameters FILE_PATH]
set_property value_format {string} [ipx::get_user_parameters FILE_PATH]

ipx::add_user_parameter {LOG_FILE_PATH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameters LOG_FILE_PATH]
set_property display_name {LOG_FILE_PATH} [ipx::get_user_parameters LOG_FILE_PATH]
set_property value {"./dummy_log.log"} [ipx::get_user_parameters LOG_FILE_PATH]
set_property value_format {String} [ipx::get_user_parameters LOG_FILE_PATH]

ipx::add_user_parameter {DATA_0_WIDTH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameters DATA_0_WIDTH]
set_property display_name {DATA_0_WIDTH} [ipx::get_user_parameters DATA_0_WIDTH]
set_property value {1} [ipx::get_user_parameters DATA_0_WIDTH]
set_property value_format {long} [ipx::get_user_parameters DATA_0_WIDTH]

ipx::add_user_parameter {DATA_1_WIDTH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameters DATA_1_WIDTH]
set_property display_name {DATA_1_WIDTH} [ipx::get_user_parameters DATA_1_WIDTH]
set_property value {1} [ipx::get_user_parameters DATA_1_WIDTH]
set_property value_format {long} [ipx::get_user_parameters DATA_1_WIDTH]

ipx::add_user_parameter {DATA_2_WIDTH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameters DATA_2_WIDTH]
set_property display_name {DATA_2_WIDTH} [ipx::get_user_parameters DATA_2_WIDTH]
set_property value {1} [ipx::get_user_parameters DATA_2_WIDTH]
set_property value_format {long} [ipx::get_user_parameters DATA_2_WIDTH]

ipx::add_user_parameter {DATA_3_WIDTH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameters DATA_3_WIDTH]
set_property display_name {DATA_3_WIDTH} [ipx::get_user_parameters DATA_3_WIDTH]
set_property value {1} [ipx::get_user_parameters DATA_3_WIDTH]
set_property value_format {long} [ipx::get_user_parameters DATA_3_WIDTH]

ipx::add_user_parameter {DATA_4_WIDTH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameters DATA_4_WIDTH]
set_property display_name {DATA_4_WIDTH} [ipx::get_user_parameters DATA_4_WIDTH]
set_property value {1} [ipx::get_user_parameters DATA_4_WIDTH]
set_property value_format {long} [ipx::get_user_parameters DATA_4_WIDTH]

ipx::add_user_parameter {DATA_5_WIDTH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameters DATA_5_WIDTH]
set_property display_name {DATA_5_WIDTH} [ipx::get_user_parameters DATA_5_WIDTH]
set_property value {1} [ipx::get_user_parameters DATA_5_WIDTH]
set_property value_format {long} [ipx::get_user_parameters DATA_5_WIDTH]

ipx::add_user_parameter {DATA_6_WIDTH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameters DATA_6_WIDTH]
set_property display_name {DATA_6_WIDTH} [ipx::get_user_parameters DATA_6_WIDTH]
set_property value {1} [ipx::get_user_parameters DATA_6_WIDTH]
set_property value_format {long} [ipx::get_user_parameters DATA_6_WIDTH]

ipx::add_user_parameter {DATA_7_WIDTH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameters DATA_7_WIDTH]
set_property display_name {DATA_7_WIDTH} [ipx::get_user_parameters DATA_7_WIDTH]
set_property value {1} [ipx::get_user_parameters DATA_7_WIDTH]
set_property value_format {long} [ipx::get_user_parameters DATA_7_WIDTH]

ipx::add_user_parameter {DATA_8_WIDTH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameters DATA_8_WIDTH]
set_property display_name {DATA_8_WIDTH} [ipx::get_user_parameters DATA_8_WIDTH]
set_property value {1} [ipx::get_user_parameters DATA_8_WIDTH]
set_property value_format {long} [ipx::get_user_parameters DATA_8_WIDTH]

ipx::add_user_parameter {DATA_9_WIDTH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameters DATA_9_WIDTH]
set_property display_name {DATA_9_WIDTH} [ipx::get_user_parameters DATA_9_WIDTH]
set_property value {1} [ipx::get_user_parameters DATA_9_WIDTH]
set_property value_format {long} [ipx::get_user_parameters DATA_9_WIDTH]


# ipx::add_subcore NetFPGA:NetFPGA:pifo_calendar_atom:1.00

ipx::infer_user_parameters [ipx::current_core]

ipx::check_integrity [ipx::current_core]
ipx::save_core [ipx::current_core]
update_ip_catalog
close_project

file delete -force ${proj_dir} 