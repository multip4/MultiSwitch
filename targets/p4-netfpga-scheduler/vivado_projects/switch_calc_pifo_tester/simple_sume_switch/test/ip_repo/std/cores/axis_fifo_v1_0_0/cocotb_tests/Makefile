
TOPLEVEL_LANG = verilog

#COMPILE_ARGS=-pfileline=1

# pkt_storage source files
VERILOG_SOURCES =  $(IP_FOLDER)/fallthrough_small_fifo_v1_0_0/hdl/small_fifo.v
VERILOG_SOURCES += $(IP_FOLDER)/fallthrough_small_fifo_v1_0_0/hdl/fallthrough_small_fifo.v

VERILOG_SOURCES += ../hdl/axis_fifo.v

TOPLEVEL = axis_fifo

MODULE=test_axis_fifo

include $(COCOTB)/makefiles/Makefile.inc
include $(COCOTB)/makefiles/Makefile.sim

