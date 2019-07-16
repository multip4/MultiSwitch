#ifndef _HEADERS_
#define _HEADERS_

#define MAX_LEN 2

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

//L3
header hdr_224_t {
    bit<224> buffer;
}

//L4
header hdr_64_t {
    bit<64> buf;
}


struct headers {
    description_hdr_t  desc_hdr;
    hdr_112_t          hdr_112;
    hdr_160_t[MAX_LEN] hdr_160;
    hdr_224_t          hdr_224;
    hdr_64_t           hdr_64;
    	
}


#endif
