`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/07/2019 01:46:27 PM
// Design Name: 
// Module Name: eq_agent_sim_v0_1
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


`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2019 02:36:41 PM
// Design Name: 
// Module Name: eq_agent_sim
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


module eq_agent_sim_v0_1;

reg clk;
reg rstn;

// ========================
// Enqueue Agent Reg/Wires

    reg         s_axis_pkt_last;
    reg [127:0] s_axis_sume_meta;
    reg         s_axis_valid;
    
    reg [4:0]   s_axis_pifo_almost_full_bit_array;
    reg [4:0]   s_axis_buffer_almost_full_bit_array;
    
    wire s_axis_ready;
    wire [4:0] m_axis_pifo_in_en;
    wire [4:0] m_axis_buffer_wr_en;
    wire [7:0] output_port;
    wire       drop_signal;



// end.Enqueue Agent Reg/Wires
// =========================

enqueue_agent_v0_1
enq(
    // from/to pipeline
    .s_axis_tvalid(s_axis_valid),
    .s_axis_tready(s_axis_ready),
    .s_axis_tuser(s_axis_sume_meta), // sume_meta.
    .s_axis_tlast(s_axis_pkt_last),
    
    // from each port queue status 
    .s_axis_buffer_almost_full(s_axis_buffer_almost_full_bit_array),
    .s_axis_pifo_full(s_axis_pifo_almost_full_bit_array),
        
    .m_axis_ctl_pifo_in_en(m_axis_pifo_in_en),
    .m_axis_ctl_buffer_wr_en(m_axis_buffer_wr_en),
    
    .axis_aclk(clk),
    .axis_resetn(rstn)
);

// ============================


localparam DST_POS_PORT0 = 24;
localparam DST_POS_PORT1 = 26;
localparam DST_POS_PORT2 = 28;
localparam DST_POS_PORT3 = 30;
localparam DROP_POS = 32;


assign output_port = s_axis_sume_meta[DST_POS_PORT3+1:DST_POS_PORT0];
assign drop_signal = s_axis_sume_meta[DROP_POS];

localparam PIFO_VALID_POS = 36;
//clock
always begin 
  #(5000 / 2) clk =  0; 
  #(5000 / 2) clk =  1; 
end

initial begin
    clk = 0;
    rstn = 0;

    s_axis_pkt_last = 0;
    s_axis_valid = 0;
    s_axis_sume_meta = 0;
    s_axis_pifo_almost_full_bit_array = 0;
    s_axis_buffer_almost_full_bit_array = 0;

    # 100000
    rstn = 1;
    # 1
 //   # 3000
// ===================================    
    
// pkt1. 
// 2 chunck.
// output port 0 & 3,
// buffer full: 1,2,3.
//expect result only enqueue to port 0
    
    # 5000
    s_axis_pkt_last = 0;
    s_axis_valid = 1;
    s_axis_sume_meta = 'h0;
    
    s_axis_sume_meta[DST_POS_PORT0] = 'b1;
    s_axis_sume_meta[DST_POS_PORT3] = 'b1;
        
    s_axis_buffer_almost_full_bit_array  = 'b01110; // port 1,2,3 is full               
    
    # 5000
    s_axis_pkt_last = 1;
    
    # 5000
    s_axis_pkt_last = 0;
    s_axis_valid = 0;
    s_axis_sume_meta = 0;
    s_axis_pifo_almost_full_bit_array = 0;
    s_axis_buffer_almost_full_bit_array = 0;

    
// end. for buffer full & pifo full scenario
// ============================================


    #100000
// ============================================
// normal case
// pkt2. 
// 3 chunck.
// output port 1& 2 & 3,
// buffer full: no.
// expected result: enqueue to port 1,2,3

    s_axis_pkt_last = 0;
    s_axis_valid = 0;
    s_axis_sume_meta = 0;
    s_axis_pifo_almost_full_bit_array = 0;


    # 5000
    s_axis_pkt_last = 0;
    s_axis_valid = 1;
    s_axis_sume_meta = 'h0;
        
    s_axis_sume_meta[DST_POS_PORT1] = 'b1;
    s_axis_sume_meta[DST_POS_PORT2] = 'b1;
    s_axis_sume_meta[DST_POS_PORT3] = 'b1;
        
    s_axis_pifo_almost_full_bit_array  = 'b00000; // no port is full               
    
    # 5000 // no signal change
     
    # 5000 // last bit set to 1
    s_axis_pkt_last = 1;

    # 5000 // reset all data
    s_axis_pkt_last = 0;
    s_axis_valid = 0;
    s_axis_sume_meta = 0;
    s_axis_pifo_almost_full_bit_array = 0;


// end.normal case
// =============================================                

