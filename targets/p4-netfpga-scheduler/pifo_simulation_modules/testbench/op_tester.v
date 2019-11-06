`timescale 1ps / 1ps
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
parameter SUME_META_WIDTH = 128;
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





// ================================================
// local test
// module: small_ram.v
// ================================================
localparam LOCAL_ADDR_WIDTH = 12;
localparam LOCAL_RAM_DEPTH = 2048;
localparam LOCAL_DATA_IN_WIDTH = 256;

reg [LOCAL_DATA_IN_WIDTH-1:0] lt_small_ram_d_in;
reg  lt_small_ram_d_in_valid;
wire [LOCAL_DATA_IN_WIDTH-1:0] lt_small_ram_d_out;
wire  lt_small_ram_d_out_valid;
reg [LOCAL_ADDR_WIDTH-1:0]  lt_small_ram_wr_addr;
reg [LOCAL_ADDR_WIDTH-1:0]  lt_small_ram_rd_addr;
reg  lt_small_ram_rd_en;
reg  lt_small_ram_wr_en;
reg lt_small_ram_rst;
reg lt_small_ram_clk;

reg lt_small_ram_wr_en_next; // for debug
reg lt_small_ram_rd_en_next; // for debug



small_ram #(
    .ADDR_WIDTH(LOCAL_ADDR_WIDTH),
    .RAM_DEPTH(LOCAL_RAM_DEPTH),
    .DATA_IN_WIDTH(LOCAL_DATA_IN_WIDTH)
)
mysmall_ram(
    .m_axis_data_out(lt_small_ram_d_out),
    .m_axis_data_valid(lt_small_ram_d_out_valid),
    .s_axis_data_in(lt_small_ram_d_in),
    .s_axis_data_valid(lt_small_ram_d_in_valid),
    .rd_addr(lt_small_ram_rd_addr),
    .wr_addr(lt_small_ram_wr_addr),
    .rd_en(lt_small_ram_rd_en),
    .wr_en(lt_small_ram_wr_en),
    .clk(lt_small_ram_clk),
    .rst(lt_small_ram_rst)
);

always @( posedge clk ) begin
    if(lt_small_ram_wr_en_next)
        lt_small_ram_wr_en <= 0;
        lt_small_ram_wr_en_next <= 0;
    if(lt_small_ram_rd_en_next)
        lt_small_ram_rd_en_next <= 0;
        lt_small_ram_rd_en <= 0 ;
end

always begin 
  #(3333 / 2) lt_small_ram_clk =  0; 
  #(3333 / 2) lt_small_ram_clk =  1; 
end

initial begin 
 lt_small_ram_rst = 1; 
 lt_small_ram_wr_en_next = 0;
 lt_small_ram_rd_en_next = 0;
 lt_small_ram_wr_en = 0;
 lt_small_ram_rd_en = 0;
 lt_small_ram_wr_addr = 0;
 lt_small_ram_rd_addr = 0;
 lt_small_ram_d_in = 0;
 lt_small_ram_d_in_valid = 0;
 
 
 #1000000 lt_small_ram_rst = 0; 
end 

initial begin 
 #1100000 
 lt_small_ram_d_in = 'h12341234;
 lt_small_ram_d_in_valid = 'h1; 
 lt_small_ram_wr_addr = 'h3;
 lt_small_ram_wr_en = 'b1;
 lt_small_ram_wr_en_next = 'b1;
 
 #10000 
 lt_small_ram_d_in = 'h1111111111;
 lt_small_ram_d_in_valid = 'h1; 
 lt_small_ram_wr_addr = 'h5;
 lt_small_ram_wr_en = 'b1;
 lt_small_ram_wr_en_next = 'b1;
 
 
 #10000 
  lt_small_ram_d_in = 'h1123123;
  lt_small_ram_d_in_valid = 'h1; 
  lt_small_ram_rd_addr = 'h5;
  lt_small_ram_rd_en = 'b1;
  lt_small_ram_rd_en_next = 'b1;
  
end 

// ================================================
// end for local test
// module: small_ram.v
// ================================================



// ================================================
// local test
// module: block ram IP .v
// ================================================
localparam BRAM_ADDR_WIDTH = 11;
localparam BRAM_DEPTH = 2048;
localparam BRAM_WIDTH = 256;

reg [BRAM_ADDR_WIDTH-1:0] porta_addr;
reg [BRAM_WIDTH-1:0] porta_din;
reg [BRAM_WIDTH-1:0] porta_wr_en;
reg [BRAM_WIDTH-1:0] porta_out_rst; // reset for output latch or reg

reg [BRAM_ADDR_WIDTH-1:0] portb_addr;
reg [BRAM_WIDTH-1:0] portb_din;
reg [BRAM_WIDTH-1:0] portb_dout;
reg [BRAM_WIDTH-1:0] portb_rd_en;
reg [BRAM_WIDTH-1:0] portb_wr_en;
reg [BRAM_WIDTH-1:0] portb_out_rst; // reset for output latch or reg

// Use Block Ram

bram_pkt_native
bram_pkt_native_inst(
    .clka(clk),
    .clkb(clk),
    
    .ena('b1),             // port A enable
    .wea(porta_wr_en),
    .addra(porta_addr),
    .dina(porta_din),

    .enb('b1),
    .addrb(portb_addr),
    .doutb(portb_dout)
);

// Test
initial begin 
 #1100000 
 
 porta_addr = 'h0100;
 porta_din = 'h12341234;
 porta_wr_en = 'b1;
 
 #10000 
 porta_addr = 'h0101;
 porta_din = 'h11111111;
 porta_wr_en = 'b1;
 
 portb_addr = 'h0100; 
 
 
 #10000 
 porta_addr = 'h0101;
 porta_din = 'habcdabcd;
 porta_wr_en = 'b1;

 portb_addr = 'h0101;

end 




//buffer_packet_port0
//buffer_packet_port0_instance
//(
//.s_aclk(clk),
//.s_aresetn(~clk_line_rst),

////portA for Read
//.clka(clk),        // clock
//.addra(porta_addr),          // address
//.dina(porta_din),           // data in
//.douta(porta_dout),          // data out
//.ena(porta_rd_en),            // read enable
//.wea(porta_wr_en),            // write enable
//.rsta(porta_out_rst),           // reset output latch or register


////portB for Write
//.addrb(portb_addr),
//.clkb(clk),
//.dinb(portb_din),
//.doutb(portb_dout),
//.enb(portb_rd_en),
//.web(portb_wr_en),
//.rstb(portb_out_rst)
//);



//always @( posedge clk ) begin
//    if(lt_small_ram_wr_en_next)
//        lt_small_ram_wr_en <= 0;
//        lt_small_ram_wr_en_next <= 0;
//    if(lt_small_ram_rd_en_next)
//        lt_small_ram_rd_en_next <= 0;
//        lt_small_ram_rd_en <= 0 ;
//end

//always begin 
//  #(3333 / 2) lt_small_ram_clk =  0; 
//  #(3333 / 2) lt_small_ram_clk =  1; 
//end

initial begin 
portb_addr = 0;
portb_din = 0;
portb_dout = 0;
portb_rd_en = 0;
portb_wr_en = 0;
portb_out_rst = 0; // reset for output latch or reg
end 



// ================================================
// end for local test
// module: small_ram.v
// ================================================



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

