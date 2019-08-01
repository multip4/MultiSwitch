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


module eq_agent_sim;

reg clk;
reg rstn;

// ========================
// Enqueue Agent Reg/Wires

    reg [255:0] s_axis_pkt_data;
    reg [31:0] s_axis_pkt_keep;
    reg s_axis_pkt_last;
    reg [127:0] s_axis_sume_meta;
    reg [36:0] s_pifo_info[4:0];
    reg s_axis_valid;
    
    reg [4:0] s_axis_buffer_almost_full_bit_array;
    reg [4:0] s_axis_pifo_almost_full_bit_array;
    

    
    wire [255:0] m_axis_pkt_data;
    wire [31:0] m_axis_pkt_keep;
    wire m_axis_pkt_last;
    
    wire [127:0] m_axis_sume_meta;
    wire [36:0] m_axis_pifo_info[4:0];
    wire [4:0] m_axis_output_port_bit_array;
    
    wire m_axis_ctl_pkt_wr_en;
    wire m_axis_ctl_meta_wr_en;
    wire m_axis_ctl_pifo_enq;
    wire m_axis_ctl_pkt_addr_update;
    wire m_axis_ctl_meta_addr_update;
        

// end.Enqueue Agent Reg/Wires
// =========================


// ============================
// init module

    EnqueueAgent
    myenq1(
    .s_axis_pkt_data(s_axis_pkt_data),
    .s_axis_pkt_keep(s_axis_pkt_keep),
    .s_axis_pkt_last(s_axis_pkt_last),
    .s_axis_sume_meta({s_pifo_info[0],s_pifo_info[1],s_pifo_info[2],s_pifo_info[3],s_pifo_info[4],s_axis_sume_meta}),
    .s_axis_valid(s_axis_valid),
    
    .s_axis_buffer_almost_full_bit_array(s_axis_buffer_almost_full_bit_array),
    .s_axis_pifo_almost_full_bit_array(s_axis_pifo_almost_full_bit_array),
    

    
    .m_axis_pkt_info({m_axis_pkt_data,m_axis_pkt_keep,m_axis_pkt_last}),
    .m_axis_sume_meta(m_axis_sume_meta),
    .m_axis_pifo_info({m_axis_pifo_info[0],m_axis_pifo_info[1],m_axis_pifo_info[2],m_axis_pifo_info[3],m_axis_pifo_info[4]}),
    .m_axis_output_port_bit_array(m_axis_output_port_bit_array),
    
    .m_axis_ctl_pkt_wr_en(m_axis_ctl_pkt_wr_en),
    .m_axis_ctl_meta_wr_en(m_axis_ctl_meta_wr_en),
    .m_axis_ctl_pifo_enq(m_axis_ctl_pifo_enq),
    .m_axis_ctl_pkt_addr_update(m_axis_ctl_pkt_addr_update),
    .m_axis_ctl_meta_addr_update(m_axis_ctl_meta_addr_update),
        
    .rstn(rstn),
    .clk(clk)
    
    
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
    
    s_axis_pkt_data = 0;
    s_axis_pkt_keep = 0;
    s_axis_pkt_last = 0;
    s_axis_valid = 0;
    s_axis_sume_meta = 0;
    s_pifo_info[0] = 0;
    s_pifo_info[1] = 0;
    s_pifo_info[2] = 0;
    s_pifo_info[3] = 0;
    s_pifo_info[4] = 0;
    s_axis_buffer_almost_full_bit_array = 0;
    s_axis_pifo_almost_full_bit_array = 0;
    
    
    
    
    # 100000
    rstn = 1;
// ===================================    
// buffer & pifo full senario
    
    # 5000
    s_axis_pkt_data = 'h11111111111111111;
    s_axis_pkt_keep = 'hffffffff;
    s_axis_pkt_last = 0;
    s_axis_valid = 1;
    
    s_axis_sume_meta = 'h1 << DST_POS;
    s_pifo_info[0] = 'h1 << PIFO_VALID_POS;
    s_pifo_info[1] = 'h1 << PIFO_VALID_POS;
    s_pifo_info[2] = 'h1 << PIFO_VALID_POS;
    s_pifo_info[3] = 'h1 << PIFO_VALID_POS;
    s_pifo_info[4] = 'h1 << PIFO_VALID_POS;
    
    s_axis_buffer_almost_full_bit_array  = 'b00001;
    s_axis_pifo_almost_full_bit_array  = 'b00100;
                  
    
    # 5000
    
    s_axis_pkt_data = 'h2222222222222222;
    s_axis_pkt_keep = 'hffffffff;
    s_axis_pkt_last = 1;
    s_axis_valid = 1;
    
//    s_axis_sume_meta = 'h1 << DST_POS;
//    s_pifo_info[0] = 'h1 << PIFO_VALID_POS;
//    s_pifo_info[1] = 'h1 << PIFO_VALID_POS;
//    s_pifo_info[2] = 'h1 << PIFO_VALID_POS;
//    s_pifo_info[3] = 'h1 << PIFO_VALID_POS;
//    s_pifo_info[4] = 'h1 << PIFO_VALID_POS;
    
//    s_axis_buffer_almost_full_bit_array  = 'b00000;
//    s_axis_pifo_almost_full_bit_array  = 'b00000;
                  
      # 5000
      s_axis_valid = 0;
// end. for buffer full & pifo full scenario
// ============================================


    #100000
// ============================================
// normal case
// packet size = 3 chunk

    # 5000
    s_axis_pkt_data = 'h123123123123123123;
    s_axis_pkt_keep = 'hffffffff;
    s_axis_pkt_last = 0;
    s_axis_valid = 1;
    
    s_axis_sume_meta = 'h1 << DST_POS;
    s_pifo_info[0] = 'h1 << PIFO_VALID_POS;
    s_pifo_info[1] = 'h1 << PIFO_VALID_POS;
    s_pifo_info[2] = 'h0 << PIFO_VALID_POS;
    s_pifo_info[3] = 'h0 << PIFO_VALID_POS;
    s_pifo_info[4] = 'h0 << PIFO_VALID_POS;
    
    s_axis_buffer_almost_full_bit_array  = 'b00000;
    s_axis_pifo_almost_full_bit_array  = 'b00100;  // pifo3 is full.
                  
    
    # 5000
    
    s_axis_pkt_data = 'h2222222222222222;
    s_axis_pkt_keep = 'hffffffff;
    s_axis_pkt_last = 0;
    s_axis_valid = 1;
    
                  
    # 5000
    
    s_axis_pkt_data = 'h33333333333333333333333333;
    s_axis_pkt_keep = 'hffffffff;
    s_axis_pkt_last = 1;
    s_axis_valid = 1;


    # 5000
    s_axis_valid = 0;


// end.normal case
// =============================================                
    
    
    
end





    
 
endmodule
