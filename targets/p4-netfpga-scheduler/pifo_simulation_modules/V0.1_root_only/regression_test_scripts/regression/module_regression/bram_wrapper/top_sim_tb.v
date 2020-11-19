// top tb module for enqueue agent behaivor simulation

`timescale 1ps / 1ps

module top_sim_tb;

reg clk;
reg rstn;

localparam STIM_DATA_COUNT   = 4;
localparam STIM_DATA_WIDTH_0 = 32;
localparam STIM_DATA_WIDTH_1 = 1;
localparam STIM_DATA_WIDTH_2 = 1;
localparam STIM_DATA_WIDTH_3 = 32;
localparam STIM_DATA_WIDTH_4 = 1;
localparam STIM_DATA_WIDTH_5 = 1;
localparam STIM_DATA_WIDTH_6 = 1;
localparam STIM_DATA_WIDTH_7 = 1;
localparam STIM_DATA_WIDTH_8 = 1;
localparam STIM_DATA_WIDTH_9 = 1;
  
localparam CHECKER_DATA_COUNT   = 4;
//localparam STOP_FALSE = 1;
localparam CHECKER_DATA_WIDTH_0 = 32;
localparam CHECKER_DATA_WIDTH_1 = 12;
localparam CHECKER_DATA_WIDTH_2 = 1;
localparam CHECKER_DATA_WIDTH_3 = 32;
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
.s_axis_valid(1),
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

    block_ram_wrapper
    #(
     .ADDR_WIDTH(BUFFER_ADDR_WIDTH),
     .ADDR_TABLE_DEPTH(BUFFER_WORD_DEPTH),
     .BUFFER_FULL_ON(BUFFER_FULL_ON),
     .BUFFER_FULL_OFF(BUFFER_FULL_OFF)
    )
    block_ram_inst(
    .s_axis_tdata(r_s_axis_tdata_d1),
    .s_axis_tkeep(r_s_axis_tkeep_d1),
    .s_axis_tlast(r_s_axis_tlast_d1),
    .s_axis_tuser(r_s_axis_tuser_d1),
    .s_axis_tpifo(r_s_axis_tpifo_d1),

    .s_axis_wr_en(ctl_buffer_wr_en), // write signal for fl_head transition
    .s_axis_rd_en(r_buffer_rd_en_next),    // read signal 
    .s_axis_rd_pkt_sop_addr(combi_sop_addr), // read address for sop 
    .s_axis_rd_first_word_en(r_buffer_first_word_en_next), // the first word signal, for fl_tail value update.
    
    .m_axis_fl_head(w_addr_manager_out_buffer_fl_head),       // next writable available address, same as free list head.
    .m_axis_fl_head_next(w_addr_manager_out_buffer_fl_head_next),
    .m_axis_fl_tail(w_addr_manager_out_buffer_fl_tail),
    .m_axis_fl_tail_next(w_addr_manager_out_buffer_fl_tail_next),  // next readable address, the value of index at fl_tail
    
//    .m_axis_remain_space(addr_manager_out_st_buffer_remain_space), // statistics for buffer space
    .m_axis_almost_full(addr_manager_out_st_buffer_almost_full),  // buffer almost full signal. 
    .m_axis_is_empty(addr_manager_out_st_buffer_empty),     // buffer empty signal
    .m_axis_buffer_counter(m_buffer_counter),


    
    .m_axis_tdata(w_buffer_wrapper_out_tdata),
    .m_axis_tkeep(w_buffer_wrapper_out_tkeep),
    .m_axis_tlast(w_buffer_wrapper_out_tlast),
    .m_axis_tuser(w_buffer_wrapper_out_tuser),
    .m_axis_tpifo(w_buffer_wrapper_out_tpifo),

    .clk(axis_aclk),
    .rstn(axis_resetn)    //active low    
    
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