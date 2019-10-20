`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/18/2019 12:48:39 AM
// Design Name: 
// Module Name: output_queue_sim
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


module output_queue_sim;

reg clk;
reg rstn;

reg [255:0] s_axis_tdata;
reg [31:0]  s_axis_tkeep;
reg [127:0] s_axis_tuser;
reg [31:0]  s_axis_tpifo;
reg         s_axis_tvalid;
reg         s_axis_tlast;
reg         s_axis_buffer_wr_en;
reg         s_axis_pifo_insert_en;
reg          m_axis_tready;

reg [31:0] pifo_root;

wire         s_axis_tready;
wire [255:0] m_axis_tdata;
wire [31:0]  m_axis_tkeep;
wire [127:0] m_axis_tuser;
wire [31:0]  m_axis_tpifo;
wire         m_axis_tvalid;
wire         m_axis_tlast;
wire         m_is_buffer_almost_full;

//clock
always begin 
  #(5000 / 2) clk =  0; 
  #(5000 / 2) clk =  1; 
end





output_queue_v0_1
#(
.OUTPUT_SYNC(0)
)

output_queue_inst(
    .s_axis_tdata(s_axis_tdata),
    .s_axis_tkeep(s_axis_tkeep),
    .s_axis_tuser(s_axis_tuser),
    .s_axis_tpifo(s_axis_tpifo),
    .s_axis_tvalid(s_axis_tvalid),
    .s_axis_tlast(s_axis_tlast),
    .s_axis_buffer_wr_en(s_axis_buffer_wr_en),
    .s_axis_pifo_insert_en(s_axis_pifo_insert_en),
    .m_axis_tready(m_axis_tready),
    .m_axis_tvalid(m_axis_tvalid),
    .m_axis_tdata(m_axis_tdata),
    .m_axis_tkeep(m_axis_tkeep),
    .m_axis_tlast(m_axis_tlast),
    .m_axis_tuser(m_axis_tuser),
    .m_axis_tpifo(m_axis_tpifo),
    .m_is_buffer_almost_full(m_is_buffer_almost_full),
    .axis_aclk(clk),
    .axis_resetn(rstn)
);

initial begin
rstn = 0;
s_axis_tdata = 0;
s_axis_tkeep = 0;
s_axis_tuser = 0;
s_axis_tpifo = 0;
s_axis_tvalid = 0;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 0;
s_axis_pifo_insert_en = 0;
m_axis_tready = 0;
pifo_root = 0;

#100000
rstn = 1;

// assume the following input data is synchronized data. 
#1 // sync delay.




//==========================================================

// Scenario1. bypass pkt 1. the port always ready.
// pkt 1 info:
// pkt length : 3 word, 1a,1b,1c
// pkt pifo rank: single level.
// ----
// expected result: bypass all packet.
#100000

s_axis_tdata = {8'h1a,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'habcabc;
pifo_root = {1'b1,19'd100,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 1;
m_axis_tready = 1;

#5000
s_axis_tdata = {8'h1b,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'habcabc;
pifo_root = {1'b1,19'd100,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 0;
m_axis_tready = 1;

#5000
s_axis_tdata = {8'h1c,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'habcabc;
pifo_root = {1'b1,19'd100,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 1;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 0;
m_axis_tready = 1;

#5000
s_axis_tdata = 0;
s_axis_tkeep = 0;
s_axis_tuser = 0;
s_axis_tpifo = 0;
s_axis_tvalid = 0;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 0;
s_axis_pifo_insert_en = 0;
m_axis_tready = 0;
pifo_root = 0;


// end scenario 1.
//===============================================


//==========================================================

// Scenario2. bypass pkt 2. the port is ready until 2d.
// pkt info:
// pkt length : 6 word, 2a,2b,2c,2d,2e,2f
// pkt pifo rank: single level.
// ----
// expected result: bypass packet until 2d.
// wait for port ready, then return result.
// state transition: IDLE -> Bypass -> WRITE_PKT_FIRST -> WRITE_PKT_REMAIN

#100000

s_axis_tdata = {8'h2a,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd200,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 1;
m_axis_tready = 1;

#5000
s_axis_tdata = {8'h2b,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd200,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 0;
m_axis_tready = 1;

#5000
s_axis_tdata = {8'h2c,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd200,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 0;
m_axis_tready = 1;

#5000
s_axis_tdata = {8'h2d,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd200,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 0;
m_axis_tready = 0;

#5000
s_axis_tdata = {8'h2e,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd200,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 0;
m_axis_tready = 0;

#5000
s_axis_tdata = {8'h2f,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd200,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 1;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 0;
m_axis_tready = 0;

#5000
s_axis_tdata = 0;
s_axis_tkeep = 0;
s_axis_tuser = 0;
s_axis_tpifo = 0;
s_axis_tvalid = 0;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 0;
s_axis_pifo_insert_en = 0;
m_axis_tready = 0;
pifo_root = 0;


#5000
m_axis_tready = 1; // for read pkt 2d from buffer 
#5000
m_axis_tready = 1; // read pkt 2e from buffer
#5000
m_axis_tready = 1; // read pkt 2f from buffer

#5000
m_axis_tready = 0;


// end scenario 2.
//===============================================

//==========================================================

// Scenario3. write pkt 3. the port become ready after all pkt is writed.
// pkt info:
// pkt length : 6 word, 3a,3b,3c,3d,3e,3f
// pkt pifo rank: single level.
// ----
// expected result: pop from pifo, then read from buffer.
// wait for port ready, then return result.
// state transition: IDLE -> PIFO_POP -> WRITE_PKT_FIRST -> WRITE_PKT_REMAIN
#100000

s_axis_tdata = {8'h3a,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd100,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 1;
m_axis_tready = 0;

#5000
s_axis_tdata = {8'h3b,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd100,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 0;
m_axis_tready = 0;

#5000
s_axis_tdata = {8'h3c,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd100,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 0;
m_axis_tready = 0;

#5000
s_axis_tdata = {8'h3d,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd100,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 0;
m_axis_tready = 0;

#5000
s_axis_tdata = {8'h3e,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd100,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 0;
m_axis_tready = 0;

#5000
s_axis_tdata = {8'h3f,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd100,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 1;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 0;
m_axis_tready = 0;

#5000
s_axis_tdata = 0;
s_axis_tkeep = 0;
s_axis_tuser = 0;
s_axis_tpifo = 0;
s_axis_tvalid = 0;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 0;
s_axis_pifo_insert_en = 0;
m_axis_tready = 0;
pifo_root = 0;


#5000
m_axis_tready = 1;


#100000
m_axis_tready = 0;
// end scenario3.

//==========================================================

// Scenario4. write pkt 4,5. the port become ready after all pkt is writed.
// pkt info:
// pkt 4 length : 3 word, 4a,4b,4c
// pkt pifo rank: single level. rank = 50.
// pkt 4 length : 3 word, 5a,5b,5c
// pkt pifo rank: single level. rank = 10.
// ----
// expected result: pop from pifo, then read from buffer. -> pkt 5
// wait for port ready, then return result.
// state transition: IDLE -> PIFO_POP -> WRITE_PKT_FIRST -> WRITE_PKT_REMAIN

#100000

s_axis_tdata = {8'h4a,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd50,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 1;
m_axis_tready = 0;

#5000

s_axis_tdata = {8'h4b,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd50,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 0;
m_axis_tready = 0;

# 5000
s_axis_tdata = {8'h4c,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd50,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 1;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 0;
m_axis_tready = 0;

#5000

s_axis_tdata = {8'h5a,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd10,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 1;
m_axis_tready = 0;

#5000

s_axis_tdata = {8'h5b,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd10,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 0;
m_axis_tready = 0;

#5000
s_axis_tdata = {8'h5c,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd10,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 1;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 0;
m_axis_tready = 0;

#5000
s_axis_tdata = 0;
s_axis_tkeep = 0;
s_axis_tuser = 0;
s_axis_tpifo = 0;
s_axis_tvalid = 0;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 0;
s_axis_pifo_insert_en = 0;
m_axis_tready = 0;
pifo_root = 0;


#5000
m_axis_tready = 1;


#100000
m_axis_tready = 0;

// end scenario 4.

//==========================================================

// Scenario5. write pkt 6,7. the port become ready after 6th pkt is writed.
// pkt info:
// pkt 6 length : 3 word, 6a,6b,6c
// pkt pifo rank: single level. rank = 50.
// pkt 7 length : 3 word, 7a,7b,7c
// pkt pifo rank: single level. rank = 10.
// ----
// expected result: bypass pkt7 then pop pifo. -> pkt 6
// wait for port ready, then return result.
// state transition: IDLE -> bypass -> IDLE -> PIFO_POP-> WRITE_PKT_FIRST -> WRITE_PKT_REMAIN

#100000

s_axis_tdata = {8'h6a,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd50,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 1;
m_axis_tready = 0;

#5000

s_axis_tdata = {8'h6b,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd50,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 0;
m_axis_tready = 0;

# 5000
s_axis_tdata = {8'h6c,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd50,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 1;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 0;
m_axis_tready = 0;

#5000

s_axis_tdata = {8'h7a,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd10,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 1;
m_axis_tready = 1;

#5000

s_axis_tdata = {8'h7b,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd10,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 0;
m_axis_tready = 1;

#5000
s_axis_tdata = {8'h7c,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd10,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 1;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 0;
m_axis_tready = 1;

#5000
s_axis_tdata = 0;
s_axis_tkeep = 0;
s_axis_tuser = 0;
s_axis_tpifo = 0;
s_axis_tvalid = 0;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 0;
s_axis_pifo_insert_en = 0;
m_axis_tready = 0;
pifo_root = 0;

#5000
m_axis_tready = 1;


#100000
m_axis_tready = 0;

// end scenario 5.

//==========================================================

// Scenario6. write pkt 8,9. the port become ready after 6th pkt is writed.
// pkt info:
// pkt 6 length : 3 word, 8a,8b,8c
// pkt pifo rank: single level. rank = 50.
// pkt 7 length : 3 word, 9a,9b,9c
// pkt pifo rank: single level. rank = 100.
// ----
// expected result: pop pifo. -> pkt 8 -> pkt9
// wait for port ready, then return result.
// state transition: IDLE -> UPDATE_FL_TAIL -> READ_PKT -> IDLE -> UPDATE_FL_TAIL -> READ_PKT

#100000

s_axis_tdata = {8'h8a,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd50,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 1;
m_axis_tready = 0;

#5000

s_axis_tdata = {8'h8b,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd50,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 0;
m_axis_tready = 0;

# 5000
s_axis_tdata = {8'h8c,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd50,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 1;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 0;
m_axis_tready = 0;

#5000

s_axis_tdata = {8'h9a,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd100,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 1;
m_axis_tready = 1;

#5000

s_axis_tdata = {8'h9b,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd100,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 0;
m_axis_tready = 1;

#5000
s_axis_tdata = {8'h9c,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser = 128'hbbbbbbbb;
pifo_root = {1'b1,19'd100,12'b0};
s_axis_tpifo = {pifo_root};
s_axis_tvalid = 1;
s_axis_tlast = 1;
s_axis_buffer_wr_en = 1;
s_axis_pifo_insert_en = 0;
m_axis_tready = 1;

#5000
s_axis_tdata = 0;
s_axis_tkeep = 0;
s_axis_tuser = 0;
s_axis_tpifo = 0;
s_axis_tvalid = 0;
s_axis_tlast = 0;
s_axis_buffer_wr_en = 0;
s_axis_pifo_insert_en = 0;
m_axis_tready = 0;
pifo_root = 0;

#5000
m_axis_tready = 1;


#100000
m_axis_tready = 0;

// end scenario 5.




end






endmodule
