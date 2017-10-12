import sys
import argparse
import sys
import socket
import random
import struct
from scapy.all import *
// Dot11 packet header gen
packet = Dot11()/ LLC()/ SNAP() / IP(dst= "10.0.2.10") / UDP() / "hi"

// Ether packet header gen
packet2 = Ether()/IP(dst="10.0.2.10") /UDP()/"hi"
hexdump (packet)
packet.show2()
sendp(packet,count=1, inter=1, iface="veth0") 

