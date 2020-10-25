create_project SimpleSumeSwitch SimpleSumeSwitch_vivado/SimpleSumeSwitch -part xcvu9p-flgc2104-2-e
add_files -scan_for_includes ./
update_compile_order -fileset sources_1
update_compile_order -fileset sources_1
set_property top SimpleSumeSwitch [current_fileset]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
ipx::package_project -root_dir SimpleSumeSwitch_vivado/SimpleSumeSwitch/SimpleSumeSwitch.srcs/sources_1/imports/SimpleSumeSwitch -vendor xilinx.com -library user -taxonomy /UserIP
set_property library sdnet [ipx::current_core]
set_property name SimpleSumeSwitch [ipx::current_core]
set_property display_name SimpleSumeSwitch_v1_0 [ipx::current_core]
set_property description SimpleSumeSwitch_v1_0 [ipx::current_core]
set_property supported_families { {artix7} {Production} {artix7l} {Production} {aartix7} {Production} {aspartan7} {Production} {azynq} {Production} {kintex7} {Production} {kintex7l} {Production} {kintexu} {Production} {kintexuplus} {Production} {qartix7} {Production} {qkintex7} {Production} {qkintex7l} {Production} {qvirtex7} {Production} {qzynq} {Production} {spartan7} {Production} {virtex7} {Production} {virtexu} {Production} {virtexuplus} {Production} {zynq} {Production} {zynquplus} {Production} {zynquplusRFSOC} {Production} } [ipx::current_core]
set_property taxonomy {/Communication_&_Networking /UserIP} [ipx::current_core]


ipx::infer_bus_interface {clk_line} xilinx.com:signal:clock_rtl:1.0 [ipx::current_core]
ipx::infer_bus_interface {clk_lookup} xilinx.com:signal:clock_rtl:1.0 [ipx::current_core]
ipx::infer_bus_interface {clk_control} xilinx.com:signal:clock_rtl:1.0 [ipx::current_core]



ipx::infer_bus_interface {packet_in_packet_in_TVALID packet_in_packet_in_TREADY packet_in_packet_in_TDATA packet_in_packet_in_TKEEP packet_in_packet_in_TLAST } xilinx.com:interface:axis_rtl:1.0 [ipx::current_core]
ipx::infer_bus_interface {packet_out_packet_out_TVALID packet_out_packet_out_TREADY packet_out_packet_out_TDATA packet_out_packet_out_TKEEP packet_out_packet_out_TLAST } xilinx.com:interface:axis_rtl:1.0 [ipx::current_core]
ipx::add_bus_parameter ASSOCIATED_BUSIF [ipx::get_bus_interfaces clk_line -of_objects [ipx::current_core]] 
set_property value packet_in_packet_in:packet_out_packet_out [ipx::get_bus_parameters ASSOCIATED_BUSIF -of_objects [ipx::get_bus_interfaces clk_line -of_objects [ipx::current_core]]] 
ipx::infer_bus_interface {control_S_AXI_AWADDR control_S_AXI_AWVALID control_S_AXI_AWREADY control_S_AXI_WDATA control_S_AXI_WSTRB control_S_AXI_WVALID control_S_AXI_WREADY control_S_AXI_BRESP control_S_AXI_BVALID control_S_AXI_BREADY control_S_AXI_ARADDR control_S_AXI_ARVALID control_S_AXI_ARREADY control_S_AXI_RDATA control_S_AXI_RRESP control_S_AXI_RVALID control_S_AXI_RREADY } xilinx.com:interface:aximm_rtl:1.0 [ipx::current_core]
ipx::add_memory_map control_S_AXI [ipx::current_core]
set_property slave_memory_map_ref control_S_AXI [ipx::get_bus_interfaces control_S_AXI -of_objects [ipx::current_core]]


set_property core_revision 2 [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]

set_property  ip_repo_paths  SimpleSumeSwitch_vivado/SimpleSumeSwitch/SimpleSumeSwitch.srcs/sources_1/imports/SimpleSumeSwitch [current_project]
update_ip_catalog

set_property core_revision 3 [ipx::current_core]
ipx::create_xgui_files [ipx::current_core]
ipx::update_checksums [ipx::current_core]
ipx::save_core [ipx::current_core]
update_ip_catalog -rebuild -repo_path SimpleSumeSwitch_vivado/SimpleSumeSwitch/SimpleSumeSwitch.srcs/sources_1/imports/SimpleSumeSwitch
set_property -name {STEPS.SYNTH_DESIGN.ARGS.MORE OPTIONS} -value {-mode out_of_context} -objects [get_runs synth_1]
close_project


