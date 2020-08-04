# Forest.1000 Korea Unv.
# Date 2020. 05. 11
# This code is made for running script test

from testdata import gen_testdata
import os
import shutil
import subprocess

def show_test_option():
	 print "==================RTL Test=================="
	 print "1. Normal Test Port to Port"
	 print "2. Port Unset Test"
	 print "3. Drop Test (Need to compile Strict Rule => Change cp stric_rule.p4 to rank_pifo_solution.p4 )"
	 print "4. Different Size Test(64 to 1500)"
	 print "5. Different Payload"
	 print "0 to exit"
	 option = input('Please enter a test option: ')
	 return option

def normal_test():
	print "normal test"
	gen_testdata.test_port_senario()

def port_not_set_test():
	print "port unset test"
	gen_testdata.test_port_unset_senario()

def drop_test():
	print "drop test"
	gen_testdata.test_drop_senario()

def diffsize_test():
	print "diff size test"
	gen_testdata.test_diff_size_senario()

def diffpayload_test():
	print "different payloadload"
	gen_testdata.test_diff_payload()

def delete_test_files():
	current_path = os.path.dirname(os.path.abspath(__file__))
	pcap_path = current_path + '/testdata'
	axi_path = current_path + '/simple_sume_switch/test'
	print "delete  pcap files"
	for file in os.listdir(pcap_path):
		if file.endswith('.pcap'):
			print "remove file " + file
			os.remove(pcap_path+'/'+file)

	print "delete axi files"

	for file in os.listdir(axi_path):
		if file.endswith('.axi'):
			print "remove file " + file
			os.remove(axi_path+'/'+file)

def move_pcapfiles():
	print "move  pcap files"

	current_path = os.path.dirname(os.path.abspath(__file__))
	print "current_path is " + current_path
	pcap_path = current_path + '/testdata'
	for file in os.listdir(current_path):
		if file.endswith('.pcap'):
			print "move file to pcap file " + file + " to pcap_path" + pcap_path
			shutil.move(current_path+'/'+file,pcap_path+'/'+file)


def run_test_mode():
	move_pcapfiles()
	current_path = os.path.dirname(os.path.abspath(__file__))
	print "===============Running Mode=================="
	print "1. Normal"
	print "2. Normal GUI"
	print "3. Line Rate" 
	print "4. Line Rate GUI"
	print "exit"

	option = input('Please enter a test option: ')

	if option == 1:
		print "sending normal pkts"
		subprocess.call(current_path+"/run_global_sim.sh", shell= True)
	elif option==2:
		print "sending line rate pkts"
		subprocess.call(current_path+"//run_global_sim_gui.sh", shell= True)
	elif option==3:
		print "sending line rate pkts"
		subprocess.call(current_path+"/run_global_sim_line.sh", shell= True)
	elif option==4:
		print "sending line rate pkts"
		subprocess.call(current_path+"/run_global_sim_line_gui.sh", shell= True)
	else :
		print "exit" 


if __name__ == "__main__":	
	option = 99
	while option>0: 
		option = show_test_option()
		if option == 0:
			print "exit" 
			break
		elif option==1:
			delete_test_files()
			normal_test()
			run_test_mode()
		elif option==2:
			delete_test_files()
			port_not_set_test()
			run_test_mode()
		elif option==3:
			delete_test_files()
			drop_test()
			run_test_mode()
		elif option==4:
			delete_test_files()
			diffsize_test()
			run_test_mode()
		elif option==5:
			print "different payload"
			delete_test_files()
			diffpayload_test()
			run_test_mode()
		else : 
			print "unknown value."
			


