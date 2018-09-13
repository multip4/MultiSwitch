#! /bin/bash

./env_reset.sh

# add port 1
sudo ovs-vsctl add-br br-test1
sudo ifconfig br-test1 up
# add port 2
sudo ovs-vsctl add-br br-test2
sudo ifconfig br-test2 up

#sudo $BMV2_HOME/simple_switch --no-p4 --log-console
