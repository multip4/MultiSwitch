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


from scapy.all import *
import sys, os

CALC_TYPE = 0x1212

ADD_OP     =  0
SUB_OP     =  1
LOOKUP_OP  =  2
ADD_REG_OP =  3
SET_REG_OP =  4

class Calc(Packet):
    name = "Calc"
    fields_desc = [
        IntField("op1", 0),
        ByteEnumField("opCode", 0, {ADD_OP:"ADD", SUB_OP:"SUB", LOOKUP_OP:"LOOKUP", ADD_REG_OP:"ADD_REG", SET_REG_OP:"SET_REG"}),
        IntField("op2", 0),
        IntField("result", 0)
    ]
    def mysummary(self):
        return self.sprintf("op1=%op1% %opCode% op2=%op2% result=%result%")
    

bind_layers(Ether, Calc, type=CALC_TYPE)
bind_layers(Calc, Raw)

