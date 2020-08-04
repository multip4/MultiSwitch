`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2019 02:26:16 PM
// Design Name: 
// Module Name: pifo_calendar_v0_1_with_cpu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created from pifo_calendar_v0_4_with_cpu.v
// Revision 0.1 -- add gpfc feature
// Revision 1.1 -- update calendar structure from single to multi.
//                 in previoius structure(in single pifo calendar), it is hard to meet timing for priority encoder,
//                 in version 1.1, we split the single into multi pifo calendar,
//                 each pifo calendar handles same Traffic Class packets,
//                 in enqueue, push in packet into dedicated pifo calendar
//                 in dequeue, pop packet from the pifo calendar which has smallest value, and not paused.

// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// use pifo atom with overflow handling
// in version 1, use multiple pifo calendar,
// each calendar dedicated to one traffic class,
// the total number of pifo element is
// PIFO_CALENDAR_SIZE * GPFC_PAUSE_TC_NUM
 

module pifo_calendar_gpfc_top
 #(
    parameter PIFO_CALENDAR_SIZE = 128,
    parameter BUFFER_ADDR_WIDTH = 12,
    
    parameter ELEMENT_WIDTH = 40,
    parameter ELEMENT_VALID_WIDTH = 1,
    parameter ELEMENT_OVERFLOW_WIDTH = 1,
    parameter ELEMENT_RANK_WIDTH = 17,
    parameter GPFC_COS_WIDTH = 3,
    parameter GPFC_RANK_WIDTH = 6,
    parameter PKT_ADDRESS_WIDTH = 12,
    parameter GPFC_PAUSE_TC_NUM = 8,
    parameter GPFC_PAUSE_RANK_WIDTH = 6

    )
    (
        s_axis_valid,
        s_axis_pifo_info_root0,
        s_axis_pifo_info_root1,
        s_axis_pifo_info_root2,
        s_axis_pifo_info_root3,
        s_axis_pifo_info_root4,
        s_axis_pifo_info_root5,
        s_axis_pifo_info_root6,
        s_axis_pifo_info_root7,
                                 
        s_axis_insert_en,
        s_axis_pop_en,
        
        m_axis_valid,
        m_axis_pifo_calendar_top,
        m_axis_buffer_addr, // pop result, buffer address    
        m_axis_calendar_full,
//        m_axis_calendar_count,

        //gpfc input 
        // pause vector
        s_axis_gpfc_pause_vector,
        // pause rank
        s_axis_gpfc_pause_rank,
        // output signal to indicate the queue is paused.
        // true for not paused,
        // false foir paused.
        m_axis_dequeue_is_not_paused,
        m_axis_is_bypass,
        // reset & clock
        rstn,
        clk
    );
    
    input [ELEMENT_WIDTH-1:0]  s_axis_pifo_info_root1,s_axis_pifo_info_root2,s_axis_pifo_info_root3,s_axis_pifo_info_root4;
    input [ELEMENT_WIDTH-1:0]  s_axis_pifo_info_root5,s_axis_pifo_info_root6,s_axis_pifo_info_root7,s_axis_pifo_info_root0;
    input                        s_axis_insert_en;
    input                        s_axis_pop_en;
    input                        s_axis_valid;
    
    output                         m_axis_valid;
    output [BUFFER_ADDR_WIDTH-1:0] m_axis_buffer_addr;
    output [ELEMENT_WIDTH-1:0]     m_axis_pifo_calendar_top;
    output                         m_axis_calendar_full;
//    output                         m_axis_calendar_count;
    output reg                     m_axis_dequeue_is_not_paused;
    output reg                     m_axis_is_bypass;

    //gpfc input
    input [GPFC_PAUSE_TC_NUM-1:0] s_axis_gpfc_pause_vector;
    input [GPFC_PAUSE_TC_NUM*GPFC_PAUSE_RANK_WIDTH-1:0] s_axis_gpfc_pause_rank;
    

    input rstn;
    input clk;


   function integer log2;
      input integer number;
      begin
         log2=0;
         while(2**log2<number) begin
            log2=log2+1;
         end
      end
   endfunction // log2

   // ------------ Internal Params --------

   localparam PRIORITY_ENCODER_WIDTH = log2(PIFO_CALENDAR_SIZE);
   localparam PIFO_CALENDAR_INDEX_WIDTH = log2(PIFO_CALENDAR_SIZE);

    wire [PIFO_CALENDAR_SIZE-1:0] w_pifo_atom_out_compare_result;    
    wire [PIFO_CALENDAR_SIZE-1:0] w_pifo_atom_out_not_paused;
    
    reg  [PIFO_CALENDAR_INDEX_WIDTH-1:0] r_pifo_element_count;
    reg  [PIFO_CALENDAR_INDEX_WIDTH-1:0] r_pifo_element_count_next;
 
    reg [ELEMENT_WIDTH-1:0]      r_global_pifo_info, r_global_pifo_info_next; // recent dequeued pifo_info

    // parsing pause rank into array
    wire [GPFC_PAUSE_RANK_WIDTH-1:0]        w_gpfc_pause_rank[0:GPFC_PAUSE_TC_NUM-1];
    
    wire [ELEMENT_VALID_WIDTH-1:0]          w_in_pifo_info_valid;
    wire [ELEMENT_OVERFLOW_WIDTH-1:0]       w_in_pifo_info_overflow;
    wire [ELEMENT_RANK_WIDTH-1:0]           w_in_pifo_info_rank;
    wire [GPFC_COS_WIDTH-1:0]               w_in_pifo_info_gpfc_cos;
    wire [GPFC_RANK_WIDTH-1:0]              w_in_pifo_info_gpfc_rank;
    wire [PKT_ADDRESS_WIDTH-1:0]            w_in_pifo_info_pkt_address;
    wire                                    w_in_pifo_info_is_not_paused;
    
    assign {w_in_pifo_info_valid, 
    w_in_pifo_info_overflow, 
    w_in_pifo_info_rank, 
    w_in_pifo_info_gpfc_cos,
    w_in_pifo_info_gpfc_rank,
    w_in_pifo_info_pkt_address    
    } = s_axis_pifo_info_root0;
    
    wire [ELEMENT_WIDTH-1:0] w_in_pifo_root[0:GPFC_PAUSE_TC_NUM-1];
    
    assign w_in_pifo_root[0] = s_axis_pifo_info_root0;
    assign w_in_pifo_root[1] = s_axis_pifo_info_root1;
    assign w_in_pifo_root[2] = s_axis_pifo_info_root2;
    assign w_in_pifo_root[3] = s_axis_pifo_info_root3;
    assign w_in_pifo_root[4] = s_axis_pifo_info_root4;
    assign w_in_pifo_root[5] = s_axis_pifo_info_root5;
    assign w_in_pifo_root[6] = s_axis_pifo_info_root6;
    assign w_in_pifo_root[7] = s_axis_pifo_info_root7;
    
    


    wire [ELEMENT_VALID_WIDTH-1:0]          w_r_global_pifo_info_valid;
    wire [ELEMENT_OVERFLOW_WIDTH-1:0]       w_r_global_pifo_info_overflow;
    wire [ELEMENT_RANK_WIDTH-1:0]           w_r_global_pifo_info_rank;
    wire [GPFC_COS_WIDTH-1:0]               w_r_global_pifo_info_gpfc_cos;
    wire [GPFC_RANK_WIDTH-1:0]              w_r_global_pifo_info_gpfc_rank;
    wire [PKT_ADDRESS_WIDTH-1:0]            w_r_global_pifo_info_pkt_address;
    
            
    assign {w_r_global_pifo_info_valid, 
    w_r_global_pifo_info_overflow, 
    w_r_global_pifo_info_rank, 
    w_r_global_pifo_info_gpfc_cos,
    w_r_global_pifo_info_gpfc_rank,
    w_r_global_pifo_info_pkt_address    
    } = r_global_pifo_info;


    reg [GPFC_PAUSE_TC_NUM-1:0] combi_pifo_calendar_sub_in_insert_en;
    reg [GPFC_PAUSE_TC_NUM-1:0] combi_pifo_calendar_sub_in_pop_en;
    reg                         combi_pifo_calendar_sub_pop_valid;    
    reg [ELEMENT_WIDTH-1:0] combi_pifo_calendar_sub_pop_element;    
        
        
    wire [GPFC_PAUSE_TC_NUM-1:0] w_pifo_calendar_sub_out_valid;
    wire [ELEMENT_WIDTH-1:0] w_pifo_calendar_sub_out_top_element[0:GPFC_PAUSE_TC_NUM-1];
    wire [GPFC_PAUSE_TC_NUM-1:0] w_pifo_calendar_sub_out_is_full;
    wire [PIFO_CALENDAR_INDEX_WIDTH-1:0] w_pifo_calendar_sub_out_count[0:GPFC_PAUSE_TC_NUM-1];
    
    
    // wire for each calendar sub top elelements,
    // the last index elements indicates input element.
    wire [ELEMENT_VALID_WIDTH-1:0]              w_pifo_calendar_sub_top_info_valid[0:GPFC_PAUSE_TC_NUM];
    wire [ELEMENT_OVERFLOW_WIDTH-1:0]           w_pifo_calendar_sub_top_info_overflow[0:GPFC_PAUSE_TC_NUM];
    wire [ELEMENT_RANK_WIDTH-1:0]               w_pifo_calendar_sub_top_info_rank[0:GPFC_PAUSE_TC_NUM];
    wire [GPFC_COS_WIDTH-1:0]                   w_pifo_calendar_sub_top_info_gpfc_cos[0:GPFC_PAUSE_TC_NUM];
    wire [GPFC_RANK_WIDTH-1:0]                  w_pifo_calendar_sub_top_info_gpfc_rank[0:GPFC_PAUSE_TC_NUM];
    wire [PKT_ADDRESS_WIDTH-1:0]                w_pifo_calendar_sub_top_info_pkt_address[0:GPFC_PAUSE_TC_NUM];
    wire [GPFC_PAUSE_TC_NUM:0]                  w_pifo_calendar_sub_top_info_is_not_paused;
    wire [GPFC_PAUSE_TC_NUM:0]                  w_pifo_calendar_sub_top_info_is_bypass;
        
    reg  [GPFC_PAUSE_TC_NUM:0]                  r_pifo_calendar_sub_top_info_is_not_paused;
    
    // assign the last index value as the input value.
    assign w_pifo_calendar_sub_top_info_valid[GPFC_PAUSE_TC_NUM] = w_in_pifo_info_valid;
    assign w_pifo_calendar_sub_top_info_overflow[GPFC_PAUSE_TC_NUM] = w_in_pifo_info_overflow;
    assign w_pifo_calendar_sub_top_info_rank[GPFC_PAUSE_TC_NUM] = w_in_pifo_info_rank;
    assign w_pifo_calendar_sub_top_info_gpfc_cos[GPFC_PAUSE_TC_NUM] = w_in_pifo_info_gpfc_cos;
    assign w_pifo_calendar_sub_top_info_gpfc_rank[GPFC_PAUSE_TC_NUM] = w_in_pifo_info_gpfc_rank;
    assign w_pifo_calendar_sub_top_info_pkt_address[GPFC_PAUSE_TC_NUM] = w_in_pifo_info_pkt_address;
    assign w_pifo_calendar_sub_top_info_is_not_paused[GPFC_PAUSE_TC_NUM] = w_in_pifo_info_is_not_paused;
    
    
    // wire for keep parralel compare result of each calendar top element,
    // the total compare result is (GPFC_PAUSE_TC_NUM+1) * (GPFC_PAUSE_TC_NUM+1)
    // the last one is for new element, which is for check bypass  
    wire [GPFC_PAUSE_TC_NUM:0] w_pifo_calendar_top_compare [0:GPFC_PAUSE_TC_NUM] ;
    reg  [GPFC_PAUSE_TC_NUM:0] r_pifo_calendar_top_compare [0:GPFC_PAUSE_TC_NUM] ;
    
    reg [ELEMENT_WIDTH-1:0] r_last_dequeue_pifo, r_last_dequeue_pifo_next;
    
genvar i,k;

generate
    
    for(i=0; i < GPFC_PAUSE_TC_NUM; i=i+1)    
        begin: generate_pifo_calendar
           
           pifo_calendar_gpfc_multi_atom
           #(
           .PIFO_CALENDAR_SIZE(PIFO_CALENDAR_SIZE),     
           .BUFFER_ADDR_WIDTH(BUFFER_ADDR_WIDTH),                      
           .ELEMENT_WIDTH(ELEMENT_WIDTH),           
           .ELEMENT_VALID_WIDTH(ELEMENT_VALID_WIDTH),      
           .ELEMENT_OVERFLOW_WIDTH(ELEMENT_OVERFLOW_WIDTH),   
           .ELEMENT_RANK_WIDTH(ELEMENT_RANK_WIDTH),      
           .GPFC_COS_WIDTH(GPFC_COS_WIDTH),           
           .GPFC_RANK_WIDTH(GPFC_RANK_WIDTH),          
           .PKT_ADDRESS_WIDTH(PKT_ADDRESS_WIDTH)  
           )
           pifo_calednar_sub_inst
           (
           .s_axis_pifo_info_root(w_in_pifo_root[i]),
           .s_axis_insert_en(combi_pifo_calendar_sub_in_insert_en[i]),
           .s_axis_pop_en(combi_pifo_calendar_sub_in_pop_en[i]), // pop signal uses combinational logic output.

            .s_axis_last_dequeue_pifo_info(r_last_dequeue_pifo),
           
//           .s_axis_gpfc_pause_valid(s_axis_gpfc_pause_vector[i]),
//           .s_axis_gpfc_pause_rank(w_gpfc_pause_rank[i]),
           
           .m_axis_valid(w_pifo_calendar_sub_out_valid[i]),
           .m_axis_pifo_calendar_top(w_pifo_calendar_sub_out_top_element[i]),
           .m_axis_calendar_full(w_pifo_calendar_sub_out_is_full[i]),
           .m_axis_calendar_count(w_pifo_calendar_sub_out_count[i]),
           .m_axis_is_bypass(w_pifo_calendar_sub_top_info_is_bypass[i]),

           // add cpu i/o later.
           
           // reset & clock
           .clk(clk),
           .rstn(rstn)
           
           ); 
           
           
           // decode top elements for each calendar sub,
           
          assign {w_pifo_calendar_sub_top_info_valid[i], 
           w_pifo_calendar_sub_top_info_overflow[i], 
           w_pifo_calendar_sub_top_info_rank[i], 
           w_pifo_calendar_sub_top_info_gpfc_cos[i],
           w_pifo_calendar_sub_top_info_gpfc_rank[i],
           w_pifo_calendar_sub_top_info_pkt_address[i]    
           } = w_pifo_calendar_sub_out_top_element[i];
           
           // decode pause rank
           assign w_gpfc_pause_rank[i] = s_axis_gpfc_pause_rank[(i+1)*GPFC_PAUSE_RANK_WIDTH-1:i*GPFC_PAUSE_RANK_WIDTH];
           
           
           // check if the top element is paused,
           // 1 for not pause,
           // 0 for pause
           // not(is pause vector valid and rank is not small than paused rank)
//           assign w_pifo_calendar_sub_top_info_is_not_paused[i] = ~(
//                                                                    ~w_pifo_calendar_sub_top_info_valid[i]  // if top is not valid          
//                                                                    | (s_axis_gpfc_pause_vector[i]          // or the cos is paused and top element rank is bigger than pause rank 
//                                                                    & ~(w_pifo_calendar_sub_top_info_gpfc_rank[i] < w_gpfc_pause_rank[i])));
           
           
           assign w_pifo_calendar_sub_top_info_is_not_paused[i] = r_pifo_calendar_sub_top_info_is_not_paused[i];
            
           always @(*)
            begin
                r_pifo_calendar_sub_top_info_is_not_paused[i] = 0;
                
                // not paused logic. 
                // logic 
                // if the top is valid,
                // and if the pause vector is on and the top gpfc rank is smaller than pause rank
                // or if the pause vector is off 
                
                if(w_pifo_calendar_sub_top_info_valid[i])
                    begin
                        if(s_axis_gpfc_pause_vector[i])
                            begin
                                if(w_pifo_calendar_sub_top_info_gpfc_rank[i] < w_gpfc_pause_rank[i])
                                    begin
                                        r_pifo_calendar_sub_top_info_is_not_paused[i] = 1;
                                    end
                            end
                        else
                            begin
                                r_pifo_calendar_sub_top_info_is_not_paused[i] = 1;
                            end
                    end
            end 
        end
        
    for(i = 0;i<=GPFC_PAUSE_TC_NUM; i = i+1)
        begin: gen_2nd_array
            
            for(k = 0;k<=GPFC_PAUSE_TC_NUM; k=k+1)
                begin
                    // if the same item, just set the result as 1
                    if(i == k)
                        begin
                            assign w_pifo_calendar_top_compare[i][k] = 1;
                        end
                    // if not same, compare two elements,
                    else 
                        begin
                            // if i is not paused, and
                            // ( k is paused, or k is not paused, and i rank is small or equal than k)
                            
                            
                            //combination block for compare two elements
                            // support overflow bit, 
                            always@(*)
                                begin
                                    r_pifo_calendar_top_compare[i][k] = 0;
                                    
                                    // if the element at index i is not valid,
                                    // then set the compare result as 0;
                                    if(~w_pifo_calendar_sub_top_info_is_not_paused[i])
                                        begin
                                        end
                                    else
                                        begin
                                    
                                            if(~w_pifo_calendar_sub_top_info_is_not_paused[k])
                                                begin
                                                    r_pifo_calendar_top_compare[i][k] = 1;
                                                end
                                            else
                                                begin
                                                    if((w_pifo_calendar_sub_top_info_overflow[i] != w_r_global_pifo_info_overflow) 
                                                        & (w_pifo_calendar_sub_top_info_overflow[k] == w_r_global_pifo_info_overflow))
                                                        begin
                                                            r_pifo_calendar_top_compare[i][k] = 0;
                                                        end
                                                    
                                                    // if register pifo's overflow bit not equals to the global overflow bit,
                                                    // and the input pifo's overflow bit equals to the global overflow bit
                                                    // then return 1.                                
                                                    
                                                    else if((w_pifo_calendar_sub_top_info_overflow[i] == w_r_global_pifo_info_overflow) 
                                                            & (w_pifo_calendar_sub_top_info_overflow[k] != w_r_global_pifo_info_overflow))
                                                            begin
                                                                r_pifo_calendar_top_compare[i][k] = 1;
                                                            end
                                                    
                                                    // else, means input and register overflow bit is same,
                                                    // then, compare their rank value. 
                                                    else 
                                                        begin
                                                            // the input pifo is significant than register pifo
                                                            // only if the input rank is smaller than register rank
                                                            if(w_pifo_calendar_sub_top_info_rank[i] <= w_pifo_calendar_sub_top_info_rank[k])
                                                                begin
                                                                    r_pifo_calendar_top_compare[i][k] = 1;
                                                                end
                                                        end
                                                
                                                end
                                        end   
                                end
                                
                              assign w_pifo_calendar_top_compare[i][k] = r_pifo_calendar_top_compare[i][k];  
//                            assign w_pifo_calendar_top_compare[i][k] = 
//                            ( w_pifo_calendar_sub_top_info_is_not_paused[i] & 
//                            ( ~w_pifo_calendar_sub_top_info_is_not_paused[k] | 
//                            ( w_pifo_calendar_sub_top_info_is_not_paused[k] & 
//                            ( w_pifo_calendar_sub_top_info_rank[i] <= w_pifo_calendar_sub_top_info_rank[k])))
//                            );       
                        end
 
                end
        end 

endgenerate


//    // reverse the pause condition, for input data
//    // if the input is not valid, or
//    // the vector is 1 and the input gpfc rank is bigger or equal than pause rank.
    
//    assign w_in_pifo_info_is_not_paused = ~( ~w_in_pifo_info_valid | 
//           (s_axis_gpfc_pause_vector[w_in_pifo_info_gpfc_cos] 
//           & ~(w_in_pifo_info_gpfc_rank < w_gpfc_pause_rank[w_in_pifo_info_gpfc_cos])));

// combinational block for not pause signal for input data.
always @(*)
    begin
        r_pifo_calendar_sub_top_info_is_not_paused[GPFC_PAUSE_TC_NUM] = 0;
        
        // not paused logic. 
        // logic 
        // if the top is valid,
        // and if the pause vector is on and the top gpfc rank is smaller than pause rank
        // or if the pause vector is off 
        
        if(w_in_pifo_info_valid)
            begin
                if(s_axis_gpfc_pause_vector[w_in_pifo_info_gpfc_cos])
                    begin
                        if(w_in_pifo_info_gpfc_rank < w_gpfc_pause_rank[w_in_pifo_info_gpfc_cos])
                            begin
                                r_pifo_calendar_sub_top_info_is_not_paused[GPFC_PAUSE_TC_NUM] = 1;
                            end
                    end
                else
                    begin
                        r_pifo_calendar_sub_top_info_is_not_paused[GPFC_PAUSE_TC_NUM] = 1;
                    end
            end
    end 
assign w_pifo_calendar_sub_top_info_is_not_paused[GPFC_PAUSE_TC_NUM] = r_pifo_calendar_sub_top_info_is_not_paused[GPFC_PAUSE_TC_NUM];


integer z;
// combinational logic for select pop calendar,

always @(*)
    begin
        combi_pifo_calendar_sub_in_pop_en = {GPFC_PAUSE_TC_NUM{1'b0}};

        combi_pifo_calendar_sub_pop_element = 0;
        m_axis_dequeue_is_not_paused = 0; // 0 for paused, 1 for not paused,
        m_axis_is_bypass = 0;
        
        if(s_axis_pop_en)
            begin

                if(w_pifo_calendar_top_compare[0] == {(GPFC_PAUSE_TC_NUM+1){1'b1}})
                    begin
                        combi_pifo_calendar_sub_in_pop_en[0] = {1'b1};
                        
                        combi_pifo_calendar_sub_pop_element = w_pifo_calendar_sub_out_top_element[0];
                        m_axis_dequeue_is_not_paused = 1;
                    end
                else if(w_pifo_calendar_top_compare[1] == {(GPFC_PAUSE_TC_NUM+1){1'b1}})
                        begin
                            combi_pifo_calendar_sub_in_pop_en[1] = {1'b1};
                            combi_pifo_calendar_sub_pop_element = w_pifo_calendar_sub_out_top_element[1];
                            m_axis_dequeue_is_not_paused = 1;
                        end
                else if(w_pifo_calendar_top_compare[2] == {(GPFC_PAUSE_TC_NUM+1){1'b1}})
                        begin
                            combi_pifo_calendar_sub_in_pop_en[2] = {1'b1};
                            combi_pifo_calendar_sub_pop_element = w_pifo_calendar_sub_out_top_element[2];
                            m_axis_dequeue_is_not_paused = 1;
                        end
                else if(w_pifo_calendar_top_compare[3] == {(GPFC_PAUSE_TC_NUM+1){1'b1}})
                        begin
                            combi_pifo_calendar_sub_in_pop_en[3] = {1'b1};
                            combi_pifo_calendar_sub_pop_element = w_pifo_calendar_sub_out_top_element[3];
                            m_axis_dequeue_is_not_paused = 1;
                        end
                else if(w_pifo_calendar_top_compare[4] == {(GPFC_PAUSE_TC_NUM+1){1'b1}})
                        begin
                            combi_pifo_calendar_sub_in_pop_en[4] = {1'b1};
                            combi_pifo_calendar_sub_pop_element = w_pifo_calendar_sub_out_top_element[4];
                            m_axis_dequeue_is_not_paused = 1;
                        end
                else if(w_pifo_calendar_top_compare[5] == {(GPFC_PAUSE_TC_NUM+1){1'b1}})
                        begin
                            combi_pifo_calendar_sub_in_pop_en[5] = {1'b1};
                            combi_pifo_calendar_sub_pop_element = w_pifo_calendar_sub_out_top_element[5];
                            m_axis_dequeue_is_not_paused = 1;
                        end                
                else if(w_pifo_calendar_top_compare[6] == {(GPFC_PAUSE_TC_NUM+1){1'b1}})
                        begin
                            combi_pifo_calendar_sub_in_pop_en[6] = {1'b1};
                            combi_pifo_calendar_sub_pop_element = w_pifo_calendar_sub_out_top_element[6];
                            m_axis_dequeue_is_not_paused = 1;
                        end                
                else if(w_pifo_calendar_top_compare[7] == {(GPFC_PAUSE_TC_NUM+1){1'b1}})
                        begin
                            combi_pifo_calendar_sub_in_pop_en[7] = {1'b1};
                            combi_pifo_calendar_sub_pop_element = w_pifo_calendar_sub_out_top_element[7];
                            m_axis_dequeue_is_not_paused = 1;
                        end                
                else if(w_pifo_calendar_top_compare[8] == {(GPFC_PAUSE_TC_NUM+1){1'b1}} && s_axis_insert_en)
                        begin
                            combi_pifo_calendar_sub_in_pop_en[w_in_pifo_info_gpfc_cos] = {1'b1};
                            
                            
                            
                            // bypass condition 1/2
                            // if the new packet has higher priority than the head element at same cos queue,
                            // then set bypass as 1,
                            // or set not_paused as 1
                            
                            if(w_pifo_calendar_sub_top_info_is_bypass[w_in_pifo_info_gpfc_cos])
                                begin
                                    m_axis_is_bypass = 1;
                                end
                            else
                                begin
                                    combi_pifo_calendar_sub_in_pop_en[w_in_pifo_info_gpfc_cos] = {1'b1};
                                    combi_pifo_calendar_sub_pop_element = w_pifo_calendar_sub_out_top_element[w_in_pifo_info_gpfc_cos];
                                    m_axis_dequeue_is_not_paused = 1;
                                end
                        end 
                
                // bypass condition 2/2
                // if the input element gpfc rank is higher than the selected queue that has highest schedule rank,
                // set bypass as 1,
                // reset the dequeue result signal. 
                if(combi_pifo_calendar_sub_in_pop_en[w_in_pifo_info_gpfc_cos] & s_axis_insert_en)
                    begin
                        if(w_pifo_calendar_sub_top_info_is_bypass[w_in_pifo_info_gpfc_cos])
                            begin
                                m_axis_is_bypass = 1;
                                m_axis_dequeue_is_not_paused = 0;
                                combi_pifo_calendar_sub_pop_element = 0;
                            end
                    
                    end
            end
    end

// combinational logic for select insert calendar,
always @(*)
    begin
        combi_pifo_calendar_sub_in_insert_en = {GPFC_PAUSE_TC_NUM{1'b0}};
        
        // if insert
        if(s_axis_insert_en)
            begin
                combi_pifo_calendar_sub_in_insert_en[w_in_pifo_info_gpfc_cos] = 1;
            end
    end


always @(posedge clk)
    begin
        if(~rstn) // reset statement.
            begin
                r_last_dequeue_pifo <= 0;
                r_global_pifo_info <= 0;
            end
            
        else
            begin // update registers.
                r_last_dequeue_pifo <= m_axis_pifo_calendar_top;
                r_global_pifo_info <= m_axis_pifo_calendar_top;
            end
    end

assign m_axis_buffer_addr = combi_pifo_calendar_sub_pop_element[BUFFER_ADDR_WIDTH-1:0];
assign m_axis_pifo_calendar_top = combi_pifo_calendar_sub_pop_element;

assign m_axis_calendar_full = (r_pifo_element_count == PIFO_CALENDAR_SIZE - 2) ? 1 : 0;
//assign m_axis_calendar_count = r_pifo_element_count;
assign m_axis_valid = m_axis_dequeue_is_not_paused;
endmodule