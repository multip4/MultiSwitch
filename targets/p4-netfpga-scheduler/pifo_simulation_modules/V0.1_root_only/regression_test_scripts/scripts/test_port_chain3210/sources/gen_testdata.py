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

#####################
# generate testdata #
#####################

MAC1 = "08:11:11:11:11:08"
MAC2 = "08:22:22:22:22:08"
pktCnt = 0


NUM_KEYS = 4
lookup_table = {0: 0x00000001, 1: 0x00000010, 2: 0x00000100, 3: 0x00001000}

sss_sdnet_tuples.clear_tuple_files()

mask = ['\x00','\x01','\x02','\x03','\x04','\x05','\x06','\x07','\x08','\x09',
		'\x10','\x11','\x12','\x13','\x14','\x15','\x16','\x17','\x18','\x19',
		'\x20','\x21','\x22','\x23','\x24','\x25','\x26','\x27','\x28','\x29',
		'\x30','\x31','\x32','\x33','\x34','\x35','\x36','\x37','\x38','\x39',
		'\x40','\x41','\x42','\x43','\x44','\x45','\x46','\x47','\x48','\x49',
		'\x50','\x51','\x52','\x53','\x54','\x55','\x56','\x57','\x58','\x59',
		'\x60','\x61','\x62','\x63','\x64','\x65','\x66','\x67','\x68','\x69',
		'\x70','\x71','\x72','\x73','\x74','\x75','\x76','\x77','\x78','\x79',
		'\x80','\x81','\x82','\x83','\x84','\x85','\x86','\x87','\x88','\x89',
		'\x90','\x91','\x92','\x93','\x94','\x95','\x96','\x97','\x98','\x99',
]

def pad_pkt(pkt, size, id = 0):
    count = 1

    pkt = pkt / ('\x00'* (30 - len(pkt) % 32))
    pkt = pkt / mask[id]/ '\xff'

    while len(pkt) < size:
    	# print "Packet Length, Padding Mask", len(pkt), count
    	# mask = '\x00'+"{:02x}".format(count)
    	# mask = '\x01' + str(count)
    	# print len(mask), mask
    	# mask = str(hex("{:02x}".format(count)))
    	pkt = pkt / (mask[count]* 32)
    	count +=1

    return pkt

    # if len(pkt) >= size:
    #     return pkt
    # else:
    #     while len(pkt)

    #     return pkt / (str*(size - len(pkt)))

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
# send a sample paket #
#####################
def send_pkt(SMAC, DMAC,input_port,ouput_port,length,id=0):
    global pktCnt
    pktCnt += 1
    pkt = Ether(dst=DMAC, src=SMAC)/IP()
    # pkt = pad_pkt(pkt, length, hex(length))
    pkt = pad_pkt(pkt, length, id)
    
    applyPkt(pkt, input_port, pktCnt)
    expPkt(pkt, ouput_port)


def test_fixed_size_senario(size):
	print "configuaring  size data {}".format(size)

	for i in range(50):
		send_pkt("ab:00:00:00:00:ab", "ab:00:00:00:00:ab",'nf3','nf0',size, i)

	write_pcap_files()
	
test_fixed_size_senario(128)