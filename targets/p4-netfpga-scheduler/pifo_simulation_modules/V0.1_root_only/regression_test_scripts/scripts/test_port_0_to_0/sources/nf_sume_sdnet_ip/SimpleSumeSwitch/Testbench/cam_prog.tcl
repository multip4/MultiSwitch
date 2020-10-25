#----------------------------------------------------------------------------
#   This file is owned and controlled by Xilinx and must be used solely    
#   for design, simulation, implementation and creation of design files    
#   limited to Xilinx devices or technologies. Use with non-Xilinx         
#   devices or technologies is expressly prohibited and immediately        
#   terminates your license.                                               
                                                                          
#   XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS" SOLELY   
#   FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR XILINX DEVICES.  BY   
#   PROVIDING THIS DESIGN, CODE, OR INFORMATION AS ONE POSSIBLE            
#   IMPLEMENTATION OF THIS FEATURE, APPLICATION OR STANDARD, XILINX IS     
#   MAKING NO REPRESENTATION THAT THIS IMPLEMENTATION IS FREE FROM ANY     
#   CLAIMS OF INFRINGEMENT, AND YOU ARE RESPONSIBLE FOR OBTAINING ANY      
#   RIGHTS YOU MAY REQUIRE FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY      
#   DISCLAIMS ANY WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE  
#   IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR         
#   REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF        
#   INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A  
#   PARTICULAR PURPOSE.                                                    
                                                                          
#   Xilinx products are not intended for use in life support appliances,   
#   devices, or systems.  Use in such applications are expressly           
#   prohibited.                                                            
                                                                          
#   (c) Copyright 1995-2016 Xilinx, Inc.                                   
#   All rights reserved.                                                   
#----------------------------------------------------------------------------
#----------------------------------------------------------------------------
source rw_procs.tcl

set MAX_KEY_REGISTERS 10
set MAX_VALUE_REGISTERS 8
global BASE_ADDR
set DEVICE_ID_ADDR [expr $BASE_ADDR+0x00000000]
set INIT_CONTROL_ADDR [expr $BASE_ADDR+0x00000020]
set ENTRY_COUNT_ADDR [expr $BASE_ADDR+0x00000024]
set AGING_CONTROL_ADDR [expr $BASE_ADDR+0x00000030]
set AGING_TIME_ADDR [expr $BASE_ADDR+0x00000034]
set UPDATE_REQ_ADDR [expr $BASE_ADDR+0x00000040]
set UPDATE_RESP_ADDR [expr $BASE_ADDR+0x00000044]
set _ADDR $BASE_ADDR
set _DATA 0
set _COUN 1


array set KEY_ADDR {}
array set MASK_ADDR {}
array set VALUE_ADDR {}

for { set i 0}  {$i < $MAX_KEY_REGISTERS} {incr i} {
	set KEY_ADDR($i) [expr $BASE_ADDR+0x00000050+4*$i]
}
for { set i 0}  {$i < $MAX_VALUE_REGISTERS} {incr i} {
	set VALUE_ADDR($i) [expr $BASE_ADDR+0x00000080+4*$i]
}

proc strlen {str_in} {
	if {$str_in == ""} {
		return 0
	} else {
		return [expr [strlen [string range $str_in 1 end]] + 1]
	}
}

proc hex_str_to_list {str_inp max_words} {
	set str_inp_int [string toupper $str_inp]
	set length [expr $max_words*8]
	set words_list {}
	set str_in $str_inp_int
	set char_zero 0
	for { set i 0}  {$i < [expr $length - [strlen $str_inp_int]]} {incr i} {
		set str_in $char_zero$str_in
	}
	for { set i 0}  {$i < $max_words} {incr i} {
		set word_str [string range $str_in [expr $i*8] [expr (($i+1)*8)-1]]
		scan $word_str "%8x" addr
		lappend words_list $addr
	}
	return $words_list
}

proc wait_for_wr_ack {} {
	global fpp0
	global _ADDR
	global _COUN
	global UPDATE_RESP_ADDR
	set read_data 0
	while {$read_data != 0x1} {
		set _ADDR 0x[format %08X $UPDATE_RESP_ADDR]
		set _COUN 1
		set read_data [expr 0x[string range [dataRead] 12 19] & 0x1]
		puts $fpp0 "mrd $_ADDR $_COUN"
		puts $fpp0 "update resp data = [format %08X $read_data]"
	}
}

proc cam_get_id {} {
	global fpp0
	global _ADDR
	global _COUN
	puts $fpp0 "cam_get_id : begin"
	global DEVICE_ID_ADDR
	set _ADDR 0x[format %08X $DEVICE_ID_ADDR]
	set _COUN 1
	set read_data 0x[string range [dataRead] 12 19]
	puts $fpp0 "mrd $_ADDR $_COUN"
	puts $fpp0 "DEVICE ID = $read_data"
	puts $fpp0 "cam_get_id : end"
	return $read_data
}

