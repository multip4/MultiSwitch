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


module enqueue_agent_v0_1
    #(
        parameter C_S_AXIS_TUSER_WIDTH = 128,
        parameter QUEUE_NUM = 5          
    )
    (
        // from/to pipeline
        s_axis_tvalid,
        s_axis_tready,
        s_axis_tuser, // sume_meta.
        s_axis_tlast,
        
        // from each port queue status 
        s_axis_buffer_almost_full,
        s_axis_pifo_full,
            
        m_axis_ctl_pifo_in_en,
        m_axis_ctl_buffer_wr_en,
        
        axis_aclk,
        axis_resetn
    );
    
    // input/output signal from/to pipeline. 
    input                               s_axis_tvalid; // valid bit.
    output reg                          s_axis_tready; // ready signal to pipeline, combinational logic output.
    input [C_S_AXIS_TUSER_WIDTH-1:0]    s_axis_tuser; // user metadata, derive output port.
    input                               s_axis_tlast; 
    
    input [QUEUE_NUM-1:0]               s_axis_buffer_almost_full;
    input [QUEUE_NUM-1:0]               s_axis_pifo_full;
        
    
    // combinational logic output
    output [QUEUE_NUM-1:0]              m_axis_ctl_pifo_in_en; 
    // combinational logic output
    output [QUEUE_NUM-1:0]              m_axis_ctl_buffer_wr_en;
    
    input                               axis_aclk;
    input                               axis_resetn;
    
    
    // local parameters
    localparam DST_POS = 24; // first port position at user metadata.
    localparam DROP_POS = 32;
    localparam STATES_WIDTH = 2;
    localparam IDLE = 0;
    localparam ENQUEUE = 1;
    localparam DROP = 2;
    
        
    
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
    
    
    

    // FSM 
    always @(s_axis_tvalid,  // valid signal from pipeline
                s_axis_tlast, // eop signal from pipeline
                is_drop_wire,  // drop signal from sume metadata 
                output_port_bit_array_wire, // output port bit array
                output_port_ready_wire, // single bit for indicating at least one output port is valid
                eq_agent_fsm_state, // current state state  of FSM
                m_axis_ctl_pifo_in_en_reg,
                m_axis_ctl_buffer_wr_en_reg
                ) 
    begin
    
        s_axis_tready = 0;
        eq_agent_fsm_state_next = eq_agent_fsm_state;
        m_axis_ctl_pifo_in_en_reg_next = m_axis_ctl_pifo_in_en_reg;
        m_axis_ctl_buffer_wr_en_reg_next = m_axis_ctl_buffer_wr_en_reg;
        
                case(eq_agent_fsm_state)
                    // initial state;
                    // move to enqueue state if input data valid and at least one txport is available.
                    // move to drop state if input data valid and (drop signal is 1 or all port is not available). 
                    IDLE:
                        begin
                            m_axis_ctl_pifo_in_en_reg_next = 0;
                            m_axis_ctl_buffer_wr_en_reg_next = 0;
                            if(s_axis_tvalid & (is_drop_wire | ~output_port_ready_wire)) 
                                begin
                                    eq_agent_fsm_state_next = DROP;
                                end
                            else if(s_axis_tvalid)
                                begin
                                    eq_agent_fsm_state_next = ENQUEUE;
                                    m_axis_ctl_pifo_in_en_reg_next = output_port_not_full_bit_array_wire;
                                    m_axis_ctl_buffer_wr_en_reg_next = output_port_not_full_bit_array_wire;
                                end
                        end
                    // Drop state;
                    // drop all chunck to the EOP,
                    // move to IDLE state when the last bit is 1
                    DROP:
                        begin
                            s_axis_tready = 1;
                            if(s_axis_tlast)
                                eq_agent_fsm_state_next = IDLE;
                        end
                    // Enqueue state:
                    // write pkt chunks to buffer,
                    // move to IDLE state when find eop.
                    ENQUEUE:
                        begin
                            s_axis_tready = 1;
                            m_axis_ctl_pifo_in_en_reg_next = 0;
                            if(s_axis_tlast)
                                eq_agent_fsm_state_next = IDLE;
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
            end
        else 
            begin
                eq_agent_fsm_state <= eq_agent_fsm_state_next;
                m_axis_ctl_pifo_in_en_reg <=  m_axis_ctl_pifo_in_en_reg_next;
                m_axis_ctl_buffer_wr_en_reg <=  m_axis_ctl_buffer_wr_en_reg_next;
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
    assign m_axis_ctl_pifo_in_en = m_axis_ctl_pifo_in_en_reg_next;
    assign m_axis_ctl_buffer_wr_en = m_axis_ctl_buffer_wr_en_reg_next;
    
endmodule
