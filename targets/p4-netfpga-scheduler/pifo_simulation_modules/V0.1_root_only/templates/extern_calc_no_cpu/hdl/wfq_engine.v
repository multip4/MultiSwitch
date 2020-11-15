/*
 * File: wfq_engine.v
 * Author: Zhenguo Cui
 * 
 * wfq Calc Module
 */



`timescale 1 ps / 1 ps
module wfq_engine
#(
  parameter CLASS_WIDTH = 5,
  parameter WEIGHT_WIDTH = 16,
  parameter PKT_WIDTH = 16,
  parameter RESULT_WIDTH = 32, 
  parameter PIFO_OVERFLOW_WIDTH = 1,
  parameter PIFO_ROUND_WIDTH = 18,
  parameter PIFO_ADDR_WIDTH = 12,
  parameter PIFO_WIDTH = 32
)
(
  input                                     req_valid,
  input     [CLASS_WIDTH-1:0]               req_class_id,
  input     [WEIGHT_WIDTH-1:0]              req_div_quotient,
  input     [WEIGHT_WIDTH-1:0]              req_div_remain,


  input                                     last_pifo_valid,
  input     [PIFO_OVERFLOW_WIDTH-1:0]       last_pifo_overflow,
  input     [PIFO_ROUND_WIDTH-1:0]           last_pifo_round,
  output                                    resp_valid,
  output    [RESULT_WIDTH-1:0]              resp_data,

  input                                     clk,
  input                                     rstn
);

localparam CLASS_ID_COUNT = 2**CLASS_WIDTH;
localparam ROUND_MAX = 2**PIFO_ROUND_WIDTH-1;


reg [PIFO_OVERFLOW_WIDTH-1:0]	r_overflow[0:CLASS_ID_COUNT-1], r_overflow_next[0:CLASS_ID_COUNT-1];
reg [PIFO_ROUND_WIDTH-1:0]		r_round[0:CLASS_ID_COUNT-1], r_round_next[0:CLASS_ID_COUNT-1];
reg                             r_resp_valid, r_resp_valid_next;
reg [RESULT_WIDTH-1:0]          r_resp_data,  r_resp_data_next;

localparam FSM_WIDTH = 2;
localparam IDLE = 0;
localparam CALC_UPDATE = 1;
localparam RETURN_RESULT = 2;

reg[FSM_WIDTH-1:0] r_wfq_fsm, r_wfq_fsm_next;
reg [PIFO_OVERFLOW_WIDTH-1:0] r_target_overflow, r_target_overflow_next;
reg [PIFO_ROUND_WIDTH-1:0]    r_target_round, r_target_round_next;
reg [CLASS_WIDTH-1:0]         r_target_class_id,r_target_class_id_next; 


integer i; 
always @(*)
	begin

    for (i = 0;i<CLASS_ID_COUNT;i=i+1)
      begin
        r_overflow_next[i] = r_overflow[i];
        r_round_next[i] = r_round[i];       
      end

		r_resp_valid_next = 0;
		r_resp_data_next = r_resp_data;
		r_wfq_fsm_next = r_wfq_fsm;

		r_target_overflow_next = r_target_overflow;
		r_target_round_next = r_target_round;
    r_target_class_id_next = r_target_class_id;
		case(r_wfq_fsm)
		  IDLE:
		      begin
	          if (req_valid)
	              begin
	                  r_wfq_fsm_next = CALC_UPDATE;
	                  r_target_overflow_next = r_overflow[req_class_id];
	                  r_target_round_next = r_round[req_class_id];
                    r_target_class_id_next = req_class_id;

	              end
		      end            
		  CALC_UPDATE:
		      begin                
		                  
            //r_wfq_fsm_next = RETURN_RESULT;
           // check if is outdated,
               // 1. check overflow bit,
               // if is outdated by overflow,
               // sync to the current global overflow and round,
               // and set 0 weight,
               if(r_target_overflow != last_pifo_overflow && last_pifo_round < r_target_round)
                   begin
                       
                              r_target_overflow_next = last_pifo_overflow;
                              r_target_round_next = last_pifo_round;

                   end
               else
                  begin
                      // if fractional > reg weight,
                       // new weight = reg weight + weight - fractional if ,
                       // new round = reg round + remainder + 1
                       
                       // else 
                       // new weight = reg weight - fractional
                       // new round = reg round + remainder,
                        
                       // if new round triggers overflow, then
                       // new overflow = reg overflow + 1
                       
                      if(req_div_remain > 0)
                          begin
                              r_target_round_next = r_target_round + req_div_quotient + 1;
                              //if (ROUND_MAX - r_round[req_class_id] > w_div_out_remainder + 1)
                              if (ROUND_MAX - r_target_round < req_div_quotient + 1) // overflow
                                  begin
                                      r_target_overflow_next = r_target_overflow + 1;
                                  end
                              else if(r_target_round + req_div_quotient + 1 < last_pifo_round)
                                  begin
                                      r_target_round_next = last_pifo_round;
                                  end 
                          end
                      else
                          begin
                              r_target_round_next = r_target_round + req_div_quotient;
                              if (ROUND_MAX - r_target_round < req_div_quotient) // overflow
                                  begin
                                      r_target_overflow_next = r_target_overflow + 1;
                                  end
                              else if (r_target_round + req_div_quotient < last_pifo_round)
                                  begin
                                      r_target_round_next = last_pifo_round;
                                  end                                            
                          end
                      
                  end    
		  
               r_wfq_fsm_next = RETURN_RESULT;
/*
              r_wfq_fsm_next = IDLE;
              r_resp_valid_next = 1;
              r_resp_data_next = {1'b1, r_target_overflow,r_target_round, {PIFO_ADDR_WIDTH{1'b0}}}; 

              r_overflow_next[r_target_class_id] = r_target_overflow;
              r_round_next[r_target_class_id] = r_target_round;
*/              

		      end
                  
		  RETURN_RESULT:
		      begin
		          r_resp_valid_next = 1;
		          r_resp_data_next = {1'b1, r_target_overflow,r_target_round, {PIFO_ADDR_WIDTH{1'b0}}}; 

              r_overflow_next[r_target_class_id] = r_target_overflow;
              r_round_next[r_target_class_id] = r_target_round;
		          r_wfq_fsm_next = IDLE;
		      end


          default:
            begin
                r_wfq_fsm_next = IDLE;
            end
		endcase
	end

always @(posedge clk)
    begin
        if(~rstn)
            begin
                r_resp_valid <= 0;
                r_resp_data <= 0;
                r_wfq_fsm <= IDLE;
                r_target_overflow <= 0;
                r_target_round <= 0;
                r_target_class_id <= 0;
                for (i = 0;i<CLASS_ID_COUNT;i=i+1)
                  begin
                    r_overflow[i] <= 0;
                    r_round[i] <= 0;
                  end
            end
        else
            begin
                r_resp_valid <= r_resp_valid_next;
                r_resp_data <= r_resp_data_next;
                r_wfq_fsm <= r_wfq_fsm_next;
                r_target_overflow <= r_target_overflow_next;
                r_target_round <= r_target_round_next;
                r_target_class_id <= r_target_class_id_next;
                for (i = 0;i<CLASS_ID_COUNT;i=i+1)
                  begin
                    r_overflow[i] <= r_overflow_next[i];
                    r_round[i] <= r_round_next[i];
                  end
            end
    end
    
assign resp_valid = r_resp_valid;
assign resp_data = r_resp_data;

endmodule
