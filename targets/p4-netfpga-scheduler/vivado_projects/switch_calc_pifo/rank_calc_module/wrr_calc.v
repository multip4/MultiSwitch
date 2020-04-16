`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/04/2020 03:37:22 AM
// Design Name: 
// Module Name: wrr_without_blkmem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module wrr_without_blkmem#(
   parameter INPUT_PORT_INFO_WIDTH = 8,   //Input port data which is defined in 8-bit array(sume.p4) .
   parameter PORT_ID_WIDTH = 3, // Port ID
   parameter PORT_ID_COUNTER = 5,  // nf0, nf1, nf2, nf3, DMA 
   parameter CLASS_WIDTH = 5, // Each Port support 32 classes which is obvoisly defined as 5 bit.
   parameter CLASS_COUNTER = 32, // Each port support maxmum 32 classes. 
   parameter RESULT_WIDTH = 32, // Result conduct with 32 bit array (VALID_bit 1bit RANK_INFO 19-bit Other INFO 12-bit)
   parameter RANK_WIDTH = 19, // Rank Width is 19 bit
   parameter ROUND_WIDTH = 11, // Round Maximum width is defined in 11 bit.
   parameter OVER_FLOW_WIDTH = 2, // We support 2 extra over flow bit to allow not  
   parameter COUNTER_WIDTH = 8, //read and write data length(number 0 to 256).
   parameter CPU_INDEX_WIDTH = 8, // CPU Index is conduct with 3-bit address and 5-bit classes. 
   parameter CPU_WRITE_WIDTH = 8, // WRR Config Write WIDTH
   parameter CPU_OUT_WIDTH = OVER_FLOW_WIDTH +COUNTER_WIDTH + COUNTER_WIDTH + ROUND_WIDTH, //OverFlow(2)+Round(11) + Config Weight(8) + Weight(8) 
   parameter ID_WIDTH = PORT_ID_WIDTH + CLASS_WIDTH,
   parameter ID_COUNTER = PORT_ID_COUNTER * CLASS_COUNTER,
   parameter PIFO_INFO_WIDTH = 12,
   parameter MAX_ROUND_VALUE = 11'b11111111111    
)
(

    /*
    I/O Shares in both dp and cp.
    */
    input                                   rst, 
    //Define Input value.
    /*
    I/O From P4 Pipe line
    */
    input                                   clk_dp,
    input                                   tuple_in_my_pifo_rank_calc_input_VALID,
    input   [INPUT_PORT_INFO_WIDTH+CLASS_WIDTH-1:0]    tuple_in_my_pifo_rank_calc_input_DATA,
    output                                  tuple_out_my_pifo_rank_calc_output_VALID,
    output  [RESULT_WIDTH-1:0]              tuple_out_my_pifo_rank_calc_output_DATA,
        
    /*
    Input Wire From PIFO Scheduler 
    */    
    input   [RESULT_WIDTH-1:0]              wire_in_last_pkt_info0,
    input   [RESULT_WIDTH-1:0]              wire_in_last_pkt_info1,
    input   [RESULT_WIDTH-1:0]              wire_in_last_pkt_info2,
    input   [RESULT_WIDTH-1:0]              wire_in_last_pkt_info3,
    input   [RESULT_WIDTH-1:0]              wire_in_last_pkt_info4,
      
    /*
    I/O From CPU Channel.  
    */
    input                                   clk_cp,
    input   [CPU_INDEX_WIDTH -1:0]          wire_in_cpu_write_index,
    input                                   wire_in_cpu_write_sig,
    input   [CPU_WRITE_WIDTH -1 :0]         wire_in_cpu_config_write,
    input                                   wire_in_cpu_read_sig,
    input   [CPU_INDEX_WIDTH -1:0]          wire_in_cpu_read_index,
    output   [CPU_INDEX_WIDTH -1:0]         wire_out_cpu_index,
    output   [CPU_OUT_WIDTH -1:0]           wire_out_cpu_val,
    output                                  wire_out_cpu_valid
);

/*Data Plane Register*/
reg [OVER_FLOW_WIDTH-1:0]                   reg_overflow [ID_COUNTER-1:0];
reg [ROUND_WIDTH-1:0]                       reg_round [ID_COUNTER-1:0];
reg [COUNTER_WIDTH-1:0]                     reg_weight [ID_COUNTER-1:0];
reg [COUNTER_WIDTH-1:0]                     reg_config_weight [ID_COUNTER-1:0];
reg [PIFO_INFO_WIDTH-1:0]                   reg_pifo_info;
reg                                         reg_out_valid_dp;
reg [RANK_WIDTH-1:0]                        reg_calced_rank;
/*Data Plane Combinational Output*/
reg [OVER_FLOW_WIDTH-1:0]                   reg_overflow_next [ID_COUNTER-1:0];
reg [ROUND_WIDTH-1:0]                       reg_round_next [ID_COUNTER-1:0];
reg [COUNTER_WIDTH-1:0]                     reg_weight_next [ID_COUNTER-1:0];
reg [COUNTER_WIDTH-1:0]                     reg_config_weight_next [ID_COUNTER-1:0];
reg [RANK_WIDTH-1:0]                        reg_calced_rank_next;
reg [PIFO_INFO_WIDTH-1:0]                   reg_pifo_info_next;
reg [ID_WIDTH-1:0]                          input_id;
reg [PORT_ID_WIDTH-1:0]                     input_port_id;

/*Control Plane Register*/
reg                                         reg_out_valid_cp;
reg [CPU_OUT_WIDTH-1:0]                     reg_cp_out_val;
reg [ID_WIDTH-1:0]                          reg_cp_out_index;
/*Data Plane Combinational Output*/
reg [CPU_OUT_WIDTH-1:0]                     reg_cp_out_val_next;
reg [ID_WIDTH-1:0]                          reg_cp_out_index_next;
reg                                         reg_out_valid_cp_next;      
reg                                         reg_out_valid_dp_next;
    

reg [OVER_FLOW_WIDTH-1:0]                   reg_overflow_combi [ID_COUNTER-1:0];
reg [ROUND_WIDTH-1:0]                       reg_round_combi [ID_COUNTER-1:0];
reg [COUNTER_WIDTH-1:0]                     reg_weight_combi [ID_COUNTER-1:0];




// Wire From DP Interface. 
wire [ROUND_WIDTH-1:0]                       wire_last_round [PORT_ID_COUNTER-1:0];
wire [OVER_FLOW_WIDTH-1:0]                   wire_last_overflow [PORT_ID_COUNTER-1:0];

wire[INPUT_PORT_INFO_WIDTH-1:0]             input_port = tuple_in_my_pifo_rank_calc_input_DATA[INPUT_PORT_INFO_WIDTH+CLASS_WIDTH-1:CLASS_WIDTH];
wire[CLASS_WIDTH-1:0]                       input_class = tuple_in_my_pifo_rank_calc_input_DATA[CLASS_WIDTH-1:0];
wire                                        valid_in       = tuple_in_my_pifo_rank_calc_input_VALID;
wire                                        wire_last_dq_info_update; 
integer id_i, id_j,counter;      

//Get last Rond From Output Queue

assign wire_last_dq_info_update = wire_in_last_pkt_info0[31] || wire_in_last_pkt_info1 [31] || wire_in_last_pkt_info2[31]|| wire_in_last_pkt_info3[31];

assign wire_last_round[0]  = wire_in_last_pkt_info0 [ROUND_WIDTH + CLASS_WIDTH +PIFO_INFO_WIDTH-1:CLASS_WIDTH +PIFO_INFO_WIDTH];
assign wire_last_round[1] =  wire_in_last_pkt_info1 [ROUND_WIDTH + CLASS_WIDTH +PIFO_INFO_WIDTH-1:CLASS_WIDTH +PIFO_INFO_WIDTH];
assign wire_last_round[2] =  wire_in_last_pkt_info2 [ROUND_WIDTH + CLASS_WIDTH +PIFO_INFO_WIDTH-1:CLASS_WIDTH +PIFO_INFO_WIDTH];
assign wire_last_round[3] =  wire_in_last_pkt_info3 [ROUND_WIDTH + CLASS_WIDTH +PIFO_INFO_WIDTH-1:CLASS_WIDTH +PIFO_INFO_WIDTH];
assign wire_last_round[4] =  wire_in_last_pkt_info4 [ROUND_WIDTH + CLASS_WIDTH +PIFO_INFO_WIDTH-1:CLASS_WIDTH +PIFO_INFO_WIDTH];

assign wire_last_overflow[0]  = wire_in_last_pkt_info0 [OVER_FLOW_WIDTH + ROUND_WIDTH+CLASS_WIDTH +PIFO_INFO_WIDTH-1:ROUND_WIDTH+CLASS_WIDTH +PIFO_INFO_WIDTH];
assign wire_last_overflow[1] =  wire_in_last_pkt_info1 [OVER_FLOW_WIDTH + ROUND_WIDTH+CLASS_WIDTH +PIFO_INFO_WIDTH-1:ROUND_WIDTH+CLASS_WIDTH +PIFO_INFO_WIDTH];
assign wire_last_overflow[2] =  wire_in_last_pkt_info2 [OVER_FLOW_WIDTH + ROUND_WIDTH+CLASS_WIDTH +PIFO_INFO_WIDTH-1:ROUND_WIDTH+CLASS_WIDTH +PIFO_INFO_WIDTH];
assign wire_last_overflow[3] =  wire_in_last_pkt_info3 [OVER_FLOW_WIDTH + ROUND_WIDTH+CLASS_WIDTH +PIFO_INFO_WIDTH-1:ROUND_WIDTH+CLASS_WIDTH +PIFO_INFO_WIDTH];
assign wire_last_overflow[4] =  wire_in_last_pkt_info4 [OVER_FLOW_WIDTH + ROUND_WIDTH+CLASS_WIDTH +PIFO_INFO_WIDTH-1:ROUND_WIDTH+CLASS_WIDTH +PIFO_INFO_WIDTH];


//WRR Combinational Logic
always @(*)
begin

reg_out_valid_dp_next = valid_in;

//Change Last Overlfow and round to dequeued packet information if smaller than dequeue information.
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
                                reg_weight_combi[id_j] =   0;  
                            end
                         else
                            begin
                                reg_overflow_combi[id_j] =  reg_overflow[id_j]; //OverFlow No need to change.
                                if ((wire_last_overflow[id_i]== reg_overflow[id_j])&&(wire_last_round[id_i]>reg_round[id_j]))
                                    begin
                                        reg_round_combi[id_j] = wire_last_round[id_i];
                                        reg_weight_combi[id_j] =   0;
                                    end
                                else
                                    begin
                                        reg_round_combi[id_j] = reg_round[id_j];
                                        reg_weight_combi[id_j] =  reg_weight[id_j];
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
                reg_weight_combi[id_j] =   reg_weight[id_j];
            end
    end

/*
8-bit port information transition to 3-bit 
*/
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
    
    // Conduct Address by add 3-bit port and 5-bit class id
    input_id = {input_port_id, input_class};
    
    for (id_j=0; id_j<=ID_COUNTER-1; id_j= id_j+1)
        begin
            /*
            * If the id is same with P4 input data id. Run WRR Logic
            * Else Keep original value.  
            */
            if (id_j == input_id) // Run WRR Logic is ID is same
                begin
                // WRR-Logic 1: If Current Weight is smaller than Config weight add Counter 1
                    if (reg_weight[id_j] < reg_config_weight[id_j])
                        begin
                            reg_weight_next[id_j] = reg_weight_combi[id_j] +1;
                            reg_round_next[id_j] =  reg_round_combi[id_j];
                            reg_overflow_next[id_j] = reg_overflow_combi[id_j];                                               
                        end
                    else
                        // WRR-Logic 2: If Current Weight is bigger than Config weight Change Counter to 1, add 1 round
                        begin
                            if (reg_round[id_j]<MAX_ROUND_VALUE)
                                begin
                                  reg_weight_next[id_j] = 'd1;
                                  reg_round_next[id_j] = reg_round_combi[id_j] + 1;
                                  reg_overflow_next[id_j] = reg_overflow_combi[id_j];
                                end
                            else
                            // Handling Overflow
                                begin
                                  reg_weight_next[id_j] = 'd1;
                                  reg_round_next[id_j] = 'd1;
                                  reg_overflow_next[id_j] = reg_overflow_combi[id_j] +1; 
                                end 
                       end
                    end
                                     
            else // If id is not same keep original value. 
                begin           
                    reg_weight_next[id_j] = reg_weight_combi[id_j];
                    reg_round_next[id_j] = reg_round_combi[id_j];
                    reg_overflow_next[id_j] = reg_overflow_combi[id_j];
                end 
            end
          //final output.      
          reg_calced_rank_next = {reg_overflow_next[input_id],reg_round_next[input_id],input_class};          
      end
else
    begin
    reg_calced_rank_next = 0;
    input_id = 0;
    input_port_id = 0;
    
    for (id_j=0; id_j<=ID_COUNTER-1; id_j= id_j+1)
        begin
            reg_weight_next[id_j] = reg_weight_combi[id_j];
            reg_round_next[id_j] = reg_round_combi[id_j];
            reg_overflow_next[id_j] = reg_overflow_combi[id_j];
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
                reg_config_weight_next [wire_in_cpu_write_index] = wire_in_cpu_config_write;
                end
            else
                begin
                reg_config_weight_next[id_j] = reg_config_weight[id_j];
                end
            end
        
        end
    else if (wire_in_cpu_read_sig)
        begin
        reg_cp_out_index_next =  wire_in_cpu_read_index;
        reg_cp_out_val_next = {reg_overflow[wire_in_cpu_read_index],reg_round[wire_in_cpu_read_index], reg_config_weight[wire_in_cpu_read_index], reg_weight[wire_in_cpu_read_index]};
        
        for (id_j=0; id_j<=ID_COUNTER-1; id_j= id_j+1)
            begin
            reg_config_weight_next[id_j] = reg_config_weight[id_j];
            end
        end
    
    else
        begin
        reg_cp_out_index_next =  0;
        reg_cp_out_val_next = 0;
        
        for (id_j=0; id_j<=ID_COUNTER-1; id_j= id_j+1)
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
        
        for (id_j=0; id_j<=ID_COUNTER-1; id_j= id_j+1)
            begin
            reg_config_weight[id_j] <= reg_config_weight_next[id_j];
            end
        end
    else
        begin
        reg_cp_out_index <= 0;
        reg_cp_out_val <= 0;
        reg_out_valid_cp <= 0; 
        
        for (id_j=0; id_j<=ID_COUNTER-1; id_j= id_j+1)
            begin
            reg_config_weight[id_j] <= 1;
            end
    end    
end

//Data-Plane Posedge Signal Handling
always @(posedge clk_dp)
begin

if (~rst)
    begin
    reg_calced_rank <= reg_calced_rank_next;
    reg_out_valid_dp <= reg_out_valid_dp_next;
    reg_pifo_info <= 0;   
   
    for (id_j=0; id_j<=ID_COUNTER-1; id_j= id_j+1)
        begin
        reg_overflow[id_j] <= reg_overflow_next[id_j];
        reg_round[id_j] <= reg_round_next[id_j];
        reg_weight[id_j] <= reg_weight_next[id_j];
        end
    end
    
else
    begin
    reg_calced_rank <= 0;
    reg_pifo_info <= 0;
    reg_out_valid_dp <=0;
           
    for (id_j=0; id_j<=ID_COUNTER-1; id_j= id_j+1)
        begin
        reg_round[id_j] <= 0;
        reg_weight[id_j] <= 0;
        reg_overflow[id_j] <= 0;
        end
    end       
end

assign tuple_out_my_pifo_rank_calc_output_VALID = reg_out_valid_dp;
assign tuple_out_my_pifo_rank_calc_output_DATA  = {reg_out_valid_dp,reg_calced_rank,reg_pifo_info};

assign wire_out_cpu_index = reg_cp_out_index;
assign wire_out_cpu_val  = reg_cp_out_val;
assign wire_out_cpu_valid = reg_out_valid_cp;

endmodule
