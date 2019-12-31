#Makefile for run test
PWD="/home/jkchoi/Documents/git/MultiSwitch/targets/p4-netfpga-scheduler/pifo_simulation_modules/V0.1_root_only/test/test_simulation/test_bucket/test_bypass_checker"
FILE_PATH_DATA_IN = "${PWD}/testdata/test01/data_in.txt"
FILE_PATH_DATA_EXP = "${PWD}/testdata/test01/data_exp.txt"
FILE_PATH_DATA_LOG = "${PWD}/testdata/test01/data_log.log"


all: clean project_batch
	@echo ""
	@echo "NetFPGA-SUME Referece Project HW Makefile"
	@echo ""
	@echo "make TARGETS"
	@echo "------------------------------------------------------"
	@echo "project:         Create hardware project"
	@echo "clean:           Remove specified project"
	@echo "distclean:       Remove all generated projects"

project_batch: clean
	echo "Create reference project under folder /project";\
	vivado -mode batch -source ./tcl/bypass_checker_sim.tcl -tclargs ${FILE_PATH_DATA_IN} ${FILE_PATH_DATA_EXP} ${FILE_PATH_DATA_LOG}  

project_gui: clean
	echo "Create reference project under folder /project";\
	vivado -mode gui -source ./tcl/bypass_checker_sim.tcl -tclargs ${FILE_PATH_DATA_IN} ${FILE_PATH_DATA_EXP} ${FILE_PATH_DATA_LOG}

clean:
	rm -rfv project;\
	rm -rfv vivado*;\
	rm -rfv .Xil;\
