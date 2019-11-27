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

INDEX_WIDTH = 4
REG_DEPTH = 2**INDEX_WIDTH

NUM_KEYS = 4
lookup_table = {0: 0x00000001, 1: 0x00000010, 2: 0x00000100, 3: 0x00001000}


def test_calc_packet(SMAC, DMAC,port_name,length, pad_str='\x00'):
    global pktCnt
    pktCnt += 1
    pkt = Ether(dst=DMAC, src=SMAC) / IP(src='192.168.0.2', dst='10.10.10.1')
    pkt = pad_pkt(pkt, length,pad_str)
    applyPkt(pkt, port_name, pktCnt)
    expPkt(pkt, 'nf0')


for i in range(1,20):
    test_calc_packet("01:11:11:11:11:01", "01:11:11:11:11:01",'nf0',640, pad_str='\x01')
    test_calc_packet("01:22:22:22:22:01", "01:22:22:22:22:01",'nf1',96, pad_str='\x02')
    test_calc_packet("01:33:33:33:33:01", "01:33:33:33:33:01", 'nf2',128, pad_str='\x03')
    test_calc_packet("01:44:44:44:44:01", "01:44:44:44:44:01", 'nf3',256, pad_str='\x04')

write_pcap_files()

