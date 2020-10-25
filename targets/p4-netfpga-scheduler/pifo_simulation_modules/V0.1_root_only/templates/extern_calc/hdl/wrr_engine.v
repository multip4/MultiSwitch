/*
 * File: wrr_engine.v
 * Author: Zhenguo Cui
 * 
 * WRR Calc Module
 */



`timescale 1 ps / 1 ps
module wrr_engine
#(
  parameter CLASS_WIDTH = 8,
  parameter WEIGHT_WIDTH = 16,
  parameter PKT_WIDTH = 16,
  parameter RESULT_WIDTH = 32, 
  parameter PIFO_OVERFLOW_WIDTH = 1,
  parameter PIFO_ROUND_WIDTH = 17,
  parameter PIFO_ADDR_WIDTH = 12,
  parameter PIFO_WIDTH = 32
)
(
  input                                     req_valid,
  input     [CLASS_WIDTH-1:0]               req_class_id,
  input     [WEIGHT_WIDTH-1:0]              req_class_weight,
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
reg [WEIGHT_WIDTH-1:0]			r_weight[0:CLASS_ID_COUNT-1], r_weight_next[0:CLASS_ID_COUNT-1];

reg                             r_resp_valid, r_resp_valid_next;
reg [RESULT_WIDTH-1:0]          r_resp_data,  r_resp_data_next;

genvar i;
generate
	for(i=0;i<CLASS_ID_COUNT;i=i+1)
		begin: class_reg

			always @(*)
				begin
					r_overflow_next[i] = r_overflow[i];
					r_round_next[i] = r_round[i];
					r_weight_next[i] = r_weight[i];
					
					if(req_class_id == i && req_valid)
					   begin
					       // check if is outdated,
					       // 1. check overflow bit,
					       if(r_overflow[i] != last_pifo_overflow)
					           begin
					               r_overflow_next[i] = last_pifo_overflow;
					               r_round_next[i] = last_pifo_round;
					               r_weight_next[i] = req_class_weight - 1;
					               
					           end
					       
					       // 2. check global round
					       else if (r_round[i] < last_pifo_round)
					           begin
					               r_round_next[i] = last_pifo_round;
                                   r_weight_next[i] = req_class_weight - 1;					               
					           end
					       else
					           begin
					               if(r_weight[i] > 0)
					                   begin
					                       r_weight_next[i] = r_weight[i] - 1;
					                   end
					               else if(&r_round[i] == 1'b1)
					                   begin
					                       r_overflow_next[i] = r_overflow[i] + 1;
					                       r_round_next[i] = 0;
					                       r_weight_next[i] = req_class_weight - 1;		
					                   end
					               else
					                   begin
					                       r_round_next[i] = r_round[i] + 1;
					                       r_weight_next[i] = r_weight[i] - 1;
					                   end
					           end
					   
					   end
					
				end

			always @(posedge clk)
				begin
					if(~rstn)
						begin
							r_overflow[i] <= 0;
							r_round[i] <= 0;
							r_weight[i] <= 0;
						end
					else
						begin
							r_overflow[i] <= r_overflow_next[i];
							r_round[i] <= r_round_next[i];
							r_weight[i] <= r_weight_next[i];
						end
				end

		end
endgenerate


always @(*)
	begin
		r_resp_valid_next = 0;
		r_resp_data_next = r_resp_data;
		// if last pifo info is valid, then do compare outaged condition,
		if(req_valid)
			begin
				r_resp_valid_next = 1;
				r_resp_data_next = {1'b1, r_overflow[req_class_id],r_round[req_class_id], {PIFO_ADDR_WIDTH{1'b0}}};
			end
	end

always @(posedge clk)
    begin
        if(~rstn)
            begin
                r_resp_valid <= 0;
                r_resp_data <= 0;
            end
        else
            begin
                r_resp_valid <= r_resp_valid_next;
                r_resp_data <= r_resp_data_next;
            end
    end
    

assign resp_valid = r_resp_valid;
assign resp_data = r_resp_data;


endmodule
