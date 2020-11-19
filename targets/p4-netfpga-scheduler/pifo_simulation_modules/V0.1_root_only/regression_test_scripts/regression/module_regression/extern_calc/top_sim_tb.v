// top tb module for enqueue agent behaivor simulation

`timescale 1ps / 1ps

module top_sim_tb;

reg clk;
reg rstn;

localparam STIM_DATA_COUNT   = 9;
localparam STIM_DATA_WIDTH_0 = 1;
localparam STIM_DATA_WIDTH_1 = 1;
localparam STIM_DATA_WIDTH_2 = 8;
localparam STIM_DATA_WIDTH_3 = 5;
localparam STIM_DATA_WIDTH_4 = 16;
localparam STIM_DATA_WIDTH_5 = 16;
localparam STIM_DATA_WIDTH_6 = 8;
localparam STIM_DATA_WIDTH_7 = 32;
localparam STIM_DATA_WIDTH_8 = 32;
localparam STIM_DATA_WIDTH_9 = 1;
  
localparam CHECKER_DATA_COUNT   = 2;
//localparam STOP_FALSE = 1;
localparam CHECKER_DATA_WIDTH_0 = 1;
localparam CHECKER_DATA_WIDTH_1 = 32;
localparam CHECKER_DATA_WIDTH_2 = 1;
localparam CHECKER_DATA_WIDTH_3 = 1;
localparam CHECKER_DATA_WIDTH_4 = 1;
localparam CHECKER_DATA_WIDTH_5 = 1;
localparam CHECKER_DATA_WIDTH_6 = 1;
localparam CHECKER_DATA_WIDTH_7 = 1;
localparam CHECKER_DATA_WIDTH_8 = 1;
localparam CHECKER_DATA_WIDTH_9 = 1;

wire [STIM_DATA_WIDTH_0-1:0] w_stim_data_0;
wire [STIM_DATA_WIDTH_1-1:0] w_stim_data_1;
wire [STIM_DATA_WIDTH_2-1:0] w_stim_data_2;
wire [STIM_DATA_WIDTH_3-1:0] w_stim_data_3;
wire [STIM_DATA_WIDTH_4-1:0] w_stim_data_4;
wire [STIM_DATA_WIDTH_5-1:0] w_stim_data_5;
wire [STIM_DATA_WIDTH_6-1:0] w_stim_data_6;
wire [STIM_DATA_WIDTH_7-1:0] w_stim_data_7;
wire [STIM_DATA_WIDTH_8-1:0] w_stim_data_8;
wire [STIM_DATA_WIDTH_9-1:0] w_stim_data_9;


wire [CHECKER_DATA_WIDTH_0-1:0] w_checker_data_0, w_module_out_data_0;
wire [CHECKER_DATA_WIDTH_1-1:0] w_checker_data_1, w_module_out_data_1;
wire [CHECKER_DATA_WIDTH_2-1:0] w_checker_data_2, w_module_out_data_2;
wire [CHECKER_DATA_WIDTH_3-1:0] w_checker_data_3, w_module_out_data_3;
wire [CHECKER_DATA_WIDTH_4-1:0] w_checker_data_4, w_module_out_data_4;
wire [CHECKER_DATA_WIDTH_5-1:0] w_checker_data_5, w_module_out_data_5;
wire [CHECKER_DATA_WIDTH_6-1:0] w_checker_data_6, w_module_out_data_6;
wire [CHECKER_DATA_WIDTH_7-1:0] w_checker_data_7, w_module_out_data_7;
wire [CHECKER_DATA_WIDTH_8-1:0] w_checker_data_8, w_module_out_data_8;
wire [CHECKER_DATA_WIDTH_9-1:0] w_checker_data_9, w_module_out_data_9;


assign w_checker_data_0 = (CHECKER_DATA_COUNT > 0) ? w_module_out_data_0 : 0;
assign w_checker_data_1 = (CHECKER_DATA_COUNT > 1) ? w_module_out_data_1 : 0;
assign w_checker_data_2 = (CHECKER_DATA_COUNT > 2) ? w_module_out_data_2 : 0;
assign w_checker_data_3 = (CHECKER_DATA_COUNT > 3) ? w_module_out_data_3 : 0;
assign w_checker_data_4 = (CHECKER_DATA_COUNT > 4) ? w_module_out_data_4 : 0;
assign w_checker_data_5 = (CHECKER_DATA_COUNT > 5) ? w_module_out_data_5 : 0;
assign w_checker_data_6 = (CHECKER_DATA_COUNT > 6) ? w_module_out_data_6 : 0;
assign w_checker_data_7 = (CHECKER_DATA_COUNT > 7) ? w_module_out_data_7 : 0;
assign w_checker_data_8 = (CHECKER_DATA_COUNT > 8) ? w_module_out_data_8 : 0;
assign w_checker_data_9 = (CHECKER_DATA_COUNT > 9) ? w_module_out_data_9 : 0;

sim_stim_general_ip
sim_stim_general_inst(
.clk(clk),
.rstn(rstn),
.m_axis_data0(w_stim_data_0),
.m_axis_data1(w_stim_data_1),
.m_axis_data2(w_stim_data_2),
.m_axis_data3(w_stim_data_3),
.m_axis_data4(w_stim_data_4),
.m_axis_data5(w_stim_data_5),
.m_axis_data6(w_stim_data_6),
.m_axis_data7(w_stim_data_7),
.m_axis_data8(w_stim_data_8),
.m_axis_data9(w_stim_data_9)
);

sim_checker_general_ip
sim_checker_general_inst(
.clk(clk),
.rstn(rstn),
//.s_axis_ready(m_axis_ready),
.s_axis_valid(w_checker_data_0),
.s_axis_data0(w_checker_data_0),  // top pifo
.s_axis_data1(w_checker_data_1),  // addr
.s_axis_data2(w_checker_data_2),  // full
.s_axis_data3(w_checker_data_3),  // counter
.s_axis_data4(w_checker_data_4),
.s_axis_data5(w_checker_data_5),  
.s_axis_data6(w_checker_data_6),  
.s_axis_data7(w_checker_data_7),
.s_axis_data8(w_checker_data_8),  
.s_axis_data9(w_checker_data_9)  
);

// black box
my_extern_calc_0_t
my_extern_calc_0
(
	.tuple_in_my_extern_calc_input_VALID	( w_stim_data_0 ),
	.tuple_in_my_extern_calc_input_DATA	( {w_stim_data_1,w_stim_data_2,w_stim_data_3,w_stim_data_4,w_stim_data_5,w_stim_data_6} ),
	.tuple_out_my_extern_calc_output_VALID	( w_module_out_data_0 ),
	.tuple_out_my_extern_calc_output_DATA	( w_module_out_data_1 ),
	.last_pifo_info4(0),
	.last_pifo_info3(0),
	.last_pifo_info2(w_stim_data_7),
	.last_pifo_info1(0),
	.last_pifo_info0(w_stim_data_8),
	.clk_lookup          	( clk ),
	.rst                 	( ~rstn )
);


//clock
always begin 
  #(5000 / 2) clk =  0; 
  #(5000 / 2) clk =  1; 
end

initial begin
    clk = 0;
    rstn = 0;
    
#10000
    rstn = 1;

end

endmodule 