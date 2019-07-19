#!/usr/bin/env python
import sys
import struct
import os

from scapy.all import sniff, sendp, hexdump, get_if_list, get_if_hwaddr, bind_layers
from scapy.all import Packet, IPOption
from scapy.all import ShortField, IntField, LongField, BitField, FieldListField, FieldLenField
from scapy.all import IP, TCP, UDP, Raw, Ether, Padding
from scapy.layers.inet import _IPOption_HDR

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


bind_layers(Padding, desc_hdr)

def get_if():
    ifs=get_if_list()
    iface=None
    for i in get_if_list():
        if "p4p2" in i:
            iface=i
            break;
    if not iface:
        print "Cannot find p4p2 interface"
        exit(1)
    return iface

def handle_pkt(pkt):
    padding = pkt['Padding']
    dh = desc_hdr(vdp_id=padding.load[3])
    if padding.load[3] == '\x01':
        arp_h = arp(opcode=padding.load[11])
        dh = dh / arp_h
    #padding.show()
    if dh.vdp_id == '\x01':
        print('desc_hdr.vdp_id == 1')
        print('-- arp packet in --\n')
    if dh.vdp_id == '\x02':
        print('desc_hdr.vdp_id == 2')
        print('-- l2_switch packet in --\n')
    if dh.vdp_id == '\x03':
        print('desc_hdr.vdp_id == 3')
        print('-- firewall packet in --\n')
    if dh.vdp_id == '\x04':
        print('desc_hdr.vdp_id == 4')
        print('-- nat packet in --\n')

def main():
    ifaces = filter(lambda i: 'p4p2' in i, os.listdir('/sys/class/net/'))
    iface = ifaces[0]
    print "sniffing on %s" % iface
    sys.stdout.flush()
    sniff(iface = 'p4p2',
        prn = lambda x: handle_pkt(x))

if __name__ == '__main__':
    main()