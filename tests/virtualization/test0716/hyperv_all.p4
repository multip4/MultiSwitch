/* Copyright 2016-present NetArch Lab, Tsinghua University.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

/////////////////codemark///////////////#include "include/intrinsic.p4"
/**
 * queuing_metadata_t
 * Metadata related metadata.
 */
header_type queueing_metadata_t {
    fields {
        enq_timestamp : 48;
        enq_qdepth    : 16;
        deq_timedelta : 32;
        deq_qdepth    : 16;
    }
}

metadata queueing_metadata_t queueing_metadata;


/**
 * intrinsic_metadata_t
 * Predefined metadata related with targets.
 */
header_type intrinsic_metadata_t {
    fields {
        ingress_global_timestamp : 48;
        lf_field_list            : 8 ;
        mcast_grp                : 16;
        egress_rid               : 16;
        resubmit_flag            : 8 ;
        recirculate_flag         : 8 ;
        //qid                      : 8 ; //hr-modified
    }
}

metadata intrinsic_metadata_t intrinsic_metadata;

/////////////////codemark///////////////#include "include/define.p4"

// primitive actions

#define PRIMITIVE_ACTION_ADD_HEDAER                          0
#define PRIMITIVE_ACTION_COPY_HEADER                         1
#define PRIMITIVE_ACTION_REMOVE_HEDAER                       2
#define PRIMITIVE_ACTION_MODIFY_FIELD                        3
#define PRIMITIVE_ACTION_ADD_TO_FIELD                        4
#define PRIMITIVE_ACTION_ADD                                 5
#define PRIMITIVE_ACTION_SUBTRACT_FROM_FIELD                 6
#define PRIMITIVE_ACTION_SUBTRACT                            7
#define PRIMITIVE_ACTION_MODIFY_FIELD_WITH_HASH_BASED_OFFSET 8
#define PRIMITIVE_ACTION_MODIFY_FIELD_RNG_UNIFORM            9
#define PRIMITIVE_ACTION_BIT_AND                             10
#define PRIMITIVE_ACTION_BIT_OR                              11
#define PRIMITIVE_ACTION_BIT_XOR                             12
#define PRIMITIVE_ACTION_SHIFT_LEFT                          13
#define PRIMITIVE_ACTION_SHIFT_RIGHT                         14
#define PRIMITIVE_ACTION_TRUNCATE                            15
#define PRIMITIVE_ACTION_DROP                                16
#define PRIMITIVE_ACTION_NO_OP                               17
#define PRIMITIVE_ACTION_PUSH                                18
#define PRIMITIVE_ACTION_POP                                 19
#define PRIMITIVE_ACTION_COUNT                               20
#define PRIMITIVE_ACTION_EXECUTE_METER                       21
#define PRIMITIVE_ACTION_REGISTER_READ                       22
#define PRIMITIVE_ACTION_REGISTER_WRITE                      23
#define PRIMITIVE_ACTION_GENERATE_DIGEST                     24
#define PRIMITIVE_ACTION_RESUBMIT                            25
#define PRIMITIVE_ACTION_RECIRCULATE                         26
#define PRIMITIVE_ACTION_CLONE_I2I                           27
#define PRIMITIVE_ACTION_CLONE_E2I                           28
#define PRIMITIVE_ACTION_CLONE_I2E                           29
#define PRIMITIVE_ACTION_CLONE_E2E                           30
#define EXTEND_ACTION_MODIFY_HEADER_WITH_CONST               31
#define EXTEND_ACTION_MODIFY_METADATA_WITH_CONST             32
#define EXTEND_ACTION_MODIFY_HEADER_WITH_METADATA            33
#define EXTEND_ACTION_MODIFY_METADATA_WITH_METADATA          34
#define EXTEND_ACTION_MODIFY_HEADER_WITH_HEADER              35
#define EXTEND_ACTION_MODIFY_METADATA_WITH_HEADER            36
#define EXTEND_ACTION_MODIFY_STANDARD_METADATA               37
#define EXTEND_ACTION_HASH                                   38
#define EXTEND_ACTION_PROFILE                                39

// MASK
#define BIT_MASK_MOD_HEADER_WITH_CONST                       (1<<EXTEND_ACTION_MODIFY_HEADER_WITH_CONST)
#define BIT_MASK_MOD_META_WITH_CONST                         (1<<EXTEND_ACTION_MODIFY_METADATA_WITH_CONST)
#define BIT_MASK_MOD_HEADER_WITH_META                        (1<<EXTEND_ACTION_MODIFY_HEADER_WITH_METADATA)
#define BIT_MASK_MOD_META_WITH_META                          (1<<EXTEND_ACTION_MODIFY_METADATA_WITH_METADATA)
#define BIT_MASK_MOD_HEADER_WITH_HEADER                      (1<<EXTEND_ACTION_MODIFY_HEADER_WITH_HEADER)
#define BIT_MASK_MOD_META_WITH_HEADER                        (1<<EXTEND_ACTION_MODIFY_METADATA_WITH_HEADER)
#define BIT_MASK_MOD_STD_META                                (1<<EXTEND_ACTION_MODIFY_STANDARD_METADATA)

#define BIT_MASK_ADD_HEDAER                                  (1<<PRIMITIVE_ACTION_ADD_HEDAER)
#define BIT_MASK_COPY_HEADER                                 (1<<PRIMITIVE_ACTION_COPY_HEADER)
#define BIT_MASK_REMOVE_HEADER                               (1<<PRIMITIVE_ACTION_REMOVE_HEDAER)
#define BIT_MASK_GENERATE_DIGIST                             (1<<PRIMITIVE_ACTION_GENERATE_DIGEST)

#define BIT_MASK_ADD                                         ((1<<PRIMITIVE_ACTION_ADD_TO_FIELD) | (1<<PRIMITIVE_ACTION_ADD))
#define BIT_MASK_SUBTRACT                                    ((1<<PRIMITIVE_ACTION_SUBTRACT_FROM_FIELD) | (1<<PRIMITIVE_ACTION_SUBTRACT))
#define BIT_MASK_REGISTER                                    ((1<<PRIMITIVE_ACTION_REGISTER_READ) | (1<<PRIMITIVE_ACTION_REGISTER_WRITE))
#define BIT_MASK_COUNTER                                     ((1<<PRIMITIVE_ACTION_COUNT))

#define BIT_MASK_DROP                                        (1<<PRIMITIVE_ACTION_DROP)
#define BIT_MASK_BIT_OR                                      (1<<PRIMITIVE_ACTION_BIT_OR)
#define BIT_MASK_BIT_XOR                                     (1<<PRIMITIVE_ACTION_BIT_XOR)
#define BIT_MASK_BIT_AND                                     (1<<PRIMITIVE_ACTION_BIT_AND)
#define BIT_MASK_TRUNCATE                                    (1<<PRIMITIVE_ACTION_TRUNCATE)
#define BIT_MASK_HASH                                        (1<<EXTEND_ACTION_HASH)
#define BIT_MASK_PROFILE                                     (1<<EXTEND_ACTION_PROFILE)

// STAGE
#define CONST_NUM_OF_STAGE			0x1f
#define CONST_STAGE_1				1
#define	CONST_STAGE_2				2
#define	CONST_STAGE_3				3
#define	CONST_STAGE_4				4
#define CONST_STAGE_5				5
#define	CONST_STAGE_6				6
#define	CONST_STAGE_7				7
#define	CONST_STAGE_8				8
#define	CONST_STAGE_9				9
#define CONST_CONDITIONAL_STAGE_1				10
#define	CONST_CONDITIONAL_STAGE_2				11
#define	CONST_CONDITIONAL_STAGE_3				12
#define	CONST_CONDITIONAL_STAGE_4				13
#define CONST_CONDITIONAL_STAGE_5				14
#define	CONST_CONDITIONAL_STAGE_6				15
#define	CONST_CONDITIONAL_STAGE_7				16
#define	CONST_CONDITIONAL_STAGE_8				17
#define	CONST_CONDITIONAL_STAGE_9				18

