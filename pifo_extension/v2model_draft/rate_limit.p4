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


register<bit<48>>(10) regist_time;

header meta_header_t {
    bit<32> rank_delta;

    bit<48> ingress_timestamp;
    bit<48> expected_dequeue_timestamp;
    bit<32> dequeue_timestamp;
    bit<48> last_flow_deq_time;
}

struct metadata {
    bit<32> flow_id;
    bit<32>  flow_rate;
    bit<8> rank;
    bit<48> expected_dequeue_timestamp;

}

struct headers {
    ethernet_t   ethernet;
    ipv4_t       ipv4;
    tcp_t        tcp;
    meta_header_t       meta_header;

}



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

    action set_flow_info(bit<32> flow_id, bit<32> flow_rate){
        meta.flow_id = flow_id;
        meta.flow_rate = flow_rate;
        hdr.meta_header.setValid();
    }

    action rate_limit(){

        bit<48> flow_last_deq_time;
    
        regist_time.read(flow_last_deq_time, meta.flow_id);
        hdr.meta_header.last_flow_deq_time = flow_last_deq_time;

        bit<48> start_time = standard_metadata.ingress_global_timestamp;
        if (start_time < flow_last_deq_time) {
            start_time = flow_last_deq_time;
        }

        bit<32> time_delta = standard_metadata.packet_length * 1000000 / meta.flow_rate;
        hdr.meta_header.ingress_timestamp = start_time;
        hdr.meta_header.rank_delta = time_delta;

        hdr.meta_header.expected_dequeue_timestamp = hdr.meta_header.ingress_timestamp + (bit<48>)hdr.meta_header.rank_delta;


        regist_time.write(meta.flow_id, hdr.meta_header.expected_dequeue_timestamp);

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
            set_flow_info;
            NoAction;
        }
        default_action = NoAction;
    }


    apply {
        if (hdr.ipv4.isValid()) {
            ipv4_lpm.apply();
            flow_table.apply();
        }
        rate_limit();

    }
}




control MyEgress(inout headers hdr,
                 inout metadata meta,
                 inout standard_metadata_t standard_metadata) {

    apply { 

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