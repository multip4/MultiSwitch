//
// Copyright (c) 2017 Stephen Ibanez
// All rights reserved.
//
// This software was developed by Stanford University and the University of Cambridge Computer Laboratory 
// under National Science Foundation under Grant No. CNS-0855268,
// the University of Cambridge Computer Laboratory under EPSRC INTERNET Project EP/H040536/1 and
// by the University of Cambridge Computer Laboratory under DARPA/AFRL contract FA8750-11-C-0249 ("MRC2"), 
// as part of the DARPA MRC research programme.
//
// @NETFPGA_LICENSE_HEADER_START@
//
// Licensed to NetFPGA C.I.C. (NetFPGA) under one or more contributor
// license agreements.  See the NOTICE file distributed with this work for
// additional information regarding copyright ownership.  NetFPGA licenses this
// file to you under the NetFPGA Hardware-Software License, Version 1.0 (the
// "License"); you may not use this file except in compliance with the
// License.  You may obtain a copy of the License at:
//
//   http://www.netfpga-cic.org
//
// Unless required by applicable law or agreed to in writing, Work distributed
// under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations under the License.
//
// @NETFPGA_LICENSE_HEADER_END@


/*
 * File: rankcalc_wrr_calc_0_t.v 
 * Author: Lin Qian
 *  
 * extern function test with dummy verilog module
 * Description: implements a dummy verilog module for extern function
 */


