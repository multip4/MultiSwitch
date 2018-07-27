/*

Seokwon Jang

MNC Lab.

Korea University

imsoboy2@korea.ac.kr

headers.p4: Define headers and metadata used in test program.


//----------------------------------------------- header definition -------------------------------------------------


header description_hdr_t {
	bit<3> num_header; 
	bit<8> len1; 
	bit<8> len2; 
	bit<8> len3; 
	bit<8> len4; 
	bit<8> len5; 
	bit<8> len6; 
	bit<8> len7; 
	bit<8> len8; 
	bit<1> vdp_id;
}



header protocol_hdr_t {
	
	varbit<256> buf;

}



//expression may be simplified by using header stucture like [MAX_Proto]~
struct headers {
	description_hdr_t des_hdr; 
	protocol_hdr_t protocol_hdr1;
	protocol_hdr_t protocol_hdr2;		
	protocol_hdr_t protocol_hdr3;
	protocol_hdr_t protocol_hdr4;
	protocol_hdr_t protocol_hdr5;
	protocol_hdr_t protocol_hdr6;
	protocol_hdr_t protocol_hdr7;
	protocol_hdr_t protocol_hdr8;
//	protocol_hdr_t protocol_hdr9;
//	protocol_hdr_t protocol_hdr10;
//	protocol_hdr_t protocol_hdr11;
//	protocol_hdr_t protocol_hdr12;
//	protocol_hdr_t protocol_hdr13;
//	protocol_hdr_t protocol_hdr14;
//	protocol_hdr_t protocol_hdr15;
//	protocol_hdr_t protocol_hdr16;
}

struct parser_metadata_t { 
	bit<8> length;
	bit<3> count;
	
}

struct user_metadata_t {
	bit<256> meta;
	bit<256> hdr1;
	bit<256> hdr2;
	bit<256> hdr3;
	bit<256> hdr4;
	bit<256> hdr5;
	bit<256> hdr6;
	bit<256> hdr7;
	bit<256> hdr8;

}

struct metadata {

	parser_metadata_t parser_meta;
	user_metadata_t user_meta;
}
