# Simple Switch for Cloning.

In this folder, the simple_switch.cpp
has a little batched for clonning.

In this version, all cloned packet will
send to cpu(which is controller)

In previous version, the clone feature is
unabled in gRPC version because lack of 
switch configuration.

To use the switch.
1. copy the simple_switch.cpp to bmv2 simple_switch folder.
2. go to bmv2 root folder
3. make
4. go to target/simple_switch_gRPC folder
5. make install

now you can use clone enabled simple_switch_gRPC

Please email me if have any question
