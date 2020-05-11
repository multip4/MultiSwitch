`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/07/2019 10:59:00 PM
// Design Name: 
// Module Name: pifo_calendar_cpu_sim
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


module pifo_calendar_cpu_sim_v0_4;

localparam CALENDAR_SIZE = 32;
localparam PIFO_INFO_WIDTH = 32;
localparam BUFFER_ADDR_WIDTH = 12;
localparam PIFO_RANK_WIDTH = 18;


reg clk;
reg rstn; // active low

wire [PIFO_INFO_WIDTH-1:0]  s_axis_pifo_info;
reg                         s_axis_insert_en;
reg                         s_axis_pop_en;

reg                         s_axis_pifo_info_valid;
reg                         s_axis_pifo_info_overflow;
reg [PIFO_RANK_WIDTH-1:0]   s_axis_pifo_info_rank;
reg [BUFFER_ADDR_WIDTH-1:0] s_axis_pifo_info_field;

assign s_axis_pifo_info = {s_axis_pifo_info_valid, s_axis_pifo_info_overflow, s_axis_pifo_info_rank, s_axis_pifo_info_field};

reg cpu_rd_valid;
reg [9:0] cpu_rd_addr;
wire cpu_rd_result_valid;
wire [PIFO_INFO_WIDTH-1:0] cpu_rd_result;

reg cpu_wr_valid;
reg [9:0] cpu_wr_addr;
reg [PIFO_INFO_WIDTH-1:0] cpu_wr_data;
wire cpu_wr_result_valid;
      



wire [PIFO_INFO_WIDTH-1:0] m_axis_pifo_info;

wire [BUFFER_ADDR_WIDTH-1:0] m_axis_pifo_info_field;




pifo_calendar_v0_4_with_cpu
    #(
    .PIFO_CALENDAR_SIZE(CALENDAR_SIZE),
    .BUFFER_ADDR_WIDTH(BUFFER_ADDR_WIDTH),
    .PIFO_CALENDAR_INDEX_WIDTH(10)
    )
    pifo_calendar_inst
    (
        .s_axis_pifo_info_root(s_axis_pifo_info),
        .s_axis_insert_en(s_axis_insert_en),
        .s_axis_pop_en(s_axis_pop_en), // pop signal uses combinational logic output.
        
        .m_axis_pifo_calendar_top(m_axis_pifo_info),
        .m_axis_buffer_addr(m_axis_pifo_info_field), // pop result, buffer address
        .m_axis_calendar_full(),
        // add cpu i/o later.
//        .cpu_rd_valid(cpu2ip_read_pifo_calendar_req_valid),                  
//        .cpu_rd_addr(cpu2ip_read_pifo_calendar_req_addr),                   
//        .cpu_rd_result_valid(ip2cpu_read_pifo_calendar_resp_valid),           
//        .cpu_rd_result(ip2cpu_read_pifo_calendar_resp_value),                 
                                       
//        .cpu_wr_valid(cpu2ip_write_pifo_calendar_req_valid),                  
//        .cpu_wr_addr(cpu2ip_write_pifo_calendar_req_addr),                   
//        .cpu_wr_data(cpu2ip_write_pifo_calendar_req_value),                   
//        .cpu_wr_result_valid(ip2cpu_write_pifo_calendar_resp_valid),           
        
        // reset & clock
        .clk(clk),
        .rstn(rstn)
        
    );

always begin 
  #(5000 / 2) clk =  0; 
  #(5000 / 2) clk =  1; 
end

initial begin
    clk = 0;
    rstn = 0;
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_overflow = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;
    s_axis_pop_en = 0;
    
            
    # 100000
    rstn = 1;
    # 1

   
    
    //  ========
    // insert to head.
    // pkt1. rank = 10, field = 1,
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
    // pkt1_1. rank = 10, field = 11,
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
    // pkt12. rank = 10, field = 12
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
    // pkt13. rank = 10, field = 13
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
    // pkt14. rank = 10, field = 14
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
    // pkt15. rank = 10, field = 15
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
    // pkt16. rank = 10, field = 16
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
    // pkt17. rank = 10, field = 17
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
    // pkt18. rank = 10, field = 18
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
    // pkt19. rank = 10, field = 19
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
    // pkt20. rank = 10, field = 20
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
    // pkt2. rank = 1, field = 2
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
    // pkt3. rank = 20, field = 3
    
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
    // pkt4. rank = 15, field = 4
   
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
    
    
    // reset 
    #5000
    rstn = 0;
    

    #100000
    rstn = 1;
    
    
    // =========================================
    // Overflow Test
    
    // insert pkt1. rank = 'h100, field = 'h100, overflow 0
    
    # 5000 
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_overflow = 0;
    s_axis_pifo_info_rank = 'h100;
    s_axis_pifo_info_field = 'h1;
    s_axis_insert_en = 1;
    
    # 5000 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;
    
    
    // insert pkt2. rank = 'h200, field = 'h200, overflow 0
    
    # 5000 
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_overflow = 0;
    s_axis_pifo_info_rank = 'h200;
    s_axis_pifo_info_field = 'h2;
    s_axis_insert_en = 1;
    
    # 5000 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;
    
    // insert pkt3. rank = 'h300, field = 'h300, overflow 0
    
    # 5000 
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_overflow = 0;
    s_axis_pifo_info_rank = 'h300;
    s_axis_pifo_info_field = 'h3;
    s_axis_insert_en = 1;
    
    # 5000 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;
    
    // insert pkt4. rank = 'h400, field = 'h400, overflow 0
    
    # 5000 
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_overflow = 0;
    s_axis_pifo_info_rank = 'h400;
    s_axis_pifo_info_field = 'h4;
    s_axis_insert_en = 1;
    
    # 5000 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;
    
    // insert pkt5. rank = 'h500, field = 'h500, overflow 0
    
    # 5000 
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_overflow = 0;
    s_axis_pifo_info_rank = 'h500;
    s_axis_pifo_info_field = 'h5;
    s_axis_insert_en = 1;
    
    # 5000 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;
    
    
    // insert pkt6. rank = 'h100, field = 'h100, overflow 1
    
    # 5000 
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_overflow = 1;
    s_axis_pifo_info_rank = 'h100;
    s_axis_pifo_info_field = 'h6;
    s_axis_insert_en = 1;
    
    # 5000 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;
    
    
    // insert pkt7. rank = 'h200, field = 'h200, overflow 1
    
    # 5000 
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_overflow = 1;
    s_axis_pifo_info_rank = 'h200;
    s_axis_pifo_info_field = 'h7;
    s_axis_insert_en = 1;
    
    # 5000 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;
    
    // insert pkt8. rank = 'h300, field = 'h300, overflow 1
    
    # 5000 
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_overflow = 1;
    s_axis_pifo_info_rank = 'h300;
    s_axis_pifo_info_field = 'h8;
    s_axis_insert_en = 1;
    
    # 5000 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;
    
    // insert pkt9. rank = 'h400, field = 'h400, overflow 1
    
    # 5000 
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_overflow = 1;
    s_axis_pifo_info_rank = 'h400;
    s_axis_pifo_info_field = 'h9;
    s_axis_insert_en = 1;
    
    # 5000 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;
    
    // insert pkt10. rank = 'h500, field = 'h500, overflow 1
    
    # 5000 
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_overflow = 1;
    s_axis_pifo_info_rank = 'h500;
    s_axis_pifo_info_field = 'h10;
    s_axis_insert_en = 1;
    
    # 5000 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;
    
    
    // insert pkt11. rank = 'h200, field = 'h200, overflow 0
    
    # 5000 
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_overflow = 0;
    s_axis_pifo_info_rank = 'h200;
    s_axis_pifo_info_field = 'h11;
    s_axis_insert_en = 1;
    
    # 5000 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;
    
    
    // dequeue pkts,
    
    # 5000 
    s_axis_pop_en = 1;
    
    # 35000 
    s_axis_pop_en = 0;
    
    // insert pkt12. rank = 'h200, field = 'h200, overflow 0
    
    # 5000 
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_overflow = 0;
    s_axis_pifo_info_rank = 'h200;
    s_axis_pifo_info_field = 'h12;
    s_axis_insert_en = 1;
    
    # 5000 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;
        
    
    // insert pkt13. rank = 'h300, field = 'h300, overflow 0
    
    # 5000 
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_overflow = 0;
    s_axis_pifo_info_rank = 'h300;
    s_axis_pifo_info_field = 'h13;
    s_axis_insert_en = 1;
    
    # 5000 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;
    

    // insert pkt14. rank = 'h300, field = 'h300, overflow 1
    
    # 5000 
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_overflow = 1;
    s_axis_pifo_info_rank = 'h400;
    s_axis_pifo_info_field = 'h14;
    s_axis_insert_en = 1;
    
    # 5000 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;

    // insert pkt15. rank = 'h500, field = 'h500, overflow 1
    
    # 5000 
    s_axis_pifo_info_valid = 1;
    s_axis_pifo_info_overflow = 1;
    s_axis_pifo_info_rank = 'h500;
    s_axis_pifo_info_field = 'h15;
    s_axis_insert_en = 1;
    
    # 5000 
    s_axis_pifo_info_valid = 0;
    s_axis_pifo_info_rank = 0;
    s_axis_pifo_info_field = 0;
    s_axis_insert_en = 0;
    
    
    
    

end

endmodule


