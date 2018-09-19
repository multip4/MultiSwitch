/*

Seokwon Jang

MNC Lab.

Korea University

imsoboy2@korea.ac.kr

*/

// VarbitParser: Extract original packet headers by reffering to description header information

parser VarbitParser(packet_in packet,
                out headers hdr,
                inout metadata meta,
                inout standard_metadata_t standard_metadata) {
//Description header = [Program_ID] / [Num of headers]	/ [hdr_stack[0] ... / [hdr_stack[N]
	state start {
		packet.extract(hdr.des_hdr); 
		meta.v_meta.id = hdr.desc_hdr.programID;
		meta.parser_meta.count = hdr.des_hdr.num_header;
		transition parse_hdr1;
	}

	state parse_hdr1 {
		meta.parser_meta.length = hdr.des_hdr.len1;
		meta.parser_meta.count = meta.parser_meta.count - 1;
		packet.extract(hdr.hdr_stack[0], (bit<32>) (8 * (bit<6>)meta.parser_meta.length));
		transition select(meta.parser_meta.count){
			0 : accept;
			default: parse_hdr2;
		}
	}

	state parse_hdr2 {
		meta.parser_meta.length = hdr.des_hdr.len2;
		meta.parser_meta.count = meta.parser_meta.count - 1;
		packet.extract(hdr.hdr_stack[1], (bit<32>) (8 * (bit<6>)meta.parser_meta.length));
		transition select(meta.parser_meta.count){
			0 : accept;	
			default: parse_hdr3;

		}
	}
	
	state parse_hdr3 {
	meta.parser_meta.length = hdr.des_hdr.len3;
	meta.parser_meta.count = meta.parser_meta.count - 1;
	packet.extracthdr.hdr_stack[2], (bit<32>) (8 * (bit<5>)meta.parser_meta.length));
	transition select(meta.parser_meta.count){
		0 : accept;	
		default : parse_hdr4;


	}
	}

	state parse_hdr4 {
	meta.parser_meta.length = hdr.des_hdr.len4;
	meta.parser_meta.count = meta.parser_meta.count - 1;
	packet.extract(hdr.hdr_stack[3], (bit<32>)((bit<8>)meta.parser_meta.length));
	transition select(meta.parser_meta.count){
		0 : accept;	
		default : parse_hdr5;


	}
	}

	state parse_hdr5 {
	meta.parser_meta.length = hdr.des_hdr.len5;
	meta.parser_meta.count = meta.parser_meta.count - 1;
	packet.extract(hdr.hdr_stack[4], (bit<32>)((bit<8>)meta.parser_meta.length));
	transition select(meta.parser_meta.count){
		0 : accept;	
		default : parse_hdr6;


	}
	}
	state parse_hdr6 {
	meta.parser_meta.length = hdr.des_hdr.len6;
	meta.parser_meta.count = meta.parser_meta.count - 1;
	packet.extract(hdr.hdr_stack[5], (bit<32>)((bit<8>)meta.parser_meta.length));
	transition select(meta.parser_meta.count ){
		0 : accept;	
		default : parse_hdr7;


	}
	}
	state parse_hdr7 {
	meta.parser_meta.length = hdr.des_hdr.len7;
	meta.parser_meta.count = meta.parser_meta.count - 1;
	packet.extract(hdr.hdr_stack[6], (bit<32>)((bit<8>)meta.parser_meta.length));
	transition select(meta.parser_meta.count){
		0 : accept;	
		default : parse_hdr8;


	}
	}
	state parse_hdr8 {
	meta.parser_meta.length = hdr.des_hdr.len8;
	meta.parser_meta.count = meta.parser_meta.count - 1;
	packet.extract(hdr.hdr_stack[7], (bit<32>)((bit<8>)meta.parser_meta.length));
	transition accept;


	
	}

	


}
