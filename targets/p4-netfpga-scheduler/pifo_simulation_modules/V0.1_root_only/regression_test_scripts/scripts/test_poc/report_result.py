def get_time_in_hex(string, time_width = 16):
	start_in_hex = string[28:28+time_width]
	end_in_hex = string[28+time_width:28+2*time_width]

	change_edian_start_hex = ""
	change_edian_end_hex = ""
	for i in range(0,time_width,2):
		start = start_in_hex[i:i+2]
		end = end_in_hex[i:i+2]

		# print start, end, start[::-1], end[::-1]

		change_edian_start_hex = start + change_edian_start_hex
		change_edian_end_hex = end + change_edian_end_hex

	change_edian_start_hex = "0x" + change_edian_start_hex
	change_edian_end_hex = "0x" + change_edian_end_hex


	s = int(change_edian_start_hex, 16)
	e = int(change_edian_end_hex,16)

	print e-s, s, e,change_edian_start_hex, change_edian_end_hex

	# print string, start_in_hex, end_in_hex

	return [e-s, s, e]



f = open('log.txt', 'r') 
Lines = f.readlines() 

d = {}

last_idx = -1
cur_key = 0
is_second = False
for l in Lines:
	l_array = l.split(",")
	
	if len(l_array) == 1:
		continue

	idx = int(l_array[-1].split(" ")[-1])

	if last_idx != idx: # ID changed
		cur_key = l_array[0]
		last_idx = idx
		is_second = True
		continue

	if is_second:
		d.setdefault(cur_key, []) 
		diff, start_time, end_time = get_time_in_hex(l)
		d[cur_key].append([diff, start_time, end_time])
		is_second = False



for key, records in d.items():
	print "PKTs   : ", key, len(records)
	print "Average: ", key, sum([x[0] for x in records]) / len(records)
	print "Max    : ", key, max([x[0] for x in records])
	print "Min    : ", key, min([x[0] for x in records])


