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


#include <core.p4>
#include <sume_switch.p4>

/*
  Switch Calculator:
  P4 program to use switch as a calculator and key-value lookup engine
 */

typedef bit<48> EthAddr_t; 
typedef bit<32> calcField_t;
typedef bit<32> IPv4Addr_t;

#define CALC_TYPE   0x1212
#define IPV4_TYPE   0x0800

#define REG_READ 8w0
#define REG_WRITE 8w1

#define INDEX_WIDTH 4 // determines depth of const register

// const register
@Xilinx_MaxLatency(64)
@Xilinx_ControlWidth(INDEX_WIDTH)
extern void jk_reg_rw(in bit<INDEX_WIDTH> index, 
                         in calcField_t newVal, 
                         in bit<8> opCode, 
                         out calcField_t result);

// define opCode types
#define ADD_OP       8w0
#define SUB_OP       8w1
#define LOOKUP_OP    8w2
#define ADD_REG_OP   8w3
#define SET_REG_OP   8w4

// standard Ethernet header
header Ethernet_h { 
    EthAddr_t dstAddr; 
    EthAddr_t srcAddr; 
    bit<16> etherType;
}

header Calc_h {
    calcField_t op1;
    bit<8> opCode;
    calcField_t op2;
    calcField_t result;
}

// IPv4 header without options
header IPv4_h {
    bit<4> version;
    bit<4> ihl;
    bit<8> tos; 
    bit<16> totalLen; 
    bit<16> identification; 
    bit<3> flags;
    bit<13> fragOffset; 
    bit<8> ttl;
    bit<8> protocol; 
    bit<16> hdrChecksum; 
    IPv4Addr_t srcAddr; 
    IPv4Addr_t dstAddr;
}

// List of all recognized headers
struct Parsed_packet { 
    Ethernet_h ethernet; 
    Calc_h calc;
    IPv4_h ipv4;
}

// user defined metadata: can be used to share information between
// TopParser, TopPipe, and TopDeparser 
struct user_metadata_t {
    bit<8>  unused;
}

// digest_data, MUST be 256 bits
struct digest_data_t {
    bit<256> unused;
}

// Parser Implementation
@Xilinx_MaxPacketRegion(1024)
parser TopParser(packet_in b, 
                 out Parsed_packet p, 
                 out user_metadata_t user_metadata,
                 out digest_data_t digest_data,
                 inout sume_metadata_t sume_metadata) {
    state start {
        b.extract(p.ethernet);
        user_metadata.unused = 0;
        digest_data.unused = 0;
        transition select(p.ethernet.etherType) {
            CALC_TYPE: parse_calc;
//            IPV4_TYPE: parse_ipv4;
            default: reject;
        } 
    }

    state parse_calc { 
        b.extract(p.calc);
        transition accept; 
    }
/*
    state parse_ipv4 {
        b.extract(p.ipv4);
        transition accept;
    }
*/
}

// match-action pipeline
control TopPipe(inout Parsed_packet p,
                inout user_metadata_t user_metadata, 
                inout digest_data_t digest_data,
                inout sume_metadata_t sume_metadata) {

    action swap_eth_addresses() {
        EthAddr_t temp = p.ethernet.dstAddr;
        p.ethernet.dstAddr = p.ethernet.srcAddr;
        p.ethernet.srcAddr = temp;
    }

    action l2_set_output_port(bit<8> port_num) {
        sume_metadata.dst_port = port_num;
    }

/*
    action l3_set_output_port(bit<8> port_num) {
        sume_metadata.dst_port = port_num;
    }

    table table_l3 {
        key = {p.ipv4.dstAddr : exact;}
        actions = {
            l3_set_output_port;
            NoAction;
        }
        size = 64;
        default_action = NoAction;
    }
*/



    table table_l2 {
        key = { p.ethernet.dstAddr: exact; }
        actions = {
            l2_set_output_port;
            NoAction;
        }
        size = 64;
        default_action = NoAction;

    }

    action set_pifo_rank (bit<19> pifo_rank){

        sume_metadata.pifo_rank = pifo_rank;
    }

    table table_pifo{

        key = {p.ethernet.dstAddr: exact ;}
        actions = {
            set_pifo_rank;
            NoAction;

        }
        size = 64;
        default_action = NoAction;
    }


    apply {

        table_l2.apply();

        //set pifo rank
        sume_metadata.pifo_valid = 1;
        table_pifo.apply();

        /*
        if(p.ipv4.isValid()){
            table_l3.apply();}
        */
        // bounce packet back to sender
        swap_eth_addresses();


        if(p.calc.isValid()){

            // based on the opCode, set the result or state appropriately
            if (p.calc.opCode == ADD_OP) {
                // TODO: addition
                p.calc.result = p.calc.op1 + p.calc.op2;
            } else if (p.calc.opCode == SUB_OP) {
                // TODO: subtraction
                p.calc.result = p.calc.op1 - p.calc.op2;
            } else if (p.calc.opCode == LOOKUP_OP) {
                // TODO: Key-Value lookup
                //lookup_table.apply(); 
            } else if (p.calc.opCode == ADD_REG_OP || p.calc.opCode == SET_REG_OP) {
                // Read or write register
     
                // Pre-register access: define metadata
                bit<INDEX_WIDTH> index = p.calc.op1[INDEX_WIDTH-1:0];
                calcField_t newVal;
                bit<8> opCode;
                calcField_t regVal;
                
                // Pre-register access: set metadata appropriately
                if (p.calc.opCode == ADD_REG_OP) {
                    newVal = 0;
                    opCode = REG_READ;
                } else {
                    newVal = p.calc.op2;
                    opCode = REG_WRITE;
                }
                // Register access!
                jk_reg_rw(index, newVal, opCode, regVal);

                // set result for ADD_REG operation
                if (p.calc.opCode == ADD_REG_OP) {
                    p.calc.result = p.calc.op2 + regVal;
                }
            } 
        }
    }
}

// Deparser Implementation
@Xilinx_MaxPacketRegion(1024)
control TopDeparser(packet_out b,
                    in Parsed_packet p,
                    in user_metadata_t user_metadata,
                    inout digest_data_t digest_data,
                    inout sume_metadata_t sume_metadata) { 
    apply {
        b.emit(p.ethernet); 
        if(p.calc.isValid()) b.emit(p.calc);
        if(p.ipv4.isValid()) b.emit(p.ipv4);
    }
}


// Instantiate the switch
SimpleSumeSwitch(TopParser(), TopPipe(), TopDeparser()) main;

