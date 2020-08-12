#include <core.p4>
#include <tna.p4>

#define MAX_LEN 2
#define CPU_PORT    255
#define DROP_PORT   511
#define TABLE_SIZE 4096

#define CONST_STAGE_1            1
#define   CONST_STAGE_2            2
#define   CONST_STAGE_3            3
#define   CONST_STAGE_4            4
#define   CONST_STAGE_5            5
#define   CONST_STAGE_6            6

#define BIT_MASK_HEADER       4
#define BIT_MASK_USER_META    2
#define BIT_MASK_STD_META     1

#define USER_META           meta.user_metadata.meta
#define ACTION_BITMAP        meta.vdp_metadata.action_chain_bitmap
#define ACTION_BITMAP1        meta.vdp_metadata.action_chain_bitmap1
#define ACTION_BITMAP2       meta.vdp_metadata.action_chain_bitmap2
#define ACTION_BITMAP3        meta.vdp_metadata.action_chain_bitmap3
#define ACTION_BITMAP4        meta.vdp_metadata.action_chain_bitmap4
#define ACTION_BITMAP5       meta.vdp_metadata.action_chain_bitmap5
#define ACTION_BITMAP6        meta.vdp_metadata.action_chain_bitmap6

#define PROG_ID     meta.vdp_metadata.inst_id

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
    bit<32> action_chain_bitmap1; //call defined actions, next stage =0
    bit<32> action_chain_bitmap2; //call defined actions, next stage =0
    bit<32> action_chain_bitmap3; //call defined actions, next stage =0
    bit<32> action_chain_bitmap4; //call defined actions, next stage =0
    bit<32> action_chain_bitmap5; //call defined actions, next stage =0
    bit<32> action_chain_bitmap6; //call defined actions, next stage =0
    bit<48> action_chain_id; //save match_chain_result
    bit<4>  table_chain_bitmap; //bitmap enabling tables for each header. 4options. 0001:112, 0010:160_1, 0100:160_2, 1000:224
    bit<4> header_chain_bitmap;
    bit<48> shift_bit;
}

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
    temp_metadata_t temp_metadata;
    bit<32> hash_output1;
    bit<32> hash_output2;
    bit<32> hash_output3;
    bit<32> hash_output4;
    bit<32> hash_output5;
    bit<32> hash_output6;
}

struct headers {
    description_hdr_t  desc_hdr;
    hdr_112_t          hdr_112;
    hdr_160_t[MAX_LEN] hdr_160;
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
        packet.extract(hdr.hdr_160[0]);
        packet.extract(hdr.hdr_160[1]);
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
    #define ACTION_HASH(i) \
        action action_hash##i() { \
            hash = hash_function.get({meta.temp_metadata.temp_112_hash, \
                                        meta.temp_metadata.temp_160_hash, \
                                        meta.temp_metadata.temp_161_hash \
                                        }); \
            meta.hash_output##i = hash; \
        }
    ACTION_HASH(1)
    ACTION_HASH(2)
    ACTION_HASH(3)
    
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
            2 : set_initial_config(2,1,0b100,0b0010);  //2 = l3 router
            3 : set_initial_config(3,1,0b101,0b0110);  //3 = TCP fw
            4 : set_initial_config(4,1,0b101,0b1000);  //4 = LB
        }
    }

    action set_next_stage(bit<8> stage_id) { 
            meta.vdp_metadata.stage_id = stage_id; 
        } 

    #define TABLE_SET_NEXT_STAGE(i) \
        table table_set_next_stage##i { \
            key = { \
                hdr.desc_hdr.vdp_id: exact; \
            } \
            actions = { \
                set_next_stage(); \
            } \
        }
    TABLE_SET_NEXT_STAGE(1)
    TABLE_SET_NEXT_STAGE(2)
    TABLE_SET_NEXT_STAGE(3)

    // stage entering
    #define TABLE_HEADER_MATCH(i) \
        action set_action_id##i(bit<32> action_bitmap) { \
            meta.vdp_metadata.action_chain_bitmap##i = action_bitmap; \
        } \
        table table_header_match_stage##i { \
            key = { \
                meta.vdp_metadata.inst_id: exact; \
                hdr.hdr_112.buffer: ternary; \
                hdr.hdr_160[0].buffer: ternary; \
                hdr.hdr_160[1].buffer: ternary; \
            } \
            actions = { \
                set_action_id##i(); \
            } \
            size = 1024; \
        }
    TABLE_HEADER_MATCH(1)
    TABLE_HEADER_MATCH(2)
    TABLE_HEADER_MATCH(3)

