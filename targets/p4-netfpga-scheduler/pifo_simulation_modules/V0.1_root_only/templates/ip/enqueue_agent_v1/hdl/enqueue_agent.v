`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Zhenguo Cui
// 
// Create Date: 08/27/2019 01:37:57 PM
// Design Name: 
// Module Name: enqueue_agent_v0_1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// enqueue agent for scheduler_top verstion 1.
//

// Dependencies: 
// 
// Revision: 
// Revision 0.01 - File Created
// Additional Comments:
// 
// pifo info root bit <32>: {
// valid bit<1>
// rank bit<19>
// field bit<12> => {buffer_addr<12>}
//}

// logic: 
// FSM send control signal to each output queues,
// in multicast case, the current version of enqueue_agent send control signal to the output queue
// which is not almost full.

/* Format of tuser signal:
*     [15:0]    pkt_len; // unsigned int
*     [23:16]   src_port; // one-hot encoded: {DMA, NF3, DMA, NF2, DMA, NF1, DMA, NF0}
*     [31:24]   dst_port; // one-hot encoded: {DMA, NF3, DMA, NF2, DMA, NF1, DMA, NF0}
*     [39:32]   drop; // only bit 32 is used
*     [47:40]   send_dig_to_cpu; // only bit 40 is used
*     [127:48]  digest_data;
*/


//////////////////////////////////////////////////////////////////////////////////


module enqueue_agent
    #(
        parameter C_S_AXIS_TUSER_WIDTH = 128,
        parameter C_S_AXI_DATA_WIDTH = 32,
        parameter C_S_AXI_ADDR_WIDTH = 8, // AXI addr for read drop count , src = [7:4], dst = [3:0]
        parameter QUEUE_NUM = 5          
    )
    (
        // from/to pipeline
        s_axis_tvalid,
        s_axis_tready,
        s_axis_tuser, // sume_meta.
        s_axis_tlast,
        s_axis_tlast_f1,
        s_axis_tpifo_valid,
        
        // from each port queue status 
        s_axis_buffer_almost_full,
        s_axis_pifo_full,
            
        m_axis_ctl_pifo_in_en,
        m_axis_ctl_buffer_wr_en,
        
        // cpu req/resp
        s_axi_addr,      
        s_axi_req_valid, 
                         
        m_axi_data,      
        m_axi_resp_valid,
        
        axis_aclk,
        axis_resetn
    );
    
    // input/output signal from/to pipeline. 
    input                               s_axis_tvalid; // valid bit.
    output                              s_axis_tready; // ready signal to pipeline, combinational logic output.
    input [C_S_AXIS_TUSER_WIDTH-1:0]    s_axis_tuser; // user metadata, derive output port.
    input                               s_axis_tlast;
    input                               s_axis_tlast_f1; // front 1 delay than s_axis_tlast;
         
    input                               s_axis_tpifo_valid;
    
    
    input [QUEUE_NUM-1:0]               s_axis_buffer_almost_full;
    input [QUEUE_NUM-1:0]               s_axis_pifo_full;
        
    
    // combinational logic output
    output [QUEUE_NUM-1:0]              m_axis_ctl_pifo_in_en; 
    // combinational logic output
    output [QUEUE_NUM-1:0]              m_axis_ctl_buffer_wr_en;
    
    input [C_S_AXI_ADDR_WIDTH-1:0]      s_axi_addr;    
    input                               s_axi_req_valid;
    
    output [C_S_AXI_DATA_WIDTH-1:0]     m_axi_data;
    output                              m_axi_resp_valid;
        
    
    
    input                               axis_aclk;
    input                               axis_resetn;
    
    
    // this register is for record pkt drop.
    // r_nf0_pkt_drop[1] means 
    // pkt drop count at nf0 which is from nf1.
    reg [C_S_AXI_DATA_WIDTH-1:0] r_nf0_pkt_drop[0:QUEUE_NUM-1];
    reg [C_S_AXI_DATA_WIDTH-1:0] r_nf1_pkt_drop[0:QUEUE_NUM-1];
    reg [C_S_AXI_DATA_WIDTH-1:0] r_nf2_pkt_drop[0:QUEUE_NUM-1];
    reg [C_S_AXI_DATA_WIDTH-1:0] r_nf3_pkt_drop[0:QUEUE_NUM-1];
    reg [C_S_AXI_DATA_WIDTH-1:0] r_nf4_pkt_drop[0:QUEUE_NUM-1];
 
 
    reg [C_S_AXI_DATA_WIDTH-1:0] r_nf0_pkt_drop_next[0:QUEUE_NUM-1];
    reg [C_S_AXI_DATA_WIDTH-1:0] r_nf1_pkt_drop_next[0:QUEUE_NUM-1];
    reg [C_S_AXI_DATA_WIDTH-1:0] r_nf2_pkt_drop_next[0:QUEUE_NUM-1];
    reg [C_S_AXI_DATA_WIDTH-1:0] r_nf3_pkt_drop_next[0:QUEUE_NUM-1];
    reg [C_S_AXI_DATA_WIDTH-1:0] r_nf4_pkt_drop_next[0:QUEUE_NUM-1];
    
    reg                          r_axis_tready_next;
    reg                          r_axis_tready;
    
   // local parameters
    localparam SRC_POS = 16;
    localparam DST_POS = 24; // first port position at user metadata.
    localparam DROP_POS = 32;
    localparam STATES_WIDTH = 2;
    localparam IDLE = 0;
    localparam ENQUEUE_SOP = 1;
    localparam ENQUEUE_REMAIN = 2;
    localparam DROP = 3;
    
        
    
    // wire 
    wire [QUEUE_NUM-1:0]                output_port_bit_array_wire;
    wire [QUEUE_NUM-1:0]                output_port_not_full_bit_array_wire;
    wire                                is_drop_wire;
    wire                                output_port_ready_wire;
    
    // registers
    reg [STATES_WIDTH-1:0]              eq_agent_fsm_state;
    reg [STATES_WIDTH-1:0]              eq_agent_fsm_state_next;
    
    // FSM State
    reg [QUEUE_NUM-1:0]                 m_axis_ctl_pifo_in_en_reg;
    reg [QUEUE_NUM-1:0]                 m_axis_ctl_buffer_wr_en_reg;

    // combinational logic output for control signals
    reg [QUEUE_NUM-1:0]                 m_axis_ctl_pifo_in_en_reg_next;
    reg [QUEUE_NUM-1:0]                 m_axis_ctl_buffer_wr_en_reg_next;
    
    
    reg [C_S_AXI_DATA_WIDTH-1:0] r_cpu_read_data;
    reg [C_S_AXI_DATA_WIDTH-1:0] r_cpu_read_data_next;
    reg                          r_cpu_read_resp_valid;    
    
    integer i;

    // FSM 
    always @(*) 
    begin
    
        r_axis_tready_next = 0;
        eq_agent_fsm_state_next = eq_agent_fsm_state;
        m_axis_ctl_pifo_in_en_reg_next = m_axis_ctl_pifo_in_en_reg;
        m_axis_ctl_buffer_wr_en_reg_next = m_axis_ctl_buffer_wr_en_reg;
 
        
        for(i=0;i<QUEUE_NUM;i=i+1) begin
            r_nf0_pkt_drop_next[i] = r_nf0_pkt_drop[i];
            r_nf1_pkt_drop_next[i] = r_nf1_pkt_drop[i];
            r_nf2_pkt_drop_next[i] = r_nf2_pkt_drop[i];
            r_nf3_pkt_drop_next[i] = r_nf3_pkt_drop[i];
            r_nf4_pkt_drop_next[i] = r_nf4_pkt_drop[i];
        end
        
        
 
                case(eq_agent_fsm_state)
                    // initial state;
                    // move to enqueue state if input data valid and at least one txport is available.
                    // move to drop state if input data valid and (drop signal is 1 or all port is not available). 
                    IDLE:
                        begin
                            m_axis_ctl_pifo_in_en_reg_next = 0;
                            m_axis_ctl_buffer_wr_en_reg_next = 0;

                            if(s_axis_tvalid & (is_drop_wire | ~output_port_ready_wire | ~s_axis_tpifo_valid)) 
                                begin
                                    eq_agent_fsm_state_next = DROP;
                                    
                                    // count the pkt drop register;
                                    
                                    case(s_axis_tuser[DST_POS-1:SRC_POS])
                                        
                                        'b00000001:
                                            begin
                                                
                                                if(output_port_bit_array_wire[0])
                                                    r_nf0_pkt_drop_next[0] = r_nf0_pkt_drop[0] + 1;
                                                if(output_port_bit_array_wire[1])
                                                    r_nf1_pkt_drop_next[0] = r_nf1_pkt_drop[0] + 1;
                                                if(output_port_bit_array_wire[2])
                                                    r_nf2_pkt_drop_next[0] = r_nf2_pkt_drop[0] + 1;
                                                if(output_port_bit_array_wire[3])
                                                    r_nf3_pkt_drop_next[0] = r_nf3_pkt_drop[0] + 1;
                                                if(output_port_bit_array_wire[4])
                                                    r_nf4_pkt_drop_next[0] = r_nf4_pkt_drop[0] + 1;
                                                                                            
                                            end
                                        'b00000100:
                                            begin
                                                if(output_port_bit_array_wire[0])
                                                    r_nf0_pkt_drop_next[1] = r_nf0_pkt_drop[1] + 1;
                                                if(output_port_bit_array_wire[1])
                                                    r_nf1_pkt_drop_next[1] = r_nf1_pkt_drop[1] + 1;
                                                if(output_port_bit_array_wire[2])
                                                    r_nf2_pkt_drop_next[1] = r_nf2_pkt_drop[1] + 1;
                                                if(output_port_bit_array_wire[3])
                                                    r_nf3_pkt_drop_next[1] = r_nf3_pkt_drop[1] + 1;
                                                if(output_port_bit_array_wire[4])
                                                    r_nf4_pkt_drop_next[1] = r_nf4_pkt_drop[1] + 1;                                            
                                            end
                                        'b00010000:
                                            begin
                                                if(output_port_bit_array_wire[0])                  
                                                    r_nf0_pkt_drop_next[2] = r_nf0_pkt_drop[2] + 1;
                                                if(output_port_bit_array_wire[1])                  
                                                    r_nf1_pkt_drop_next[2] = r_nf1_pkt_drop[2] + 1;
                                                if(output_port_bit_array_wire[2])                  
                                                    r_nf2_pkt_drop_next[2] = r_nf2_pkt_drop[2] + 1;
                                                if(output_port_bit_array_wire[3])                  
                                                    r_nf3_pkt_drop_next[2] = r_nf3_pkt_drop[2] + 1;
                                                if(output_port_bit_array_wire[4])                  
                                                    r_nf4_pkt_drop_next[2] = r_nf4_pkt_drop[2] + 1;
                                            end
                                        'b01000000:
                                            begin
                                                if(output_port_bit_array_wire[0])                  
                                                    r_nf0_pkt_drop_next[3] = r_nf0_pkt_drop[3] + 1;
                                                if(output_port_bit_array_wire[1])                  
                                                    r_nf1_pkt_drop_next[3] = r_nf1_pkt_drop[3] + 1;
                                                if(output_port_bit_array_wire[2])                  
                                                    r_nf2_pkt_drop_next[3] = r_nf2_pkt_drop[3] + 1;
                                                if(output_port_bit_array_wire[3])                  
                                                    r_nf3_pkt_drop_next[3] = r_nf3_pkt_drop[3] + 1;
                                                if(output_port_bit_array_wire[4])                  
                                                    r_nf4_pkt_drop_next[3] = r_nf4_pkt_drop[3] + 1;
                                            end
                                         default:
                                            begin
                                                if(output_port_bit_array_wire[0])                  
                                                    r_nf0_pkt_drop_next[4] = r_nf0_pkt_drop[4] + 1;
                                                if(output_port_bit_array_wire[1])                  
                                                    r_nf1_pkt_drop_next[4] = r_nf1_pkt_drop[4] + 1;
                                                if(output_port_bit_array_wire[2])                  
                                                    r_nf2_pkt_drop_next[4] = r_nf2_pkt_drop[4] + 1;
                                                if(output_port_bit_array_wire[3])                  
                                                    r_nf3_pkt_drop_next[4] = r_nf3_pkt_drop[4] + 1;
                                                if(output_port_bit_array_wire[4])                  
                                                    r_nf4_pkt_drop_next[4] = r_nf4_pkt_drop[4] + 1;
                                            
                                            end                                           
                                    endcase             
                                           
                                                    
                                end
                            else if(s_axis_tvalid & ~r_axis_tready)
                                begin
                                    r_axis_tready_next = 1;
                                    eq_agent_fsm_state_next = ENQUEUE_SOP;
//                                    m_axis_ctl_pifo_in_en_reg_next = output_port_not_full_bit_array_wire;
//                                    m_axis_ctl_buffer_wr_en_reg_next = output_port_not_full_bit_array_wire;
                                end
//                            else if(s_axis_tvalid & r_axis_tready)
//                                begin
//                                    r_axis_tready_next = 1;
//                                    m_axis_ctl_pifo_in_en_reg_next = output_port_not_full_bit_array_wire;
//                                    m_axis_ctl_buffer_wr_en_reg_next = output_port_not_full_bit_array_wire;
//                                    eq_agent_fsm_state_next = ENQUEUE_REMAIN;   
                                
//                                end
                        end
                    // Drop state;
                    // drop all chunck to the EOP,
                    // move to IDLE state when the last bit is 1
                    DROP:
                        begin
                            //set ready signal to 1 only if the s_axis_tlast_f1 and s_axis_tlast value is not 0.
                            if(~(s_axis_tlast_f1 | s_axis_tlast)) r_axis_tready_next = 1;
                            if(s_axis_tlast)
                                begin
                                    eq_agent_fsm_state_next = IDLE;
                                    //r_axis_tready_next = 0;
                                end
                        end
                    // Enqueue state:
                    // write pkt chunks to buffer,
                    // move to IDLE state when find eop.
                    ENQUEUE_REMAIN:
                        begin
                            //set ready signal to 1 only if the s_axis_tlast_f1 and s_axis_tlast value is not 0.
                            if(~(s_axis_tlast_f1 | s_axis_tlast)) r_axis_tready_next = 1;
                            
                            m_axis_ctl_pifo_in_en_reg_next = 0;
                            if(s_axis_tlast)
                                begin
                                    eq_agent_fsm_state_next = IDLE;
                                    m_axis_ctl_buffer_wr_en_reg_next = 0;
                                    //r_axis_tready_next = 0;
                                end
                        end
                    ENQUEUE_SOP:
                        begin
                            r_axis_tready_next = 1;
                            m_axis_ctl_pifo_in_en_reg_next = output_port_not_full_bit_array_wire;
                            m_axis_ctl_buffer_wr_en_reg_next = output_port_not_full_bit_array_wire;
                            eq_agent_fsm_state_next = ENQUEUE_REMAIN;      
                        end
                endcase
    end
    
    // cpu combinational logic
    
    wire [3:0] addr_src = s_axi_addr [7:4];
    wire [3:0] addr_dst = s_axi_addr [3:0];
        
    always @(*)
    begin
        
        case(addr_dst)
            0:
                begin
                    r_cpu_read_data_next = r_nf0_pkt_drop[addr_src];           
                end
            1:
                begin
                    r_cpu_read_data_next = r_nf1_pkt_drop[addr_src]; 
                end
            2:
                begin
                    r_cpu_read_data_next = r_nf2_pkt_drop[addr_src]; 
                end
            3:  
                begin
                    r_cpu_read_data_next = r_nf3_pkt_drop[addr_src]; 
                end 
            default:
                begin
                    r_cpu_read_data_next = r_nf4_pkt_drop[addr_src]; 
                end
            
        endcase
        
    end
    
    
      
    always @(posedge axis_aclk) 
    
    begin
        if(~axis_resetn) 
            begin
                eq_agent_fsm_state <= IDLE;
                m_axis_ctl_pifo_in_en_reg <= 0;
                m_axis_ctl_buffer_wr_en_reg <= 0;
                
                r_cpu_read_data <= 0;
                r_cpu_read_resp_valid <= 0;
                for(i=0; i<QUEUE_NUM; i=i+1) begin
                    r_nf0_pkt_drop[i] <= 0;
                    r_nf1_pkt_drop[i] <= 0;
                    r_nf2_pkt_drop[i] <= 0;
                    r_nf3_pkt_drop[i] <= 0;
                    r_nf4_pkt_drop[i] <= 0;

                end
                r_axis_tready <= 0 ;
                
            end
        else 
            begin
                eq_agent_fsm_state <= eq_agent_fsm_state_next;
                m_axis_ctl_pifo_in_en_reg <=  m_axis_ctl_pifo_in_en_reg_next;
                m_axis_ctl_buffer_wr_en_reg <=  m_axis_ctl_buffer_wr_en_reg_next;
                
                r_cpu_read_data <= r_cpu_read_data_next;
                r_cpu_read_resp_valid <= s_axi_req_valid; 
                r_axis_tready <= r_axis_tready_next;
                
                for(i=0; i<QUEUE_NUM; i=i+1) begin
                    r_nf0_pkt_drop[i] <= r_nf0_pkt_drop_next[i];
                    r_nf1_pkt_drop[i] <= r_nf1_pkt_drop_next[i];
                    r_nf2_pkt_drop[i] <= r_nf2_pkt_drop_next[i];
                    r_nf3_pkt_drop[i] <= r_nf3_pkt_drop_next[i];
                    r_nf4_pkt_drop[i] <= r_nf4_pkt_drop_next[i];
                end
                
            end
    end
    
    
    // get output bit array.
    assign output_port_bit_array_wire =  
                    s_axis_tuser[DST_POS] |               // port 0
                   (s_axis_tuser[DST_POS + 2] << 1) |     // port 1
                   (s_axis_tuser[DST_POS + 4] << 2) |     // port 2
                   (s_axis_tuser[DST_POS + 6] << 3) |     // port 3
                   ((s_axis_tuser[DST_POS + 1] | 
                   s_axis_tuser[DST_POS + 3] | 
                   s_axis_tuser[DST_POS + 5] | 
                   s_axis_tuser[DST_POS + 7]) << 4); // port 4, cpu.
    
    
    
    // get drop signal from metadata  
    assign is_drop_wire = s_axis_tuser[DROP_POS];
    
    // and opration between output port bit array and buffer almost full array.
    assign output_port_not_full_bit_array_wire = 
            output_port_bit_array_wire & ~s_axis_buffer_almost_full & ~s_axis_pifo_full;
    
    // reduction or operator to indicate at least 1 output port is not full. 
    assign output_port_ready_wire = s_axis_tvalid & (| output_port_not_full_bit_array_wire);
    
    
    // assign output control signal 
    assign m_axis_ctl_pifo_in_en = m_axis_ctl_pifo_in_en_reg;
    assign m_axis_ctl_buffer_wr_en = m_axis_ctl_buffer_wr_en_reg;
    
    // assgin cpu result
    assign m_axi_data = r_cpu_read_data;      
    assign m_axi_resp_valid = r_cpu_read_resp_valid;
    assign s_axis_tready = r_axis_tready;
endmodule
