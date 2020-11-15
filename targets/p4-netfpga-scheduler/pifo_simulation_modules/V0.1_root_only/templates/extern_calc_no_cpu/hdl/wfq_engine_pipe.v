/*
 * File: drr_engine.v
 * Author: Zhenguo Cui
 * 
 * WFQ Calc Module with PIPE line
 * Pipeline stages = 3,
 */



`timescale 1 ps / 1 ps
module wfq_engine_pipe
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
  input     [PIFO_ROUND_WIDTH-1:0]          last_pifo_round,
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

reg                                 PIPE_1_r_valid;
reg [WEIGHT_WIDTH-1:0]              PIPE_1_r_div_quotient;
reg [WEIGHT_WIDTH-1:0]              PIPE_1_r_div_remain;
reg                                 PIPE_1_r_last_pifo_valid;
reg [PIFO_OVERFLOW_WIDTH-1:0]       PIPE_1_r_last_pifo_overflow;
reg [PIFO_ROUND_WIDTH-1:0]          PIPE_1_r_last_pifo_round;


reg [PIFO_OVERFLOW_WIDTH-1:0] PIPE_1_r_target_overflow, PIPE_1_r_target_overflow_next;
reg [PIFO_ROUND_WIDTH-1:0]    PIPE_1_r_target_round, PIPE_1_r_target_round_next;
reg [CLASS_WIDTH-1:0]         PIPE_1_r_target_class_id,PIPE_1_r_target_class_id_next; 

reg                                 PIPE_2_r_valid;

reg [PIFO_OVERFLOW_WIDTH-1:0] PIPE_2_r_target_overflow, PIPE_2_r_target_overflow_next;
reg [PIFO_ROUND_WIDTH-1:0]    PIPE_2_r_target_round, PIPE_2_r_target_round_next;
reg [CLASS_WIDTH-1:0]         PIPE_2_r_target_class_id; 


// PIPE 1: get target class informaiton
always @(*)
  begin
        PIPE_1_r_target_overflow_next = r_overflow[req_class_id];
        PIPE_1_r_target_round_next = r_round[req_class_id];
        PIPE_1_r_target_class_id_next = req_class_id;
  end


// PIPE 2: Calculation
always @(*)
  begin

    PIPE_2_r_target_overflow_next = PIPE_1_r_target_overflow;
    PIPE_2_r_target_round_next = PIPE_1_r_target_round;

   // check if is outdated,
   // 1. check overflow bit,
   // if is outdated by overflow,
   // sync to the current global overflow and round,
   // and set 0 weight,
   if(PIPE_1_r_target_overflow != PIPE_1_r_last_pifo_overflow && PIPE_1_r_last_pifo_round < PIPE_1_r_target_round)
       begin
           
          PIPE_2_r_target_overflow_next = PIPE_1_r_last_pifo_overflow;
          PIPE_2_r_target_round_next = PIPE_1_r_last_pifo_round;
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
           
          if(PIPE_1_r_div_remain > 0)
              begin
                  PIPE_2_r_target_round_next = PIPE_1_r_target_round + PIPE_1_r_div_quotient + 1;
                  //if (ROUND_MAX - r_round[req_class_id] > w_div_out_remainder + 1)
                  if (ROUND_MAX - PIPE_1_r_target_round < PIPE_1_r_div_quotient + 1) // overflow
                      begin
                          PIPE_2_r_target_overflow_next = PIPE_1_r_target_overflow + 1;
                      end
                  else if(PIPE_1_r_target_round + PIPE_1_r_div_quotient + 1 < PIPE_1_r_last_pifo_round)
                      begin
                          PIPE_2_r_target_round_next = PIPE_1_r_last_pifo_round;
                      end 
              end
          else
              begin
                  PIPE_2_r_target_round_next = PIPE_1_r_target_round + PIPE_1_r_div_quotient;
                  if (ROUND_MAX - PIPE_1_r_target_round < PIPE_1_r_div_quotient) // overflow
                      begin
                          PIPE_2_r_target_overflow_next = PIPE_1_r_target_overflow + 1;
                      end
                  else if (PIPE_1_r_target_round + PIPE_1_r_div_quotient < PIPE_1_r_last_pifo_round)
                      begin
                          PIPE_2_r_target_round_next = PIPE_1_r_last_pifo_round;
                      end                                            
              end


        end
end

// PIPE 3. Update
integer i; 
always @(*)
    begin
        r_resp_valid_next = 0;
        r_resp_data_next = {PIFO_WIDTH{1'b0}}; 
        for (i = 0;i<CLASS_ID_COUNT;i=i+1)
          begin
            r_overflow_next[i] = r_overflow[i];
            r_round_next[i] = r_round[i];
    
          end
        
        if(PIPE_2_r_valid)
            begin
                r_resp_valid_next = 1;
                r_resp_data_next = {1'b1, PIPE_2_r_target_overflow,PIPE_2_r_target_round, {PIFO_ADDR_WIDTH{1'b0}}}; 
                
                r_overflow_next[PIPE_2_r_target_class_id] = PIPE_2_r_target_overflow;
                r_round_next[PIPE_2_r_target_class_id] = PIPE_2_r_target_round;
            end    
    end

always @(posedge clk)
    begin
        if(~rstn)
            begin
                PIPE_1_r_valid <= 0;
                PIPE_2_r_valid <= 0;
                PIPE_1_r_div_quotient <= 0;
                PIPE_1_r_div_remain <= 0; 
                PIPE_1_r_last_pifo_valid <= 0;  
                PIPE_1_r_last_pifo_overflow <= 0;
                PIPE_1_r_last_pifo_round <= 0;                              
                
                PIPE_1_r_target_overflow <= 0;
                PIPE_1_r_target_round <= 0;
                PIPE_1_r_target_class_id <= 0;

                PIPE_2_r_target_overflow <= 0;
                PIPE_2_r_target_round <= 0;
                PIPE_2_r_target_class_id <= 0;

                r_resp_valid <= 0;
                r_resp_data <= {PIFO_WIDTH{1'b0}};
                for (i = 0;i<CLASS_ID_COUNT;i=i+1)
                  begin
                    r_overflow[i] <= 0;
                    r_round[i] <= 0;       
                  end
            end
        else
            begin
                PIPE_1_r_valid <= req_valid;
                PIPE_2_r_valid <= PIPE_1_r_valid;
                PIPE_1_r_div_quotient <= req_div_quotient;
                PIPE_1_r_div_remain <= req_div_remain;                 
                PIPE_1_r_last_pifo_valid <= last_pifo_valid;  
                PIPE_1_r_last_pifo_overflow <= last_pifo_overflow;
                PIPE_1_r_last_pifo_round <= last_pifo_round;              

                r_resp_valid <= r_resp_valid_next;
                r_resp_data <= r_resp_data_next;
                
                PIPE_1_r_target_overflow <= PIPE_1_r_target_overflow_next;
                PIPE_1_r_target_round <= PIPE_1_r_target_round_next;
                PIPE_1_r_target_class_id <= PIPE_1_r_target_class_id_next;

                PIPE_2_r_target_overflow <= PIPE_2_r_target_overflow_next;
                PIPE_2_r_target_round <= PIPE_2_r_target_round_next;
                PIPE_2_r_target_class_id <= PIPE_1_r_target_class_id;

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
