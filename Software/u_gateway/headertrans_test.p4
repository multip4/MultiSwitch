/* -*- P4_16 -*- */
#include <core.p4>
#include <v1model.p4>

const bit<16> TYPE_IPV4 = 0x800;

/*************************************************************************
*********************** H E A D E R S  ***********************************
*************************************************************************/

typedef bit<9>  egressSpec_t;
typedef bit<48> macAddr_t;
typedef bit<32> ip4Addr_t;
typedef bit<48> dot11Addr_t;
//typedef bit<1>  trans_t;

header ethernet_t {
    macAddr_t dstAddr;
    macAddr_t srcAddr;
    bit<16>   etherType;
}

header dot11_t { 
    bit<16>       frameControl;
    bit<16>       durationID;
    dot11Addr_t   addr1; //Mac field Address
    dot11Addr_t   addr2;  
    dot11Addr_t   addr3;           
    bit<16>       secCon;
//  bit<48>   addr4;
}

header llc_t {
    bit<8>    dsap;
    bit<8>    ssap;
    bit<8>    ctrl;
}

header snap_t {
    bit<24>   oui;
    bit<16>   type;
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
   bit<9> ingress_port;
   //trans_t do_trans;
}


struct headers {
    ethernet_t   ethernet;
    ipv4_t       ipv4;
    dot11_t      dot11;
    llc_t        llc;
    snap_t       snap;
}

/*************************************************************************
*********************** P A R S E R  ***********************************
*************************************************************************/

