`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2019 06:04:58 AM
// Design Name: 
// Module Name: addr_manager_sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module addr_manager_sim;

reg clk;
reg rstn;


localparam DATA_WIDTH = 12;
localparam ADDR_WIDTH = 12;

reg[DATA_WIDTH-1:0] rd_data_sop_addr;
reg                 rd_en;
reg                 wr_en;
reg                 first_word_en;

wire[DATA_WIDTH-1:0] fl_head;
wire[DATA_WIDTH-1:0] remain_space;
wire[DATA_WIDTH-1:0] next_addr;


wire w_out_almost_full;
wire w_out_is_empty;

addr_manager_v0_1
#(
.ADDR_TABLE_DEPTH(49)
)
addr(
.s_axis_wr_en(wr_en),
.s_axis_rd_en(rd_en),
.s_axis_first_word_en(first_word_en),
//s_axis_wr_addr,
.s_axis_rd_addr(rd_data_sop_addr),

.m_axis_fl_head(fl_head),   // next available address, same as free list head.
.m_axis_rd_next_addr(next_addr),
      
.m_axis_remain_space(remain_space),
.m_axis_almost_full(w_out_almost_full),
.m_axis_is_empty(w_out_is_empty),

.clk(clk),
.rstn(rstn)    //active low
);


//clock
always begin 
  #(5000 / 2) clk =  0; 
  #(5000 / 2) clk =  1; 
end

initial begin
rstn = 0;

rd_data_sop_addr = 0;
rd_en = 0;
wr_en = 0;
first_word_en = 0;


# 100000
rstn = 1;
# 100000

// sync delay
#1
// ..end sync delay


// secenario 1. write 3 word width data.
// expected result. uses addr 0,1,2
// expected result. fl_head = 3.
# 5000 // reset input
rd_data_sop_addr = 0;
rd_en = 0;
wr_en = 0;
first_word_en = 0;

# 5000 // write first word
wr_en = 1;

# 5000 // write 2nd word

# 5000 // write 3rd word

# 5000 // reset input
rd_data_sop_addr = 0;
rd_en = 0;
wr_en = 0;
first_word_en = 0;


// scenario 2. write 2 word width data/
// expected result. uses addr 3,4
// expected result. fl_head = 5.
# 5000 // reset input
rd_data_sop_addr = 0;
rd_en = 0;
wr_en = 0;
first_word_en = 0;

# 5000 // write 1st word
wr_en = 1;

# 5000 // write 2nd word

# 5000 // reset input
rd_data_sop_addr = 0;
rd_en = 0;
wr_en = 0;
first_word_en = 0;

// scenario 3. read pkt of scenario 2.
// takes 3 cycle
// expected result. fl_tail = 4.

# 5000 // reset input
rd_data_sop_addr = 0;
rd_en = 0;
wr_en = 0;
first_word_en = 0;

# 5000
rd_data_sop_addr = 3;
rd_en = 0;
first_word_en = 1;

# 5000 // read 1st word
rd_en = 1;
first_word_en = 0;

# 5000 // read 2nd word
rd_en = 1;
first_word_en = 0;



# 10000
rd_en = 0;



// scenario 4. write/read pkt. write 5 word wide pkt, and read pkt of scenario 1.
// expected result. fl_tail = 2
// expected result. fl_head = 10
# 5000
wr_en = 1;
rd_en = 0;
rd_data_sop_addr = 0;
first_word_en = 1;

# 5000
first_word_en = 0;

# 15000
rd_en = 0;

# 10000
wr_en = 0;

end


endmodule
