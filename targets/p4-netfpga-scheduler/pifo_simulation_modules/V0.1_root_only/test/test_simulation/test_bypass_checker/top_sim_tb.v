// top tb module for enqueue agent behaivor simulation

`timescale 1ps / 1ps

module top_sim_tb;

reg clk;
reg rstn;

localparam PIFO_INFO_WIDTH = 32;    //PIFO Info width

wire                    w_s2m_valid;
wire [PIFO_INFO_WIDTH-1:0] w_s2m_pifo_info;
wire [PIFO_INFO_WIDTH-1:0] w_s2m_calendar_top;

wire                    w_m2c_valid;
wire                    w_m2c_bypass_en;

sim_stim_general_ip
#(
.DATA_COUNT(2),
.DATA_1_WIDTH(PIFO_INFO_WIDTH),
.DATA_2_WIDTH(PIFO_INFO_WIDTH),
.HAND_SHAKE(0)
)
sim_stim_general_inst(
.m_axis_data0(w_s2m_valid),
.m_axis_data1(w_s2m_pifo_info),
.m_axis_data2(w_s2m_calendar_top),

.clk(clk),
.rstn(rstn)
);

output_queue_bypass_checker
bypass(
    // from/to pipeline

    .s_axis_valid(w_s2m_valid),    //input below
    .s_axis_pifo_info(w_s2m_pifo_info), 
    .s_axis_pifo_calandar_top(w_s2m_calendar_top),
    
    .m_axis_valid(w_m2c_valid),    
    .m_axis_bypass_en(w_m2c_bypass_en), // output
    
    .clk(clk),
    .rstn(rstn)
);


sim_checker_general_ip
#(
.DATA_COUNT(1),
.DATA_0_WIDTH(1)
)
sim_checker_general_inst(
.s_axis_valid(w_m2c_valid),
.s_axis_data0(w_m2c_bypass_en),

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