// Match bitmap
#define BIT_MASK_STD_META     1
#define BIT_MASK_USER_META    2
#define BIT_MASK_HEADER       4

#define USER_META     		user_metadata.meta
#define LOAD_HEADER   		user_metadata.load_header
#define HEADER_LENGTH 		desc_hdr.len
#define HEADER_FLAG         desc_hdr.flag
#define POLICY_ID     		vdp_metadata.vdp_id
#define REMOVE_OR_ADD_FLAG 	vdp_metadata.remove_or_add_flag
#define STAGE_ID            vdp_metadata.stage_id
#define PROGRAM_ID  	    vdp_metadata.inst_id
#define MATCH_RESULT 	    vdp_metadata.match_chain_result
#define ACTION_BITMAP 	    vdp_metadata.action_chain_bitmap
#define MOD_FLAG            vdp_metadata.mod_flag
#define ACTION_ID           vdp_metadata.action_chain_id
#define MATCH_BITMAP        vdp_metadata.match_chain_bitmap


#define PROG_ID	  vdp_metadata.inst_id
// = PROGRAM_ID
//#define MOD_FLAG  vdp_metadata.mod_flag
#define REMOVE_OR_ADD_HEADER vdp_metadata.remove_or_add_flag
// = REMOVE_OR_ADD_FLAG
#define VDP_META vdp_metadata
#define HDR  user_metadata.load_header
// = LOAD_HEADER
#define META user_metadata.meta
// = USER_META

#define CPU_PORT    255
#define DROP_PORT   511

/////////////////codemark///////////////#include "include/action.p4"

//***********************************************************
//				       HyperV primitives
//***********************************************************

/**
 * No operation.
 */
action noop() {

}

/**
 * Count packets with global register.
 * @param index <> packet counter index.
 */
action packet_count(index) {
	register_read(context_metadata.count, global_register, index);
	register_write(global_register,  // Global register 
				   index, 
				   context_metadata.count + 1);
}

/**
 * Clear packet counter.
 * @param index <> pakcet counter index
 */ 
action packet_count_clear(index) {
	register_write(global_register, index, 0);
}

/**
 * Loop back packets.
 */
action do_loopback() {
	modify_field(standard_metadata.egress_spec, 
		standard_metadata.ingress_port);
}


/**
 * Set the multicast group.
 * @param mcast_grp <> multicast group ID. 
 */
action do_multicast(mcast_grp) {
	modify_field(intrinsic_metadata.mcast_grp, mcast_grp);
}

/**
 * Set the queue id.
 * @param qid <> queue id
 */
//hr-modified
//action do_queue(qid) {
//	modify_field(intrinsic_metadata.qid, qid);
//}

/**
 * Forward packets
 * @param port  destination ports
 */ 
action do_forward(port) {
	modify_field(standard_metadata.egress_spec, port);
}

/**
 * Drop packets.
 */
action do_drop() {
	drop();
} 


/**
 * Generate digest to the CPU receiver.
 * @param receiver
 */
action do_gen_digest(receiver) {
	generate_digest(receiver, digest_list);
}


/**
 * Add header fileds with const integers.
 * @param value1 <header length> value of the const.
 * @param mask1 <header length> value mask.
 */ 
action do_add_header_with_const(value1, mask1) {
	bit_or(HDR, HDR & (~mask1),
		(HDR + value1) & mask1);
}

/**
 * Add user-defined metadata with const integers.
 * @param value1 <metadata length> value of the const.
 * @param mask1 <metadata length> value mask.
 */ 
action do_add_meta_with_const(value1, mask1) {
	bit_or(META, META & (~mask1),
		(META + value1) & mask1);
}

/**
 * Add header with the header values.
 * @param left1 <header length> left shift
 * @param right1 <header length>  right shift
 * @param mask1 <header length> value mask
 */
action do_add_header_with_header(left1, 
								 right1, 
								 mask1) {
	bit_or(HDR, HDR & (~mask1), 
		(HDR + (((HDR<<left1)>>right1)&mask1)) & mask1);
}

/**
 * Add user defiend metadata with the header values.
 * @param left1 <header length> left shift
 * @param right1 <header length>  right shift
 * @param mask1 <header length> value mask
 */
action do_add_meta_with_header(left1, 
                               right1, 
                               mask1) {
	bit_or(META, META & (~mask1), 
		(META + (((HDR<<left1)>>right1)&mask1)) & mask1);
}

/**
 * Add header with the metadata values.
 * @param left1 <header length> left shift
 * @param right1 <header length>  right shift
 * @param mask1 <header length> value mask
 */
action do_add_header_with_meta(left1, 
							   right1, 
							   mask1) {
	bit_or(HDR, HDR & (~mask1), 
		(HDR + (((META<<left1)>>right1)&mask1)) & mask1);
}

/**
 * Add metadata with the metadata values.
 * @param left1 <header length> left shift
 * @param right1 <header length>  right shift
 * @param mask1 <header length> value mask
 */
action do_add_meta_with_meta(left1, 
							 right1, 
							 mask1) {
	bit_or(META, META & (~mask1), 
		(META + (((META<<left1)>>right1)&mask1)) & mask1);
}

/**
 * Substract header with the const values.
 * @param value1 <header length> the const value
 * @param mask1 <header length> value mask
 */
action do_subtract_const_from_header(value1, mask1) {
	bit_or(HDR, HDR & (~mask1), 
		(HDR - value1) & mask1);
}

/**
 * Substract metadata with the const values.
 * @param value1 <header length> the const value
 * @param mask1 <header length> value mask
 */
action do_subtract_const_from_meta(value1, mask1) {
	bit_or(META, META & (~mask1), 
		(META - value1) & mask1);
}

/**
 * Substract header with the header values.
 * @param left1 <header length> left shift
 * @param right1 <header length>  right shift
 * @param mask1 <header length> value mask
 */
action do_subtract_header_from_header(left1, 
									  right1, 
									  mask1) {
	bit_or(HDR, HDR & (~mask1), 
		(HDR - (((HDR<<left1)>>right1)&mask1)) & mask1);
}

/**
 * Substract header with the metadata values.
 * @param left1 <header length> left shift
 * @param right1 <header length>  right shift
 * @param mask1 <header length> value mask
 */
action do_subtract_header_from_meta(left1, 
									right1, 
									mask1) {
	bit_or(META, META & (~mask1), 
		(META - (((HDR<<left1)>>right1)&mask1)) & mask1);
}


/**
 * Substract metadata with the header values.
 * @param left1 <header length> left shift
 * @param right1 <header length>  right shift
 * @param mask1 <header length> value mask
 */
action do_subtract_meta_from_header(left1, right1, mask1) {
	bit_or(HDR, HDR & (~mask1), 
		(HDR - (((META<<left1)>>right1)&mask1)) & mask1);
}

/**
 * Substract metadata with the metadata values.
 * @param left1 <header length> left shift
 * @param right1 <header length>  right shift
 * @param mask1 <header length> value mask
 */
action do_subtract_meta_from_meta(left1, right1, mask1) {
	bit_or(META, META & (~mask1), 
		(META - (((META<<left1)>>right1)&mask1)) & mask1);
}

/**
 * Add a header into the packet.
 * @param value <header length> left shift
 * @param mask1  <header length> value mask
 * @param mask2  <header length> value mask
 * @param length1 <header length> header length
 */
 
 //hr-modified
