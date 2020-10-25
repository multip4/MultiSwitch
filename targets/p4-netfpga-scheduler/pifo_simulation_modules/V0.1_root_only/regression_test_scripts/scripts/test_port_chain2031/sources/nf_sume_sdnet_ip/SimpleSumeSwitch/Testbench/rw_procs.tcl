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
proc dataRead {} {
  global _ADDR
  global _COUN
  global _LINK

  if {$_LINK eq "pcie"} {
    exec mrd $_ADDR $_COUN  
  } else {
    mrd $_ADDR $_COUN
  }
}

proc dataWrite {} {
  global _ADDR
  global _DATA
  global _LINK

  if {$_LINK eq "pcie"} {
    exec mwr $_ADDR $_DATA  
  } else {
    mwr $_ADDR $_DATA
  }
}

