# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "BUFFER_OUTPUT_SYNC" -parent ${Page_0}
  ipgui::add_param $IPINST -name "BUFFER_WORD_DEPTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "CPU_EQ_AGENT_ADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_BASEADDR" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_M_AXIS_TUSER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_AXIS_TUSER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_AXI_ADDR_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "C_S_AXI_DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NUM_QUEUES" -parent ${Page_0}
  ipgui::add_param $IPINST -name "PIFO_CALENDAR_DEPTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "PIFO_INFO_LENGTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "PKT_BUFFER_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "QUEUE_DEPTH_BITS" -parent ${Page_0}


}

proc update_PARAM_VALUE.BUFFER_OUTPUT_SYNC { PARAM_VALUE.BUFFER_OUTPUT_SYNC } {
	# Procedure called to update BUFFER_OUTPUT_SYNC when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BUFFER_OUTPUT_SYNC { PARAM_VALUE.BUFFER_OUTPUT_SYNC } {
	# Procedure called to validate BUFFER_OUTPUT_SYNC
	return true
}

proc update_PARAM_VALUE.BUFFER_WORD_DEPTH { PARAM_VALUE.BUFFER_WORD_DEPTH } {
	# Procedure called to update BUFFER_WORD_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.BUFFER_WORD_DEPTH { PARAM_VALUE.BUFFER_WORD_DEPTH } {
	# Procedure called to validate BUFFER_WORD_DEPTH
	return true
}

proc update_PARAM_VALUE.CPU_EQ_AGENT_ADDR { PARAM_VALUE.CPU_EQ_AGENT_ADDR } {
	# Procedure called to update CPU_EQ_AGENT_ADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.CPU_EQ_AGENT_ADDR { PARAM_VALUE.CPU_EQ_AGENT_ADDR } {
	# Procedure called to validate CPU_EQ_AGENT_ADDR
	return true
}

proc update_PARAM_VALUE.C_BASEADDR { PARAM_VALUE.C_BASEADDR } {
	# Procedure called to update C_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_BASEADDR { PARAM_VALUE.C_BASEADDR } {
	# Procedure called to validate C_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_M_AXIS_TUSER_WIDTH { PARAM_VALUE.C_M_AXIS_TUSER_WIDTH } {
	# Procedure called to update C_M_AXIS_TUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_M_AXIS_TUSER_WIDTH { PARAM_VALUE.C_M_AXIS_TUSER_WIDTH } {
	# Procedure called to validate C_M_AXIS_TUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXIS_TUSER_WIDTH { PARAM_VALUE.C_S_AXIS_TUSER_WIDTH } {
	# Procedure called to update C_S_AXIS_TUSER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXIS_TUSER_WIDTH { PARAM_VALUE.C_S_AXIS_TUSER_WIDTH } {
	# Procedure called to validate C_S_AXIS_TUSER_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_ADDR_WIDTH { PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S_AXI_DATA_WIDTH { PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to update C_S_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S_AXI_DATA_WIDTH { PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to update DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to validate DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.NUM_QUEUES { PARAM_VALUE.NUM_QUEUES } {
	# Procedure called to update NUM_QUEUES when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NUM_QUEUES { PARAM_VALUE.NUM_QUEUES } {
	# Procedure called to validate NUM_QUEUES
	return true
}

proc update_PARAM_VALUE.PIFO_CALENDAR_DEPTH { PARAM_VALUE.PIFO_CALENDAR_DEPTH } {
	# Procedure called to update PIFO_CALENDAR_DEPTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PIFO_CALENDAR_DEPTH { PARAM_VALUE.PIFO_CALENDAR_DEPTH } {
	# Procedure called to validate PIFO_CALENDAR_DEPTH
	return true
}

proc update_PARAM_VALUE.PIFO_INFO_LENGTH { PARAM_VALUE.PIFO_INFO_LENGTH } {
	# Procedure called to update PIFO_INFO_LENGTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PIFO_INFO_LENGTH { PARAM_VALUE.PIFO_INFO_LENGTH } {
	# Procedure called to validate PIFO_INFO_LENGTH
	return true
}

proc update_PARAM_VALUE.PKT_BUFFER_WIDTH { PARAM_VALUE.PKT_BUFFER_WIDTH } {
	# Procedure called to update PKT_BUFFER_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PKT_BUFFER_WIDTH { PARAM_VALUE.PKT_BUFFER_WIDTH } {
	# Procedure called to validate PKT_BUFFER_WIDTH
	return true
}

