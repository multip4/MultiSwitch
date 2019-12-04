#!/bin/bash
set -euo pipefail
set -x
vlib work
find -name "*.v" -o -name "*.vp" | xargs vlog -lint +acc 
find -name "*.sv" | xargs vlog 
find -name "*.c" | xargs vlog -ccflags -m64 
vsim -ldflags "-B/usr/lib/x86_64-linux-gnu" -c SimpleSumeSwitch_tb glbl -do 'add wave -r /*; run -all'

