`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/04/2019 10:50:43 AM
// Design Name: 
// Module Name: pifo_calendar_atom_v0_1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// The pifo calendar atom is sub unit of pifo calender,
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


/*
pifo calendar element structure:

element {
    valid:          1bit,
    rank:           19bit,
    buffer_addr:    12bit
}

*/
module pifo_calendar_atom_v0_1
    #(
        parameter ELEMENT_WIDTH = 32,  // 30 for root element
        parameter ELEMENT_RANK_WIDTH = 19,
        parameter ELEMENT_BUFFER_ADDR_WIDTH = 12,
        parameter RANK_START_POS = 12,
        parameter RANK_END_POS = 30,
        parameter PIFO_INFO_VALID_POS = 31
    )
    (
        
        // Input Signal.
        in_pifo_input,          // input data
        in_pifo_neighbour_element_from_head_direction,           // neighbour element data
        in_pifo_neighbour_element_from_tail_direction,          // element data
        
        in_pifo_neighbour_compare_large_from_head_direction,
        
        in_ctl_insert,
        in_ctl_pop,
        
        // Output signal
        out_pifo_output,         // output self register value
//        m_axis_pifo_compare_equal,  // output equal compare value. used for pop      1 for equal, 0 for not equal. not used in root atom
        out_pifo_compare_large,  // output large compare value, used for insert. 1 for larger, 0 for small or equal.
        
        clk,
        rstn  
    );
    
        input [ELEMENT_WIDTH-1:0]   in_pifo_input;
        input [ELEMENT_WIDTH-1:0]   in_pifo_neighbour_element_from_head_direction;
        input [ELEMENT_WIDTH-1:0]   in_pifo_neighbour_element_from_tail_direction;
        input                       in_pifo_neighbour_compare_large_from_head_direction;
        input                       in_ctl_insert;
        input                       in_ctl_pop;
        
        output [ELEMENT_WIDTH-1:0]  out_pifo_output;
        output                      out_pifo_compare_large;
        
        input clk;
        input rstn;
                                
        reg [ELEMENT_WIDTH-1:0] r_pifo_element;      // register 
        reg [ELEMENT_WIDTH-1:0] r_pifo_element_next; // combinational logic for update register
                
        wire [ELEMENT_RANK_WIDTH-1:0] w_s_axis_input_rank;
        wire [ELEMENT_RANK_WIDTH-1:0] w_element_rank;
        wire                          rank_compare_large;
        wire                          rank_compare_final;
        
        
        wire                          is_shift_to_tail;
        wire                          is_shift_to_head;
        wire                          is_update_value;
        
        always @(*)
            begin
                // set init value.
                r_pifo_element_next = r_pifo_element;
                
                // if the update signal is 1, then just update the register
                if(is_update_value) r_pifo_element_next = in_pifo_input; 
                // else check wheter shift left or right
                else
                    begin
                        // if shift to head only
                        if(is_shift_to_head & ~is_shift_to_tail) 
                            r_pifo_element_next = in_pifo_neighbour_element_from_head_direction;
                        // if shift to tail only
                        else if(~is_shift_to_head & is_shift_to_tail)
                            r_pifo_element_next = in_pifo_neighbour_element_from_tail_direction;
                    end 
            end
            
        always @(posedge clk)
            begin
                if(~rstn)
                    begin
                        r_pifo_element <= 0;
                    end
                else
                    begin
                        r_pifo_element <= r_pifo_element_next;
                    end
            end
        
        // renaming the value field.
        assign w_s_axis_input_rank = in_pifo_input[RANK_END_POS:RANK_START_POS];
        assign w_element_rank = r_pifo_element[RANK_END_POS:RANK_START_POS];
        
        // return 1 if and only if the input value is larger than element.
        assign rank_compare_large = (w_s_axis_input_rank > w_element_rank) ? 1 : 0 ;
        // rank compare final -> set 1 if the current element is not valid(valid bit is 0).
        assign rank_compare_final = ~r_pifo_element[PIFO_INFO_VALID_POS] | rank_compare_large;
        assign is_shift_to_head = in_ctl_pop;
        assign is_shift_to_tail = ({in_ctl_insert,rank_compare_final,in_pifo_neighbour_compare_large_from_head_direction} == 'b111) ? 1:0;
        assign is_update_value = ({in_ctl_insert,rank_compare_final,in_pifo_neighbour_compare_large_from_head_direction} == 'b110) ? 1:0;
                
        //out signal.
        assign out_pifo_compare_large = rank_compare_final;
        assign out_pifo_output = r_pifo_element;
        
endmodule
