#include <core.p4>
#include <v1model.p4>

const bit<16> TYPE_NSH = 0x894f;
const bit<16> TYPE_IPV4 = 0x800;
const bit<16> TYPE_ETHER = 0x6558;
const bit<16> TYPE_MYTUNNEL = 0x1212;

/*************************************************************************
*********************** H E A D E R S  ***********************************
*************************************************************************/

typedef bit<9>  egressSpec_t;
typedef bit<48> macAddr_t;
typedef bit<32> ip4Addr_t;
typedef bit<16> dstid_t;
typedef bit<24> spid_t;


header ethernet_t {
    macAddr_t dstAddr;
    macAddr_t srcAddr;
    bit<16>   etherType;
}

header myTunnel_t {
    bit<16> proto_id;
    bit<16> dst_id;
}

header nsh_t {
    bit<2>    ver;
    bit<1>    oam;
    bit<1>    context;
    bit<6>    len;
    bit<8>    MDtype;
    bit<16>   Nextpro;
    bit<24>   spid;
    bit<8>    sidx;
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
}

struct headers {
    ethernet_t   ethernet;
    myTunnel_t   myTunnel;
    nsh_t        nsh;
    ethernet_t   in_ethernet;
    ipv4_t       ipv4;
}

/*************************************************************************
*********************** P A R S E R  ***********************************
*************************************************************************/

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
            TYPE_MYTUNNEL: parse_myTunnel;
            TYPE_IPV4: parse_ipv4;
            default: accept;
        }
    }

    state parse_myTunnel {
        packet.extract(hdr.myTunnel);
        transition select(hdr.myTunnel.proto_id) {
            TYPE_NSH: parse_nsh;
            default: accept;
        }
    }

    state parse_nsh {
        packet.extract(hdr.nsh);
        transition select(hdr.nsh.Nextpro) {
            TYPE_ETHER: parse_inner_ether;
            default: accept;
        }
    }

    state parse_inner_ether {
        packet.extract(hdr.in_ethernet);
        transition select(hdr.in_ethernet.etherType) {
            TYPE_IPV4: parse_ipv4;
            default: accept;
        }
    }

    state parse_ipv4 {
        packet.extract(hdr.ipv4);
        transition accept;
    }

}

/*************************************************************************
************   C H E C K S U M    V E R I F I C A T I O N   *************
*************************************************************************/

control MyVerifyChecksum(inout headers hdr, inout metadata meta) {
    apply {  }
}


/*************************************************************************
**************  I N G R E S S   P R O C E S S I N G   *******************
*************************************************************************/

control MyIngress(inout headers hdr,
                  inout metadata meta,
                  inout standard_metadata_t standard_metadata) {
    action drop() {
        mark_to_drop();
    }


    action ipv4_forward(macAddr_t dstAddr, egressSpec_t port) {
        standard_metadata.egress_spec = port;
        hdr.ethernet.srcAddr = hdr.ethernet.dstAddr;
        hdr.ethernet.dstAddr = dstAddr;
        hdr.ipv4.ttl = hdr.ipv4.ttl - 1;
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

    action myTunnel_forward(macAddr_t dstAddr, dstid_t dstid, egressSpec_t port) {
        standard_metadata.egress_spec = port;
        hdr.myTunnel.dst_id = dstid;
        hdr.ethernet.srcAddr = hdr.ethernet.dstAddr;
        hdr.ethernet.dstAddr = dstAddr;
        hdr.in_ethernet = hdr.ethernet;
        hdr.ethernet.etherType = TYPE_MYTUNNEL; //0x1212;
        hdr.in_ethernet.etherType = TYPE_IPV4; //0x800;
    }

    table myTunnel_exact {
        key = {
            hdr.myTunnel.dst_id: exact;
            standard_metadata.ingress_port: exact;
        }
        actions = {
            myTunnel_forward;
            drop;
        }
        size = 1024;
        default_action = drop();
    }

    action addhdr(dstid_t dstid, spid_t spid) {
        hdr.myTunnel.setValid();
        hdr.nsh.setValid();
        hdr.in_ethernet.setValid();
        hdr.myTunnel.proto_id = TYPE_NSH; //0x894f;
        hdr.myTunnel.dst_id = dstid;
        hdr.nsh.Nextpro = TYPE_ETHER; //0x6558;
        hdr.nsh.spid = spid;
        hdr.nsh.sidx = 255;
        hdr.in_ethernet = hdr.ethernet;
        hdr.ethernet.etherType = TYPE_MYTUNNEL; //0x1212;
        hdr.in_ethernet.etherType = TYPE_IPV4; //0x800;
    }

    table add_hdr {
        key = {
            hdr.ipv4.srcAddr: lpm;
        }
        actions = {
            addhdr;
            NoAction;
        }
        default_action = NoAction();
    }

    action do_acl() {
        mark_to_drop();
    }

    action do_sub() {
        hdr.nsh.sidx = hdr.nsh.sidx - 1;
    }

    table nsh_count {
        key = {
            hdr.ipv4.srcAddr: lpm;
            hdr.nsh.spid: exact;
            hdr.nsh.sidx: exact;
        }
        actions = {
            do_acl;
            do_sub;
        }
        size = 1024;
        default_action = do_sub();
    }

    apply {
        if (hdr.ipv4.isValid() && !hdr.nsh.isValid()) {
            ipv4_lpm.apply();
            add_hdr.apply();
        }

        if (hdr.nsh.isValid()) {
            myTunnel_exact.apply();
            nsh_count.apply();
        }

    }
}

/*************************************************************************
****************  E G R E S S   P R O C E S S I N G   *******************
*************************************************************************/

control MyEgress(inout headers hdr,
                 inout metadata meta,
                 inout standard_metadata_t standard_metadata) {

    action do_decap() {
        hdr.nsh.setInvalid();
        hdr.in_ethernet.setInvalid();
        hdr.myTunnel.setInvalid();
    }

    table do_decap_t {
        key = {
            hdr.myTunnel.dst_id: exact;
        }

        actions = {
            do_decap;
            NoAction;
        }
        size = 1024;
        default_action = NoAction();
    }

    apply {
            do_decap_t.apply();
    }
}

/*************************************************************************
*************   C H E C K S U M    C O M P U T A T I O N   **************
*************************************************************************/

control MyComputeChecksum(inout headers  hdr, inout metadata meta) {
     apply {
    }
}

/*************************************************************************
***********************  D E P A R S E R  *******************************
*************************************************************************/

control MyDeparser(packet_out packet, in headers hdr) {
    apply {
        packet.emit(hdr.ethernet);
        packet.emit(hdr.myTunnel);
        packet.emit(hdr.nsh);
        packet.emit(hdr.in_ethernet);
        packet.emit(hdr.ipv4);
    }
}

/*************************************************************************
***********************  S W I T C H  *******************************
*************************************************************************/

V1Switch(
MyParser(),
MyVerifyChecksum(),
MyIngress(),
MyEgress(),
MyComputeChecksum(),
MyDeparser()
) main;
