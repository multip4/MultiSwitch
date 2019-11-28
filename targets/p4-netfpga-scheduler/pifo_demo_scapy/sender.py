from scapy.all import *

MAC_DST1="01:11:11:11:11:01"
MAC_DST2="01:22:22:22:22:01"
MAC_DST3="01:33:33:33:33:01"

MAC_SRC1="01:01:01:01:01:01"
MAC_SRC2="02:02:02:02:02:02"

pkt = Ether(src=MAC_SRC1,dst=MAC_DST1)/IP()/TCP()/"hello"

sendp(pkt, iface="nf1", count=1)
