#!/usr/bin/env python
import sys
import struct

from scapy.all import sniff, sendp, hexdump, get_if_list, get_if_hwaddr
from scapy.all import Packet
from scapy.all import Ether, IP, UDP, Raw
from scapy.layers.inet import _IPOption_HDR
from scapy.all import hexdump, BitField, BitFieldLenField, ShortEnumField, X3BytesField, ByteField, XByteField
from scapy.all import bind_layers

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

#pkt1 = Ether() / desc_hdr()
bind_layers(Ether, desc_hdr)
def get_if():
    ifs=get_if_list()
    iface=None
    for i in get_if_list():
        if "p4p1" in i:
            iface=i
            break;
    if not iface:
        print "Cannot find eth0 interface"
        exit(1)
    return iface

def handle_pkt(pkt):
    print type(pkt)
    #print (hexdump(pkt))
    print "got a packet"
    pkt.show()
    hexdump(pkt)
    sys.stdout.flush()


def main():
    iface = 'p4p2'
    print "sniffing on %s" % iface
    sys.stdout.flush()
    sniff(iface = iface,
          prn = lambda x: handle_pkt(x))

if __name__ == '__main__':
    main()
