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
parameter PIFO_RANK_WIDTH = 18,
parameter PIFO_ROOT_WIDTH = 32,
parameter ROOT_RANK_START_POS = 12,
parameter ROOT_RANK_END_POS = 29,
parameter PIFO_OVERFLOW_POS = 30,
parameter ROOT_PIFO_INFO_VALID_POS = 31,
parameter PAUSE_RANK_WIDTH = 17,
parameter OUTPUT_SYNC=1
)
(

    input                           s_axis_valid,
    input [PIFO_ROOT_WIDTH-1:0]     s_axis_pifo_info,    
    input [PIFO_ROOT_WIDTH-1:0]     s_axis_pifo_calandar_top,
    input                           s_axis_global_pifo_overflow,
    
    input                           s_axis_gpfc_valid,
    input [PIFO_RANK_WIDTH-1:0]     s_axis_gpfc_pause_rank,

    
    output reg                      m_axis_valid,    
    output                          m_axis_bypass_en,
    
    input                           clk,
    input                           rstn

    );
    
reg                             r_bypass_en,r_bypass_en_next;

reg                             s_axis_pifo_valid;
reg [PIFO_RANK_WIDTH-1:0]       s_axis_pifo_rank;

reg                             s_axis_pifo_calendar_top_valid;
reg [PIFO_RANK_WIDTH-1:0]       s_axis_pifo_calendar_top_rank;


wire  w_s_axis_pifo_info_valid;
wire  w_s_axis_pifo_info_overflow;
wire [PIFO_RANK_WIDTH - 1:0] w_s_axis_pifo_info_rank;
wire [BUFFER_ADDR_WIDTH - 1:0] w_s_axis_pifo_info_address; // unused
assign {w_s_axis_pifo_info_valid, w_s_axis_pifo_info_overflow, w_s_axis_pifo_info_rank, w_s_axis_pifo_info_address} = s_axis_pifo_info;

wire  w_s_axis_pifo_calandar_top_valid;
wire  w_s_axis_pifo_calandar_top_overflow;
wire [PIFO_RANK_WIDTH - 1:0] w_s_axis_pifo_calandar_top_rank;
wire [BUFFER_ADDR_WIDTH - 1:0] w_s_axis_pifo_calandar_top_address; // unused
assign {w_s_axis_pifo_calandar_top_valid, w_s_axis_pifo_calandar_top_overflow, w_s_axis_pifo_calandar_top_rank, w_s_axis_pifo_calandar_top_address} = s_axis_pifo_calandar_top;

always @(*)
begin
    r_bypass_en_next = 0;
    case({w_s_axis_pifo_info_valid,w_s_axis_pifo_calandar_top_valid})
        
        2'b10: // the calendar top is not valid
            begin
                r_bypass_en_next = 1;
            end
        2'b11: // both s_axis_pifo_info and calendar top is valid
            begin
                
                if(w_s_axis_pifo_info_overflow != w_s_axis_pifo_calandar_top_overflow)
                    begin
                        if(w_s_axis_pifo_info_overflow == s_axis_global_pifo_overflow)
                            r_bypass_en_next = 1;
                    end
                else
                    begin
                        if((w_s_axis_pifo_info_rank < w_s_axis_pifo_calandar_top_rank) & ~( s_axis_gpfc_valid & (s_axis_pifo_rank >= s_axis_gpfc_pause_rank)))
                            r_bypass_en_next = 1;                      

                    end
            end
    endcase
    
end

always @(posedge clk)
begin
    if(~rstn) // reset
        begin
            r_bypass_en <= 0;
            m_axis_valid <= 0;
        end
    else
        begin
            r_bypass_en <= r_bypass_en_next;
            m_axis_valid <= s_axis_valid;
        end
end

assign m_axis_bypass_en = (OUTPUT_SYNC)? r_bypass_en : r_bypass_en_next;
endmodule
