`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/14/2020 05:32:51 AM
// Design Name: 
// Module Name: drr_without_blkmem
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


module drr_calc_new#(
    parameter INPUT_PORT_INFO_WIDTH = 8,
    parameter PORT_ID_WIDTH = 3,
    parameter PORT_ID_COUNTER = 5,
	parameter CLASS_WIDTH = 5,
	parameter PKT_SIZE_WIDTH = 11,
	parameter CLASS_COUNTER = 32,
    parameter RESULT_WIDTH = 32,
    parameter OVER_FLOW_WIDTH = 2, // We support 2 extra over flow bit to allow not  
    parameter ROUND_WIDTH = 17,
    parameter CONIFG_QUANTUM_WIDTH = 17,
    parameter REMAIN_QUANTUM_WIDTH = 17, //read and write data length(number 0 to 131071).
    parameter CPU_INDEX_WIDTH = 8,
    parameter CPU_WRITE_WIDTH = 17, // Write Quantum Size
    parameter CPU_OUT_WIDTH = ROUND_WIDTH,
    parameter ID_WIDTH = PORT_ID_WIDTH + CLASS_WIDTH,
    parameter ID_COUNTER = PORT_ID_WIDTH * CLASS_COUNTER,
    parameter PIFO_INFO_WIDTH = 12,
    parameter CPU_REQUEST_BIT = 2,
    parameter MAX_ROUND_VALUE = 18'b011111111111111111
)
(

    /*
    *   Define IO in Both CP and DP.
    */
    input                                   rst,
   
    /*
    *   Define Data-Plane IO.
    */
    input                                                               clk_dp,
    input                                                               tuple_in_my_pifo_rank_calc_input_VALID,
    input   [INPUT_PORT_INFO_WIDTH+CLASS_WIDTH +PKT_SIZE_WIDTH-1:0]     tuple_in_my_pifo_rank_calc_input_DATA,
    output                                                              tuple_out_my_pifo_rank_calc_output_VALID,
    output  [RESULT_WIDTH-1:0]                                          tuple_out_my_pifo_rank_calc_output_DATA,
    
    
    /*
    Input Wire From PIFO Scheduler. 
    */    
    input   [RESULT_WIDTH-1:0]                                  wire_in_last_pkt_info0,
    input   [RESULT_WIDTH-1:0]                                  wire_in_last_pkt_info1,
    input   [RESULT_WIDTH-1:0]                                  wire_in_last_pkt_info2,
    input   [RESULT_WIDTH-1:0]                                  wire_in_last_pkt_info3,
    input   [RESULT_WIDTH-1:0]                                  wire_in_last_pkt_info4,
    
      /*
     I/O From CPU Channel.  
     */  
    input                                                       clk_cp,
    input   [CPU_INDEX_WIDTH -1:0]                              wire_in_cpu_write_index,
    input                                                       wire_in_cpu_write_sig,
    input   [CPU_WRITE_WIDTH -1 :0]                             wire_in_cpu_config_write,
    input                                                       wire_in_cpu_read_sig,
    input   [CPU_INDEX_WIDTH + CPU_REQUEST_BIT-1:0]             wire_in_cpu_read_index,
    output  [CPU_INDEX_WIDTH -1:0]                              wire_out_cpu_index,
    output  [CPU_OUT_WIDTH -1:0]                                wire_out_cpu_val,
    output                                                      wire_out_cpu_valid
);

/*
* DP Handling Register
*/
reg [OVER_FLOW_WIDTH-1:0]                             reg_overflow [ID_COUNTER-1:0];
reg [ROUND_WIDTH-1:0]                                 reg_round [ID_COUNTER-1:0];
reg [REMAIN_QUANTUM_WIDTH-1:0]                        reg_remain_quantum [ID_COUNTER-1:0];
reg [CONIFG_QUANTUM_WIDTH-1:0]                        reg_config_quantum [ID_COUNTER-1:0];
reg [PIFO_INFO_WIDTH-1:0]                             reg_pifo_info;
reg [CLASS_WIDTH+PORT_ID_WIDTH + ROUND_WIDTH-1:0]     reg_calced_rank;
reg [ID_WIDTH-1:0]                                    reg_input_id1,reg_input_id2,reg_input_id3,reg_input_id4,reg_input_id5,reg_input_id6;
reg                                                   reg_dp1_valid_out,reg_dp2_valid_out,reg_dp3_valid_out,reg_dp4_valid_out,reg_dp5_valid_out,reg_dp6_valid_out;

/*
* DP Combinational Wire
*/
reg [OVER_FLOW_WIDTH-1:0]                             reg_overflow_next [ID_COUNTER-1:0];
reg [ROUND_WIDTH-1:0]                                 reg_round_next [ID_COUNTER-1:0];
reg [REMAIN_QUANTUM_WIDTH-1:0]                        reg_remain_quantum_next [ID_COUNTER-1:0];
reg [CONIFG_QUANTUM_WIDTH-1:0]                        reg_config_quantum_next [ID_COUNTER-1:0];
reg [CLASS_WIDTH+PORT_ID_WIDTH + ROUND_WIDTH-1:0]     reg_calced_rank_next;
reg [ID_WIDTH-1:0]                                    reg_input_id1_next,reg_input_id2_next,reg_input_id3_next,reg_input_id4_next,reg_input_id5_next,reg_input_id6_next;
reg                                                   reg_dp1_valid_out_next,reg_dp2_valid_out_next,reg_dp3_valid_out_next,reg_dp4_valid_out_next,reg_dp5_valid_out_next,reg_dp6_valid_out_next;
reg [ID_WIDTH-1:0]                                    input_id;
reg [PORT_ID_WIDTH-1:0]                               input_port_id;

/*Control Plane Register*/
reg                                                   reg_out_valid_cp;
reg [CPU_OUT_WIDTH-1:0]                               reg_cp_out_val;
reg [ID_WIDTH-1:0]                                    reg_cp_out_index; //address 3 -bit port, 5-bit class, 2-bit 

/*Control Plane Combinational Output*/
reg [CPU_OUT_WIDTH-1:0]                               reg_cp_out_val_next;
reg [ID_WIDTH-1:0]                                    reg_cp_out_index_next;
reg                                                   reg_out_valid_cp_next;

/*Combinational Output for output rank calcutate overflow, round, remain weight*/ 
reg [OVER_FLOW_WIDTH-1:0]                             reg_overflow_combi [ID_COUNTER-1:0];
reg [ROUND_WIDTH-1:0]                                 reg_round_combi [ID_COUNTER-1:0];
reg [REMAIN_QUANTUM_WIDTH-1:0]                        reg_remain_quantum_combi[ID_COUNTER-1:0];
      

//Wire to specify  params from PIFO Scheduling Queue 
wire [ROUND_WIDTH-1:0]                                wire_last_round [PORT_ID_COUNTER-1:0];
wire [OVER_FLOW_WIDTH-1:0]                            wire_last_overflow [PORT_ID_COUNTER-1:0];     

//Wire to specify params from PIFO Scheduling Queue.     
wire [CPU_INDEX_WIDTH-1:0]                            wire_cp_read_address;
wire [CPU_REQUEST_BIT-1:0]                            wire_cp_read_request;

//Wire From P4 Pipe-line
wire[PKT_SIZE_WIDTH-1:0] input_pkt_size             =tuple_in_my_pifo_rank_calc_input_DATA[INPUT_PORT_INFO_WIDTH+CLASS_WIDTH+PKT_SIZE_WIDTH-1:INPUT_PORT_INFO_WIDTH+CLASS_WIDTH];
wire[INPUT_PORT_INFO_WIDTH-1:0]   input_port        =tuple_in_my_pifo_rank_calc_input_DATA[INPUT_PORT_INFO_WIDTH+CLASS_WIDTH-1:CLASS_WIDTH];
wire[CLASS_WIDTH-1:0]  input_class                  =tuple_in_my_pifo_rank_calc_input_DATA[CLASS_WIDTH-1:0];
wire                   valid_in                     =tuple_in_my_pifo_rank_calc_input_VALID;


//Wire From Devision Module.
wire  [PKT_SIZE_WIDTH-1:0]                           wire_round_to_add;
wire  [REMAIN_QUANTUM_WIDTH-1:0]                     wire_remain_to_minus;
wire                                                 valid_r;

wire                                                 wire_last_dq_info_update; 

integer id_i, id_j,counter; 

div_calculator div_calc(
.clk(clk_dp),
.dataInDvsReady(reg_dp1_valid_out),
.dataInDvs(reg_config_quantum[reg_input_id1]),
.dataInDvdReady(reg_dp1_valid_out),
.dataInDvd(input_pkt_size),
.dataOutquo(wire_round_to_add),
.dataOutrem(wire_remain_to_minus),
.dataDoutready(valid_r)
);

//Get last Rond From Output Queue

assign wire_last_dq_info_update = wire_in_last_pkt_info0[31] || wire_in_last_pkt_info1 [31] || wire_in_last_pkt_info2[31]|| wire_in_last_pkt_info3[31];

assign wire_last_round[0]  = wire_in_last_pkt_info0 [ROUND_WIDTH +PIFO_INFO_WIDTH-1:PIFO_INFO_WIDTH];
assign wire_last_round[1] =  wire_in_last_pkt_info1 [ROUND_WIDTH +PIFO_INFO_WIDTH-1:PIFO_INFO_WIDTH];
assign wire_last_round[2] =  wire_in_last_pkt_info2 [ROUND_WIDTH +PIFO_INFO_WIDTH-1:PIFO_INFO_WIDTH];
assign wire_last_round[3] =  wire_in_last_pkt_info3 [ROUND_WIDTH +PIFO_INFO_WIDTH-1:PIFO_INFO_WIDTH];
assign wire_last_round[4] =  wire_in_last_pkt_info4 [ROUND_WIDTH +PIFO_INFO_WIDTH-1:PIFO_INFO_WIDTH];

assign wire_last_overflow[0]  = wire_in_last_pkt_info0 [OVER_FLOW_WIDTH + ROUND_WIDTH +PIFO_INFO_WIDTH-1:ROUND_WIDTH +PIFO_INFO_WIDTH];
assign wire_last_overflow[1] =  wire_in_last_pkt_info1 [OVER_FLOW_WIDTH + ROUND_WIDTH +PIFO_INFO_WIDTH-1:ROUND_WIDTH +PIFO_INFO_WIDTH];
assign wire_last_overflow[2] =  wire_in_last_pkt_info2 [OVER_FLOW_WIDTH + ROUND_WIDTH +PIFO_INFO_WIDTH-1:ROUND_WIDTH +PIFO_INFO_WIDTH];
assign wire_last_overflow[3] =  wire_in_last_pkt_info3 [OVER_FLOW_WIDTH + ROUND_WIDTH +PIFO_INFO_WIDTH-1:ROUND_WIDTH +PIFO_INFO_WIDTH];
assign wire_last_overflow[4] =  wire_in_last_pkt_info4 [OVER_FLOW_WIDTH + ROUND_WIDTH +PIFO_INFO_WIDTH-1:ROUND_WIDTH +PIFO_INFO_WIDTH];

assign wire_cp_read_request = wire_in_cpu_read_index[CPU_REQUEST_BIT-1:0];
assign wire_cp_read_address = wire_in_cpu_read_index[CPU_INDEX_WIDTH + CPU_REQUEST_BIT-1:CPU_REQUEST_BIT];


//DRR Combinational Logic
always @(*)
begin

//Handling Delay Signal
reg_dp1_valid_out_next = valid_in;
reg_dp2_valid_out_next = reg_dp1_valid_out;
reg_dp3_valid_out_next = reg_dp2_valid_out;
reg_dp4_valid_out_next = reg_dp3_valid_out;
reg_dp5_valid_out_next = reg_dp4_valid_out;
reg_dp6_valid_out_next = reg_dp5_valid_out;

reg_input_id2_next = reg_input_id1;
reg_input_id3_next = reg_input_id2;
reg_input_id4_next = reg_input_id3;
reg_input_id5_next = reg_input_id4;
reg_input_id6_next = reg_input_id5;

if (wire_last_dq_info_update)
    begin      
        counter = 0;    
        for (id_i=0; id_i<=PORT_ID_COUNTER-1; id_i= id_i+1)
            begin
                for (id_j=counter; id_j<=counter+CLASS_COUNTER-1; id_j= id_j+1)
                    begin
                         if ((wire_last_overflow[id_i]>reg_overflow[id_j])||(wire_last_overflow[id_i]==2'b00 && reg_overflow[id_j]==2'b11)) // When OverFlowBit is Big
                            begin
                                reg_overflow_combi[id_j] = wire_last_overflow[id_i];
                                reg_round_combi[id_j] =  wire_last_round [id_i];
                                reg_remain_quantum_combi[id_j] =   reg_config_quantum[id_j];  //remain combi set to config value.
                            end
                         else
                            begin
                                reg_overflow_combi[id_j] =  reg_overflow[id_j]; //OverFlow No need to change.
                                if ((wire_last_overflow[id_i]== reg_overflow[id_j])&&(wire_last_round[id_i]>reg_round[id_j]))
                                    begin
                                        reg_round_combi[id_j] = wire_last_round[id_i];
                                        reg_remain_quantum_combi[id_j] =   reg_config_quantum[id_j];  //remain combi set to config value.
                                    end
                                else
                                    begin
                                        reg_round_combi[id_j] = reg_round[id_j];
                                        reg_remain_quantum_combi[id_j] =  reg_remain_quantum_combi[id_j];
                                    end
                            end    
                    end
                counter = counter + CLASS_COUNTER;
            end     
    end
else //No need to change value when there is no signal from the wire.
    begin
        for (id_j=0; id_j<=ID_COUNTER-1; id_j= id_j+1)
            begin
                reg_round_combi[id_j] =    reg_round[id_j];
                reg_overflow_combi[id_j] = reg_overflow[id_j];
                reg_remain_quantum_combi[id_j] =   reg_remain_quantum[id_j];
            end
    end


if (valid_in)
    begin
        // DP Channel Signal Handling 
        case (input_port)
            'b00000001:
                input_port_id  = 0;
            'b00000100:
                input_port_id  = 1;
            'b00010000:
               input_port_id  = 2;
            'b01000000:
               input_port_id  = 3;
            default : 
                // CPU Port
               input_port_id  = 4;
        endcase
        reg_input_id1_next = {input_port_id, input_class}; 
        reg_calced_rank_next = 0;
        
        //keep rank value same with original calculated value.
        for (id_j=0; id_j<ID_COUNTER; id_j= id_j+1)
            begin
            reg_overflow_next[id_j] = reg_overflow[id_j]; 
            reg_remain_quantum_next[id_j] = reg_remain_quantum[id_j];
            reg_round_next[id_j] = reg_round[id_j];
            end
    end
        
else if (reg_dp5_valid_out)
    begin
        for (id_j=0; id_j<=ID_COUNTER-1; id_j= id_j+1)
            begin
            if (id_j == reg_input_id5) // If ID is same run DRR Logic 
                begin
                if (reg_remain_quantum[id_j] < wire_remain_to_minus) // when remain quantum is smaller than quantum to minus, additional add one round, and remain quantum add config quantum
                    begin
                        reg_remain_quantum_next[id_j] = reg_remain_quantum_combi[id_j] + reg_config_quantum[id_j] - wire_remain_to_minus;
                        reg_round_next[id_j] = reg_round_combi[id_j] + 1 + wire_round_to_add;
                        
                        if (MAX_ROUND_VALUE-reg_round_combi[id_j] - 1 - wire_round_to_add > 0) //If New Round Not Overflowed
                            begin
                                reg_overflow_next[id_j] = reg_overflow_combi[id_j]; //Keep Current Overflow bit
                            end
                         else
                            begin
                                reg_overflow_next[id_j] = reg_overflow_combi[id_j]+1; //Add Overflow bit.
                            end
                    end
                else
                    begin
                        reg_remain_quantum_next[id_j] = reg_remain_quantum_combi[id_j] - wire_remain_to_minus; // when remain quantum bigger than config quantum add to round.
                        reg_round_next[id_j] = reg_round_combi[id_j]+ wire_round_to_add; 
                        
                        if (MAX_ROUND_VALUE-reg_round_combi[id_j]- wire_round_to_add > 0) //If New Round Not Overflowed
                            begin
                                reg_overflow_next[id_j] = reg_overflow_combi[id_j]; //Keep Current Overflow bit
                            end
                         else
                            begin
                                reg_overflow_next[id_j] = reg_overflow_combi[id_j]+1; //Add Overflow bit.
                            end
                    end
                end
            else
                begin
                    reg_remain_quantum_next[id_j] = reg_remain_quantum_combi[id_j];
                    reg_round_next[id_j] = reg_round_combi[id_j];
                end
            end
        reg_calced_rank_next = {reg_overflow_next[reg_input_id5],reg_round_next[reg_input_id5]};         
    end
    
else
    begin
        reg_calced_rank_next = 0;
        for (id_j=0; id_j<ID_COUNTER; id_j= id_j+1)
            begin
                reg_overflow_next[id_j] = reg_overflow_combi[id_j]; 
                reg_remain_quantum_next[id_j] = reg_remain_quantum_combi[id_j];
                reg_round_next[id_j] = reg_round_combi[id_j];
            end
    end
end

//Control plane signal handling
always @(*)
begin
    reg_out_valid_cp_next = wire_in_cpu_write_sig || wire_in_cpu_read_sig;   
    if (wire_in_cpu_write_sig)
        begin
            reg_cp_out_index_next =  wire_in_cpu_write_index;
            reg_cp_out_val_next = 0;
            
            for (id_j=0; id_j<=ID_COUNTER-1; id_j= id_j+1)
                begin
                
                    if (id_j == wire_in_cpu_write_index)
                        begin
                        reg_config_quantum_next[wire_in_cpu_write_index] = wire_in_cpu_config_write;
                        end
                    else
                        begin
                        reg_config_quantum_next[id_j] = reg_config_quantum[id_j];
                        end
                end       
        end
    else if (wire_in_cpu_read_sig)
        begin
            reg_cp_out_index_next =  wire_in_cpu_read_index;
            
            case (wire_cp_read_request)
                'b00:
                   reg_cp_out_val_next = reg_config_quantum[wire_cp_read_address];
                'b01:
                   reg_cp_out_val_next = reg_overflow[wire_cp_read_address];
                'b10:
                   reg_cp_out_val_next = reg_round[wire_cp_read_address];
                'b11:
                   reg_cp_out_val_next = reg_remain_quantum[wire_cp_read_address];
                default : 
                   reg_cp_out_val_next  = reg_config_quantum[wire_cp_read_address];
            endcase
                    
            for (id_j=0; id_j<=ID_COUNTER-1; id_j= id_j+1)
                begin
                    reg_config_quantum_next[id_j] = reg_config_quantum[id_j];
                end
        end 
    else
        begin
            reg_cp_out_index_next =  0;
            reg_cp_out_val_next = 0;
            
            for (id_j=0; id_j<=ID_COUNTER-1; id_j= id_j+1)
                begin
                    reg_config_quantum_next[id_j] = reg_config_quantum[id_j];
                end
        end      
end



always @(posedge clk_dp)
begin
    if (~rst)
        begin       
            reg_dp1_valid_out<=reg_dp1_valid_out_next;
            reg_dp2_valid_out<=reg_dp2_valid_out_next;
            reg_dp3_valid_out<=reg_dp3_valid_out_next;
            reg_dp4_valid_out<=reg_dp4_valid_out_next;
            reg_dp5_valid_out<=reg_dp5_valid_out_next;
            reg_dp6_valid_out<=reg_dp6_valid_out_next;
            
            reg_input_id1 <= reg_input_id1_next;
            reg_input_id2 <= reg_input_id2_next;
            reg_input_id3 <= reg_input_id3_next;
            reg_input_id4 <= reg_input_id4_next;
            reg_input_id5 <= reg_input_id5_next;
            reg_input_id6 <= reg_input_id6_next;
    
            for (id_j=0; id_j<ID_COUNTER; id_j= id_j+1)
                begin
                    reg_overflow[id_j] <= reg_overflow_next[id_j]; 
                    reg_remain_quantum[id_j] <= reg_remain_quantum_next[id_j];
                    reg_round[id_j] <= reg_round_next[id_j];
                end
             
            reg_calced_rank <= reg_calced_rank_next;
            reg_pifo_info <= 0;
        end
    else
        begin     
            reg_dp1_valid_out<=0;
            reg_dp2_valid_out<=0;
            reg_dp3_valid_out<=0;
            reg_dp4_valid_out<=0;
            reg_dp5_valid_out<=0;
            reg_dp6_valid_out<=0;
            
            reg_input_id1 <= 0;
            reg_input_id2 <= 0;
            reg_input_id3 <= 0;
            reg_input_id4 <= 0;
            reg_input_id5 <= 0;
            reg_input_id6 <= 0;
            
            
            reg_calced_rank <= 0;
            reg_pifo_info <= 0;
            
                   
            for (id_j=0; id_j<ID_COUNTER; id_j= id_j+1)
                begin
                    reg_overflow[id_j] <= 0;
                    reg_remain_quantum[id_j] <= 0;
                    reg_round[id_j] <= 0;
                end
        end
end

//Control-Plane Posedge Signal Handling
always @(posedge clk_cp)
begin
    if (~rst)
        begin
            reg_cp_out_index <= reg_cp_out_index_next;
            reg_cp_out_val <= reg_cp_out_val_next;
            reg_out_valid_cp <= reg_out_valid_cp_next;
            
            for (id_j=0; id_j<=ID_COUNTER-1; id_j= id_j+1)
                begin
                reg_config_quantum[id_j] <= reg_config_quantum_next[id_j];
                end
        end
    else
        begin
            reg_cp_out_index <= 0;
            reg_cp_out_val <= 0;
            reg_out_valid_cp <= 0; 
            
            for (id_j=0; id_j<=ID_COUNTER-1; id_j= id_j+1)
                begin
                    reg_config_quantum[id_j] <= 1;
                end
        end    
end

assign tuple_out_my_pifo_rank_calc_output_VALID = reg_dp6_valid_out;
assign tuple_out_my_pifo_rank_calc_output_DATA  = {reg_dp6_valid_out,reg_calced_rank,reg_pifo_info};

assign wire_out_cpu_index = reg_cp_out_index;
assign wire_out_cpu_val  =  reg_cp_out_val;
assign wire_out_cpu_valid = reg_out_valid_cp;

endmodule
