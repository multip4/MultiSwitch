# TCL script for import demo related files and 
# BRam Settings

set RC_BRAM_A_WIDTH 32
set RC_BRAM_A_DEPTH 256
set RC_BRAM_A_OP "READ_FIRST"
set RC_BRAM_B_WIDTH 32


# #Adding Block Ram Forest.1000
# create_ip -name blk_mem_gen -vendor xilinx.com -library ip -version 8.4 -module_name blk_mem_gen_0
# set_property -dict [list CONFIG.Memory_Type {Simple_Dual_Port_RAM} CONFIG.Write_Width_A ${RC_BRAM_A_WIDTH} CONFIG.Write_Depth_A ${RC_BRAM_A_DEPTH} CONFIG.Read_Width_A ${RC_BRAM_A_WIDTH} CONFIG.Operating_Mode_A ${RC_BRAM_A_OP} CONFIG.Enable_A {Always_Enabled} CONFIG.Write_Width_B ${RC_BRAM_B_WIDTH} CONFIG.Read_Width_B ${RC_BRAM_B_WIDTH} CONFIG.Enable_B {Always_Enabled} CONFIG.Register_PortA_Output_of_Memory_Primitives {false} CONFIG.Register_PortB_Output_of_Memory_Primitives {false} CONFIG.Port_B_Clock {100} CONFIG.Port_B_Enable_Rate {100}] [get_ips blk_mem_gen_0]
# #set_property generate_synth_checkpoint false [get_files blk_mem_gen_0.xci]
# reset_target all [get_ips blk_mem_gen_0]
# generate_target all [get_ips blk_mem_gen_0]


set SCHE_BUFFER_DEPTH 512
set SCHE_PIFO_CALENDAR_DEPTH 128

set SCHE_ADDR_TABLE_WIDTH 9
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

# input arbiter to sdnet_ip.
set_property -dict [list CONFIG.C_S_AXIS_TUSER_WIDTH {160}] [get_ips nf_sume_sdnet_ip]

read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/scheduler_top_v0_1.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/addr_manager_v0_2.v"

# read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/addr_manager_v0_1.v"
# read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/output_queue_v0_1.v"
# read_verilog "./modules/buffer_wrapper_v0_1.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/buffer_wrapper_v1_0_with_cpu.v"
# read_verilog "./modules/pifo_calendar_atom_v0_1.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/pifo_calendar_atom_v0_2.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/output_queue_v0_1_with_cpu.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/cpu_sub.v"
# read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/pifo_calendar_v0_1.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/pifo_calendar_v0_1_with_cpu.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/output_queue_bypass_checker.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/eneueue_agent_v0_1.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/modules/top_scheduler_cpu_defines.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/templates/nf_datapath/nf_datapath.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/templates/ip/sss_output_queue_single_v1/hdl/sss_output_queue_single.v"

read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/templates/fallthrough_small_fifo_v1_0_0/hdl/fallthrough_small_fifo.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/templates/fallthrough_small_fifo_v1_0_0/hdl/small_fifo.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/templates/sss_fallthrough_small_fifo_v1_0_0/hdl/sss_fallthrough_small_fifo.v"
read_verilog "$::env(P4_PROJECT_PIFO_MODULES_DIR)/templates/sss_fallthrough_small_fifo_v1_0_0/hdl/sss_small_fifo.v"



# create_ip -name scheduler_top_v0_1 -vendor NetFPGA -library NetFPGA -module_name scheduler_top_v0_1_ip
# set_property -dict [list CONFIG.PIFO_CALENDAR_DEPTH ${SCHE_PIFO_CALENDAR_DEPTH}] [get_ips scheduler_top_v0_1_ip]
# reset_target all [get_ips scheduler_top_v0_1_ip]
# generate_target all [get_ips scheduler_top_v0_1_ip]


