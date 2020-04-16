
import logging
import cocotb
import random

from cocotb.clock import Clock
from cocotb.triggers import Timer, ReadOnly, RisingEdge, ClockCycles, FallingEdge
from cocotb.binary import BinaryValue
from cocotb.axi4stream import AXI4StreamMaster, AXI4StreamSlave, AXI4StreamStats, CycleCounter
from cocotb.result import TestFailure

from metadata import Metadata
from scapy.all import Ether, IP, TCP, hexdump, rdpcap

# Add include directory for python sims
import sys, os

NUM_PKTS = 3
PKT_LEN = 87 # bytes

INGRESS_LINK_RATE = 1 # Gbps

START_DELAY = 100
PERIOD = 5000
IDLE_TIMEOUT = PERIOD*1000

BP_COUNT = 0

@cocotb.coroutine
def reset_dut(dut):
    # Reset the DUT
    dut._log.debug("Resetting DUT")
    dut.axis_resetn <= 0
    yield ClockCycles(dut.axis_aclk, 10)
    dut.axis_resetn <= 1
    dut._log.debug("Out of reset")

def make_meta(pkts_in):
    meta_in = []
    for p in pkts_in:
        meta = Metadata(pkt_len=len(p))
        tuser = BinaryValue(bits=len(meta)*8, bigEndian=False)
        tuser.set_buff(str(meta))
        meta_in.append(tuser)   
    return meta_in

def make_pkts_meta_in():
    pkts_in = []
    for i in range(NUM_PKTS):
        pkt = Ether() / ('\x00'*(PKT_LEN-14))
        pkts_in.append(pkt)

    meta_in = make_meta(pkts_in)

    print 'len(pkts_in) = {}'.format(len(pkts_in))
    return pkts_in, meta_in

def check_pkts(pkts_in, pkts_out):
    if len(pkts_in) != len(pkts_out):
        print 'ERROR: Applied {} pkts, Received {} pkts'.format(len(pkts_in), len(pkts_out))

    for p_in, p_out, i in zip(pkts_in, pkts_out, range(NUM_PKTS)):
        if str(p_in) != str(p_out):
            print 'ERROR: packet # {} -- input packet != output packet'.format(i)

@cocotb.test()
def test_axis_fifo(dut):
    """Test to make sure that axis_fifo is working properly.
    """
    # start HW sim clock
    cocotb.fork(Clock(dut.axis_aclk, PERIOD).start())

    yield reset_dut(dut)
    yield ClockCycles(dut.axis_aclk, START_DELAY)

    # read the pkts and rank values
    pkts_in, meta_in = make_pkts_meta_in()

    # Attach an AXI4Stream Master to the input pkt interface
    pkt_master = AXI4StreamMaster(dut, 's_axis', dut.axis_aclk)

    # Attach an AXI4StreamSlave to the output pkt interface
    pkt_slave = AXI4StreamSlave(dut, 'm_axis', dut.axis_aclk, tready_delay=BP_COUNT, idle_timeout=IDLE_TIMEOUT)

    # start reading for pkts
    pkt_slave_thread = cocotb.fork(pkt_slave.read_n_pkts(len(pkts_in), log_raw=True))

    # Send pkts and metadata in the HW sim
    rate = 1.0*INGRESS_LINK_RATE*5/8.0 # bytes/cycle
    pkt_master_thread = cocotb.fork(pkt_master.write_pkts(pkts_in, meta_in, rate=rate))

    yield pkt_master_thread.join()

    # Wait for the pkt_slave to finish (or timeout)
    yield pkt_slave_thread.join()

    pkts_out = pkt_slave.pkts
    meta_out = pkt_slave.metadata

    yield ClockCycles(dut.axis_aclk, 20)

    print 'len(pkts_out) = {}'.format(len(pkts_out))
    check_pkts(pkts_in, pkts_out)

