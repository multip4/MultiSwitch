/*

Seokwon Jang

MNC Lab.

Korea University

imsoboy2@korea.ac.kr

parser.p4: To test layer by layer header extractions

//--------------------------------parser-------------------------
parser MyParser(packet_in packet,
                out headers hdr,
                inout metadata meta,
                inout standard_metadata_t standard_metadata) {
	
	state start {
		packet.extract(hdr.des_hdr); 
		meta.parser_meta.count = hdr.des_hdr.num_header;
	    	transition pp1;
	}

	state pp1 {
	meta.parser_meta.length = hdr.des_hdr.len1;
	meta.parser_meta.count = meta.parser_meta.count - 1;
	packet.extract(hdr.protocol_hdr1, (bit<32>)((bit<16>)meta.parser_meta.length));
	meta.user_meta.hdr1=hdr.protocol_hdr1.buf;
	transition select(meta.parser_meta.count){
		0 : accept;
		default: pp2;
	}
	}

	state pp2 {
	meta.parser_meta.length = hdr.des_hdr.len2;
	meta.parser_meta.count = meta.parser_meta.count - 1;
	packet.extract(hdr.protocol_hdr2, (bit<32>)((bit<16>)meta.parser_meta.length));
	meta.user_meta.hdr2=hdr.protocol_hdr2.buf;
	transition select(meta.parser_meta.count){
		0 : accept;	
		default: pp3;


	}
	}
	
	state pp3 {
	meta.parser_meta.length = hdr.des_hdr.len3;
	meta.parser_meta.count = meta.parser_meta.count - 1;
	packet.extract(hdr.protocol_hdr3, (bit<32>)((bit<16>)meta.parser_meta.length));
	meta.user_meta.hdr3=hdr.protocol_hdr3.buf;
	transition select(meta.parser_meta.count){
		0 : accept;	
		default : pp4;


	}
	}

	state pp4 {
	meta.parser_meta.length = hdr.des_hdr.len4;
	meta.parser_meta.count = meta.parser_meta.count - 1;
	packet.extract(hdr.protocol_hdr4, (bit<32>)((bit<16>)meta.parser_meta.length));
	meta.user_meta.hdr4=hdr.protocol_hdr4.buf;
	transition select(meta.parser_meta.count){
		0 : accept;	
		default : pp5;


	}
	}

	state pp5 {
	meta.parser_meta.length = hdr.des_hdr.len5;
	meta.parser_meta.count = meta.parser_meta.count - 1;
	packet.extract(hdr.protocol_hdr5, (bit<32>)((bit<16>)meta.parser_meta.length));
	meta.user_meta.hdr5=hdr.protocol_hdr5.buf;
	transition select(meta.parser_meta.count){
		0 : accept;	
		default : pp6;


	}
	}
	state pp6 {
	meta.parser_meta.length = hdr.des_hdr.len6;
	meta.parser_meta.count = meta.parser_meta.count - 1;
	packet.extract(hdr.protocol_hdr6, (bit<32>)((bit<16>)meta.parser_meta.length));
	meta.user_meta.hdr6 = hdr.protocol_hdr6.buf;
	transition select(meta.parser_meta.count ){
		0 : accept;	
		default : pp7;


	}
	}
	state pp7 {
	meta.parser_meta.length = hdr.des_hdr.len7;
	meta.parser_meta.count = meta.parser_meta.count - 1;
	packet.extract(hdr.protocol_hdr7, (bit<32>)((bit<16>)meta.parser_meta.length));
	meta.user_meta.hdr7 = hdr.protocol_hdr7.buf;
	transition select(meta.parser_meta.count){
		0 : accept;	
		default : pp8;


	}
	}
	state pp8 {
	meta.parser_meta.length = hdr.des_hdr.len8;
	meta.parser_meta.count = meta.parser_meta.count - 1;
	packet.extract(hdr.protocol_hdr8, (bit<32>)((bit<16>)meta.parser_meta.length));
	meta.user_meta.hdr8=hdr.protocol_hdr8.buf;
	transition accept;


	
	}

	


}

