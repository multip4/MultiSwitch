#include <core.p4>
#include <tna.p4>


#define MAX_LEN 2
#define CPU_PORT    255
#define DROP_PORT   511

#define CONST_STAGE_1				1
#define	CONST_STAGE_2				2
#define	CONST_STAGE_3				3
#define	CONST_STAGE_4				4

#define BIT_MASK_HEADER       4
#define BIT_MASK_USER_META    2
#define BIT_MASK_STD_META     1

#define USER_META     		meta.user_metadata.meta
#define ACTION_BITMAP 	    meta.vdp_metadata.action_chain_bitmap

#define PROG_ID	  meta.vdp_metadata.inst_id

//bit mask for each field of each header 
#define def_mask_112_dstAddr  112w0xFFFFFFFFFFFF0000000000000000
#define def_mask_112_srcAddr  112w0x000000000000FFFFFFFFFFFF0000
#define def_mask_112_bothAddr 112w0xFFFFFFFFFFFFFFFFFFFFFFFF0000
/// for ip header
#define def_mask_160_srcAddr 160w0x000000000000000000000000FFFFFFFF00000000
#define def_mask_160_dstAddr 160w0x00000000000000000000000000000000FFFFFFFF
/// for tcp header
#define def_mask_161_srcPort 160w0xFFFF000000000000000000000000000000000000
#define def_mask_161_dstPort 160w0x0000FFFF00000000000000000000000000000000
/// for arp header
#define def_mask_224_opcode  224w0x000000000000FFFF0000000000000000000000000000000000000000

#define def_mask_224_srcMAC  224w0x0000000000000000FFFFFFFFFFFF0000000000000000000000000000
#define def_mask_224_dstMAC  224w0x000000000000000000000000000000000000FFFFFFFFFFFF00000000
#define def_mask_224_bothMAC 224w0x0000000000000000FFFFFFFFFFFF00000000FFFFFFFFFFFF00000000

#define def_mask_224_srcIP   224w0x0000000000000000000000000000FFFFFFFF00000000000000000000
#define def_mask_224_dstIP   224w0x000000000000000000000000000000000000000000000000FFFFFFFF
#define def_mask_224_bothIP  224w0x0000000000000000000000000000FFFFFFFF000000000000FFFFFFFF

//bit mask for primitive action
#define BIT_MASK_DO_FORWARD 1 // 1st
#define BIT_MASK_MOD_112_DSTADDR 1<<1
#define BIT_MASK_MOD_112_SRCADDR 1<<2
#define BIT_MASK_MOD_160_DSTADDR 1<<3 //unused
#define BIT_MASK_MOD_160_SRCADDR 1<<4 //unused
#define BIT_MASK_MOD_161_DSTADDR 1<<5 //unused
#define BIT_MASK_MOD_161_SRCADDR 1<<6 //unused
// #define BIT_MASK_MOD_224_OPCODE_n_RESPONSE 1<<7 // arp
// #define BIT_MASK_EXTRACT_n_SHIFT_112_SRCADDR 1<<8 //arp //Extract from src & Shift to dst
// #define BIT_MASK_MOD_112_BOTHADDR 1<<9 //arp 
// #define BIT_MASK_EXTRACT_n_SHIFT_224_SRCMAC 1<<10 //arp 
// #define BIT_MASK_MOD_224_BOTHMAC 1<<11 //arp 
// #define BIT_MASK_EXTRACT_n_SHIFT_224_SRCIP 1<<12 //arp 
// #define BIT_MASK_MOD_224_BOTHIP 1<<13 //arp 
#define BIT_MASK_HASH 1<<15 // LB
#define BIT_MASK_EXTRACT_META_112 1<<16 // LB
#define BIT_MASK_EXTRACT_META_160 1<<17 // LB
#define BIT_MASK_EXTRACT_META_161 1<<18 // LB
#define BIT_MASK_DROP 1<<31


/* Header */
header description_hdr_t {
    bit<8> flag;
    bit<8> len;
    bit<16> vdp_id;
}

