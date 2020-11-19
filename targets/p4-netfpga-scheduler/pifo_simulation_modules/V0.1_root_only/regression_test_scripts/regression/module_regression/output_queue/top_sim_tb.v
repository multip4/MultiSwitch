// top tb module for enqueue agent behaivor simulation

`timescale 1ps / 1ps

module top_sim_tb;

reg clk;
reg rstn;

localparam STIM_DATA_COUNT   = 9;
localparam STIM_DATA_WIDTH_0 = 1; // valid 
localparam STIM_DATA_WIDTH_1 = 1;  // last
localparam STIM_DATA_WIDTH_2 = 256;  //tdata
localparam STIM_DATA_WIDTH_3 = 32; //tkeep
localparam STIM_DATA_WIDTH_4 = 128;  //tuser
localparam STIM_DATA_WIDTH_5 = 32;  //tpifo
localparam STIM_DATA_WIDTH_6 = 1;  //buffer_wr_en 
localparam STIM_DATA_WIDTH_7 = 1;  //pifo_insert_en 
localparam STIM_DATA_WIDTH_8 = 1;  //m_axis_ready 
localparam STIM_DATA_WIDTH_9 = 1;  // no use
  
localparam CHECKER_DATA_COUNT   = 9;
//localparam STOP_FALSE = 1;
localparam CHECKER_DATA_WIDTH_0 = 1; // valid
localparam CHECKER_DATA_WIDTH_1 = 1; // last
localparam CHECKER_DATA_WIDTH_2 = 256;  // tdata
localparam CHECKER_DATA_WIDTH_3 = 32; // tkeep
localparam CHECKER_DATA_WIDTH_4 = 128;  // tuser
localparam CHECKER_DATA_WIDTH_5 = 32;  // tpifo
localparam CHECKER_DATA_WIDTH_6 = 1;  // buffer full
localparam CHECKER_DATA_WIDTH_7 = 1;  // pifo full
localparam CHECKER_DATA_WIDTH_8 = 12;  // buffer counter
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

output_queue_v0_1_with_cpu
#(
.BUFFER_ADDR_WIDTH(12),  
.BUFFER_WORD_DEPTH(20),
.PIFO_WORD_DEPTH(10),
.OUTPUT_SYNC(1),
.BUFFER_FULL_ON(15),
.PIFO_FULL_ON(7),
.DEBUG_BRAM_ADDR_FL_TAIL_INDEX(20)        
)
output_queue_inst(

	.s_axis_tvalid(w_stim_data_0),
	.s_axis_tlast(w_stim_data_1),
    .s_axis_tdata(w_stim_data_2),
    .s_axis_tkeep(w_stim_data_3),
    .s_axis_tuser(w_stim_data_4),
    .s_axis_tpifo(w_stim_data_5),
    .s_axis_buffer_wr_en(w_stim_data_6),
    .s_axis_pifo_insert_en(w_stim_data_7),
    .m_axis_tready(w_stim_data_8),

    .m_axis_tvalid(w_module_out_data_0),
    .m_axis_tlast(w_module_out_data_1),
    .m_axis_tdata(w_module_out_data_2),
    .m_axis_tkeep(w_module_out_data_3),
    .m_axis_tuser(w_module_out_data_4),
    .m_axis_tpifo(w_module_out_data_5),
    .m_is_buffer_almost_full(w_module_out_data_6),
    .m_is_pifo_full(w_module_out_data_7),
    .m_buffer_counter(w_module_out_data_8),

    .s_axis_gpfc_valid(1'b0),            
    .s_axis_gpfc_pause_rank({18{1'b0}}),                                  
    .s_axis_gpfc_pause_frame_valid(1'b0),
    .s_axis_gpfc_pause_frame_data(512'b0), 
    .s_axis_gpfc_pause_frame_ack(),  
    .axis_aclk(clk),
    .axis_resetn(rstn)
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