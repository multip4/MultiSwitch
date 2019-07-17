#ifndef _PARSER_
#define _PARSER_

#include "headers.p4"

//Static parser to demonstrate the functionality of desc.header in P4 hypervisor 

parser MyParser(packet_in packet,
                out headers hdr,
                inout metadata meta,
                inout standard_metadata_t standard_metadata) {

    state start {
        transition parse_112;
    }


    state parse_112 {
        packet.extract(hdr.hdr_112);

        transition parse_desc;
    }

    state parse_desc {
        packet.extract(hdr.desc_hdr);
        transition select(hdr.desc_hdr.vdp_id) {
            1:  parse_vPDP1; //Arp Proxy
            2:  parse_vPDP2; //L2switching
            3:  parse_vPDP3; //Firewall
            4:  parse_vPDP4; //NAT
            default:  accept;
        }
    }

    state parse_vPDP1 {
        packet.extract(hdr.hdr_224);
        transition accept;
    }

    state parse_vPDP2 {
        transition accept;
    }

    state parse_vPDP3 {
        packet.extract(hdr.hdr_160.next);
        transition parse_vPDP3_1;        
    }

    state parse_vPDP3_1 {
        packet.extract(hdr.hdr_160.next);
        transition accept;
    }

    state parse_vPDP4 {
        packet.extract(hdr.hdr_160.next);
        transition accept;
    }
}



#endif