//L2 format
header hdr_112_t {
    bit<112> buffer;
}

//L3/L4 format
header hdr_160_t {
    bit<160> buffer;
}

//L3 arp
header hdr_224_t {
    bit<224> buffer;
}

//L4
header hdr_64_t {
    bit<64> buf;
}

/* Metadata */
struct vdp_metadata_t {
    bit<8> inst_id; //program id
    bit<8> stage_id; //indicate where programs are installed
    bit<3> match_chain_bitmap; //3 options/ 100:header, 010:user md, 001: std md
    bit<48> match_chain_result; //temp to make chain for action_chain_id
    bit<32> action_chain_bitmap; //call defined actions, next stage =0
    bit<48> action_chain_id; //save match_chain_result
    bit<4>  table_chain_bitmap; //bitmap enabling tables for each header. 4options. 0001:112, 0010:160_1, 0100:160_2, 1000:224
    bit<4> header_chain_bitmap;
    bit<48> shift_bit;
}

/* 
struct user_metadata_t {
    bit<256> meta;

}
 */
struct temp_metadata_t {
    bit<112> temp_112;
    bit<112> temp_112_hash;
    bit<112> temp_extract_112;
    
    bit<160> temp_160;
    bit<160> temp_160_hash;
    bit<160> temp_extract_160;

    bit<160> temp_161;
    bit<160> temp_161_hash;
    bit<160> temp_extract_161;
    
    bit<224> temp_224;
    bit<224> temp_extract_224;
}

struct metadata_t {
    vdp_metadata_t vdp_metadata;
//    user_metadata_t user_metadata;
    temp_metadata_t temp_metadata;
    bit<32> hash_output;
}

struct headers {
    description_hdr_t  desc_hdr;
    hdr_112_t          hdr_112;
    hdr_160_t[MAX_LEN] hdr_160;
    hdr_224_t          hdr_224;
    hdr_64_t           hdr_64;  	
}




parser SwitchIngressParser(
                packet_in packet,
                out headers hdr,
                out metadata_t meta,
                out ingress_intrinsic_metadata_t ig_intr_md) {

    state start {
        packet.extract(ig_intr_md);
        packet.advance(PORT_METADATA_SIZE);
        transition parse_desc;
    }

    /* state parse_112 {
        packet.extract(hdr.hdr_112);
        transition parse_desc;
    } */

    state parse_desc {
        packet.extract(hdr.desc_hdr);
        transition select(hdr.desc_hdr.vdp_id) {
            1:  parse_vPDP1; //L2
            2:  parse_vPDP2; //L3
            3:  parse_vPDP3; //Firewall
            4:  parse_vPDP4; //?
            default: accept;
        }
    }
    
    state parse_vPDP1 {
        packet.extract(hdr.hdr_112);
        transition accept;
    }

    state parse_vPDP2 {
        packet.extract(hdr.hdr_112);
        packet.extract(hdr.hdr_160[0]);
        transition accept;
    }

    state parse_vPDP3 {
        packet.extract(hdr.hdr_112);
        packet.extract(hdr.hdr_160[0]);
        transition parse_vPDP3_1;        
    }

    state parse_vPDP3_1 {
        packet.extract(hdr.hdr_160[1]);
        transition accept;
    }

    state parse_vPDP4 {
        packet.extract(hdr.hdr_112);
        packet.extract(hdr.hdr_224);
        transition accept;
    }
}






