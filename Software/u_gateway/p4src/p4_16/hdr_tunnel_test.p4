/* -*- P4_16 -*- */
#include <core.p4>
#include <v1model.p4>

const bit<16> TYPE_IPV6 = 0x86DD;
const bit<16> TYPE_IPV4 = 0x800;

/*************************************************************************
*********************** H E A D E R S  ***********************************
*************************************************************************/

typedef bit<9>  egressSpec_t;
typedef bit<48> macAddr_t;
typedef bit<128> ip6Addr_t;
typedef bit<32> ip4Addr_t;

header ethernet_t {
    macAddr_t dstAddr;
    macAddr_t srcAddr;
    bit<16>   etherType;
}

header ipv6_t {
    bit<4>    version;
    bit<8>    trafficclass;
    bit<20>   flowlabel;
    bit<16>   payloadLen;
    bit<8>    nexthdr;
    bit<8>    ttl;
    ip6Addr_t srcAddr;
    ip6Addr_t dstAddr;
}

header ipv4_t {
    bit<4>    version;
    bit<4>    ihl;
    bit<8>    diffserv;
    bit<16>   totalLen;
    bit<16>   identification;
    bit<3>    flags;
    bit<13>   fragOffset;
    bit<8>    ttl;
    bit<8>    protocol;
    bit<16>   hdrChecksum;
    ip4Addr_t srcAddr;
    ip4Addr_t dstAddr;
}

struct metadata {
    /* empty */
}

struct headers {
    ethernet_t   ethernet;
    ipv6_t       ipv6;
    ipv4_t       ipv4;
}

/*************************************************************************
*********************** P A R S E R  ***********************************
*************************************************************************/

parser ParserImpl(packet_in packet,
                  out headers hdr,
                  inout metadata meta,
                  inout standard_metadata_t standard_metadata) {

    state start {
        transition parse_ethernet;
    }

    state parse_ethernet {
        packet.extract(hdr.ethernet);
        transition select(hdr.ethernet.etherType) {
            TYPE_IPV6: parse_ipv6;
            default: accept;
        }
    }

    state parse_ipv6 {
        packet.extract(hdr.ipv6);
        transition accept;
    }
   
    state parse_ipv4 {
	packet.extract(hdr.ipv6);
	transition accept;
    }

}


/*************************************************************************
************   C H E C K S U M    V E R I F I C A T I O N   *************
*************************************************************************/

control verifyChecksum(in headers hdr, inout metadata meta) {   
    apply {  }
}


/*************************************************************************
**************  I N G R E S S   P R O C E S S I N G   *******************
*************************************************************************/

control ingress(inout headers hdr, inout metadata meta, inout standard_metadata_t standard_metadata) {
    action drop() {
        mark_to_drop();
    }
    
    action ipv6_forward() {
        standard_metadata.egress_spec = 0;
        hdr.ethernet.srcAddr = hdr.ethernet.dstAddr;
       // hdr.ethernet.dstAddr = dstAddr;
        hdr.ethernet.etherType = TYPE_IPV4;   //ether v6->v4
        hdr.ipv6.ttl = hdr.ipv6.ttl - 1;
    }
    
    action v4hdr() {
	hdr.ipv4.setValid();
    }

    table add_v4hdr {
        actions = {
            v4hdr;
        }
        default_action = v4hdr;
    }

    table ipv6_lpm {
        key = {
            hdr.ipv6.dstAddr: lpm;
        }
        actions = {
            ipv6_forward;
            drop;
            NoAction;
        }
        size = 1024;
        default_action = ipv6_forward();
    }
    
    apply {
        if (hdr.ipv6.isValid()) {
	    add_v4hdr.apply();	
            ipv6_lpm.apply();
        }
    }
}

/*************************************************************************
****************  E G R E S S   P R O C E S S I N G   *******************
*************************************************************************/

control egress(inout headers hdr, inout metadata meta, inout standard_metadata_t standard_metadata) {
    action do_ipv4_encap() {
        
        hdr.ethernet.etherType = TYPE_IPV4;
       /* hdr.ipv4.version = 4L;
        hdr.ipv4.ihl = 5L;
        hdr.ipv4.diffserv = 0x0;
        hdr.ipv4.totalLen = 20;
        hdr.ipv4.identification = 1;
        hdr.ipv4.flags = 0;
        hdr.ipv4.fragOffset = 0L;
        hdr.ipv4.ttl = hdr.ipv6.ttl; //bit casting   (bit<10>)
        hdr.ipv4.protocol = 0;
        hdr.ipv4.srcAddr = 7f000001;
        hdr.ipv4.dstAddr = 7f000001; */
    }
    table send_to_cpu {
        actions = {
            do_ipv4_encap;
        }
        size = 0;
    }
    apply {
        send_to_cpu.apply();     
    }
}

/*************************************************************************
*************   C H E C K S U M    C O M P U T A T I O N   **************
*************************************************************************/

control computeChecksum(
    inout headers  hdr,
    inout metadata meta)
{
    /*Checksum16() ipv6_checksum;*/
    
    apply {
        /*if (hdr.ipv6.isValid()) {
            hdr.ipv6.hdrChecksum = ipv6_checksum.get(
                {    
                    hdr.ipv6.version,
                    hdr.ipv6.trafficclass,
                    hdr.ipv6.flowlabel,
                    hdr.ipv6.payloadLen,
                    hdr.ipv6.nexthdr,
                    hdr.ipv6.ttl,
                    hdr.ipv6.srcAddr,
                    hdr.ipv6.dstAddr
                });
        }*/
    }
}


/*************************************************************************
***********************  D E P A R S E R  *******************************
*************************************************************************/

control DeparserImpl(packet_out packet, in headers hdr) {
    apply {
        packet.emit(hdr.ethernet);
        packet.emit(hdr.ipv4);
        packet.emit(hdr.ipv6);
    }
}

/*************************************************************************
***********************  S W I T C H  *******************************
*************************************************************************/

V1Switch(
ParserImpl(),
verifyChecksum(),
ingress(),
egress(),
computeChecksum(),
DeparserImpl()
) main;
