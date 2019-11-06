# Need 4 Block Ram for Scheduler Block
# 1. AddrManager // Free-list

# notice!!!. the blockram uses .coe file, need to change the path to your enviroment.

create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.4 -module_name addr_table_12_4096_with_coe

set_property -dict [list CONFIG.Component_Name {addr_table_12_4096_with_coe} CONFIG.Memory_Type {True_Dual_Port_RAM} CONFIG.Assume_Synchronous_Clk {true} CONFIG.Write_Width_A {12} CONFIG.Write_Depth_A {4096} CONFIG.Read_Width_A {12} CONFIG.Operating_Mode_A {READ_FIRST} CONFIG.Enable_A {Always_Enabled} CONFIG.Write_Width_B {12} CONFIG.Read_Width_B {12} CONFIG.Operating_Mode_B {READ_FIRST} CONFIG.Enable_B {Always_Enabled} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Load_Init_File {true} CONFIG.Coe_File {/home/jkchoi/Documents/git/MultiSwitch/targets/p4-netfpga-scheduler/pifo_simulation_modules/V0.1_root_only/addr_table_12_4096_2.coe} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Write_Rate {50} CONFIG.Port_B_Enable_Rate {100}] [get_ips addr_table_12_4096_with_coe]

generate_target {instantiation_template} [get_files /home/jkchoi/Documents/git/MultiSwitch/targets/p4-netfpga-scheduler/pifo_simulation_modules/V0.1_root_only/project_pifo_calendar_root_only/project_pifo_calendar_root_only.srcs/sources_1/ip/addr_table_12_4096_with_coe/addr_table_12_4096_with_coe.xci]



#2. pkt buffer
create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.4 -module_name buffer_pkt_289_4096

set_property -dict [list CONFIG.Component_Name {buffer_pkt_289_4096} CONFIG.Memory_Type {Simple_Dual_Port_RAM} CONFIG.Assume_Synchronous_Clk {true} CONFIG.Write_Width_A {289} CONFIG.Write_Depth_A {4096} CONFIG.Read_Width_A {289} CONFIG.Operating_Mode_A {WRITE_FIRST} CONFIG.Enable_A {Always_Enabled} CONFIG.Write_Width_B {289} CONFIG.Read_Width_B {289} CONFIG.Operating_Mode_B {READ_FIRST} CONFIG.Enable_B {Always_Enabled} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100}] [get_ips buffer_pkt_289_4096]

generate_target {instantiation_template} [get_files /home/jkchoi/Documents/git/MultiSwitch/targets/p4-netfpga-scheduler/pifo_simulation_modules/V0.1_root_only/project_pifo_calendar_root_only/project_pifo_calendar_root_only.srcs/sources_1/ip/buffer_pkt_289_4096/buffer_pkt_289_4096.xci]

#3. sume meta buffer
create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.4 -module_name buffer_meta_128_4096

set_property -dict [list CONFIG.Component_Name {buffer_meta_128_4096} CONFIG.Memory_Type {Simple_Dual_Port_RAM} CONFIG.Assume_Synchronous_Clk {true} CONFIG.Write_Width_A {128} CONFIG.Write_Depth_A {4096} CONFIG.Read_Width_A {128} CONFIG.Operating_Mode_A {WRITE_FIRST} CONFIG.Enable_A {Always_Enabled} CONFIG.Write_Width_B {128} CONFIG.Read_Width_B {128} CONFIG.Operating_Mode_B {READ_FIRST} CONFIG.Enable_B {Always_Enabled} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100}] [get_ips buffer_meta_128_4096]

generate_target {instantiation_template} [get_files /home/jkchoi/Documents/git/MultiSwitch/targets/p4-netfpga-scheduler/pifo_simulation_modules/V0.1_root_only/project_pifo_calendar_root_only/project_pifo_calendar_root_only.srcs/sources_1/ip/buffer_meta_128_4096/buffer_meta_128_4096.xci]

#4. pifo info buffer

create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.4 -module_name buffer_pifo_32_4096

set_property -dict [list CONFIG.Component_Name {buffer_pifo_32_4096} CONFIG.Memory_Type {Simple_Dual_Port_RAM} CONFIG.Assume_Synchronous_Clk {true} CONFIG.Write_Width_A {32} CONFIG.Write_Depth_A {4096} CONFIG.Read_Width_A {32} CONFIG.Operating_Mode_A {WRITE_FIRST} CONFIG.Enable_A {Always_Enabled} CONFIG.Write_Width_B {32} CONFIG.Read_Width_B {32} CONFIG.Operating_Mode_B {READ_FIRST} CONFIG.Enable_B {Always_Enabled} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100}] [get_ips buffer_pifo_32_4096]

generate_target {instantiation_template} [get_files /home/jkchoi/Documents/git/MultiSwitch/targets/p4-netfpga-scheduler/pifo_simulation_modules/V0.1_root_only/project_pifo_calendar_root_only/project_pifo_calendar_root_only.srcs/sources_1/ip/buffer_pifo_32_4096/buffer_pifo_32_4096.xci]