//////////////////////* Ingress Pipeline */////////////////////
control SwitchIngress(inout headers hdr,
                inout metadata_t meta,
                in ingress_intrinsic_metadata_t ig_intr_md,
                in ingress_intrinsic_metadata_from_parser_t ig_prsr_md,
                inout ingress_intrinsic_metadata_for_deparser_t ig_dprsr_md,
                inout ingress_intrinsic_metadata_for_tm_t ig_tm_md) {


    bit<32> hash;
    Hash<bit<32>>(HashAlgorithm_t.CRC32) hash_function;
    action action_hash(){
        hash = hash_function.get({meta.temp_metadata.temp_112_hash, 
                                      meta.temp_metadata.temp_160_hash,
                                      meta.temp_metadata.temp_161_hash
                                      });
        meta.hash_output = hash;
    }
    



    action set_initial_config (bit<8> inst_id, bit<8> stage_id, bit<3> match_chain_bitmap, bit<4> header_chain_bitmap) { //need-to-check
		meta.vdp_metadata.inst_id = inst_id; //어떤 프로그램이 설치되었는지
		meta.vdp_metadata.stage_id = stage_id;
		meta.vdp_metadata.match_chain_bitmap = match_chain_bitmap; //
		meta.vdp_metadata.header_chain_bitmap = header_chain_bitmap; // related to headers       
	}

    table table_config_at_initial {
        key = {
            hdr.desc_hdr.vdp_id: exact;
        }
        actions = {
            set_initial_config();
        }
        size = 10;
        const entries = {
            1 : set_initial_config(1,1,0b100,0b0001);  //1 = l2 forwarding
            2 : set_initial_config(2,2,0b100,0b0010);  //2 = l3 router
            3 : set_initial_config(3,3,0b101,0b0110);  //3 = TCP fw
            4 : set_initial_config(4,1,0b100,0b0001);  //4 = LB
        }
    }

    // stage entering
    action set_action_id(bit<32> action_bitmap) { 
        meta.vdp_metadata.action_chain_bitmap = action_bitmap;
    }

    table table_header_match_112_stage1 {
        key = {
            meta.vdp_metadata.inst_id : exact ;
            hdr.hdr_112.buffer : ternary ; // should include mask field
        }
        actions = {
            set_action_id(); // enabling primitive actions
        }
        const entries = {
            (1, 112w0x0000000000020000000000000000 &&& 112w0xFFFFFFFFFFFF0000000000000000) : set_action_id(0x00000001);
            // if vdp_id == 1  &  dst MAC 00:00:00:00:00:02
            //     L2 기능 실행 => BIT_MASK : 1 (forward)
            (4, 112w0x0000000000020000000000000000 &&& 112w0x0000000000000000000000000000) : set_action_id(0x00078001);
            // if vdp_id == 4 이기만 하면 LB action 실행
            //     LB 기능실행 => action bitmap : 1, 15,16,17,18
        }
    }

    table table_header_match_160_stage2 {
        key = {
            meta.vdp_metadata.inst_id : exact ;
            hdr.hdr_160[0].buffer : ternary ; // should include mask field
        }
        actions = {
            set_action_id(); // enabling primitive actions
        }
        const entries = { 
            (2, 160w0x000000000000000000000000000000000A0A0200 &&& 160w0x00000000000000000000000000000000FFFFFF00) : set_action_id(0x00000111);
            // dstSrcIP : 10.10.2.0/24 => forward : port 163
        }
    }

    table table_header_match_160_stage3 {
        key = {
            meta.vdp_metadata.inst_id : exact ;
            hdr.hdr_160[0].buffer : ternary ; // should include mask field
        }
        actions = {
            set_action_id(); // enabling primitive actions
        }
        const entries = {
            (3, 160w0x0000000000000000000000000A0A000000000000 &&& 160w0x000000000000000000000000FFFFFF0000000000) : set_action_id(0x00000001);
            (3, 160w0x0000000000000000000000000A0A020000000000 &&& 160w0x000000000000000000000000FFFFFF0000000000) : set_action_id(0x80000000);
            // srcIP : 10.10.0.0/24 : Pass 162
            // srcIP : 10.10.2.0/24: drop
        }
    }
    table table_header_match_161_stage3 { //161 : tcp
        key = {
            meta.vdp_metadata.inst_id : exact ;
            hdr.hdr_160[1].buffer : ternary ; // should include mask field
        }
        actions = {
            set_action_id(); // enabling primitive actions
        }
        const entries = { 
            (3, 160w0x0000005000000000000000000000000000000000 &&& 160w0x0000FFFF00000000000000000000000000000000) : set_action_id(0x00000001);
            (3, 160w0x0000001600000000000000000000000000000000 &&& 160w0x0000FFFF00000000000000000000000000000000) : set_action_id(0x80000000);
            // dstPort : 80 => Pass 162
            // dstPort : 22 => drop

        }
    }

/////primitive actions + tables + entries /////
    action action_forward(bit<9> port) { // 1st primitive
		ig_tm_md.ucast_egress_port = port;
	}

    table table_action_forward_stage1 {
        key = {
            meta.vdp_metadata.inst_id : exact;
        }
        actions = {
            action_forward();
        }
        const entries = {
            1 : action_forward(160); 
        }
    }
    table table_action_forward_stage2 {
        key = {
            meta.vdp_metadata.inst_id : exact;
        }
        actions = {
            action_forward();
        }
        const entries = {
            2 : action_forward(162); //daechung
        }
    }
    table table_action_forward_stage3 {
        key = {
            meta.vdp_metadata.inst_id : exact;
        }
        actions = {
            action_forward();
        }
        const entries = {
            3 : action_forward(163); //daechung
        }
    }
//Action 1.action_mod_112_dstAddr
    action action_mod_112_dstAddr(bit<112> value_112_dstAddr) { // 2nd primitive , error-prone?
        hdr.hdr_112.buffer = (hdr.hdr_112.buffer&(~def_mask_112_dstAddr))|(value_112_dstAddr&def_mask_112_dstAddr);
        // 
    }
    table table_action_mod_112_dstAddr_stage1 {
        key = {
            meta.vdp_metadata.inst_id : exact;
        }
        actions = {
            action_mod_112_dstAddr();
        }
        const entries = {
            2 : action_mod_112_dstAddr (0x00000000010000000000000000);
        }
    }
    table table_action_mod_112_dstAddr_stage2 {
        key = {
            meta.vdp_metadata.inst_id : exact;
        }
        actions = {
            action_mod_112_dstAddr();
        }
        const entries = {
            2 : action_mod_112_dstAddr (0x00000000020000000000000000);
        }
    }
    table table_action_mod_112_dstAddr_stage3 {
        key = {
            meta.vdp_metadata.inst_id : exact;
        }
        actions = {
            action_mod_112_dstAddr();
        }
        const entries = {
            3 : action_mod_112_dstAddr (0x00000000030000000000000000);
        }
    }

//Action 2.action_mod_112_srcAddr
    action action_mod_112_srcAddr(bit<112> value_112_srcAddr) { // 3rd primitive, error-prone?
        hdr.hdr_112.buffer = (hdr.hdr_112.buffer&(~def_mask_112_srcAddr))|(value_112_srcAddr&def_mask_112_srcAddr);
    }
    table table_action_mod_112_srcAddr_stage1 {
        key = {
            meta.vdp_metadata.inst_id : exact;
        }
        actions = {
            action_mod_112_srcAddr();
        }
        const entries = {
            2 : action_mod_112_srcAddr(0x0000000000000000000000010000);
        }
    }
    table table_action_mod_112_srcAddr_stage2 {
        key = {
            meta.vdp_metadata.inst_id : exact;
        }
        actions = {
            action_mod_112_srcAddr();
        }
        const entries = {
            2 : action_mod_112_srcAddr(0x0000000000000000000000010000);
        }
    }
    table table_action_mod_112_srcAddr_stage3 {
        key = {
            meta.vdp_metadata.inst_id : exact;
        }
        actions = {
            action_mod_112_srcAddr();
        }
        const entries = {
            2 : action_mod_112_srcAddr(0x0000000000000000000000010000);
        }
    }
    

//Action 3.action_drop
    action action_drop() { //48th primitive
		ig_dprsr_md.drop_ctl = 1;
	}
    
    table table_action_drop_stage1 {
        key = {
            meta.vdp_metadata.inst_id : exact;
        }
        actions = {
            action_drop();
        }
        const entries = {
            3 : action_drop();
        }
    }
    table table_action_drop_stage2 {
        key = {
            meta.vdp_metadata.inst_id : exact;
        }
        actions = {
            action_drop();
        }
        const entries = {
            3 : action_drop();
        }
    }
    table table_action_drop_stage3 {
        key = {
            meta.vdp_metadata.inst_id : exact;
        }
        actions = {
            action_drop();
        }
        const entries = {
            3 : action_drop();
        }
    }

//4. action_hash  
    table table_action_hash_stage1 {
        key = {
            meta.vdp_metadata.inst_id : exact;
        }
        actions = {
            action_hash();
        }
        const entries = {
            4 : action_hash();
        }
    }

//5. action_extract_meta
    action action_extract_meta_112(bit<112> mask) {
        meta.temp_metadata.temp_112_hash = hdr.hdr_112.buffer & mask;
    }
    table table_action_extract_meta_112_stage1 {
        key = {
            meta.vdp_metadata.inst_id : exact;
        }
        actions = {
            action_extract_meta_112();
        }
        const entries = {
            4 : action_extract_meta_112(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFF);
        }
    }

    action action_extract_meta_160(bit<160> mask) {
        meta.temp_metadata.temp_160_hash = hdr.hdr_160[0].buffer & mask;
    }
    table table_action_extract_meta_160_stage1 {
        key = {
            meta.vdp_metadata.inst_id : exact;
        }
        actions = {
            action_extract_meta_160();
        }
        const entries = {
            4 : action_extract_meta_160(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);
        }
    }

    action action_extract_meta_161(bit<160> mask) {
        meta.temp_metadata.temp_161_hash = hdr.hdr_160[1].buffer & mask;
    }
    table table_action_extract_meta_161_stage1 {
        key = {
            meta.vdp_metadata.inst_id : exact;
        }
        actions = {
            action_extract_meta_161();
        }
        const entries = {
            4 : action_extract_meta_161(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF);
        }
    }

//6. action
    table table_action_temporal_lb_forward_stage1 {
        key = {
            meta.hash_output : ternary;
        }
        actions = {
            action_forward();
        }
        const entries = {
            0x00000001 &&& 0x00000001 : action_forward(164);
        }
        default_action = action_forward(160);
    }



// apply
// apply
// apply
    apply {
        ig_tm_md.bypass_egress = true;

        if (PROG_ID ==0) {
            table_config_at_initial.apply();
        }
        if (PROG_ID !=0) {
            // Virtual Stage 1
            if(meta.vdp_metadata.stage_id == CONST_STAGE_1){ 
                if((meta.vdp_metadata.match_chain_bitmap & BIT_MASK_HEADER) != 0){
                    if(meta.vdp_metadata.header_chain_bitmap&1 != 0){
                        table_header_match_112_stage1.apply();
                    }
                }                
            }
            if(ACTION_BITMAP!= 0) { // up to 32 bits can be compared
                if ((ACTION_BITMAP & BIT_MASK_DO_FORWARD) != 0) {	
                    table_action_forward_stage1.apply();
                }
                if ((ACTION_BITMAP & BIT_MASK_DROP) != 0) { 
                    table_action_drop_stage1.apply();	
                }
                if ((ACTION_BITMAP & BIT_MASK_MOD_112_DSTADDR) != 0) {	
                    table_action_mod_112_dstAddr_stage1.apply();	
                }
                if ((ACTION_BITMAP & BIT_MASK_MOD_112_SRCADDR) != 0) {	
                    table_action_mod_112_srcAddr_stage1.apply();
                }
                if ((ACTION_BITMAP & BIT_MASK_HASH) != 0) { 
                    table_action_extract_meta_112_stage1.apply();
                    table_action_extract_meta_160_stage1.apply();
                    table_action_extract_meta_161_stage1.apply();
                    table_action_hash_stage1.apply();
                    table_action_temporal_lb_forward_stage1.apply();
                }
            }

            // Virtual Stage 2
            if(meta.vdp_metadata.stage_id == CONST_STAGE_2){
                if((meta.vdp_metadata.match_chain_bitmap & BIT_MASK_HEADER) != 0){
                    if(meta.vdp_metadata.header_chain_bitmap&2 != 0){
                        table_header_match_160_stage2.apply();
                    }
                }
            }

            if(ACTION_BITMAP != 0) {
                if ((ACTION_BITMAP & BIT_MASK_DO_FORWARD) != 0) {	
                    table_action_forward_stage2.apply();						
                }
                if ((ACTION_BITMAP & BIT_MASK_MOD_112_DSTADDR) != 0) {	
                    table_action_mod_112_dstAddr_stage2.apply();						
                }
                if ((ACTION_BITMAP & BIT_MASK_MOD_112_SRCADDR) != 0) {	
                    table_action_mod_112_srcAddr_stage2.apply();						
                }
                if ((ACTION_BITMAP & BIT_MASK_DROP) != 0) {	
                    table_action_drop_stage2.apply();						
                }
            }

            // Virtual Stage 3
            if(meta.vdp_metadata.stage_id == CONST_STAGE_3){
                if((meta.vdp_metadata.match_chain_bitmap & BIT_MASK_HEADER) != 0){
                    if(meta.vdp_metadata.header_chain_bitmap&2 != 0){
                        table_header_match_160_stage3.apply();
                    }
                    if((ACTION_BITMAP & BIT_MASK_DROP) == 0) { // Drop이 아니면 수행
                        if(meta.vdp_metadata.header_chain_bitmap&4 != 0){
                        table_header_match_161_stage3.apply();
                        }
                    }
                }
                
            }
            if(ACTION_BITMAP != 0) {
                if ((ACTION_BITMAP & BIT_MASK_DO_FORWARD) != 0) {	
                    table_action_forward_stage3.apply();						
                }
                if ((ACTION_BITMAP & BIT_MASK_MOD_112_DSTADDR) != 0) {	
                    table_action_mod_112_dstAddr_stage3.apply();						
                }
                if ((ACTION_BITMAP & BIT_MASK_MOD_112_SRCADDR) != 0) {	
                    table_action_mod_112_srcAddr_stage3.apply();						
                }
                if ((ACTION_BITMAP & BIT_MASK_DROP) != 0) {	
                    table_action_drop_stage3.apply();						
                }
            }

            
        } 
    }  
}



