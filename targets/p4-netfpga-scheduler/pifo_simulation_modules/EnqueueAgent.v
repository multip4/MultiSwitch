`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2019 08:38:42 AM
// Design Name: 
// Module Name: EnqueueAgent
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: EnqueueAgent is composed with combination logics for enqueue, 
// and sequencial logics for FSM update.
// 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
// pifo_info bit <37>: {
// valid bit<1>
// last bit<1>
// rank bit<16>
// queue_id bit<8>
// field bit<11> => {pb_next bit<3>, qid_next <8>} or {meta_addr<11>}
//}


//////////////////////////////////////////////////////////////////////////////////


module EnqueueAgent
    #(
    parameter DATA_WIDTH = 256,
    parameter KEEP_WIDTH = 32,
    parameter SUME_WIDTH = 128,  // 128 + 185(36*5 )
    parameter PIFO_INFO_WIDTH = 37,
    parameter PIFO_WIDTH = 185,
    parameter PIFO_BLOCK_COUNT = 5,
    parameter OUTPUT_PORT_COUNT = 5
    )
    (
    
    s_axis_pkt_data,
    s_axis_pkt_keep,
    s_axis_pkt_last,
    s_axis_sume_meta,
    s_axis_valid,
    
    s_axis_buffer_almost_full_bit_array,
    s_axis_pifo_almost_full_bit_array,
    

    
    m_axis_pkt_info,
    m_axis_sume_meta,
    m_axis_pifo_info,
    m_axis_output_port_bit_array,
    
    m_axis_ctl_pkt_wr_en,
    m_axis_ctl_meta_wr_en,
    m_axis_ctl_pifo_enq,
    m_axis_ctl_pkt_addr_update,
    m_axis_ctl_meta_addr_update,
        
    rstn,
    clk
    
    );
    
    //Input Data
    input [DATA_WIDTH-1:0]              s_axis_pkt_data;
    input [KEEP_WIDTH-1:0]              s_axis_pkt_keep;
    input                               s_axis_pkt_last;
    input [SUME_WIDTH+PIFO_WIDTH-1:0]   s_axis_sume_meta;
    input                               s_axis_valid;
    
    // Input Status Info
    input [OUTPUT_PORT_COUNT-1:0]       s_axis_buffer_almost_full_bit_array;
    input [PIFO_BLOCK_COUNT-1:0]        s_axis_pifo_almost_full_bit_array;
    

    // Output Data
    output [DATA_WIDTH+KEEP_WIDTH+1-1:0]    m_axis_pkt_info; // pkt_data + pkt_keep + last
    output [SUME_WIDTH-1:0]                 m_axis_sume_meta;
    output [PIFO_WIDTH-1:0]                 m_axis_pifo_info;
    output [OUTPUT_PORT_COUNT-1:0]          m_axis_output_port_bit_array;
    
    // output signal
    output                                  m_axis_ctl_pkt_wr_en; 
    output                                  m_axis_ctl_meta_wr_en;
    output                                  m_axis_ctl_pifo_enq;
    output                                  m_axis_ctl_pkt_addr_update;
    output                                  m_axis_ctl_meta_addr_update;
    
    
    input                               rstn; // active low.
    input                               clk;



    //Wires 

    reg [DATA_WIDTH+KEEP_WIDTH+1-1:0]   m_axis_pkt_info_reg;
    reg [SUME_WIDTH-1:0]                m_axis_sume_meta_reg;
    reg [PIFO_WIDTH-1:0]                m_axis_pifo_info_reg;
    reg [OUTPUT_PORT_COUNT-1:0]         m_axis_output_port_bit_array_reg;
    
    
    // Registers
    
    reg                                is_buffer_almost_full;
    reg                                is_pifo_almost_full;
    
    
    // FSM States
    localparam STATES_WIDTH = 2;
    localparam IDLE = 0;
    localparam ENQUEUE = 1;
    localparam DROP = 2;
    
    // Registers for FSM
    reg [STATES_WIDTH-1:0]                            cur_status;        // Flip-Flop
    reg [STATES_WIDTH-1:0]                            cur_status_next;   // Latch
    
    // Registers for output signal
    reg                                  m_axis_ctl_pkt_wr_en_reg; 
    reg                                  m_axis_ctl_meta_wr_en_reg;
    reg                                  m_axis_ctl_pifo_enq_reg;
    reg                                  m_axis_ctl_pkt_addr_update_reg;
    reg                                  m_axis_ctl_meta_addr_update_reg;

    
    // ==============================================
    // Wire Logic 1.
    // Wire Renaming for PKT & METADATA & PIFO _INFO & OUTPUT PORT
    // ==============================================

   // ==============================================
   // Combinational Logic.
   // Check Buffer is almost full
   // ==============================================
   
//   always@(s_axis_buffer_almost_full_bit_array, m_axis_output_port_bit_array_wire)
//       begin
//            is_buffer_almost_full = 
//            (s_axis_buffer_almost_full_bit_array[0] & m_axis_output_port_bit_array_wire[0]) |
//            (s_axis_buffer_almost_full_bit_array[1] & m_axis_output_port_bit_array_wire[1]) |
//            (s_axis_buffer_almost_full_bit_array[2] & m_axis_output_port_bit_array_wire[2]) |
//            (s_axis_buffer_almost_full_bit_array[3] & m_axis_output_port_bit_array_wire[3]) |
//            (s_axis_buffer_almost_full_bit_array[4] & m_axis_output_port_bit_array_wire[4]);                                
//       end 
   

   // ==============================================
   // Combinational Logic.
   // Check Buffer is almost full
   // ==============================================
    
    localparam DST_POS = 24;
    
    always @(
            s_axis_pkt_data,
            s_axis_pkt_keep,
            s_axis_pkt_last,
            s_axis_sume_meta,
            s_axis_valid,
            
            s_axis_buffer_almost_full_bit_array,
            s_axis_pifo_almost_full_bit_array,
            cur_status
        ) // TODO:sensitive list updated later
        begin
        // synthesis translate_off
        #1
        // synthesis translate_on
        
        
            // set default value
            //cur_status_next = cur_status;
            m_axis_ctl_pkt_wr_en_reg = 0;
            m_axis_ctl_meta_wr_en_reg = 0;
            m_axis_ctl_pifo_enq_reg = 0;
            m_axis_ctl_pkt_addr_update_reg = 0;
            m_axis_ctl_meta_addr_update_reg = 0;
            
            // set output pkt data
            m_axis_pkt_info_reg = {s_axis_pkt_data, s_axis_pkt_keep, s_axis_pkt_last};
            
            // split sume_meta & pifo_info
            m_axis_sume_meta_reg =  s_axis_sume_meta[SUME_WIDTH-1:0];
            m_axis_pifo_info_reg = s_axis_sume_meta[SUME_WIDTH+PIFO_WIDTH-1:SUME_WIDTH];
            
            
            
            // get output port bit map

            m_axis_output_port_bit_array_reg = 
                               s_axis_sume_meta[DST_POS] |               // port 0
                              (s_axis_sume_meta[DST_POS + 2] << 1) |     // port 1
                              (s_axis_sume_meta[DST_POS + 4] << 2) |     // port 2
                              (s_axis_sume_meta[DST_POS + 6] << 3) |     // port 3
                              ((s_axis_sume_meta[DST_POS + 1] | 
                              s_axis_sume_meta[DST_POS + 3] | 
                              s_axis_sume_meta[DST_POS + 5] | 
                              s_axis_sume_meta[DST_POS + 7]) << 4);      // port 4
            
            
            
            // check buffer full 
            is_buffer_almost_full = 
                               (s_axis_buffer_almost_full_bit_array[0] & m_axis_output_port_bit_array_reg[0]) |
                               (s_axis_buffer_almost_full_bit_array[1] & m_axis_output_port_bit_array_reg[1]) |
                               (s_axis_buffer_almost_full_bit_array[2] & m_axis_output_port_bit_array_reg[2]) |
                               (s_axis_buffer_almost_full_bit_array[3] & m_axis_output_port_bit_array_reg[3]) |
                               (s_axis_buffer_almost_full_bit_array[4] & m_axis_output_port_bit_array_reg[4]);
            
            
            // check pifo full
            is_pifo_almost_full = 
                                (s_axis_pifo_almost_full_bit_array[0] & m_axis_pifo_info_reg[PIFO_INFO_WIDTH-1]) |
                                 (s_axis_pifo_almost_full_bit_array[1] & m_axis_pifo_info_reg[PIFO_INFO_WIDTH+PIFO_INFO_WIDTH-1]) | 
                                 (s_axis_pifo_almost_full_bit_array[2] & m_axis_pifo_info_reg[PIFO_INFO_WIDTH+PIFO_INFO_WIDTH+PIFO_INFO_WIDTH-1]) |
                                 (s_axis_pifo_almost_full_bit_array[3] & m_axis_pifo_info_reg[PIFO_INFO_WIDTH+PIFO_INFO_WIDTH+PIFO_INFO_WIDTH+PIFO_INFO_WIDTH-1]) |
                                 (s_axis_pifo_almost_full_bit_array[4] & m_axis_pifo_info_reg[PIFO_INFO_WIDTH+PIFO_INFO_WIDTH+PIFO_INFO_WIDTH+PIFO_INFO_WIDTH+PIFO_INFO_WIDTH-1]);

            
            
            
            
            case(cur_status)
            
                IDLE:
                    begin
                        // TODO: maybe we can move reset conditon to Sequencial Logic??
                    
                        // if the reset signal is low, then go to IDLE State
                        if(~rstn)
                            begin
                                cur_status_next = IDLE;
                            end
                        else 
                            begin
                                
                                // if not valid then go to IDLE
                                if(~s_axis_valid)
                                    begin
                                        
                                        cur_status_next = IDLE;
                                    end
                                // if valid and the buffer and pifo is not almost full then go to ENQUEUE Status
                                else if(~is_buffer_almost_full & ~is_pifo_almost_full & s_axis_valid)
                                    begin
                                        
                                        cur_status_next = ENQUEUE;
                                        
                                        m_axis_ctl_pkt_wr_en_reg = 1;
                                        m_axis_ctl_meta_wr_en_reg = 1;
                                        m_axis_ctl_pifo_enq_reg = 1;
                                        m_axis_ctl_pkt_addr_update_reg = 1;
                                        m_axis_ctl_meta_addr_update_reg = 1;
                                    end
                                
                                // else means the buffer or PIFO is full, go to DROP
                                else
                                    begin   
                                        cur_status_next = DROP;
                                    end
                            end
                    end
                    
                DROP:
                    begin                  
                        if(~rstn)
                            begin
                                cur_status_next = IDLE;
                            end
                        else
                            begin
                                // go to idle state when receive the last chunk of the packet.
                                if(s_axis_valid & s_axis_pkt_last)
                                    cur_status_next = IDLE;
                                else 
                                    cur_status_next = DROP;
                            end
       
                    end
                
                
                ENQUEUE:
                    begin
                        if(~rstn)
                            begin
                                
                                cur_status_next = IDLE;
                            end
                        else
                            begin
                                
                                if(s_axis_valid & ~s_axis_pkt_last)
                                    begin
                                        m_axis_ctl_pkt_wr_en_reg = 1;
                                        m_axis_ctl_pkt_addr_update_reg = 1;
                                    end
                                else if(s_axis_valid & s_axis_pkt_last)
                                    begin
                                       m_axis_ctl_pkt_wr_en_reg = 1;
                                       m_axis_ctl_pkt_addr_update_reg = 1;
                                       cur_status_next = IDLE;
                                    end
                                else
                                    begin
                                       cur_status_next = ENQUEUE; 
                                    end
                                    
                            end    
                    end       
            endcase
        end


    always @(posedge clk)
        begin
            
            if(~rstn) // rstn actives at low
                begin
                    cur_status <= IDLE;
                    cur_status_next <= IDLE;
                    m_axis_ctl_pkt_wr_en_reg <= 0;
                    m_axis_ctl_meta_wr_en_reg <= 0;
                    m_axis_ctl_pifo_enq_reg <= 0;
                    m_axis_ctl_pkt_addr_update_reg <= 0;
                    m_axis_ctl_meta_addr_update_reg <= 0;
                    
                end
            else 
                begin 
                    cur_status = cur_status_next;
                end
        
        end





    // assign output
    assign m_axis_pkt_info = m_axis_pkt_info_reg;
    assign m_axis_sume_meta = m_axis_sume_meta_reg;
    assign m_axis_pifo_info = m_axis_pifo_info_reg;
    assign m_axis_output_port_bit_array = m_axis_output_port_bit_array_reg;

    assign m_axis_ctl_pkt_wr_en = m_axis_ctl_pkt_wr_en_reg;
    assign m_axis_ctl_meta_wr_en = m_axis_ctl_meta_wr_en_reg;
    assign m_axis_ctl_pifo_enq = m_axis_ctl_pifo_enq_reg;
    assign m_axis_ctl_pkt_addr_update = m_axis_ctl_pkt_addr_update_reg;
    assign m_axis_ctl_meta_addr_update = m_axis_ctl_meta_addr_update_reg;
    
endmodule