/////primitive actions + tables + entries /////
    action action_forward(bit<9> port) { // 1st primitive
      ig_tm_md.ucast_egress_port = port;
   }

    #define TABLE_ACTION_FORWARD(i) \
        table table_action_forward_stage##i { \
            key = { \
                meta.vdp_metadata.inst_id: exact; \
                meta.hash_output##i : ternary; \
            } \
            actions = { \
                action_forward(); \
            } \
        }
    TABLE_ACTION_FORWARD(1)
    TABLE_ACTION_FORWARD(2)
    TABLE_ACTION_FORWARD(3)

//Action 1.action_mod_112_dstAddr
    action action_mod_112_dstAddr(bit<112> value_112_dstAddr) { // 2nd primitive , error-prone?
        hdr.hdr_112.buffer = (hdr.hdr_112.buffer&(~def_mask_112_dstAddr))|(value_112_dstAddr&def_mask_112_dstAddr);
        // 
    }

    #define TABLE_ACTION_MOD_112_DSTADDR(i) \
        table table_action_mod_112_dstAddr_stage##i { \
            key = { \
                meta.vdp_metadata.inst_id: exact; \
            } \
            actions = { \
                action_mod_112_dstAddr(); \
            } \
        }
    TABLE_ACTION_MOD_112_DSTADDR(1)
    TABLE_ACTION_MOD_112_DSTADDR(2)
    TABLE_ACTION_MOD_112_DSTADDR(3)

//Action 2.action_mod_112_srcAddr
    action action_mod_112_srcAddr(bit<112> value_112_srcAddr) { // 3rd primitive, error-prone?
        hdr.hdr_112.buffer = (hdr.hdr_112.buffer&(~def_mask_112_srcAddr))|(value_112_srcAddr&def_mask_112_srcAddr);
    }

    #define TABLE_ACTION_MOD_112_SRCADDR(i) \
        table table_action_mod_112_srcAddr_stage##i { \
            key = { \
                meta.vdp_metadata.inst_id: exact; \
            } \
            actions = { \
                action_mod_112_srcAddr(); \
            } \
        }
    TABLE_ACTION_MOD_112_SRCADDR(1)
    TABLE_ACTION_MOD_112_SRCADDR(2)
    TABLE_ACTION_MOD_112_SRCADDR(3)

//Action 3.action_drop
    action action_drop() { //48th primitive
      ig_dprsr_md.drop_ctl = 1;
   }
    
    #define TABLE_ACTION_DROP(i) \
        table table_action_drop_stage##i { \
            key = { \
                meta.vdp_metadata.inst_id: exact; \
            } \
            actions = { \
                action_drop(); \
            } \
        }
    TABLE_ACTION_DROP(1)
    TABLE_ACTION_DROP(2)
    TABLE_ACTION_DROP(3)

//4. action_hash TODO:
    #define TABLE_ACTION_HASH(i) \
        table table_action_hash_stage##i { \
            key = { \
                meta.vdp_metadata.inst_id: exact; \
            } \
            actions = { \
                action_hash##i(); \
            } \
        }
    TABLE_ACTION_HASH(1)
    TABLE_ACTION_HASH(2)
    TABLE_ACTION_HASH(3)

//5. action_extract_meta 112
    action action_extract_meta_112(bit<112> mask) {
        meta.temp_metadata.temp_112_hash = hdr.hdr_112.buffer & mask;
    }

    action action_extract_meta_160(bit<160> mask) {
        meta.temp_metadata.temp_160_hash = hdr.hdr_160[0].buffer & mask;
    }

    action action_extract_meta_161(bit<160> mask) {
        meta.temp_metadata.temp_161_hash = hdr.hdr_160[1].buffer & mask;
    }


    #define TABLE_ACTION_EXTRACT_META(i) \
        table table_action_extract_meta_stage##i { \
            key = { \
                meta.vdp_metadata.inst_id: exact; \
            } \
            actions = { \
                action_extract_meta_112(); \
                action_extract_meta_160(); \
                action_extract_meta_161(); \
            } \
        }
    TABLE_ACTION_EXTRACT_META(1)
    TABLE_ACTION_EXTRACT_META(2)
    TABLE_ACTION_EXTRACT_META(3)