parser ParserImpl(packet_in packet,
                  out headers hdr,
                  inout metadata meta,
                  inout standard_metadata_t standard_metadata) {

    
    state start {
	meta.ingress_port = standard_metadata.ingress_port;
//	meta.do_trans = 1;
	transition select(meta.ingress_port<3){ 
		true: parse_dot11;
 		false: parse_ethernet;   
		             //port selection issues (systax need to be modified)  
        }
	
     
    }
    
    state parse_dot11 {
        packet.extract(hdr.dot11);
        transition parse_llc;
    }
    
    state parse_llc {
        packet.extract(hdr.llc);
        transition select(hdr.llc.dsap, hdr.llc.ssap){
		(0xAA, 0xAA): parse_snap;
		default: accept;
	}
    }

    state parse_snap{
        packet.extract(hdr.snap);
        transition select(hdr.snap.type) {
                TYPE_IPV4: parse_ipv4;
                default: accept;
        }  
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
	transition select(hdr.ipv4.fragOffset, hdr.ipv4.ihl, hdr.ipv4.protocol){
//		0x501: parse_icmp;
//		0x506: parse_tcp;
//		0x511: parse_udp;
		default: accept;
	}
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

    /* This action will drop packets */
    action drop() {
        mark_to_drop();
    }
    

    /* This action will translate 802.11 into ethernet */

    action dot_to_ether(macAddr_t dstAddr, egressSpec_t port){
	//frameCon 01 (From AP) --> addr1 = dst station, addr2 = src AP , addr3 = original station
	//frameCon 10 (To AP)   --> addr1 = dst AP,      addr2 = src sta, addr3 = final dst
    	//Valid Ether header 
	//Src.addr = addr2
	//dst.addr = addr3
	//Ether.type =  LLC/IPTYPE(0x0800?)
	//Invalid dot11 header
	
	// Test for update metadata / header type/value 
	hdr.ethernet.setValid();
	hdr.ethernet.dstAddr = dstAddr;
	hdr.ethernet.srcAddr = hdr.dot11.addr1;
	hdr.ethernet.etherType = hdr.snap.type; 
	standard_metadata.egress_spec = port;
	hdr.ipv4.ttl = hdr.ipv4.ttl -1; // if hdr.ipv4.ttl = 0 --> drop()
	hdr.dot11.setInvalid();
	hdr.llc.setInvalid();
	hdr.snap.setInvalid();
    }
     
    /* This action will translate ethernet into 802.11  */

    action ether_to_dot(macAddr_t dstAddr, egressSpec_t port){
	
	
   	hdr.dot11.setValid();
	hdr.llc.setValid();
	hdr.snap.setValid();

	// In the case of frameCOn 01 + ipv4 key matching --> addr1 = dst station, addr2 = src AP, addr3 = original station	
	// Addressing
	hdr.dot11.addr1 = dstAddr; 
	hdr.dot11.addr2 = hdr.ethernet.dstAddr;  
	hdr.snap.type   = hdr.ethernet.etherType;
	

	standard_metadata.egress_spec = port;
	hdr.ipv4.ttl = hdr.ipv4.ttl -1; // if hdr.ipv4.ttl = 0 --> drop()
	hdr.ethernet.setInvalid();
    }
/*
    action trans(){
	hdr.dot11.setInvalid();
	hdr.llc.setInvalid();	
	hdr.snap.setInvalid();
	hdr.ethernet.setValid();
	}
    
*/  
 	/* This action will translate Ether into 802.11 */	
    action etoe_ipv4_forward(macAddr_t dstAddr, egressSpec_t port) {
	// ethernet to ethernet 
	
	standard_metadata.egress_spec = port;
        hdr.ethernet.srcAddr = hdr.ethernet.dstAddr;
	hdr.ethernet.dstAddr = dstAddr;
	hdr.ipv4.ttl = hdr.ipv4.ttl -1;
	
    }
     action dtod_ipv4_forward(macAddr_t dstAddr, egressSpec_t port) {
	//  11 to 11
	standard_metadata.egress_spec = port;
	hdr.dot11.addr2 = hdr.dot11.addr1;
        hdr.dot11.addr1 = dstAddr;  // using temp value needed --> modify req
	
	hdr.ipv4.ttl = hdr.ipv4.ttl -1;
	
    }
  

/*    table trans_no {
	actions = {trans;}
	default_action = trans();
	}*/
    table ipv4_lpm {
        key = {
	    
	    hdr.ipv4.dstAddr: lpm;
        }
        actions = {
	    ether_to_dot;
	    dot_to_ether;
            dtod_ipv4_forward;						
            etoe_ipv4_forward;		
            NoAction;
	    drop;
	
        }
        size = 1024;
        default_action = NoAction();
    }
    
    apply {
	/* TODO: replace drop with logic to:
	* 1. Check if the ipv4 header is valid.
	* 2. apply the table ipv4_lpm.
	*/
	if (hdr.ipv4.isValid()){
//	trans_no.apply();
	ipv4_lpm.apply();
	}
    }
}

/*************************************************************************
****************  E G R E S S   P R O C E S S I N G   *******************
*************************************************************************/

control egress(inout headers hdr, inout metadata meta, inout standard_metadata_t standard_metadata) {
    apply {  }
}

/*************************************************************************
*************   C H E C K S U M    C O M P U T A T I O N   **************
*************************************************************************/

control computeChecksum(
    inout headers  hdr,
    inout metadata meta)
{
    Checksum16() ipv4_checksum;
    apply {
	if (hdr.ipv4.isValid()) {
	hdr.ipv4.hdrChecksum = ipv4_checksum.get(
	{

		hdr.ipv4.version,
		hdr.ipv4.ihl,
		hdr.ipv4.diffserv,
		hdr.ipv4.totalLen,
	        hdr.ipv4.identification,
	        hdr.ipv4.flags,
	        hdr.ipv4.fragOffset,
	        hdr.ipv4.ttl,
	        hdr.ipv4.protocol,
	        hdr.ipv4.srcAddr,
	        hdr.ipv4.dstAddr
        });  
     }
  }
}


/*************************************************************************
***********************  D E P A R S E R  *******************************
*************************************************************************/

control DeparserImpl(packet_out packet, in headers hdr) {
    apply {
	
	packet.emit(hdr.ethernet);
	packet.emit(hdr.dot11);
	packet.emit(hdr.llc);
	packet.emit(hdr.snap);
	packet.emit(hdr.ipv4);
	
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