#100000
// =============================================    
// drop case by buffer full
// pkt3. 
// 3 chunck.
// output port 1 & 2 & 3,
// pifo full: 1, 2, 3.

    s_axis_pkt_last = 0;
    s_axis_valid = 0;
    s_axis_sume_meta = 0;
    s_axis_pifo_almost_full_bit_array = 0;
    s_axis_buffer_almost_full_bit_array = 0;


    # 5000

    s_axis_pkt_last = 0;
    s_axis_valid = 1;
    s_axis_sume_meta = 'h0;
        
    s_axis_sume_meta[DST_POS_PORT1] = 'b1;
    s_axis_sume_meta[DST_POS_PORT2] = 'b1;
    s_axis_sume_meta[DST_POS_PORT3] = 'b1;
        
    s_axis_pifo_almost_full_bit_array  = 'b01110; // port 1,2,3 is full               
    
    # 5000 // chunk 2/3, no signal change 
           
    # 5000 // chunk 3/3, last bit set to 1
    s_axis_pkt_last = 1;

    # 5000 // reset all signal.

    s_axis_pkt_last = 0;
    s_axis_valid = 0;
    s_axis_sume_meta = 0;
    s_axis_pifo_almost_full_bit_array = 0;
    s_axis_buffer_almost_full_bit_array = 0;


#100000
// enqueue if one port is available
// pkt4. 
// 3 chunck.
// output port 1 & 2 & 3,
// buffer full: 1, 
// pifo full: 2.
// expect result: only enqueue to port 3

    s_axis_pkt_last = 0;
    s_axis_valid = 0;
    s_axis_sume_meta = 0;
    s_axis_pifo_almost_full_bit_array = 0;


    # 5000 // chunck 1/3
    s_axis_valid = 1;
    s_axis_sume_meta = 'h0;
    s_axis_sume_meta[DST_POS_PORT1] = 'b1;
    s_axis_sume_meta[DST_POS_PORT2] = 'b1;
    s_axis_sume_meta[DST_POS_PORT3] = 'b1;
        
    s_axis_pifo_almost_full_bit_array  = 'b00010; // port 1,buffer is full               
    s_axis_buffer_almost_full_bit_array = 'b00100; // port 2, pifo is full
    # 5000 // chunck 2/3
               
    # 5000 // chunck 3/3, set last bit to 1
    s_axis_pkt_last = 1;


    # 5000 // reset all signal
    s_axis_pkt_last = 0;
    s_axis_valid = 0;
    s_axis_sume_meta = 0;
    s_axis_pifo_almost_full_bit_array = 0;
    s_axis_buffer_almost_full_bit_array = 0;



//

#100000
// enqueue cpu port
// pkt5. 
// 3 chunck.
// output port cpu port from port0 and port0,
// buffer full: 1, 2.
// expect result: enqueue to cpu and port 0

    s_axis_pkt_last = 0;
    s_axis_valid = 0;
    s_axis_sume_meta = 0;
    s_axis_pifo_almost_full_bit_array = 0;


    # 5000 // chunck 1/3
    s_axis_valid = 1;
    s_axis_sume_meta = 'h0;
    s_axis_sume_meta[DST_POS_PORT0] = 'b1;
    s_axis_sume_meta[DST_POS_PORT0+1] = 'b1;
        
    s_axis_pifo_almost_full_bit_array  = 'b00110; // port 1,2 is full               
    
    # 5000 // chunck 2/3
               
    # 5000 // chunck 3/3, set last bit to 1
    s_axis_pkt_last = 1;


    # 5000 // reset all signal
    s_axis_pkt_last = 0;
    s_axis_valid = 0;
    s_axis_sume_meta = 0;
    s_axis_pifo_almost_full_bit_array = 0;



// enqueue cpu port
// pkt6. 
// 3 chunck.
// output port cpu port from port1 ,
// buffer full: 1, 2.
// expect result: enqueue to cpu and port 0

    s_axis_pkt_last = 0;
    s_axis_valid = 0;
    s_axis_sume_meta = 0;
    s_axis_pifo_almost_full_bit_array = 0;


    # 5000 // chunck 1/3
    s_axis_valid = 1;
    s_axis_sume_meta = 'h0;
    s_axis_sume_meta[DST_POS_PORT1+1] = 'b1;
        
    s_axis_pifo_almost_full_bit_array  = 'b00110; // port 1,2 is full               
    
    # 5000 // chunck 2/3
               
    # 5000 // chunck 3/3, set last bit to 1
    s_axis_pkt_last = 1;


    # 5000 // reset all signal
    s_axis_pkt_last = 0;
    s_axis_valid = 0;
    s_axis_sume_meta = 0;
    s_axis_pifo_almost_full_bit_array = 0;


// drop pkt by drop field
// pkt6. 
// 3 chunck.
// output port 0,1,2 ,
// buffer full: no.
// drop field is 1
// expect result: enqueue to cpu and port 0

    s_axis_pkt_last = 0;
    s_axis_valid = 0;
    s_axis_sume_meta = 0;
    s_axis_pifo_almost_full_bit_array = 0;


    # 5000 // chunck 1/3
    s_axis_valid = 1;
    s_axis_sume_meta = 'h0;
    s_axis_sume_meta[DST_POS_PORT0] = 'b1;
    s_axis_sume_meta[DST_POS_PORT1] = 'b1;
    s_axis_sume_meta[DST_POS_PORT2] = 'b1;
    s_axis_sume_meta[DROP_POS] = 'b1;
        
    s_axis_pifo_almost_full_bit_array  = 'b00110; // port 1,2 is full               
    
    # 5000 // chunck 2/3
               
    # 5000 // chunck 3/3, set last bit to 1
    s_axis_pkt_last = 1;


    # 5000 // reset all signal
    s_axis_pkt_last = 0;
    s_axis_valid = 0;
    s_axis_sume_meta = 0;
    s_axis_pifo_almost_full_bit_array = 0;


end





    
 
endmodule

