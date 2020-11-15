all: build_src run_local run_global

all_nf_datapath: build_src run_local run_global_build
	
all_build: build_src run_local run_global_build build_netlist

all_gui: build_src run_local run_global_gui

build_netlist_from_step9: run_global_build build_netlist

build_src:
	../build_from_src.sh

run_local:
	../run_local.sh

run_global:
	../run_global.sh
	../run_report.sh

run_global_gui:
	../run_global_gui.sh
	../run_report.sh
run_global_build:
	../run_global_for_netlist.sh

build_netlist:
	../build_netlist.sh