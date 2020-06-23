`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2020 06:25:11 PM
// Design Name: 
// Module Name: gpfc_congestion_monitor
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: sub module for monitor the congestion, 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module gpfc_congestion_monitor
#(
    parameter QUEUE_OCCUPANCY_UNIT_WIDTH    = 12,
    parameter CONGESTION_STATE_WIDTH        = 2,
    parameter PAUSE_RANK_WIDTH              = 16,
    parameter PAUSE_TIME_WIDTH              = 16,
    parameter PAUSE_RANK_VALUE_ALL          = 0,
    parameter PAUSE_TIME_VALUE_DEFAULT      = 65535,
    parameter PORT_NUM                      = 5
        
    
)
(
    
    input [QUEUE_OCCUPANCY_UNIT_WIDTH-1:0] s_axis_queue_occupancy_port0,
    input [QUEUE_OCCUPANCY_UNIT_WIDTH-1:0] s_axis_queue_occupancy_port1,
    input [QUEUE_OCCUPANCY_UNIT_WIDTH-1:0] s_axis_queue_occupancy_port2,
    input [QUEUE_OCCUPANCY_UNIT_WIDTH-1:0] s_axis_queue_occupancy_port3,
    input [QUEUE_OCCUPANCY_UNIT_WIDTH-1:0] s_axis_queue_occupancy_port4,
    
    input [QUEUE_OCCUPANCY_UNIT_WIDTH-1:0] s_axis_xoff_low,
    input [QUEUE_OCCUPANCY_UNIT_WIDTH-1:0] s_axis_xon_low,
    input [QUEUE_OCCUPANCY_UNIT_WIDTH-1:0] s_axis_xoff_all,
    input [QUEUE_OCCUPANCY_UNIT_WIDTH-1:0] s_axis_xon_all,
    input [PAUSE_RANK_WIDTH-1:0]           s_axis_xoff_rank,
    
    output m_axis_valid, // true if data is updated,
    output [PAUSE_RANK_WIDTH-1:0]           m_axis_pause_rank,
    output [PAUSE_TIME_WIDTH-1:0]           m_axis_pause_time,    
    
    input clk,
    input rstn
    );
    
    
    localparam XON = 0;
    localparam XOFFLOW = 1;
    localparam XOFFALL = 2;

    // congestion state for each port,
    reg [CONGESTION_STATE_WIDTH-1:0] r_congestion_state[0:PORT_NUM-1], r_congestion_state_next[0:PORT_NUM-1];
    reg [CONGESTION_STATE_WIDTH-1:0] r_last_state_next;
    
    
    // combinational output for output signal,
    reg [PAUSE_RANK_WIDTH-1:0] r_pause_rank, r_pause_rank_next;
    reg [PAUSE_TIME_WIDTH-1:0] r_pause_time, r_pause_time_next;
    reg                         r_output_valid, r_output_valid_next;
    
    // wire for input value,
    
    wire [QUEUE_OCCUPANCY_UNIT_WIDTH-1:0] w_queue_occupancy[0:PORT_NUM];
    assign w_queue_occupancy[0] =  s_axis_queue_occupancy_port0;
    assign w_queue_occupancy[1] =  s_axis_queue_occupancy_port1;
    assign w_queue_occupancy[2] =  s_axis_queue_occupancy_port2;
    assign w_queue_occupancy[3] =  s_axis_queue_occupancy_port3;
    assign w_queue_occupancy[4] =  s_axis_queue_occupancy_port4;
    
    // parreral comparison at generate block.
    wire [PORT_NUM-1:0] w_qo_less_than_xon;
    wire [PORT_NUM-1:0] w_qo_less_than_xofflow;
    wire [PORT_NUM-1:0] w_qo_less_than_xonall;
    wire [PORT_NUM-1:0] w_qo_less_than_xoffall;

    genvar i;
    
    // generate block for calculate queue congestion state parrerally. 
    
    generate
        for(i=0;i<PORT_NUM;i=i+1)
            begin
                assign w_qo_less_than_xon[i] = w_queue_occupancy[i] < s_axis_xon_low;
                assign w_qo_less_than_xofflow[i] = w_queue_occupancy[i] < s_axis_xoff_low;
                assign w_qo_less_than_xonall[i] = w_queue_occupancy[i] < s_axis_xon_all;
                assign w_qo_less_than_xoffall[i] = w_queue_occupancy[i] < s_axis_xoff_all;
            end
            
        for(i=0;i<PORT_NUM;i=i+1)
            begin
                
                always @(*)
                    begin
                        
                        r_congestion_state_next[i] = r_congestion_state[i];
                        
                        // check next congestion state with fsm 
                    
                        case(r_congestion_state[i])
                            XON: 
                                begin
                                    // in XON state, check if the queue occupancy is larger than XOFF_LOW threshold,
                                    // then move to XOFFLOW state.
                                    if(~w_qo_less_than_xofflow[i])
                                        begin
                                            r_congestion_state_next[i] =  XOFFLOW;
                                        end
                                end
                            XOFFLOW:
                                begin
                                    // in XOFFLOW state, check if the queue occupancy is larger than XOFF_ALL threshold,
                                    // then move to XOFFALL state.
                                    // else if the queue occupancy is less than XON threshold,
                                    // then move tto XON state
                                   
                                    if(~w_qo_less_than_xoffall[i])
                                        begin
                                            r_congestion_state_next[i] =  XON;
                                        end
                                    else if(w_qo_less_than_xon[i])
                                        begin
                                            r_congestion_state_next[i] =  XOFFALL;
                                        end
                                end
                            XOFFALL:
                                begin
                                    // in XOFFALL state, check if the queue occupancy is smaller than xonall threshold,
                                    // and if smaller than xon, then move to XON state,
                                    // if not smaller than xon, then move to XOFFLOW state,
                                    
                                    if(w_qo_less_than_xonall[i])
                                        begin
                                            if(w_qo_less_than_xon[i])
                                                begin
                                                    r_congestion_state_next[i] =  XON;
                                                end
                                            else
                                                begin
                                                    r_congestion_state_next[i] =  XOFFLOW;
                                                end
                                        end
                                end
                        endcase
                    end
                    
                always @(posedge clk)
                    begin
                        
                        if(~rstn)
                            begin
                                r_congestion_state[i] <= XON;
                            end
                        else
                            begin
                                r_congestion_state[i] <= r_congestion_state_next[i];
                            end
                    end    
            end
        
    endgenerate
    
    integer j;
    always @(*)
        begin
            r_pause_rank_next = 0;
            r_pause_time_next = PAUSE_TIME_VALUE_DEFAULT;
            r_output_valid_next = 0;
            r_last_state_next = 0;
            
            
            
            for(j=0;j<PORT_NUM;j=j+1)
                begin
                    // check if the state is changed,
                    if(r_congestion_state_next[j] != r_congestion_state[j])
                        begin
                            
                            // congestion increased
                            if(r_congestion_state[i] == XON && r_congestion_state_next[i] == XOFFLOW && r_last_state_next < XOFFLOW)
                                begin
                                    r_output_valid_next = 1;
                                    r_pause_rank_next = s_axis_xoff_rank;    
                                end
                            if(r_congestion_state[i] == XOFFLOW && r_congestion_state_next[i] == XOFFALL && r_last_state_next < XOFFALL)
                                begin
                                    r_output_valid_next = 1;
                                    r_pause_time_next = 0;
                                    r_pause_rank_next = 0;  
                                end
                            
                            // congestion decreased
                            if(r_congestion_state[i] == XOFFALL && r_congestion_state_next[i] == XON && r_last_state_next == XON)
                                begin
                                    r_output_valid_next = 1;
                                    r_pause_time_next = 0;    
                                end
                            if(r_congestion_state[i] == XOFFALL & r_congestion_state_next[i] == XOFFLOW && r_last_state_next < XOFFLOW)
                                begin
                                    r_output_valid_next = 1;
                                    r_pause_rank_next = s_axis_xoff_rank;
                                end                                                            
                            if(r_congestion_state[i] == XOFFLOW & r_congestion_state_next[i] == XON && r_last_state_next == XON)
                                begin
                                    r_output_valid_next = 1;
                                    r_pause_time_next = 0;
                                    r_pause_rank_next = 0;    
                                end                                                                   
                        end
                end
        end
    
    
//    always @(posedge clk)
//        begin
//            if(~rstn)
//                begin
//                    for(j = 0; j< PORT_NUM;j=j+1)
//                        begin
//                            r_congestion_state[j] <= 0;
//                        end
//                end
//            else
//                begin
//                    for(j = 0; j< PORT_NUM;j=j+1)
//                        begin
//                            r_congestion_state[j] <= r_congestion_state_next[j];
//                        end
//                end
//        end
    

assign     m_axis_valid = r_output_valid_next;
assign     m_axis_pause_rank =  r_pause_rank_next;
assign     m_axis_pause_time =  r_pause_time_next;

    
endmodule
