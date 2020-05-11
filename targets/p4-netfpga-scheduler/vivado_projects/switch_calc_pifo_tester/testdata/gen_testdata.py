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





def test_calc_packet(SMAC, DMAC,port_name,length, pad_str='\x00'):
    global pktCnt
    pktCnt += 1
    pkt = Ether(dst=DMAC, src=SMAC) / IP(src='192.168.0.2', dst='10.10.10.1')
    pkt = pad_pkt(pkt, length)
    applyPkt(pkt, port_name, pktCnt)
    expPkt(pkt, 'nf0')


#####################
# send a sample paket #
#####################
def send_normal_pkt(SMAC, DMAC,input_port,ouput_port):
    global pktCnt
    pktCnt += 1
    pkt = Ether(dst=DMAC, src=SMAC)
    pkt = pad_pkt(pkt,64)
    applyPkt(pkt, input_port, pktCnt)
    expPkt(pkt, ouput_port)

#####################
# send a drop paket #
#####################
def send_drop_pkt(SMAC, DMAC,input_port):
    global pktCnt
    pktCnt += 1
    pkt = Ether(dst=DMAC, src=SMAC)
    pkt = pad_pkt(pkt, 64)
    applyPkt(pkt, input_port, pktCnt)


#####################
# send a sample paket #
#####################
def send_pkt(SMAC, DMAC,input_port,ouput_port,pad_str,length):
    global pktCnt
    pktCnt += 1
    pkt = Ether(dst=DMAC, src=SMAC)/Raw(load=pad_str)
    pkt = pad_pkt(pkt, length)
    applyPkt(pkt, input_port, pktCnt)
    expPkt(pkt, ouput_port)

#####################
# send a 64 byte packet padd with 0x00 #
#####################
def send_64plus32payload_pkt(SMAC, DMAC,input_port,ouput_port,pad_str):
    global pktCnt
    pktCnt += 1
    pkt_str = '0x'+str(pktCnt)
    pkt = Ether(dst=DMAC, src=SMAC)/Raw(load=pkt_str)
    pkt = pad_pkt(pkt, 64)

    pkt = pkt/Raw(pad_str)
    pkt = pad_pkt(pkt, 96) 

    applyPkt(pkt, input_port, pktCnt)
    expPkt(pkt, ouput_port)


#####################
# send normal pkt
#####################
def test_port_senario():
	print "configuaring normal scenario data..."
	send_normal_pkt("01:11:11:11:11:01", "01:11:11:11:11:01",'nf0','nf0')
	send_normal_pkt("01:11:11:11:11:02", "01:11:11:11:11:02",'nf1','nf1')
	send_normal_pkt("01:11:11:11:11:03", "01:11:11:11:11:03",'nf2','nf2')
	send_normal_pkt("01:11:11:11:11:04", "01:11:11:11:11:04",'nf3','nf3')
	write_pcap_files()



#####################
# port not set scenario
#####################
def test_port_unset_senario():
	print "configuaring port not set scenario data..."
	send_normal_pkt("01:11:11:11:11:01", "01:11:11:11:11:01",'nf0','nf0')
	send_normal_pkt("01:11:11:11:11:02", "01:11:11:11:11:02",'nf1','nf1')
	send_normal_pkt("01:11:11:11:11:03", "01:11:11:11:11:03",'nf2','nf2')
	send_normal_pkt("01:11:11:11:11:04", "01:11:11:11:11:04",'nf3','nf3')
	send_drop_pkt("01:11:11:11:11:01", "01:11:11:11:11:05",'nf0') # port not set
	send_drop_pkt("01:11:11:11:11:02", "01:11:11:11:11:05",'nf1') # port not set
	send_drop_pkt("01:11:11:11:11:03", "01:11:11:11:11:05",'nf2') # port not set
	send_drop_pkt("01:11:11:11:11:04", "01:11:11:11:11:05",'nf3') # port not set
	write_pcap_files()


#####################
# drop test#
#####################
def test_drop_senario():
	print "configuaring drop scenario data..."
	send_normal_pkt("01:11:11:11:11:01", "01:11:11:11:11:01",'nf0','nf0')
	send_normal_pkt("01:11:11:11:11:02", "01:11:11:11:11:02",'nf1','nf1')
	send_normal_pkt("01:11:11:11:11:03", "01:11:11:11:11:03",'nf2','nf2')
	send_normal_pkt("01:11:11:11:11:04", "01:11:11:11:11:04",'nf3','nf3')
	send_drop_pkt("01:11:11:11:11:01", "01:11:11:11:11:11",'nf0') # drop sig 1
	send_drop_pkt("01:11:11:11:11:02", "01:11:11:11:11:12",'nf1') # drop sig 1
	send_drop_pkt("01:11:11:11:11:03", "01:11:11:11:11:13",'nf2') # drop sig 1
	send_drop_pkt("01:11:11:11:11:04", "01:11:11:11:11:14",'nf3') # drop sig 1
	write_pcap_files()