proc update_PARAM_VALUE.QUEUE_DEPTH_BITS { PARAM_VALUE.QUEUE_DEPTH_BITS } {
	# Procedure called to update QUEUE_DEPTH_BITS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.QUEUE_DEPTH_BITS { PARAM_VALUE.QUEUE_DEPTH_BITS } {
	# Procedure called to validate QUEUE_DEPTH_BITS
	return true
}


proc update_MODELPARAM_VALUE.DATA_WIDTH { MODELPARAM_VALUE.DATA_WIDTH PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_WIDTH}] ${MODELPARAM_VALUE.DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.PKT_BUFFER_WIDTH { MODELPARAM_VALUE.PKT_BUFFER_WIDTH PARAM_VALUE.PKT_BUFFER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PKT_BUFFER_WIDTH}] ${MODELPARAM_VALUE.PKT_BUFFER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXIS_TUSER_WIDTH { MODELPARAM_VALUE.C_S_AXIS_TUSER_WIDTH PARAM_VALUE.C_S_AXIS_TUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXIS_TUSER_WIDTH}] ${MODELPARAM_VALUE.C_S_AXIS_TUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.C_M_AXIS_TUSER_WIDTH { MODELPARAM_VALUE.C_M_AXIS_TUSER_WIDTH PARAM_VALUE.C_M_AXIS_TUSER_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_M_AXIS_TUSER_WIDTH}] ${MODELPARAM_VALUE.C_M_AXIS_TUSER_WIDTH}
}

proc update_MODELPARAM_VALUE.NUM_QUEUES { MODELPARAM_VALUE.NUM_QUEUES PARAM_VALUE.NUM_QUEUES } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NUM_QUEUES}] ${MODELPARAM_VALUE.NUM_QUEUES}
}

proc update_MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH PARAM_VALUE.C_S_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH PARAM_VALUE.C_S_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.C_BASEADDR { MODELPARAM_VALUE.C_BASEADDR PARAM_VALUE.C_BASEADDR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_BASEADDR}] ${MODELPARAM_VALUE.C_BASEADDR}
}

proc update_MODELPARAM_VALUE.QUEUE_DEPTH_BITS { MODELPARAM_VALUE.QUEUE_DEPTH_BITS PARAM_VALUE.QUEUE_DEPTH_BITS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.QUEUE_DEPTH_BITS}] ${MODELPARAM_VALUE.QUEUE_DEPTH_BITS}
}

proc update_MODELPARAM_VALUE.BUFFER_WORD_DEPTH { MODELPARAM_VALUE.BUFFER_WORD_DEPTH PARAM_VALUE.BUFFER_WORD_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BUFFER_WORD_DEPTH}] ${MODELPARAM_VALUE.BUFFER_WORD_DEPTH}
}

proc update_MODELPARAM_VALUE.PIFO_CALENDAR_DEPTH { MODELPARAM_VALUE.PIFO_CALENDAR_DEPTH PARAM_VALUE.PIFO_CALENDAR_DEPTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PIFO_CALENDAR_DEPTH}] ${MODELPARAM_VALUE.PIFO_CALENDAR_DEPTH}
}

proc update_MODELPARAM_VALUE.PIFO_INFO_LENGTH { MODELPARAM_VALUE.PIFO_INFO_LENGTH PARAM_VALUE.PIFO_INFO_LENGTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PIFO_INFO_LENGTH}] ${MODELPARAM_VALUE.PIFO_INFO_LENGTH}
}

proc update_MODELPARAM_VALUE.BUFFER_OUTPUT_SYNC { MODELPARAM_VALUE.BUFFER_OUTPUT_SYNC PARAM_VALUE.BUFFER_OUTPUT_SYNC } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.BUFFER_OUTPUT_SYNC}] ${MODELPARAM_VALUE.BUFFER_OUTPUT_SYNC}
}

proc update_MODELPARAM_VALUE.CPU_EQ_AGENT_ADDR { MODELPARAM_VALUE.CPU_EQ_AGENT_ADDR PARAM_VALUE.CPU_EQ_AGENT_ADDR } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.CPU_EQ_AGENT_ADDR}] ${MODELPARAM_VALUE.CPU_EQ_AGENT_ADDR}
}

