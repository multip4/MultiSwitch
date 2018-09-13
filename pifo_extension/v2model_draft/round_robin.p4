#include <core.p4>
#include <v1model.p4>

const bit<16> TYPE_IPV4 = 0x800;



typedef bit<9>  egressSpec_t;
typedef bit<48> macAddr_t;
typedef bit<32> ip4Addr_t;
typedef bit<8> metaField_t;
typedef bit<8> register_t;


header ethernet_t {
    macAddr_t dstAddr;
    macAddr_t srcAddr;
    bit<16>   etherType;
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

header tcp_t {
    bit<16> srcPort;
    bit<16> dstPort;
    bit<32> seqNum;
    bit<32> ackNum;
    bit<4> offset;
    bit<3> resv;
    bit<9> flags;
    bit<16> window;
    bit<16> checksum;
    bit<16> pointer;
}

register<bit<8>>(10) regist;

header meta_header_t {
    bit<8> rank;
    bit<8> original_flow_rank;
    bit<8> global_rank;
    bit<8> egress_global_rank;
    bit<48> ingress_timestamp;
    bit<48> expected_dequeue_timestamp;
    bit<32> dequeue_timestamp;
    bit<48> egress_time;
}

struct metadata {
    bit<32> flow_id;
    bit<8> rank;
    bit<48> expected_dequeue_timestamp;

}

struct headers {
    ethernet_t   ethernet;
    ipv4_t       ipv4;
    tcp_t        tcp;
    meta_header_t       meta_header;

}

/* ************************************************************************
*********************** P A R S E R  ***********************************
************************************************************************ */

parser MyParser(packet_in packet,
                out headers hdr,
                inout metadata meta,
                inout standard_metadata_t standard_metadata) {

    state start {
        transition parse_ethernet;
    }

    state parse_ethernet {
        packet.extract(hdr.ethernet);
        transition select(hdr.ethernet.etherType) {
            TYPE_IPV4: parse_ipv4;
            default: accept;
        }
    }

    state parse_ipv4 {
        packet.extract(hdr.ipv4);
        transition select(hdr.ipv4.protocol) {
            0x06: parse_tcp;
            default: accept;
        }
    }

    state parse_tcp {
        packet.extract(hdr.tcp);
        transition accept;
    }

}


control MyVerifyChecksum(inout headers hdr, inout metadata meta) {   
    apply {  }
}


control MyIngress(inout headers hdr,
                  inout metadata meta,
                  inout standard_metadata_t standard_metadata) {


    
    action drop() {
        mark_to_drop();
    }
    
    action ipv4_forward(egressSpec_t port) {
        standard_metadata.egress_spec = port;
    }

    action set_flowid(bit<32> flow_id){
        meta.flow_id = flow_id;
        hdr.meta_header.setValid();
    }

    action round_robin(){
        // test

        /* test2 */

        /* aaaaaaaaaaaaa
        */

        regist.read( hdr.meta_header.global_rank , 0);
        hdr.meta_header.rank = hdr.meta_header.global_rank + 1;

        regist.read(hdr.meta_header.original_flow_rank, meta.flow_id);

        if(hdr.meta_header.rank <= hdr.meta_header.original_flow_rank)
            hdr.meta_header.rank = hdr.meta_header.original_flow_rank + 1;

        hdr.meta_header.rank = (hdr.meta_header.rank + hdr.meta_header.rank) * hdr.meta_header.rank;

        regist.write(meta.flow_id, hdr.meta_header.rank);

    }

    table ipv4_lpm {
        key = {
            hdr.ipv4.dstAddr: lpm;
        }
        actions = {
            ipv4_forward;
            drop;
            NoAction;
        }
        size = 1024;
        default_action = drop();
    }
    
    table flow_table {
        key = {
            hdr.ipv4.dstAddr: lpm;
        }
        actions = {
            set_flowid;
            NoAction;
        }
        default_action = NoAction;
    }


    apply {
        if (hdr.ipv4.isValid()) {
            ipv4_lpm.apply();
            flow_table.apply();
        }
        round_robin();

    }
}



control MyEgress(inout headers hdr,
                 inout metadata meta,
                 inout standard_metadata_t standard_metadata) {
    action update_global_round(){
        regist.write(1, hdr.meta_header.rank);
        regist.read( hdr.meta_header.egress_global_rank , 0);
    }

    action update_meta_header(){
        hdr.meta_header.ingress_timestamp = standard_metadata.ingress_global_timestamp;
        hdr.meta_header.expected_dequeue_timestamp = meta.expected_dequeue_timestamp;
        hdr.meta_header.dequeue_timestamp = standard_metadata.enq_timestamp + standard_metadata.deq_timedelta;
        hdr.meta_header.egress_time = standard_metadata.egress_global_timestamp;
    }



    apply { 
        update_global_round();
        update_meta_header();
    }
}



control MyComputeChecksum(inout headers  hdr, inout metadata meta) {
     apply {
	update_checksum(
	    hdr.ipv4.isValid(),
            { hdr.ipv4.version,
	      hdr.ipv4.ihl,
              hdr.ipv4.diffserv,
              hdr.ipv4.totalLen,
              hdr.ipv4.identification,
              hdr.ipv4.flags,
              hdr.ipv4.fragOffset,
              hdr.ipv4.ttl,
              hdr.ipv4.protocol,
              hdr.ipv4.srcAddr,
              hdr.ipv4.dstAddr },
            hdr.ipv4.hdrChecksum,
            HashAlgorithm.csum16);
    }
}


control MyDeparser(packet_out packet, in headers hdr) {
    apply {
        packet.emit(hdr.ethernet);
        packet.emit(hdr.ipv4);
        packet.emit(hdr.tcp);
        packet.emit(hdr.meta_header);
    }
}



V1Switch(
MyParser(),
MyVerifyChecksum(),
MyIngress(),
MyEgress(),
MyComputeChecksum(),
MyDeparser()
) main;