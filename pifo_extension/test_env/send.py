from scapy.all import *


for i in range(0,10):
	p = Ether()/IP(src='10.0.1.2/32',dst='10.0.2.2/32')/TCP()/("High priority" + str(i))
	sendp(p,iface='br-test3')
	p = Ether()/IP(src='10.0.1.20/32',dst='10.0.2.2/32')/TCP()/("Low priority" + str(i))
	sendp(p,iface='br-test3')

