#ifndef _METADATA_
#define _METADATA_

struct vdp_metadata_t {
    bit<8> inst_id;
    bit<8> stage_id;
    bit<3> match_chain_bitmap;
    bit<48> match_chain_result;
    bit<48> action_chain_bitmap;
    bit<48> action_chain_id;
    bit<3>  table_chain;
}

struct user_metadata_t {
    bit<256> meta;

}


struct metadata {
    
    vdp_metadata_t vdp_metadata;
    user_metadata_t user_metadata;
}


#endif
