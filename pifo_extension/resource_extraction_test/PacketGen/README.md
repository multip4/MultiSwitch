#Packet Gen
This folder contains data models and packet generation functions.

## Data Model.

###1. Packet:
packet has following attributes
* key: indicates flow(ip,5-tuples for real-world scenario). in this simulator has value range(a,b,c,d).
* seq: sequence of packet. this is used to check the simulator dequeue packet in-order.
* length: length of packet. this is used to calculate dequeue processing time.
* payload: packet message.

###2. Flow:

a list of packets with stochastic arrival time.

* packet: Packet Model.
* arrival_time: the time when the switch received full packet.


## Packet Generation Function.



