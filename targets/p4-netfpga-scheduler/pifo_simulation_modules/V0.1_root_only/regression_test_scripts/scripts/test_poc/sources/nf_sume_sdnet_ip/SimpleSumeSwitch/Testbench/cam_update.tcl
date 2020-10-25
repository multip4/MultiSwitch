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
################################################################################
#
# Description : This is CAM update file
#  Command on Linux: 
#    ./cam_update.tcl pcie 0xfb900000 0xfb400000 0xfb800000 0x00020000 update.tbl
#    first 3 hex numbers represent starting addresses of BAR 0, 2 and 4 fourth one is TCAM offset address and fifth one is update.tbl file
#  Command on Windows (XSDB):
#    source cam_update.tcl
#
################################################################################

if { $argc > 0 } {
  set _LINK  [lindex $argv 0]
}

if { $argc == 6 } {
  set _BAR0  [lindex $argv 1]
  set _BAR2  [lindex $argv 2]
  set _BAR4  [lindex $argv 3]
  set _TCAM_OFFSET  [lindex $argv 4]
  set fileName  [lindex $argv 5]
} else {
  set _BAR0  0xfb900000
  set _BAR2  0xfb400000
  set _BAR4  0xfb800000
  set _TCAM_OFFSET  0x00020000
  set fileName "update.tbl"
}

# Starting addresses for BAR 0, 2 and 4 on XSDB
if { $argc == 0} {
  set _BAR0  0x10000000
  set _BAR2  0x40000000
  set _BAR4  0x80000000
  set _CAM_OFFSET  0x00020000
  set fileName "update.tbl"
}

set BASE_ADDR [expr $_BAR2 + $_CAM_OFFSET]
set fpp1 [open "cam_update.txt" "w"]
set fpp0 [open "cam_prog.txt" "w"]
source cam_prog.tcl
set static_flag 0
set device_id [cam_get_id]
puts $fpp1 "device_id = $device_id"
#cam_init
catch {set fptr [open $fileName r]} ;
set contents [read $fptr] ;#Read the file contents
close $fptr ;#Close the file since it has been read now
set splitCont [split $contents "\n"] ;#Split the files contents on new line
set no_of_lines [llength $splitCont]
puts $fpp1 "Number of lines = $no_of_lines"
foreach ele $splitCont {
	if {[string range [lindex $ele 0] 0 0] == "#"} {
		;
	} else {
		if {[scan $ele "%s %s" key value] == 2} {
			#cam_write $key $value $static_flag
			puts $fpp1 "cam_write $key $value"
		}
	}
}
close $fpp0
close $fpp1
