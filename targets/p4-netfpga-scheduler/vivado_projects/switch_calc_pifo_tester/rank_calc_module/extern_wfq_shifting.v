`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/25/2020 06:51:45 AM
// Design Name: 
// Module Name: extern_wfq
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


module extern_wfq#(
    parameter PORT_WIDTH = 8,
    parameter PORT_ID_WIDTH = 3,
    parameter PORT_ID_LENGHT = 5,
	parameter CLASS_WIDTH = 5,
	parameter PKT_SIZE_WIDTH = 11,
	parameter CLASS_LENGHT = 32,
    parameter RESULT_WIDTH = 32,
    parameter MEM_WIDTH = 64,
    parameter ROUND_WIDTH = 20,
    parameter COUNTER_WIDTH = 7, //read and write data length(number 0 to 256).
    parameter CPU_INDEX_WIDTH = 8,
    parameter CPU_WRITE_WIDTH = 8,
    parameter CPU_OUT_WIDTH = COUNTER_WIDTH + ROUND_WIDTH,
    parameter ID_WIDTH = PORT_ID_WIDTH + CLASS_WIDTH,
    parameter ID_LENGHT = PORT_ID_LENGHT * CLASS_LENGHT,
    parameter PIFO_INFO_WIDTH = 12
    
)
(
    //Define Input value.
    input                                   clk_dp,
    input                                   rst, 
    input                                   tuple_in_my_pifo_rank_calc_input_VALID,
    input   [PORT_WIDTH+CLASS_WIDTH +PKT_SIZE_WIDTH-1:0]    tuple_in_my_pifo_rank_calc_input_DATA,
    output                                  tuple_out_my_pifo_rank_calc_output_VALID,
    output  [RESULT_WIDTH-1:0]              tuple_out_my_pifo_rank_calc_output_DATA,
    
    input   [RESULT_WIDTH-1:0]              wire_in_last_pkt_info0,
    input   [RESULT_WIDTH-1:0]              wire_in_last_pkt_info1,
    input   [RESULT_WIDTH-1:0]              wire_in_last_pkt_info2,
    input   [RESULT_WIDTH-1:0]              wire_in_last_pkt_info3,
    input   [RESULT_WIDTH-1:0]              wire_in_last_pkt_info4,
    
    input                                   clk_cp,
    input                                   wire_in_cpu_valid,
    input   [CPU_INDEX_WIDTH -1:0]          wire_in_cpu_index,
    input                                   wire_in_cpu_write_sig,
    input   [CPU_WRITE_WIDTH -1 :0]         wire_in_cpu_config_write,
    input                                   wire_in_cpu_read_sig,
    output   [CPU_INDEX_WIDTH -1:0]         wire_out_cpu_index,
    output   [CPU_INDEX_WIDTH -1:0]         wire_out_cpu_val,
    output                                  wire_out_cpu_valid
);

reg [ROUND_WIDTH-1:0]     reg_round [ID_LENGHT-1:0];
reg [COUNTER_WIDTH-1:0]   reg_config_weight [ID_LENGHT-1:0];
reg [ROUND_WIDTH-1:0]     reg_last_round [RESULT_WIDTH-1:0];

reg [PIFO_INFO_WIDTH-1:0] reg_pifo_info;

reg [CLASS_WIDTH+PORT_ID_WIDTH + ROUND_WIDTH-1:0]     reg_calced_rank;
reg                    valid_out_dp1,valid_out_dp2;
reg                    valid_out_cp;

reg [CPU_OUT_WIDTH-1:0] reg_cp_out_val;
reg [ID_WIDTH-1:0] reg_cp_out_index;       

reg [ID_WIDTH-1:0]         reg_input_id;
reg [PORT_ID_WIDTH-1:0]    input_port_id;

reg [ROUND_WIDTH-1:0]     reg_round_next [ID_LENGHT-1:0];
reg [COUNTER_WIDTH-1:0]   reg_config_weight_next [ID_LENGHT-1:0];
reg [ROUND_WIDTH-1:0]     reg_last_round_next [ID_LENGHT-1:0];
reg [ID_WIDTH-1:0]        reg_input_id_next;
reg                       valid_out_dp1_next,valid_out_dp2_next;

reg [CLASS_WIDTH+PORT_ID_WIDTH + ROUND_WIDTH-1:0]     reg_calced_rank_next;
reg [CPU_OUT_WIDTH-1:0]                   reg_cp_out_val_next;
reg [ID_WIDTH-1:0]                       reg_cp_out_index_next;
reg                                       valid_out_cp_next;          

// p4 interf
wire[PKT_SIZE_WIDTH-1:0] input_pkt_size = tuple_in_my_pifo_rank_calc_input_DATA[PORT_WIDTH+CLASS_WIDTH+PKT_SIZE_WIDTH-1:PORT_WIDTH+CLASS_WIDTH];
wire[PORT_WIDTH-1:0]   input_port = tuple_in_my_pifo_rank_calc_input_DATA[PORT_WIDTH+CLASS_WIDTH-1:CLASS_WIDTH];
wire[CLASS_WIDTH-1:0]  input_class = tuple_in_my_pifo_rank_calc_input_DATA[CLASS_WIDTH-1:0];
wire                   valid_in       = tuple_in_my_pifo_rank_calc_input_VALID;

wire  [ID_WIDTH-1:0]         wire_input_id; 
wire  [ROUND_WIDTH-1:0] wire_round_to_add;
wire  [PKT_SIZE_WIDTH-1:0] wire_remain_to_minus;
wire                        valid_r;

integer port_id_i, id_j;


div_calculator mydivision(
.clk(clk_dp),
.dataInDvsReady(valid_out_dp1),
.dataInDvs(reg_config_weight[reg_input_id1]),
.dataInDvdReady(valid_out_dp1),
.dataInDvd(input_pkt_size),
.dataOutquo(wire_round_to_add),
.dataOutrem(wire_remain_to_minus),
.dataDoutready(valid_r)
);

//Get last Rond Combinational Logic
always @(*)
begin
reg_last_round_next[0]  = wire_in_last_pkt_info0 [ROUND_WIDTH + CLASS_WIDTH +PIFO_INFO_WIDTH-1:CLASS_WIDTH +PIFO_INFO_WIDTH];
reg_last_round_next[1] =  wire_in_last_pkt_info1 [ROUND_WIDTH + CLASS_WIDTH +PIFO_INFO_WIDTH-1:CLASS_WIDTH +PIFO_INFO_WIDTH];
reg_last_round_next[2] =  wire_in_last_pkt_info2 [ROUND_WIDTH + CLASS_WIDTH +PIFO_INFO_WIDTH-1:CLASS_WIDTH +PIFO_INFO_WIDTH];
reg_last_round_next[3] =  wire_in_last_pkt_info3 [ROUND_WIDTH + CLASS_WIDTH +PIFO_INFO_WIDTH-1:CLASS_WIDTH +PIFO_INFO_WIDTH];
reg_last_round_next[4] =  wire_in_last_pkt_info4 [ROUND_WIDTH + CLASS_WIDTH +PIFO_INFO_WIDTH-1:CLASS_WIDTH +PIFO_INFO_WIDTH];
end

//WRR Combinational Logic
always @(*)
begin

valid_out_dp1_next = valid_in;
valid_out_dp2_next <= valid_out_dp1;



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
    reg_input_id_next = {input_port_id, input_class}; 
    reg_calced_rank_next = 0;
    for (id_j=0; id_j<=ID_LENGHT-1; id_j= id_j+1)
        begin
        reg_round_next[id_j] = reg_round[id_j];
        end
    end
        
else if (valid_out_dp1)
    if (reg_round[reg_input_id] < reg_last_round[reg_input_id])
        begin
        for (id_j=0; id_j<=ID_LENGHT-1; id_j= id_j+1)
            begin          
            if (id_j == reg_input_id)
                begin
                reg_round_next[id_j] = reg_last_round[id_j] + input_pkt_size<<reg_config_weight[reg_input_id];
                end
            else
                begin
                reg_round_next[id_j] = reg_round[id_j];
                end
            end
            
        reg_calced_rank_next = {input_class,reg_round_next[reg_input_id]};
        end
    else
        begin
        for (id_j=0; id_j<=ID_LENGHT-1; id_j= id_j+1)
            begin
            if (id_j == reg_input_id)
                begin
                reg_round_next[id_j] = reg_round[id_j] + input_pkt_size<<reg_config_weight[reg_input_id];
                end
            else
                begin
                reg_round_next[id_j] = reg_round[id_j];
                end
            end
        reg_calced_rank_next = {input_class,reg_round_next[reg_input_id]};
        end
    
    
else
    reg_calced_rank_next = 0;
    for (id_j=0; id_j<=ID_LENGHT-1; id_j= id_j+1)
        begin
        reg_round_next[id_j] = reg_round[id_j];
        end
end

//Control plane signal handling
always @(*)
begin
    valid_out_cp_next = wire_in_cpu_valid;   
    if (wire_in_cpu_write_sig)
        begin
        reg_cp_out_index_next =  wire_in_cpu_index;
        reg_cp_out_val_next = {reg_round[wire_in_cpu_index], reg_config_weight[wire_in_cpu_index]};
        
        for (id_j=0; id_j<=ID_LENGHT-1; id_j= id_j+1)
            begin
            
            if (id_j == wire_in_cpu_index)
                begin
                reg_config_weight_next [wire_in_cpu_index] = wire_in_cpu_config_write;
                end
            else
                begin
                reg_config_weight_next[id_j] = reg_config_weight[id_j];
                end
            end
        
        end
    else if (wire_in_cpu_read_sig)
        begin
        reg_cp_out_index_next =  wire_in_cpu_index;
        reg_cp_out_val_next = {reg_round[wire_in_cpu_index], reg_config_weight[wire_in_cpu_index]};
        
        for (id_j=0; id_j<=ID_LENGHT-1; id_j= id_j+1)
            begin
            reg_config_weight_next[id_j] = reg_config_weight[id_j];
            end
        end
    
    else
        begin
        reg_cp_out_index_next =  0;
        reg_cp_out_val_next = 0;
        
        for (id_j=0; id_j<=ID_LENGHT-1; id_j= id_j+1)
            begin
            reg_config_weight_next[id_j] = reg_config_weight[id_j];
            end
        end      
end



always @(posedge clk_dp)
begin
    if (~rst)
        begin   
        for (port_id_i=0; port_id_i<=PORT_ID_LENGHT-1; port_id_i= port_id_i+1)
            begin
            reg_last_round[port_id_i] <= reg_last_round_next[port_id_i];
            end
       
        for (id_j=0; id_j<=ID_LENGHT-1; id_j= id_j+1)
            begin
            reg_round[id_j] <= reg_round_next[id_j];
            end
    
        reg_calced_rank <= reg_calced_rank_next;
        valid_out_dp1 <= valid_out_dp1_next;
        valid_out_dp2 <= valid_out_dp2_next;
        reg_pifo_info <= 0;
        end
    else
        begin
        
        valid_out_dp1 <= 0;
        valid_out_dp2 <= 0;
       
        reg_calced_rank <= 0;
        reg_pifo_info <= 0;
        
        for (port_id_i=0; port_id_i<=PORT_ID_LENGHT-1; port_id_i= port_id_i+1)
            begin
            reg_last_round[port_id_i] <= 0;
            end
               
        for (id_j=0; id_j<=ID_LENGHT-1; id_j= id_j+1)
            begin
            reg_round[id_j] <= 0;
            end
        end    
end

always @(posedge clk_cp)
begin
    if (~rst)
        begin
        reg_cp_out_index <= reg_cp_out_index_next;
        reg_cp_out_val <= reg_cp_out_val_next;
        valid_out_cp <= valid_out_cp_next;
        
        for (id_j=0; id_j<=ID_LENGHT-1; id_j= id_j+1)
            begin
            reg_config_weight[id_j] <= reg_config_weight_next[id_j];
            end
        end
    else
        begin
        reg_cp_out_index <= 0;
        reg_cp_out_val_next <= 0;
        valid_out_cp <= 0; 
        
        for (id_j=0; id_j<=ID_LENGHT-1; id_j= id_j+1)
            begin
            reg_config_weight[id_j] <= 0;
            end
    end    
end

assign tuple_out_my_pifo_rank_calc_output_VALID = valid_out_dp2;
assign tuple_out_my_pifo_rank_calc_output_DATA  = {valid_out_dp2,reg_calced_rank,reg_pifo_info};

assign wire_out_cpu_index = reg_cp_out_index;
assign wire_out_cpu_val  = reg_cp_out_val_next;
assign wire_out_cpu_valid = valid_out_cp;

endmodule
