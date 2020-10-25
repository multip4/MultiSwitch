#!/bin/bash

export PATH=${XILINX_VIVADO}/bin:${XILINX_VIVADO}/tps/lnx64/gcc-6.2.0/bin:${XILINX_VIVADO}/tps/lnx64/binutils-2.26/bin:$PATH 

set -euo pipefail
set -x
vcs -full64 -timescale=1ps/1ps -top SimpleSumeSwitch_tb -top glbl -lca Testbench/*.c *.o dpi.so -LDFLAGS -Wl,--no-as-needed,-rpath=${XILINX_VIVADO}/lib/lnx64.o/ -debug_access+r -PP -ivl32
 ./simv -l run.log  +dump_rtl_all +fsdb+all=on +fsdb+mda=on +fsdb+struct=on +fsdb+parameter=on +vcs+lic+wait 
