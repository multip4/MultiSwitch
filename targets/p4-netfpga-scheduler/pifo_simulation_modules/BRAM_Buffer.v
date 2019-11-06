`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2019 12:05:22 AM
// Design Name: 
// Module Name: BRAM_Buffer
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


module BRAM_Buffer
#(
parameter ADDR_WIDTH = 32,
parameter DATA_WIDTH = 289
)
(
clk,
rst,
wea,
addra,
dina,
wr_valid,
rd_valid,
addrb,
doutb
);

input clk;
input rst;
input wea;
input wr_valid;
input rd_valid;
input[ADDR_WIDTH-1:0] addra;
input[ADDR_WIDTH-1:0] addrb;
input[DATA_WIDTH-1:0] dina;

output[DATA_WIDTH-1:0] doutb;   


bram_pkt_native_no_reg
bram_pkt_native_port_0(
    .clka(clk),
    .clkb(clk),
    
    .ena('b1),             // port A enable
    .wea(wea),
    .addra(addra),
    .dina(dina),

    .enb('b1),
    .addrb(addrb),
    .doutb(doutb)
);

bram_pkt_native_no_reg
bram_pkt_native_port_1(
    .clka(clk),
    .clkb(clk),
    
    .ena('b1),             // port A enable
    .wea(wea),
    .addra(addra),
    .dina(dina),

    .enb('b1),
    .addrb(addrb),
    .doutb(doutb)
);

bram_pkt_native_no_reg
bram_pkt_native_port_2(
    .clka(clk),
    .clkb(clk),
    
    .ena('b1),             // port A enable
    .wea(wea),
    .addra(addra),
    .dina(dina),

    .enb('b1),
    .addrb(addrb),
    .doutb(doutb)
);

bram_pkt_native_no_reg
bram_pkt_native_port_3(
    .clka(clk),
    .clkb(clk),
    
    .ena('b1),             // port A enable
    .wea(wea),
    .addra(addra),
    .dina(dina),

    .enb('b1),
    .addrb(addrb),
    .doutb(doutb)
);

bram_pkt_native_no_reg
bram_pkt_native_port_4(
    .clka(clk),
    .clkb(clk),
    
    .ena('b1),             // port A enable
    .wea(wea),
    .addra(addra),
    .dina(dina),

    .enb('b1),
    .addrb(addrb),
    .doutb(doutb)
);




//wire local_write_addr_ready;
//wire local_write_data_ready;
//wire [1:0 ]local_write_resp;

//wire local_write_rsp_valid;

//wire local_read_addr_ready;
////wire local_read_data_ready;

//wire [255:0] local_read_data_out;
//wire local_read_data_out_valid;
//reg ready_sig = 1;
//reg last_sig = 1;

//bram_pkt_payload_axi4
//bram_pkt_payload_axi4_port_0(


//  .rsta_busy(),
//  .rstb_busy(),
//  .s_aclk(clk),
//  .s_aresetn(~rst),
  
//// AXI4 Write address channel 
//  .s_axi_awid('b0),
//  .s_axi_awaddr(addra),
//  .s_axi_awlen('h00),  // burst data chunck count : 00-> 1
//  .s_axi_awsize(3'b000),   // save all data to bram
//  .s_axi_awburst(2'b00),  // incremental type b10, b01 -> warp burst
//  .s_axi_awvalid(wr_valid),  
//  .s_axi_awready(local_write_addr_ready), // out
  
//// AXI4 Write Data Channel
//  .s_axi_wdata(dina),
//  .s_axi_wstrb('hffffffff),
//  .s_axi_wlast(last_sig),
//  .s_axi_wvalid(wr_valid),
//  .s_axi_wready(local_write_data_ready),  // out
  
  
//// AXI4 Write Resp Channel  
//  .s_axi_bid(),
//  .s_axi_bresp(local_write_resp),
//  .s_axi_bvalid(local_write_rsp_valid),
//  .s_axi_bready(ready_sig),                     // input
  
  
//// AXI4 READ ADDR
//  .s_axi_arid('b0),
//  .s_axi_araddr(addrb),
//  .s_axi_arlen('h00),
//  .s_axi_arsize(3'b000),
//  .s_axi_arburst(2'b00),
//  .s_axi_arvalid(rd_valid),
//  .s_axi_arready(local_read_addr_ready),  // output

//// AXI READ Data   
//  .s_axi_rid(),
//  .s_axi_rdata(local_read_data_out),
//  .s_axi_rresp(),
//  .s_axi_rlast(),
//  .s_axi_rvalid(local_read_data_out_valid),
//  .s_axi_rready(ready_sig)                      // input
//);







    
endmodule
