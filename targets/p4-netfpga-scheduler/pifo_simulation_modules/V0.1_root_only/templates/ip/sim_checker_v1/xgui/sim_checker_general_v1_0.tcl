# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "DATA_0_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_1_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_2_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_3_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_4_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_5_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_6_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_7_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_8_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_9_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "DATA_COUNT" -parent ${Page_0}
  ipgui::add_param $IPINST -name "FILE_PATH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "LOG_FILE_PATH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MAX_DATA_DEPTH_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "MAX_DATA_WIDTH" -parent ${Page_0}


}

proc update_PARAM_VALUE.DATA_0_WIDTH { PARAM_VALUE.DATA_0_WIDTH } {
	# Procedure called to update DATA_0_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_0_WIDTH { PARAM_VALUE.DATA_0_WIDTH } {
	# Procedure called to validate DATA_0_WIDTH
	return true
}

proc update_PARAM_VALUE.DATA_1_WIDTH { PARAM_VALUE.DATA_1_WIDTH } {
	# Procedure called to update DATA_1_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_1_WIDTH { PARAM_VALUE.DATA_1_WIDTH } {
	# Procedure called to validate DATA_1_WIDTH
	return true
}

proc update_PARAM_VALUE.DATA_2_WIDTH { PARAM_VALUE.DATA_2_WIDTH } {
	# Procedure called to update DATA_2_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_2_WIDTH { PARAM_VALUE.DATA_2_WIDTH } {
	# Procedure called to validate DATA_2_WIDTH
	return true
}

proc update_PARAM_VALUE.DATA_3_WIDTH { PARAM_VALUE.DATA_3_WIDTH } {
	# Procedure called to update DATA_3_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_3_WIDTH { PARAM_VALUE.DATA_3_WIDTH } {
	# Procedure called to validate DATA_3_WIDTH
	return true
}

proc update_PARAM_VALUE.DATA_4_WIDTH { PARAM_VALUE.DATA_4_WIDTH } {
	# Procedure called to update DATA_4_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_4_WIDTH { PARAM_VALUE.DATA_4_WIDTH } {
	# Procedure called to validate DATA_4_WIDTH
	return true
}

proc update_PARAM_VALUE.DATA_5_WIDTH { PARAM_VALUE.DATA_5_WIDTH } {
	# Procedure called to update DATA_5_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_5_WIDTH { PARAM_VALUE.DATA_5_WIDTH } {
	# Procedure called to validate DATA_5_WIDTH
	return true
}

proc update_PARAM_VALUE.DATA_6_WIDTH { PARAM_VALUE.DATA_6_WIDTH } {
	# Procedure called to update DATA_6_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_6_WIDTH { PARAM_VALUE.DATA_6_WIDTH } {
	# Procedure called to validate DATA_6_WIDTH
	return true
}

proc update_PARAM_VALUE.DATA_7_WIDTH { PARAM_VALUE.DATA_7_WIDTH } {
	# Procedure called to update DATA_7_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_7_WIDTH { PARAM_VALUE.DATA_7_WIDTH } {
	# Procedure called to validate DATA_7_WIDTH
	return true
}

proc update_PARAM_VALUE.DATA_8_WIDTH { PARAM_VALUE.DATA_8_WIDTH } {
	# Procedure called to update DATA_8_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_8_WIDTH { PARAM_VALUE.DATA_8_WIDTH } {
	# Procedure called to validate DATA_8_WIDTH
	return true
}

proc update_PARAM_VALUE.DATA_9_WIDTH { PARAM_VALUE.DATA_9_WIDTH } {
	# Procedure called to update DATA_9_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_9_WIDTH { PARAM_VALUE.DATA_9_WIDTH } {
	# Procedure called to validate DATA_9_WIDTH
	return true
}

proc update_PARAM_VALUE.DATA_COUNT { PARAM_VALUE.DATA_COUNT } {
	# Procedure called to update DATA_COUNT when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_COUNT { PARAM_VALUE.DATA_COUNT } {
	# Procedure called to validate DATA_COUNT
	return true
}

proc update_PARAM_VALUE.FILE_PATH { PARAM_VALUE.FILE_PATH } {
	# Procedure called to update FILE_PATH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FILE_PATH { PARAM_VALUE.FILE_PATH } {
	# Procedure called to validate FILE_PATH
	return true
}

proc update_PARAM_VALUE.LOG_FILE_PATH { PARAM_VALUE.LOG_FILE_PATH } {
	# Procedure called to update LOG_FILE_PATH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.LOG_FILE_PATH { PARAM_VALUE.LOG_FILE_PATH } {
	# Procedure called to validate LOG_FILE_PATH
	return true
}