//FIXME:
    apply {

        if (PROG_ID == 0) {
            table_config_at_initial.apply();
        } 
        if (PROG_ID != 0) {
            // ----- Virtual Stage 1 -----
            if(meta.vdp_metadata.stage_id == CONST_STAGE_1){
                if((meta.vdp_metadata.match_chain_bitmap & BIT_MASK_HEADER) != 0){
                    table_header_match_stage1.apply();
                    table_set_next_stage1.apply();
                }

                if ((ACTION_BITMAP1 & BIT_MASK_HASH) != 0) { 
                    table_action_extract_meta_stage1.apply();
                    table_action_hash_stage1.apply();
                }
                if ((ACTION_BITMAP1 & BIT_MASK_DO_FORWARD) != 0) {   
                    table_action_forward_stage1.apply();
                }
                if ((ACTION_BITMAP1 & BIT_MASK_DROP) != 0) { 
                    table_action_drop_stage1.apply();   
                }
                if ((ACTION_BITMAP1 & BIT_MASK_MOD_112_DSTADDR) != 0) {   
                    table_action_mod_112_dstAddr_stage1.apply();   
                }
                if ((ACTION_BITMAP1 & BIT_MASK_MOD_112_SRCADDR) != 0) {   
                    table_action_mod_112_srcAddr_stage1.apply();
                }
            }


            // ----- Virtual Stage 2 -----
            if(meta.vdp_metadata.stage_id == CONST_STAGE_2){
                if((meta.vdp_metadata.match_chain_bitmap & BIT_MASK_HEADER) != 0){
                    table_header_match_stage2.apply();
                    table_set_next_stage2.apply();
                }

                if ((ACTION_BITMAP2 & BIT_MASK_HASH) != 0) { 
                    table_action_extract_meta_stage2.apply();
                    table_action_hash_stage2.apply();
                }
                if ((ACTION_BITMAP2 & BIT_MASK_DO_FORWARD) != 0) {   
                    table_action_forward_stage2.apply();                  
                }
                if ((ACTION_BITMAP2 & BIT_MASK_MOD_112_DSTADDR) != 0) {   
                    table_action_mod_112_dstAddr_stage2.apply();                  
                }
                if ((ACTION_BITMAP2 & BIT_MASK_MOD_112_SRCADDR) != 0) {   
                    table_action_mod_112_srcAddr_stage2.apply();                  
                }
                if ((ACTION_BITMAP2 & BIT_MASK_DROP) != 0) {   
                    table_action_drop_stage2.apply();                  
                }
            }


            // ----- Virtual Stage 3 -----
            // if(meta.vdp_metadata.stage_id == CONST_STAGE_3){
            //     if((meta.vdp_metadata.match_chain_bitmap & BIT_MASK_HEADER) != 0){
            //         table_header_match_stage3.apply();
            //         table_set_next_stage3.apply();
            //     }
            // }

            // if ((ACTION_BITMAP3 & BIT_MASK_HASH) != 0) { 
            //     table_action_extract_meta_stage3.apply();
            //     table_action_hash_stage3.apply();
            // }
            // if ((ACTION_BITMAP3 & BIT_MASK_DO_FORWARD) != 0) {   
            //     table_action_forward_stage3.apply();                  
            // }
            // if ((ACTION_BITMAP3 & BIT_MASK_MOD_112_DSTADDR) != 0) {   
            //     table_action_mod_112_dstAddr_stage3.apply();                  
            // }
            // if ((ACTION_BITMAP3 & BIT_MASK_MOD_112_SRCADDR) != 0) {   
            //     table_action_mod_112_srcAddr_stage3.apply();                  
            // }
            // if ((ACTION_BITMAP3 & BIT_MASK_DROP) != 0) {   
            //     table_action_drop_stage3.apply();                  
            // }
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
        packet.emit(hdr.desc_hdr);
        packet.emit(hdr.hdr_112);
        packet.emit(hdr.hdr_160[0]);
        packet.emit(hdr.hdr_160[1]);

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
        packet.extract(eg_intr_md);
        // packet.advance(PORT_METADATA_SIZE);
        transition parse_desc;
    }

    state parse_desc {
        packet.extract(hdr.desc_hdr);
        transition select(hdr.desc_hdr.vdp_id) {
            1:  parse_vPDP1; //L2
            2:  parse_vPDP2; //L3
            3:  parse_vPDP3; //Firewall
            4:  parse_vPDP4; //LB
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
        packet.extract(hdr.hdr_160[0]);
        packet.extract(hdr.hdr_160[1]);
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
            
    bit<32> hash;
    Hash<bit<32>>(HashAlgorithm_t.CRC32) hash_function;
    #define ACTION_HASH(i) \
        action action_hash##i() { \
            hash = hash_function.get({meta.temp_metadata.temp_112_hash, \
                                        meta.temp_metadata.temp_160_hash, \
                                        meta.temp_metadata.temp_161_hash \
                                        }); \
            meta.hash_output##i = hash; \
        }
    ACTION_HASH(4)
    ACTION_HASH(5)
    ACTION_HASH(6)
    
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
            3 : set_initial_config(3,3,0b101,0b0110);  //3 = FW
            4 : set_initial_config(4,4,0b101,0b1000);  //4 = LB
        }
    }

    action set_next_stage(bit<8> stage_id) { 
            meta.vdp_metadata.stage_id = stage_id; 
        } 

    #define TABLE_SET_NEXT_STAGE(i) \
        table table_set_next_stage##i { \
            key = { \
                hdr.desc_hdr.vdp_id: exact; \
            } \
            actions = { \
                set_next_stage(); \
            } \
        }
    TABLE_SET_NEXT_STAGE(4)
    TABLE_SET_NEXT_STAGE(5)
    TABLE_SET_NEXT_STAGE(6)

    // stage entering
    #define TABLE_HEADER_MATCH(i) \
        action set_action_id##i(bit<32> action_bitmap) { \
            meta.vdp_metadata.action_chain_bitmap##i = action_bitmap; \
        } \
        table table_header_match_stage##i { \
            key = { \
                meta.vdp_metadata.inst_id: exact; \
                hdr.hdr_112.buffer: ternary; \
                hdr.hdr_160[0].buffer: ternary; \
                hdr.hdr_160[1].buffer: ternary; \
            } \
            actions = { \
                set_action_id##i(); \
            } \
        }
    TABLE_HEADER_MATCH(4)
    TABLE_HEADER_MATCH(5)
    TABLE_HEADER_MATCH(6)

