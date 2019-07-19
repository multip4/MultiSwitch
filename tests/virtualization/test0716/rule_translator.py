#!/usr/bin/python
import sys
import os

func = {'arp' : 1, 'l2_switch' : 2, 'firewall' : 3, 'nat' : 4}
stages = {}
stage_cnt = 1
header_len = {'arp' : 224, 'l2_switch' : 112, 'firewall' : 160, 'nat' : 160}
match_bitmap = {'arp' : 1, 'l2_switch' : 2, 'firewall' : 4, 'nat' : 8}

def input_rules_to_CLI():
	os.system('~/HyperV/tools/runtime_CLI.py < tmp_file')

def rtn_table_config_at_initial_rule(input_func, match_bitmap):
	return 'table_add table_config_at_initial set_initial_config %d 0 0 => %d %d %d 1\n' % (func[input_func], func[input_func], stages[input_func], match_bitmap)
	
def rtn_header_rules(input_func, input_func_header_len, header_num, input_func_stage, buf, match_result, action_bitmap):
	return 'table_add table_header_match_%d_%d_stage%d set_action_id %d %d %s => %d %d %d 0 0 1\n' % (input_func_header_len, header_num, input_func_stage, func[input_func], input_func_stage, buf, match_result, action_bitmap, match_bitmap[input_func])

def rtn_hv_setting_rules(input_func):
	global stage_cnt, stages
	new_rule = ''
	stages[input_func] = stage_cnt
	# hypervisor setting rules
	if input_func == 'arp':
		new_rule += rtn_table_config_at_initial_rule(input_func, 8)
		new_rule += rtn_header_rules(input_func, header_len[input_func], 1, stages[input_func], '0x10000000000000000000000000000000000000000&&&0xF0000000000000000000000000000000000000000', 1, 1)
		new_rule += 'table_add action_vdp%d_%d arp_reply => ' % (func[input_func], stages[input_func])
	if input_func == 'l2_switch':
		new_rule += rtn_table_config_at_initial_rule(input_func, 4)
		new_rule += rtn_header_rules(input_func, header_len[input_func], 1, stages[input_func], ' 0x20000000000000000&&&0xF0000000000000000', 2, 2) # hypervisor setting rules (header)
	if input_func == 'firewall':
		new_rule += rtn_header_rules(header_len[input_func], 2, stages[input_func]) # hypervisor setting rules (header)
	stage_cnt += 1

	return new_rule

def parse_origin_rule(rule):
	elements = rule.split()
	parsed = {}

	# arp_proxy
	if elements[2] == 'arp_reply': # table_add handle_arp_packet arp_reply 0x0a000002 => 0x0a000001 0x082a00010002
		parsed['target_ip'] = elements[3]
		parsed['ip'] = elements[5]
		parsed['mac'] = elements[6]

	# l2_forwarding
	if elements[1] == 'dmac' and elements[2] == 'forward': # table_add dmac forward 0x800e00010002 => 2
		parsed['destAddr'] = elements[3]
		parsed['port'] = elements[5]		

	# firewall
	if elements[1] == 'forward_table' and elements[2] == 'forward': # table_add forward_table forward 2 => 1
		parsed['ingress_port'] = elements[3]
		parsed['port'] = elements[5]	
	
	return parsed	

def translate_origin_rule(input_func, rule):
	parsed = parse_origin_rule(rule)	
	new_rule = ''
	if input_func not in stages:
		new_rule += rtn_hv_setting_rules(input_func)

	# add function rule
	new_rule += 'table_add action_vdp%d_%d ' % (func[input_func], stages[input_func])

	if input_func == 'arp':
		new_rule += 'arp_reply ffffffffffff0000000000000000000000000000 0 80 ffffffff00000000000000000000 0 80 ffffffffffff0000 48 0 %s %s %s ffff0000000000000000000000000000000000000000' % (parsed['mac'], parsed['ip'], parsed['mac'])
	# elif input_func == 'nat':
	# 	new_rule += 'NAT %s ffffffff %s ffffffff00000000 %s ffffffffffff0000000000000000 %s %s ffffffffffff0000' % (value_IP_dstAddr, value_IP_srcAddr, value_ethernet_dmac, port, value_ethernet_smac)
	elif input_func == 'l2_switch':
		new_rule += 'l2_switch_forward => %s' % parsed['port'] 
	elif input_func == 'firewall':
		new_rule += 'FW_forward => %s' % parsed['port']

	new_rule += '\n'
	return new_rule

def make_hv_rules():
	input_func = raw_input('function name: ')
	tmp_f = open('tmp_file', 'w')
	out_f=open(input_func + '_log', 'a')
	
	rule = raw_input('rule to translate: ')
        hv_rule = translate_origin_rule(input_func, rule)
	print('---------------translated rules---------------')
	print(hv_rule)
	tmp_f.write(hv_rule)
	out_f.write(hv_rule)
	
	out_f.close()
	tmp_f.close()

def main():
	while True:
		print('----------------------------')
		print('1. make new rules and input rules to switch')
		print('2. quit')
		c = raw_input('Choose the command : ')

		if c == '1':
			make_hv_rules()
			input_rules_to_CLI()
		elif c == '2':
			break
		else:
			print('wrong command')

main()
