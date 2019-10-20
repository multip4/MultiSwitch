`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/08/2019 05:29:19 AM
// Design Name: 
// Module Name: pifo_calendar_sim
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


module pifo_calendar_sim;

localparam PIFO_INFO_WIDTH = 32;

reg clk;
reg rstn; // active low

wire [PIFO_INFO_WIDTH-1:0] s_axis_pifo_info;
reg                       s_axis_insert_en;
reg                       s_axis_pop_en;
reg [0:0]  s_axis_pifo_info_valid;
reg [18:0] s_axis_pifo_info_rank;
reg [11:0] s_axis_pifo_info_field;



wire [PIFO_INFO_WIDTH-1:0] m_axis_pifo_info;

wire [10:0] m_axis_pifo_info_field;
wire        m_axis_buffer_addr_valid;
wire m_axis_bypass_en;
wire m_axis_calendar_full;

assign s_axis_pifo_info = {s_axis_pifo_info_valid, s_axis_pifo_info_rank, s_axis_pifo_info_field};

//output_queue_v0_1
//output_queue_inst(
//);

pifo_calendar_v0_1
#(
.PIFO_CALENDAR_SIZE(10)
)
pifo_root_init
(
    .s_axis_pifo_info_root(s_axis_pifo_info),
    .s_axis_insert_en(s_axis_insert_en),
    .s_axis_pop_en(s_axis_pop_en),
    .m_axis_buffer_addr(m_axis_pifo_info_field),
    .m_axis_buffer_addr_valid(m_axis_buffer_addr_valid),
    .m_axis_bypass_en(m_axis_bypass_en),
    .m_axis_calendar_full(m_axis_calendar_full),
    .clk(clk),
    .rstn(rstn) // active at low
);

always begin 
  #(5000 / 2) clk =  0; 
  #(5000 / 2) clk =  1; 
end

initial begin
    clk = 0;
    rstn = 0;
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;
    s_axis_pop_en = 0;
            
    # 100000
    rstn = 1;
    # 1

    
    //  ========
    // insert to head.
    // pkt1. rank = 10, field = 1111, islast = 1
    // after 2 clock.
    # 10000   
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_rank = 10;
    s_axis_pifo_info_field = 1;
    s_axis_insert_en = 1;
    
    # 5000 // reset 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;


    //  ========
    // insert to tail with same rank .
    // pkt1_1. rank = 10, field = 1111, islast = 1
    // after 2 clock.
    # 10000   
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_rank = 10;
    s_axis_pifo_info_field = 11;
    s_axis_insert_en = 1;
    
    # 5000 // reset 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;
 
    //  ========
    // insert to tail with same rank .
    // pkt12. rank = 10, field = 1111, islast = 1
    // after 2 clock.
    # 10000   
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_rank = 10;
    s_axis_pifo_info_field = 12;
    s_axis_insert_en = 1;
    
    # 5000 // reset 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;   
    
    
    //  ========
    // insert to tail with same rank .
    // pkt13. rank = 10, field = 1111, islast = 1
    // after 2 clock.
    # 10000   
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_rank = 10;
    s_axis_pifo_info_field = 13;
    s_axis_insert_en = 1;
    
    # 5000 // reset 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;   
    
    
    
    //  ========
    // insert to tail with same rank .
    // pkt14. rank = 10, field = 1111, islast = 1
    // after 2 clock.
    # 10000   
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_rank = 10;
    s_axis_pifo_info_field = 14;
    s_axis_insert_en = 1;
    
    # 5000 // reset 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;   
    
    
    //  ========
    // insert to tail with same rank .
    // pkt15. rank = 10, field = 1111, islast = 1
    // after 2 clock.
    # 10000   
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_rank = 10;
    s_axis_pifo_info_field = 15;
    s_axis_insert_en = 1;
    
    # 5000 // reset 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;   
    
    
    //  ========
    // insert to tail with same rank .
    // pkt16. rank = 10, field = 1111, islast = 1
    // after 2 clock.
    # 10000   
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_rank = 10;
    s_axis_pifo_info_field = 16;
    s_axis_insert_en = 1;
    
    # 5000 // reset 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;   
    
    //  ========
    // insert to tail with same rank .
    // pkt17. rank = 10, field = 1111, islast = 1
    // after 2 clock.
    # 10000   
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_rank = 10;
    s_axis_pifo_info_field = 17;
    s_axis_insert_en = 1;
    
    # 5000 // reset 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;   
    
    
    //  ========
    // insert to tail with same rank .
    // pkt18. rank = 10, field = 1111, islast = 1
    // after 2 clock.
    # 10000   
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_rank = 10;
    s_axis_pifo_info_field = 18;
    s_axis_insert_en = 1;
    
    # 5000 // reset 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;   
    
    //  ========
    // insert to tail with same rank .
    // pkt19. rank = 10, field = 1111, islast = 1
    // after 2 clock.
    # 10000   
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_rank = 10;
    s_axis_pifo_info_field = 19;
    s_axis_insert_en = 1;
    
    # 5000 // reset 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;   
    
    
    //  ========
    // insert to tail with same rank .
    // pkt20. rank = 10, field = 1111, islast = 1
    // after 2 clock.
    # 10000   
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_rank = 10;
    s_axis_pifo_info_field = 20;
    s_axis_insert_en = 1;
    
    # 5000 // reset 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;   
    
    
    # 5000 // pop 9 packets
    s_axis_pop_en = 1;
    # 45000
    s_axis_pop_en = 0;
        

    // ========
    // insertion (head)
    // pkt2. rank = 1, field = 2222, islast = 1
    // after 2 clock
    # 10000
    
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_rank = 1;
    s_axis_pifo_info_field = 2;
    s_axis_insert_en = 1;
    
    # 5000 // reset 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;
    
    //after 2 clock
    # 10000
    
    // ========
    // insertion (tail)
    // pkt3. rank = 20, field = 3333, islast = 1
    
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_rank = 20;
    s_axis_pifo_info_field = 3;
    s_axis_insert_en = 1;
    
    # 5000 // reset 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;
    
    //after 2 clock
    # 10000
    
    // ========
    // insertion (2clock)
    // pkt4. rank = 15, field = 3333, islast = 1
   
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_rank = 15;
    s_axis_pifo_info_field = 4;
    s_axis_insert_en = 1;
    
    # 5000 // reset 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;
            
    // after 2 clock
    # 10000
    // ======================
    // Start to Dequeue
    s_axis_pop_en = 1;

    // after 2 clock
    # 10000
    s_axis_pop_en = 0;
    


    // ========
    // racing condition
    // read and write, which write element has biggest value
    
    # 10000
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_rank = 100;
    s_axis_pifo_info_field = 6;
    s_axis_insert_en = 1;
    s_axis_pop_en = 1;
    
    # 5000 // reset 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;
    s_axis_pop_en = 0;
    
    

    // ========
    // racing condition 3/4
    // read and write, which write element has middle value

    # 10000
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_rank = 50;
    s_axis_pifo_info_field = 7;
    s_axis_insert_en = 1;
    s_axis_pop_en = 1;
    
    # 5000 // reset 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;
    s_axis_pop_en = 0;



    // ========
    // racing condition 4/4
    // read and write, which read has 1 clock delay than write.
    // and write middle value

    # 10000
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_rank = 60;
    s_axis_pifo_info_field = 8;
    s_axis_insert_en = 1;
    
    #5000
    s_axis_insert_en = 0;   
    s_axis_pop_en = 1;
    
    # 5000 // reset 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;
    s_axis_pop_en = 0;
    

end

endmodule
