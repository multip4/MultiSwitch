#!/usr/bin/env python

import subprocess
import sys

output_file = open(sys.argv[2], "w")
output_file.write("memory_initialization_radix=10;\n")
output_file.write("memory_initialization_vector=")

depth = int(sys.argv[1])

for i in range(1,depth):
	# output_file.write(str(4096-i) + ","+"\n")
	output_file.write(str(i) + " ")

output_file.write(str(depth-1) + ";")
output_file.write("\n")
# output_file.write("4095,\n")

# output_file.write("1;\n")