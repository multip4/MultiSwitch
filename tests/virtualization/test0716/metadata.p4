#ifndef _METADATA_
#define _METADATA_


struct vdp_metadata_t {
    bit<8> inst_id;
    bit<8> stage_id;
    bit<3> match_chain_bitmap;
    bit<48> match_chain_result;
    bit<48> action_chain_bitmap;
    bit<48> action_chain_id;
    bit<4>  table_chain;
}

struct user_metadata_t {
    bit<256> meta;

}

struct temp_metadata_t {
    bit<112> temp_112;
    bit<112> temp_md_mask_112;
    bit<160> temp_160_1;
    bit<160> temp_md_mask_160_1;
    bit<160> temp_160_2;
    bit<160> temp_md_mask_160_2;
    bit<224> temp_224;
    bit<224> temp_md_mask_224;
}

struct metadata {
    vdp_metadata_t vdp_metadata;
    user_metadata_t user_metadata;
    temp_metadata_t temp_metadata;
}


#endif
