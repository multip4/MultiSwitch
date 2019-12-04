#run global simulation
make config_writes
cd $P4_PROJECT_DIR && make uninstall_sdnet && make install_sdnet
cd $NF_DESIGN_DIR/test/sim_switch_default && make
cd $SUME_FOLDER
./tools/scripts/nf_test.py sim --major switch --minor default
