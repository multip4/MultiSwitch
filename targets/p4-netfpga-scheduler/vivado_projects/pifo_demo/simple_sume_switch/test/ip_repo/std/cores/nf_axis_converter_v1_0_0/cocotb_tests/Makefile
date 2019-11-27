
TOPLEVEL_LANG = verilog

#COMPILE_ARGS=-pfileline=1

# pkt_storage source files
VERILOG_SOURCES =  $(IP_FOLDER)/fallthrough_small_fifo_v1_0_0/hdl/small_fifo.v
VERILOG_SOURCES += $(IP_FOLDER)/fallthrough_small_fifo_v1_0_0/hdl/fallthrough_small_fifo.v
VERILOG_SOURCES += $(IP_FOLDER)/axis_fifo_v1_0_0/hdl/axis_fifo.v

VERILOG_SOURCES += ../hdl/nf_axis_converter_main.v
VERILOG_SOURCES += ../hdl/nf_axis_converter.v

TOPLEVEL = nf_axis_converter

MODULE=test_nf_axis_converter

include $(COCOTB)/makefiles/Makefile.inc
include $(COCOTB)/makefiles/Makefile.sim

