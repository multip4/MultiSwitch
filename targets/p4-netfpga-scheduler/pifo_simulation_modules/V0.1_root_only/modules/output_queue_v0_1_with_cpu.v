`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/20/2019 11:03:32 AM
// Design Name: 
// Module Name: output_queue_v0_1_with_cpu
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


module output_queue_v0_1_with_cpu
#(
    // Master AXI Stream Data Width
    parameter DATA_WIDTH=256,
    parameter PKT_BUFFER_WIDTH = 289,
    parameter META_WIDTH=128,
    parameter PIFO_WIDTH=32,
    parameter BUFFER_ADDR_WIDTH = 12,
    parameter PIFO_ADDR_WIDTH = 10,
    parameter BUFFER_WORD_DEPTH = 4096,
    parameter PIFO_WORD_DEPTH = 1024,
    parameter OUTPUT_SYNC = 0
    )
    (
    
    // I/O
    // Part 1: System side signals
    // Global Ports


    // Slave Stream Ports (interface to data path)
    (* mark_debug = "true" *) input [DATA_WIDTH - 1:0]                        s_axis_tdata,
    (* mark_debug = "true" *) input [((DATA_WIDTH / 8)) - 1:0]                s_axis_tkeep,
    (* mark_debug = "true" *) input [META_WIDTH-1:0]                          s_axis_tuser,
    (* mark_debug = "true" *) input [PIFO_WIDTH-1:0]                          s_axis_tpifo,
    (* mark_debug = "true" *) input                                           s_axis_tvalid,    
    (* mark_debug = "true" *) input                                           s_axis_tlast,
    
    
    // control signal from Enqueue Agent
    (* mark_debug = "true" *) input                                           s_axis_buffer_wr_en,
    (* mark_debug = "true" *) input                                           s_axis_pifo_insert_en,
    
    
    // output signal
    (* mark_debug = "true" *) input                                           m_axis_tready,  // input ready signal from interface
    (* mark_debug = "true" *) output                                          m_axis_tvalid, // output valid signal
    (* mark_debug = "true" *) output [DATA_WIDTH - 1:0]                       m_axis_tdata,  // outptu pkt data
    (* mark_debug = "true" *) output[((DATA_WIDTH / 8)) - 1:0]                m_axis_tkeep, // output keep data
    (* mark_debug = "true" *) output                                          m_axis_tlast, // output last signal
    (* mark_debug = "true" *) output [META_WIDTH-1:0]                         m_axis_tuser, // output metadata 
    (* mark_debug = "true" *) output [PIFO_WIDTH-1:0]                         m_axis_tpifo,  // output pifo infomation.
    (* mark_debug = "true" *) output                                          m_is_buffer_almost_full, // buffer almostfull signal
    (* mark_debug = "true" *) output                                          m_is_pifo_full,
    (* mark_debug = "true" *) output [BUFFER_ADDR_WIDTH-1:0]                  m_buffer_remain_size,
    (* mark_debug = "true" *) output [BUFFER_ADDR_WIDTH-1:0]                  m_buffer_counter,
        

    //cpu signals
    
    // cpu2ip read signal
    
    // read from pkt buffer
    input     [BUFFER_ADDR_WIDTH-1:0]       cpu2ip_read_pkt_buffer_req_addr,
    input                                   cpu2ip_read_pkt_buffer_req_valid,
    output    [PKT_BUFFER_WIDTH-1:0]        ip2cpu_read_pkt_buffer_resp_value,
    output                                  ip2cpu_read_pkt_buffer_resp_valid,
        
    // read from sume meta buffer
    input     [BUFFER_ADDR_WIDTH-1:0]       cpu2ip_read_sume_buffer_req_addr,
    input                                   cpu2ip_read_sume_buffer_req_valid,
    output      [META_WIDTH-1:0]            ip2cpu_read_sume_buffer_resp_value,
    output                                  ip2cpu_read_sume_buffer_resp_valid,
    

    // read from pifo info buffer
    input     [BUFFER_ADDR_WIDTH-1:0]       cpu2ip_read_pifo_buffer_req_addr,
    input                                   cpu2ip_read_pifo_buffer_req_valid,
    output      [PIFO_WIDTH-1:0]            ip2cpu_read_pifo_buffer_resp_value,
    output                                  ip2cpu_read_pifo_buffer_resp_valid,
        
    // read from pifo calendar
    input     [PIFO_ADDR_WIDTH-1:0]       cpu2ip_read_pifo_calendar_req_addr,
    input                                   cpu2ip_read_pifo_calendar_req_valid,
    output    [PIFO_WIDTH-1:0]              ip2cpu_read_pifo_calendar_resp_value,
    output                                  ip2cpu_read_pifo_calendar_resp_valid,    
    
    
    // cpu2ip write    
    
    // write pkt buffer
    
    input     [BUFFER_ADDR_WIDTH-1:0]       cpu2ip_write_pkt_buffer_req_addr,
    input     [PKT_BUFFER_WIDTH-1:0]        cpu2ip_write_pkt_buffer_req_value,
    input                                   cpu2ip_write_pkt_buffer_req_valid,
    output                                  ip2cpu_write_pkt_buffer_resp_valid,
        
    // write sume buffer

    input     [BUFFER_ADDR_WIDTH-1:0]       cpu2ip_write_sume_buffer_req_addr,
    input     [META_WIDTH-1:0]              cpu2ip_write_sume_buffer_req_value,
    input                                   cpu2ip_write_sume_buffer_req_valid,
    output                                  ip2cpu_write_sume_buffer_resp_valid,    
    
    // write pifo buffer

    input     [BUFFER_ADDR_WIDTH-1:0]       cpu2ip_write_pifo_buffer_req_addr,
    input     [PIFO_WIDTH-1:0]              cpu2ip_write_pifo_buffer_req_value,
    input                                   cpu2ip_write_pifo_buffer_req_valid,
    output                                  ip2cpu_write_pifo_buffer_resp_valid,    
    
    
    // write pifo calendar
    
    input     [PIFO_ADDR_WIDTH-1:0]       cpu2ip_write_pifo_calendar_req_addr,
    input     [PIFO_WIDTH-1:0]              cpu2ip_write_pifo_calendar_req_value,
    input                                   cpu2ip_write_pifo_calendar_req_valid,
    output                                  ip2cpu_write_pifo_calendar_resp_valid,     
    
    // clock and reset
    input axis_aclk,
    input axis_resetn
    );
    
    // ===================================
    // submodule parameters
    // ===================================
    
    localparam FSM_WIDTH = 2;
    localparam IDLE = 0;
    localparam BYPASS = 1;
    localparam UPDATE_FL_TAIL = 2;
    localparam READ_PKT = 3; 
    

    // register for FSM
    (* mark_debug = "true" *) reg [FSM_WIDTH-1:0] output_queue_fsm_state;
    reg [FSM_WIDTH-1:0] output_queue_fsm_state_next;
    
//    wire w_buffer_wr_en;
//    wire w_pifo_insert_en;
    
    // buffer module I/O
    reg                             r_buffer_rd_en;
    (* mark_debug = "true" *) reg                             r_buffer_rd_en_next;
    
    reg                             r_buffer_rd_en_d1;
    reg                             r_buffer_rd_en_d1_next;
            
//    reg                             r_buffer_first_word_en;
    reg                             r_buffer_first_word_en_next;
    
    reg                             m_axis_tvalid_next;
    
    reg                             bypass_by_buffer_empty;
    
        
    reg [BUFFER_ADDR_WIDTH-1:0]     r_buffer_rd_addr;
    (* mark_debug = "true" *) reg [BUFFER_ADDR_WIDTH-1:0]     r_buffer_rd_addr_next;
        
    (* mark_debug = "true" *) wire [BUFFER_ADDR_WIDTH-1:0]    addr_manager_out_buffer_fl_tail;
    (* mark_debug = "true" *) wire [BUFFER_ADDR_WIDTH-1:0]    addr_manager_out_buffer_fl_tail_next;
        
    (* mark_debug = "true" *) wire [BUFFER_ADDR_WIDTH-1:0]    addr_manager_out_buffer_fl_head;
    (* mark_debug = "true" *) wire [BUFFER_ADDR_WIDTH-1:0]    addr_manager_out_buffer_fl_head_next;
        
    (* mark_debug = "true" *) wire [BUFFER_ADDR_WIDTH-1:0]    addr_manager_out_st_buffer_remain_space;
    (* mark_debug = "true" *) wire                            addr_manager_out_st_buffer_almost_full;
    (* mark_debug = "true" *) wire                            addr_manager_out_st_buffer_empty;
    
    (* mark_debug = "true" *) reg                            ctl_buffer_write_no_bypass;
    (* mark_debug = "true" *) reg                            ctl_pifo_insert_no_bypass;
    
    
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
 
    
    // output result for sop pkt addr 
    wire [BUFFER_ADDR_WIDTH-1:0] w_pifo_calendar_out_addr; 
    reg [BUFFER_ADDR_WIDTH-1:0] sop_addr;
    // buffer manager module inst
    addr_manager_v0_2
    #(
    .ADDR_WIDTH(BUFFER_ADDR_WIDTH),
    .ADDR_TABLE_DEPTH(BUFFER_WORD_DEPTH))
    addr_manager_inst
    (
    .s_axis_wr_en(ctl_buffer_write_no_bypass), // write signal for fl_head transition
    .s_axis_rd_en(r_buffer_rd_en_next),    // read signal 
        
    .s_axis_rd_pkt_sop_addr(sop_addr), // read address for sop 
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
     
     
    //wire                                            w_buffer_wrapper_out_tvalid; // output valid signal
    wire [DATA_WIDTH - 1:0]                         w_buffer_wrapper_out_tdata;  // outptu pkt data
    wire [(DATA_WIDTH / 8) - 1:0]                   w_buffer_wrapper_out_tkeep; // output keep data
    wire                                            w_buffer_wrapper_out_tlast; // output last signal
    wire [META_WIDTH-1:0]                           w_buffer_wrapper_out_tuser; // output metadata 
    wire [PIFO_WIDTH-1:0]                           w_buffer_wrapper_out_tpifo;  // output pifo infomation.
    
    buffer_wrapper_v1_0_with_cpu
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
        .s_axis_wr_en(ctl_buffer_write_no_bypass),
        .s_axis_rd_addr(r_buffer_rd_addr_next),

        .cpu_rd_pkt_valid(cpu2ip_read_pkt_buffer_req_valid),                   
        .cpu_rd_pkt_addr(cpu2ip_read_pkt_buffer_req_addr),                    
        .cpu_rd_pkt_result_valid(ip2cpu_read_pkt_buffer_resp_valid),            
        .cpu_rd_pkt_result_data(ip2cpu_read_pkt_buffer_resp_value),             
                                            
        .cpu_wr_pkt_valid(cpu2ip_write_pkt_buffer_req_valid),                   
        .cpu_wr_pkt_addr(cpu2ip_write_pkt_buffer_req_addr),                    
        .cpu_wr_pkt_data(cpu2ip_write_pkt_buffer_req_value),                    
        .cpu_wr_pkt_result_valid(ip2cpu_write_pkt_buffer_resp_valid),            
                                            
        .cpu_rd_meta_valid(cpu2ip_read_sume_buffer_req_valid),                  
        .cpu_rd_meta_addr(cpu2ip_read_sume_buffer_req_addr),                   
        .cpu_rd_meta_result_valid(ip2cpu_read_sume_buffer_resp_valid),           
        .cpu_rd_meta_result_data(ip2cpu_read_sume_buffer_resp_value),            
                                            
        .cpu_wr_meta_valid(cpu2ip_write_sume_buffer_req_valid),                  
        .cpu_wr_meta_addr(cpu2ip_write_sume_buffer_req_addr),                   
        .cpu_wr_meta_data(cpu2ip_write_sume_buffer_req_value),                   
        .cpu_wr_meta_result_valid(ip2cpu_write_sume_buffer_resp_valid),           
                                            
        .cpu_rd_pifo_valid(cpu2ip_read_pifo_buffer_req_valid),                  
        .cpu_rd_pifo_addr(cpu2ip_read_pifo_buffer_req_addr),                   
        .cpu_rd_pifo_result_valid(ip2cpu_read_pifo_buffer_resp_valid),           
        .cpu_rd_pifo_result_data(ip2cpu_read_pifo_buffer_resp_value),            
                                            
        .cpu_wr_pifo_valid(cpu2ip_write_pifo_buffer_req_valid),                  
        .cpu_wr_pifo_addr(cpu2ip_write_pifo_buffer_req_addr),                   
        .cpu_wr_pifo_data(cpu2ip_write_pifo_buffer_req_value),                   
        .cpu_wr_pifo_result_valid(ip2cpu_write_pifo_buffer_resp_valid),           

        .clk(axis_aclk),
        .rstn(axis_resetn)    //active low    
    );   
    
//    reg                             r_pifo_pop_en;
    reg                             ctl_pifo_pop_en;    
    reg [BUFFER_ADDR_WIDTH-1:0] r_sop_addr;
    reg [BUFFER_ADDR_WIDTH-1:0] r_sop_addr_next;
        

    wire                         w_pifo_calendar_out_valid;
    wire                         w_pifo_calendar_out_bypass_en;
    wire                         w_pifo_calendar_out_caledar_full;

    wire [PIFO_WIDTH-1:0]  w_pifo_root_info_final;
    wire                   w_bypass_final;
    
    // define w_pifo_root_info_final.
    // set the field value as fl_head.
    assign w_pifo_root_info_final = {s_axis_tpifo[PIFO_WIDTH-1:BUFFER_ADDR_WIDTH],r_sop_addr};
    

    
    pifo_calendar_v0_1_with_cpu
    #(
    .PIFO_CALENDAR_SIZE(PIFO_WORD_DEPTH),
    .BUFFER_ADDR_WIDTH(BUFFER_ADDR_WIDTH),
    .PIFO_CALENDAR_INDEX_WIDTH(PIFO_ADDR_WIDTH)
    )
    pifo_calendar_inst
    (
        .s_axis_pifo_info_root(w_pifo_root_info_final),
        .s_axis_insert_en(ctl_pifo_insert_no_bypass),
        .s_axis_pop_en(ctl_pifo_pop_en), // pop signal uses combinational logic output.
        
        .m_axis_buffer_addr(w_pifo_calendar_out_addr), // pop result, buffer address
        .m_axis_buffer_addr_valid(w_pifo_calendar_out_valid), // indicate the value is valid.
        .m_axis_bypass_en(w_pifo_calendar_out_bypass_en),
        .m_axis_calendar_full(w_pifo_calendar_out_caledar_full),
        // add cpu i/o later.
        
        .cpu_rd_valid(cpu2ip_read_pifo_calendar_req_valid),                  
        .cpu_rd_addr(cpu2ip_read_pifo_calendar_req_addr),                   
        .cpu_rd_result_valid(ip2cpu_read_pifo_calendar_resp_valid),           
        .cpu_rd_result(ip2cpu_read_pifo_calendar_resp_value),                 
                                       
        .cpu_wr_valid(cpu2ip_write_pifo_calendar_req_valid),                  
        .cpu_wr_addr(cpu2ip_write_pifo_calendar_req_addr),                   
        .cpu_wr_data(cpu2ip_write_pifo_calendar_req_value),                   
        .cpu_wr_result_valid(ip2cpu_write_pifo_calendar_resp_valid),           
        
        // reset & clock
        .clk(axis_aclk),
        .rstn(axis_resetn)
        
    );
    
    // Combination Logic Block
    always @(*)
    begin
        // init all combinational logics to avoid latch.
        output_queue_fsm_state_next = output_queue_fsm_state;
        r_buffer_rd_en_next = 0;
        r_buffer_first_word_en_next = 0;
        r_buffer_rd_addr_next = r_buffer_rd_addr;
        ctl_pifo_pop_en = 0;
        ctl_buffer_write_no_bypass = s_axis_buffer_wr_en;
        ctl_pifo_insert_no_bypass = s_axis_pifo_insert_en;
        r_buffer_rd_en_d1_next = r_buffer_rd_en;
        m_axis_tvalid_next = 0;
        r_sop_addr_next = r_sop_addr;
        bypass_by_buffer_empty = 0;
        
        sop_addr = w_pifo_calendar_out_addr;
        
        
        r_m_axis_tvalid_next = 0;
        r_m_axis_tdata_next = r_m_axis_tdata;
        r_m_axis_tkeep_next = r_m_axis_tkeep;
        r_m_axis_tlast_next = r_m_axis_tlast;
        r_m_axis_tuser_next = r_m_axis_tuser;
        r_m_axis_tpifo_next = r_m_axis_tpifo;
        
        
        if(s_axis_tlast) r_sop_addr_next = addr_manager_out_buffer_fl_head_next;
        
        case(output_queue_fsm_state)
            
            // default state:
            // goto BYPASS if [port_ready and input_valid and (bypass_by_lower_rank or bypass_by_buffer_empty)
            // goto UPDATE_FL_TAIL if [port_ready and (input_not_valid or (input_valid and not ((bypass_by_lower_rank or bypass_by_buffer_empty)))]
            // stay IDLE state in oter case.
            IDLE:
                begin
                    if(m_axis_tready) // port ready.
                        begin
                            // if input is not valid and buffer is not empty
                            // go to UPDATE_FL_TAIL state
                            if(~s_axis_tvalid & ~addr_manager_out_st_buffer_empty)
                                begin
                                    output_queue_fsm_state_next = UPDATE_FL_TAIL;
                                    ctl_pifo_pop_en = 1;
                                    r_buffer_rd_addr_next = w_pifo_calendar_out_addr;
                                    r_buffer_first_word_en_next = 1; // first word control signal set to 1.
                                    r_buffer_rd_en_next = 0;                                    
                                end
                            // if the buffer write signal from enqueue_agent valid.
                            // (which means the input pkt's output queue is current output queue)
                            // few more conditions to decide bypass or queueing.
                            else if(s_axis_buffer_wr_en)
                                begin
                                    // if the buffer is empty then bypass or 
                                    // if the input data is more significant than the first element in pifo_calendar.
                                    // then bypass
                                    if(w_bypass_final)
                                        begin
                                            output_queue_fsm_state_next = BYPASS;
                                            r_m_axis_tvalid_next = s_axis_tvalid;
                                            r_m_axis_tdata_next = s_axis_tdata;
                                            r_m_axis_tkeep_next = s_axis_tkeep;
                                            r_m_axis_tlast_next = s_axis_tlast;
                                            r_m_axis_tuser_next = s_axis_tuser;
                                            r_m_axis_tpifo_next = s_axis_tpifo;
                                            
                                            ctl_buffer_write_no_bypass = 0;
                                            ctl_pifo_insert_no_bypass = 0;
                                        end   
                                    
                                    // otherwise,
                                    // put new element to PIFO calendar,
                                    // and pop pkt from PIFO calendar.
                                    else
                                        begin
                                            output_queue_fsm_state_next = UPDATE_FL_TAIL;
                                            r_buffer_rd_addr_next = w_pifo_calendar_out_addr;
                                            r_buffer_first_word_en_next = 1; // first word control signal set to 1.
                                            r_buffer_rd_en_next = 0;
                                            ctl_pifo_pop_en = 1;                                        
                                        end
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
                            r_m_axis_tvalid_next = s_axis_tvalid;
                            r_m_axis_tdata_next = s_axis_tdata;
                            r_m_axis_tkeep_next = s_axis_tkeep;
                            r_m_axis_tlast_next = s_axis_tlast;
                            r_m_axis_tuser_next = s_axis_tuser;
                            r_m_axis_tpifo_next = s_axis_tpifo;                            

                    if(m_axis_tready) // port ready
                        begin                            
                            // set buffer write signal to 0.
                            ctl_buffer_write_no_bypass = 0;
                            
                            // go to IDLE state if get eop pkt chunk
                            if(s_axis_tlast)
                                output_queue_fsm_state_next = IDLE;                            

                        end
                    // else, goto UPDATE_FL_TAIL state
                    else
                        begin
                            // update sop address.
                            output_queue_fsm_state_next = UPDATE_FL_TAIL;
                            sop_addr = addr_manager_out_buffer_fl_head;
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

                    r_m_axis_tvalid_next = 1;

                    r_m_axis_tdata_next = w_buffer_wrapper_out_tdata;
                    r_m_axis_tkeep_next = w_buffer_wrapper_out_tkeep;
                    r_m_axis_tlast_next = w_buffer_wrapper_out_tlast;
                    r_m_axis_tuser_next = w_buffer_wrapper_out_tuser;
                    r_m_axis_tpifo_next = w_buffer_wrapper_out_tpifo;

                    if(m_axis_tready)
                        begin
                            // set output value.
     

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
        
        endcase
        
    end
    
    
    //Sync block 
    always @(posedge axis_aclk) 
    begin
    
        if(~axis_resetn) // reset active low, 0 means reset.
            begin
                output_queue_fsm_state <= 0;
                r_buffer_rd_en <= 0;
                r_buffer_rd_en_d1 <= 0;
//                r_buffer_first_word_en <= 0;
                r_buffer_rd_addr <= 0;
                r_sop_addr <= 0;
                
                r_m_axis_tvalid <=0;
                r_m_axis_tdata <=0;
                r_m_axis_tkeep <=0;
                r_m_axis_tlast <=0;
                r_m_axis_tuser <=0;
                r_m_axis_tpifo <=0;
                
            end
        else
            begin
                output_queue_fsm_state <= output_queue_fsm_state_next;
                r_buffer_rd_en <= r_buffer_rd_en_next;
                r_buffer_rd_en_d1 <= r_buffer_rd_en_d1_next;
//              r_buffer_first_word_en <= r_buffer_first_word_en_next;
                r_buffer_rd_addr <= r_buffer_rd_addr_next;
                r_sop_addr <= r_sop_addr_next;
                
                r_m_axis_tvalid <=  r_m_axis_tvalid_next;
                r_m_axis_tdata  <=  r_m_axis_tdata_next;
                r_m_axis_tkeep  <=  r_m_axis_tkeep_next;
                r_m_axis_tlast  <=  r_m_axis_tlast_next;
                r_m_axis_tuser  <=  r_m_axis_tuser_next;
                r_m_axis_tpifo  <=  r_m_axis_tpifo_next;               
                           
            end
    end
    
    
    
    // wire;
//    assign buffer_wr_en_wire = s_axis_buffer_wr_en & bypass;
//    assign pifo_insert_en_wire = s_axis_pifo_insert_en & bypass;
    
    
    // 
    
////assign w_bypass_en = bypass_by_buffer_empty | w_pifo_calendar_out_bypass_en | ((output_queue_fsm_state == BYPASS) & m_axis_tready);  

//assign w_buffer_write_no_bypass = (w_bypass_en)? 0 : s_axis_buffer_wr_en;

assign m_axis_tvalid =  (OUTPUT_SYNC)? r_m_axis_tvalid & m_axis_tready : r_m_axis_tvalid_next & m_axis_tready;
//assign m_axis_tvalid = (OUTPUT_SYNC)? r_m_axis_tvalid: r_m_axis_tvalid_next;
assign m_axis_tdata = (OUTPUT_SYNC)? r_m_axis_tdata: r_m_axis_tdata_next;
assign m_axis_tkeep = (OUTPUT_SYNC)? r_m_axis_tkeep: r_m_axis_tkeep_next;
assign m_axis_tlast = (OUTPUT_SYNC)? r_m_axis_tlast: r_m_axis_tlast_next;
assign m_axis_tuser = (OUTPUT_SYNC)? r_m_axis_tuser: r_m_axis_tuser_next;
assign m_axis_tpifo = (OUTPUT_SYNC)? r_m_axis_tpifo: r_m_axis_tpifo_next;

assign w_bypass_final = addr_manager_out_st_buffer_empty | w_pifo_calendar_out_bypass_en;
assign m_is_buffer_almost_full = addr_manager_out_st_buffer_almost_full;
assign m_is_pifo_full = w_pifo_calendar_out_caledar_full;
assign m_buffer_remain_size = addr_manager_out_st_buffer_remain_space;

endmodule

