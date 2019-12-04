#!/usr/bin/env python

#
# Copyright (c) 2017 Stephen Ibanez
# All rights reserved.
#
# This software was developed by Stanford University and the University of Cambridge Computer Laboratory 
# under National Science Foundation under Grant No. CNS-0855268,
# the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and
# by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), 
# as part of the DARPA MRC research programme.
#
# @NETFPGA_LICENSE_HEADER_START@
#
# Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor
# license agreements.  See the NOTICE file distributed with this work for
# additional information regarding copyright ownership.  NetFPGA licenses this
# file to you under the NetFPGA Hardware-Software License, Version 1.0 (the
# "License"); you may not use this file except in compliance with the
# License.  You may obtain a copy of the License at:
#
#   http://www.netfpga-cic.org
#
# Unless required by applicable law or agreed to in writing, Work distributed
# under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
# CONDITIONS OF ANY KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations under the License.
#
# @NETFPGA_LICENSE_HEADER_END@
#


from switch_calc_headers import * 
from nf_sim_tools import *
import random
from collections import OrderedDict
import sss_sdnet_tuples


########################
# pkt generation tools #
########################

pktsApplied = []
pktsExpected = []

# Pkt lists for SUME simulations
nf_applied = OrderedDict()
nf_applied[0] = []
nf_applied[1] = []
nf_applied[2] = []
nf_applied[3] = []
nf_expected = OrderedDict()
nf_expected[0] = []
nf_expected[1] = []
nf_expected[2] = []
nf_expected[3] = []

nf_port_map = {"nf0":0b00000001, "nf1":0b00000100, "nf2":0b00010000, "nf3":0b01000000, "dma0":0b00000010}
nf_id_map = {"nf0":0, "nf1":1, "nf2":2, "nf3":3}

sss_sdnet_tuples.clear_tuple_files()

def applyPkt(pkt, ingress, time):
    pktsApplied.append(pkt)
    sss_sdnet_tuples.sume_tuple_in['src_port'] = nf_port_map[ingress]
    sss_sdnet_tuples.sume_tuple_expect['src_port'] = nf_port_map[ingress]
    pkt.time = time
    nf_applied[nf_id_map[ingress]].append(pkt)

def expPkt(pkt, egress):
    pktsExpected.append(pkt)
    sss_sdnet_tuples.sume_tuple_expect['pifo_info'] = 0x80000000
    sss_sdnet_tuples.sume_tuple_expect['dst_port'] = nf_port_map[egress]
    sss_sdnet_tuples.write_tuples()
    if egress in ["nf0","nf1","nf2","nf3"]:
        nf_expected[nf_id_map[egress]].append(pkt)
    elif egress == 'bcast':
        nf_expected[0].append(pkt)
        nf_expected[1].append(pkt)
        nf_expected[2].append(pkt)
        nf_expected[3].append(pkt)

def print_summary(pkts):
    for pkt in pkts:
        print "summary = ", pkt.summary()

def write_pcap_files():
    wrpcap("src.pcap", pktsApplied)
    wrpcap("dst.pcap", pktsExpected)

    for i in nf_applied.keys():
        if (len(nf_applied[i]) > 0):
            wrpcap('nf{0}_applied.pcap'.format(i), nf_applied[i])

    for i in nf_expected.keys():
        if (len(nf_expected[i]) > 0):
            wrpcap('nf{0}_expected.pcap'.format(i), nf_expected[i])

    for i in nf_applied.keys():
        print "nf{0}_applied times: ".format(i), [p.time for p in nf_applied[i]]

#####################
# generate testdata #
#####################

MAC1 = "08:11:11:11:11:08"
MAC2 = "08:22:22:22:22:08"
pktCnt = 0
PKT_SIZE = 64

INDEX_WIDTH = 4
REG_DEPTH = 2**INDEX_WIDTH

NUM_KEYS = 4
lookup_table = {0: 0x00000001, 1: 0x00000010, 2: 0x00000100, 3: 0x00001000}

