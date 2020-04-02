`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Korea Univ
// Engineer:  Forest.1000
// Create Date: 02/04/2020 03:37:22 AM
// Module Name: wrr_calc
// Project Name: 
// Target Devices: SUME FPGA Device 
// Description:  Weighted Round Robin Models
// Revision: 
// Revision 0.8 - File is fully tested.
// Additional Comments:
// 1)Over Flow Design is not added yet.
// 2)Commentary Needs to be added on script.
//////////////////////////////////////////////////////////////////////////////////

module wrr_calc#(
   parameter PORT_WIDTH = 8,   //8-bit port array which is defined sume.p4 .
   parameter PORT_ID_WIDTH = 3,
   parameter PORT_ID_LENGHT = 5,
   parameter CLASS_WIDTH = 5,
   parameter CLASS_LENGHT = 32,
   parameter RESULT_WIDTH = 32,
   parameter RANK_WIDTH = 19,
   parameter MEM_WIDTH = 64,
   parameter ROUND_WIDTH = 11,
   parameter COUNTER_WIDTH = 8, //read and write data length(number 0 to 256).
   parameter CPU_INDEX_WIDTH = 8,
   parameter CPU_WRITE_WIDTH = 8,
   parameter CPU_OUT_WIDTH = COUNTER_WIDTH + COUNTER_WIDTH + ROUND_WIDTH,
   parameter ID_WIDTH = PORT_ID_WIDTH + CLASS_WIDTH,
   parameter ID_LENGHT = PORT_ID_LENGHT * CLASS_LENGHT,
   parameter PIFO_INFO_WIDTH = 12    
)
(
    //Define Input value.
    input                                   clk_dp,
    input                                   rst, 
    input                                   tuple_in_my_pifo_rank_calc_input_VALID,
    input   [PORT_WIDTH+CLASS_WIDTH-1:0]    tuple_in_my_pifo_rank_calc_input_DATA,
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
    output   [CPU_OUT_WIDTH -1:0]           wire_out_cpu_val,
    output                                  wire_out_cpu_valid
);

reg [ROUND_WIDTH-1:0]     reg_round [ID_LENGHT-1:0];
reg [COUNTER_WIDTH-1:0]   reg_weight [ID_LENGHT-1:0];
reg [COUNTER_WIDTH-1:0]   reg_config_weight [ID_LENGHT-1:0];

reg [ROUND_WIDTH-1:0]     reg_round_next [ID_LENGHT-1:0];
reg [COUNTER_WIDTH-1:0]   reg_weight_next [ID_LENGHT-1:0];
reg [COUNTER_WIDTH-1:0]   reg_config_weight_next [ID_LENGHT-1:0];

reg [PIFO_INFO_WIDTH-1:0] reg_pifo_info;

reg [RANK_WIDTH-1:0]     reg_calced_rank;
reg                    reg_out_valid_dp,reg_out_valid_cp;

reg [CPU_OUT_WIDTH-1:0] reg_cp_out_val;
reg [ID_WIDTH-1:0] reg_cp_out_index;       

reg [ID_WIDTH-1:0]        input_id;
reg [PORT_ID_WIDTH-1:0]   input_port_id;

reg                       reg_out_valid_dp_next;

reg [RANK_WIDTH-1:0]                    reg_calced_rank_next;
reg [CPU_OUT_WIDTH-1:0]                 reg_cp_out_val_next;
reg [ID_WIDTH-1:0]                      reg_cp_out_index_next;
reg                                     reg_out_valid_cp_next;          


wire [ROUND_WIDTH-1:0]     wire_last_round [PORT_ID_LENGHT-1:0];


// p4 interf
wire[PORT_WIDTH-1:0]   input_port = tuple_in_my_pifo_rank_calc_input_DATA[PORT_WIDTH+CLASS_WIDTH-1:CLASS_WIDTH];
wire[CLASS_WIDTH-1:0]  input_class = tuple_in_my_pifo_rank_calc_input_DATA[CLASS_WIDTH-1:0];
wire                   valid_in       = tuple_in_my_pifo_rank_calc_input_VALID;

integer port_id_i, id_j;      

//Get last Rond Combinational Logic

assign wire_last_round[0]  = wire_in_last_pkt_info0 [ROUND_WIDTH + CLASS_WIDTH +PIFO_INFO_WIDTH-1:CLASS_WIDTH +PIFO_INFO_WIDTH];
assign wire_last_round[1] =  wire_in_last_pkt_info1 [ROUND_WIDTH + CLASS_WIDTH +PIFO_INFO_WIDTH-1:CLASS_WIDTH +PIFO_INFO_WIDTH];
assign wire_last_round[2] =  wire_in_last_pkt_info2 [ROUND_WIDTH + CLASS_WIDTH +PIFO_INFO_WIDTH-1:CLASS_WIDTH +PIFO_INFO_WIDTH];
assign wire_last_round[3] =  wire_in_last_pkt_info3 [ROUND_WIDTH + CLASS_WIDTH +PIFO_INFO_WIDTH-1:CLASS_WIDTH +PIFO_INFO_WIDTH];
assign wire_last_round[4] =  wire_in_last_pkt_info4 [ROUND_WIDTH + CLASS_WIDTH +PIFO_INFO_WIDTH-1:CLASS_WIDTH +PIFO_INFO_WIDTH];


//WRR Combinational Logic
always @(*)
begin

reg_out_valid_dp_next = valid_in;

if (valid_in)
    begin
    // DP Channel Signal Handling 
    case (input_port)
        'b00000001:
            input_port_id  = 0;
        'b00000100:
            input_port_id  = 1;
        'b00010000:
           input_port_id  =  2;
        'b01000000:
           input_port_id  =  3;
        default : 
            // CPU Port
           input_port_id  =  4;
    endcase
    
    input_id = {input_port_id, input_class};
    
    for (id_j=0; id_j<=ID_LENGHT-1; id_j= id_j+1)
            begin
            if (id_j == input_id)
                begin                  
                // WRR Main Logic
                if (reg_round[id_j] < wire_last_round[input_port_id])
                   begin
                    reg_round_next[id_j] = wire_last_round[input_port_id];
                    reg_weight_next[id_j] = 'd1;
                   end
                else
                   begin
                   if (reg_weight[id_j] < reg_config_weight[id_j])
                       begin
                        reg_weight_next[id_j] = reg_weight[id_j] +1;
                        reg_round_next[id_j] = reg_round[id_j];
                                                                        
                       end
                   else
                       begin
                        reg_weight_next[id_j] = 'd1;
                        reg_round_next[id_j] = reg_round[id_j] + 1;                  
                       end
                   end                                                
                end   
            else
                begin           
                reg_weight_next[id_j] = reg_weight[id_j];
                reg_round_next[id_j] = reg_round[id_j];
                end 
            end
          //final output check.      
          reg_calced_rank_next = {input_class,reg_round_next[input_id]};
                   
    end
else
    begin
    reg_calced_rank_next = 0;
    input_id = 0;
    input_port_id = 0;
    
    for (id_j=0; id_j<=ID_LENGHT-1; id_j= id_j+1)
        begin
        reg_weight_next[id_j] = reg_weight[id_j];
        reg_round_next[id_j] = reg_round[id_j];
        end
    end 
end

//Control plane signal handling
always @(*)
begin
    reg_out_valid_cp_next = wire_in_cpu_valid;   
    if (wire_in_cpu_write_sig)
        begin
        reg_cp_out_index_next =  wire_in_cpu_index;
        reg_cp_out_val_next = {reg_round[wire_in_cpu_index], wire_in_cpu_config_write, reg_weight[wire_in_cpu_index]};
        
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
        reg_cp_out_val_next = {reg_round[wire_in_cpu_index], reg_config_weight[wire_in_cpu_index], reg_weight[wire_in_cpu_index]};
        
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


//Control-Plane Posedge Signal Handling
always @(posedge clk_cp)
begin
    if (~rst)
        begin
        reg_cp_out_index <= reg_cp_out_index_next;
        reg_cp_out_val <= reg_cp_out_val_next;
        reg_out_valid_cp <= reg_out_valid_cp_next;
        
        for (id_j=0; id_j<=ID_LENGHT-1; id_j= id_j+1)
            begin
            reg_config_weight[id_j] <= reg_config_weight_next[id_j];
            end
        end
    else
        begin
        reg_cp_out_index <= 0;
        reg_cp_out_val <= 0;
        reg_out_valid_cp <= 0; 
        
        for (id_j=0; id_j<=ID_LENGHT-1; id_j= id_j+1)
            begin
            reg_config_weight[id_j] <= 0;
            end
    end    
end

//Data-Plane Posedge Signal Handling
always @(posedge clk_dp)
begin

if (~rst)
    begin
    reg_calced_rank <= reg_calced_rank_next;
    reg_out_valid_dp = reg_out_valid_dp_next;
    reg_pifo_info <= 0;   
   
    for (id_j=0; id_j<=ID_LENGHT-1; id_j= id_j+1)
        begin
        reg_round[id_j] <= reg_round_next[id_j];
        reg_weight[id_j] <= reg_weight_next[id_j];
        end
    end
    
else
    begin
    reg_calced_rank <= 0;
    reg_pifo_info <= 0;
           
    for (id_j=0; id_j<=ID_LENGHT-1; id_j= id_j+1)
        begin
        reg_round[id_j] <= 0;
        reg_weight[id_j] <= 0;
        end
    end       
end

assign tuple_out_my_pifo_rank_calc_output_VALID = reg_out_valid_dp_next;
assign tuple_out_my_pifo_rank_calc_output_DATA  = {reg_out_valid_dp,reg_calced_rank,reg_pifo_info};

assign wire_out_cpu_index = reg_cp_out_index;
assign wire_out_cpu_val  = reg_cp_out_val;
assign wire_out_cpu_valid = reg_out_valid_cp;

endmodule
