all: build_src run_local run_global

all_build: build_src run_local run_global_build build_netlist

all_gui: build_src run_local run_global_gui

run_step9: build_files run_global


build_src:
	./build_from_src.sh

build_files:
	./build_from_copy.sh

run_local:
	./run_local.sh

run_global:
	./run_global.sh
	./run_report.sh

run_global_gui:
	./run_global_gui.sh

run_global_build:
	./run_global_for_netlist.sh

build_netlist:
	./build_netlist.sh