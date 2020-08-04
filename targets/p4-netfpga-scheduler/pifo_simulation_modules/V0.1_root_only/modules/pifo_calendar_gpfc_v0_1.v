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
// Revision 0.2 -- handle two sub atom list each for scheduling and gpfc.

// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// use pifo atom with overflow handling
module pifo_calendar_gpfc_multi_atom
 #(
    parameter PIFO_CALENDAR_SIZE = 512,
    parameter PIFO_CALENDAR_INDEX_WIDTH = 9,
    parameter BUFFER_ADDR_WIDTH = 12,
    
    parameter ELEMENT_WIDTH = 40,
    parameter ELEMENT_VALID_WIDTH = 1,
    parameter ELEMENT_OVERFLOW_WIDTH = 1,
    parameter ELEMENT_RANK_WIDTH = 17,
    parameter GPFC_COS_WIDTH = 3,
    parameter GPFC_RANK_WIDTH = 6,
    parameter PKT_ADDRESS_WIDTH = 12
    )
    (
        s_axis_pifo_info_root,
        s_axis_insert_en,
        s_axis_pop_en,
        
        s_axis_last_dequeue_pifo_info,
        
        m_axis_valid,
        m_axis_pifo_calendar_top,
        m_axis_buffer_addr, // pop result, buffer address    
        m_axis_calendar_full,
        m_axis_calendar_count,
        // add cpu i/o later.
        m_axis_is_bypass,
        // reset & clock
        rstn,
        clk
    );
    
    input [ELEMENT_WIDTH-1:0]                   s_axis_pifo_info_root;
    input                                       s_axis_insert_en;
    input                                       s_axis_pop_en;
    input [ELEMENT_WIDTH-1:0]                   s_axis_last_dequeue_pifo_info;
    
    output                                      m_axis_valid;
    output [BUFFER_ADDR_WIDTH-1:0]              m_axis_buffer_addr;
    output [ELEMENT_WIDTH-1:0]                  m_axis_pifo_calendar_top;
    output                                      m_axis_calendar_full;
    output  [PIFO_CALENDAR_INDEX_WIDTH-1:0]     m_axis_calendar_count;
    output                                      m_axis_is_bypass;

    input rstn;
    input clk;

    localparam SCHEDULE_ATOM_WIDTH = ELEMENT_VALID_WIDTH + ELEMENT_OVERFLOW_WIDTH + ELEMENT_RANK_WIDTH;
    localparam GPFC_ATOM_WIDTH = ELEMENT_VALID_WIDTH + GPFC_COS_WIDTH + GPFC_RANK_WIDTH + PKT_ADDRESS_WIDTH;

    wire w_ctl_insert,w_ctl_pop;
    
    wire [SCHEDULE_ATOM_WIDTH-1:0] w_pifo_atom_element_schedule[0:PIFO_CALENDAR_SIZE-1];
    wire [GPFC_ATOM_WIDTH-1:0] w_pifo_atom_element_gpfc[0:PIFO_CALENDAR_SIZE-1];
        
    wire [PIFO_CALENDAR_SIZE-1:0] w_pifo_atom_schedule_out_compare_result;    
    wire [PIFO_CALENDAR_SIZE-1:0] w_pifo_atom_gpfc_out_compare_result;
    
    reg  [PIFO_CALENDAR_INDEX_WIDTH-1:0] r_pifo_element_count;
    reg  [PIFO_CALENDAR_INDEX_WIDTH-1:0] r_pifo_element_count_next;
    
    reg                        r_m_axis_valid;
    
    
    wire [ELEMENT_VALID_WIDTH-1:0] w_r_global_pifo_info_valid;
    wire [ELEMENT_OVERFLOW_WIDTH-1:0] w_r_global_pifo_info_overflow;
    wire [ELEMENT_RANK_WIDTH-1:0] w_r_global_pifo_info_rank;
    wire [GPFC_COS_WIDTH-1:0] w_r_global_pifo_info_gpfc_cos;
    wire [GPFC_RANK_WIDTH-1:0] w_r_global_pifo_info_gpfc_rank;
    wire [PKT_ADDRESS_WIDTH-1:0] w_r_global_pifo_info_pkt_address;
    
            
    assign {w_r_global_pifo_info_valid, 
    w_r_global_pifo_info_overflow, 
    w_r_global_pifo_info_rank, 
    w_r_global_pifo_info_gpfc_cos,
    w_r_global_pifo_info_gpfc_rank,
    w_r_global_pifo_info_pkt_address    
    } = s_axis_last_dequeue_pifo_info;

    

    wire [ELEMENT_VALID_WIDTH-1:0]      w_in_pifo_info_valid;
    wire [ELEMENT_OVERFLOW_WIDTH-1:0]   w_in_pifo_info_overflow;
    wire [ELEMENT_RANK_WIDTH-1:0]       w_in_pifo_info_rank;
    wire [GPFC_COS_WIDTH-1:0]           w_in_pifo_info_gpfc_cos;
    wire [GPFC_RANK_WIDTH-1:0]          w_in_pifo_info_gpfc_rank;
    wire [PKT_ADDRESS_WIDTH-1:0]        w_in_pifo_info_pkt_address;
    
    assign {w_in_pifo_info_valid, 
    w_in_pifo_info_overflow, 
    w_in_pifo_info_rank, 
    w_in_pifo_info_gpfc_cos,
    w_in_pifo_info_gpfc_rank,
    w_in_pifo_info_pkt_address    
    } = s_axis_pifo_info_root;

     
    wire [SCHEDULE_ATOM_WIDTH-1:0] w_in_atom_schedule;
    wire [GPFC_ATOM_WIDTH-1:0] w_in_atom_gpfc;
    
    assign w_in_atom_schedule = {w_in_pifo_info_valid,w_in_pifo_info_overflow,w_in_pifo_info_rank};
    assign w_in_atom_gpfc = {w_in_pifo_info_valid,w_in_pifo_info_gpfc_cos,w_in_pifo_info_gpfc_rank,w_in_pifo_info_pkt_address};
    
    
    wire [ELEMENT_VALID_WIDTH-1:0]      w_out_pifo_info_valid;
    wire [ELEMENT_OVERFLOW_WIDTH-1:0]   w_out_pifo_info_overflow;
    wire [ELEMENT_RANK_WIDTH-1:0]       w_out_pifo_info_rank;
    wire [GPFC_COS_WIDTH-1:0]           w_out_pifo_info_gpfc_cos;
    wire [GPFC_RANK_WIDTH-1:0]          w_out_pifo_info_gpfc_rank;
    wire [PKT_ADDRESS_WIDTH-1:0]        w_out_pifo_info_pkt_address;
    

    wire [ELEMENT_VALID_WIDTH-1:0]      w_out_atom_gpfc_valid_temp;
    
    assign {w_out_pifo_info_valid,w_out_pifo_info_overflow,w_out_pifo_info_rank} = w_pifo_atom_element_schedule[0];
    assign {w_out_atom_gpfc_valid_temp,w_out_pifo_info_gpfc_cos,w_out_pifo_info_gpfc_rank,w_out_pifo_info_pkt_address} = w_pifo_atom_element_gpfc[0];
    
    
    assign m_axis_pifo_calendar_top = {w_out_pifo_info_valid,w_out_pifo_info_overflow,w_out_pifo_info_rank,
    w_out_pifo_info_gpfc_cos,w_out_pifo_info_gpfc_rank,w_out_pifo_info_pkt_address};
    
