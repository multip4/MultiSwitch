from scapy.all import *
from random import shuffle
import time

for i in range(0,1):
	time.sleep(1)
	p = Ether()/IP(dst="192.168.0.3")/TCP()/"The Original Packet Length is same as 100 byte"
	sendp(p, iface="br-test1")
