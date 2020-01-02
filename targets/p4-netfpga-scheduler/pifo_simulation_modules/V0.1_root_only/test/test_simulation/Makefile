all: run_sim_enqueue_agent run_sim_bypass_checker 

run_sim_enqueue_agent:
	make -C ./test_enqueue_agent/
run_sim_bypass_checker:
	make -C ./test_bypass_checker/
# run_sim_address_manager:

clean:
	echo "clean simulation"
	make clean -C ./test_enqueue_agent/
	make clean -C ./test_bypass_checker/