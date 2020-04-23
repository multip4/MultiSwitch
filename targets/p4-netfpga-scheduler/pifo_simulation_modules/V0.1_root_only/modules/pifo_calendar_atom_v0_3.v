`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/14/2019 11:07:08 AM
// Design Name: 
// Module Name: pifo_calendar_atom_v0_2
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

// version 0.3 move cpu write to parent model to reduce resource usage.
// write cpu value if and only if there are no pifo insertion from dataplane
module pifo_calendar_atom_v0_3
     #(
       parameter ELEMENT_WIDTH = 32,  // 30 for root element
       parameter ELEMENT_RANK_WIDTH = 19,
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
       in_pifo_neighbour_compare_large_from_tail_direction,
       
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
       input                       in_pifo_neighbour_compare_large_from_tail_direction;
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
       wire                          in_pifo_valid;

      
       
       always @(*)
           begin
               // set init value.
               r_pifo_element_next = r_pifo_element;
               
               // three conditions
               // if both insert and pop
               // check self and tail side compare result,
               //  
               if(in_ctl_insert & in_ctl_pop)
                   begin
                       case({in_pifo_valid, rank_compare_final, in_pifo_neighbour_compare_large_from_tail_direction})
                           'b101: // load new input item 
                               r_pifo_element_next = in_pifo_input;
                           'b100: // shift to head direction, update to tail element,
                               r_pifo_element_next = in_pifo_neighbour_element_from_tail_direction;
                       endcase
                   end
               // insert only
               // check self and head side compare result.    
               else if (in_ctl_insert & ~in_ctl_pop)
                   begin
                       case({in_pifo_valid,rank_compare_final,in_pifo_neighbour_compare_large_from_head_direction})

                           'b110: // load new input item 
                               r_pifo_element_next = in_pifo_input;

                           'b111: // load head element
                               r_pifo_element_next = in_pifo_neighbour_element_from_head_direction;
                       endcase
                   end
               // pop only    
               else if(~in_ctl_insert & in_ctl_pop)
                   begin 
                       //shift to head.
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
       
       // return 1 if and only if the element is larger than input value.
       assign rank_compare_large = (w_s_axis_input_rank < w_element_rank) ? 1 : 0 ;
       // rank compare final -> set 1 if the current element is not valid(valid bit is 0).
       assign rank_compare_final = ~r_pifo_element[PIFO_INFO_VALID_POS] | rank_compare_large;
       
       //out signal.
       assign out_pifo_compare_large = rank_compare_final;
       assign out_pifo_output = r_pifo_element;
       assign in_pifo_valid = in_pifo_input[ELEMENT_WIDTH-1];
       
endmodule
