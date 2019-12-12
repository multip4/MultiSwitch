from NFTest import *
import sys, os, re, json
from fcntl import *
from ctypes import *
from collections import OrderedDict

# Loading the SUME shared library
print "loading libsume.."
lib_path=os.path.join(os.environ['SUME_FOLDER'],'lib','sw','std','hwtestlib','libsume.so')
libsume=cdll.LoadLibrary(lib_path)

# argtypes for the functions called from  C
libsume.regread.argtypes = [c_uint]
libsume.regwrite.argtypes= [c_uint, c_uint]

#0x43400110

addr = int("0x43040010",0)
print libsume.regread(addr)
