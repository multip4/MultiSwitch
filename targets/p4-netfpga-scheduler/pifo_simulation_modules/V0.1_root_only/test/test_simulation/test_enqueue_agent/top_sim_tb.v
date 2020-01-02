// top tb module for enqueue agent behaivor simulation

`timescale 1ps / 1ps

module enqueue_agent_tb;

reg clk;
reg rstn;

localparam DATA_0_WIDTH = 1;    //valid bit from stim to module
localparam DATA_1_WIDTH = 1;    //last bit from stim to module
localparam DATA_2_WIDTH = 1;    //last f1 signal array from stim to module
localparam DATA_3_WIDTH = 1;    //pifo valid signal from stim to module
localparam DATA_4_WIDTH = 128;  //sume from stim to module
localparam DATA_5_WIDTH = 5;    //pifo calendar full bit array from stim to module
localparam DATA_6_WIDTH = 5;    //buffer full bit array from stim to module

localparam DATA_7_WIDTH = 5;    //pifo input signal from module to checker
localparam DATA_8_WIDTH = 5;    //buffer write signal from module to checker

wire [DATA_0_WIDTH-1:0] w_s2m_valid;
wire [DATA_1_WIDTH-1:0] w_s2m_last;
wire [DATA_2_WIDTH-1:0] w_s2m_last_f1;
wire [DATA_3_WIDTH-1:0] w_s2m_pifo_valid;
wire [DATA_4_WIDTH-1:0] w_s2m_sume;
wire [DATA_5_WIDTH-1:0] w_s2m_pifo_calendar_full;
wire [DATA_6_WIDTH-1:0] w_s2m_buffer_full;

wire                    w_m2s_ready;

wire                    w_m2c_valid;
wire [DATA_7_WIDTH-1:0] w_m2c_pifo_insert;
wire [DATA_8_WIDTH-1:0] w_m2c_buffer_write;



sim_stim_general_ip
#(
//.FILE_PATH("/home/jkchoi/Documents/git/MultiSwitch/targets/p4-netfpga-scheduler/pifo_simulation_modules/V0.1_root_only/test/test_simulation/test_bucket/test_enqueue_agent/testdata/test01/data_in.txt"),
.DATA_COUNT(7),
.DATA_0_WIDTH(DATA_0_WIDTH),
.DATA_1_WIDTH(DATA_1_WIDTH),
.DATA_2_WIDTH(DATA_2_WIDTH),
.DATA_3_WIDTH(DATA_3_WIDTH),
.DATA_4_WIDTH(DATA_4_WIDTH),
.DATA_5_WIDTH(DATA_5_WIDTH),
.DATA_6_WIDTH(DATA_6_WIDTH),
.HAND_SHAKE(1)
)
sim_stim_general_inst(
.clk(clk),
.rstn(rstn),
.m_axis_ready(w_m2s_ready), // input
//.m_axis_valid(w_s2m_valid), // output below
.m_axis_data0(w_s2m_valid),
.m_axis_data1(w_s2m_last),
.m_axis_data2(w_s2m_last_f1),

.m_axis_data3(w_s2m_pifo_valid),
.m_axis_data4(w_s2m_sume),
.m_axis_data5(w_s2m_pifo_calendar_full),
.m_axis_data6(w_s2m_buffer_full)
);


sim_checker_general_ip
#(
//.FILE_PATH("/home/jkchoi/Documents/git/MultiSwitch/targets/p4-netfpga-scheduler/pifo_simulation_modules/V0.1_root_only/test/test_simulation/test_bucket/test_enqueue_agent/testdata/test01/data_exp.txt"),
//.LOG_FILE_PATH("/home/jkchoi/Documents/git/MultiSwitch/targets/p4-netfpga-scheduler/pifo_simulation_modules/V0.1_root_only/test/test_simulation/test_bucket/test_enqueue_agent/testdata/test01/data_log.log"),
.DATA_COUNT(2),
.DATA_0_WIDTH(DATA_7_WIDTH),
.DATA_1_WIDTH(DATA_8_WIDTH)
)
sim_checker_general_inst(
.clk(clk),
.rstn(rstn),
//.s_axis_ready(m_axis_ready),
.s_axis_valid(w_m2c_valid),
.s_axis_data0(w_m2c_pifo_insert),
.s_axis_data1(w_m2c_buffer_write)
);

enqueue_agent_v0_1
enq(
    // from/to pipeline
    
    .s_axis_tready(w_m2s_ready), // output
        
    .s_axis_tvalid(w_s2m_valid),    //input below
    .s_axis_tuser(w_s2m_sume), 
    .s_axis_tlast(w_s2m_last),
    .s_axis_tlast_f1(w_s2m_last_f1),
    .s_axis_tpifo_valid(w_s2m_pifo_valid),
    
    // from each port queue status 
    .s_axis_buffer_almost_full(w_s2m_buffer_full),
    .s_axis_pifo_full(w_s2m_pifo_calendar_full),
    
    .m_axis_valid(w_m2c_valid),    
    .m_axis_ctl_pifo_in_en(w_m2c_pifo_insert), // output
    .m_axis_ctl_buffer_wr_en(w_m2c_buffer_write),
    
    
    // CPU channel
//    .s_axi_addr({src_port,dst_port}),      
//    .s_axi_req_valid(cpu_req_valid), 
                     
//    .m_axi_data(cpu_resp_data),      
//    .m_axi_resp_valid(cpu_resp_valid),
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