action do_add_header_1(value,
					   mask1, 
					   mask2, 
					   length1) {
	//push(byte_stack, length1*1);hr-modified
	push(byte_stack, 8);

	bit_or(HDR, HDR & mask1, 
		(HDR & (~mask1) )>>(length1*8));
	add_to_field(HEADER_LENGTH, length1);
	do_mod_header_with_const(value, mask2);
	modify_field(desc_hdr.len, HEADER_LENGTH);
	
	modify_field(REMOVE_OR_ADD_FLAG, 1);
	modify_field(MOD_FLAG, 1);
}

/**
 * Remove a header form the packet.
 * @param value1 <header length> left shift
 * @param mask1  <header length> value mask
 * @param mask2  <header length> value mask
 * @param length1 <header length> header length
 */
action do_remove_header_1(mask1, mask2, length1) {
//	push(byte_stack, length1*1); hr-modified
	push(byte_stack, 8);
	subtract_from_field(HEADER_LENGTH, length1);
	
	modify_field(byte_stack[0].byte, HEADER_FLAG);
	modify_field(byte_stack[1].byte, HEADER_LENGTH);
	modify_field(byte_stack[2].byte, (POLICY_ID>>16)&0xFF);
	modify_field(byte_stack[3].byte, (POLICY_ID) & 0xFF);

	remove_header(desc_hdr);

	bit_or(HDR, HDR & mask1, 
		(HDR & mask2)<<(length1*8));
	
	modify_field(REMOVE_OR_ADD_FLAG, 1);
	modify_field(MOD_FLAG, 1);
}

/**
 * Modify header with one const value.
 * @param value <header length> left shift
 * @param mask1  <header length> value mask
 * @param length1 <header length> value mask
 */
action do_mod_header_with_const(value, mask1) {
	bit_or(HDR, (HDR & (~mask1)), (value & mask1));
	modify_field(MOD_FLAG, 1);
}

/**
 * Modify header with one const value, meanwhile re-calculate the checksum (inline).
 * @param value1 <header length> left shift
 * @param mask1  <header length> value mask
 * @param length1 <header length> value mask
 */
action do_mod_header_with_const_and_checksum(value, 
										     mask1, 
										     value1, 
										     value2, 
										     offset1) {
	do_mod_header_with_const(value, mask1);
	do_update_transport_checksum(value1,
		 value2, offset1);
}

/**
 * Modify header with one const value, meanwhile re-calculate the checksum (inline).
 * @param value <header length>  the const value.
 * @param mask1  <header length> value mask
 */
action do_mod_meta_with_const(value, mask1) {
	bit_or(META, (META & ~mask1), 
		(value & mask1));
}

/**
 * Modify standard metadata fields.
 * @param val1  <>
 * @param mask1 <>
 * @param val2  <>
 * @param mask2 <>
 * @param val3  <>
 * @param mask3 <>
 * @param val4  <>
 * @param mask4 <>
 */
action do_mod_std_meta(val1, mask1, 
					   val2, mask2, 
					   val3, mask3, 
					   val4, mask4) {
	bit_or(standard_metadata.egress_spec, 
		standard_metadata.egress_spec & (~mask1), val1 & mask1);
	bit_or(standard_metadata.egress_port, 
		standard_metadata.egress_port & (~mask2), val2 & mask2);
	bit_or(standard_metadata.ingress_port, 
		standard_metadata.ingress_port & (~mask3), val3 & mask3);
	bit_or(standard_metadata.packet_length, 
		standard_metadata.packet_length & (~mask4), val4 & mask4);
}

/**
 * Modify header with the one metadata field.
 * @param value1 <header length> left shift
 * @param mask1  <header length> value mask
 * @param length1 <header length> value mask
 */
action do_mod_header_with_meta_1(left1, 
								 right1, 
								 mask1) {
    bit_or(HDR, (HDR & ~mask1),
		 (((META << left1) >> right1) & mask1));
	modify_field(MOD_FLAG, 1);
}

/**
 * Modify header with the two metadata fields.
 * @param left1  <header length> left shift
 * @param right1   <header length> right shift
 * @param mask1 <header length> value mask
 * @param left2  <header length> left shift
 * @param right2   <header length> right shift
 * @param mask2 <header length> value mask
 */
action do_mod_header_with_meta_2(left1, right1, mask1, 
								 left2, right2, mask2) {
    do_mod_header_with_meta_1(left1, right1, mask1);
	do_mod_header_with_meta_1(left2, right2, mask2);
}

/**
 * Modify header with the three metadata fields.
 * @param left1  	<header length> left shift
 * @param right1   	<header length> right shift
 * @param mask1 	<header length> value mask
 * @param left2  	<header length> left shift
 * @param right2   	<header length> right shift
 * @param mask2 	<header length> value mask
 * @param left3  	<header length> left shift
 * @param right3   	<header length> right shift
 * @param mask3 	<header length> value mask
 */
action do_mod_header_with_meta_3(left1, right1, mask1, 
								 left2, right2, mask2, 
								 left3, right3, mask3) {
    do_mod_header_with_meta_1(left1, right1, mask1);
	do_mod_header_with_meta_1(left2, right2, mask2);
	do_mod_header_with_meta_1(left3, right3, mask3);
}

/**
 * Modify metadata with the one metadata field.
 * @param left1  	<header length> left shift
 * @param right1   	<header length> right shift
 * @param mask1 	<header length> value mask
 */
action do_mod_meta_with_meta_1(left1, right1, mask1) {
    bit_or(META, (META & ~mask1), 
		(((META << left1) >> right1) & mask1));
}

/**
 * Modify metadata with the two metadata fields.
 * @param left1  	<header length> left shift
 * @param right1   	<header length> right shift
 * @param mask1 	<header length> value mask
 * @param left2  	<header length> left shift
 * @param right2   	<header length> right shift
 * @param mask2 	<header length> value mask
 */
action do_mod_meta_with_meta_2(left1, right1, mask1, 
							   left2, right2, mask2) {
    do_mod_meta_with_meta_1(left1, right1, mask1);
	do_mod_meta_with_meta_1(left2, right2, mask2);
}

/**
 * Modify metadata with the three metadata fields.
 * @param left1  	<header length> left shift
 * @param right1   	<header length> right shift
 * @param mask1 	<header length> value mask
 * @param left2  	<header length> left shift
 * @param right2   	<header length> right shift
 * @param mask2 	<header length> value mask
 * @param left3  	<header length> left shift
 * @param right3   	<header length> right shift
 * @param mask3 	<header length> value mask
 */
action do_mod_meta_with_meta_3(left1, right1, mask1, 
							   left2, right2, mask2,
							   left3, right3, mask3) {
	do_mod_meta_with_meta_1(left1, right1, mask1);
	do_mod_meta_with_meta_1(left2, right2, mask2);
	do_mod_meta_with_meta_1(left3, right3, mask3);   
}

/**
 * Modify header with the one header field.
 * @param left1  	<header length> left shift
 * @param right1   	<header length> right shift
 * @param mask1 	<header length> value mask
 */
action do_mod_header_with_header_1(left1, right1, mask1) {
    bit_or(META, (HDR & ~mask1), 
		(((HDR << left1) >> right1) & mask1));

	modify_field(MOD_FLAG, 1);
}

/**
 * Modify header with the three header fields.
 * @param left1  	<header length> left shift
 * @param right1   	<header length> right shift
 * @param mask1 	<header length> value mask
 * @param left2  	<header length> left shift
 * @param right2   	<header length> right shift
 * @param mask2 	<header length> value mask
 */
