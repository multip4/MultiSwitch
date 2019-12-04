#!/usr/bin/env python

#
# Copyright (c) 2015 University of Cambridge
# Copyright (c) 2015 Neelakandan Manihatty Bojan, Georgina Kalogeridou
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
# Author:
#        Modified by Neelakandan Manihatty Bojan, Georgina Kalogeridou

import logging
logging.getLogger("scapy.runtime").setLevel(logging.ERROR)

from NFTest import *
import sys, os, random, json
from nf_sim_tools import *
from collections import OrderedDict

import config_writes

sys.path.append(os.path.expandvars('$P4_PROJECT_DIR/testdata/'))
from switch_calc_headers import * 

# read the externs defined in the P4 program
EXTERN_DEFINES_FILE = os.path.expandvars('$P4_PROJECT_DIR/testdata/SimpleSumeSwitch_extern_defines.json')
with open(EXTERN_DEFINES_FILE) as f:
    p4_externs = json.load(f)

phy2loop0 = ('../connections/conn', [])
nftest_init(sim_loop = [], hw_config = [phy2loop0])

print "About to start the test"

nftest_start()

def schedule_pkts(pkt_list, iface):
    for pkt in pkt_list:
        pkt.time = baseTime + delta*pkt.time
        pkt.tuser_sport = nf_port_map[iface]

# configure the tables in the P4_SWITCH
nftest_regwrite(0x440200f0, 0x00000001)
nftest_regwrite(0x440200f0, 0x00000001)
nftest_regwrite(0x440200f0, 0x00000001)
nftest_regwrite(0x440200f0, 0x00000001)
nftest_regwrite(0x440200f0, 0x00000001)
config_writes.config_tables()

# send packets after the configuration writes have finished
#baseTime = 1044e-9 + (232e-9)*config_writes.NUM_WRITES #120e-6
baseTime = 20e-6
delta = 1e-6 #1e-8

###########
# pkt generation tools
###########

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

def applyPkt(pkt, ingress, time):
    pkt.time = time
    nf_applied[nf_id_map[ingress]].append(pkt)

def expPkt(pkt, egress): 
    if egress in ["nf0","nf1","nf2","nf3"]:
        nf_expected[nf_id_map[egress]].append(pkt)
    elif egress == "bcast":
        nf_expected[0].append(pkt)
        nf_expected[1].append(pkt)
        nf_expected[2].append(pkt)
        nf_expected[3].append(pkt)

#####################
# generate testdata #
#####################

MAC1 = "08:11:11:11:11:08"
MAC2 = "08:22:22:22:22:08"
pktCnt = 0

INDEX_WIDTH = 4
REG_DEPTH = 2**INDEX_WIDTH

NUM_KEYS = 4
lookup_table = {1: 0x00000001, 2: 0x00000010, 3: 0x00000100, 4: 0x00001000}

CONST_REG = {}

for i in range(REG_DEPTH):
    CONST_REG[i] = i

# write the const register entires
for i in range(REG_DEPTH):
    nftest_regwrite(p4_externs['const']['base_addr'] + i, CONST_REG[i])

def test_reg_add(index, val): 
    global pktCnt
    pkt = Ether(dst=MAC2, src=MAC1) / Calc(op1=index, opCode=ADD_REG_OP, op2=val, result=0) 
    pkt = pad_pkt(pkt, 64)
    applyPkt(pkt, 'nf0', pktCnt)
    pktCnt += 1
    pkt = Ether(dst=MAC1, src=MAC2) / Calc(op1=index, opCode=ADD_REG_OP, op2=val, result=CONST_REG[index] + val) 
    pkt = pad_pkt(pkt, 64)
    expPkt(pkt, 'nf0')

def test_reg_set(index, val):
    global pktCnt
    # test set reg
    pkt = Ether(dst=MAC2, src=MAC1) / Calc(op1=index, opCode=SET_REG_OP, op2=val, result=0)
    pkt = pad_pkt(pkt, 64)
    applyPkt(pkt, 'nf0', pktCnt)
    pktCnt += 1
    pkt = Ether(dst=MAC1, src=MAC2) / Calc(op1=index, opCode=SET_REG_OP, op2=val, result=0)
    pkt = pad_pkt(pkt, 64)
    expPkt(pkt, 'nf0')

# generate the test data

for i in range(5):
    index = random.randint(0,REG_DEPTH-1) 
    val = random.randint(0,2**31) 
    test_reg_add(index, val)

for i in range(5):
    index = random.randint(0,REG_DEPTH-1) 
    val = random.randint(0,2**31) 
    test_reg_set(index, val)
    CONST_REG[index] = val

schedule_pkts(nf_applied[0], 'nf0')
schedule_pkts(nf_applied[1], 'nf1')
schedule_pkts(nf_applied[2], 'nf2')
schedule_pkts(nf_applied[3], 'nf3')

# Apply and check the packets
nftest_send_phy('nf0', nf_applied[0])
nftest_send_phy('nf1', nf_applied[1])
nftest_send_phy('nf2', nf_applied[2])
nftest_send_phy('nf3', nf_applied[3])
nftest_expect_phy('nf0', nf_expected[0])
nftest_expect_phy('nf1', nf_expected[1])
nftest_expect_phy('nf2', nf_expected[2])
nftest_expect_phy('nf3', nf_expected[3])

nftest_barrier()

# check to make sure the register entries were set correctly by the data-plane
for i in range(REG_DEPTH):
    nftest_regread_expect(p4_externs['const']['base_addr'] + i, CONST_REG[i])

nftest_barrier()

mres=[]
nftest_finish(mres)

