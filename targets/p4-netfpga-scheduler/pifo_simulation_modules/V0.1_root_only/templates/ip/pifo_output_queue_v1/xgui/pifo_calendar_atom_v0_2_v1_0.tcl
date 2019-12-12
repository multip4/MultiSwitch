# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "ELEMENT_RANK_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "ELEMENT_WIDTH" -parent ${Page_0}
  ipgui::add_param $IPINST -name "PIFO_INFO_VALID_POS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RANK_END_POS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "RANK_START_POS" -parent ${Page_0}


}

proc update_PARAM_VALUE.ELEMENT_RANK_WIDTH { PARAM_VALUE.ELEMENT_RANK_WIDTH } {
	# Procedure called to update ELEMENT_RANK_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ELEMENT_RANK_WIDTH { PARAM_VALUE.ELEMENT_RANK_WIDTH } {
	# Procedure called to validate ELEMENT_RANK_WIDTH
	return true
}

proc update_PARAM_VALUE.ELEMENT_WIDTH { PARAM_VALUE.ELEMENT_WIDTH } {
	# Procedure called to update ELEMENT_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.ELEMENT_WIDTH { PARAM_VALUE.ELEMENT_WIDTH } {
	# Procedure called to validate ELEMENT_WIDTH
	return true
}

proc update_PARAM_VALUE.PIFO_INFO_VALID_POS { PARAM_VALUE.PIFO_INFO_VALID_POS } {
	# Procedure called to update PIFO_INFO_VALID_POS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PIFO_INFO_VALID_POS { PARAM_VALUE.PIFO_INFO_VALID_POS } {
	# Procedure called to validate PIFO_INFO_VALID_POS
	return true
}

proc update_PARAM_VALUE.RANK_END_POS { PARAM_VALUE.RANK_END_POS } {
	# Procedure called to update RANK_END_POS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RANK_END_POS { PARAM_VALUE.RANK_END_POS } {
	# Procedure called to validate RANK_END_POS
	return true
}

proc update_PARAM_VALUE.RANK_START_POS { PARAM_VALUE.RANK_START_POS } {
	# Procedure called to update RANK_START_POS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.RANK_START_POS { PARAM_VALUE.RANK_START_POS } {
	# Procedure called to validate RANK_START_POS
	return true
}


proc update_MODELPARAM_VALUE.ELEMENT_WIDTH { MODELPARAM_VALUE.ELEMENT_WIDTH PARAM_VALUE.ELEMENT_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ELEMENT_WIDTH}] ${MODELPARAM_VALUE.ELEMENT_WIDTH}
}

proc update_MODELPARAM_VALUE.ELEMENT_RANK_WIDTH { MODELPARAM_VALUE.ELEMENT_RANK_WIDTH PARAM_VALUE.ELEMENT_RANK_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.ELEMENT_RANK_WIDTH}] ${MODELPARAM_VALUE.ELEMENT_RANK_WIDTH}
}

proc update_MODELPARAM_VALUE.RANK_START_POS { MODELPARAM_VALUE.RANK_START_POS PARAM_VALUE.RANK_START_POS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RANK_START_POS}] ${MODELPARAM_VALUE.RANK_START_POS}
}

proc update_MODELPARAM_VALUE.RANK_END_POS { MODELPARAM_VALUE.RANK_END_POS PARAM_VALUE.RANK_END_POS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.RANK_END_POS}] ${MODELPARAM_VALUE.RANK_END_POS}
}

proc update_MODELPARAM_VALUE.PIFO_INFO_VALID_POS { MODELPARAM_VALUE.PIFO_INFO_VALID_POS PARAM_VALUE.PIFO_INFO_VALID_POS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PIFO_INFO_VALID_POS}] ${MODELPARAM_VALUE.PIFO_INFO_VALID_POS}
}