action do_mod_header_with_header_2(left1, right1, mask1, 
								   left2, right2, mask2) {
    do_mod_header_with_header_1(left1, right1, mask1);
	do_mod_header_with_header_1(left2, right2, mask2);
}

/**
 * Modify header with the three header fields.
 * @param left1  	<header length> left shift
 * @param right1   	<header length> right shift
 * @param mask1 	<header length> value mask
 * @param left2  	<header length> left shift
 * @param right2   	<header length> right shift
 * @param mask2 	<header length> value mask
 * @param left3  	<header length> left shift
 * @param right3   	<header length> right shift
 * @param mask3 	<header length> value mask
 */
action do_mod_header_with_header_3(left1, right1, mask1, 
								   left2, right2, mask2, 
								   left3, right3, mask3) {
    do_mod_header_with_header_1(left1, right1, mask1);
	do_mod_header_with_header_1(left2, right2, mask2);
	do_mod_header_with_header_1(left3, right3, mask3);
}

/**
 * Modify metadata with the one header field.
 * @param left1  	<header length> left shift
 * @param right1   	<header length> right shift
 * @param mask1 	<header length> value mask
 */
action do_mod_meta_with_header_1(left1, right1, mask1) {
    bit_or(META, (HDR & ~mask1), 
		(((HDR << left1) >> right1) & mask1));
}

/**
 * Modify metadata with the two header fields.
 * @param left1  	<header length> left shift
 * @param right1   	<header length> right shift
 * @param mask1 	<header length> value mask
 * @param left2  	<header length> left shift
 * @param right2   	<header length> right shift
 * @param mask2 	<header length> value mask
 */
action do_mod_meta_with_header_2(left1, right1, mask1, 
								 left2, right2, mask2) {
    do_mod_meta_with_header_1(left1, right1, mask1);
	do_mod_meta_with_header_1(left2, right2, mask2);
}

/**
 * Modify metadata with the three header fields.
 * @param left1  	<header length> left shift
 * @param right1   	<header length> right shift
 * @param mask1 	<header length> value mask
 * @param left2  	<header length> left shift
 * @param right2   	<header length> right shift
 * @param mask2 	<header length> value mask
 * @param left3  	<header length> left shift
 * @param right3   	<header length> right shift
 * @param mask3 	<header length> value mask
 */
action do_mod_meta_with_header_3(left1, right1, mask1, 
				left2, right2, mask2, left3, right3, mask3) {
    do_mod_meta_with_header_1(left1, right1, mask1);
	do_mod_meta_with_header_1(left2, right2, mask2);
	do_mod_meta_with_header_1(left3, right3, mask3);
}


/**
 * Recirculate packets at  the egress pipeline.
 * @param progid Pragram ID
 */
action do_recirculate(progid) {
	modify_field(vdp_metadata.recirculation_flag, 1);
	modify_field(vdp_metadata.remove_or_add_flag, 0);
	modify_field(vdp_metadata.inst_id, progid); 
	recirculate( flInstance_with_umeta );
}

/**
 * Resubmit packet at the ingress pipeline.
 * @param progid Pragram ID
 */
action do_resubmit(progid) {
	modify_field(vdp_metadata.recirculation_flag, 1);
	modify_field(vdp_metadata.inst_id, progid);
	resubmit(flInstance_with_umeta);
}

/**
 * Load register value into the header.
 * @param index register index
 * @param left1 
 * @param mask1
 */
action do_load_register_into_header(index, 
 								    left1, 
 								    mask1) {
	register_read(context_metadata.r5, global_register, index);
	bit_or(HDR, HDR & (~mask1), 
		(context_metadata.r5<<left1) & mask1);

	modify_field(MOD_FLAG, 1);
}

/**
 * Load register value into the metadata.
 * @param index register index
 * @param left1 
 * @param mask1
 */
action do_load_register_into_meta(index, 
								  left1, 
								  mask1) {
	register_read(context_metadata.r5,  
	              global_register, 
	              index);
	bit_or(META, META & (~mask1), 
		(context_metadata.r5<<left1) & mask1);
}


/**
 * Load the header field into the register.
 * @param index register index
 * @param right1 
 * @param mask1
 */
action do_write_header_into_register(index, 
								     right1, 
								     mask1) {
	register_write(global_register, index, 
		(HDR>>right1) & mask1);
}

/**
 * Load the metadata field into the register.
 * @param index register index
 * @param left1 
 * @param mask1
 */
action do_wirte_meta_into_register(index, right1, mask1) {
	register_write(global_register, index, 
		(META>>right1) & mask1);
}

/**
 * Load the const value into the register.
 * @param index register index
 * @param value the const value to load
 */
action do_wirte_const_into_register(index, value) {
	register_write(global_register, index, value);
}

/**
 * Return the hash header.
 */
field_list hash_field_list {
	context_metadata.hash_header;
}

/**
 * Calculate the field list with CRC16 hash.
 */
field_list_calculation hash_crc16 {
    input {
        hash_field_list;
    }
    algorithm : crc16;
    output_width : 16;
}

/**
 * Calculate the field list with CRC32 hash.
 */
field_list_calculation hash_crc32 {
    input {
        hash_field_list;
    }
    algorithm : crc32;
    output_width : 32;
}

/**
 * Set the hash header.
 * @param hdr_mask 
 */
action do_set_hash_hdr(hdr_mask) {
	modify_field(context_metadata.hash_header, HDR & hdr_mask);
}


/**
 * Calculate CRC16.
 */
action do_hash_crc16(hdr_mask) {
	do_set_hash_hdr(hdr_mask);
	modify_field_with_hash_based_offset(context_metadata.hash, 0,
                                        hash_crc16, 65536);
}

/**
 * Calculate CRC32.
 */
action do_hash_crc32(hdr_mask) {
	do_set_hash_hdr(hdr_mask);
	modify_field_with_hash_based_offset(context_metadata.hash, 0,
                                        hash_crc32, 0xFFFFFFFF);
}

/**
 * Select hash profile.
 */
action_profile hash_profile {
	actions {
		do_forward;
		noop;
	}

	dynamic_action_selection : hash_action_selector;
}

/**
 * Perform hash calculation.
 */
field_list_calculation hash_calculation { 
	input {	
		hash_field_list; 
	}
	algorithm : crc16; 
	output_width : 16;
}

/**
 * Select hash action.
 */
action_selector hash_action_selector {
	selection_key : hash_calculation;
}


/////////////////codemark///////////////#include "include/config.p4"

#ifndef HYPERVISOR_CONFIG
#define HYPERVISOR_CONFIG

// Register width
#define REGISTER_WIDTH  32
// Number of global registers
#define REGISTER_NUMBER 65536




#endif

/////////////////codemark///////////////#include "include/stateful.p4"

/****************************************************
 * Global register
 * Reserved for user programs
 ***************************************************/
register global_register {
    width : REGISTER_WIDTH;
    instance_count : REGISTER_NUMBER;
}

/////////////////codemark///////////////#include "include/control.p4"

#ifndef HYPERVISOR_CONTROL
#define HYPERVISOR_CONTROL

//#include "define.p4"

//-----------------------------------------------------
// Actions for control logic
//-----------------------------------------------------

//----------------- ingress ---------------------------
table table_config_at_initial {
	reads{		
		POLICY_ID : exact  ; 
		PROG_ID   : exact ;
		STAGE_ID  : exact ;
	}
	actions{
		set_initial_config;
		set_initial_config_new;
	}
}

table table_config_at_end {
	reads{		
		POLICY_ID : exact  ; 
		PROG_ID   : exact ;
		STAGE_ID  : exact ;
	}
	actions{
		do_resubmit;
	}
}

