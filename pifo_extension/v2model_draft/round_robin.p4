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

register<bit<32>>(10) regist; // {0}- global round, {1-9} local round

/* Scheduling Metadata Defined in V2Model.p4 
*
* struct scheduling_metadata_t {
*     bit<32> rank;
*     bit<48> departure_time;
* 
*     bit<32> flow_id;
*     bit<32> weight;
*     bit<32> sending_rate;
* }
*
*/ 


struct metadata {
    bit<32> flow_rank;
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
        scheduling_metadata.flow_id = flow_id;
    }

    action round_robin(){

        /* step1. read global & local round */

        regist.read( scheduling_metadata.rank , 0); // global
        regist.read(meta.flow_rank,  
            scheduling_metadata.flow_id);  // local


        /* step2. compare global & local round, 
         *        set rank value             */

        scheduling_metadata.rank = scheduling_metadata.rank + 1;
        if(scheduling_metadata.rank <= meta.flow_rank)
            scheduling_metadata.rank = meta.flow_rank + 1;

        /*  step3. update local round    */

        regist.write(scheduling_metadata.flow_id, 
            scheduling_metadata.rank);
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


// TODO: Control Boleck for Scheduling.

control V2Scheduling (  inout headers hdr,
                        inout metadata meta,
                        inout standard_metadata_t standard_metadata
                        inout scheduling_metadata_t scheduling_metadata){
    apply{

    }

}




control MyEgress(inout headers hdr,
                 inout metadata meta,
                 inout standard_metadata_t standard_metadata) {

    /* *********************************** 
    *  step4. update local round
    ************************************ */

    action update_global_round(){
        regist.write(0, hdr.meta_header.rank);
    }

    apply { 
        update_global_round();
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