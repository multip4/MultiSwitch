from scapy.all import *
from random import shuffle
p = Ether()/IP(dst="192.168.0.3")/TCP()

FLOW1_RATE = 0.2 # Percentage
FLOW2_RATE = 0.3
FLOW3_RATE = 0.4
FLOW4_RATE = 0.1
TOTAL_PACKET_COUNT = 50

packet_list = [] #a list for packet

# Generate Packets for flow 1

count = TOTAL_PACKET_COUNT * FLOW1_RATE
p = Ether()/IP(dst="192.168.0.2")/TCP()
for i in range(0,int(count)):
	packet_temp = p/("Hello FLOW1" + str(i))
	packet_list.append(packet_temp)

# Generate Packets for flow 2

count = TOTAL_PACKET_COUNT * FLOW2_RATE
p = Ether()/IP(dst="192.168.0.3")/TCP()
for i in range(0,int(count)):
	packet_temp = p/("Hello FLOW2" + str(i))
	packet_list.append(packet_temp)

# Generate Packets for flow 3

count = TOTAL_PACKET_COUNT * FLOW3_RATE
p = Ether()/IP(dst="192.168.0.4")/TCP()
for i in range(0,int(count)):
	packet_temp = p/("Hello FLOW3" + str(i))
	packet_list.append(packet_temp)

# Generate Packets for flow 4

count = TOTAL_PACKET_COUNT * FLOW4_RATE
p = Ether()/IP(dst="192.168.0.5")/TCP()
for i in range(0,int(count)):
	packet_temp = p/("Hello FLOW4" + str(i))
	packet_list.append(packet_temp)

shuffle(packet_list)

for packet in packet_list:
	sendp(packet, iface="meth1")


# p = Ether()/IP(dst="192.168.0.4")/TCP()/"haha"
# sendp(p, iface="meth1")