//-----------------------------------------------------
action set_match_result (match_result) {
	bit_or(MATCH_RESULT, match_result, MATCH_RESULT);
}

//-----------------------------------------------------
action set_action_id(match_result, action_bitmap,
                match_bitmap, next_stage, next_prog) {
	set_match_result(match_result);
	set_stage_and_bitmap(action_bitmap, 
        match_bitmap, next_stage, next_prog);
}

//-----------------------------------------------------
action set_next_stage_a(match_bitmap, next_stage, next_prog) {
	set_stage_and_bitmap(0, match_bitmap,
        next_stage, next_prog);
}
action set_next_stage_b(match_bitmap, next_stage, next_prog) {
	set_stage_and_bitmap(0, match_bitmap,
        next_stage, next_prog);
}

//-----------------------------------------------------
action end(next_prog) {
	set_action_id(0, 0, 0 , 0, next_prog);
}

//-----------------------------------------------------
action set_stage_and_bitmap (action_bitmap, 
                match_bitmap , next_stage, next_prog) {
	modify_field(ACTION_BITMAP, action_bitmap);
	modify_field(MATCH_BITMAP, match_bitmap);
	modify_field(STAGE_ID, next_stage);
	modify_field(PROGRAM_ID, next_prog);
	modify_field(ACTION_ID, MATCH_RESULT);
	modify_field(MATCH_RESULT, 0);
}

//-----------------------------------------------------
action set_action_id_direct (action_id, action_bitmap, 
                match_bitmap , next_stage, next_prog) {
	modify_field(ACTION_BITMAP, action_bitmap);
	modify_field(MATCH_BITMAP, match_bitmap);
	modify_field(STAGE_ID, next_stage);
	modify_field(PROGRAM_ID, next_prog);
	modify_field(ACTION_ID, action_id);
}

//-----------------------------------------------------
action set_match_result_with_next_stage (match_result, 
			     match_bitmap, next_stage) {
	modify_field(ACTION_BITMAP, 0);
	modify_field(MATCH_BITMAP, match_bitmap);
	modify_field(STAGE_ID, next_stage);
	modify_field(MATCH_RESULT, match_result);
}


//-----------------------------------------------------
action set_initial_config (progid, initstage, 
                                        match_bitmap) {
	modify_field(PROGRAM_ID , progid);
	modify_field(STAGE_ID, initstage);
	modify_field(MATCH_BITMAP, match_bitmap);
}

action set_initial_config_new (progid, initstage, 
                                   match_bitmap) {
	modify_field(desc_hdr.vdp_id, vdp_metadata.vdp_id&0xFFEF);
	modify_field(PROGRAM_ID , progid);
	modify_field(STAGE_ID, initstage);
	modify_field(MATCH_BITMAP, match_bitmap);
}

//----------------- Egress ----------------------------
table table_config_at_egress {
	reads{		
		POLICY_ID 	: exact ; 
		PROG_ID 	: exact ;
		STAGE_ID   	: exact ;
	}
	actions {
		do_recirculate;
	}
}

table dh_deparse {
	actions {
		do_dh_deparse;
	}
}

//-----------------------------------------------------
action do_dh_deparse() {
	modify_field(HDR, desc_hdr.load_header);
}


//--------------Conditional Stage----------------------

//-----------------------------------------------------
action set_expr_header_op_const(l_expr_offset, 
                            l_expr_mask, op, r_expr) {
	modify_field(context_metadata.left_expr, 
        (HDR >> l_expr_offset)&l_expr_mask);
	modify_field(context_metadata.op, op);
	modify_field(context_metadata.right_expr, r_expr);
}


//-----------------------------------------------------
action set_expr_counter_op_const(r_expr) {
	modify_field(context_metadata.left_expr, 
			context_metadata.count);
	modify_field(context_metadata.right_expr, r_expr);
}

//-----------------------------------------------------
action set_expr_meta_op_const(l_expr_offset, 
                            l_expr_mask, op, r_expr) {
	modify_field(context_metadata.left_expr, 
        (META >> l_expr_offset)&l_expr_mask);
	modify_field(context_metadata.op, op);
	modify_field(context_metadata.right_expr, r_expr);
}

//-----------------------------------------------------
action set_expr_header_op_header(l_expr_offset, 
        l_expr_mask, op, r_expr_offset, r_expr_mask) {
	modify_field(context_metadata.left_expr, 
        (HDR >> l_expr_offset) & l_expr_mask);
	modify_field(context_metadata.op, op);
	modify_field(context_metadata.right_expr, 
        (HDR >> r_expr_offset) & r_expr_mask);

}

//-----------------------------------------------------
action set_expr_meta_op_header(l_expr_offset, 
        l_expr_mask, op, r_expr_offset, r_expr_mask) {
	modify_field(context_metadata.left_expr, 
        (META >> l_expr_offset)&l_expr_mask);
	modify_field(context_metadata.op, op);
	modify_field(context_metadata.right_expr, 
        (HDR >> r_expr_offset) & r_expr_mask);
}

//-----------------------------------------------------
action set_expr_header_op_meta(l_expr_offset, 
        l_expr_mask, op, r_expr_offset, r_expr_mask) {
	modify_field(context_metadata.left_expr, 
        (HDR >> l_expr_offset)&l_expr_mask);
	modify_field(context_metadata.op, op);
	modify_field(context_metadata.right_expr, 
        (META >> r_expr_offset) & r_expr_mask);
}

//-----------------------------------------------------
action set_expr_meta_op_meta(l_expr_offset, 
        l_expr_mask, op, r_expr_offset, r_expr_mask) {
	modify_field(context_metadata.left_expr, 
        (META << l_expr_offset)&l_expr_mask);
	modify_field(context_metadata.op, op);
	modify_field(context_metadata.right_expr, 
        (META << r_expr_offset) & r_expr_mask);
}

#endif

/////////////////codemark///////////////#include "include/headers.p4"

/****************************************************
 * description_header_t
 * Descripe packet headers
 ***************************************************/
header_type description_hdr_t {
	fields {
		flag		: 8 ;
		len         : 8 ;
		vdp_id      : 16;
		load_header : * ; //varbit
	}

	length : len;
	max_length : 128;
}

header description_hdr_t desc_hdr;

/****************************************************
 * byte_stack_t
 * Used for add_headers, remove_header, push, and \
 * pop operations
 ***************************************************/
header_type byte_stack_t {
	fields {
		byte : 8;
	}
}

header byte_stack_t byte_stack[64];

/////////////////codemark///////////////#include "include/field-lists.p4"

#ifndef HYPERVISOR_INSTANCE
#define HYPERVISOR_INSTANCE

//#include "config.p4"



/****************************************************
 * Metadata instances
 ***************************************************/

/****************************************************
 * Field list for resubmit and recirculate
 ***************************************************/
field_list flInstance_with_umeta { 
    vdp_metadata;
    user_metadata;
    standard_metadata; 
}

field_list digest_list {
    META;
    standard_metadata;
}

field_list watch_digist_list {
	LOAD_HEADER;
}

field_list debug_digist_list {
	USER_META;
	LOAD_HEADER;
}


#endif

/////////////////codemark///////////////#include "include/metadata.p4"

#ifndef HYPERV_METADTA_
#define HYPERV_METADTA_

/****************************************************
 * vdp_metadata_t
 * Vritual data plane metadata for control and stage
 ***************************************************/
header_type vdp_metadata_t {
	fields {
		// Identifiers
		vdp_id     : 16; 
		inst_id    : 8 ;
		stage_id   : 8 ;

		// Action block variables
		action_chain_id		: 48; 
		action_chain_bitmap : 48;
		
		// Match block variable
		match_chain_result  : 48;
		match_chain_bitmap  : 3 ;

		recirculation_flag    : 1 ;      
		remove_or_add_flag  : 1 ;
		mod_flag			: 1 ;
	}
}