//Action 1.action_mod_112_dstAddr
    action action_mod_112_dstAddr(bit<112> value_112_dstAddr) { // 2nd primitive , error-prone?
        hdr.hdr_112.buffer = (hdr.hdr_112.buffer&(~def_mask_112_dstAddr))|(value_112_dstAddr&def_mask_112_dstAddr);
        // 
    }

    #define TABLE_ACTION_MOD_112_DSTADDR(i) \
        table table_action_mod_112_dstAddr_stage##i { \
            key = { \
                meta.vdp_metadata.inst_id: exact; \
            } \
            actions = { \
                action_mod_112_dstAddr(); \
            } \
        }
    TABLE_ACTION_MOD_112_DSTADDR(4)
    TABLE_ACTION_MOD_112_DSTADDR(5)
    TABLE_ACTION_MOD_112_DSTADDR(6)

//Action 2.action_mod_112_srcAddr
    action action_mod_112_srcAddr(bit<112> value_112_srcAddr) { // 3rd primitive, error-prone?
        hdr.hdr_112.buffer = (hdr.hdr_112.buffer&(~def_mask_112_srcAddr))|(value_112_srcAddr&def_mask_112_srcAddr);
    }

    #define TABLE_ACTION_MOD_112_SRCADDR(i) \
        table table_action_mod_112_srcAddr_stage##i { \
            key = { \
                meta.vdp_metadata.inst_id: exact; \
            } \
            actions = { \
                action_mod_112_srcAddr(); \
            } \
        }
    TABLE_ACTION_MOD_112_SRCADDR(4)
    TABLE_ACTION_MOD_112_SRCADDR(5)
    TABLE_ACTION_MOD_112_SRCADDR(6)

//Action 3.action_drop
    action action_drop() { //48th primitive
      eg_dprsr_md.drop_ctl = 1;
   }
    
    #define TABLE_ACTION_DROP(i) \
        table table_action_drop_stage##i { \
            key = { \
                meta.vdp_metadata.inst_id: exact; \
            } \
            actions = { \
                action_drop(); \
            } \
        }
    TABLE_ACTION_DROP(4)
    TABLE_ACTION_DROP(5)
    TABLE_ACTION_DROP(6)

//4. action_hash TODO:
    #define TABLE_ACTION_HASH(i) \
        table table_action_hash_stage##i { \
            key = { \
                meta.vdp_metadata.inst_id: exact; \
            } \
            actions = { \
                action_hash##i(); \
            } \
        }
    TABLE_ACTION_HASH(4)
    TABLE_ACTION_HASH(5)
    TABLE_ACTION_HASH(6)

