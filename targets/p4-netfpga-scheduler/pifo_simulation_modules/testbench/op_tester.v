`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/29/2019 12:01:24 AM
// Design Name: 
// Module Name: op_tester
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


module op_tester; 

parameter DATA_LENGTH = 16;
parameter TEST_ROUND = 10;
// parameters for PIFO Block

parameter DATA_WIDTH = 256;
parameter SUME_META_WIDTH = 168;
parameter KEEP_WIDTH = DATA_WIDTH / 8;
parameter PIFO_BLOCK = 5;



reg clk;
reg cin;

reg reset;
reg clk_line_rst;
reg check_file;
reg fw_done;
reg stim_file;


// function for log2

function integer log2;
  input integer number;
  begin
     log2=0;
     while(2**log2<number) begin
        log2=log2+1;
     end
  end
endfunction // log2



wire [DATA_WIDTH-1: 0]      m_axis_tdata;
wire [KEEP_WIDTH-1: 0]      m_axis_tkeep;
wire [SUME_META_WIDTH-1: 0] m_axis_tuser;
wire                        m_axis_tvalid;
wire                        m_axis_tready;
wire                        m_axis_tlast;




wire [DATA_WIDTH-1: 0]      s_axis_tdata;
wire [KEEP_WIDTH-1: 0]      s_axis_tkeep;
wire [SUME_META_WIDTH-1: 0] s_axis_tuser;
wire                        s_axis_tvalid;
wire                        s_axis_tready;
wire                        s_axis_tlast;
wire                        s_axis_tuple_valid;
reg                         stim_ready;

wire                        stim_eof;



// Init PIFO Modules

TB_System_Stim
TB_System_Stim_i
(
	.tuple_in_sume_metadata	( s_axis_tuser ),
	.clk_n               	( ~clk ),
	.rst                 	( clk_line_rst ),
	.fw_done             	( fw_done ),
	.file_done           	( stim_file ),
	.stim_eof            	( stim_eof ),
	.tuple_in_valid      	( s_axis_tuple_valid ),
	.packet_in_packet_in_TREADY	( stim_ready ),
	.packet_in_packet_in_TVALID	( s_axis_tvalid ),
	.packet_in_packet_in_TLAST	( s_axis_tlast ),
	.packet_in_packet_in_TKEEP	( s_axis_tkeep ),
	.packet_in_packet_in_TDATA	( s_axis_tdata )
);





PIFO_MODULE #(
// I/O Parameters
.DATA_WIDTH(DATA_WIDTH),
.SUME_META_WIDTH(SUME_META_WIDTH),
.NUM_PIFO_BLOCK(PIFO_BLOCK)
)
mypifo(
    // slave -> input 
.s_axis_tdata(s_axis_tdata),
.s_axis_tkeep(s_axis_tkeep),
.s_axis_tuser(s_axis_tuser),
.s_axis_tvalid(s_axis_tvalid),
.s_axis_tready(s_axis_tready),
.s_axis_tlast(s_axis_tlast),

// master -> output
.m_axis_tdata(m_axis_tdata),
.m_axis_tkeep(m_axis_tkeep),
.m_axis_tuser(m_axis_tuser),
.m_axis_tvalid(m_axis_tvalid),
.m_axis_tlast(m_axis_tlast),
.m_axis_tready(m_axis_tready),

// control signals

.reset(reset),
.clk_in_0(clk)
);

reg [31:0] idleCount ;
reg firstPacketOut;


always @( posedge clk ) begin
	if ( clk_line_rst ) begin
		idleCount <= 0 ;
		firstPacketOut <= 0 ;
	end
	else  begin
		if ( firstPacketOut ) begin
            firstPacketOut <= 1 ;
            idleCount <= ( idleCount + 1 ) ;
            if ( ( ( ( ( ( idleCount == 1000 ) && check_file ) && fw_done ) && stim_eof )  ) ) begin
                $display("[%0t]  INFO: stopping simulation after 1000 idle cycles", $time);
                $finish(1);
            end
		end
	end
end


// Generate Input Files.

always begin 
  #(3333 / 2) clk =  0; 
  #(3333 / 2) clk =  1; 
end


initial begin 
 clk_line_rst = 1; 
 #1000000 clk_line_rst = 0; 
 end 


/*
initial begin
    clk = 0;
    reset = 0;
    s_axis_tvalid = 0;
    s_axis_tlast = 0;
    check_file = 1;
    
    #10000; 
    reset = 1;
    s_axis_tvalid = 1;
    s_axis_tlast = 0;
    
    #10000;
    s_axis_tdata = 'h012345; 
    s_axis_tkeep = 'hffffff; 
    s_axis_tuser = 'h12341234;


    

    for(integer i=0; i<TEST_ROUND; i=i+1) begin
        #80; 
        s_axis_tdata = 'habcd+i; 
        s_axis_tkeep = 'hffffff; 
        s_axis_tuser = 'h12341234;
        
        s_axis_tvalid = ~s_axis_tvalid;
        s_axis_tlast = ~s_axis_tlast;
        
        s_axis_tready = 1;

    end

   
end
*/


initial begin
    fw_done = 0;
    stim_file = 1;
    check_file = 1;
    #1000 fw_done = 1;
    stim_ready = 1;
end
    

endmodule

