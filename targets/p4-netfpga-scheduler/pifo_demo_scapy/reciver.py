from scapy.all import *

sniff(iface="nf0", prn=lambda x:x.show())
