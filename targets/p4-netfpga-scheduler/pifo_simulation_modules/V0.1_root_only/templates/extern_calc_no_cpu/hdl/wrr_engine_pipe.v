/*
 * File: wrr_engine.v
 * Author: Zhenguo Cui
 * 
 * WRR Calc Module PIPE
 */



`timescale 1 ps / 1 ps
module wrr_engine_pipe
#(
  parameter CLASS_WIDTH = 5,
  parameter WEIGHT_WIDTH = 16,
  parameter RESULT_WIDTH = 32, 
  parameter PIFO_OVERFLOW_WIDTH = 1,
  parameter PIFO_ROUND_WIDTH = 18,
  parameter PIFO_ADDR_WIDTH = 12,
  parameter PIFO_WIDTH = 32
)
(
  input                                     req_valid,
  input     [CLASS_WIDTH-1:0]               req_class_id,
  input     [WEIGHT_WIDTH-1:0]              req_class_weight,
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
reg [WEIGHT_WIDTH-1:0]			   r_weight[0:CLASS_ID_COUNT-1], r_weight_next[0:CLASS_ID_COUNT-1];


reg [PIFO_OVERFLOW_WIDTH-1:0] r_target_overflow, r_target_overflow_next;
reg [PIFO_ROUND_WIDTH-1:0]	r_target_round, r_target_round_next;

reg                             r_resp_valid, r_resp_valid_next;
reg [RESULT_WIDTH-1:0]          r_resp_data,  r_resp_data_next;


reg                                 PIPE_1_r_valid;
reg                                 last_pifo_valid_d1;
reg [PIFO_OVERFLOW_WIDTH-1:0]       last_pifo_overflow_d1;
reg [PIFO_ROUND_WIDTH-1:0]          last_pifo_round_d1;

reg [PIFO_OVERFLOW_WIDTH-1:0] PIPE_1_r_target_overflow, PIPE_1_r_target_overflow_next;
reg [PIFO_ROUND_WIDTH-1:0]    PIPE_1_r_target_round,    PIPE_1_r_target_round_next;
reg [WEIGHT_WIDTH-1:0]        PIPE_1_r_target_weight,   PIPE_1_r_target_weight_next;
reg [CLASS_WIDTH-1:0]         PIPE_1_r_target_class_id, PIPE_1_r_target_class_id_next; 
reg [WEIGHT_WIDTH-1:0]        PIPE_1_r_req_weight,      PIPE_1_r_req_weight_next;


reg                                 PIPE_2_r_valid;

reg [PIFO_OVERFLOW_WIDTH-1:0] PIPE_2_r_target_overflow, PIPE_2_r_target_overflow_next;
reg [PIFO_ROUND_WIDTH-1:0]    PIPE_2_r_target_round, PIPE_2_r_target_round_next;
reg [WEIGHT_WIDTH-1:0]        PIPE_2_r_target_weight, PIPE_2_r_target_weight_next;
reg [CLASS_WIDTH-1:0]         PIPE_2_r_target_class_id; 


// PIPE 1: get target class informaiton
always @(*)
  begin
        PIPE_1_r_target_overflow_next = r_overflow[req_class_id];
        PIPE_1_r_target_round_next = r_round[req_class_id];
        PIPE_1_r_target_weight_next = r_weight[req_class_id];
        PIPE_1_r_target_class_id_next = req_class_id;
        PIPE_1_r_req_weight_next = req_class_weight;
  end

// PIPE 2: Calculation
always @(*)
  begin

    PIPE_2_r_target_overflow_next = PIPE_1_r_target_overflow;
    PIPE_2_r_target_round_next = PIPE_1_r_target_round;
    PIPE_2_r_target_weight_next = PIPE_1_r_target_weight;
  

     // check if is outdated,
     // 1. check overflow bit,
     if(PIPE_1_r_target_overflow != last_pifo_overflow_d1 && last_pifo_round_d1 < PIPE_1_r_target_round)
         begin
             PIPE_2_r_target_overflow_next = last_pifo_overflow_d1;
             PIPE_2_r_target_round_next = last_pifo_round_d1;
             PIPE_2_r_target_weight_next = PIPE_1_r_req_weight - 1;
             
         end
     
     // 2. check global round
     else if (PIPE_1_r_target_overflow == last_pifo_overflow_d1 && PIPE_1_r_target_round < last_pifo_round_d1)
         begin
            PIPE_2_r_target_round_next = last_pifo_round_d1;
            PIPE_2_r_target_weight_next = PIPE_1_r_req_weight - 1;                         
         end
     else
         begin
             if(PIPE_1_r_target_weight > 0)
                 begin
                     PIPE_2_r_target_weight_next = PIPE_1_r_target_weight - 1;
                 end
             else if(PIPE_1_r_target_round == ROUND_MAX)
                 begin
                     PIPE_2_r_target_overflow_next = PIPE_1_r_target_overflow + 1;
                     PIPE_2_r_target_round_next = {PIFO_ROUND_WIDTH{1'b0}};
                     PIPE_2_r_target_weight_next = PIPE_1_r_req_weight - 1;   
                 end
             else
                 begin
                     PIPE_2_r_target_round_next =  PIPE_1_r_target_round + 1;
                     PIPE_2_r_target_weight_next = PIPE_1_r_req_weight - 1;
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
            r_weight_next[i] = r_weight[i];          
          end
        
        if(PIPE_2_r_valid)
            begin
                r_resp_valid_next = 1;
                r_resp_data_next = {1'b1, PIPE_2_r_target_overflow,PIPE_2_r_target_round, {PIFO_ADDR_WIDTH{1'b0}}}; 
                
                r_overflow_next[PIPE_2_r_target_class_id] = PIPE_2_r_target_overflow;
                r_round_next[PIPE_2_r_target_class_id] = PIPE_2_r_target_round;
                r_weight_next[PIPE_2_r_target_class_id] = PIPE_2_r_target_weight;  
            end    
    end




always @(posedge clk)
    begin
        if(~rstn)
            begin
                r_resp_valid <= 0;
                r_resp_data <= 0;

                last_pifo_valid_d1 <= 0;
                last_pifo_overflow_d1 <= 0;
                last_pifo_round_d1 <= 0;
                
                PIPE_1_r_valid <= 0;
                PIPE_2_r_valid <= 0;

                PIPE_1_r_target_overflow <= 0;
                PIPE_1_r_target_round <= 0;
                PIPE_1_r_target_weight <= 0;
                PIPE_1_r_target_class_id <= 0;
                PIPE_1_r_req_weight <= 0;

                PIPE_2_r_target_overflow <= 0;
                PIPE_2_r_target_round <= 0;
                PIPE_2_r_target_weight <= 0;
                PIPE_2_r_target_class_id <= 0;

                for (i = 0;i<CLASS_ID_COUNT;i=i+1)
                  begin
                    r_overflow[i] <= 0;
                    r_round[i] <= 0;
                    r_weight[i] <= 0;          
                  end
            end
        else
            begin
                r_resp_valid <= r_resp_valid_next;
                r_resp_data <= r_resp_data_next;

                for (i = 0;i<CLASS_ID_COUNT;i=i+1)
                  begin
                    r_overflow[i] <= r_overflow_next[i];
                    r_round[i] <= r_round_next[i];
                    r_weight[i] <= r_weight_next[i];         
                  end

                last_pifo_valid_d1 <= last_pifo_valid;
                last_pifo_overflow_d1 <= last_pifo_overflow;
                last_pifo_round_d1 <= last_pifo_round;

                PIPE_1_r_valid <= req_valid;
                PIPE_2_r_valid <= PIPE_1_r_valid;

                PIPE_1_r_target_overflow <= PIPE_1_r_target_overflow_next;
                PIPE_1_r_target_round <= PIPE_1_r_target_round_next;
                PIPE_1_r_target_weight <= PIPE_1_r_target_weight_next;
                PIPE_1_r_target_class_id <= PIPE_1_r_target_class_id_next;
                PIPE_1_r_req_weight <= PIPE_1_r_req_weight_next;

                PIPE_2_r_target_overflow <= PIPE_2_r_target_overflow_next;
                PIPE_2_r_target_round <= PIPE_2_r_target_round_next;
                PIPE_2_r_target_weight <= PIPE_2_r_target_weight_next;
                PIPE_2_r_target_class_id <= PIPE_1_r_target_class_id;

            end
    end

assign resp_valid = r_resp_valid;
assign resp_data = r_resp_data;

endmodule
