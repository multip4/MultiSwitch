Commands.txt instruction

Table entry(forwarding rule) 

table_add 'table name' 'look up field' matching value => action parameter 1, action parameter 2,... 

example
table_add ipv4_lpm ipv4_forward 10.0.1.10/32 => 00:aa:00:01:00:01 1
