`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/18/2019 10:50:24 AM
// Design Name: 
// Module Name: Enqueue_Agent
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// Enqueue Agent is the first module block for PIFO_MODULE in datapath.
// It aggregates Packet Data(payload, keep, last flag, etc). and call Buffer Manager to write packet and metadata.
//  
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Enqueue_Agent
#(
    // parameters
    
    // I/O Parameters
    parameter DATA_WIDTH = 256,
    parameter SUME_META_WIDTH = 128,
    // Port Parameters
    parameter PORT_NUM = 5,
    parameter EACH_PORT_BUFFER_SIZE = 131072,
    // PIFO Block
    parameter PIFO_BLOCK_NUM = 5,
    parameter RANK_WIDTH = 16,
    parameter FLOW_WIDTH = 10,
    parameter PIFO_QUEUE_ID_WIDTH = 5,
    parameter PIFO_BLOCK_ID_WIDTH = 3  
)
(
    // =====================================
    // Input
    // =====================================
    
    
    // from PIFO_MODULE Input
    s_axis_tdata,
    s_axis_tkeep,
    s_axis_tuser,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tlast,
    
    // from BufferManager
    
    s_axis_packet_addr,             // packet addr
    s_axis_packet_addr_valid,       // packet addr valid flag
    s_axis_meta_addr,               // meta addr
    s_axis_meta_addr_valid,         // meta valid flag
   
   
   // get status from Buffer Manager
   
    s_axis_buffer_port0_count,           // occupancy count
    s_axis_buffer_port1_count,
    s_axis_buffer_port2_count,
    s_axis_buffer_port3_count,
    s_axis_buffer_port4_count,
    
    //s_axis_buffer_is_full_array,         // bit array to report buffer status.
                                         // ex: [00010] indicates the 2nd(port1) buffer is full

    s_axis_data_buffer_is_almost_full_array,  // bit array to report buffer status.
                                         // ex: [00010] indicates the 2nd(port1) buffer is almost full
                                         // waiting for the last packet data of current packet.
    
    s_axis_meta_buffer_is_almost_full_array, // bit array for metadata.
    
                                                        
    // get queue status from PIFO_BLOCK
     
    s_axis_pifo_block_is_full_array,         // bit array to report pifo block status.
                                             // ex: [00001] means the 1st PIFO Block is full       
     
    
 // =======================================
 // Output: The Enqueue Agent has two destination
 // 1: buffer manager: send data and write signal to write data
 // 2: PIFO blocks: send data to dedicated PIFO block(s) 
 // =======================================
 
 
    // Output to Buffer Manager.
    m_axis_to_bm_tdata,   // combination of lastbit, keep, data.
    m_axis_to_bm_tkeep,   // combination of lastbit, keep, data.
    m_axis_to_bm_tlast,   // combination of lastbit, keep, data.
    m_axis_to_bm_data_valid,
    m_axis_to_bm_data_wr_en,
        
    m_axis_to_bm_user_data,     // meatadata
    m_axis_to_bm_user_wr_en,         // write signal
    m_axis_to_bm_user_valid,         // valid signal
 
     
    // Output to PIFO Blocks
    //  the width for each fields, maybe updated later during optimization design.
    //  bit<16>, bit<X>    ,  bit<10>, bit<3>        , bit<Y>           bit<13>       bit<10> 
    // {rank, pifo_queue_id, flow_id, next_pifo_block, next_pifo_queue, packet_addr, meta_addr}
    
    
     m_axis_to_pb_valid,        // valid bit
     m_axis_to_pb_packet_addr,  // packet addr
     m_axis_to_pb_meta_addr,    // metadata addr
     
     //rank info:  {rank, pifo_queue_id, flow_id, next_pifo_block, next_pifo_queue}
     m_axis_to_pb0_rank_info,
     m_axis_to_pb1_rank_info,
     m_axis_to_pb2_rank_info,
     m_axis_to_pb3_rank_info,
     m_axis_to_pb4_rank_info, 
     
     m_axis_to_pb_wr_en_array, // bit array for dedicated pifo blocks.   
     
     
     
     // control sig
     
     reset,
     clk
     
);

    // function for log2
    
    function integer log2;
      input integer number;
      begin
         log2=0;
         while(2**log2<number) begin
            log2=log2+1;
         end
      end
    endfunction // log2
    
   localparam PORT_WIDTH = log2(PORT_NUM);
   localparam MIN_PACKET_SIZE = 64;
   localparam PACKET_BUFFER_WIDTH = log2(EACH_PORT_BUFFER_SIZE/MIN_PACKET_SIZE);
   localparam META_BUFFER_WIDTH = log2(EACH_PORT_BUFFER_SIZE/MIN_PACKET_SIZE);
    
    
    //===============================
    // INPUT
    //===============================
    
    
    input [DATA_WIDTH-1:0]      s_axis_tdata;
    input [DATA_WIDTH/8-1:0]    s_axis_tkeep;
    input [SUME_META_WIDTH-1:0] s_axis_tuser;
    input                       s_axis_tvalid;
    input                       s_axis_tready;
    input                       s_axis_tlast;
    
    
    //input from Buffer Manager
    input [PACKET_BUFFER_WIDTH-1:0]     s_axis_packet_addr;             // packet addr
    input                               s_axis_packet_addr_valid;       // packet addr valid flag
    input [META_BUFFER_WIDTH-1:0]       s_axis_meta_addr;               // meta addr
    input                               s_axis_meta_addr_valid;         // meta valid flag
    
   // get status from Buffer Manager
   
    input [PACKET_BUFFER_WIDTH -1:0] s_axis_buffer_port0_count;           // occupancy count
    input [PACKET_BUFFER_WIDTH -1:0] s_axis_buffer_port1_count;
    input [PACKET_BUFFER_WIDTH -1:0] s_axis_buffer_port2_count;
    input [PACKET_BUFFER_WIDTH -1:0] s_axis_buffer_port3_count;
    input [PACKET_BUFFER_WIDTH -1:0] s_axis_buffer_port4_count;
    
    // bit array to report buffer status.
    // ex: [00010] indicates the 2nd(port1) buffer is full
    //input [PORT_NUM-1:0]             s_axis_buffer_is_full_array;         

    // bit array to report buffer status.
    // ex: [00010] indicates the 2nd(port1) buffer is almost full
    // waiting for the last packet data of current packet.
    input [PORT_NUM-1:0]             s_axis_data_buffer_is_almost_full_array;  
    
    // bit array to report metadata buffer status.
    // ex: [00010] indicates the 2nd(port1) buffer is almost full
    // waiting for the last packet data of current packet.
    input [PORT_NUM-1:0]             s_axis_meta_buffer_is_almost_full_array;  
    
    
                                                        
    // get queue status from PIFO_BLOCK
    
    
    // bit array to report pifo block status.
    // ex: [00001] means the 1st PIFO Block is full       
    input [PIFO_BLOCK_NUM-1:0]       s_axis_pifo_block_is_full_array;         
    

    
    //===============================
    // OUTPUT
    //=============================== 
    
    output [DATA_WIDTH-1:0]             m_axis_to_bm_tdata;   // Packet Data.
    output [DATA_WIDTH/8-1:0]           m_axis_to_bm_tkeep;   // Keep.
    output                              m_axis_to_bm_tlast;   // LastFlag.
    output                              m_axis_to_bm_data_valid;         // valid signal //NotUsed..
    output                              m_axis_to_bm_data_wr_en;
    
         
    output [SUME_META_WIDTH-1:0]        m_axis_to_bm_user_data;     // metadata
    output                              m_axis_to_bm_user_valid;         // write signal
    output                              m_axis_to_bm_user_wr_en;         // write signal
       
    output                              m_axis_to_pb_valid;        // valid bit
    output [PACKET_BUFFER_WIDTH-1:0]    m_axis_to_pb_packet_addr;  // packet addr
    output [META_BUFFER_WIDTH-1:0]      m_axis_to_pb_meta_addr;    // metadata addr
       
       //rank info:  {rank, pifo_queue_id, flow_id, next_pifo_block, next_pifo_queue}
    output [RANK_WIDTH+FLOW_WIDTH+PIFO_BLOCK_ID_WIDTH+PIFO_QUEUE_ID_WIDTH-1:0]  m_axis_to_pb0_rank_info;
    output [RANK_WIDTH+FLOW_WIDTH+PIFO_BLOCK_ID_WIDTH+PIFO_QUEUE_ID_WIDTH-1:0]  m_axis_to_pb1_rank_info;
    output [RANK_WIDTH+FLOW_WIDTH+PIFO_BLOCK_ID_WIDTH+PIFO_QUEUE_ID_WIDTH-1:0]  m_axis_to_pb2_rank_info;
    output [RANK_WIDTH+FLOW_WIDTH+PIFO_BLOCK_ID_WIDTH+PIFO_QUEUE_ID_WIDTH-1:0]  m_axis_to_pb3_rank_info;
    output [RANK_WIDTH+FLOW_WIDTH+PIFO_BLOCK_ID_WIDTH+PIFO_QUEUE_ID_WIDTH-1:0]  m_axis_to_pb4_rank_info;

       
    output [PIFO_BLOCK_NUM-1:0]  m_axis_to_pb_wr_en_array; // bit array for dedicated pifo blocks.   
       
       
    
    //================================
    // Control Sigs
    //================================
    input reset;
    input clk;
    
   //=================================
   // Local Functions:
   // Func 1: Check Buffer Overflow
   // Func 2: Check PIFO Overflow
   // Func 3: Generate Buffer Input Data & Signal
   // Func 4: Generate PIFO Input Data & Signal
   //=================================
   
   
   // Function 1: Check Buffer OverFlow,
   // Input:
   // Input1: sume_metadata,
   // Input2: target_queue_array,
   // Logic: get output port bit array from sume_metadata,
   //        then apply and operate to the queue status,
   //        if the result is bigger than 0, means the queue is overflowed.
   //        
   // Return: return 1 if the queue is overflow.
   // TestPassed? Wait For Testing(Zhenguo Cui 06/18)
  /*
   function is_buffer_overflow;
    input [SUME_META_WIDTH-1:0] sume_meta;
    input [PORT_NUM-1:0] queue_status;

    localparam DST_POS = 24;
    reg [PORT_NUM-1:0] temp;
    begin
    
    // generate output bit array, the result  is [DMA,nf3,nf2,nf1,nf0] 
    assign temp =     s_axis_tuser[DST_POS] |
                      (s_axis_tuser[DST_POS + 2] << 1) |
                      (s_axis_tuser[DST_POS + 4] << 2) |
                      (s_axis_tuser[DST_POS + 6] << 3) |
                      ((s_axis_tuser[DST_POS + 1] | s_axis_tuser[DST_POS + 3] | s_axis_tuser[DST_POS + 5] | s_axis_tuser[DST_POS + 7]) << 4);
    
    // and operate
    temp = temp && queue_status; 
    
    is_buffer_overflow = (temp > 0) ? 1 : 0;
    end  
   endfunction 
   */
   
   
   // Function 2: Check PIFO OverFlow,
   // Input:
   // Input1: queue_status_array,
   // Input2: target_queue_array,
   // Algorithm: similar to the is_buffer_overflow
   // Return: return 1 if any pifo is overflow.
   // TestPassed? Wait For Testing(Zhenguo Cui 06/18)
   
    
   function is_pifo_overflow;
    input [PIFO_BLOCK_NUM-1:0] queue_status, target_pifo;

    reg [PIFO_BLOCK_NUM-1:0] temp;
    begin
       temp = queue_status && target_pifo;
       is_pifo_overflow = (temp > 0) ? 1 : 0;

    end  
   endfunction 
   
   
   
   function [PORT_NUM-1:0] output_port_bit_array;
     input [SUME_META_WIDTH-1:0] sume_meta;
     localparam DST_POS = 24;
     begin
       output_port_bit_array =  sume_meta[DST_POS] |
                           (sume_meta[DST_POS + 2] << 1) |
                           (sume_meta[DST_POS + 4] << 2) |
                           (sume_meta[DST_POS + 6] << 3) |
                           ((sume_meta[DST_POS + 1] | sume_meta[DST_POS + 3] | sume_meta[DST_POS + 5] | sume_meta[DST_POS + 7]) << 4);
         
     end
   endfunction
   
   
   


   
   reg packet_buffer_overflow;
   reg [PORT_NUM-1:0] reg_output_port_bit_array;
   reg [PORT_NUM-1:0] reg_data_overflow_bit_mask;
   
   reg bm_data_wr_en;
   
   
   // push packet to the buffer.
   // Combination Logic,
   // when the 
   always @(s_axis_tdata, s_axis_tkeep, s_axis_tvalid, s_axis_tlast) begin
   
     if(s_axis_tvalid) begin
         // reset control sigs to bm
         bm_data_wr_en = 0;
       
         // get output port array
         reg_output_port_bit_array = output_port_bit_array(s_axis_tuser);
         
         // check if the target queue is overflowed
        reg_data_overflow_bit_mask = reg_output_port_bit_array && s_axis_data_buffer_is_almost_full_array;
         
        packet_buffer_overflow = (reg_data_overflow_bit_mask > 0) ? 1 : 0;
         
        $display("[%0t]  INFO: OverFlow Check %d", $time,packet_buffer_overflow);
          
         // write packet to the port 
         if(~packet_buffer_overflow) begin
            bm_data_wr_en = 1;  
         end
     end
     
   end
    
    
   reg meta_buffer_overflow;
   reg [PORT_NUM-1:0] reg_meta_output_port_bit_array;
   reg [PORT_NUM-1:0] reg_meta_overflow_bit_mask; 
   reg bm_meta_wr_en; 
    
   // push meta to the buffer.
    always @(s_axis_tuser) begin
        
        if(s_axis_tvalid) begin
            bm_meta_wr_en = 0;
            reg_meta_output_port_bit_array = output_port_bit_array(s_axis_tuser);
            reg_meta_overflow_bit_mask = reg_meta_output_port_bit_array && s_axis_meta_buffer_is_almost_full_array;
            
            meta_buffer_overflow = (reg_meta_overflow_bit_mask > 0) ? 1 : 0;
            $display("[%0t]  INFO: OverFlow Check %d", $time,packet_buffer_overflow);
            
            // write packet to the port 
            if(~packet_buffer_overflow) begin
               bm_data_wr_en = 1;  
            end
            
        end
    
    end
   

    // I/O Connection
    assign m_axis_to_bm_tdata = s_axis_tdata;
    assign m_axis_to_bm_tkeep = s_axis_tkeep;
    assign m_axis_to_bm_tlast = s_axis_tlast;
    assign m_axis_to_bm_data_wr_en = bm_data_wr_en;

endmodule
