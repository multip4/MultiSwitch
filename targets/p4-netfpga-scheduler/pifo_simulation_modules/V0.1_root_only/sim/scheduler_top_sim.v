`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/20/2019 02:01:02 PM
// Design Name: 
// Module Name: scheduler_top_sim
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


module scheduler_top_sim;

reg clk;
reg rstn;

wire        s_axis_tready;
reg [255:0] s_axis_tdata;
reg [31:0]  s_axis_tkeep;
reg [159:0] s_axis_tuser_final;

reg [127:0] s_axis_tuser;
reg [31:0]  s_axis_tpifo;
reg         s_axis_tvalid;
reg         s_axis_tlast;
reg         s_axis_buffer_wr_en;
reg         s_axis_pifo_insert_en;
reg         m_axis_tready;

reg [31:0] pifo_root;

reg             m_axis_0_tready;
wire [255:0]    m_axis_0_tdata;
wire [31:0]     m_axis_0_tkeep;
wire [31:0]     m_axis_0_tpifo;
wire [127:0]    m_axis_0_tuser;
wire            m_axis_0_tvalid;
wire            m_axis_0_tlast;

reg             m_axis_1_tready;
wire [255:0]    m_axis_1_tdata;
wire [31:0]     m_axis_1_tkeep;
wire [31:0]     m_axis_1_tpifo;
wire [127:0]    m_axis_1_tuser;
wire            m_axis_1_tvalid;
wire            m_axis_1_tlast;

reg             m_axis_2_tready;
wire [255:0]    m_axis_2_tdata;
wire [31:0]     m_axis_2_tkeep;
wire [31:0]     m_axis_2_tpifo;
wire [127:0]    m_axis_2_tuser;
wire            m_axis_2_tvalid;
wire            m_axis_2_tlast;

reg             m_axis_3_tready;
wire [255:0]    m_axis_3_tdata;
wire [31:0]     m_axis_3_tkeep;
wire [31:0]     m_axis_3_tpifo;
wire [127:0]    m_axis_3_tuser;
wire            m_axis_3_tvalid;
wire            m_axis_3_tlast;

reg             m_axis_4_tready;
wire [255:0]    m_axis_4_tdata;
wire [31:0]     m_axis_4_tkeep;
wire [31:0]     m_axis_4_tpifo;
wire [127:0]    m_axis_4_tuser;
wire            m_axis_4_tvalid;
wire            m_axis_4_tlast;






//clock
always begin 
  #(5000 / 2) clk =  0; 
  #(5000 / 2) clk =  1; 
end


// init module.

scheduler_top_v0_1
#()
top_sim
(
.axis_aclk(clk),
.axis_resetn(rstn),

.s_axis_tvalid(s_axis_tvalid),
.s_axis_tdata(s_axis_tdata),
.s_axis_tkeep(s_axis_tkeep),
.s_axis_tuser(s_axis_tuser_final),
.s_axis_tlast(s_axis_tlast),
.s_axis_tready(s_axis_tready),

.m_axis_0_tready(m_axis_0_tready),
.m_axis_0_tdata(m_axis_0_tdata),
.m_axis_0_tkeep(m_axis_0_tkeep),
.m_axis_0_tuser(m_axis_0_tuser),
.m_axis_0_tpifo(m_axis_0_tpifo),
.m_axis_0_tvalid(m_axis_0_tvalid),
.m_axis_0_tlast(m_axis_0_tlast),

.m_axis_1_tready(m_axis_1_tready),
.m_axis_1_tdata(m_axis_1_tdata),
.m_axis_1_tkeep(m_axis_1_tkeep),
.m_axis_1_tuser(m_axis_1_tuser),
.m_axis_1_tpifo(m_axis_1_tpifo),
.m_axis_1_tvalid(m_axis_1_tvalid),
.m_axis_1_tlast(m_axis_1_tlast),          

.m_axis_2_tready(m_axis_2_tready),
.m_axis_2_tdata(m_axis_2_tdata),
.m_axis_2_tkeep(m_axis_2_tkeep),
.m_axis_2_tuser(m_axis_2_tuser),
.m_axis_2_tpifo(m_axis_2_tpifo),
.m_axis_2_tvalid(m_axis_2_tvalid),
.m_axis_2_tlast(m_axis_2_tlast),          

.m_axis_3_tready(m_axis_3_tready),
.m_axis_3_tdata(m_axis_3_tdata),
.m_axis_3_tkeep(m_axis_3_tkeep),
.m_axis_3_tuser(m_axis_3_tuser),
.m_axis_3_tpifo(m_axis_3_tpifo),
.m_axis_3_tvalid(m_axis_3_tvalid),
.m_axis_3_tlast(m_axis_3_tlast),          

.m_axis_4_tready(m_axis_4_tready),
.m_axis_4_tdata(m_axis_4_tdata),
.m_axis_4_tkeep(m_axis_4_tkeep),
.m_axis_4_tuser(m_axis_4_tuser),
.m_axis_4_tpifo(m_axis_4_tpifo),
.m_axis_4_tvalid(m_axis_4_tvalid),
.m_axis_4_tlast(m_axis_4_tlast)          
);

localparam DST_POS_PORT0 = 24;
localparam DST_POS_PORT1 = 26;
localparam DST_POS_PORT2 = 28;
localparam DST_POS_PORT3 = 30;
localparam DROP_POS = 32;

initial begin
rstn = 0;
s_axis_tdata = 0;
s_axis_tkeep = 0;
s_axis_tlast = 0;
s_axis_tvalid = 0;
s_axis_tuser = 0;
s_axis_tpifo = 0;
s_axis_tuser_final = 0;
m_axis_0_tready = 0;


# 100000
rstn = 1;

#1 // sync delay.

//==========================================================

// Scenario1. bypass pkt 1. the port always ready.
// pkt 1 info:
// pkt length : 3 word, 1a,1b,1c
// pkt pifo rank: single level.
// ----
// expected result: bypass all packet.
#100000

s_axis_tdata = {8'h1a,248'h0};;
s_axis_tkeep = 32'hffffffff;
s_axis_tuser[DST_POS_PORT0] = 'b1;
s_axis_tpifo = {1'b1,19'd100,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tlast = 0;
m_axis_0_tready = 1;

#5000
s_axis_tdata = {8'h1b,248'h0};;
s_axis_tkeep = 32'hffffffff;
s_axis_tuser[DST_POS_PORT0] = 'b1;
s_axis_tpifo = {1'b1,19'd100,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tlast = 0;
m_axis_0_tready = 1;


#5000
s_axis_tdata = {8'h1c,248'h0};;
s_axis_tkeep = 32'hffffffff;
s_axis_tuser[DST_POS_PORT0] = 'b1;
s_axis_tpifo = {1'b1,19'd100,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tlast = 1;
m_axis_0_tready = 1;



#5000 //reset 
s_axis_tdata = 0;
s_axis_tkeep = 0;
s_axis_tlast = 0;
s_axis_tvalid = 0;
s_axis_tuser = 0;
s_axis_tpifo = 0;
m_axis_0_tready = 0;

// end scenario 1.
//===============================================


//==========================================================

// Scenario2. bypass pkt 2. the port not valid at 2c
// pkt 1 info:
// pkt length : 6 word, 2a,2b,2c,2d,2e,2f
// pkt pifo rank: single level.
// ----
// expected result: bypass all packet.
#100000

s_axis_tdata = {8'h2a,248'h0};;
s_axis_tkeep = 32'hffffffff;
s_axis_tuser[DST_POS_PORT0] = 'b1;
s_axis_tpifo = {1'b1,19'd50,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tlast = 0;
m_axis_0_tready = 1;

#5000
s_axis_tdata = {8'h2b,248'h0};;
s_axis_tkeep = 32'hffffffff;
s_axis_tuser[DST_POS_PORT0] = 'b1;
s_axis_tpifo = {1'b1,19'd50,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tlast = 0;
m_axis_0_tready = 1;


#5000
s_axis_tdata = {8'h2c,248'h0};;
s_axis_tkeep = 32'hffffffff;
s_axis_tuser[DST_POS_PORT0] = 'b1;
s_axis_tpifo = {1'b1,19'd50,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tlast = 0;
m_axis_0_tready = 0;

#5000
s_axis_tdata = {8'h2d,248'h0};;
s_axis_tkeep = 32'hffffffff;
s_axis_tuser[DST_POS_PORT0] = 'b1;
s_axis_tpifo = {1'b1,19'd50,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tlast = 0;
m_axis_0_tready = 0;

#5000
s_axis_tdata = {8'h2e,248'h0};;
s_axis_tkeep = 32'hffffffff;
s_axis_tuser[DST_POS_PORT0] = 'b1;
s_axis_tpifo = {1'b1,19'd50,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tlast = 0;
m_axis_0_tready = 0;

#5000
s_axis_tdata = {8'h2f,248'h0};;
s_axis_tkeep = 32'hffffffff;
s_axis_tuser[DST_POS_PORT0] = 'b1;
s_axis_tpifo = {1'b1,19'd50,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tlast = 1;
m_axis_0_tready = 0;

#5000 //reset 
s_axis_tdata = 0;
s_axis_tkeep = 0;
s_axis_tlast = 0;
s_axis_tvalid = 0;
s_axis_tuser = 0;
s_axis_tpifo = 0;
m_axis_0_tready = 0;

#5000  // start to dequeue
m_axis_0_tready = 1; 
#300000
m_axis_0_tready = 0;



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
s_axis_tuser[DST_POS_PORT0] = 'b1;
s_axis_tpifo = {1'b1,19'd100,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tlast = 0;
m_axis_0_tready = 0;

#5000
s_axis_tdata = {8'h3b,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser[DST_POS_PORT0] = 'b1;
s_axis_tpifo = {1'b1,19'd100,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tlast = 0;
m_axis_0_tready = 0;

#5000
s_axis_tdata = {8'h3c,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser[DST_POS_PORT0] = 'b1;
s_axis_tpifo = {1'b1,19'd100,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tlast = 0;
m_axis_0_tready = 0;

#5000
s_axis_tdata = {8'h3d,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser[DST_POS_PORT0] = 'b1;
s_axis_tpifo = {1'b1,19'd100,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tlast = 0;
m_axis_0_tready = 0;

#5000
s_axis_tdata = {8'h3e,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser[DST_POS_PORT0] = 'b1;
s_axis_tpifo = {1'b1,19'd100,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tlast = 0;
m_axis_0_tready = 0;

#5000
s_axis_tdata = {8'h3f,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser[DST_POS_PORT0] = 'b1;
s_axis_tpifo = {1'b1,19'd100,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tlast = 1;
m_axis_0_tready = 0;

#5000 //reset 
s_axis_tdata = 0;
s_axis_tkeep = 0;
s_axis_tlast = 0;
s_axis_tvalid = 0;
s_axis_tuser = 0;
s_axis_tpifo = 0;
m_axis_0_tready = 0;

#5000
m_axis_0_tready = 1;


#100000
m_axis_0_tready = 0;
// end scenario3.

//==========================================================

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
s_axis_tuser[DST_POS_PORT0] = 'b1;
s_axis_tpifo = {1'b1,19'd50,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tlast = 0;
m_axis_0_tready = 0;

#5000

s_axis_tdata = {8'h4b,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser[DST_POS_PORT0] = 'b1;
s_axis_tpifo = {1'b1,19'd50,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tlast = 0;
m_axis_0_tready = 0;

# 5000
s_axis_tdata = {8'h4c,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser[DST_POS_PORT0] = 'b1;
s_axis_tpifo = {1'b1,19'd50,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tlast = 1;
m_axis_0_tready = 0;

#5000

s_axis_tdata = {8'h5a,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser[DST_POS_PORT0] = 'b1;
s_axis_tpifo = {1'b1,19'd10,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tlast = 0;
m_axis_0_tready = 0;
#5000

s_axis_tdata = {8'h5b,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser[DST_POS_PORT0] = 'b1;
s_axis_tpifo = {1'b1,19'd10,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tlast = 0;
m_axis_0_tready = 0;

#5000
s_axis_tdata = {8'h5c,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser[DST_POS_PORT0] = 'b1;
s_axis_tpifo = {1'b1,19'd10,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tlast = 1;
m_axis_0_tready = 0;

#5000 //reset 
s_axis_tdata = 0;
s_axis_tkeep = 0;
s_axis_tlast = 0;
s_axis_tvalid = 0;
s_axis_tuser = 0;
s_axis_tpifo = 0;
m_axis_0_tready = 0;

#5000
m_axis_0_tready = 1;
#100000
m_axis_0_tready = 0;

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
s_axis_tuser[DST_POS_PORT0] = 'b1;
s_axis_tpifo = {1'b1,19'd50,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tlast = 0;
m_axis_0_tready = 0;

#5000

s_axis_tdata = {8'h6b,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser[DST_POS_PORT0] = 'b1;
s_axis_tpifo = {1'b1,19'd50,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tlast = 0;
m_axis_0_tready = 0;

# 5000
s_axis_tdata = {8'h6c,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser[DST_POS_PORT0] = 'b1;
s_axis_tpifo = {1'b1,19'd50,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tlast = 1;
m_axis_0_tready = 0;

#5000

s_axis_tdata = {8'h7a,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tuser[DST_POS_PORT0] = 'b1;
s_axis_tpifo = {1'b1,19'd10,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tlast = 0;
m_axis_0_tready = 1;

#5000

s_axis_tdata = {8'h7b,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tpifo = {1'b1,19'd10,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tvalid = 1;
s_axis_tlast = 0;
m_axis_0_tready = 1;
#5000
s_axis_tdata = {8'h7c,248'h0};
s_axis_tkeep = 32'hffffffff;
s_axis_tpifo = {1'b1,19'd10,12'b0};
s_axis_tuser_final = {s_axis_tpifo,s_axis_tuser};
s_axis_tvalid = 1;
s_axis_tvalid = 1;
s_axis_tlast = 1;
m_axis_0_tready = 1;

#5000 //reset 
s_axis_tdata = 0;
s_axis_tkeep = 0;
s_axis_tlast = 0;
s_axis_tvalid = 0;
s_axis_tuser = 0;
s_axis_tpifo = 0;
m_axis_0_tready = 0;

#5000
m_axis_0_tready = 1;


#100000
m_axis_0_tready = 0;

// end scenario 5.



end





endmodule