proc cam_init {} {
	global fpp0
	global _ADDR
	global _DATA
	global _COUN
	puts $fpp0 "cam_init : begin"
	global INIT_CONTROL_ADDR
	set _ADDR 0x[format %08X $INIT_CONTROL_ADDR]
	set _DATA 0x00000001
	dataWrite
	puts $fpp0 "mwr $_ADDR $_DATA"
	set read_data 0
	while {$read_data != 0x1} {
		set _ADDR 0x[format %08X $INIT_CONTROL_ADDR]
		set _COUN 1
		set read_data [expr [expr 0x[string range [dataRead] 12 19] >> 8] & 0x1]
		puts $fpp0 "mrd $_ADDR $_COUN"
	}
	puts $fpp0 "init done status = [format %08X $read_data]"
	set _ADDR 0x[format %08X $INIT_CONTROL_ADDR]
	set _DATA 0x00000000
	dataWrite
	puts $fpp0 "cam_init : end"
	return 0
}

proc cam_get_size {} {
	global fpp0
	global _ADDR
	global _COUN
	puts $fpp0 "cam_get_size : begin"
	global ENTRY_COUNT_ADDR
	set _ADDR 0x[format %08X $ENTRY_COUNT_ADDR]
	set _COUN 0x00000001
	set read_data 0x[string range [dataRead] 12 19]
	puts $fpp0 "mrd $_ADDR $_COUN"
	puts $fpp0 "NO OF STORED ENTRIES = $read_data"
	puts $fpp0 "cam_get_size : end"
	return $read_data
}

proc cam_write {key value static_flag} {
	global fpp0
	global _ADDR
	global _DATA
	global _COUN
	global MAX_KEY_REGISTERS
	global MAX_VALUE_REGISTERS
	global KEY_ADDR
	global VALUE_ADDR
	global UPDATE_REQ_ADDR
	global UPDATE_RESP_ADDR
	set key_words [hex_str_to_list $key $MAX_KEY_REGISTERS]
	set value_words [hex_str_to_list $value $MAX_VALUE_REGISTERS]
	puts $fpp0 "cam_write : begin"
	puts $fpp0 "cam_write : key=$key value=$value static_flag = $static_flag "
	for { set i 0}  {$i < $MAX_KEY_REGISTERS} {incr i} {
		set _ADDR 0x[format %08X $KEY_ADDR($i)]
		set _DATA 0x[format %08X [lindex $key_words [expr $MAX_KEY_REGISTERS - $i - 1]]]
		dataWrite
		puts $fpp0 "mwr $_ADDR $_DATA"
	}
	for { set i 0}  {$i < $MAX_VALUE_REGISTERS} {incr i} {
		set _ADDR 0x[format %08X $VALUE_ADDR($i)]
		set _DATA 0x[format %08X [lindex $value_words [expr $MAX_VALUE_REGISTERS - $i - 1]]]
		dataWrite
		puts $fpp0 "mwr $_ADDR $_DATA"
	}
	wait_for_wr_ack
	set _ADDR 0x[format %08X $UPDATE_REQ_ADDR]
	set _DATA 0x[format %08X [expr 0x00000001 | [expr [expr $static_flag << 8] & 0x00000100]]]
	dataWrite
	puts $fpp0 "mwr $_ADDR $_DATA"
	wait_for_wr_ack
	set _ADDR 0x[format %08X $UPDATE_RESP_ADDR]
	set _COUN 0x00000001
	set read_data 0x[expr [expr 0x[string range [dataRead] 12 19] & 0x2] >> 1]
	puts $fpp0 "mrd $_ADDR $_COUN"
	puts $fpp0 "cam_write : end"
	return $read_data
}

proc cam_erase {key} {
	global fpp0
	global _ADDR
	global _DATA
	global _COUN
	global MAX_KEY_REGISTERS
	global KEY_ADDR
	global UPDATE_REQ_ADDR
	global UPDATE_RESP_ADDR
	puts $fpp0 "cam_erase : key=$key begin"
	for { set i 0}  {$i < $MAX_KEY_REGISTERS} {incr i} {
		set _ADDR 0x[format %08X $KEY_ADDR($i)]
		set _DATA 0x[format %08X [lindex $key_words [expr $MAX_KEY_REGISTERS - $i - 1]]]
		dataWrite
		puts $fpp0 "mwr $_ADDR $_DATA"
	}
	wait_for_wr_ack
	set _ADDR 0x[format %08X $UPDATE_REQ_ADDR]
	set _DATA 0x[expr 0x00000002 & 0x3]
	dataWrite
	puts $fpp0 "mwr $_ADDR $_DATA"
	wait_for_wr_ack
	set _ADDR 0x[format %08X $UPDATE_RESP_ADDR]
	set _COUN 0x00000001
	set read_data 0x[expr [expr 0x[string range [dataRead] 12 19] & 0x2] >> 1]
	puts $fpp0 "mrd $_ADDR $_COUN"
	puts $fpp0 "cam_erase : end"
	return $read_data
}
