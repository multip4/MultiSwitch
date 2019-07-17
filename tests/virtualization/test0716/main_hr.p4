#include <core.p4>
#include <v1model.p4>
#include "headers.p4"
#include "metadata.p4"
#include "parser.p4"
#include "define.p4"

control MyVerifyChecksum(inout headers hdr, inout metadata meta) {   
    apply {  }
}

control MyIngress(inout headers hdr,
                  inout metadata meta,
                  inout standard_metadata_t standard_metadata) {


	action set_initial_config (bit<8> progid, bit<8> stageid, bit<3> match_bitmap, bit<3> table_chain) {
		meta.vdp_metadata.inst_id = progid; 
		meta.vdp_metadata.stage_id = stageid;
		meta.vdp_metadata.match_chain_bitmap = match_bitmap;
		meta.vdp_metadata.table_chain = table_chain;        
	}

	action do_forward(bit<9> port) {
		standard_metadata.egress_spec = port;
	}

	action no_op() {

	}

	action do_drop() {
		mark_to_drop(standard_metadata);
	}

	action set_stage_and_bitmap(bit<48> action_bitmap, bit<3> match_bitmap, bit<8> next_stage, bit<8> next_prog) {
		meta.vdp_metadata.action_chain_bitmap = action_bitmap;
		meta.vdp_metadata.match_chain_bitmap = match_bitmap;
		meta.vdp_metadata.stage_id = next_stage;
		meta.vdp_metadata.inst_id = next_prog;
		meta.vdp_metadata.action_chain_id = meta.vdp_metadata.match_chain_result;
		meta.vdp_metadata.match_chain_result = 0;
	}
		
	action set_match_result(bit<48> match_result) {
		meta.vdp_metadata.match_chain_result = match_result|meta.vdp_metadata.match_chain_result;
	}
		
	action set_action_id(bit<48> match_result, bit<48> action_bitmap, bit<3> match_bitmap, bit<8> next_stage, bit<8> next_prog) {
		set_match_result(match_result);
		set_stage_and_bitmap(action_bitmap, match_bitmap, next_stage, next_prog);
	}

	action end(bit<8> next_prog) {
		set_action_id(0,0,0,0,next_prog);
	}

	action action_do(){

	}
	
	////////////for ethernet field
	action mod_field_with_const_112(bit<112> value_112, bit<112> mask_112) {   
		hdr.hdr_112.buffer = (hdr.hdr_112.buffer&(~mask_112))|(value_112&mask_112);
	}

	action extract_temp_112(bit<112> temp_mask_112) {
		meta.temp_metadata.temp_112 = (hdr.hdr_112.buffer & temp_mask_112);
	} //extract from buffer -> temp

	action shift_112(bit<112> temp_mask_112, bit<8> l_shift, bit<8> r_shift) {
		meta.temp_metadata.temp_md_mask_112 = temp_mask_112 << l_shift;
		meta.temp_metadata.temp_md_mask_112 = temp_mask_112 >> r_shift;
		meta.temp_metadata.temp_112 = meta.temp_metadata.temp_112 << l_shift;
		meta.temp_metadata.temp_112 = meta.temp_metadata.temp_112 >> r_shift;
	}
	// shift temp, mask to indicate fields which should be modified
	// (l_shift, r_shift) = (n, 0) or (0, n)

	action mod_field_with_field_112(bit<112> temp_mask_112, bit<8>l_shift, bit<8>r_shift){
		extract_temp_112(temp_mask_112);
		shift_112(temp_mask_112, l_shift, r_shift);
		hdr.hdr_112.buffer = (hdr.hdr_112.buffer & (~meta.temp_metadata.temp_md_mask_112))|(meta.temp_metadata.temp_112&meta.temp_metadata.temp_md_mask_112);    
	}
	// temp_mask=enabled with 1 to indicate field for extractioin 
	//shift=difference between target field for modification and extracted field

	////////////for ipv4 field
	action mod_field_with_const_160_1(bit<160> value_160_1, bit<160> mask_160_1){
		hdr.hdr_160[0].buffer = (hdr.hdr_160[0].buffer&~mask_160_1)|(value_160_1&mask_160_1);
	}

	action extract_temp_160_1(bit<160> temp_mask_160_1) {
		meta.temp_metadata.temp_160_1 = (hdr.hdr_160[0].buffer & temp_mask_160_1);
	} //extract from buffer -> temp

	action shift_160_1(bit<160> temp_mask_160_1, bit<8> l_shift, bit<8> r_shift) {
		meta.temp_metadata.temp_md_mask_160_1 = temp_mask_160_1 << l_shift;
		meta.temp_metadata.temp_md_mask_160_1 = temp_mask_160_1 >> r_shift;
		meta.temp_metadata.temp_160_1 = meta.temp_metadata.temp_160_1 << l_shift;
		meta.temp_metadata.temp_160_1 = meta.temp_metadata.temp_160_1 >> r_shift;
	}
	// shift temp, mask to indicate fields which should be modified
	// (l_shift, r_shift) = (n, 0) or (0, n)

	action mod_field_with_field_160_1(bit<160> temp_mask_160_1, bit<8>l_shift, bit<8>r_shift){
		extract_temp_160_1(temp_mask_160_1);
		shift_160_1(temp_mask_160_1, l_shift, r_shift);
		hdr.hdr_160[0].buffer = (hdr.hdr_160[0].buffer & (~meta.temp_metadata.temp_md_mask_160_1))|(meta.temp_metadata.temp_160_1 & meta.temp_metadata.temp_md_mask_160_1);
	}
	// temp_mask=enabled with 1 to indicate field for extractioin 
	//shift=difference between target field for modification and extracted field

	////////////for tcp field
	action mod_field_with_const_160_2(bit<160> value_160_2, bit<160> mask_160_2){
		hdr.hdr_160[1].buffer = (hdr.hdr_160[1].buffer & ~mask_160_2)|(value_160_2 & mask_160_2);
	}

	action extract_temp_160_2(bit<160> temp_mask_160_2) {
		meta.temp_metadata.temp_160_2 = (hdr.hdr_160[1].buffer & temp_mask_160_2);
	} //extract from buffer -> temp

	action shift_160_2(bit<160> temp_mask_160_2, bit<8> l_shift, bit<8> r_shift) {
		meta.temp_metadata.temp_md_mask_160_2 = temp_mask_160_2 << l_shift;
		meta.temp_metadata.temp_md_mask_160_2 = temp_mask_160_2 >> r_shift;
		meta.temp_metadata.temp_160_2 = meta.temp_metadata.temp_160_2 << l_shift;
		meta.temp_metadata.temp_160_2 = meta.temp_metadata.temp_160_2 >> r_shift;
	}
	// shift temp, mask to indicate fields which should be modified
	// (l_shift, r_shift) = (n, 0) or (0, n)

	action mod_field_with_field_160_2(bit<160> temp_mask_160_2, bit<8>l_shift, bit<8>r_shift){
		extract_temp_160_2(temp_mask_160_2);
		shift_160_2(temp_mask_160_2, l_shift, r_shift);
		hdr.hdr_160[1].buffer = (hdr.hdr_160[1].buffer & (~meta.temp_metadata.temp_md_mask_160_2))|(meta.temp_metadata.temp_160_2 & meta.temp_metadata.temp_md_mask_160_2);
	}
	// temp_mask=enabled with 1 to indicate field for extractioin 
	//shift=difference between target field for modification and extracted field

	////////////for arp field
	action mod_field_with_const_224(bit<224> value_224, bit<224> mask_224){
		hdr.hdr_224.buffer = (hdr.hdr_224.buffer & (~mask_224))|(value_224 & mask_224);
	}

	action extract_temp_224(bit<224> temp_mask_224) {
		meta.temp_metadata.temp_224 = (hdr.hdr_224.buffer & temp_mask_224);
	} 
	//extract from buffer, put to temp

	action shift_224(bit<224> temp_mask_224, bit<8> l_shift, bit<8> r_shift) {
		meta.temp_metadata.temp_md_mask_224 = temp_mask_224 << l_shift;
		meta.temp_metadata.temp_md_mask_224 = temp_mask_224 >> r_shift;
		meta.temp_metadata.temp_224 = meta.temp_metadata.temp_224 << l_shift;
		meta.temp_metadata.temp_224 = meta.temp_metadata.temp_224 >> r_shift;
	} 
	// shift temp, mask to indicate fields which should be modified
	// (l_shift, r_shift) = (n, 0) or (0, n)

	action mod_field_with_field_224(bit<224> temp_mask_224, bit<8>l_shift, bit<8>r_shift){
		extract_temp_224(temp_mask_224);
		shift_224(temp_mask_224, l_shift, r_shift);
		hdr.hdr_224.buffer = (hdr.hdr_224.buffer & (~meta.temp_metadata.temp_md_mask_224))|(meta.temp_metadata.temp_224 & meta.temp_metadata.temp_md_mask_224);
	} 
	//temp_mask=enabled with 1 to indicate field for extraction 
	//shift=difference between target field for modification and extracted field

	action response(){
		standard_metadata.egress_spec = standard_metadata.ingress_port;
	}

	/*
	------------meta.vdp_metadata.inst_id == 1 -- arp_proxy_head-----------------
	*/

	action arp_reply(   bit<224> mask_arp_sender_MAC, bit<8> l_shift_arp_sender_MAC, bit<8> r_shift_arp_sender_MAC, 
						bit<224> mask_arp_send_ip , bit<8> l_shift_arp_send_ip, bit<8> r_shift_arp_send_ip,
						bit<112> mask_ethernet_src, bit<8> l_shift_ethernet_src, bit<8> r_shift_ethernet_src,
						bit<224> value_arp_sender_MAC,
						bit<224> value_arp_sender_IP,
						bit<112> value_ethernet_src,
						bit<224> mask_arp_opcode ) {
		response();
		mod_field_with_field_224(mask_arp_sender_MAC, l_shift_arp_sender_MAC, r_shift_arp_sender_MAC);
		mod_field_with_field_224(mask_arp_send_ip, l_shift_arp_send_ip, r_shift_arp_send_ip);
		mod_field_with_field_112(mask_ethernet_src, l_shift_ethernet_src, r_shift_ethernet_src);
		mod_field_with_const_224(value_arp_sender_MAC, mask_arp_sender_MAC);
		mod_field_with_const_224(value_arp_sender_IP, mask_arp_send_ip);
		mod_field_with_const_112(value_ethernet_src, mask_ethernet_src);
		mod_field_with_const_224(2, mask_arp_opcode);
	}
	////////////////Does need marking to indicate the end of do-action phase ?
	/*
	------------meta.vdp_metadata.inst_id == 1 -- arp_proxy_tail-------------------------
	*/
	/*
	------------meta.vdp_metadata.inst_id == 2 -- l2_switch_head-------------------------
	*/
		action l2_switch_forward(bit<9> port) {
			do_forward(port);
		}
	/*
	------------meta.vdp_metadata.inst_id == 2 -- l2_switch_tail-------------------------
	*/
	/*
	------------meta.vdp_metadata.inst_id == 3 -- FW_head-------------------------
	*/
		action FW_forward (bit<9> port) {
			do_forward(port);
		}		
	/*
	------------meta.vdp_metadata.inst_id == 3 -- FW_tail-------------------------
	*/
	/*
	------------meta.vdp_metadata.inst_id == 4 -- NAT_head-------------------------
	*/
		action NAT_nat_input_output(bit<160> value_IP_dstAddr, bit<160> mask_IP_dstAddr,
									bit<160> value_IP_srcAddr, bit<160> mask_IP_srcAddr ) {
			mod_field_with_const_160_1(value_IP_dstAddr, mask_IP_dstAddr);
			mod_field_with_const_160_1(value_IP_srcAddr, mask_IP_srcAddr);
		}

		action NAT_set_dmac (bit<112> value_ethernet_dmac, bit<112> mask_ethernet_dstAddr,
							bit<9> port ) {
			mod_field_with_const_112(value_ethernet_dmac, mask_ethernet_dstAddr);
			do_forward(port);
		}

		action NAT_send_frame (bit<112> value_ethernet_smac, bit<112> mask_ethernet_srcAddr) {
			mod_field_with_const_112(value_ethernet_smac, mask_ethernet_srcAddr);
		}

		action NAT (bit<160> value_IP_dstAddr, bit<160> mask_IP_dstAddr,
					bit<160> value_IP_srcAddr, bit<160> mask_IP_srcAddr,
					bit<112> value_ethernet_dmac, bit<112> mask_ethernet_dstAddr,
					bit<9> port,
					bit<112> value_ethernet_smac, bit<112> mask_ethernet_srcAddr ) {
			NAT_nat_input_output (value_IP_dstAddr, mask_IP_dstAddr, value_IP_srcAddr, mask_IP_srcAddr);
			NAT_set_dmac (value_ethernet_dmac, mask_ethernet_dstAddr, port);
			NAT_send_frame (value_ethernet_smac, mask_ethernet_srcAddr);
		}
	/*
	------------meta.vdp_metadata.inst_id == 4 -- NAT_tail-------------------------
	*/
	/*
	------------table for function------------
	*/
	table action_vdp1_1 {
		key = {
			
		}
		actions = {
			arp_reply;						
		}
	}
	table action_vdp1_2 {
		key = {
			
		}
		actions = {
			arp_reply;						
		}
	}
	table action_vdp1_3 {
		key = {
			
		}
		actions = {
			arp_reply;						
		}
	}
	table action_vdp1_4{
		key = {
			
		}
		actions = {
			arp_reply;						
		}
	}
	
	table action_vdp2_1 {
		key = {
			
		}
		actions = {
			l2_switch_forward;						
		}
	}

	table action_vdp2_2 {
		key = {
			
		}
		actions = {
			l2_switch_forward;						
		}
	}
	
	table action_vdp2_3 {
		key = {
			
		}
		actions = {
			l2_switch_forward;						
		}
	}
	
	table action_vdp2_4 {
		key = {
			
		}
		actions = {
			l2_switch_forward;						
		}
	}
	
	table action_vdp3_1 {
		key = {
			
		}
		actions = {
			do_drop;
			no_op;
			FW_forward;
		}
	}
    	
	table action_vdp3_2 {
		key = {
			
		}
		actions = {
			do_drop;
			no_op;
			FW_forward;
		}
	}
	    	
	table action_vdp3_3 {
		key = {
			
		}
		actions = {
			do_drop;
			no_op;
			FW_forward;
		}
	}

	table action_vdp3_4 {
		key = {
			
		}
		actions = {
			do_drop;
			no_op;
			FW_forward;
		}
	}
	
	table action_vdp4_1 {
		key = {
			
		}
		actions = {
			NAT;
		}
	}

	table action_vdp4_2 {
		key = {
			
		}
		actions = {
			NAT;
		}
	}
	table action_vdp4_3 {
		key = {
			
		}
		actions = {
			NAT;
		}
	}
	table action_vdp4_4 {
		key = {
			
		}
		actions = {
			NAT;
		}
	}

////////////////////////////////////////////////////////////TABLES//////////////////////////////////////////////////////////////////////                

	table table_config_at_initial {
		key = {
			hdr.desc_hdr.vdp_id: exact;        //At initial state, 1,2,3,4  
			meta.vdp_metadata.inst_id: exact;  //At initial state, it should be 0
			meta.vdp_metadata.stage_id: exact; //At initial state, it should be 0
		}
		actions = {
			set_initial_config();
		}
	}    

	table table_header_match_112_1_stage1 {                                          
		key = {                                                                 
			meta.vdp_metadata.inst_id : exact ;                                		
			meta.vdp_metadata.stage_id : exact ;                                  	
			hdr.hdr_112.buffer : ternary ;                                   	
		}                                                                       
		actions = { 																
			set_action_id;                                                        
			end;							                                    
		}    									                                
	}

	table table_header_match_112_1_stage2 {                                          
		key = {                                                                 
			meta.vdp_metadata.inst_id : exact ;                                		
			meta.vdp_metadata.stage_id : exact ;                                  	
			hdr.hdr_112.buffer : ternary ;                                   	
		}                                                                       
		actions = { 																
			set_action_id;                                                        
			end;							                                    
		}    									                                
	}       
	table table_header_match_112_1_stage3 {                                          
		key = {                                                                 
			meta.vdp_metadata.inst_id : exact ;                                		
			meta.vdp_metadata.stage_id : exact ;                                  	
			hdr.hdr_112.buffer : ternary ;                                   	
		}                                                                       
		actions = { 																
			set_action_id;                                                        
			end;							                                    
		}    									                                
	}       
	table table_header_match_112_1_stage4 {                                          
		key = {                                                                 
			meta.vdp_metadata.inst_id : exact ;                                		
			meta.vdp_metadata.stage_id : exact ;                                  	
			hdr.hdr_112.buffer : ternary ;                                   	
		}                                                                       
		actions = { 																
			set_action_id;                                                        
			end;							                                    
		}    									                                
	}


	table table_header_match_160_1_stage1 {                                        
		key = {                                                                 
			meta.vdp_metadata.inst_id : exact ;                                		
			meta.vdp_metadata.stage_id : exact ;                                  	
			hdr.hdr_160[0].buffer : ternary ;                                 	
		}                                                                       
		actions = { 																
			set_action_id;                                                        
			end;							                                    
		}    									                                
	}
	table table_header_match_160_1_stage2 {                                        
		key = {                                                                 
			meta.vdp_metadata.inst_id : exact ;                                		
			meta.vdp_metadata.stage_id : exact ;                                  	
			hdr.hdr_160[0].buffer : ternary ;                                 	
		}                                                                       
		actions = { 																
			set_action_id;                                                        
			end;							                                    
		}    									                                
	}
	table table_header_match_160_1_stage3 {                                        
		key = {                                                                 
			meta.vdp_metadata.inst_id : exact ;                                		
			meta.vdp_metadata.stage_id : exact ;                                  	
			hdr.hdr_160[0].buffer : ternary ;                                 	
		}                                                                       
		actions = { 																
			set_action_id;                                                        
			end;							                                    
		}    									                                
	} 
	table table_header_match_160_1_stage4 {                                        
		key = {                                                                 
			meta.vdp_metadata.inst_id : exact ;                                		
			meta.vdp_metadata.stage_id : exact ;                                  	
			hdr.hdr_160[0].buffer : ternary ;                                 	
		}                                                                       
		actions = { 																
			set_action_id;                                                        
			end;							                                    
		}    									                                
	}

	table table_header_match_160_2_stage1 {                                        
		key = {                                                                 
			meta.vdp_metadata.inst_id : exact ;                                		
			meta.vdp_metadata.stage_id : exact ;                                  	
			hdr.hdr_160[1].buffer : ternary ;                                  	
		}                                                                       
		actions = { 																
			set_action_id;                                                          
			end;							                                    
		}    									                                
	}
	table table_header_match_160_2_stage2 {                                        
		key = {                                                                 
			meta.vdp_metadata.inst_id : exact ;                                		
			meta.vdp_metadata.stage_id : exact ;                                  	
			hdr.hdr_160[1].buffer : ternary ;                                  	
		}                                                                       
		actions = { 																
			set_action_id;                                                          
			end;							                                    
		}    									                                
	}
	table table_header_match_160_2_stage3 {                                        
		key = {                                                                 
			meta.vdp_metadata.inst_id : exact ;                                		
			meta.vdp_metadata.stage_id : exact ;                                  	
			hdr.hdr_160[1].buffer : ternary ;                                  	
		}                                                                       
		actions = { 																
			set_action_id;                                                          
			end;							                                    
		}    									                                
	} 
	table table_header_match_160_2_stage4 {                                        
		key = {                                                                 
			meta.vdp_metadata.inst_id : exact ;                                		
			meta.vdp_metadata.stage_id : exact ;                                  	
			hdr.hdr_160[1].buffer : ternary ;                                  	
		}                                                                       
		actions = { 																
			set_action_id;                                                          
			end;							                                    
		}    									                                
	}

	table table_header_match_224_1_stage1 {                                          
		key = {                                                                
			meta.vdp_metadata.inst_id : exact ;                                		
			meta.vdp_metadata.stage_id : exact ;                                
			hdr.hdr_224.buffer : ternary ;                                   	
		}                                                                       
		actions = { 																
			set_action_id;                                                          
			end;							                                    
		}    									                                
	} 
	table table_header_match_224_1_stage2 {                                          
		key = {                                                                
			meta.vdp_metadata.inst_id : exact ;                                		
			meta.vdp_metadata.stage_id : exact ;                                
			hdr.hdr_224.buffer : ternary ;                                   	
		}                                                                       
		actions = { 																
			set_action_id;                                                          
			end;							                                    
		}    									                                
	}
	table table_header_match_224_1_stage3 {                                          
		key = {                                                                
			meta.vdp_metadata.inst_id : exact ;                                		
			meta.vdp_metadata.stage_id : exact ;                                
			hdr.hdr_224.buffer : ternary ;                                   	
		}                                                                       
		actions = { 																
			set_action_id;                                                          
			end;							                                    
		}    									                                
	} 
	table table_header_match_224_1_stage4 {                                          
		key = {                                                                
			meta.vdp_metadata.inst_id : exact ;                                		
			meta.vdp_metadata.stage_id : exact ;                                
			hdr.hdr_224.buffer : ternary ;                                   	
		}                                                                       
		actions = { 																
			set_action_id;                                                          
			end;							                                    
		}    									                                
	}                                                                            
	table table_std_meta_match_stage1 {                                            
		key = {                                                                  
			meta.vdp_metadata.inst_id : exact ;                                		
			meta.vdp_metadata.stage_id : exact ;                                  	
			standard_metadata.ingress_port : ternary ;                          
			standard_metadata.egress_spec : ternary ;                           
			standard_metadata.instance_type : ternary ;                         
		}                                                                       
		actions = { 																
			set_action_id;														
			end;                                                                        
		}									                                    
	}
	table table_std_meta_match_stage2 {                                            
		key = {                                                                  
			meta.vdp_metadata.inst_id : exact ;                                		
			meta.vdp_metadata.stage_id : exact ;                                  	
			standard_metadata.ingress_port : ternary ;                          
			standard_metadata.egress_spec : ternary ;                           
			standard_metadata.instance_type : ternary ;                         
		}                                                                       
		actions = { 																
			set_action_id;														
			end;                                                                        
		}									                                    
	}
	table table_std_meta_match_stage3 {                                            
		key = {                                                                  
			meta.vdp_metadata.inst_id : exact ;                                		
			meta.vdp_metadata.stage_id : exact ;                                  	
			standard_metadata.ingress_port : ternary ;                          
			standard_metadata.egress_spec : ternary ;                           
			standard_metadata.instance_type : ternary ;                         
		}                                                                       
		actions = { 																
			set_action_id;														
			end;                                                                        
		}									                                    
	}
	table table_std_meta_match_stage4 {                                            
		key = {                                                                  
			meta.vdp_metadata.inst_id : exact ;                                		
			meta.vdp_metadata.stage_id : exact ;                                  	
			standard_metadata.ingress_port : ternary ;                          
			standard_metadata.egress_spec : ternary ;                           
			standard_metadata.instance_type : ternary ;                         
		}                                                                       
		actions = { 																
			set_action_id;														
			end;                                                                        
		}									                                    
	}                                                                              
	table table_user_meta_stage1 {	                                                
		key = {                             				                    
			meta.vdp_metadata.inst_id 		: exact ;       				        
			meta.vdp_metadata.stage_id 		: exact ;   	               			
			meta.user_metadata.meta 	        : ternary;	            				
		}                                                       				
		actions = { 																
			set_action_id;                                                      
			end;																
		}                    													
	}
	table table_user_meta_stage2 {	                                                
		key = {                             				                    
			meta.vdp_metadata.inst_id 		: exact ;       				        
			meta.vdp_metadata.stage_id 		: exact ;   	               			
			meta.user_metadata.meta 	        : ternary;	            				
		}                                                       				
		actions = { 																
			set_action_id;                                                      
			end;																
		}                    													
	}
	table table_user_meta_stage3 {	                                                
		key = {                             				                    
			meta.vdp_metadata.inst_id 		: exact ;       				        
			meta.vdp_metadata.stage_id 		: exact ;   	               			
			meta.user_metadata.meta 	        : ternary;	            				
		}                                                       				
		actions = { 																
			set_action_id;                                                      
			end;																
		}                    													
	}
	table table_user_meta_stage4 {	                                                
		key = {                             				                    
			meta.vdp_metadata.inst_id 		: exact ;       				        
			meta.vdp_metadata.stage_id 		: exact ;   	               			
			meta.user_metadata.meta 	        : ternary;	            				
		}                                                       				
		actions = { 																
			set_action_id;                                                      
			end;																
		}                    													
	}                                                                           
    apply {
        if (PROG_ID == 0) { // TBD-define
            table_config_at_initial.apply(); 
        }
        
        if (PROG_ID != 0) {
            ////////////////////////////////////////STAGE1/////////////////////////////////////////
            if((meta.vdp_metadata.stage_id & CONST_NUM_OF_STAGE) == CONST_STAGE_1){
                if((meta.vdp_metadata.match_chain_bitmap & BIT_MASK_HEADER) != 0){
                    if(meta.vdp_metadata.table_chain&1 != 0)
                      table_header_match_112_1_stage1.apply();
                    else if(meta.vdp_metadata.table_chain&2 != 0)
                      table_header_match_160_1_stage1.apply();
                    else if(meta.vdp_metadata.table_chain&3 != 0)
                      table_header_match_160_2_stage1.apply();
                    else if(meta.vdp_metadata.table_chain&4 != 0)
                      table_header_match_224_1_stage1.apply();
                }
				if (meta.vdp_metadata.match_chain_bitmap & BIT_MASK_STD_META !=0 ){
						table_std_meta_match_stage1.apply();
				}
				if (meta.vdp_metadata.match_chain_bitmap & BIT_MASK_USER_META !=0){
						table_user_meta_stage1.apply();
				}
				if (ACTION_BITMAP != 0){
					if(ACTION_BITMAP == 1)
						action_vdp1_1.apply();
					if(ACTION_BITMAP == 2)
						action_vdp2_1.apply();
					if(ACTION_BITMAP == 4)
						action_vdp3_1.apply();
					if(ACTION_BITMAP == 8)
						action_vdp4_1.apply();
				}
			}
            ////////////////////////////////////////STAGE2/////////////////////////////////////////
            if((meta.vdp_metadata.stage_id & CONST_NUM_OF_STAGE) == CONST_STAGE_2){
                if((meta.vdp_metadata.match_chain_bitmap & BIT_MASK_HEADER) != 0){
                    if(meta.vdp_metadata.table_chain&1 != 0)
                      table_header_match_112_1_stage2.apply();
                    else if(meta.vdp_metadata.table_chain&2 != 0)
                      table_header_match_160_1_stage2.apply();
                    else if(meta.vdp_metadata.table_chain&3 != 0)
                      table_header_match_160_2_stage2.apply();
                    else if(meta.vdp_metadata.table_chain&4 != 0)
                      table_header_match_224_1_stage2.apply();
                }
				if (meta.vdp_metadata.match_chain_bitmap & BIT_MASK_STD_META !=0 ){
						table_std_meta_match_stage2.apply();
				}
				if (meta.vdp_metadata.match_chain_bitmap & BIT_MASK_USER_META !=0){
						table_user_meta_stage2.apply();
				}
				if (ACTION_BITMAP != 0){
					if(ACTION_BITMAP == 1)
						action_vdp1_2.apply();
					if(ACTION_BITMAP == 2)
						action_vdp2_2.apply();
					if(ACTION_BITMAP == 4)
						action_vdp3_2.apply();
					if(ACTION_BITMAP == 8)
						action_vdp4_2.apply();
				}
			}
            ////////////////////////////////////////STAGE3/////////////////////////////////////////

            if((meta.vdp_metadata.stage_id & CONST_NUM_OF_STAGE) == CONST_STAGE_3){
                if((meta.vdp_metadata.match_chain_bitmap & BIT_MASK_HEADER) != 0){
                    if(meta.vdp_metadata.table_chain&1 != 0)
                      table_header_match_112_1_stage3.apply();
                    else if(meta.vdp_metadata.table_chain&2 != 0)
                      table_header_match_160_1_stage3.apply();
                    else if(meta.vdp_metadata.table_chain&3 != 0)
                      table_header_match_160_2_stage3.apply();
                    else if(meta.vdp_metadata.table_chain&4 != 0)
                      table_header_match_224_1_stage3.apply();
                }
				if (meta.vdp_metadata.match_chain_bitmap & BIT_MASK_STD_META !=0 ){
						table_std_meta_match_stage3.apply();
				}
				if (meta.vdp_metadata.match_chain_bitmap & BIT_MASK_USER_META !=0){
						table_user_meta_stage3.apply();
				}
				if (ACTION_BITMAP != 0){
					if(ACTION_BITMAP == 1)
						action_vdp1_3.apply();
					if(ACTION_BITMAP == 2)
						action_vdp2_3.apply();
					if(ACTION_BITMAP == 4)
						action_vdp3_3.apply();
					if(ACTION_BITMAP == 8)
						action_vdp4_3.apply();
				}                               
            }
            ////////////////////////////////////////STAGE4/////////////////////////////////////////
            if((meta.vdp_metadata.stage_id & CONST_NUM_OF_STAGE) == CONST_STAGE_4){
                if((meta.vdp_metadata.match_chain_bitmap & BIT_MASK_HEADER) != 0){
                    if(meta.vdp_metadata.table_chain&1 != 0)
                      table_header_match_112_1_stage4.apply();
                    else if(meta.vdp_metadata.table_chain&2 != 0)
                      table_header_match_160_1_stage4.apply();
                    else if(meta.vdp_metadata.table_chain&3 != 0)
                      table_header_match_160_2_stage4.apply();
                    else if(meta.vdp_metadata.table_chain&4 != 0)
                      table_header_match_224_1_stage4.apply();
                }
				if (meta.vdp_metadata.match_chain_bitmap & BIT_MASK_STD_META !=0 ){
						table_std_meta_match_stage4.apply();
				}
				if (meta.vdp_metadata.match_chain_bitmap & BIT_MASK_USER_META !=0){
						table_user_meta_stage4.apply();
				}
				if (ACTION_BITMAP != 0){
					if(ACTION_BITMAP == 1)
						action_vdp1_4.apply();
					if(ACTION_BITMAP == 2)
						action_vdp2_4.apply();
					if(ACTION_BITMAP == 4)
						action_vdp3_4.apply();
					if(ACTION_BITMAP == 8)
						action_vdp4_4.apply();
				}                              
            }
        } 
    }
   
    

}


control MyEgress(inout headers hdr,
                 inout metadata meta,
                 inout standard_metadata_t standard_metadata) {
    apply { 
        
    }
}

control MyComputeChecksum(inout headers  hdr, inout metadata meta) {
     apply {
    }
}

control MyDeparser(packet_out packet, in headers hdr) {
    apply {
        packet.emit(hdr.hdr_112);
        packet.emit(hdr.desc_hdr);
        packet.emit(hdr.hdr_224);
        packet.emit(hdr.hdr_160[0]);
        packet.emit(hdr.hdr_160[1]);
        packet.emit(hdr.hdr_64);
    }
}

V1Switch(
MyParser(),
MyVerifyChecksum(),
MyIngress(),
MyEgress(),
MyComputeChecksum(),
MyDeparser()
) main;