metadata vdp_metadata_t vdp_metadata;

/****************************************************
 * user_metadata_t
 * Reserved meta-data for programs
 ***************************************************/
header_type user_metadata_t {
	fields {
		meta : 256;
		load_header  : 800;
	}
}

metadata user_metadata_t user_metadata;

/****************************************************
 * context_metadata_t
 * Context data and intermediate variables for \
 * arithmetical logic
 ***************************************************/
header_type context_metadata_t {
	fields {
		r1 : 16;
		r2 : 16;
		r3 : 16;
		r4 : 16;
		r5 : 32;
		op          : 2  ;
		left_expr   : 16 ;
		right_expr  : 16 ;
		count 	    : 32 ;
		hash        : 32 ;
		hash_header : 800;
	}
}

metadata context_metadata_t context_metadata;

#endif

/////////////////codemark///////////////#include "include/template.p4"

#ifndef HYPERVISOR_TEMPLATE
#define HYPERVISOR_TEMPLATE

//#include "define.p4"

//---------------------------------------------------------------------------
/*
 * In the match pipeline, we classify the match fields in a standard match-
 * action table into three types: packet header, standard metadata and user-
 * defined matadata. The fourth table maps the combined result to an action
 * bitmap. In this way we avoid using an exceedingly large match filed in one
 * table to reduce TCAM pressure. A match bitmap is also used to indicate whe-
 * ther a table should be executed or skipped in a match pipeline.
 */
#define STAGE(X)															\
control match_action_##X {		                                          	\
	if (vdp_metadata.match_chain_bitmap & BIT_MASK_HEADER    != 0) {     	\
		apply(table_header_match_##X);                                      \
	}                                                                       \
	if (vdp_metadata.match_chain_bitmap & BIT_MASK_STD_META  != 0) {     	\
		apply(table_std_meta_match_##X);                                    \
	}                                                                       \
	if (vdp_metadata.match_chain_bitmap & BIT_MASK_USER_META != 0) {     	\
		apply(table_user_meta_##X);                                         \
	}																		\
	if (MATCH_RESULT != 0) {												\
		apply(table_match_result_##X);										\
	}																		\
	if (ACTION_BITMAP != 0)	{												\
		execute_do_##X();													\
    }						                                                \
}                                                                           \
table table_header_match_##X {                                              \
	reads {                                                                 \
		vdp_metadata.inst_id : exact ;                                		\
		vdp_metadata.stage_id : exact ;                                  	\
		user_metadata.load_header : ternary ;                             	\
	}                                                                       \
	actions { 																\
		set_match_result; 												\
		set_action_id;														\
		set_next_stage_a;													\
		set_action_id_direct;												\
		end;																\
		set_match_result_with_next_stage;								\
	}    									                                \
}                                                                           \
table table_std_meta_match_##X {                                            \
	reads{                                                                  \
		vdp_metadata.inst_id : exact ;                                		\
		vdp_metadata.stage_id : exact ;                                  	\
		standard_metadata.ingress_port : ternary ;                          \
		standard_metadata.egress_spec : ternary ;                           \
		standard_metadata.instance_type : ternary ;                         \
	}                                                                       \
	actions { 																\
		set_match_result; 												\
		set_action_id;														\
		set_next_stage_a;													\
		end;																\
		set_action_id_direct;												\
		set_match_result_with_next_stage;								\
	}									                                    \
}                                                                           \
table table_user_meta_##X {	                                                \
	reads {                             				                    \
		vdp_metadata.inst_id 		: exact ;       				        \
		vdp_metadata.stage_id 		: exact ;   	               			\
		user_metadata.meta 	        : ternary;	            				\
	}                                                       				\
	actions { 																\
		set_match_result;												\
		set_action_id; 														\
		set_action_id_direct;												\
		set_next_stage_a;													\
		set_match_result_with_next_stage;								\
		end;																\
	}                    													\
}                                                           				\
table table_match_result_##X {                                				\
	reads {																	\
		MATCH_RESULT 	: exact;         									\
	}                                                       				\
	actions {																\
		set_action_id_direct; 												\ 
		set_stage_and_bitmap; 												\
		set_next_stage_a;														\
	}                														\
}                                                           				


//---------------------------------------------------------------------------
/* Stages can branch to another stage depending on the result of a boolean 
 * expression.
 * table_get_expression_x is used to calculate all types of boolean expressions
 * e.g. header <|=|> const, header <|=|> header, header <|=|> meta
 * counter can only be compared with const?
 */
#define CONDITIONAL_STAGE(X)												\

