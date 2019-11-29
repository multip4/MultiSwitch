from scapy.all import *

MAC_DST1="01:11:11:11:11:01"
MAC_DST2="01:22:22:22:22:01"
MAC_DST3="01:33:33:33:33:01"

MAC_SRC1="01:01:01:01:01:01"
MAC_SRC2="02:02:02:02:02:02"

def pad_pkt(pkt, size, padstr):
    if len(pkt) >= size:
        return pkt
    else:
        return pkt / (padstr*(size - len(pkt)))

def test_calc_packet_l2(SMAC, DMAC, port_name,length, pad_str='\x00'):
    global pktCnt
    pktCnt += 1
    pkt = Ether(dst=DMAC, src=SMAC)/IP()
    pkt = pad_pkt(pkt, length,pad_str)
    return pkt

pkt = test_calc_packet_l2("01:11:11:11:11:01", "01:11:11:11:11:01",'nf0',64, pad_str='\x01')
sendp(pkt, iface="nf0", count=1)
