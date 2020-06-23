`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/17/2020 10:10:34 AM
// Design Name: 
// Module Name: gpfc_agent
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
//  GPFC Agent for congestion detection, congestion notification
//                 pause frame generation, pause frame handling,
//                 pause state management
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module gpfc_agent
#(
    parameter PORT_NUM = 5, // port number, default 5 at NETFPGA-SUME 
    parameter TC_NUM = 8,   // Traffic Class number, in PFC, the ToS value is fixed to 8, this value will used for the pause frame.
    parameter DATA_WIDTH = 256, // payload data width,
    parameter INPUT_PORT_WIDTH = 8, // input port metadata field width for get dedicated port to pause,
//    parameter QUEUE_OCCUPANCY_TOTAL_WIDTH = 256, // queue occupancy report width for total data,
    parameter QUEUE_OCCUPANCY_UNIT_WIDTH = 12,      // queue occupancy width for each TC, 
    parameter PAUSE_RANK_WIDTH = 16,                // pause rank width
    parameter PAUSE_TIME_WIDTH = 16,                 // pause time width, 
    parameter PAUSE_FRAME_WIDTH = 512,                  // pause frame width
    parameter MAC_WIDTH = 48,                    // 6byte * 8
    parameter ETHER_TYPE_WIDTH = 16,
    parameter ETHER_WIDTH = 114,
    parameter GPFC_OPCODE_WIDTH = 16,
    parameter CONGESTION_STATE_WIDTH = 2,           // congestion state width
    parameter PAUSE_TIME_VALUE_DEFAULT = 65535,
    parameter PAUSE_RANK_VALUE_ALL = 0
)
(
    // input
    
    // payload for get pause frame,
    input                       s_axis_tvalid,
    input [DATA_WIDTH - 1:0]    s_axis_tdata,
    input [DATA_WIDTH / 8 - 1:0]   s_axis_tkeep,
    input                       s_axis_tlast,
    
    // metadata: input port value from sume
    input [INPUT_PORT_WIDTH-1 :0] s_axis_input_port,
    
    // input output queue occupancy
    input [QUEUE_OCCUPANCY_UNIT_WIDTH * TC_NUM - 1:0] s_axis_queue_occupancy_port_0,
    input [QUEUE_OCCUPANCY_UNIT_WIDTH * TC_NUM - 1:0] s_axis_queue_occupancy_port_1,
    input [QUEUE_OCCUPANCY_UNIT_WIDTH * TC_NUM - 1:0] s_axis_queue_occupancy_port_2,
    input [QUEUE_OCCUPANCY_UNIT_WIDTH * TC_NUM - 1:0] s_axis_queue_occupancy_port_3,
    input [QUEUE_OCCUPANCY_UNIT_WIDTH * TC_NUM - 1:0] s_axis_queue_occupancy_port_4,
    
    // output pause status
    output [TC_NUM - 1:0]         m_axis_pause_valid_vector_port_0,     // bit vector for indicate dedicated pause TC,
    output [PAUSE_RANK_WIDTH * TC_NUM -1 :0] m_axis_pause_rank_port_0,  // pause rank list for indicate each pause rank,
    output [TC_NUM - 1:0]         m_axis_pause_valid_vector_port_1,     // bit vector for indicate dedicated pause TC,
    output [PAUSE_RANK_WIDTH * TC_NUM -1 :0] m_axis_pause_rank_port_1,  // pause rank list for indicate each pause rank,
    output [TC_NUM - 1:0]         m_axis_pause_valid_vector_port_2,     // bit vector for indicate dedicated pause TC,
    output [PAUSE_RANK_WIDTH * TC_NUM -1 :0] m_axis_pause_rank_port_2,  // pause rank list for indicate each pause rank,
    output [TC_NUM - 1:0]         m_axis_pause_valid_vector_port_3,     // bit vector for indicate dedicated pause TC,
    output [PAUSE_RANK_WIDTH * TC_NUM -1 :0] m_axis_pause_rank_port_3,  // pause rank list for indicate each pause rank,
    output [TC_NUM - 1:0]         m_axis_pause_valid_vector_port_4,     // bit vector for indicate dedicated pause TC,
    output [PAUSE_RANK_WIDTH * TC_NUM -1 :0] m_axis_pause_rank_port_4,  // pause rank list for indicate each pause rank,
    
    // output pause frame
    // valid signal for notify the outputqueue for the PF valid,
    // each bit is turn on when the PF is updated,
    // and turn off when receives 
    
    output [PORT_NUM - 1 :0]         m_axis_pf_valid,
    input  [PORT_NUM - 1 :0]         s_axis_pf_ack,
    output [PAUSE_FRAME_WIDTH - 1:0] m_axis_pf,
    
    // clk, and reset signal
    input   clk,
    input rstn // reset at negative value, 
);

// register for pause state management,

// register for pause state vector list
reg [TC_NUM - 1:0] r_pause_state_list [0:PORT_NUM - 1];
reg [TC_NUM - 1:0] r_pause_state_list_next [0:PORT_NUM - 1];

// register for pause time list
// the PFC defines pause time as value of quanta with unit 64byte,
// in NetFPGA-SUME, data width is 256bit-> 32byte, which means, decrement 1 every 2cycle,
// for simplicity, we just shift left the pause time to make the unit as 32byte,
// in this way, we can decrement the value every 1cycle,
// Zhenguo Cui

//reg [TC_NUM * (PAUSE_TIME_WIDTH + 1) - 1:0] r_pause_time_list [0:PORT_NUM - 1]; 
//reg [TC_NUM * (PAUSE_TIME_WIDTH + 1) - 1:0] r_pause_time_list_next [0:PORT_NUM - 1]; 


//// register for pause value
//reg [TC_NUM * PAUSE_RANK_WIDTH - 1:0]r_pause_value_list [0:PORT_NUM - 1]; 
//reg [TC_NUM * PAUSE_RANK_WIDTH - 1:0]r_pause_value_list_next [0:PORT_NUM - 1]; 

reg [PAUSE_TIME_WIDTH:0] r_pause_time_list [0:PORT_NUM - 1][0:TC_NUM-1];
reg [PAUSE_TIME_WIDTH:0] r_pause_time_list_next [0:PORT_NUM - 1][0:TC_NUM-1];
reg [PAUSE_RANK_WIDTH - 1:0]r_pause_value_list [0:PORT_NUM - 1][0:TC_NUM-1]; 
reg [PAUSE_RANK_WIDTH - 1:0]r_pause_value_list_next [0:PORT_NUM - 1][0:TC_NUM-1]; 



// register for notify the outputqueue for the PF valid,
// each bit is turn on when the PF is updated,
// and turn off when receives 
reg [PORT_NUM - 1:0] r_pf_valid,r_pf_valid_next;

// pause frame
reg [PAUSE_FRAME_WIDTH - 1:0] r_pf, r_pf_next;

// ethernetHeader,
reg [MAC_WIDTH-1:0] r_pf_ether_smac, r_pf_ether_dmac;
reg [ETHER_TYPE_WIDTH-1:0] r_pf_ether_type;
reg [GPFC_OPCODE_WIDTH-1:0] r_pf_gpfc_opcode,r_pf_gpfc_opcode_next;
reg [PAUSE_TIME_WIDTH*TC_NUM-1:0] r_pf_gpfc_pause_time,r_pf_gpfc_pause_time_next;
reg [PAUSE_RANK_WIDTH*TC_NUM-1:0] r_pf_gpfc_pause_value,r_pf_gpfc_pause_value_next;

reg [DATA_WIDTH-1:0] r_pf_first_chunk, r_pf_first_chunk_next;

// fsm for receiving pause frame in 2 cycle;
reg r_gpfc_fsm, r_gpfc_fsm_next;


// cp parameters, registers

reg [TC_NUM - 1:0] cp_gpfc_enabled[0:PORT_NUM - 1]; 
reg [TC_NUM - 1:0] cp_gpfc_enabled_next[0:PORT_NUM - 1];

// thresholds for xoff/xon for all
reg [QUEUE_OCCUPANCY_UNIT_WIDTH - 1:0] cp_gpfc_xoff_all[0:TC_NUM-1]; 
reg [QUEUE_OCCUPANCY_UNIT_WIDTH - 1:0] cp_gpfc_xoff_all_next[0:TC_NUM-1]; 

reg [QUEUE_OCCUPANCY_UNIT_WIDTH - 1:0] cp_gpfc_xon_all[0:TC_NUM-1]; 
reg [QUEUE_OCCUPANCY_UNIT_WIDTH - 1:0] cp_gpfc_xon_all_next[0:TC_NUM-1]; 

// thresholds for xoff/xon for low priority
reg [QUEUE_OCCUPANCY_UNIT_WIDTH - 1:0] cp_gpfc_xoff_low[0:TC_NUM-1]; 
reg [QUEUE_OCCUPANCY_UNIT_WIDTH - 1:0] cp_gpfc_xoff_low_next[0:TC_NUM-1]; 

reg [QUEUE_OCCUPANCY_UNIT_WIDTH - 1:0] cp_gpfc_xon_low[0:TC_NUM-1]; 
reg [QUEUE_OCCUPANCY_UNIT_WIDTH - 1:0] cp_gpfc_xon_low_next[0:TC_NUM-1]; 

reg [PAUSE_RANK_WIDTH - 1:0] cp_gpfc_rank[0:TC_NUM-1]; 
reg [PAUSE_RANK_WIDTH - 1:0] cp_gpfc_rank_next[0:TC_NUM-1]; 

// congestion states for each port, each tc
reg [CONGESTION_STATE_WIDTH - 1:0] r_congestion_state[0: PORT_NUM - 1][0:TC_NUM-1]; 
reg [CONGESTION_STATE_WIDTH - 1:0] r_congestion_state_next[0: PORT_NUM - 1][0:TC_NUM-1]; 


// reg for temp parameter for calculation,

reg [2:0] r_port_deparse_next;



// fsm parameters for receiving & handling pause frame
localparam FSM_IDLE = 0; // default mode 
localparam FSM_WAIT_LAST = 1; // state for waiting second chunk of pause frame

localparam GPFC_OPCODE_END_POS = PAUSE_FRAME_WIDTH - ETHER_WIDTH-1;
localparam GPFC_OPCODE_START_POS = PAUSE_FRAME_WIDTH - ETHER_WIDTH - GPFC_OPCODE_WIDTH;
localparam GPFC_VECTOR_END_POS = PAUSE_FRAME_WIDTH - ETHER_WIDTH - GPFC_OPCODE_WIDTH - 1;
localparam GPFC_VECTOR_START_POS = PAUSE_FRAME_WIDTH - ETHER_WIDTH - GPFC_OPCODE_WIDTH - TC_NUM;
localparam GPFC_PTIME_END_POS = PAUSE_FRAME_WIDTH - ETHER_WIDTH - GPFC_OPCODE_WIDTH - TC_NUM - 1;
localparam GPFC_PTIME_START_POS = PAUSE_FRAME_WIDTH - ETHER_WIDTH - GPFC_OPCODE_WIDTH - TC_NUM - (TC_NUM * PAUSE_TIME_WIDTH);
localparam GPFC_PRANK_END_POS = PAUSE_FRAME_WIDTH - ETHER_WIDTH - GPFC_OPCODE_WIDTH - TC_NUM - (TC_NUM * PAUSE_TIME_WIDTH) - 1;
localparam GPFC_PRANK_START_POS = PAUSE_FRAME_WIDTH - ETHER_WIDTH - GPFC_OPCODE_WIDTH - TC_NUM - (TC_NUM * PAUSE_TIME_WIDTH) - (TC_NUM * PAUSE_RANK_WIDTH);

// wires from generate block.

// queue occupancy
wire [QUEUE_OCCUPANCY_UNIT_WIDTH -1 :0] w_queue_occupancy[0: PORT_NUM - 1][0:TC_NUM-1];

wire [TC_NUM-1:0] w_pf_valid;
wire [PAUSE_TIME_WIDTH-1:0] w_pf_pause_time[0:TC_NUM-1];
wire [PAUSE_RANK_WIDTH-1:0] w_pf_pause_rank[0:TC_NUM-1];

wire [PAUSE_TIME_WIDTH * TC_NUM - 1:0] w_pf_pause_time_value;
wire [PAUSE_RANK_WIDTH * TC_NUM - 1:0] w_pf_pause_rank_value;


// wire for parse pause frame
wire                         w_pf_receive_valid;
wire [PAUSE_FRAME_WIDTH-1:0] w_pf_receive_full;
wire [TC_NUM -1:0] w_pf_receive_vector;
wire [PAUSE_TIME_WIDTH*TC_NUM-1:0] w_pf_receive_pause_time;
wire [PAUSE_RANK_WIDTH*TC_NUM-1:0] w_pf_receive_pause_rank;
wire [PAUSE_TIME_WIDTH * TC_NUM - 1:0] w_pf_receive_pause_time_value;
wire [PAUSE_RANK_WIDTH * TC_NUM - 1:0] w_pf_receive_pause_rank_value;

// signal: set true when the fsm in WAIT_LAST state and input is valid,
//         set false in other condition.
assign w_pf_receive_valid = (s_axis_tvalid & (r_gpfc_fsm == FSM_WAIT_LAST)) ? 1 : 0;
assign w_pf_receive_full[PAUSE_FRAME_WIDTH-1:PAUSE_FRAME_WIDTH-DATA_WIDTH] = r_pf_first_chunk;
assign w_pf_receive_full[PAUSE_FRAME_WIDTH-DATA_WIDTH-1:0] = s_axis_tdata;

assign w_pf_receive_vector = w_pf_receive_full[GPFC_VECTOR_END_POS:GPFC_VECTOR_START_POS];
assign w_pf_receive_pause_time_value = w_pf_receive_full[GPFC_PTIME_END_POS:GPFC_PTIME_START_POS];
assign w_pf_receive_pause_rank_value = w_pf_receive_full[GPFC_PRANK_END_POS:GPFC_PRANK_START_POS];





// register output signal

reg  [PORT_NUM-1:0] r_m_axis_pf_valid, r_m_axis_pf_valid_next;


// temp data for pause frame,

// frame structure:
// Ether : 
// -- DMAC(), 
// -- SMAC(), 
// -- Ethertype()



// generate block
genvar i,j;
generate
    
    // wiring queue occupancy
    for(i=0; i < TC_NUM; i=i+1)    
        begin
           localparam start_pos = QUEUE_OCCUPANCY_UNIT_WIDTH * i;
           localparam end_pos = QUEUE_OCCUPANCY_UNIT_WIDTH * (i+1)-1;
                      
           assign w_queue_occupancy[0][i] =  s_axis_queue_occupancy_port_0[end_pos:start_pos];
           assign w_queue_occupancy[1][i] =  s_axis_queue_occupancy_port_1[end_pos:start_pos];
           assign w_queue_occupancy[2][i] =  s_axis_queue_occupancy_port_2[end_pos:start_pos];
           assign w_queue_occupancy[3][i] =  s_axis_queue_occupancy_port_3[end_pos:start_pos];
           assign w_queue_occupancy[4][i] =  s_axis_queue_occupancy_port_4[end_pos:start_pos];            
            
           assign w_pf_pause_time_value[PAUSE_TIME_WIDTH * (i+1) - 1:PAUSE_TIME_WIDTH * i ] = w_pf_pause_time[i];
           assign w_pf_pause_rank_value[PAUSE_RANK_WIDTH * (i+1) - 1:PAUSE_RANK_WIDTH * i ] = w_pf_pause_rank[i];
        
           assign m_axis_pause_rank_port_0[PAUSE_RANK_WIDTH * (i+1) - 1:PAUSE_RANK_WIDTH * i] = r_pause_value_list[0][i];
           assign m_axis_pause_rank_port_1[PAUSE_RANK_WIDTH * (i+1) - 1:PAUSE_RANK_WIDTH * i] = r_pause_value_list[1][i];
           assign m_axis_pause_rank_port_2[PAUSE_RANK_WIDTH * (i+1) - 1:PAUSE_RANK_WIDTH * i] = r_pause_value_list[2][i];
           assign m_axis_pause_rank_port_3[PAUSE_RANK_WIDTH * (i+1) - 1:PAUSE_RANK_WIDTH * i] = r_pause_value_list[3][i];
           assign m_axis_pause_rank_port_4[PAUSE_RANK_WIDTH * (i+1) - 1:PAUSE_RANK_WIDTH * i] = r_pause_value_list[4][i];
           
           assign m_axis_pause_valid_vector_port_0[i] = r_pause_state_list[0][i];
           assign m_axis_pause_valid_vector_port_1[i] = r_pause_state_list[1][i];
           assign m_axis_pause_valid_vector_port_2[i] = r_pause_state_list[2][i];
           assign m_axis_pause_valid_vector_port_3[i] = r_pause_state_list[3][i];
           assign m_axis_pause_valid_vector_port_4[i] = r_pause_state_list[4][i];
           
        end


    // congestion detection for each TC
    for(i=0; i < TC_NUM; i=i+1)    
        begin: gen_sub_module
            
            gpfc_congestion_monitor
            #(
            .QUEUE_OCCUPANCY_UNIT_WIDTH(QUEUE_OCCUPANCY_UNIT_WIDTH),
            .CONGESTION_STATE_WIDTH(CONGESTION_STATE_WIDTH),    
            .PAUSE_RANK_WIDTH(PAUSE_RANK_WIDTH),          
            .PAUSE_TIME_WIDTH(PAUSE_TIME_WIDTH),          
            .PAUSE_RANK_VALUE_ALL(PAUSE_RANK_VALUE_ALL),      
            .PAUSE_TIME_VALUE_DEFAULT(PAUSE_TIME_VALUE_DEFAULT),  
            .PORT_NUM(PORT_NUM)                  
            )
            gpfc_congestion_monitor_inst
            (
            .s_axis_queue_occupancy_port0(w_queue_occupancy[0][i]),
            .s_axis_queue_occupancy_port1(w_queue_occupancy[1][i]),
            .s_axis_queue_occupancy_port2(w_queue_occupancy[2][i]),
            .s_axis_queue_occupancy_port3(w_queue_occupancy[3][i]),
            .s_axis_queue_occupancy_port4(w_queue_occupancy[4][i]),
            .s_axis_xoff_low(cp_gpfc_xoff_low[i]),
            .s_axis_xon_low(cp_gpfc_xon_low[i]),
            .s_axis_xoff_all(cp_gpfc_xoff_all[i]),
            .s_axis_xon_all(cp_gpfc_xon_all[i]),
            .s_axis_xoff_rank(cp_gpfc_rank[i]),
            .m_axis_valid(w_pf_valid[i]),
            .m_axis_pause_rank(w_pf_pause_time[i]),
            .m_axis_pause_time(w_pf_pause_rank[i]),
            .clk(clk),
            .rstn(rstn)
            ); 
        end
        
        for(i=0; i < TC_NUM; i=i+1)
            begin: pf_notify_per_port



            // combinational block for congestion notification,
            // ack handshaking with output queues,
            // set valid signal when a new pause frame is generated,
            // keep valid until receive ack message,
                always @(*)
                    begin
                        
                        r_m_axis_pf_valid_next[i] = r_m_axis_pf_valid[i];
                        
                        // if ack is received,
                        // then set false for valid signal
                        if(s_axis_pf_ack[i] & r_m_axis_pf_valid_next[i])
                            begin
                                r_m_axis_pf_valid_next[i] = 0;
                            end
                        
                        // if new congestion state updated,
                        // set valid
                        if(w_pf_valid > 0)
                            begin
                                r_m_axis_pf_valid_next[i] = 1;
                            end     
                    end
                
                always @(posedge clk)
                    begin
                        if(~rstn)
                            begin
                                r_m_axis_pf_valid[i] <= 0;
                            end
                        else
                            begin
                                r_m_axis_pf_valid[i] <= r_m_axis_pf_valid_next[i];
                            end
                    end
            end
            
            
            // Handling the Received pause frame,
            // update pause status by pause frame,
            // if not matched, then decrease the pause timer,
            for(i=0; i < PORT_NUM; i=i+1)    
                begin
                    for(j=0;j<TC_NUM;j=j+1)
                        begin
                            
                            always@(*)
                                begin
                                    r_pause_value_list_next[i][j] = r_pause_value_list[i][j];
                                    r_pause_time_list_next[i][j] = r_pause_time_list[i][j];
                                    r_pause_state_list_next[i][j] = r_pause_state_list[i][j];
                                    // update pause parameter condition, 
                                    // if the receive pause frame is valid,
                                    // if the receive vector is true, 
                                    // if the port matched
                                    if(w_pf_receive_valid & w_pf_receive_vector[j] &  (i == r_port_deparse_next))
                                        begin
                                            r_pause_value_list_next[i][j] = w_pf_receive_pause_rank_value[PAUSE_RANK_WIDTH * (j+1) - 1: PAUSE_RANK_WIDTH * j];
                                            // shift 1 for time value,
                                            r_pause_time_list_next[i][j] = w_pf_receive_pause_time_value[PAUSE_RANK_WIDTH * (j+1) - 1: PAUSE_RANK_WIDTH * j] << 1;
                                            
                                            
  
                                        end
                                     else
                                        begin
                                            // decrement timer, 
                                            r_pause_time_list_next[i][j] = r_pause_time_list_next[i][j] - 1;
                                            
                                        end
                                    
                                     // check if the updated or decremented time is 0
                                     // set unpause status
                                     if(r_pause_time_list_next[i][j] == 0)
                                              begin
                                                  //reset status.
                                                  r_pause_state_list_next[i][j] = 0;
                                                  r_pause_value_list_next[i][j] = 0;
                                              end
                                          else
                                              begin
                                                  r_pause_state_list_next[i][j] = 1;
                                              end                                
                                end
                            always@(posedge clk)
                                begin
                                    if(~rstn)
                                        begin
                                            r_pause_value_list[i][j] <= 0;
                                            r_pause_time_list[i][j] <= 0;                                       
                                            r_pause_state_list[i][j] <= 0;
                                            
                                        end
                                    else
                                        begin
                                            r_pause_value_list[i][j] <= r_pause_value_list_next[i][j];
                                            r_pause_time_list[i][j] <= r_pause_time_list_next[i][j];                                       
                                            r_pause_state_list[i][j] <= r_pause_state_list_next[i][j];
                                        end
                                end
                                   
                            // wire assign for output data,
                            
                        end
                end
            
            
endgenerate



// combinational block for pause frame generation,
always @(*)
begin
    
    // Check if any of the pause value is valid.
    if(w_pf_valid > 0)
        begin
            //generate pause frame.
            r_pf_next = {r_pf_ether_dmac, r_pf_ether_smac, r_pf_ether_type, 398'b0};
            r_pf_next[GPFC_OPCODE_END_POS:GPFC_OPCODE_START_POS] = r_pf_gpfc_opcode;
            // TC value
            r_pf_next[GPFC_VECTOR_END_POS:GPFC_VECTOR_START_POS] = w_pf_valid;
            // Pause Time
                        
            r_pf_next[GPFC_PTIME_END_POS:GPFC_PTIME_START_POS] = w_pf_pause_time_value;
            // Pause Rank
            r_pf_next[GPFC_PRANK_END_POS:GPFC_PRANK_START_POS] = w_pf_pause_rank_value;
                    
        end

end    


localparam IDLE = 0;
localparam WAIT_SECOND = 1;


//combinational block for pause frame receiving & handling
always @(*)
begin
    
    r_pf_first_chunk_next = 0;
    r_gpfc_fsm_next = r_gpfc_fsm;
    r_port_deparse_next = 0;
    
    
    case(r_gpfc_fsm)
        IDLE:
            begin
                // if the input pf is valid,
                // then keep the first chunk of the pf information,
                // move to next state.
                
                if(s_axis_tvalid)
                    begin
                        r_pf_first_chunk_next = s_axis_tdata;
                        r_gpfc_fsm_next = WAIT_SECOND;
                    end
                
            end
        WAIT_SECOND:
            begin
                // if the second input of pf is valid,
                // then get the remain information of the PF,
                if(s_axis_tvalid)
                    begin
                    // set next fsm status as IDLE,
                    r_gpfc_fsm_next = IDLE;
                    
                    // update pause state,
                    // update pause
                    
                    
                    case(s_axis_input_port)
                    //port nf0
                    'b00000001:
                        begin
                            r_port_deparse_next = 0;
                        end
                    //port nf1
                    'b00000100:
                        begin
                            r_port_deparse_next = 1;
                        end
                    //port nf2
                    'b00010000:
                        begin
                            r_port_deparse_next = 2;
                        end
                    //port nf3
                    'b01000000:
                        begin
                            r_port_deparse_next = 3;
                        end
                    // port cpu
                     default:
                        begin
                            r_port_deparse_next = 4;
                        end
                    
                    endcase
                     
                        
                    end

            end
        
    endcase

end    


always @(posedge clk)
begin

    if(~rstn) 
        begin
            // reset registers
            // reset pauseframe headers
            r_pf_ether_dmac <= 'h0180C2000001;
            r_pf_ether_smac <= 'hffffffffffff;
            r_pf_ether_type <= 'h8808;
            r_pf_gpfc_opcode <= 'h0101;
            r_pf_gpfc_pause_time <= 0;
            r_pf_gpfc_pause_value <= 0;
            
            r_gpfc_fsm <= 0;
            r_pf <= 0;
            
            r_pf_first_chunk <= 0;
            
            
        end
    else    
        begin
            // update registers,
            r_pf <= r_pf_next;
            r_gpfc_fsm <= r_gpfc_fsm_next;
           
        end 
end
    
endmodule
