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
    
    reg [4:0]   s_axis_buffer_almost_full_bit_array;
    reg [4:0]   s_axis_pifo_almost_full_bit_array;
    
    wire [4:0] m_axis_output_port_bit_array;
    
    wire s_axis_ready;
    wire [4:0] m_axis_pifo_in_en;
    wire [4:0] m_axis_buffer_wr_en;
        

// end.Enqueue Agent Reg/Wires
// =========================

enqueue_agent_v0_1
enq(
        // from/to pipeline
        .s_axis_tvalid(s_axis_valid),
        .s_axis_tready(s_axis_ready),
        .s_axis_tuser(s_axis_sume_meta), // sume_meta + pifo_info_root + pifo_info_child.
        .s_axis_tlast(s_axis_pkt_last),
        
        // from each port queue status 
        .s_axis_buffer_almost_full(s_axis_buffer_almost_full_bit_array),
            
        .m_axis_ctl_pifo_in_en(m_axis_pifo_in_en),
        .m_axis_ctl_buffer_wr_en(m_axis_buffer_wr_en),
        
        .axis_aclk(clk),
        .axis_resetn(rstn)
);

// ============================


localparam DST_POS = 24;
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
    s_axis_buffer_almost_full_bit_array = 0;
    s_axis_pifo_almost_full_bit_array = 0;
    

    
    # 100000
    rstn = 1;
    # 1
 //   # 3000
// ===================================    
    
    // pkt1. 
    // 2 chunck.
    // output port 0 & 3,
    // buffer full: no.
    
    # 5000
    s_axis_pkt_last = 0;
    s_axis_valid = 1;
    s_axis_sume_meta = 'h0;
        
    
    s_axis_sume_meta[DST_POS] = 'b1;
    s_axis_sume_meta[DST_POS+6] = 'b1;
        
    s_axis_buffer_almost_full_bit_array  = 'b00000; // port 1,2,3 is full               
    
    # 5000
    
    s_axis_pkt_last = 1;
    s_axis_valid = 1;
    


    # 5000
    s_axis_valid = 0;
// end. for buffer full & pifo full scenario
// ============================================


    #100000
// ============================================
// normal case
// pkt2. 
// 3 chunck.
// output port 1& 2 & 3,
// buffer full: no.

# 5000
s_axis_pkt_data = 'h20202020202020202020202020202020;
s_axis_pkt_keep = 'hffffffff;
s_axis_pkt_last = 0;
s_axis_valid = 1;
s_axis_sume_meta = 'h0;
    

s_axis_sume_meta[DST_POS+2] = 'b1;
s_axis_sume_meta[DST_POS+4] = 'b1;
s_axis_sume_meta[DST_POS+6] = 'b1;
    
s_axis_buffer_almost_full_bit_array  = 'b00000; // no port is full               

# 5000

s_axis_pkt_data = 'h2121212121212121212121212121;
s_axis_pkt_keep = 'hffffffff;
s_axis_pkt_last = 0;
s_axis_valid = 1;

              
# 5000

s_axis_pkt_data = 'h222222222222222222222222222222;
s_axis_pkt_keep = 'hffffffff;
s_axis_pkt_last = 1;
s_axis_valid = 1;


# 5000
s_axis_valid = 0;

// end.normal case
// =============================================                

// =============================================    
// drop case by buffer full
// pkt3. 
// 3 chunck.
// output port 1 & 2 & 3,
// buffer full: 1, 2, 3.

    # 5000
    s_axis_pkt_data = 'h333333333;
    s_axis_pkt_keep = 'hffffffff;
    s_axis_pkt_last = 0;
    s_axis_valid = 1;
    s_axis_sume_meta = 'h0;
        
    
    s_axis_sume_meta[DST_POS+2] = 'b1;
    s_axis_sume_meta[DST_POS+4] = 'b1;
    s_axis_sume_meta[DST_POS+6] = 'b1;
        
    s_axis_buffer_almost_full_bit_array  = 'b01110; // port 1,2,3 is full               
    
    # 5000
    
    s_axis_pkt_data = 'h3131313131313131313131;
    s_axis_pkt_keep = 'hffffffff;
    s_axis_pkt_last = 0;
    s_axis_valid = 1;
    
                  
    # 5000
    
    s_axis_pkt_data = 'h32323232323232323232323232;
    s_axis_pkt_keep = 'hffffffff;
    s_axis_pkt_last = 1;
    s_axis_valid = 1;


    # 5000
    s_axis_valid = 0;




// enqueue if one port is available
// pkt4. 
// 3 chunck.
// output port 1 & 2 & 3,
// buffer full: 1, 2.

    # 5000
    s_axis_pkt_data = 'h444444444444444444444444;
    s_axis_pkt_keep = 'hffffffff;
    s_axis_pkt_last = 0;
    s_axis_valid = 1;
    s_axis_sume_meta = 'h0;
        
    
    s_axis_sume_meta[DST_POS+2] = 'b1;
    s_axis_sume_meta[DST_POS+4] = 'b1;
    s_axis_sume_meta[DST_POS+6] = 'b1;
        
    s_axis_buffer_almost_full_bit_array  = 'b00110; // port 1,2 is full               
    
    # 5000
    
    s_axis_pkt_data = 'h41414141414141414141414141414141;
    s_axis_pkt_keep = 'hffffffff;
    s_axis_pkt_last = 0;
    s_axis_valid = 1;
    
                  
    # 5000
    
    s_axis_pkt_data = 'h4242424242424242424242424242424242424242;
    s_axis_pkt_keep = 'hffffffff;
    s_axis_pkt_last = 1;
    s_axis_valid = 1;


    # 5000
    s_axis_valid = 0;



    
    
end





    
 
endmodule

