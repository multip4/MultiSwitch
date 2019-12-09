from scapy.all import *
from switch_calc_headers import *

MAC_DST1="01:11:11:11:11:01"
MAC_DST2="01:22:22:22:22:01"
MAC_DST3="01:33:33:33:33:01"

MAC_SRC1="01:01:01:01:01:01"
MAC_SRC2="02:02:02:02:02:02"
pktCnt = 0

def pad_pkt(pkt, size, padstr):
    if len(pkt) >= size:
        return pkt
    else:
        return pkt / (padstr*(size - len(pkt)))

def test_calc_packet_l2(SMAC, DMAC,length, pad_str='\x00'):
    global pktCnt
    pktCnt += 1
    pkt = Ether(dst=DMAC, src=SMAC)/Calc(op1=10, opCode=ADD_OP, op2=20, result=0)/str(pktCnt)
    pkt = pad_pkt(pkt, length,pad_str)
    return pkt

MAC1="01:11:11:11:11:01"
MAC2="01:22:22:22:22:01"
MAC3="08:12:34:56:78:08"
MAC4="01:33:33:33:33:01"
MAC5="02:12:34:56:78:02"
pkt = test_calc_packet_l2(SMAC=MAC2, DMAC=MAC5,length=64, pad_str='\x01')


#pkt = Ether(dst=MAC5,src=MAC1)/Calc(op1=1, opCode=SET_REG_OP, op2=100, result=0)

#pkt = Ether(dst=MAC5, src=MAC2)/IP()/"hello"

pkt.show()
sendp(pkt, iface="nf1", count=1)
