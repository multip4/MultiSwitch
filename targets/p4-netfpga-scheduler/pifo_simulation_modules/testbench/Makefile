# Makefile to build the testdata

all:
	./gen_testdata.py
	${SUME_SDNET}/bin/pcap2axi --output Packet_in.axi --bus_width 256 src.pcap
	${SUME_SDNET}/bin/pcap2axi --output Packet_expect.axi --bus_width 256 dst.pcap
clean:
	rm -f *.pcap *.txt *.pyc *.axi config_writes.* *_reg_defines.py
