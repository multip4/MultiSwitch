# TCL script for import demo related files and 
# BRam Settings

#Adding Block Ram Forest.1000
create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.4 -module_name blk_mem_gen_0
set_property -dict [list CONFIG.Memory_Type {Simple_Dual_Port_RAM} CONFIG.Write_Width_A {32} CONFIG.Write_Depth_A {256} CONFIG.Read_Width_A {32} CONFIG.Operating_Mode_A {NO_CHANGE} CONFIG.Enable_A {Always_Enabled} CONFIG.Write_Width_B {32} CONFIG.Read_Width_B {32} CONFIG.Enable_B {Always_Enabled} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100}] [get_ips blk_mem_gen_0]
#set_property generate_synth_checkpoint false [get_files blk_mem_gen_0.xci]
reset_target all [get_ips blk_mem_gen_0]
generate_target all [get_ips blk_mem_gen_0]

# Porting Jinkook's tcl source.
#1. pkt coe
create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.4 -module_name addr_table_12_4096_with_coe
set_property -dict [list CONFIG.Component_Name {addr_table_12_4096_with_coe} CONFIG.Memory_Type {True_Dual_Port_RAM} CONFIG.Assume_Synchronous_Clk {true} CONFIG.Write_Width_A {12} CONFIG.Write_Depth_A {4096} CONFIG.Read_Width_A {12} CONFIG.Operating_Mode_A {READ_FIRST} CONFIG.Enable_A {Always_Enabled} CONFIG.Write_Width_B {12} CONFIG.Read_Width_B {12} CONFIG.Operating_Mode_B {READ_FIRST} CONFIG.Enable_B {Always_Enabled} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Load_Init_File {true} CONFIG.Coe_File $::env(P4_PROJECT_PIFO_MODULES_DIR)/coe/addr_table_12_4096_2.coe CONFIG.Port_B_Clock {100} CONFIG.Port_B_Write_Rate {50} CONFIG.Port_B_Enable_Rate {100}] [get_ips addr_table_12_4096_with_coe]
generate_target all [get_ips addr_table_12_4096_with_coe]

#2. pkt buffer
create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.4 -module_name buffer_pkt_289_4096
set_property -dict [list CONFIG.Memory_Type {True_Dual_Port_RAM} CONFIG.Assume_Synchronous_Clk {true} CONFIG.Write_Width_A {289} CONFIG.Write_Depth_A {4096} CONFIG.Read_Width_A {289} CONFIG.Enable_A {Always_Enabled} CONFIG.Write_Width_B {289} CONFIG.Read_Width_B {289} CONFIG.Operating_Mode_B {READ_FIRST} CONFIG.Enable_B {Always_Enabled} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Write_Rate {50} CONFIG.Port_B_Enable_Rate {100}] [get_ips buffer_pkt_289_4096]
generate_target all [get_ips buffer_pkt_289_4096]

#3. sume meta buffer
create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.4 -module_name buffer_meta_128_4096
#set_property -dict [list CONFIG.Component_Name {buffer_meta_128_4096} CONFIG.Memory_Type {Simple_Dual_Port_RAM} CONFIG.Assume_Synchronous_Clk {true} CONFIG.Write_Width_A {128} CONFIG.Write_Depth_A {4096} CONFIG.Read_Width_A {128} CONFIG.Operating_Mode_A {WRITE_FIRST} CONFIG.Enable_A {Always_Enabled} CONFIG.Write_Width_B {128} CONFIG.Read_Width_B {128} CONFIG.Operating_Mode_B {READ_FIRST} CONFIG.Enable_B {Always_Enabled} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100}] [get_ips buffer_meta_128_4096]
set_property -dict [list CONFIG.Memory_Type {True_Dual_Port_RAM} CONFIG.Assume_Synchronous_Clk {true} CONFIG.Write_Width_A {128} CONFIG.Write_Depth_A {4096} CONFIG.Read_Width_A {128} CONFIG.Enable_A {Always_Enabled} CONFIG.Write_Width_B {128} CONFIG.Read_Width_B {128} CONFIG.Operating_Mode_B {READ_FIRST} CONFIG.Enable_B {Always_Enabled} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Write_Rate {50} CONFIG.Port_B_Enable_Rate {100}] [get_ips buffer_meta_128_4096]
generate_target all [get_ips buffer_meta_128_4096]

#4. pifo info buffer
create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.4 -module_name buffer_pifo_32_4096
set_property -dict [list CONFIG.Memory_Type {True_Dual_Port_RAM} CONFIG.Assume_Synchronous_Clk {true} CONFIG.Write_Width_A {32} CONFIG.Write_Depth_A {4096} CONFIG.Read_Width_A {32} CONFIG.Enable_A {Always_Enabled} CONFIG.Write_Width_B {32} CONFIG.Read_Width_B {32} CONFIG.Operating_Mode_B {READ_FIRST} CONFIG.Enable_B {Always_Enabled} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Write_Rate {50} CONFIG.Port_B_Enable_Rate {100}] [get_ips buffer_pifo_32_4096]
generate_target all [get_ips buffer_pifo_32_4096]

set_property -dict [list CONFIG.C_S_AXIS_TUSER_WIDTH {160}] [get_ips nf_sume_sdnet_ip]

read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/scheduler_top_v0_1.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/addr_manager_v0_1.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/output_queue_v0_1.v"
# read_verilog "./modules/buffer_wrapper_v0_1.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/buffer_wrapper_v1_0_with_cpu.v"
# read_verilog "./modules/pifo_calendar_atom_v0_1.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/pifo_calendar_atom_v0_2.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/output_queue_v0_1_with_cpu.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/cpu_sub.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/pifo_calendar_v0_1.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/pifo_calendar_v0_1_with_cpu.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/eneueue_agent_v0_1.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/top_scheduler_cpu_defines.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/nf_datapath.v"



