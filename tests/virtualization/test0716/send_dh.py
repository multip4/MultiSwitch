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
    """ARP Header"""
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
    sel = int(sys.argv[1])
    iface = "p4p1"
    global pkt1, pkt2, pkt3_1, pkt3_2, pkt4
#packet selection {1,2,3,4}
#    if sel==1: 
#        print = 'arp test'
 #       pkt1 = Ether(src=get_if_hwaddr(iface), dst='00:00:00:00:00:01') / desc_hdr(vdp_id=1) / arp(opcode=1)
  #  elif sel==2:
#        print = 'l2switch test'
   #     pkt1 = Ether(src=get_if_hwaddr(iface), dst='00:00:00:00:00:02') / desc_hdr(vdp_id=2)
    #elif sel==3:
#        print = 'FW test'
     #   pkt1 = Ether(src=get_if_hwaddr(iface), dst='00:00:00:00:00:01') / desc_hdr(vdp_id=3) / IP(dst='0.0.0.2') / TCP()
    #elif sel==4:
#        print = 'NAT test'
     #   pkt1 = Ether(src=get_if_hwaddr(iface), dst='00:00:00:00:00:01') / desc_hdr(vdp_id=4) / IP(version=4)    
#    pkt1 = Ether(src=get_if_hwaddr(iface)) / desc_hdr(vdp_id=3) / IP() / TCP()
    pkt1 = Ether(src=get_if_hwaddr(iface), dst='00:00:00:00:00:01') / desc_hdr(vdp_id=1) / arp(opcode=1)
    pkt2 = Ether(src=get_if_hwaddr(iface), dst='00:00:00:00:00:02') / desc_hdr(vdp_id=2)
    pkt3_1 = Ether(src=get_if_hwaddr(iface), dst='00:00:00:00:00:01') / desc_hdr(vdp_id=3) / IP(dst='0.0.0.1') / TCP()
    pkt3_2 = Ether(src=get_if_hwaddr(iface), dst='00:00:00:00:00:01') / desc_hdr(vdp_id=3) / IP(dst='0.0.0.2') / TCP()


#    out_ether = Ether(src=get_if_hwaddr(iface), dst='00:00:00:00:00:01', type=0x894f)
#    in_ether =  Ether(src=get_if_hwaddr(iface), dst='00:00:00:00:00:01', type=0x800)
#    pkt1 = desc_hdr(vdp_id=10) / in_ether / IP(src=addr,dst=addr1) / "hi"
    if sel==1:
        pkt1.show()
        hexdump(pkt1)
        sendp(pkt1, iface=iface, verbose=False)
        print "sending arp packet"
        print "==========================="
    elif sel==2:
        pkt2.show()
        hexdump(pkt2)
        sendp(pkt2, iface=iface, verbose=False)
        print "sending l2 switching packet"
        print "==========================="
    elif sel==31:
        pkt3_1.show()
        hexdump(pkt3_1)
        sendp(pkt3_1, iface=iface, verbose=False)
        print "sending FW dropping packet"
        print "==========================="
    elif sel==32:
        pkt3_2.show()
        hexdump(pkt3_2)
        sendp(pkt3_2, iface=iface, verbose=False)
        print "sending FW passing packet"
        print "==========================="        
    elif sel==4:
        pkt4 = Ether(src=get_if_hwaddr(iface), dst='00:00:00:00:00:01') / desc_hdr(vdp_id=4) / IP(version=4)    
        sendp(pkt4, iface=iface, verbose=False)
        print "sending NAT packet"

    elif sel==5:
        #send 5 packets 
        #pkt1.show()
        #hexdump(pkt1)
        sendp(pkt1, iface=iface, verbose=False)
        print "sending arp packet"
        print "==========================="
        #pkt2.show()
        #hexdump(pkt2)
        sendp(pkt2, iface=iface, verbose=False)
        print "sending l2 switching packet"
        print "==========================="
        #pkt3_1.show()
        #hexdump(pkt3_1)
        sendp(pkt3_1, iface=iface, verbose=False)
        print "sending FW dropping packet"
        print "==========================="
        #pkt3_2.show()
        #hexdump(pkt3_2)
        sendp(pkt3_2, iface=iface, verbose=False)
        print "sending FW passing packet"
        print "==========================="        
        pkt4 = Ether(src=get_if_hwaddr(iface), dst='00:00:00:00:00:01') / desc_hdr(vdp_id=4) / IP(version=4)    
        sendp(pkt4, iface=iface, verbose=False)
        print "sending NAT packet"
        print "===========================" 
    #print "sending on interface %s (Bmv2 port 0) to dmac=00:00:00:00:00:01" %(iface)


if __name__ == '__main__':
    main()