`timescale 1 ps / 1 ps
module rankcalc_wrr_calc_0_t #(
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
   parameter MAX_ROUND_VALUE = 11'b11111111111,
   parameter C_S_AXI_ADDR_WIDTH = 8,
   parameter C_S_AXI_DATA_WIDTH = RESULT_WIDTH,
   parameter INDEX_WIDTH = 8   
)
(

    /*
    I/O Shares in both dp and cp.
    */
    //Define Input value.
    /*
    I/O From P4 Pipe line
    */
    input                                   clk_lookup,
    input                                   clk_lookup_rst_high, 
    input                                              tuple_in_rankcalc_wrr_calc_input_VALID,
    input   [INPUT_PORT_INFO_WIDTH+CLASS_WIDTH-1:0]    tuple_in_rankcalc_wrr_calc_input_DATA,
    output                                             tuple_out_rankcalc_wrr_calc_output_VALID,
    output  [RESULT_WIDTH-1:0]                         tuple_out_rankcalc_wrr_calc_output_DATA,
        
    /*
    Input Wire From PIFO Scheduler 
    */    
    input   [RESULT_WIDTH-1:0]              wire_in_last_pkt_info0,
    input   [RESULT_WIDTH-1:0]              wire_in_last_pkt_info1,
    input   [RESULT_WIDTH-1:0]              wire_in_last_pkt_info2,
    input   [RESULT_WIDTH-1:0]              wire_in_last_pkt_info3,
    input   [RESULT_WIDTH-1:0]              wire_in_last_pkt_info4,

    
    // Control Path I/O
    input                                     clk_control,
    input                                     clk_control_rst_low,
    input      [C_S_AXI_ADDR_WIDTH-1 : 0]     control_S_AXI_AWADDR,
    input                                     control_S_AXI_AWVALID,
    input      [C_S_AXI_DATA_WIDTH-1 : 0]     control_S_AXI_WDATA,
    input      [C_S_AXI_DATA_WIDTH/8-1 : 0]   control_S_AXI_WSTRB,
    input                                     control_S_AXI_WVALID,
    input                                     control_S_AXI_BREADY,
    input      [C_S_AXI_ADDR_WIDTH-1 : 0]     control_S_AXI_ARADDR,
    input                                     control_S_AXI_ARVALID,
    input                                     control_S_AXI_RREADY,
    output                                    control_S_AXI_ARREADY,
    output     [C_S_AXI_DATA_WIDTH-1 : 0]     control_S_AXI_RDATA,
    output     [1 : 0]                        control_S_AXI_RRESP,
    output                                    control_S_AXI_RVALID,
    output                                    control_S_AXI_WREADY,
    output     [1 :0]                         control_S_AXI_BRESP,
    output                                    control_S_AXI_BVALID,
    output                                    control_S_AXI_AWREADY
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


// CPU reads IP interface
wire     [C_S_AXI_DATA_WIDTH-1:0]          ip2cpu_rankcalc_reg_data;
wire     [CPU_INDEX_WIDTH-1:0]             ip2cpu_rankcalc_reg_index;
wire                                       ip2cpu_rankcalc_reg_valid;

// CPU writes IP interface
wire     [C_S_AXI_DATA_WIDTH-1:0]          cpu2ip_rankcalc_reg_data;
wire     [CPU_INDEX_WIDTH-1:0]             cpu2ip_rankcalc_reg_index;
wire                                       cpu2ip_rankcalc_reg_valid;

// CPU Output IP interface
wire     [CPU_INDEX_WIDTH-1:0]             ipReadReq_rankcalc_reg_index;
wire                                       ipReadReq_rankcalc_reg_valid;



// Wire From DP Interface. 
wire [ROUND_WIDTH-1:0]                       wire_last_round [PORT_ID_COUNTER-1:0];
wire [OVER_FLOW_WIDTH-1:0]                   wire_last_overflow [PORT_ID_COUNTER-1:0];

wire[INPUT_PORT_INFO_WIDTH-1:0]             input_port = tuple_in_rankcalc_wrr_calc_input_DATA[INPUT_PORT_INFO_WIDTH+CLASS_WIDTH-1:CLASS_WIDTH];
wire[CLASS_WIDTH-1:0]                       input_class = tuple_in_rankcalc_wrr_calc_input_DATA[CLASS_WIDTH-1:0];
wire                                        valid_in       = tuple_in_rankcalc_wrr_calc_input_VALID;
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


//// CPU REGS START ////
rankcalc_cpu_regs
#(
    .C_BASE_ADDRESS        (0),
    .C_S_AXI_DATA_WIDTH    (C_S_AXI_DATA_WIDTH),
    .C_S_AXI_ADDR_WIDTH    (C_S_AXI_ADDR_WIDTH)
) rankcalc_cpu_regs_inst
(
  // General ports
   .clk                    ( clk_lookup),
   .resetn                 (~clk_lookup_rst_high),
  // AXI Lite ports
   .S_AXI_ACLK             (clk_control),
   .S_AXI_ARESETN          (clk_control_rst_low),
   .S_AXI_AWADDR           (control_S_AXI_AWADDR),
   .S_AXI_AWVALID          (control_S_AXI_AWVALID),
   .S_AXI_WDATA            (control_S_AXI_WDATA),
   .S_AXI_WSTRB            (control_S_AXI_WSTRB),
   .S_AXI_WVALID           (control_S_AXI_WVALID),
   .S_AXI_BREADY           (control_S_AXI_BREADY),
   .S_AXI_ARADDR           (control_S_AXI_ARADDR),
   .S_AXI_ARVALID          (control_S_AXI_ARVALID),
   .S_AXI_RREADY           (control_S_AXI_RREADY),
   .S_AXI_ARREADY          (control_S_AXI_ARREADY),
   .S_AXI_RDATA            (control_S_AXI_RDATA),
   .S_AXI_RRESP            (control_S_AXI_RRESP),
   .S_AXI_RVALID           (control_S_AXI_RVALID),
   .S_AXI_WREADY           (control_S_AXI_WREADY),
   .S_AXI_BRESP            (control_S_AXI_BRESP),
   .S_AXI_BVALID           (control_S_AXI_BVALID),
   .S_AXI_AWREADY          (control_S_AXI_AWREADY),

  // Register ports
  // CPU reads IP interface
  .ip2cpu_rankcalc_reg_data          (ip2cpu_rankcalc_reg_data), //wire
  .ip2cpu_rankcalc_reg_index         (ip2cpu_rankcalc_reg_index), //wire
  .ip2cpu_rankcalc_reg_valid         (ip2cpu_rankcalc_reg_valid), //wire
  .ipReadReq_rankcalc_reg_index      (ipReadReq_rankcalc_reg_index), //wire
  .ipReadReq_rankcalc_reg_valid      (ipReadReq_rankcalc_reg_valid), //wire
  // CPU writes IP interface
  .cpu2ip_rankcalc_reg_data          (cpu2ip_rankcalc_reg_data),
  .cpu2ip_rankcalc_reg_index         (cpu2ip_rankcalc_reg_index),
  .cpu2ip_rankcalc_reg_valid         (cpu2ip_rankcalc_reg_valid),
  // Global Registers - user can select if to use
  .cpu_resetn_soft(),//software reset, after cpu module
  .resetn_soft    (),//software reset to cpu module (from central reset management)
  .resetn_sync    (resetn_sync)//synchronized reset, use for better timing
);
//// CPU REGS END ////


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
                    reg_weight_next[id_j] = reg_weight[id_j];
                    reg_round_next[id_j] = reg_round[id_j];
                    reg_overflow_next[id_j] = reg_overflow[id_j];
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
            reg_weight_next[id_j] = reg_weight[id_j];
            reg_round_next[id_j] = reg_round[id_j];
            reg_overflow_next[id_j] = reg_overflow[id_j];
        end
    end 
end

//Control plane signal handling
always @(*)
begin
    reg_out_valid_cp_next = cpu2ip_rankcalc_reg_valid || ip2cpu_rankcalc_reg_valid;   
    if (cpu2ip_rankcalc_reg_valid) //write Signal
        begin
        reg_cp_out_index_next =  cpu2ip_rankcalc_reg_index;
        reg_cp_out_val_next = 0;
        
        for (id_j=0; id_j<=ID_COUNTER-1; id_j= id_j+1)
            begin
            if (id_j == cpu2ip_rankcalc_reg_index)
                begin
                reg_config_weight_next [cpu2ip_rankcalc_reg_index] = cpu2ip_rankcalc_reg_data;
                end
            else
                begin
                reg_config_weight_next[id_j] = reg_config_weight[id_j];
                end
            end
        
        end
    else if (ip2cpu_rankcalc_reg_valid) //read signal
        begin
        reg_cp_out_index_next =   ip2cpu_rankcalc_reg_index;
        reg_cp_out_val_next = {reg_overflow[ip2cpu_rankcalc_reg_index],reg_round[ip2cpu_rankcalc_reg_index], reg_config_weight[ip2cpu_rankcalc_reg_index], reg_weight[ip2cpu_rankcalc_reg_index]};
        
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
always @(posedge clk_control)
begin
    if (clk_control_rst_low)
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
always @(posedge clk_lookup)
begin

if (~clk_lookup_rst_high)
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

assign tuple_out_rankcalc_wrr_calc_output_VALID = reg_out_valid_dp;
assign tuple_out_rankcalc_wrr_calc_output_DATA  = {reg_out_valid_dp,reg_calced_rank,reg_pifo_info};

assign ip2cpu_rankcalc_reg_data = reg_cp_out_val;
assign ipReadReq_rankcalc_reg_index = reg_cp_out_index;
assign ipReadReq_rankcalc_reg_valid = reg_out_valid_cp;

endmodule