proc update_PARAM_VALUE.MAX_DATA_DEPTH_WIDTH { PARAM_VALUE.MAX_DATA_DEPTH_WIDTH } {
	# Procedure called to update MAX_DATA_DEPTH_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_DATA_DEPTH_WIDTH { PARAM_VALUE.MAX_DATA_DEPTH_WIDTH } {
	# Procedure called to validate MAX_DATA_DEPTH_WIDTH
	return true
}

proc update_PARAM_VALUE.MAX_DATA_WIDTH { PARAM_VALUE.MAX_DATA_WIDTH } {
	# Procedure called to update MAX_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.MAX_DATA_WIDTH { PARAM_VALUE.MAX_DATA_WIDTH } {
	# Procedure called to validate MAX_DATA_WIDTH
	return true
}


proc update_MODELPARAM_VALUE.DATA_COUNT { MODELPARAM_VALUE.DATA_COUNT PARAM_VALUE.DATA_COUNT } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_COUNT}] ${MODELPARAM_VALUE.DATA_COUNT}
}

proc update_MODELPARAM_VALUE.MAX_DATA_WIDTH { MODELPARAM_VALUE.MAX_DATA_WIDTH PARAM_VALUE.MAX_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_DATA_WIDTH}] ${MODELPARAM_VALUE.MAX_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.MAX_DATA_DEPTH_WIDTH { MODELPARAM_VALUE.MAX_DATA_DEPTH_WIDTH PARAM_VALUE.MAX_DATA_DEPTH_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.MAX_DATA_DEPTH_WIDTH}] ${MODELPARAM_VALUE.MAX_DATA_DEPTH_WIDTH}
}

proc update_MODELPARAM_VALUE.FILE_PATH { MODELPARAM_VALUE.FILE_PATH PARAM_VALUE.FILE_PATH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FILE_PATH}] ${MODELPARAM_VALUE.FILE_PATH}
}

proc update_MODELPARAM_VALUE.LOG_FILE_PATH { MODELPARAM_VALUE.LOG_FILE_PATH PARAM_VALUE.LOG_FILE_PATH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.LOG_FILE_PATH}] ${MODELPARAM_VALUE.LOG_FILE_PATH}
}

proc update_MODELPARAM_VALUE.DATA_0_WIDTH { MODELPARAM_VALUE.DATA_0_WIDTH PARAM_VALUE.DATA_0_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_0_WIDTH}] ${MODELPARAM_VALUE.DATA_0_WIDTH}
}

proc update_MODELPARAM_VALUE.DATA_1_WIDTH { MODELPARAM_VALUE.DATA_1_WIDTH PARAM_VALUE.DATA_1_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_1_WIDTH}] ${MODELPARAM_VALUE.DATA_1_WIDTH}
}

proc update_MODELPARAM_VALUE.DATA_2_WIDTH { MODELPARAM_VALUE.DATA_2_WIDTH PARAM_VALUE.DATA_2_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_2_WIDTH}] ${MODELPARAM_VALUE.DATA_2_WIDTH}
}

proc update_MODELPARAM_VALUE.DATA_3_WIDTH { MODELPARAM_VALUE.DATA_3_WIDTH PARAM_VALUE.DATA_3_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_3_WIDTH}] ${MODELPARAM_VALUE.DATA_3_WIDTH}
}

proc update_MODELPARAM_VALUE.DATA_4_WIDTH { MODELPARAM_VALUE.DATA_4_WIDTH PARAM_VALUE.DATA_4_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_4_WIDTH}] ${MODELPARAM_VALUE.DATA_4_WIDTH}
}

proc update_MODELPARAM_VALUE.DATA_5_WIDTH { MODELPARAM_VALUE.DATA_5_WIDTH PARAM_VALUE.DATA_5_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_5_WIDTH}] ${MODELPARAM_VALUE.DATA_5_WIDTH}
}

proc update_MODELPARAM_VALUE.DATA_6_WIDTH { MODELPARAM_VALUE.DATA_6_WIDTH PARAM_VALUE.DATA_6_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_6_WIDTH}] ${MODELPARAM_VALUE.DATA_6_WIDTH}
}

proc update_MODELPARAM_VALUE.DATA_7_WIDTH { MODELPARAM_VALUE.DATA_7_WIDTH PARAM_VALUE.DATA_7_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_7_WIDTH}] ${MODELPARAM_VALUE.DATA_7_WIDTH}
}

proc update_MODELPARAM_VALUE.DATA_8_WIDTH { MODELPARAM_VALUE.DATA_8_WIDTH PARAM_VALUE.DATA_8_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_8_WIDTH}] ${MODELPARAM_VALUE.DATA_8_WIDTH}
}

proc update_MODELPARAM_VALUE.DATA_9_WIDTH { MODELPARAM_VALUE.DATA_9_WIDTH PARAM_VALUE.DATA_9_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_9_WIDTH}] ${MODELPARAM_VALUE.DATA_9_WIDTH}
}

