#!/bin/bash

export PATH=${XILINX_VIVADO}/bin:${XILINX_VIVADO}/tps/lnx64/gcc-6.2.0/bin:${XILINX_VIVADO}/tps/lnx64/binutils-2.26/bin:$PATH 

# Clean up any old files 
rm -rf xsim.dir

set -euo pipefail
set -x
find -name "*.v" -o -name "*.vp" -o -name "*.sv" | { xargs -I % ${XILINX_VIVADO}/bin/xvlog -sv % || true; } 
mkdir -p xsim.dir/xsc
find -name "*.c" | xargs ${XILINX_VIVADO}/bin/xsc -mt off -v 1
${XILINX_VIVADO}/bin/xelab -L work --debug all -sv_lib dpi.so SimpleSumeSwitch_tb -s SimpleSumeSwitch_tb glbl 
${XILINX_VIVADO}/bin/xsim SimpleSumeSwitch_tb -gui -wdb work.SimpleSumeSwitch_tb_tb#work.glbl.wdb  
