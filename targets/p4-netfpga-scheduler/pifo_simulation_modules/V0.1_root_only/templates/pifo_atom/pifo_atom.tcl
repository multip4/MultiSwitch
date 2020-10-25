set design pifo_atom
set top pifo_calendar_atom_v0_2
set device xc7vx690t-3-ffg1761
set proj_dir ./ip_proj
set ip_version 1.00
set lib_name NetFPGA
#####################################
# set IP paths
#####################################

set axi_lite_ipif_ip_path ../../../xilinx/cores/axi_lite_ipif/source/
#####################################
# Project Settings
#####################################
create_project -name ${design} -force -dir "./${proj_dir}" -part ${device} -ip
set_property source_mgmt_mode All [current_project]
set_property top ${top} [current_fileset]
set_property ip_repo_paths $::env(SUME_FOLDER)/lib/hw/  [current_fileset]
puts "PIFO Atom"
#####################################
# Project Structure & IP Build
#####################################

read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/pifo_calendar_atom_v0_2.v"
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


ipx::add_user_parameter {ELEMENT_WIDTH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameters ELEMENT_WIDTH]
set_property display_name {ELEMENT_WIDTH} [ipx::get_user_parameters ELEMENT_WIDTH]
set_property value {32} [ipx::get_user_parameters ELEMENT_WIDTH]
set_property value_format {long} [ipx::get_user_parameters ELEMENT_WIDTH]

ipx::add_user_parameter {ELEMENT_RANK_WIDTH} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameters ELEMENT_RANK_WIDTH]
set_property display_name {ELEMENT_RANK_WIDTH} [ipx::get_user_parameters ELEMENT_RANK_WIDTH]
set_property value {19} [ipx::get_user_parameters ELEMENT_RANK_WIDTH]
set_property value_format {long} [ipx::get_user_parameters ELEMENT_RANK_WIDTH]

ipx::add_user_parameter {RANK_START_POS} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameters RANK_START_POS]
set_property display_name {RANK_START_POS} [ipx::get_user_parameters RANK_START_POS]
set_property value {12} [ipx::get_user_parameters RANK_START_POS]
set_property value_format {long} [ipx::get_user_parameters RANK_START_POS]

ipx::add_user_parameter {RANK_END_POS} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameters RANK_END_POS]
set_property display_name {RANK_END_POS} [ipx::get_user_parameters RANK_END_POS]
set_property value {30} [ipx::get_user_parameters RANK_END_POS]
set_property value_format {long} [ipx::get_user_parameters RANK_END_POS]

ipx::add_user_parameter {PIFO_INFO_VALID_POS} [ipx::current_core]
set_property value_resolve_type {user} [ipx::get_user_parameters PIFO_INFO_VALID_POS]
set_property display_name {PIFO_INFO_VALID_POS} [ipx::get_user_parameters PIFO_INFO_VALID_POS]
set_property value {31} [ipx::get_user_parameters PIFO_INFO_VALID_POS]
set_property value_format {long} [ipx::get_user_parameters PIFO_INFO_VALID_POS]


ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces in_pifo_input -of_objects [ipx::current_core]]
ipx::add_bus_parameter FREQ_HZ [ipx::get_bus_interfaces in_cpu_data -of_objects [ipx::current_core]]

ipx::infer_user_parameters [ipx::current_core]


ipx::check_integrity [ipx::current_core]
ipx::save_core [ipx::current_core]
update_ip_catalog
close_project

file delete -force ${proj_dir} 
