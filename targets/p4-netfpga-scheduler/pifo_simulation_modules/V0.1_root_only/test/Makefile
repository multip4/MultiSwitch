all: install_stim_checker run_sim run_synth run_impl

install_stim_checker: uninstall_stim_checker
	make -C $(PROJECT_IP_PATH)/sim_stim_v1/
	make -C $(PROJECT_IP_PATH)/sim_checker_v1/

uninstall_stim_checker:
	make clean -C $(PROJECT_IP_PATH)/sim_stim_v1/
	make clean -C $(PROJECT_IP_PATH)/sim_checker_v1/

run_sim:
	make -C $(TEST_SIM_DIR)/test_simulation/

run_synth:
	echo "@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "run_synth not ready yet."
	echo "@@@@@@@@@@@@@@@@@@@@@@@@"
run_impl:
	echo "@@@@@@@@@@@@@@@@@@@@@@@@"
	echo "run_impl not ready yet."
	echo "@@@@@@@@@@@@@@@@@@@@@@@@"

clean: 
	make clean -C $(TEST_SIM_DIR)/test_simulation/