//////////////////////* Ingress Deparser */////////////////////
control SwitchIngressDeparser(
        packet_out packet,
        inout headers hdr,
        in metadata_t meta,
        in ingress_intrinsic_metadata_for_deparser_t ig_dprsr_md) {
    
    apply{

        packet.emit(hdr.hdr_112);
        packet.emit(hdr.desc_hdr);
        packet.emit(hdr.hdr_224);
        packet.emit(hdr.hdr_160[0]);
        packet.emit(hdr.hdr_160[1]);
        packet.emit(hdr.hdr_64);

    }
}





//////////////////////* Egress */////////////////////
//////////////////////* Egress */////////////////////
//////////////////////* Egress */////////////////////

parser SwitchEgressParser(
        packet_in packet,
        out headers hdr,
        out metadata_t meta,
        out egress_intrinsic_metadata_t eg_intr_md){
	
	state start {
 
		transition accept;
	}
}

control SwitchEgress(
        inout headers hdr,
        inout metadata_t meta,
        in egress_intrinsic_metadata_t eg_intr_md,
        in egress_intrinsic_metadata_from_parser_t eg_prsr_md,
        inout egress_intrinsic_metadata_for_deparser_t eg_dprsr_md,
        inout egress_intrinsic_metadata_for_output_port_t eg_intr_md_for_oport) {

    apply {}
}

control SwitchEgressDeparser(
        packet_out packet,
        inout headers hdr,
        in metadata_t meta,
        in egress_intrinsic_metadata_for_deparser_t eg_dprsr_md) {

	apply{
        packet.emit(hdr);
    }
}



Pipeline(SwitchIngressParser(),
         SwitchIngress(),
         SwitchIngressDeparser(),
         SwitchEgressParser(),
         SwitchEgress(),
         SwitchEgressDeparser()) pipe;

Switch(pipe) main;
