
from NFTest import *

NUM_WRITES = 18

def config_tables():
    nftest_regwrite(0x44020050, 0x11111101)
    nftest_regwrite(0x44020054, 0x00000111)
    nftest_regwrite(0x44020080, 0x00002101)
    nftest_regwrite(0x44020040, 0x00000001)
    nftest_regwrite(0x44020050, 0x22222201)
    nftest_regwrite(0x44020054, 0x00000122)
    nftest_regwrite(0x44020080, 0x00002201)
    nftest_regwrite(0x44020040, 0x00000001)
    nftest_regwrite(0x44020050, 0x33333301)
    nftest_regwrite(0x44020054, 0x00000133)
    nftest_regwrite(0x44020080, 0x00002301)
    nftest_regwrite(0x44020040, 0x00000001)
    nftest_regwrite(0x44020050, 0x44444401)
    nftest_regwrite(0x44020054, 0x00000144)
    nftest_regwrite(0x44020080, 0x00002401)
    nftest_regwrite(0x44020040, 0x00000001)
    nftest_regwrite(0x44020101, 0x00000001)
    nftest_regwrite(0x44020102, 0x00000005)
    nftest_regwrite(0x44020103, 0x0000000a)
    nftest_regwrite(0x44020104, 0x00000005)