#!/bin/bash
set -euo pipefail
set -x
vlib work
find -name "*.v" -o -name "*.vp" | xargs vlog -lint +acc 
find -name "*.sv" | xargs vlog 
find -name "*.c" | xargs vlog -ccflags -m64 
vsim -gui SimpleSumeSwitch_tb glbl -do 'add wave -r /*; run -all'