def test_wrr_senario():
	for counter in range (0, 40): 
		send_normal_pkt("01:11:11:11:11:01", "01:11:11:11:11:01",'nf0','nf0')
		send_normal_pkt("01:11:11:11:11:02", "01:11:11:11:11:01",'nf1','nf0')
	write_pcap_files()

def test_diff_payload():
	payload_size = 32
	payload_str = '0b'

	full_fild_chunk = payload_str;

	for bit_ddr in range (0, payload_size):
		full_fild_chunk += '1'
	print full_fild_chunk


	unfild_chunk = payload_str;

	for bit_ddr in range (1, payload_size):
		unfild_chunk += '0'
	print unfild_chunk

	print "send full-fild and unfild packets"
	for from_port in range (0, 4):
		for to_port in range (0, 4):
			send_64plus32payload_pkt("01:11:11:11:11:0"+str(from_port+1), "01:11:11:11:11:0"+str(to_port+1),'nf'+str(from_port),'nf'+str(to_port),full_fild_chunk)
			send_64plus32payload_pkt("01:11:11:11:11:0"+str(from_port+1), "01:11:11:11:11:0"+str(to_port+1),'nf'+str(from_port),'nf'+str(to_port),unfild_chunk)


	zero_fild_chunk = payload_str
	one_fild_chunk = payload_str

	for diffbit in range (0, payload_size):
		for counter in range (0, payload_size):
			if counter == diffbit :
				zero_fild_chunk+= '1'
				one_fild_chunk += '0'
			else :
				zero_fild_chunk+= '0'
				one_fild_chunk += '1'

		print "send "+str(diffbit)+" th bit diff packets:"
		print zero_fild_chunk
		print one_fild_chunk

		for from_port in range (0, 4):
			for to_port in range (0, 4):
				send_64plus32payload_pkt("01:11:11:11:11:0"+str(from_port+1), "01:11:11:11:11:0"+str(to_port+1),'nf'+str(from_port),'nf'+str(to_port),one_fild_chunk)
				send_64plus32payload_pkt("01:11:11:11:11:0"+str(from_port+1), "01:11:11:11:11:0"+str(to_port+1),'nf'+str(from_port),'nf'+str(to_port),zero_fild_chunk)

		zero_fild_chunk = payload_str
		one_fild_chunk = payload_str
	write_pcap_files()


#####################
# send size increasing packets #
#####################
def test_diff_size_senario():	
	startSize = 64
	lastSize = 1500

	print "configuaring diff size data..."

	for pktSize in range (startSize, lastSize):
		send_pkt("01:11:11:11:11:01", "01:11:11:11:11:01",'nf0','nf0',str(pktSize),pktSize)
		send_pkt("01:11:11:11:11:01", "01:11:11:11:11:02",'nf0','nf1',str(pktSize),pktSize)
		send_pkt("01:11:11:11:11:01", "01:11:11:11:11:03",'nf0','nf2',str(pktSize),pktSize)
		send_pkt("01:11:11:11:11:01", "01:11:11:11:11:04",'nf0','nf3',str(pktSize),pktSize)
		send_pkt("01:11:11:11:11:02", "01:11:11:11:11:01",'nf1','nf0',str(pktSize),pktSize)
		send_pkt("01:11:11:11:11:02", "01:11:11:11:11:02",'nf1','nf1',str(pktSize),pktSize)
		send_pkt("01:11:11:11:11:02", "01:11:11:11:11:03",'nf1','nf2',str(pktSize),pktSize)
		send_pkt("01:11:11:11:11:02", "01:11:11:11:11:04",'nf1','nf3',str(pktSize),pktSize)
		send_pkt("01:11:11:11:11:03", "01:11:11:11:11:01",'nf2','nf0',str(pktSize),pktSize)
		send_pkt("01:11:11:11:11:03", "01:11:11:11:11:02",'nf2','nf1',str(pktSize),pktSize)
		send_pkt("01:11:11:11:11:03", "01:11:11:11:11:03",'nf2','nf2',str(pktSize),pktSize)
		send_pkt("01:11:11:11:11:03", "01:11:11:11:11:04",'nf2','nf3',str(pktSize),pktSize)
		send_pkt("01:11:11:11:11:04", "01:11:11:11:11:01",'nf3','nf0',str(pktSize),pktSize)
		send_pkt("01:11:11:11:11:04", "01:11:11:11:11:02",'nf3','nf1',str(pktSize),pktSize)
		send_pkt("01:11:11:11:11:04", "01:11:11:11:11:03",'nf3','nf2',str(pktSize),pktSize)
		send_pkt("01:11:11:11:11:04", "01:11:11:11:11:04",'nf3','nf3',str(pktSize),pktSize)
	write_pcap_files()