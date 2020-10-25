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
// Revision 0.2 - add cpu support
// Revision 0.3 - move cpu write to parent model to reduce resource usage.
// Revision 0.4 - add overflow bit support
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

// version 0.4 add overflow bit support.
// write cpu value if and only if there are no pifo insertion from dataplane
// pifo_info[32]
// -- valid [31]
// -- overflow [30]
// -- rank [29-12]
// -- address [11-0]


module pifo_calendar_atom_v0_4
     #(
       parameter ELEMENT_WIDTH = 32,  // 30 for root element
       parameter ELEMENT_RANK_WIDTH = 18,
       parameter RANK_START_POS = 12,
       parameter RANK_END_POS = 29,
       parameter PIFO_INFO_VALID_POS = 31,
       parameter PIFO_INFO_OVERFLOW_POS = 30,
       parameter PIFO_INFO_ADDRESS_WIDTH = 12
   )
   (
       
       // Input Signal.
       in_pifo_input,          // input data
       in_pifo_neighbour_element_from_head_direction,           // neighbour element data
       in_pifo_neighbour_element_from_tail_direction,          // element data
       
       in_pifo_neighbour_compare_large_from_head_direction,
       in_pifo_neighbour_compare_large_from_tail_direction,
       
       in_global_overflow_bit, // recent dequeued packet's overflow bit.
       
       
       in_ctl_insert,
       in_ctl_pop,
       
       // Output signal
       out_pifo_output,         // output self register value
//        m_axis_pifo_compare_equal,  // output equal compare value. used for pop      1 for equal, 0 for not equal. not used in root atom
       

       // output large compare value, used for insert. 
       // 1 for larger(input pifo is more significant), 0 for small or equal.
       out_pifo_compare_large,  

       clk,
       rstn  
   );
   
       input [ELEMENT_WIDTH-1:0]   in_pifo_input;
       input [ELEMENT_WIDTH-1:0]   in_pifo_neighbour_element_from_head_direction;
       input [ELEMENT_WIDTH-1:0]   in_pifo_neighbour_element_from_tail_direction;
       input                       in_pifo_neighbour_compare_large_from_head_direction;
       input                       in_pifo_neighbour_compare_large_from_tail_direction;
       input                       in_global_overflow_bit;
       input                       in_ctl_insert;
       input                       in_ctl_pop;
       
       output [ELEMENT_WIDTH-1:0]  out_pifo_output;
       output                      out_pifo_compare_large;
       

       input clk;
       input rstn;
                               
       reg [ELEMENT_WIDTH-1:0] r_pifo_element;      // register 
       reg [ELEMENT_WIDTH-1:0] r_pifo_element_next; // combinational logic for update register
       
       wire                                     w_reg_pifo_valid;
       wire                                     w_reg_pifo_overflow;
       wire [ELEMENT_RANK_WIDTH-1:0]            w_reg_pifo_rank;
       wire [PIFO_INFO_ADDRESS_WIDTH-1:0]       w_reg_pifo_address;

       assign {w_reg_pifo_valid,w_reg_pifo_overflow,w_reg_pifo_rank,w_reg_pifo_address} =  r_pifo_element;     

       wire                                     w_s_axis_input_valid;
       wire                                     w_s_axis_input_overflow;
       wire [ELEMENT_RANK_WIDTH-1:0]            w_s_axis_input_rank;
       wire [PIFO_INFO_ADDRESS_WIDTH-1:0]       w_s_axis_input_address;
       
       assign {w_s_axis_input_valid, w_s_axis_input_overflow, w_s_axis_input_rank, w_s_axis_input_address} = in_pifo_input;
       
       reg                                      combi_rank_compare_large;

       
       always @(*)
           begin
               // set init value.
               r_pifo_element_next = r_pifo_element;
               combi_rank_compare_large = 0;
               
               // compare the input and register value.
               
               // if input pifo is not valid then return 0 to indicate 
               // the input pifo is not more significant than the register pifo
               if(~w_s_axis_input_valid)
                    begin
                        combi_rank_compare_large = 0;
                    end
               else
                    begin
                        // if register pifo is not valid then return 1 to indicate
                        if(~w_reg_pifo_valid)
                            begin
                                combi_rank_compare_large = 1;
                            end
                        
                        // in following condition means both input pifo and register pifo is valid.
                        else
                            begin
                                // if register pifo's overflow bit equals to the global overflow bit,
                                // and the input pifo's overflow bit not equals to the global overflow bit
                                // then return 0.
                                
                                if((w_s_axis_input_overflow != in_global_overflow_bit) 
                                    & (w_reg_pifo_overflow == in_global_overflow_bit))
                                    begin
                                        combi_rank_compare_large = 0;
                                    end
                                
                                // if register pifo's overflow bit not equals to the global overflow bit,
                                // and the input pifo's overflow bit equals to the global overflow bit
                                // then return 1.                                
                                
                                else if((w_s_axis_input_overflow == in_global_overflow_bit) 
                                        & (w_reg_pifo_overflow != in_global_overflow_bit))
                                        begin
                                            combi_rank_compare_large = 1;
                                        end
                                
                                // else, means input and register overflow bit is same,
                                // then, compare their rank value. 
                                else 
                                    begin
                                        // the input pifo is significant than register pifo
                                        // only if the input rank is smaller than register rank
                                        if(w_s_axis_input_rank < w_reg_pifo_rank)
                                            begin
                                                combi_rank_compare_large = 1;
                                            end
                                    end
                                
                            end
                    end

               // three conditions for register update
               
               // if both insert and pop
               // check self and tail side compare result,
               //  
               if(in_ctl_insert & in_ctl_pop)
                   begin
                       case({w_s_axis_input_valid, combi_rank_compare_large, in_pifo_neighbour_compare_large_from_tail_direction})
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
                       case({w_s_axis_input_valid,combi_rank_compare_large,in_pifo_neighbour_compare_large_from_head_direction})

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
       

       assign out_pifo_compare_large = combi_rank_compare_large;
       assign out_pifo_output = r_pifo_element;
       
endmodule
