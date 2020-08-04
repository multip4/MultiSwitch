`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2019 11:03:32 AM
// Design Name: 
// Module Name: output_queue_gpfc
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


module output_queue_gpfc
#(
    // Master AXI Stream Data Width
    parameter DATA_WIDTH=256,
    parameter PKT_BUFFER_WIDTH = 289,
    parameter META_WIDTH=128,
    parameter PIFO_WIDTH=40,
    parameter BUFFER_ADDR_WIDTH = 12,
    parameter PIFO_ADDR_WIDTH = 10,
    parameter BUFFER_WORD_DEPTH = 4096,
    parameter PIFO_WORD_DEPTH = 128,
    parameter OUTPUT_SYNC = 1,
    
    parameter GPFC_PAUSE_FRAME_WIDTH = 512,
    
    parameter PIFO_CALENDAR_SIZE = 128,
//    parameter ELEMENT_WIDTH = 40,
    parameter ELEMENT_VALID_WIDTH = 1,
    parameter ELEMENT_OVERFLOW_WIDTH = 1,
    parameter ELEMENT_RANK_WIDTH = 17,
    parameter GPFC_COS_WIDTH = 3,
    parameter GPFC_RANK_WIDTH = 6,
    parameter PKT_ADDRESS_WIDTH = 12,
    parameter GPFC_PAUSE_TC_NUM = 8,
    parameter GPFC_PAUSE_RANK_WIDTH = 16
    
    
    )
    (
    
    // I/O
    // Part 1: System side signals
    // Global Ports


    // Slave Stream Ports (interface to data path)
     input [DATA_WIDTH - 1:0]                        s_axis_tdata,
     input [((DATA_WIDTH / 8)) - 1:0]                s_axis_tkeep,
     input [META_WIDTH-1:0]                          s_axis_tuser,
     input [PIFO_WIDTH-1:0]                          s_axis_tpifo,
     input                                           s_axis_tvalid,    
     input                                           s_axis_tlast,
    
    
    // control signal from Enqueue Agent
     input                                           s_axis_buffer_wr_en,
     input                                           s_axis_pifo_insert_en,
    
    

    
    
    // output signal
     input                                           m_axis_tready,  // input ready signal from interface
     output                                          m_axis_tvalid, // output valid signal
     output [DATA_WIDTH - 1:0]                       m_axis_tdata,  // outptu pkt data
     output[((DATA_WIDTH / 8)) - 1:0]                m_axis_tkeep, // output keep data
     output                                          m_axis_tlast, // output last signal
     output [META_WIDTH-1:0]                         m_axis_tuser, // output metadata 
     output [PIFO_WIDTH-1:0]                         m_axis_tpifo,  // output pifo infomation.
     output                                          m_is_buffer_almost_full, // buffer almostfull signal
     output                                          m_is_pifo_full,
     output [BUFFER_ADDR_WIDTH-1:0]                  m_buffer_remain_size,
     output [BUFFER_ADDR_WIDTH-1:0]                  m_buffer_counter,
        
    
     //gpfc input
     input [GPFC_PAUSE_TC_NUM-1:0]                          s_axis_gpfc_pause_vector,
     input [GPFC_PAUSE_TC_NUM*GPFC_PAUSE_RANK_WIDTH-1:0]    s_axis_gpfc_pause_rank,

    // input for pause frame
    input                                                   s_axis_gpfc_pause_frame_valid,
    input [GPFC_PAUSE_FRAME_WIDTH-1:0]                      s_axis_gpfc_pause_frame_data,
    output                                                  m_axis_gpfc_pause_frame_ack,

    
    // clock and reset
    input axis_aclk,
    input axis_resetn
    );
    
    // ===================================
    // submodule parameters
    // ===================================
    
    localparam FSM_WIDTH = 3;
    localparam IDLE = 0;
    localparam BYPASS = 1;
    localparam UPDATE_FL_TAIL = 2;
    localparam READ_PKT = 3;
    localparam GPFC_WAIT_LAST = 4;
    

    // register for FSM
    reg [FSM_WIDTH-1:0] output_queue_fsm_state;
    reg [FSM_WIDTH-1:0] output_queue_fsm_state_next;
    
//    wire w_buffer_wr_en;
//    wire w_pifo_insert_en;
    
    // buffer module I/O
    reg                             r_buffer_rd_en;
    reg                             r_buffer_rd_en_next;
    reg                             r_buffer_first_word_en_next;
    
    reg [BUFFER_ADDR_WIDTH-1:0]     r_buffer_rd_addr;
    reg [BUFFER_ADDR_WIDTH-1:0]     r_buffer_rd_addr_next;
        
    wire [BUFFER_ADDR_WIDTH-1:0]    addr_manager_out_buffer_fl_tail;
    wire [BUFFER_ADDR_WIDTH-1:0]    addr_manager_out_buffer_fl_tail_next;
        
    wire [BUFFER_ADDR_WIDTH-1:0]    addr_manager_out_buffer_fl_head;
    wire [BUFFER_ADDR_WIDTH-1:0]    addr_manager_out_buffer_fl_head_next;
        
    wire [BUFFER_ADDR_WIDTH-1:0]    addr_manager_out_st_buffer_remain_space;
    wire                            addr_manager_out_st_buffer_almost_full;
    wire                            addr_manager_out_st_buffer_empty;
    
    reg                             ctl_buffer_wr_en;
    reg                             ctl_pifo_insert_en;
    
    
    // registers for output
    reg                                          r_m_axis_tvalid; // output valid signal
    reg [DATA_WIDTH - 1:0]                       r_m_axis_tdata;  // outptu pkt data
    reg[((DATA_WIDTH / 8)) - 1:0]                r_m_axis_tkeep; // output keep data
    reg                                          r_m_axis_tlast; // output last signal
    reg [META_WIDTH-1:0]                         r_m_axis_tuser; // output metadata 
    reg [PIFO_WIDTH-1:0]                         r_m_axis_tpifo;  // output pifo infomation.
        
    reg                                          r_m_axis_tvalid_next; // output valid signal
    reg [DATA_WIDTH - 1:0]                       r_m_axis_tdata_next;  // outptu pkt data
    reg[((DATA_WIDTH / 8)) - 1:0]                r_m_axis_tkeep_next; // output keep data
    reg                                          r_m_axis_tlast_next; // output last signal
    reg [META_WIDTH-1:0]                         r_m_axis_tuser_next; // output metadata 
    reg [PIFO_WIDTH-1:0]                         r_m_axis_tpifo_next;  // output pifo infomation.

    reg [DATA_WIDTH - 1:0]                        r_s_axis_tdata_d1; 
    reg [((DATA_WIDTH / 8)) - 1:0]                r_s_axis_tkeep_d1; 
    reg [META_WIDTH-1:0]                          r_s_axis_tuser_d1; 
    reg [PIFO_WIDTH-1:0]                          r_s_axis_tpifo_d1; 
    reg                                           r_s_axis_tvalid_d1;
    reg                                           r_s_axis_tlast_d1; 

    reg                                           r_s_axis_buffer_wr_en_d1; 
    reg                                           r_s_axis_pifo_insert_en_d1;
    
    reg [GPFC_PAUSE_FRAME_WIDTH-1:0]              r_s_axis_gpfc_pause_frame_data,r_s_axis_gpfc_pause_frame_data_next;
    reg                                           r_m_axis_gpfc_pause_frame_ack,r_m_axis_gpfc_pause_frame_ack_next;
    
    
    // output result for sop pkt addr 
    reg [BUFFER_ADDR_WIDTH-1:0] r_sop_addr;
    // buffer manager module inst
    addr_manager_gpfc
    #(
    .ADDR_WIDTH(BUFFER_ADDR_WIDTH),
    .ADDR_TABLE_DEPTH(BUFFER_WORD_DEPTH))
    addr_manager_inst
    (
    .s_axis_wr_en(ctl_buffer_wr_en),        // write signal for fl_head transition
    .s_axis_rd_en(r_buffer_rd_en_next),     // read signal 
        
    .s_axis_rd_pkt_sop_addr(r_sop_addr), // read address for sop 
    .s_axis_rd_first_word_en(r_buffer_first_word_en_next), // the first word signal, for fl_tail value update.
    
    .m_axis_fl_head(addr_manager_out_buffer_fl_head),       // next writable available address, same as free list head.
    .m_axis_fl_head_next(addr_manager_out_buffer_fl_head_next),
    .m_axis_fl_tail(addr_manager_out_buffer_fl_tail),
    .m_axis_fl_tail_next(addr_manager_out_buffer_fl_tail_next),  // next readable address, the value of index at fl_tail
    
    .m_axis_remain_space(addr_manager_out_st_buffer_remain_space), // statistics for buffer spae
    .m_axis_almost_full(addr_manager_out_st_buffer_almost_full),  // buffer almost full signal. 
    .m_axis_is_empty(addr_manager_out_st_buffer_empty),     // buffer empty signal
    .m_axis_buffer_counter(m_buffer_counter),
    
    .clk(axis_aclk),
    .rstn(axis_resetn)    //active low    
    );
 
    // buffer wrapper module inst
     
    wire [DATA_WIDTH - 1:0]                         w_buffer_wrapper_out_tdata;  // outptu pkt data
    wire [(DATA_WIDTH / 8) - 1:0]                   w_buffer_wrapper_out_tkeep; // output keep data
    wire                                            w_buffer_wrapper_out_tlast; // output last signal
    wire [META_WIDTH-1:0]                           w_buffer_wrapper_out_tuser; // output metadata 
    wire [PIFO_WIDTH-1:0]                           w_buffer_wrapper_out_tpifo;  // output pifo infomation.
    
    buffer_wrapper_gpfc
    #(.C_S_AXIS_ADDR_WIDTH(BUFFER_ADDR_WIDTH))
    buffer_wrapper_inst
    (
        .s_axis_tdata(s_axis_tdata),
        .s_axis_tkeep(s_axis_tkeep),
        .s_axis_tlast(s_axis_tlast),
        .s_axis_tuser(s_axis_tuser),
        .s_axis_tpifo(s_axis_tpifo),
        
        .m_axis_tdata(w_buffer_wrapper_out_tdata),
        .m_axis_tkeep(w_buffer_wrapper_out_tkeep),
        .m_axis_tlast(w_buffer_wrapper_out_tlast),
        .m_axis_tuser(w_buffer_wrapper_out_tuser),
        .m_axis_tpifo(w_buffer_wrapper_out_tpifo),
        
        .s_axis_wr_addr(addr_manager_out_buffer_fl_head),
        .s_axis_wr_en(ctl_buffer_wr_en),
        .s_axis_rd_addr(r_buffer_rd_addr_next),

        .clk(axis_aclk),
        .rstn(axis_resetn)    //active low    
    );   
    

    reg                             ctl_pifo_pop_en;    
        
    // define w_pifo_root_info_final.
    wire [PIFO_WIDTH-1:0]           w_pifo_root_info_final = {s_axis_tpifo[PIFO_WIDTH-1:BUFFER_ADDR_WIDTH],addr_manager_out_buffer_fl_head};
    wire [BUFFER_ADDR_WIDTH-1:0]    w_pifo_calendar_out_addr; 
    wire                            w_pifo_calendar_out_calendar_full;
    wire [PIFO_WIDTH-1:0]           w_pifo_calendar_out_pifo_calendar_top;

    wire w_pifo_calendar_out_bypass_en;
    wire w_pifo_calendar_out_pop_valid; //w_pifo_calendar_out_dequeue_is_not_paused
    
    pifo_calendar_gpfc_top
    #(
    .PIFO_CALENDAR_SIZE(PIFO_CALENDAR_SIZE),     
    .BUFFER_ADDR_WIDTH(BUFFER_ADDR_WIDTH),                      
    .ELEMENT_WIDTH(PIFO_WIDTH),           
    .ELEMENT_VALID_WIDTH(ELEMENT_VALID_WIDTH),      
    .ELEMENT_OVERFLOW_WIDTH(ELEMENT_OVERFLOW_WIDTH),   
    .ELEMENT_RANK_WIDTH(ELEMENT_RANK_WIDTH),      
    .GPFC_COS_WIDTH(GPFC_COS_WIDTH),           
    .GPFC_RANK_WIDTH(GPFC_RANK_WIDTH),          
    .PKT_ADDRESS_WIDTH(PKT_ADDRESS_WIDTH),       
    .GPFC_PAUSE_TC_NUM(GPFC_PAUSE_TC_NUM),        
    .GPFC_PAUSE_RANK_WIDTH(GPFC_PAUSE_RANK_WIDTH)   
    )
    pifo_calendar_inst
    (
        .s_axis_pifo_info_root0(w_pifo_root_info_final),
        .s_axis_pifo_info_root1(w_pifo_root_info_final),
        .s_axis_pifo_info_root2(w_pifo_root_info_final),
        .s_axis_pifo_info_root3(w_pifo_root_info_final),
        .s_axis_pifo_info_root4(w_pifo_root_info_final),
        .s_axis_pifo_info_root5(w_pifo_root_info_final),
        .s_axis_pifo_info_root6(w_pifo_root_info_final),
        .s_axis_pifo_info_root7(w_pifo_root_info_final),
        .s_axis_insert_en(s_axis_pifo_insert_en),
        .s_axis_pop_en(ctl_pifo_pop_en), // pop signal uses combinational logic output.
        .s_axis_gpfc_pause_vector(s_axis_gpfc_pause_vector),
        .s_axis_gpfc_pause_rank(s_axis_gpfc_pause_rank),
        
        .m_axis_pifo_calendar_top(w_pifo_calendar_out_pifo_calendar_top),
        .m_axis_buffer_addr(w_pifo_calendar_out_addr), // pop result, buffer address
        .m_axis_calendar_full(w_pifo_calendar_out_calendar_full),
        .m_axis_is_bypass(w_pifo_calendar_out_bypass_en),
        .m_axis_dequeue_is_not_paused(w_pifo_calendar_out_pop_valid),
        
        .clk(axis_aclk),                     
        .rstn(axis_resetn)    
    );
    
    // Combination Logic Block
    always @(*)
    begin
        // init all combinational logics to avoid latch.
        output_queue_fsm_state_next = output_queue_fsm_state;
        r_buffer_rd_en_next         = 0;
        r_buffer_first_word_en_next = 0;
        r_buffer_rd_addr_next       = r_buffer_rd_addr;
        ctl_pifo_pop_en             = 0;
        ctl_buffer_wr_en            = s_axis_buffer_wr_en;
        ctl_pifo_insert_en          = s_axis_pifo_insert_en;    
        r_sop_addr      = w_pifo_calendar_out_addr;
        
        r_m_axis_tvalid_next = 0;
        r_m_axis_tdata_next = r_m_axis_tdata;
        r_m_axis_tkeep_next = r_m_axis_tkeep;
        r_m_axis_tlast_next = r_m_axis_tlast;
        r_m_axis_tuser_next = r_m_axis_tuser;
        r_m_axis_tpifo_next = r_m_axis_tpifo;
        
        r_s_axis_gpfc_pause_frame_data_next = r_s_axis_gpfc_pause_frame_data;
        r_m_axis_gpfc_pause_frame_ack_next = 0;

//        if(s_axis_tlast) r_sop_addr_next = addr_manager_out_buffer_fl_head_next;
        
        case(output_queue_fsm_state)
            
            // default state:
            // goto BYPASS if [port_ready and input_valid and (bypass_by_lower_rank or bypass_by_buffer_empty)
            // goto UPDATE_FL_TAIL if [port_ready and (input_not_valid or (input_valid and not ((bypass_by_lower_rank or bypass_by_buffer_empty)))]
            // stay IDLE state in oter case.
            IDLE:
                begin
                    if(m_axis_tready) // port ready.
                        begin
                            
                            // redesign the output queue fsm logic.
                            // 2020.07.22
                            // Zhenguo Cui
                            
                            
                            // Algorithm
                            // in the IDLE state,
                            // if the dequeue signal is on, then do following condition checking
                            // 1, check if the GPFC(or W-PFC) pause signal is valid, send first chunk, and goto next GPFC state
                            // 2, else, set pop signal to PIFO check the PIFO calendar output signal,
                            //     if w_pifo_calendar_out_dequeue_is_not_paused is on, then read data from buffer, go to head update state
                            //     if the bypass is on, then read data from input, go to bypass state.
                            
                            
                            // implementation start.
                            
                            // condition, 
                            // first check the pause frame
                            if(s_axis_gpfc_pause_frame_valid)
                                begin
                                    // first set the handshaking signal to 1.
                                    r_m_axis_gpfc_pause_frame_ack_next = 1;
                                    // update the pause frame to register.
                                    r_s_axis_gpfc_pause_frame_data_next = s_axis_gpfc_pause_frame_data;
                                    
                                    // set output data.
                                    r_m_axis_tvalid_next = 1;
                                    r_m_axis_tdata_next = s_axis_gpfc_pause_frame_data[GPFC_PAUSE_FRAME_WIDTH - 1:DATA_WIDTH];
                                    r_m_axis_tkeep_next = 32'hffffffff;
                                    r_m_axis_tlast_next = 0;
                                    r_m_axis_tuser_next = {112'h0,16'd520};
                                    r_m_axis_tpifo_next = r_m_axis_tpifo;
                                    
                                    // go to next state.
                                    output_queue_fsm_state_next = GPFC_WAIT_LAST;
                                end
                            
                            // else, try pop from PIFO calendar
                            else
                                begin
                                    // set pop signal,
                                    ctl_pifo_pop_en = 1; 
                                    
                                    
                                    // if the PIFO calendar returns the bypas signal as true
                                    // then bypass
                                    if(w_pifo_calendar_out_bypass_en)
                                        begin
                                            output_queue_fsm_state_next = BYPASS;
                                            r_m_axis_tvalid_next = s_axis_tvalid;
                                            r_m_axis_tdata_next = s_axis_tdata;
                                            r_m_axis_tkeep_next = s_axis_tkeep;
                                            r_m_axis_tlast_next = s_axis_tlast;
                                            r_m_axis_tuser_next = s_axis_tuser;
                                            r_m_axis_tpifo_next = s_axis_tpifo;
                                            
                                            ctl_buffer_wr_en = 0;
                                            ctl_pifo_insert_en = 0;                                            
                                        
                                        end
                                    
                                    // if the PIFO calendar returns the not pause signal is true
                                    // then read from buffer
                                    if(w_pifo_calendar_out_pop_valid)
                                        begin
                                            output_queue_fsm_state_next = UPDATE_FL_TAIL;
                                            r_buffer_rd_addr_next = w_pifo_calendar_out_addr;
                                            r_buffer_first_word_en_next = 1; // first word control signal set to 1.
                                            r_buffer_rd_en_next = 0;
//                                            ctl_pifo_pop_en = 1;  
                                        end
                            
                            
//                            else if(~r_s_axis_buffer_wr_en_d1 & ~addr_manager_out_st_buffer_empty)
//                                begin
//                                    output_queue_fsm_state_next = UPDATE_FL_TAIL;
//                                    ctl_pifo_pop_en = 1;
//                                    r_buffer_rd_addr_next = w_pifo_calendar_out_addr;
//                                    r_buffer_first_word_en_next = 1; // first word control signal set to 1.
//                                    r_buffer_rd_en_next = 0;                                    
//                                end
//                            // if the buffer write signal from enqueue_agent valid.
//                            // (which means the input pkt's output queue is current output queue)
//                            // goto CHECK_BY_PASS state
                            
                            
//                            else if(r_s_axis_buffer_wr_en_d1)
//                                begin
//                                    // if the buffer is empty then bypass or 
//                                    // if the input data is more significant than the first element in pifo_calendar.
//                                    // then bypass
//                                    if(w_bypass_checker_out_bypass_en)
//                                        begin
//                                            output_queue_fsm_state_next = BYPASS;
//                                            r_m_axis_tvalid_next = r_s_axis_tvalid_d1;
//                                            r_m_axis_tdata_next = r_s_axis_tdata_d1;
//                                            r_m_axis_tkeep_next = r_s_axis_tkeep_d1;
//                                            r_m_axis_tlast_next = r_s_axis_tlast_d1;
//                                            r_m_axis_tuser_next = r_s_axis_tuser_d1;
//                                            r_m_axis_tpifo_next = r_s_axis_tpifo_d1;
                                            
//                                            ctl_buffer_wr_en = 0;
//                                            ctl_pifo_insert_en = 0;
//                                        end   
                                    
//                                    // otherwise,
//                                    // put new element to PIFO calendar,
//                                    // and pop pkt from PIFO calendar.
//                                    else
//                                        begin
//                                            output_queue_fsm_state_next = UPDATE_FL_TAIL;
//                                            r_buffer_rd_addr_next = w_pifo_calendar_out_addr;
//                                            r_buffer_first_word_en_next = 1; // first word control signal set to 1.
//                                            r_buffer_rd_en_next = 0;
//                                            ctl_pifo_pop_en = 1;                                        
//                                        end
                                end    
                        
                        end
                end
            
            // bypass pkt until the port not ready.
            // goto the IDLE state if get eop and port is ready.
            // if port not ready,
            // then go to UPDATE_FL_TAIL state
            BYPASS:
                begin
                    // set output value.
//                    
                    r_m_axis_tdata_next = s_axis_tdata;
                    r_m_axis_tkeep_next = s_axis_tkeep;
                    r_m_axis_tlast_next = s_axis_tlast;
                    r_m_axis_tuser_next = s_axis_tuser;
                    r_m_axis_tpifo_next = s_axis_tpifo;                            

                    if(m_axis_tready) // port ready
                        begin                            
                            // set buffer write signal to 0.
                            ctl_buffer_wr_en = 0;
                            
                            //20.07.24 debug
                            r_m_axis_tvalid_next = s_axis_tvalid;
                            
                            // go to IDLE state if get eop pkt chunk
                            if(s_axis_tlast)
                                output_queue_fsm_state_next = IDLE;                            

                        end
                    // else, goto UPDATE_FL_TAIL state
                    else
                        begin
                            // update sop address.
                            output_queue_fsm_state_next = UPDATE_FL_TAIL;
                            r_sop_addr = addr_manager_out_buffer_fl_head;
                            r_buffer_rd_addr_next = addr_manager_out_buffer_fl_head;
                            r_buffer_first_word_en_next = 1; // first word control signal set to 1.
                            r_buffer_rd_en_next = 0;                          
                            
                        end
                end
                
            //  in UPDATE_FL_TAIL state, update fl_tail link,
            // then go to READ_PKT state.
            UPDATE_FL_TAIL:
                begin
//                    if(m_axis_tready)
//                        begin
                            output_queue_fsm_state_next = READ_PKT;
//                            r_buffer_rd_addr_next = addr_manager_out_buffer_fl_tail;                                                   
//                            r_m_axis_tvalid_next = 1;
                            r_buffer_rd_en_next = 1;                           
//                        end
                end
            // read pkt from buffer until get the eop chunk
            // goto IDLE state if get the eop chunck    
            READ_PKT:
                begin

//                    r_m_axis_tvalid_next = 1;

                    r_m_axis_tdata_next = w_buffer_wrapper_out_tdata;
                    r_m_axis_tkeep_next = w_buffer_wrapper_out_tkeep;
                    r_m_axis_tlast_next = w_buffer_wrapper_out_tlast;
                    r_m_axis_tuser_next = w_buffer_wrapper_out_tuser;
                    r_m_axis_tpifo_next = w_buffer_wrapper_out_tpifo;

                    if(m_axis_tready)
                        begin
                            // set output value.
     
                            r_m_axis_tvalid_next = 1;
                            //if(w_buffer_wrapper_out_tlast) //
                            if(r_m_axis_tlast_next)
                                output_queue_fsm_state_next = IDLE;
                            else
                                begin
                                    r_buffer_rd_en_next = 1;
                                    r_buffer_rd_addr_next = addr_manager_out_buffer_fl_tail_next;
                                end
                        end
                end
            GPFC_WAIT_LAST:
                begin
                    
                    // send second pause frame chunk, then goto IDLE.
                    r_m_axis_tvalid_next = 1;
                    r_m_axis_tdata_next = r_s_axis_gpfc_pause_frame_data[DATA_WIDTH - 1:0];
                    r_m_axis_tkeep_next = 32'hffffffff;
                    r_m_axis_tlast_next = 1;
                    r_m_axis_tuser_next = {112'h0,16'd520};
                    r_m_axis_tpifo_next = r_m_axis_tpifo;
                    
                    if(m_axis_tready)
                        begin
                            output_queue_fsm_state_next = IDLE;
                        end
                end
        
        endcase
        
    end
    
    
    //Sync block 
    always @(posedge axis_aclk) 
    begin
    
        if(~axis_resetn) // reset active low, 0 means reset.
            begin
                output_queue_fsm_state <= 0;
                r_buffer_rd_en <= 0;
                r_buffer_rd_addr <= 0;
//                r_sop_addr <= 0;
                
                r_m_axis_tvalid <=0;
                r_m_axis_tdata <=0;
                r_m_axis_tkeep <=0;
                r_m_axis_tlast <=0;
                r_m_axis_tuser <=0;
                r_m_axis_tpifo <=0;

                r_s_axis_tdata_d1   <=0; 
                r_s_axis_tkeep_d1   <=0; 
                r_s_axis_tuser_d1   <=0; 
                r_s_axis_tpifo_d1   <=0; 
                r_s_axis_tvalid_d1  <=0;
                r_s_axis_tlast_d1   <=0;               
                r_s_axis_buffer_wr_en_d1 <=0;  
                r_s_axis_pifo_insert_en_d1 <=0;   
                
                r_s_axis_gpfc_pause_frame_data <= 0;
                r_m_axis_gpfc_pause_frame_ack <= 0;
                
            end
        else
            begin
                output_queue_fsm_state <= output_queue_fsm_state_next;
                r_buffer_rd_en <= r_buffer_rd_en_next;
                r_buffer_rd_addr <= r_buffer_rd_addr_next;
//                r_sop_addr <= r_sop_addr_next;
                
                r_m_axis_tvalid <=  r_m_axis_tvalid_next;
                r_m_axis_tdata  <=  r_m_axis_tdata_next;
                r_m_axis_tkeep  <=  r_m_axis_tkeep_next;
                r_m_axis_tlast  <=  r_m_axis_tlast_next;
                r_m_axis_tuser  <=  r_m_axis_tuser_next;
                r_m_axis_tpifo  <=  r_m_axis_tpifo_next;               
                
                r_s_axis_tdata_d1   <= s_axis_tdata; 
                r_s_axis_tkeep_d1   <= s_axis_tkeep; 
                r_s_axis_tuser_d1   <= s_axis_tuser; 
                r_s_axis_tpifo_d1   <= s_axis_tpifo; 
                r_s_axis_tvalid_d1  <= s_axis_tvalid;
                r_s_axis_tlast_d1   <= s_axis_tlast;               
                r_s_axis_buffer_wr_en_d1 <= s_axis_buffer_wr_en;  
                r_s_axis_pifo_insert_en_d1 <= s_axis_pifo_insert_en;
                r_s_axis_gpfc_pause_frame_data <= r_s_axis_gpfc_pause_frame_data_next;
                r_m_axis_gpfc_pause_frame_ack <= r_m_axis_gpfc_pause_frame_ack_next;
                           
            end
    end
    

//assign m_axis_tvalid =  (OUTPUT_SYNC)? r_m_axis_tvalid & m_axis_tready : r_m_axis_tvalid_next & m_axis_tready;
assign m_axis_tvalid = (OUTPUT_SYNC)? r_m_axis_tvalid: r_m_axis_tvalid_next;
assign m_axis_tdata = (OUTPUT_SYNC)? r_m_axis_tdata: r_m_axis_tdata_next;
assign m_axis_tkeep = (OUTPUT_SYNC)? r_m_axis_tkeep: r_m_axis_tkeep_next;
assign m_axis_tlast = (OUTPUT_SYNC)? r_m_axis_tlast: r_m_axis_tlast_next;
assign m_axis_tuser = (OUTPUT_SYNC)? r_m_axis_tuser: r_m_axis_tuser_next;
assign m_axis_tpifo = (OUTPUT_SYNC)? r_m_axis_tpifo: r_m_axis_tpifo_next;

assign m_is_buffer_almost_full = addr_manager_out_st_buffer_almost_full;

//assign m_is_pifo_full = w_pifo_calendar_out_calendar_full;
assign m_is_pifo_full = 0;

assign m_buffer_remain_size = addr_manager_out_st_buffer_remain_space;

assign m_axis_gpfc_pause_frame_ack = r_m_axis_gpfc_pause_frame_ack;

endmodule

