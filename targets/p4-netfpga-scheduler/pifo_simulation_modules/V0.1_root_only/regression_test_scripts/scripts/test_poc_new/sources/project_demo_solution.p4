//
// Copyright (c) 2017 Stephen Ibanez
// All rights reserved.
//
// This software was developed by Stanford University and the University of Cambridge Computer Laboratory 
// under National Science Foundation under Grant No. CNS-0855268,
// the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and
// by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), 
// as part of the DARPA MRC research programme.
//
// @NETFPGA_LICENSE_HEADER_START@
//
// Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor
// license agreements.  See the NOTICE file distributed with this work for
// additional information regarding copyright ownership.  NetFPGA licenses this
// file to you under the NetFPGA Hardware-Software License, Version 1.0 (the
// "License"); you may not use this file except in compliance with the
// License.  You may obtain a copy of the License at:
//
//   http://www.netfpga-cic.org
//
// Unless required by applicable law or agreed to in writing, Work distributed
// under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.
//
// @NETFPGA_LICENSE_HEADER_END@
//
// for wave debugging,
// parse 1 field of ehternet header,
// and change at pipe line.

#include <core.p4>
#include <sume_switch.p4>

/*
  Switch Calculator:
  P4 program to use switch as a calculator and key-value lookup engine
 */

typedef bit<48> EthAddr_t; 
typedef bit<32> IPv4Addr_t;
typedef bit<64> TimeWidth_t;

#define INT_WIDTH_BYTES 8
#define CLASS_WIDTH 5 // each port maximum support 32 classes.
#define WEIGHT_WIDTH 16 // each port maximum support 32 classes.  
#define PORT_WIDTH 8 // [DMA4,nf4, DMA3, nf3, DMA2, nf2, DMA1, nf1, DMA0, nf0]
#define CONTROL_WIDTH 8 // determines depth of const register
#define RESULT_WIDTH 32 // determines depth of const register
#define RC_TYPE_WIDTH 8 // rank calc with
#define PKT_LENGTH_WIDTH 16

#define IPV4_TYPE 0x0800

#define L1_SWITCH 0
#define L2_SWITCH 1

#define INT_PROTOCOL 111


// call extern function
@Xilinx_MaxLatency(8)
@Xilinx_ControlWidth(0)
extern void my_extern_calc(
in bit<PORT_WIDTH> oq_port, 
in bit<CLASS_WIDTH> class_id,
in bit<WEIGHT_WIDTH> class_weight,
in bit<PKT_LENGTH_WIDTH> pkt_len,
in bit<RC_TYPE_WIDTH> rc_type,
out bit<RESULT_WIDTH> result);

// timestamp generation
@Xilinx_MaxLatency(1)
@Xilinx_ControlWidth(0)
extern void tin_timestamp(in bit<1> valid, out TimeWidth_t result);

header shim_int_h {
    TimeWidth_t time;
}

// standard Ethernet header
header Ethernet_h { 
    EthAddr_t dstAddr; 
    EthAddr_t srcAddr; 
    bit<16> etherType;
}

// List of all recognized headers
struct Parsed_packet { 
    Ethernet_h ethernet; 
    shim_int_h int_h;
}

// user defined metadata: can be used to share information between
// TopParser, TopPipe, and TopDeparser 
struct user_metadata_t {
    bit<8>  rc_mode; // n-th bit, 0 for pq, 1 for wrr, 2 for drr, 3 for wfq, other for reserved.
    bit<1>  switch_mode; // 0 for l1, 1 for l2 swithing,

    bit<CLASS_WIDTH> rc_class_id; // Rankcalc Class ID
    bit<WEIGHT_WIDTH> rc_class_weight; // RankCalc Class Weight

}

// digest_data, MUST be 256 bits
struct digest_data_t {
    bit<256> unused;
}


// Parser Implementation
@Xilinx_MaxPacketRegion(12144)
parser TopParser(packet_in b, 
                 out Parsed_packet p, 
                 out user_metadata_t user_metadata,
                 out digest_data_t digest_data,
                 inout sume_metadata_t sume_metadata) {
    state start {
        b.extract(p.ethernet);
        user_metadata.rc_mode = 0;
        user_metadata.switch_mode = 0;
        user_metadata.rc_class_id = 0;
        user_metadata.rc_class_weight = 0;

        digest_data.unused = 0;
        transition accept;
    }

}

// match-action pipeline
control TopPipe(inout Parsed_packet p,
                inout user_metadata_t user_metadata, 
                inout digest_data_t digest_data,
                inout sume_metadata_t sume_metadata) {

/*
    action set_switch_mode (bit<1> switch_mode){
        user_metadata.switch_mode = switch_mode;
    }

    table table_switch_mode{
        key = {p.ethernet.srcAddr:exact;}
        actions = {
            set_switch_mode;
        }
        size = 64;
    }
*/

    action l2_forward(port_t port){
        sume_metadata.dst_port = port;
    }

    table table_l1_switch{
        key = {sume_metadata.src_port: exact;}
        actions = {
            l2_forward;
        }
        size = 64;
    }


    action set_calc_mode(bit<8> rc_mode){
        user_metadata.rc_mode = rc_mode;
    }


    table table_rank_calc_mode {
        key = { sume_metadata.dst_port: exact; }
        actions = {
            set_calc_mode;
        }
        size = 64;
    }

    action set_strict_rank(bit<32> rank){
        sume_metadata.pifo_info = rank;
    }


    table table_strict_priority {
        key = { p.ethernet.srcAddr: exact; }
        actions = {
            set_strict_rank;
        }
        //size = 64;
    }

    action set_rc_class(bit<CLASS_WIDTH> class_id, bit<WEIGHT_WIDTH> weight){
        user_metadata.rc_class_id = class_id;
        user_metadata.rc_class_weight = weight;
    }

    table table_rc_class_lookup {
        key = { p.ethernet.srcAddr: exact; }
        actions = {
            set_rc_class;
        }
        //size = 64;
    }


    apply {
        p.int_h.setValid();
        tin_timestamp(1w1, p.int_h.time);
        sume_metadata.pkt_len = sume_metadata.pkt_len + INT_WIDTH_BYTES;

        table_l1_switch.apply();

        table_rank_calc_mode.apply();
        
        if(user_metadata.rc_mode == 1){
            table_strict_priority.apply();
        } 

        // RankCalc Scenario 
        else {
            table_rc_class_lookup.apply();

            bit<32> rank_result;

            my_extern_calc(sume_metadata.dst_port, 
            user_metadata.rc_class_id, 
            user_metadata.rc_class_weight,
            sume_metadata.pkt_len,
            user_metadata.rc_mode, 
            rank_result); 
            sume_metadata.pifo_info = rank_result;
        }

    }
}

// Deparser Implementation
@Xilinx_MaxPacketRegion(12144)
control TopDeparser(packet_out b,
                    in Parsed_packet p,
                    in user_metadata_t user_metadata,
                    inout digest_data_t digest_data,
                    inout sume_metadata_t sume_metadata) { 
    apply {
        b.emit(p.ethernet); 
        b.emit(p.int_h);
    }
}

// Instantiate the switch
SimpleSumeSwitch(TopParser(), TopPipe(), TopDeparser()) main;