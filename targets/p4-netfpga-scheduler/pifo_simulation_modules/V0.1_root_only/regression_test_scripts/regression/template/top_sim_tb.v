// top tb module for enqueue agent behaivor simulation

`timescale 1ps / 1ps

module top_sim_tb;

reg clk;
reg rstn;

localparam STIM_DATA_COUNT   = 3;
localparam STIM_DATA_WIDTH_0 = 1;
localparam STIM_DATA_WIDTH_1 = 1;
localparam STIM_DATA_WIDTH_2 = 1;
localparam STIM_DATA_WIDTH_3 = 1;
localparam STIM_DATA_WIDTH_4 = 1;
localparam STIM_DATA_WIDTH_5 = 1;
localparam STIM_DATA_WIDTH_6 = 1;
localparam STIM_DATA_WIDTH_7 = 1;
localparam STIM_DATA_WIDTH_8 = 1;
localparam STIM_DATA_WIDTH_9 = 1;
  
localparam CHECKER_DATA_COUNT   = 3;
localparam STOP_FALSE = 1;
localparam CHECKER_DATA_WIDTH_0 = 1;
localparam CHECKER_DATA_WIDTH_1 = 1;
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


wire [CHECKER_DATA_WIDTH_0-1:0] w_checker_data_0;
wire [CHECKER_DATA_WIDTH_1-1:0] w_checker_data_1;
wire [CHECKER_DATA_WIDTH_2-1:0] w_checker_data_2;
wire [CHECKER_DATA_WIDTH_3-1:0] w_checker_data_3;
wire [CHECKER_DATA_WIDTH_4-1:0] w_checker_data_4;
wire [CHECKER_DATA_WIDTH_5-1:0] w_checker_data_5;
wire [CHECKER_DATA_WIDTH_6-1:0] w_checker_data_6;
wire [CHECKER_DATA_WIDTH_7-1:0] w_checker_data_7;
wire [CHECKER_DATA_WIDTH_8-1:0] w_checker_data_8;
wire [CHECKER_DATA_WIDTH_9-1:0] w_checker_data_9;



sim_stim_general_ip
#(
//.HAND_SHAKE(1),
//.FILE_PATH(),
.DATA_COUNT(STIM_DATA_COUNT),
.DATA_0_WIDTH(STIM_DATA_WIDTH_0),
.DATA_1_WIDTH(STIM_DATA_WIDTH_1),
.DATA_2_WIDTH(STIM_DATA_WIDTH_2),
.DATA_3_WIDTH(STIM_DATA_WIDTH_3),
.DATA_4_WIDTH(STIM_DATA_WIDTH_4),
.DATA_5_WIDTH(STIM_DATA_WIDTH_5),
.DATA_6_WIDTH(STIM_DATA_WIDTH_6),
.DATA_7_WIDTH(STIM_DATA_WIDTH_7),
.DATA_8_WIDTH(STIM_DATA_WIDTH_8),
.DATA_9_WIDTH(STIM_DATA_WIDTH_9)
)
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
#(
//.STOP_FAIL(1),
//.FILE_PATH(),
//.LOG_FILE_PATH(),
.DATA_COUNT(CHECKER_DATA_COUNT),
.DATA_0_WIDTH(CHECKER_DATA_WIDTH_0),
.DATA_1_WIDTH(CHECKER_DATA_WIDTH_1),
.DATA_2_WIDTH(CHECKER_DATA_WIDTH_2),
.DATA_3_WIDTH(CHECKER_DATA_WIDTH_3),
.DATA_4_WIDTH(CHECKER_DATA_WIDTH_4),
.DATA_5_WIDTH(CHECKER_DATA_WIDTH_5),
.DATA_6_WIDTH(CHECKER_DATA_WIDTH_6),
.DATA_7_WIDTH(CHECKER_DATA_WIDTH_7),
.DATA_8_WIDTH(CHECKER_DATA_WIDTH_8),
.DATA_9_WIDTH(CHECKER_DATA_WIDTH_9)
)
sim_checker_general_inst(
.clk(clk),
.rstn(rstn),
//.s_axis_ready(m_axis_ready),
.s_axis_valid(1),
.s_axis_data0(w_checker_data_0),  // top pifo
.s_axis_data1(w_checker_data_1),  // full
.s_axis_data2(w_checker_data_2),  // counter
.s_axis_data3(w_checker_data_3),  
.s_axis_data4(w_checker_data_4),
.s_axis_data5(w_checker_data_5),  
.s_axis_data6(w_checker_data_6),  
.s_axis_data7(w_checker_data_7),
.s_axis_data8(w_checker_data_8),  
.s_axis_data9(w_checker_data_9)  
);

pifo_calendar_demo
#(
.PIFO_CALENDAR_SIZE(10),
.BUFFER_ADDR_WIDTH(12),
.PIFO_CALENDAR_INDEX_WIDTH(4)
)
pifo_calendar_inst
(


.s_axis_pifo_info_root(w_stim_data_0),
.s_axis_insert_en(w_stim_data_1),
.s_axis_pop_en(w_stim_data_2),
.s_axis_global_pifo(w_stim_data_3),

.m_axis_pifo_calendar_top(w_checker_data_0),
.m_axis_buffer_addr(w_checker_data_1), // pop result, buffer address    
.m_axis_calendar_full(w_checker_data_2),
.m_axis_calendar_count(w_checker_data_3),

// reset & clock
.clk(clk),
.rstn(rstn)
    
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