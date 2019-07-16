#include <core.p4>
#include <v1model.p4>

/*************************************************************************
************   C H E C K S U M    V E R I F I C A T I O N   *************
*************************************************************************/

 /* Empty in this program*/ 

control MyVerifyChecksum(inout headers hdr, inout metadata meta) {   
    apply { }
}


control MyIngress(inout headers hdr,
                  inout metadata meta,
                  inout standard_metadata_t standard_metadata) {

    action drop() {
        mark_to_drop();
    }
    


    action set_egress_port(bit<9> port){

	standard_metadata.egress_spec = port;
    }
    
    table test_ternary_1 {
        key = {
	    hdr.des_hdr.vdp_id: exact;	
            meta.user_meta.hdr1: exact;
		
        }
        actions = {
	    set_egress_port;	
            drop;
            NoAction;

        }
        size = 1024;
        default_action = NoAction();
    }
    
    apply {
        if (hdr.protocol_hdr1.isValid()) {
	     test_ternary_1.apply();
        } else {
        }
    }
}



/*************************************************************************
****************  E G R E S S   P R O C E S S I N G   *******************
*************************************************************************/
 /* Empty in this program*/

control MyEgress(inout headers hdr,
                 inout metadata meta,
                 inout standard_metadata_t standard_metadata) {

	apply { }
    
}

/*************************************************************************
*************   C H E C K S U M    C O M P U T A T I O N   **************
*************************************************************************/
/* Empty in this program*/ 

control MyComputeChecksum(inout headers hdr, inout metadata meta) {
     apply { } 
}



/*************************************************************************
***********************  D E P A R S E R  *******************************
*************************************************************************/

control MyDeparser(packet_out packet, in headers hdr) {
    apply {
	packet.emit(hdr.des_hdr);
	packet.emit(hdr.protocol_hdr1);
        packet.emit(hdr.protocol_hdr2);
	packet.emit(hdr.protocol_hdr3);
	packet.emit(hdr.protocol_hdr4);
	packet.emit(hdr.protocol_hdr5);
	packet.emit(hdr.protocol_hdr6);
	packet.emit(hdr.protocol_hdr7);
	packet.emit(hdr.protocol_hdr8);
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
