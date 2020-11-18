#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2018.2 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Wed Nov 18 14:08:08 KST 2020
# SW Build 2258646 on Thu Jun 14 20:02:38 MDT 2018
#
# Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep xelab -wto 2edafad895774dd09c2347e8850cd8a1 --incr --debug typical --relax --mt 8 -d "SIMULATION=1" -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -L xpm --snapshot top_sim_tb_behav xil_defaultlib.top_sim_tb xil_defaultlib.glbl -log elaborate.log
