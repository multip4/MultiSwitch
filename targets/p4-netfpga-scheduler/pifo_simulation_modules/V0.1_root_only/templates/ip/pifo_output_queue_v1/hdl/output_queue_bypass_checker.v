`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/12/2019 10:08:05 PM
// Design Name: 
// Module Name: output_queue_bypass_checker
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


module output_queue_bypass_checker
#(
parameter BUFFER_ADDR_WIDTH = 12,
parameter PIFO_RANK_WIDTH = 19,
parameter PIFO_ROOT_WIDTH = 32,
parameter ROOT_RANK_START_POS = 12,
parameter ROOT_RANK_END_POS = 30,
parameter ROOT_PIFO_INFO_VALID_POS = 31,
parameter OUTPUT_SYNC=1
)
(
    input [PIFO_ROOT_WIDTH-1:0]     s_axis_pifo_info,    
    input [PIFO_ROOT_WIDTH-1:0]     s_axis_pifo_calandar_top,
        
    output                          m_axis_bypass_en,
    
    input                           clk,
    input                           rstn

    );
    
reg                             r_bypass_en,r_bypass_en_next;

reg                             s_axis_pifo_valid;
reg [PIFO_RANK_WIDTH-1:0]       s_axis_pifo_rank;

reg                             s_axis_pifo_calendar_top_valid;
reg [PIFO_RANK_WIDTH-1:0]       s_axis_pifo_calendar_top_rank;


always @(*)
begin
    r_bypass_en_next = 0;
    s_axis_pifo_rank = s_axis_pifo_info[ROOT_RANK_END_POS:ROOT_RANK_START_POS];
    s_axis_pifo_calendar_top_rank = s_axis_pifo_calandar_top[ROOT_RANK_END_POS:ROOT_RANK_START_POS];
    
    case({s_axis_pifo_valid,s_axis_pifo_calendar_top_valid})
        
        2'b10: // the calendar top is not valid
            begin
                r_bypass_en_next = 1;
            end
        2'b11: // both s_axis_pifo_info and calendar top is valid
            begin
                if(s_axis_pifo_rank < s_axis_pifo_calendar_top_rank)
                    r_bypass_en_next = 1;
            end
    endcase
    
end

always @(posedge clk)
begin
    if(~rstn) // reset
        begin
            r_bypass_en <= 0;
        end
    else
        begin
            r_bypass_en <= r_bypass_en_next;
        end
end

assign m_axis_bypass_en = (OUTPUT_SYNC)? r_bypass_en : r_bypass_en_next;
endmodule