//5. action_extract_meta 112
    action action_extract_meta_112(bit<112> mask) {
        meta.temp_metadata.temp_112_hash = hdr.hdr_112.buffer & mask;
    }

    action action_extract_meta_160(bit<160> mask) {
        meta.temp_metadata.temp_160_hash = hdr.hdr_160[0].buffer & mask;
    }

    action action_extract_meta_161(bit<160> mask) {
        meta.temp_metadata.temp_161_hash = hdr.hdr_160[1].buffer & mask;
    }


    #define TABLE_ACTION_EXTRACT_META(i) \
        table table_action_extract_meta_stage##i { \
            key = { \
                meta.vdp_metadata.inst_id: exact; \
            } \
            actions = { \
                action_extract_meta_112(); \
                action_extract_meta_160(); \
                action_extract_meta_161(); \
            } \
        }
    TABLE_ACTION_EXTRACT_META(4)
    TABLE_ACTION_EXTRACT_META(5)
    TABLE_ACTION_EXTRACT_META(6)

   apply {
       // ----- Virtual Stage 4 -----
       if(meta.vdp_metadata.stage_id == CONST_STAGE_4){
            if((meta.vdp_metadata.match_chain_bitmap & BIT_MASK_HEADER) != 0){
                table_header_match_stage4.apply();
                table_set_next_stage4.apply();
            }
        }

        if ((ACTION_BITMAP4 & BIT_MASK_HASH) != 0) { 
            table_action_extract_meta_stage4.apply();
            table_action_hash_stage4.apply();
        }
        if ((ACTION_BITMAP4 & BIT_MASK_DROP) != 0) { 
            table_action_drop_stage4.apply();   
        }
        if ((ACTION_BITMAP4 & BIT_MASK_MOD_112_DSTADDR) != 0) {   
            table_action_mod_112_dstAddr_stage4.apply();   
        }
        if ((ACTION_BITMAP4 & BIT_MASK_MOD_112_SRCADDR) != 0) {   
            table_action_mod_112_srcAddr_stage4.apply();
        }

        // ----- Virtual Stage 5 -----
        if(meta.vdp_metadata.stage_id == CONST_STAGE_5){
            if((meta.vdp_metadata.match_chain_bitmap & BIT_MASK_HEADER) != 0){
                table_header_match_stage5.apply();
                table_set_next_stage5.apply();
            }
        }

        if ((ACTION_BITMAP5 & BIT_MASK_HASH) != 0) { 
            table_action_extract_meta_stage5.apply();
            table_action_hash_stage5.apply();
        }
        if ((ACTION_BITMAP5 & BIT_MASK_DROP) != 0) { 
            table_action_drop_stage5.apply();   
        }
        if ((ACTION_BITMAP5 & BIT_MASK_MOD_112_DSTADDR) != 0) {   
            table_action_mod_112_dstAddr_stage5.apply();   
        }
        if ((ACTION_BITMAP5 & BIT_MASK_MOD_112_SRCADDR) != 0) {   
            table_action_mod_112_srcAddr_stage5.apply();
        }

        // ----- Virtual Stage 6 -----
        if(meta.vdp_metadata.stage_id == CONST_STAGE_6){
            if((meta.vdp_metadata.match_chain_bitmap & BIT_MASK_HEADER) != 0){
                table_header_match_stage6.apply();
                table_set_next_stage6.apply();
            }
        }

        if ((ACTION_BITMAP6 & BIT_MASK_HASH) != 0) { 
            table_action_extract_meta_stage6.apply();
            table_action_hash_stage6.apply();
        }
        if ((ACTION_BITMAP6 & BIT_MASK_DROP) != 0) { 
            table_action_drop_stage6.apply();   
        }
        if ((ACTION_BITMAP6 & BIT_MASK_MOD_112_DSTADDR) != 0) {   
            table_action_mod_112_dstAddr_stage6.apply();   
        }
        if ((ACTION_BITMAP6 & BIT_MASK_MOD_112_SRCADDR) != 0) {   
            table_action_mod_112_srcAddr_stage6.apply();
        }
   }
}

control SwitchEgressDeparser(
        packet_out packet,
        inout headers hdr,
        in metadata_t meta,
        in egress_intrinsic_metadata_for_deparser_t eg_dprsr_md) {

   apply{
        packet.emit(hdr.desc_hdr);
        packet.emit(hdr.hdr_112);
        packet.emit(hdr.hdr_160[0]);
        packet.emit(hdr.hdr_160[1]);

    }
}

Pipeline(SwitchIngressParser(),
         SwitchIngress(),
         SwitchIngressDeparser(),
         SwitchEgressParser(),
         SwitchEgress(),
         SwitchEgressDeparser()) pipe;

Switch(pipe) main;