table table_get_expression_##X {											\
	reads {																	\
		vdp_metadata.inst_id : exact ;										\
		vdp_metadata.stage_id : exact ;										\
	}																		\
	actions {																\
		set_expr_header_op_const;										\
		set_expr_header_op_header;										\
		set_expr_header_op_meta;											\
		set_expr_meta_op_const;											\
		set_expr_meta_op_header;											\
		set_expr_meta_op_meta;											\
		set_expr_counter_op_const;										\
	}																		\
}																			\
table table_branch_1_##X {													\
	reads {																	\
		vdp_metadata.inst_id : exact ;										\
		vdp_metadata.stage_id : exact ;										\
	}																		\
	actions { 																\
		set_next_stage_a; 													\
		set_match_result;												\
		set_action_id; 														\
		set_next_stage_b;													\
		end;																\
	}																		\
}																			\
table table_branch_2_##X {													\
	reads {																	\
		vdp_metadata.inst_id : exact ;										\
		vdp_metadata.stage_id : exact ;										\
	}																		\
	actions { 																\
		set_next_stage_a;													\
		set_match_result;												\
		set_action_id; 														\
		set_next_stage_b;													\
		end;																\
	}																		\
}																			\
table table_branch_3_##X {													\
	reads {																	\
		vdp_metadata.inst_id : exact ;										\
		vdp_metadata.stage_id : exact ;										\
	}																		\
	actions { 																\
		set_next_stage_a;													\
		set_match_result;												\
		set_action_id; 														\
		set_next_stage_b;													\
		end;																\
	}																		\
}	
control conditional_##X {		    										\
	apply(table_get_expression_##X);										\
	if (context_metadata.left_expr < context_metadata.right_expr) {			\
		apply(table_branch_1_##X);											\
	} 																		\
	else if(context_metadata.left_expr > context_metadata.right_expr) {		\
		apply(table_branch_2_##X);										    \	
	} 																		\
	else {																	\
		apply(table_branch_3_##X);											\
	}																		\
}																			\
																		


//-----------------------------------------------------------------------
/* 
 * 
 */
#define EXECUTE_ACTION(X)												\
control execute_do_##X {												\
	if ((ACTION_BITMAP & BIT_MASK_MOD_HEADER_WITH_META) != 0) {			\
		apply(table_mod_header_with_meta_##X);							\
	}																	\
	if ((ACTION_BITMAP & BIT_MASK_MOD_META_WITH_META) != 0) {			\
		apply(table_mod_meta_with_meta_##X);							\
	}																	\
	if ((ACTION_BITMAP & BIT_MASK_MOD_HEADER_WITH_HEADER) != 0) {		\
		apply(table_mod_header_with_header_##X);						\
	}																	\
	if ((ACTION_BITMAP & BIT_MASK_MOD_META_WITH_HEADER) != 0) {			\
		apply(table_mod_meta_with_header_##X);							\
	}																	\
	if ((ACTION_BITMAP & BIT_MASK_MOD_HEADER_WITH_CONST) != 0) {		\
		apply(table_mod_header_with_const_##X);							\
	}																	\
	if ((ACTION_BITMAP & BIT_MASK_MOD_META_WITH_CONST) != 0) {			\
		apply(table_mod_meta_with_const_##X);							\
	}																	\
	if ((ACTION_BITMAP & BIT_MASK_ADD_HEDAER) != 0) {					\
		apply(table_add_header_##X);									\
	}																	\
	if ((ACTION_BITMAP & BIT_MASK_REMOVE_HEADER) != 0) {				\
		apply(table_remove_header_##X);									\
	}																	\
	if ((ACTION_BITMAP & BIT_MASK_MOD_STD_META) != 0) {					\
		apply(table_mod_std_meta_##X);									\
	}																	\
	if ((ACTION_BITMAP & BIT_MASK_GENERATE_DIGIST) != 0) {			    \
		apply(table_generate_digest_##X);								\
	}																	\
	if ((ACTION_BITMAP & BIT_MASK_ADD ) != 0) {							\
		apply(table_add_##X);											\
	}																	\
	if ((ACTION_BITMAP & BIT_MASK_SUBTRACT ) != 0) {					\
		apply(table_subtract_##X);										\
	}																	\
	if ((ACTION_BITMAP & BIT_MASK_REGISTER) != 0) {						\
		apply(table_register_##X);										\
	}																	\
	if ((ACTION_BITMAP & BIT_MASK_COUNTER) != 0) {						\
		apply(table_counter_##X);										\
	}																	\
	if ((ACTION_BITMAP & BIT_MASK_HASH) != 0) {							\
	    apply(table_hash_##X);											\
	}																	\				
	if ((ACTION_BITMAP & BIT_MASK_PROFILE) != 0) {						\
	    apply(table_action_profile_##X);								\
	}																	\
}																		\
table table_add_##X {													\
	reads {																\
		ACTION_ID : exact;												\
	}																	\
	actions {															\
		do_add_header_with_const;									\
		do_add_meta_with_const;										\
		do_add_header_with_header;									\
		do_add_meta_with_header;									\
		do_add_header_with_meta;									\
		do_add_meta_with_meta;										\
	}																	\
}																		\
table table_generate_digest_##X {										\
	reads {																\
		ACTION_ID : exact;												\
	}																	\
	actions {															\
		do_gen_digest;												\
	}																	\
}																		\
table table_subtract_##X {												\
	reads {																\
		ACTION_ID : exact;												\
	}																	\
	actions {															\
		do_subtract_const_from_header;									\
		do_subtract_const_from_meta;									\
		do_subtract_header_from_header;									\
		do_subtract_header_from_meta;									\
		do_subtract_meta_from_header;									\
		do_subtract_meta_from_meta;										\
	}																	\
}																		\
table table_mod_std_meta_##X {											\
	reads {																\
		ACTION_ID : exact;												\
	}																	\
	actions {															\
		do_mod_std_meta;												\
		do_loopback;													\
		do_forward;														\
		//do_queue;	//hr-modified													\ 
		do_drop;														\
		do_multicast;													\
	}																	\
}																		\
table table_mod_header_with_const_##X {									\
	reads {																\
		ACTION_ID : exact;												\
	}																	\
	actions {															\
		do_mod_header_with_const;									\
		do_mod_header_with_const_and_checksum;						\
	}																	\
}																		\
table table_mod_meta_with_const_##X {									\
	reads {																\
		ACTION_ID : exact;												\
	}																	\
	actions {															\
		do_mod_meta_with_const;										\
	}																	\
}																		\
table table_mod_header_with_meta_##X {									\
	reads {																\
		ACTION_ID : exact;												\
	}																	\
	actions {															\
		do_mod_header_with_meta_1;									\
		do_mod_header_with_meta_2;									\
		do_mod_header_with_meta_3;									\
	}																	\
}																		\
table table_mod_meta_with_meta_##X {									\
	reads {																\
		ACTION_ID : exact;												\
	}																	\
	actions {															\
		do_mod_meta_with_meta_1;									\
		do_mod_meta_with_meta_2;									\
		do_mod_meta_with_meta_3;									\
	}																	\
}																		\
table table_mod_header_with_header_##X {								\
	reads {																\
		ACTION_ID : exact;												\
	}																	\
	actions {															\
		do_mod_header_with_header_1;								\
		do_mod_header_with_header_2;								\
		do_mod_header_with_header_3;								\
	}																	\
}																		\
table table_mod_meta_with_header_##X {									\
	reads {																\
		ACTION_ID : exact;												\
	}																	\
	actions {															\
		do_mod_meta_with_header_1;									\
		do_mod_meta_with_header_2;									\
		do_mod_meta_with_header_3;									\
	}																	\
}																		\
table table_add_header_##X {											\
	reads {																\
		ACTION_ID : exact;												\
	}																	\
	actions {															\
		do_add_header_1;											\
	}																	\
}																		\	
table table_remove_header_##X {											\
	reads {																\
		ACTION_ID : exact;												\
	}																	\
	actions {															\
		do_remove_header_1;												\
	}																	\
}																		\
table table_hash_##X {													\
	reads {																\
		ACTION_ID : exact;												\
	}																	\
	actions {															\
		do_hash_crc16;													\
		do_hash_crc32;													\	
	}																	\
}																		\
table table_action_profile_##X {   										\
	reads {																\
		ACTION_ID : exact;												\
	}																	\
	action_profile : hash_profile;  									\
}																		\
table table_counter_##X {												\
	reads {																\
		ACTION_ID : exact;												\
	}																	\
	actions {															\
		packet_count;													\
		packet_count_clear;												\
	}																	\
}																		\
table table_register_##X {												\
	reads {																\
		ACTION_ID : exact;												\
	}																	\
	actions {															\
		do_load_register_into_header;									\
		do_load_register_into_meta;										\
		do_write_header_into_register;									\
		do_wirte_meta_into_register;									\
		do_wirte_const_into_register;									\
	}																	\
}																		\
counter counter_##X {													\
 	type : packets_and_bytes;											\
	direct : table_counter_##X;											\
}																		


#endif

/////////////////codemark///////////////#include "include/execute.p4"

#ifndef HYPERVISOR_EXECUTE
#define HYPERVISOR_EXECUTE


//----------------- execute ------------------------

//------------------ stage 1 -----------------------
EXECUTE_ACTION(stage1)															

//------------------ stage 2 -----------------------
EXECUTE_ACTION(stage2)

//------------------ stage 3 -----------------------
EXECUTE_ACTION(stage3)

//------------------ stage 4 -----------------------
EXECUTE_ACTION(stage4)

//------------------ stage 5 -----------------------
EXECUTE_ACTION(stage5)															

//------------------ stage 6 -----------------------
EXECUTE_ACTION(stage6)

//------------------ stage 7 -----------------------
EXECUTE_ACTION(stage7)

//------------------ stage 8 -----------------------
EXECUTE_ACTION(stage8)

//------------------ stage 8 -----------------------
EXECUTE_ACTION(stage9)

#endif


/////////////////codemark///////////////#include "include/checksum.p4"

#ifndef HYPERVISOR_CHEKSUM
#define HYPERVISOR_CHEKSUM

#define OFFSET  context_metadata.r1
#define SUM     context_metadata.r5
#define RESULT  context_metadata.r2

//-----------------------------------------------------------
action do_ipv4_checksum(ipv4_offset) {
    modify_field(SUM, 0);
    modify_field(OFFSET, ipv4_offset);

    // DST
    add_to_field(SUM, (HDR>>OFFSET) & 0xFFFF);
    add_to_field(OFFSET, 16);

    add_to_field(SUM, (HDR>>OFFSET) & 0xFFFF);
    add_to_field(OFFSET, 16);

    // SRC
    add_to_field(SUM, (HDR>>OFFSET) & 0xFFFF);
    add_to_field(OFFSET, 16);

    add_to_field(SUM, (HDR>>OFFSET) & 0xFFFF);
    add_to_field(OFFSET, 16);
    
    // Checksum
    add_to_field(OFFSET, 16);

    // TTL + Protocol
    add_to_field(SUM, (HDR>>OFFSET) & 0xFFFF);
    add_to_field(OFFSET, 16);

    // FRAG
    add_to_field(SUM, (HDR>>OFFSET) & 0xFFFF);
    add_to_field(OFFSET, 16);

    // ID
    add_to_field(SUM, (HDR>>OFFSET) & 0xFFFF);
    add_to_field(OFFSET, 16);

    // totalLen
    add_to_field(SUM, (HDR>>OFFSET) & 0xFFFF);
    add_to_field(OFFSET, 16);

    // version+IHL+DSCP
    add_to_field(SUM, (HDR>>OFFSET) & 0xFFFF);
    add_to_field(OFFSET, 16);

    modify_field(RESULT, (SUM + (SUM>>16)) & 0xFFFF);

    do_mod_header_with_const(RESULT, 0xFFFF << (OFFSET + 32));
}

//-----------------------------------------------------------
action do_update_transport_checksum(value1, value2, offset) {
    modify_field(RESULT, value1);
    add_to_field(RESULT, ~value2);
    add_to_field(RESULT, (HDR >> offset) & 0xFFFF);
    do_mod_header_with_const(RESULT, 0xFFFF << offset);
}


control recalculate_checksum {
    apply(table_checksum);
}

table table_checksum {
    reads {
        POLICY_ID : exact;
    }
    actions {
        do_ipv4_checksum;
        do_update_transport_checksum;
        noop;
    }
}

#endif

/////////////////codemark///////////////#include "include/parser.p4"

@pragma header_ordering desc_hdr byte_stack

//--------------------------------parser-------------------------
parser start {
	extract(desc_hdr); // Rapid Parsing
	set_metadata(vdp_metadata.vdp_id, desc_hdr.vdp_id);
	set_metadata(HDR, desc_hdr.load_header);
    return ingress;
}

/////////////////codemark///////////////"hyperv.p4"
//--------------------------------ingress--------------------------
control ingress {
	if (PROG_ID == 0) {
		apply(table_config_at_initial);
	}
	if (PROG_ID != 0 and PROG_ID != 0xFF) {
		//--------------------stage 1-----------------
		if (((vdp_metadata.stage_id & CONST_NUM_OF_STAGE)) == 
											CONST_CONDITIONAL_STAGE_1) {
			conditional_stage1();
		}
		if (((vdp_metadata.stage_id & CONST_NUM_OF_STAGE)) == 
														CONST_STAGE_1) {
			match_action_stage1();
		}
		
		//--------------------stage 2-----------------
		if (((vdp_metadata.stage_id & CONST_NUM_OF_STAGE)) == 
											CONST_CONDITIONAL_STAGE_2) {
			conditional_stage2();
		}
		if (((vdp_metadata.stage_id & CONST_NUM_OF_STAGE)) == 
														CONST_STAGE_2) {
			match_action_stage2();
		}

		//--------------------stage 3-----------------
		if (((vdp_metadata.stage_id & CONST_NUM_OF_STAGE)) == 
											CONST_CONDITIONAL_STAGE_3) {
			conditional_stage3();
		}
		if (((vdp_metadata.stage_id & CONST_NUM_OF_STAGE)) == 
														CONST_STAGE_3) {
			match_action_stage3();
		}

		//--------------------stage 4-----------------
		if (((vdp_metadata.stage_id & CONST_NUM_OF_STAGE)) == 
											CONST_CONDITIONAL_STAGE_4) {
			conditional_stage4();
		}
		if (((vdp_metadata.stage_id & CONST_NUM_OF_STAGE)) == 
														CONST_STAGE_4) {
			match_action_stage4();
		}

		//--------------------stage 5-----------------
		if (((vdp_metadata.stage_id & CONST_NUM_OF_STAGE)) == 
											CONST_CONDITIONAL_STAGE_5) {
			conditional_stage5();
		}
		if (((vdp_metadata.stage_id & CONST_NUM_OF_STAGE)) == 
														CONST_STAGE_5) {
			match_action_stage5();
		}
		
		//--------------------stage 6-----------------
		if (((vdp_metadata.stage_id & CONST_NUM_OF_STAGE)) == 
											CONST_CONDITIONAL_STAGE_6) {
			conditional_stage6();
		}
		if (((vdp_metadata.stage_id & CONST_NUM_OF_STAGE)) == 
														CONST_STAGE_6) {
			match_action_stage6();
		}

		//--------------------stage 7-----------------
		if (((vdp_metadata.stage_id & CONST_NUM_OF_STAGE)) == 
											CONST_CONDITIONAL_STAGE_7) {
			conditional_stage7();
		}
		if (((vdp_metadata.stage_id & CONST_NUM_OF_STAGE)) == 
														CONST_STAGE_7) {
			match_action_stage7();
		}

		//--------------------stage 8-----------------
		if (((vdp_metadata.stage_id & CONST_NUM_OF_STAGE)) == 
											CONST_CONDITIONAL_STAGE_8) {
			conditional_stage8();
		}
		if (((vdp_metadata.stage_id & CONST_NUM_OF_STAGE)) == 
														CONST_STAGE_8) {
			match_action_stage8();
		}

				//--------------------stage 8-----------------
		if (((vdp_metadata.stage_id & CONST_NUM_OF_STAGE)) == 
											CONST_CONDITIONAL_STAGE_9) {
			conditional_stage9();
		}
		if (((vdp_metadata.stage_id & CONST_NUM_OF_STAGE)) == 
														CONST_STAGE_9) {
			match_action_stage9();
		}
		
		
		if ((REMOVE_OR_ADD_HEADER == 0) and (PROG_ID != 0xFF)) {
			apply(table_config_at_end);
		}
	}
}

//---------conditional stage 1-------------------------
CONDITIONAL_STAGE(stage1)

//---------conditional stage 2-------------------------
CONDITIONAL_STAGE(stage2)

//---------conditional stage 3-------------------------
CONDITIONAL_STAGE(stage3)

//---------conditional stage 4-------------------------
CONDITIONAL_STAGE(stage4)
//---------conditional stage 1-------------------------
CONDITIONAL_STAGE(stage5)

//---------conditional stage 2-------------------------
CONDITIONAL_STAGE(stage6)

//---------conditional stage 3-------------------------
CONDITIONAL_STAGE(stage7)

//---------conditional stage 4-------------------------
CONDITIONAL_STAGE(stage8)

//---------conditional stage 4-------------------------
CONDITIONAL_STAGE(stage9)

//---------stage 1--------------------------------------
STAGE(stage1)

//---------stage 2--------------------------------------
STAGE(stage2)

//---------stage 3--------------------------------------
STAGE(stage3)

//---------stage 4--------------------------------------
STAGE(stage4)

//---------stage 5--------------------------------------
STAGE(stage5)

//---------stage 6--------------------------------------
STAGE(stage6)

//---------stage 7--------------------------------------
STAGE(stage7)

//---------stage 8--------------------------------------
STAGE(stage8)

//---------stage 8--------------------------------------
STAGE(stage9)

//------------------------egress-----------------------
control egress {
	if (REMOVE_OR_ADD_HEADER == 1) {
		apply(table_config_at_egress);
	} 
	else if (MOD_FLAG == 1) {
		recalculate_checksum();
		apply(dh_deparse);
	}
}