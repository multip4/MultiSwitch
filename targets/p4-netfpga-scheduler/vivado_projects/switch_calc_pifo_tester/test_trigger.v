`timescale 1ps / 1ps
module test_trigger;

reg clk_dp, clk_cp;
reg rst;

//---------DP Input Data and Output Data------------------
reg [2:0] dp_class_id_in;
reg [7:0] dp_port_id_in; //Maximum support 8 ports.
wire [10:0] dp_data_in = {dp_port_id_in,dp_class_id_in};// Port 8 --> Bit Array, Class 5
reg dp_valid_in;
wire [32:0] dp_data_out; // ValidOut+ Rank + Pifo Info {1, 19, 12}
wire dp_valid_out;

//---------CP Input Data and Output Data Handling------------------
reg cp_valid_in,cp_read_sig_in, cp_write_sig_in;
reg [4:0] cp_class_id;
reg [3:0] cp_port_id; //Maximum support 8 ports.
wire [7:0] cp_index_in = {cp_port_id,cp_class_id};// Port 8 --> Bit Array, Class 5

reg [8:0] cp_write_val;    // Write Config Weight
wire [26:0] cp_val_out; // Round:11 , Weight & Config Weight: 8
wire cp_valid_out;
wire [7:0] cp_index_out;

//define clock.
always #2.5 clk_dp = ~clk_dp;
always #5 clk_cp = ~clk_cp;

wrr_without_blkmem wrr(
.clk_dp(clk_dp),
.rst(rst),
.tuple_in_my_pifo_rank_calc_input_VALID(dp_valid_in),
.tuple_in_my_pifo_rank_calc_input_DATA(dp_data_in),
.tuple_out_my_pifo_rank_calc_output_VALID(dp_valid_out),
.tuple_out_my_pifo_rank_calc_output_DATA(dp_data_out),
.wire_in_last_pkt_info0(0),
.wire_in_last_pkt_info1(0),
.wire_in_last_pkt_info2(0),
.wire_in_last_pkt_info3(0),
.wire_in_last_pkt_info4(0),
.clk_cp(clk_cp),
.wire_in_cpu_valid(cp_valid_in),
.wire_in_cpu_index(cp_index_in),
.wire_in_cpu_write_sig(cp_write_sig_in),
.wire_in_cpu_config_write(cp_write_val),
.wire_in_cpu_read_sig(cp_read_sig_in),
.wire_out_cpu_index(cp_index_out),
.wire_out_cpu_val(cp_val_out),
.wire_out_cpu_valid(cp_valid_out)
);

initial begin 
//Test Read and write Block Ram.
clk_dp = 0;
clk_cp = 0;

#5 rst = 1;
#100 rst = 0;
#1  

// Set CPU Config 
/*
Set Weighted Round Robin Config weight, And Check Whether the value is correctly set. 
Port0:  5:3:2
Port1:  1:1:1
*/

// Set Port 0 Class 0 to  Weitht 5 
#10  cp_valid_in = 1; cp_write_sig_in =1; cp_port_id =0; cp_class_id =0; cp_write_val = 5;
#10  cp_valid_in = 0; cp_write_sig_in =0;
// Set Port 0 Class 1 to  Weitht 3 
#10  cp_valid_in = 1; cp_write_sig_in =1; cp_port_id =0; cp_class_id =1; cp_write_val = 3;
#10  cp_valid_in = 0; cp_write_sig_in =0;
// Set Port 0 Class 1 to  Weitht 3 
#10  cp_valid_in = 1; cp_write_sig_in =1; cp_port_id =0; cp_class_id =2; cp_write_val = 2;
#10  cp_valid_in = 0; cp_write_sig_in =0;
// Set Port 1 Class 0 to  Weitht 1 
#10  cp_valid_in = 1; cp_write_sig_in =1; cp_port_id =1; cp_class_id =0; cp_write_val = 1;
#10 cp_valid_in = 0; cp_write_sig_in =0;
// Set Port 1 Class 1 to  Weitht 1 
#10  cp_valid_in = 1; cp_write_sig_in =1; cp_port_id =1; cp_class_id =1; cp_write_val = 1;
#10  cp_valid_in = 0; cp_write_sig_in =0;
// Set Port 1 Class 2 to  Weitht 1 
#10  cp_valid_in = 1; cp_write_sig_in =1; cp_port_id =1; cp_class_id =2; cp_write_val = 1;
#10  cp_valid_in = 0; cp_write_sig_in =0;

//Check Config Weight
/*Result: 
Config Weight Port0:  5:3:2
Config Weight Port1:  1:1:1
Round and Weight is 0.
*/
#10  cp_valid_in = 1; cp_read_sig_in =1;  cp_port_id =0; cp_class_id =0; 
#10  cp_valid_in = 0; cp_read_sig_in =0;
#10  cp_valid_in = 1; cp_read_sig_in =1;  cp_port_id =0; cp_class_id =1; 
#10  cp_valid_in = 0; cp_read_sig_in =0;
#10  cp_valid_in = 1; cp_read_sig_in =1;  cp_port_id =0; cp_class_id =2; 
#10  cp_valid_in = 0; cp_read_sig_in =0;
#10  cp_valid_in = 1; cp_read_sig_in =1;  cp_port_id =1; cp_class_id =0; 
#10  cp_valid_in = 0; cp_read_sig_in =0;
#10  cp_valid_in = 1; cp_read_sig_in =1;  cp_port_id =1; cp_class_id =1; 
#10  cp_valid_in = 0; cp_read_sig_in =0;
#10  cp_valid_in = 1; cp_read_sig_in =1;  cp_port_id =1; cp_class_id =2; 
#10  cp_valid_in = 0; cp_read_sig_in =0;

//Check DP Channel.  
#5 dp_valid_in = 1; dp_port_id_in= 'b00000001; dp_class_id_in =0;
#5 dp_valid_in = 0;

#5 dp_valid_in = 1; dp_port_id_in= 'b00000001; dp_class_id_in =0;
#5 dp_valid_in = 0;

#5 dp_valid_in = 1; dp_port_id_in= 'b00000001; dp_class_id_in =0;
#5 dp_valid_in = 0;


#10  cp_valid_in = 1; cp_read_sig_in =1;  cp_port_id =0; cp_class_id =0;
#10  cp_valid_in = 0; cp_read_sig_in =0;   

end
initial begin
$monitor( " cp_valid_out %d, cp_index %d,cp round %d, cp config: %d , cp remain weight: %d ",cp_valid_out,cp_index_out, cp_val_out[26:16],cp_val_out[15:8],cp_val_out[7:0]);
//$monitor( " dp_valid_out %d, dp_data_in %d,dp_data_out_round %d, dp_data_out_flow %d ",dp_valid_out,dp_data_in,dp_data_out[15:5],dp_data_out[4:0]);
//$monitor ("%d, %d" ,dp_valid_out,dp_data_out[30:12]);
end


endmodule
