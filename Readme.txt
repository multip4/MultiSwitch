#Author: 1000 lim. (qianlin@korea.ac.kr)

1. Please Set NetFPGA Basic simulator based environment before use.
2. extern/extern_data should be replaced to use pifo_rank extern module(wrr).
3. sume_meta.p4 sholuld be replaced in the netfpga for using pifo switches.

How To Run
===================================================================
1)full_run.sh.
Build pifo netfpga project and run. 

2)run build environment only 
$ cd $SUME_FOLDER
$./tools/scripts/nf_test.py sim --major switch --minor default --gui

#Todo List. 
Adding Demo Simulator scripts.
Adding Debug Scripts.

 
