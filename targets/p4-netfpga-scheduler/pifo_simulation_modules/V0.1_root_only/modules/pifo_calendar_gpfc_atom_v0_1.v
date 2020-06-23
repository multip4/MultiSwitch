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
// Revision 0.01 - File Created from pifo_calendar_atom_v0_4.v
// Revision 0.1 - add gpfc feature 

// pifo_info total 40 bit

// -- valid 1bit      [39]
// -- overflow 1bit   [38]
// -- pifo_rank 17bit [37-21]
// -- gpfc_cos  3bit  [20-18]
// -- gpfc_rank 6bit  [17-12]
// -- address - 12bit [11-0]

// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



module pifo_calendar_gpfc_atom
     #(
       parameter ELEMENT_WIDTH = 40,
       parameter ELEMENT_VALID_WIDTH = 1,
       parameter ELEMENT_OVERFLOW_WIDTH = 1,
       parameter ELEMENT_RANK_WIDTH = 17,
       parameter GPFC_COS_WIDTH = 3,
       parameter GPFC_RANK_WIDTH = 6,
       parameter PKT_ADDRESS_WIDTH = 12
   )
   (
       
       // Input Signal.
       in_pifo_input,          // input data
       in_pifo_neighbour_element_from_head_direction,           // neighbour element data
       in_pifo_neighbour_element_from_tail_direction,          // element data
       
       in_pifo_neighbour_compare_more_significant_from_head_direction,    // the input is more significant than target node.
       in_pifo_neighbour_compare_more_significant_from_tail_direction,
       
       in_global_overflow_bit, // recent dequeued packet's overflow bit.
       
       
       in_ctl_insert,
       in_ctl_pop,
       
       // Output signal
       out_pifo_output,         // output self register value
//        m_axis_pifo_compare_equal,  // output equal compare value. used for pop      1 for equal, 0 for not equal. not used in root atom
       

       // output large compare value, used for insert. 
       // 1 for larger(input pifo is more significant), 0 for small or equal.
       out_pifo_compare_more_significant,  

       clk,
       rstn  
   );
   
       input [ELEMENT_WIDTH-1:0]   in_pifo_input;
       input [ELEMENT_WIDTH-1:0]   in_pifo_neighbour_element_from_head_direction;
       input [ELEMENT_WIDTH-1:0]   in_pifo_neighbour_element_from_tail_direction;
       input                       in_pifo_neighbour_compare_more_significant_from_head_direction;
       input                       in_pifo_neighbour_compare_more_significant_from_tail_direction;
       input                       in_global_overflow_bit;
       
       input                       in_ctl_insert;
       input                       in_ctl_pop;
       
       output [ELEMENT_WIDTH-1:0]  out_pifo_output;
       output                      out_pifo_compare_more_significant;
       

       input clk;
       input rstn;
                               


       reg [ELEMENT_WIDTH-1:0] r_element;      // register value  
       reg [ELEMENT_WIDTH-1:0] r_element_next; // combinational logic for update register
       assign out_pifo_output = r_element;

        // combinational result, 1 for input is more significant than register elelement,
        //                       0 for input is not significant.
        // in simple word, 1 for can insert the input data in this atom, 0 for not.
        
       reg                                      combi_rank_compare_more_significant; 
       assign out_pifo_compare_more_significant = combi_rank_compare_more_significant;

       // split input data into each wire
       
       wire [ELEMENT_VALID_WIDTH-1:0] w_in_valid;
       wire [ELEMENT_OVERFLOW_WIDTH-1:0] w_in_overflow;
       wire [ELEMENT_RANK_WIDTH-1:0] w_in_pifo_rank;
       wire [GPFC_COS_WIDTH-1:0] w_in_gpfc_cos;
       wire [GPFC_RANK_WIDTH-1:0] w_in_gpfc_rank;
       wire [PKT_ADDRESS_WIDTH-1:0] w_in_pkt_address;
       
       // parsing(assign) input data
       
       assign {w_in_valid,w_in_overflow,w_in_pifo_rank,w_in_gpfc_cos,w_in_gpfc_rank,w_in_pkt_address} = in_pifo_input;
       

       wire [ELEMENT_VALID_WIDTH-1:0] w_r_this_valid;
       wire [ELEMENT_OVERFLOW_WIDTH-1:0] w_r_this_overflow;
       wire [ELEMENT_RANK_WIDTH-1:0] w_r_this_rank;
       wire [GPFC_COS_WIDTH-1:0] w_r_this_gpfc_cos;
       wire [GPFC_RANK_WIDTH-1:0] w_r_this_gpfc_rank;
       wire [PKT_ADDRESS_WIDTH-1:0] w_r_this_pkt_address;
       
       
       assign {w_r_this_valid,w_r_this_overflow,w_r_this_rank,w_r_this_gpfc_cos,w_r_this_gpfc_rank,w_r_this_pkt_address} = r_element;

       //combinational block for comparison     
       always @(*)
           begin
               // set init value.

               combi_rank_compare_more_significant = 0;
               
               // compare the input and register value.
               
               // if input pifo is not valid then return 0 to indicate 
               // the input pifo is not more significant than the register pifo
               if(~w_in_valid)
                    begin
                        combi_rank_compare_more_significant = 0;
                    end
               else
                    begin
                        // if register pifo is not valid then return 1 to indicate
                        // the input is more signifiant.
                        if(~w_r_this_valid)
                            begin
                                combi_rank_compare_more_significant = 1;
                            end
                        
                        // in following condition means both input pifo and register pifo is valid.
                        else
                            begin
                                // first, check overflow bit,
                                
                                // check condition 1,
                                
                                // if register pifo's overflow bit equals to the global overflow bit,
                                // and the input pifo's overflow bit not equals to the global overflow bit
                                // then return 0.
                                
                                if((w_in_overflow != in_global_overflow_bit) 
                                    & (w_r_this_overflow == in_global_overflow_bit))
                                    begin
                                        combi_rank_compare_more_significant = 0;
                                    end
                                
                                // if register pifo's overflow bit not equals to the global overflow bit,
                                // and the input pifo's overflow bit equals to the global overflow bit
                                // then return 1.                                
                                
                                else if((w_in_overflow == in_global_overflow_bit) 
                                        & (w_r_this_overflow != in_global_overflow_bit))
                                        begin
                                            combi_rank_compare_more_significant = 1;
                                        end
                                
                                // else, means input and register overflow bit is same,
                                // then, compare their rank value. 
                                else 
                                    begin
                                        // the input pifo is significant than register pifo
                                        // only if the input rank is smaller than register rank
                                        if(w_in_pifo_rank < w_r_this_rank)
                                            begin
                                                combi_rank_compare_more_significant = 1;
                                            end
                                    end
                            end
                    end
              end
        
        
        //combinational block for register update     
        always@(*)
            begin
                // init parameter 
               r_element_next = r_element;
               
               // three conditions for register update
               // if both insert and pop
               // check self and tail side compare result,
               // if self is 0, tail is 1, then update self register as input value,
               // if self is 0, tail is 1, then shift the tail element value to self,
               // if self is 1, tail is 1, then means shift and tail happend at head location,
               // then, not update.
               if(in_ctl_insert & in_ctl_pop)
                   begin
                       case({combi_rank_compare_more_significant, in_pifo_neighbour_compare_more_significant_from_tail_direction})
                           'b01: // load new input item 
                               r_element_next = in_pifo_input;
                           'b00: // shift to head direction, update with tail element,
                               r_element_next = in_pifo_neighbour_element_from_tail_direction;
                            
                            // if the result is 11,
                            // no update. 
                       endcase
                   end
               // insert only
               // check self and head side compare result.
               // if self is 0, head is 0, no update,
               // if self is 1, head is 0, update self as input value,
               // if self is 1, head is 1, means insert happend at front, shift the head element to self.
               
               else if (in_ctl_insert & ~in_ctl_pop)
                   begin
                       case({combi_rank_compare_more_significant,in_pifo_neighbour_compare_more_significant_from_head_direction})

                           'b10: // load new input item 
                               r_element_next = in_pifo_input;

                           'b11: // load head element
                               r_element_next = in_pifo_neighbour_element_from_head_direction;
                       endcase
                   end
               // pop only
               // shift to head.    
               else if(~in_ctl_insert & in_ctl_pop)
                   begin 
                       //shift to head.
                       r_element_next = in_pifo_neighbour_element_from_tail_direction;
                   end
           end
           
       always @(posedge clk)
           begin
               if(~rstn)
                   begin
                       r_element <= 0;
                   end
               else
                   begin
                       r_element <= r_element_next;
                   end
           end

endmodule
