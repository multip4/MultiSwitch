
from scapy.all import Packet, BitField, Raw, bind_layers, LEShortField, LEIntField
# Supress SCAPY warning messages
import logging
logging.getLogger("scapy").setLevel(logging.ERROR)

class Metadata(Packet):
    name = "Metadata"
    fields_desc = [
        LEShortField("pkt_len", 0),
        BitField("src_port", 0, 8),
        BitField("dst_port", 0, 8),
        LEIntField("enq_data", 0),
        LEIntField("deq_data", 0),
        LEIntField("drop_data", 0)
    ]
    def mysummary(self):
        return self.sprintf("pkt_len=%pkt_len% src_port=%src_port% dst_port=%dst_port% enq_data=%enq_data% deq_data=%deq_data% drop_data=%drop_data%")

bind_layers(Metadata, Raw)

