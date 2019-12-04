
from NFTest import *

NUM_WRITES = 16

def config_tables():
    nftest_regwrite(0x44020050, 0x00000000)
    nftest_regwrite(0x44020080, 0x00000001)
    nftest_regwrite(0x44020084, 0x00000001)
    nftest_regwrite(0x44020040, 0x00000001)
    nftest_regwrite(0x44020050, 0x00000001)
    nftest_regwrite(0x44020080, 0x00000010)
    nftest_regwrite(0x44020084, 0x00000001)
    nftest_regwrite(0x44020040, 0x00000001)
    nftest_regwrite(0x44020050, 0x00000002)
    nftest_regwrite(0x44020080, 0x00000100)
    nftest_regwrite(0x44020084, 0x00000001)
    nftest_regwrite(0x44020040, 0x00000001)
    nftest_regwrite(0x44020050, 0x00000003)
    nftest_regwrite(0x44020080, 0x00001000)
    nftest_regwrite(0x44020084, 0x00000001)
    nftest_regwrite(0x44020040, 0x00000001)
