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


import os, sys, re, cmd, subprocess, shlex, time
from threading import Thread

sys.path.append(os.path.expandvars('$P4_PROJECT_DIR/testdata/'))
from switch_calc_headers import *
from nf_sim_tools import *

PKT_SIZE = 64
IFACE = "eth1"

ETH_SRC = "08:11:11:11:11:08"
ETH_DST = "08:22:22:22:22:08"

OPCODE_MAP = {'ADD':ADD_OP, '+':ADD_OP, 'SUB':SUB_OP, '-':SUB_OP, 'LOOKUP':LOOKUP_OP, 'ADD_REG':ADD_REG_OP, 'SET_REG':SET_REG_OP}

os.system('sudo ifconfig {0} 10.0.0.10 netmask 255.255.255.0'.format(IFACE))

TCPDUMP = subprocess.Popen(shlex.split("tcpdump -i {0} -w /dev/null".format(IFACE)))
time.sleep(0.1)

class SwitchCalcTester(cmd.Cmd):
    """The HW testing tool for the switch_calc design"""

    prompt = "testing> "
    intro = "The HW testing tool for the switch_calc design\n type help to see all commands"

    def _to_int(self, op):
        try: 
            val = int(op, 0)
            assert(val >= 0)
            return val
        except:
            print >> sys.stderr, "ERROR: operands must be valid positive integers"
            return -1

    """
    Submit packet to the switch and print the results
    """
    def _submit_pkt(self, pkt):
        rcvd_pkt = srp1(pkt, iface=IFACE)

        width = 10
        n = 9
        fmat_string = "|  ETHERNET  | OP1:{0:<{width}} OP_CODE:{1:<{width}} OP2:{2:<{width}} RESULT:{3:<{width}}        |"
        print "Sent pkt: "
        print "{0:-<{width}}".format("-", width=n*width)
        print fmat_string.format(pkt[Calc].op1, pkt[Calc].opCode, pkt[Calc].op2, pkt[Calc].result, width=width)
        print "{0:-<{width}}\n".format("-", width=n*width)

        print "Received pkt: "
        print "{0:-<{width}}".format("-", width=n*width)
        print fmat_string.format(rcvd_pkt[Calc].op1, rcvd_pkt[Calc].opCode, rcvd_pkt[Calc].op2, rcvd_pkt[Calc].result, width=width)
        print "{0:-<{width}}\n".format("-", width=n*width)

    def _parse_line(self, line):
        args = line.split()
        if (len(args) != 3):
            print >> sys.stderr, "ERROR: usage..."
            self.help_run_test()
            return
        op1 = self._to_int(args[0])
        operation = args[1]
        op2 = self._to_int(args[2])
        if op1 == -1 or op2 == -1:
            return
        if (operation not in OPCODE_MAP.keys()):
            print >> sys.stderr, "ERROR: {0} is not a supported operation".format(operation)
            return
        opCode = OPCODE_MAP[operation]

        pkt = Ether(dst=ETH_DST, src=ETH_SRC) / Calc(op1=op1, opCode=opCode, op2=op2, result=0)
        pkt = pad_pkt(pkt, PKT_SIZE) # pad pkt to desired size
        return pkt

    def do_run_test(self, line):
        pkt = self._parse_line(line) 
        self._submit_pkt(pkt)

    def help_run_test(self):
        print """
run_test <op1> <operation> <op2>
DESCRIPTION: Create a single test packet to test the functionality of the switch_calc implementation
NOTES:
    <operation> : must be one of the following [ADD, +, SUB, -, LOOKUP, ADD_REG, SET_REG] 
    LOOKUP : <op1> = the key to lookup, <op2> = unused
    ADD_REG / SET_REG : <op1> = register index, <op2> = value 
"""

    def do_exit(self, line):
        if (TCPDUMP.poll() is None):
            TCPDUMP.terminate()
        sys.exit(0)

    def do_EOF(self, line):
        print ""
        if (TCPDUMP.poll() is None):
            TCPDUMP.terminate()
        return True

if __name__ == '__main__':
    if len(sys.argv) > 1:
        SwitchCalcTester().onecmd(' '.join(sys.argv[1:]))
        if (TCPDUMP.poll() is None):
            TCPDUMP.terminate()
    else:
        SwitchCalcTester().cmdloop()
