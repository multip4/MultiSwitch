#!/usr/bin/env python
import argparse
import sys
import socket
import random
import struct

from scapy.all import sendp, send, get_if_list, get_if_hwaddr
from scapy.all import Packet
from scapy.all import Ether, IP, UDP, TCP
from scapy.all import hexdump, BitField, BitFieldLenField, ShortEnumField, X3BytesField, ByteField, XByteField

#def get_if():
#    ifs=get_if_list()
#    iface=None # "h1-eth0"
#    for i in get_if_list():
#        if "eth0" in i:
#            iface=i
#            break;
#    if not iface:
#        print "Cannot find eth0 interface"
#        exit(1)
#    return iface

#        BitField('TTL', 0, 6),
 #       BitField('Len', None, 6),
##       BitField('MDType', 1, 4),
  #      ByteField("NextProto", 0x65),
   #     ByteField("NextProto_2", 0x58),
    ##   ByteField('NSI', 255)

class desc_hdr(Packet):
    """Description Header"""
    name = "desc_hdr"
    fields_desc = [
        BitField('flag', 0, 8),
        BitField('len', 0, 8),
        BitField('vdp_id', 0, 16)
    ]
class arp(Packet):
    """Description Header"""
    name = "arp"
    fields_desc = [
        BitField('hw_type', 0, 16),
        BitField('prot_type', 0, 16),
        BitField('hw_size', 0, 8),
        BitField('prot_size', 0, 8),
        BitField('opcode', 0, 16),
        BitField('sender_MAC', 0, 48),
        BitField('sender_IP', 0, 32),
        BitField('target_MAC', 0, 48),
        BitField('target_IP', 0, 32)
    ]

def main():

#packet selection {1,2,3,4}
    if socket.gethostbyname(sys.argv[1])==1: 
#        print = 'arp test'
        pkt = Ether(src=get_if_hwaddr(iface)) / desc_hdr(vdp_id=1) / arp()
    elif socket.gethostbyname(sys.argv[1])==2:
#        print = 'l2switch test'
        pkt = Ether(src=get_if_hwaddr(iface)) / desc_hdr(vdp_id=2)
    elif socket.gethostbyname(sys.argv[1])==3:
#        print = 'FW test'
        pkt = Ether(src=get_if_hwaddr(iface)) / desc_hdr(vdp_id=3) / IP() / TCP()
    elif socket.gethostbyname(sys.argv[1])==4:
#        print = 'NAT test'
        pkt = Ether(src=get_if_hwaddr(iface)) / desc_hdr(vdp_id=4) / IP()    

    
#src addr
#    addr = socket.gethostbyname(sys.argv[1])

#dst addr
#    addr1 = socket.gethostbyname(sys.argv[2])

    iface = "p4p1"

#    out_ether = Ether(src=get_if_hwaddr(iface), dst='00:00:00:00:00:01', type=0x894f)
#    in_ether =  Ether(src=get_if_hwaddr(iface), dst='00:00:00:00:00:01', type=0x800)

#    pkt1 = desc_hdr(vdp_id=10) / in_ether / IP(src=addr,dst=addr1) / "hi"
    pkt.show()
    hexdump(pkt)
    sendp(pkt, iface=iface, verbose=False)
    print "sending on interface %s (Bmv2 port 0) to dmac=00:00:00:00:00:01" %(iface)


if __name__ == '__main__':
    main()