genvar i;
generate
    
    for(i=0; i < PIFO_CALENDAR_SIZE; i=i+1)    
        begin: generate_pifo_atom
            if(i == 0)
                begin
                    pifo_calendar_gpfc_atom_schedule
                    #(      
                            .ELEMENT_WIDTH(SCHEDULE_ATOM_WIDTH),        
                            .ELEMENT_VALID_WIDTH(ELEMENT_VALID_WIDTH), 
                            .ELEMENT_OVERFLOW_WIDTH(ELEMENT_OVERFLOW_WIDTH), 
                            .ELEMENT_RANK_WIDTH(ELEMENT_RANK_WIDTH)
                     )
                    atom_schedule
                    (
                        .in_pifo_input(w_in_atom_schedule),                       // input data
                        // set 0 for this field,
                        .in_pifo_neighbour_element_from_head_direction('b0),           // neighbour element data
                        // set next data for 
                        .in_pifo_neighbour_element_from_tail_direction(w_pifo_atom_element_schedule[i+1]),          // element data
                         
                        // always set 0 for this value.
                        .in_pifo_neighbour_insert_ready_from_head_direction('b0),
                        .in_pifo_neighbour_insert_ready_from_tail_direction(w_pifo_atom_schedule_out_compare_result[i+1]),                     
                        .in_ctl_insert(w_ctl_insert),
                        .in_ctl_pop(w_ctl_pop),
                        
                        .in_global_overflow_bit(w_r_global_pifo_info_overflow),
                        
                        // Output signal
                        .out_pifo_output(w_pifo_atom_element_schedule[i]),         // output self register value
                        .out_pifo_insert_ready(w_pifo_atom_schedule_out_compare_result[i]),  // output large compare value, used for insert. 1 for larger, 0 for small or equal.
                        
                        .clk(clk),
                        .rstn(rstn)  
                    );
                    pifo_calendar_gpfc_atom_gpfc
                    #(      
                            .ELEMENT_WIDTH(GPFC_ATOM_WIDTH),        
                            .ELEMENT_VALID_WIDTH(ELEMENT_VALID_WIDTH), 
                            .ELEMENT_RANK_WIDTH(GPFC_RANK_WIDTH),       
                            .PKT_ADDRESS_WIDTH(PKT_ADDRESS_WIDTH)  
                     )
                    atom_gpfc
                    (
                        .in_pifo_input(w_in_atom_gpfc),                       // input data
                        // set 0 for this field,
                        .in_pifo_neighbour_element_from_head_direction('b0),           // neighbour element data
                        // set next data for 
                        .in_pifo_neighbour_element_from_tail_direction(w_pifo_atom_element_gpfc[i+1]),          // element data
                         
                        // always set 0 for this value.
                        .in_pifo_neighbour_insert_ready_from_head_direction('b0),
                        .in_pifo_neighbour_insert_ready_from_tail_direction(w_pifo_atom_gpfc_out_compare_result[i+1]),                     
                        .in_ctl_insert(w_ctl_insert),
                        .in_ctl_pop(w_ctl_pop),
                        
                        .in_global_overflow_bit(w_r_global_pifo_info_overflow),
                        
                        // Output signal
                        .out_pifo_output(w_pifo_atom_element_gpfc[i]),         // output self register value
                        .out_pifo_insert_ready(w_pifo_atom_gpfc_out_compare_result[i]),  // output large compare value, used for insert. 1 for larger, 0 for small or equal.
                        
                        .clk(clk),
                        .rstn(rstn)  
                    );                    
                    
                end
            else if(i == PIFO_CALENDAR_SIZE-1)
                begin
                        
                    pifo_calendar_gpfc_atom_schedule
                        #(      
                                .ELEMENT_WIDTH(SCHEDULE_ATOM_WIDTH),        
                                .ELEMENT_VALID_WIDTH(ELEMENT_VALID_WIDTH), 
                                .ELEMENT_OVERFLOW_WIDTH(ELEMENT_OVERFLOW_WIDTH), 
                                .ELEMENT_RANK_WIDTH(ELEMENT_RANK_WIDTH)
                         )
                        atom_schedule
                        (
                            .in_pifo_input(w_in_atom_schedule),                       // input data
                            // set 0 for this field,
                            .in_pifo_neighbour_element_from_head_direction(w_pifo_atom_element_schedule[i-1]),           // neighbour element data
                            // set next data for 
                            .in_pifo_neighbour_element_from_tail_direction('b0),          // element data
                             
                            // always set 0 for this value.
                            .in_pifo_neighbour_insert_ready_from_head_direction(w_pifo_atom_schedule_out_compare_result[i-1]),
                            .in_pifo_neighbour_insert_ready_from_tail_direction('b1),                     
                            .in_ctl_insert(w_ctl_insert),
                            .in_ctl_pop(w_ctl_pop),
                            
                            .in_global_overflow_bit(w_r_global_pifo_info_overflow),
                            
                            // Output signal
                            .out_pifo_output(w_pifo_atom_element_schedule[i]),         // output self register value
                            .out_pifo_insert_ready(w_pifo_atom_schedule_out_compare_result[i]),  // output large compare value, used for insert. 1 for larger, 0 for small or equal.
                            
                            .clk(clk),
                            .rstn(rstn)  
                        );
                        pifo_calendar_gpfc_atom_gpfc
                        #(      
                                .ELEMENT_WIDTH(GPFC_ATOM_WIDTH),        
                                .ELEMENT_VALID_WIDTH(ELEMENT_VALID_WIDTH), 
                                .ELEMENT_RANK_WIDTH(GPFC_RANK_WIDTH),       
                                .PKT_ADDRESS_WIDTH(PKT_ADDRESS_WIDTH)  
                         )
                        atom_gpfc
                        (
                            .in_pifo_input(w_in_atom_gpfc),                       // input data
                            // set 0 for this field,
                            .in_pifo_neighbour_element_from_head_direction(w_pifo_atom_element_gpfc[i-1]),           // neighbour element data
                            // set next data for 
                            .in_pifo_neighbour_element_from_tail_direction('b0),          // element data
                             
                            // always set 0 for this value.
                            .in_pifo_neighbour_insert_ready_from_head_direction(w_pifo_atom_gpfc_out_compare_result[i-1]),
                            .in_pifo_neighbour_insert_ready_from_tail_direction('b1),                     
                            .in_ctl_insert(w_ctl_insert),
                            .in_ctl_pop(w_ctl_pop),
                            
                            .in_global_overflow_bit(w_r_global_pifo_info_overflow),
                            
                            // Output signal
                            .out_pifo_output(w_pifo_atom_element_gpfc[i]),         // output self register value
                            .out_pifo_insert_ready(w_pifo_atom_gpfc_out_compare_result[i]),  // output large compare value, used for insert. 1 for larger, 0 for small or equal.
                            
                            .clk(clk),
                            .rstn(rstn)  
                        );                               
                        
                end   
            else
                begin
                    
                    pifo_calendar_gpfc_atom_schedule
                           #(      
                                   .ELEMENT_WIDTH(SCHEDULE_ATOM_WIDTH),        
                                   .ELEMENT_VALID_WIDTH(ELEMENT_VALID_WIDTH), 
                                   .ELEMENT_OVERFLOW_WIDTH(ELEMENT_OVERFLOW_WIDTH), 
                                   .ELEMENT_RANK_WIDTH(ELEMENT_RANK_WIDTH)
                            )
                           atom_schedule
                           (
                               .in_pifo_input(w_in_atom_schedule),                       // input data
                               // set 0 for this field,
                               .in_pifo_neighbour_element_from_head_direction(w_pifo_atom_element_schedule[i-1]),           // neighbour element data
                               // set next data for 
                               .in_pifo_neighbour_element_from_tail_direction(w_pifo_atom_element_schedule[i+1]),          // element data
                                
                               // always set 0 for this value.
                               .in_pifo_neighbour_insert_ready_from_head_direction(w_pifo_atom_schedule_out_compare_result[i-1]),
                               .in_pifo_neighbour_insert_ready_from_tail_direction(w_pifo_atom_schedule_out_compare_result[i+1]),                     
                               .in_ctl_insert(w_ctl_insert),
                               .in_ctl_pop(w_ctl_pop),
                               
                               .in_global_overflow_bit(w_r_global_pifo_info_overflow),
                               
                               // Output signal
                               .out_pifo_output(w_pifo_atom_element_schedule[i]),         // output self register value
                               .out_pifo_insert_ready(w_pifo_atom_schedule_out_compare_result[i]),  // output large compare value, used for insert. 1 for larger, 0 for small or equal.
                               
                               .clk(clk),
                               .rstn(rstn)  
                           );
                           pifo_calendar_gpfc_atom_gpfc
                           #(      
                                   .ELEMENT_WIDTH(GPFC_ATOM_WIDTH),        
                                   .ELEMENT_VALID_WIDTH(ELEMENT_VALID_WIDTH), 
                                   .ELEMENT_RANK_WIDTH(GPFC_RANK_WIDTH),       
                                   .PKT_ADDRESS_WIDTH(PKT_ADDRESS_WIDTH)  
                            )
                           atom_gpfc
                           (
                               .in_pifo_input(w_in_atom_gpfc),                       // input data
                               // set 0 for this field,
                               .in_pifo_neighbour_element_from_head_direction(w_pifo_atom_element_gpfc[i-1]),           // neighbour element data
                               // set next data for 
                               .in_pifo_neighbour_element_from_tail_direction(w_pifo_atom_element_gpfc[i+1]),          // element data
                                
                               // always set 0 for this value.
                               .in_pifo_neighbour_insert_ready_from_head_direction(w_pifo_atom_gpfc_out_compare_result[i-1]),
                               .in_pifo_neighbour_insert_ready_from_tail_direction(w_pifo_atom_gpfc_out_compare_result[i+1]),                     
                               .in_ctl_insert(w_ctl_insert),
                               .in_ctl_pop(w_ctl_pop),
                               
                               .in_global_overflow_bit(w_r_global_pifo_info_overflow),
                               
                               // Output signal
                               .out_pifo_output(w_pifo_atom_element_gpfc[i]),         // output self register value
                               .out_pifo_insert_ready(w_pifo_atom_gpfc_out_compare_result[i]),  // output large compare value, used for insert. 1 for larger, 0 for small or equal.
                               
                               .clk(clk),
                               .rstn(rstn)  
                           );                    
                    
                    
                end 
        end

endgenerate


// add priority encoder

//priority_encoder_jkchoi
//#(
//.DATA_WIDTH(PIFO_CALENDAR_SIZE)
//)
//priority_encoder
//(
//    in_data(w_pifo_atom_out_not_paused), 
//    out_data(w_priority_encoder_decode),
//    out_valid(w_priority_encoder_decode_valid)
    
//);

always @(*)
    begin
        r_pifo_element_count_next = r_pifo_element_count;
//        r_global_pifo_info_next = r_global_pifo_info;
        
//        // if the pop is called.
//        // update global_pifo_info
//        if(w_ctl_pop)
//            begin
//                r_global_pifo_info_next = m_axis_pifo_calendar_top;
//            end
        
        case({w_ctl_insert,w_ctl_pop})
            2'b01:
                r_pifo_element_count_next = r_pifo_element_count -1;
            2'b10:
                r_pifo_element_count_next = r_pifo_element_count +1;
        endcase    
        
    end


always @(posedge clk)
    begin
        if(~rstn) // reset statement.
            begin
                r_pifo_element_count <= 0;
//                r_global_pifo_info <= 0;
                r_m_axis_valid <= 0;
            end
            
        else
            begin // update registers.
                r_pifo_element_count <= r_pifo_element_count_next;
//                r_global_pifo_info <= r_global_pifo_info_next;
                r_m_axis_valid <= s_axis_pop_en;
            end
    end


assign m_axis_is_bypass = w_pifo_atom_gpfc_out_compare_result[0];
assign m_axis_buffer_addr = w_pifo_atom_element_gpfc[0][BUFFER_ADDR_WIDTH-1:0];
assign w_ctl_insert = s_axis_insert_en;
assign w_ctl_pop = s_axis_pop_en;

assign m_axis_calendar_full = (r_pifo_element_count == PIFO_CALENDAR_SIZE - 2) ? 1 : 0;
assign m_axis_calendar_count = r_pifo_element_count;
assign m_axis_valid = r_m_axis_valid;
endmodule