def pad_pkt(pkt, size, str):
    if len(pkt) >= size:
        return pkt
    else:
        return pkt / (str*(size - len(pkt)))


# Test the addition functionality
def test_add(OP1, OP2): 
    # Create a packet to test the addition operation using OP1 and OP2
    # and apply it to the switch. Also create the expected packet and
    # indicate it should be expected on a particular interface.
    global pktCnt
    pkt = Ether(dst=MAC2, src=MAC1) / Calc(op1=OP1, opCode=ADD_OP, op2=OP2, result=0)
    pkt = pad_pkt(pkt, PKT_SIZE,'\x01')
    applyPkt(pkt, 'nf0', pktCnt)
    pktCnt += 1
    pkt = Ether(dst=MAC1, src=MAC2) / Calc(op1=OP1, opCode=ADD_OP, op2=OP2, result=OP1+OP2)
    pkt = pad_pkt(pkt, PKT_SIZE,'\x01')
    expPkt(pkt, 'nf0')

# Test the subtraction functionality
def test_sub(OP1, OP2):
    global pktCnt
    pkt = Ether(dst=MAC2, src=MAC1) / Calc(op1=OP1, opCode=SUB_OP, op2=OP2, result=0)
    pkt = pad_pkt(pkt, PKT_SIZE,'\x02')
    applyPkt(pkt, 'nf1', pktCnt)
    pktCnt += 1
    pkt = Ether(dst=MAC1, src=MAC2) / Calc(op1=OP1, opCode=SUB_OP, op2=OP2, result=OP1-OP2)
    pkt = pad_pkt(pkt, PKT_SIZE,'\x02')
    expPkt(pkt, 'nf0')

# Test the key-vaule lookup functionality 
def test_lookup(OP1):
    global pktCnt
    key = (OP1 % NUM_KEYS)
    pkt = Ether(dst=MAC2, src=MAC1) / Calc(op1=key, opCode=LOOKUP_OP, op2=0, result=0)
    pkt = pad_pkt(pkt, PKT_SIZE,'\x03')
    applyPkt(pkt, 'nf2', pktCnt)
    pktCnt += 1
    pkt = Ether(dst=MAC1, src=MAC2) / Calc(op1=key, opCode=LOOKUP_OP, op2=0, result=lookup_table[key])
    pkt = pad_pkt(pkt, PKT_SIZE,'\x03')
    expPkt(pkt, 'nf0')   

# Test the register functionality
def test_reg(OP1, OP2): 
    global pktCnt
    index = OP1 % REG_DEPTH
    val = OP2
    # test set reg
    pkt = Ether(dst=MAC2, src=MAC1) / Calc(op1=index, opCode=SET_REG_OP, op2=val, result=0)
    pkt = pad_pkt(pkt, PKT_SIZE,'\x04')
    applyPkt(pkt, 'nf3', pktCnt)
    pktCnt += 1
    pkt = Ether(dst=MAC1, src=MAC2) / Calc(op1=index, opCode=SET_REG_OP, op2=val, result=0)
    pkt = pad_pkt(pkt, PKT_SIZE,'\x04')
    expPkt(pkt, 'nf0')
    # test add reg
    pkt = Ether(dst=MAC2, src=MAC1) / Calc(op1=index, opCode=ADD_REG_OP, op2=val, result=0) 
    pkt = pad_pkt(pkt, PKT_SIZE)
    applyPkt(pkt, 'nf3', pktCnt,'\x04')
    pktCnt += 1
    pkt = Ether(dst=MAC1, src=MAC2) / Calc(op1=index, opCode=ADD_REG_OP, op2=val, result=val+val) 
    pkt = pad_pkt(pkt, PKT_SIZE,'\x04')
    expPkt(pkt, 'nf0')

for i in range(5):
    op1 = random.randint(0,2**31) 
    op2 = random.randint(0,2**31) 
    while op1 < op2:
        op2 = random.randint(0,2**31) 
    test_add(op1, op2)
    test_sub(op1, op2)
    test_lookup(op1)
    # test_reg(op1, op2)

write_pcap_files()
