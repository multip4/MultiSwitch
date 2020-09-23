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
    parameter OUTPUT_SYNC = 1
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
//    localparam BYPASS_STOP = 4;
    

    // register for FSM
    reg [FSM_WIDTH-1:0] output_queue_fsm_state;
    reg [FSM_WIDTH-1:0] output_queue_fsm_state_next;
    
//    wire w_buffer_wr_en;
//    wire w_pifo_insert_en;
    
    // buffer module I/O
    reg                             r_buffer_rd_en,r_buffer_rd_en_next; 
    reg                             r_buffer_first_word_en_next;
    
    reg [BUFFER_ADDR_WIDTH-1:0]     r_buffer_rd_addr,r_buffer_rd_addr_next;
        
    wire [BUFFER_ADDR_WIDTH-1:0]    w_addr_manager_out_buffer_fl_tail, w_addr_manager_out_buffer_fl_tail_next;
    wire [BUFFER_ADDR_WIDTH-1:0]    w_addr_manager_out_buffer_fl_head, w_addr_manager_out_buffer_fl_head_next;

        
    wire [BUFFER_ADDR_WIDTH-1:0]    addr_manager_out_st_buffer_remain_space;
    wire                            addr_manager_out_st_buffer_almost_full;
    wire                            addr_manager_out_st_buffer_empty;
    
    reg                            ctl_buffer_wr_en;
    reg                            ctl_pifo_insert_en;
    
    
    // registers for output
    reg                                          r_m_axis_tvalid, r_m_axis_tvalid_next; // output valid signal
    reg [DATA_WIDTH - 1:0]                       r_m_axis_tdata, r_m_axis_tdata_next;  // outptu pkt data
    reg[((DATA_WIDTH / 8)) - 1:0]                r_m_axis_tkeep, r_m_axis_tkeep_next; // output keep data
    reg                                          r_m_axis_tlast, r_m_axis_tlast_next; // output last signal
    reg [META_WIDTH-1:0]                         r_m_axis_tuser, r_m_axis_tuser_next; // output metadata 
    reg [PIFO_WIDTH-1:0]                         r_m_axis_tpifo, r_m_axis_tpifo_next;  // output pifo infomation.
        
    // 1 delay for input signal
    reg [DATA_WIDTH - 1:0]                        r_s_axis_tdata_d1; 
    reg [((DATA_WIDTH / 8)) - 1:0]                r_s_axis_tkeep_d1; 
    reg [META_WIDTH-1:0]                          r_s_axis_tuser_d1; 
    reg [PIFO_WIDTH-1:0]                          r_s_axis_tpifo_d1; 
    reg                                           r_s_axis_tvalid_d1;
    reg                                           r_s_axis_tlast_d1; 

    reg                                           r_s_axis_buffer_wr_en_d1; 
    reg                                           r_s_axis_pifo_insert_en_d1;

    // output result for sop pkt addr 
    reg [BUFFER_ADDR_WIDTH-1:0] pifo_calendar_top_addr;
    // buffer manager module inst
    addr_manager_v0_2
    #(
    .ADDR_WIDTH(BUFFER_ADDR_WIDTH),
    .ADDR_TABLE_DEPTH(BUFFER_WORD_DEPTH))
    addr_manager_inst
    (
    .s_axis_wr_en(ctl_buffer_wr_en), // write signal for fl_head transition
    .s_axis_rd_en(r_buffer_rd_en_next),    // read signal 
        
    .s_axis_rd_pkt_sop_addr(pifo_calendar_top_addr), // read address for sop 
    .s_axis_rd_first_word_en(r_buffer_first_word_en_next), // the first word signal, for fl_tail value update.
    
    .m_axis_fl_head(w_addr_manager_out_buffer_fl_head),       // next writable available address, same as free list head.
    .m_axis_fl_head_next(w_addr_manager_out_buffer_fl_head_next),
    .m_axis_fl_tail(w_addr_manager_out_buffer_fl_tail),
    .m_axis_fl_tail_next(w_addr_manager_out_buffer_fl_tail_next),  // next readable address, the value of index at fl_tail
    
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
    
    buffer_wrapper_v1_0_with_cpu
    #(.C_S_AXIS_ADDR_WIDTH(BUFFER_ADDR_WIDTH))
    buffer_wrapper_inst
    (
        .s_axis_tdata(r_s_axis_tdata_d1),
        .s_axis_tkeep(r_s_axis_tkeep_d1),
        .s_axis_tlast(r_s_axis_tlast_d1),
        .s_axis_tuser(r_s_axis_tuser_d1),
        .s_axis_tpifo(r_s_axis_tpifo_d1),
        
        .m_axis_tdata(w_buffer_wrapper_out_tdata),
        .m_axis_tkeep(w_buffer_wrapper_out_tkeep),
        .m_axis_tlast(w_buffer_wrapper_out_tlast),
        .m_axis_tuser(w_buffer_wrapper_out_tuser),
        .m_axis_tpifo(w_buffer_wrapper_out_tpifo),
        
        .s_axis_wr_addr(w_addr_manager_out_buffer_fl_head),
        .s_axis_wr_en(ctl_buffer_wr_en),
        .s_axis_rd_addr(r_buffer_rd_addr_next),

        .clk(axis_aclk),
        .rstn(axis_resetn)    //active low    
    );   
    
//    reg                             r_pifo_pop_en;
    reg                             ctl_pifo_pop_en;    
//    reg [BUFFER_ADDR_WIDTH-1:0]     r_sop_addr;
//    reg [BUFFER_ADDR_WIDTH-1:0]     r_sop_addr_next;
        
    // define w_pifo_root_info_final.
    wire [PIFO_WIDTH-1:0]           w_pifo_root_info_final = {r_s_axis_tpifo_d1[PIFO_WIDTH-1:BUFFER_ADDR_WIDTH],w_addr_manager_out_buffer_fl_head};
    wire [BUFFER_ADDR_WIDTH-1:0]    w_pifo_calendar_out_addr; 
    wire                            w_pifo_calendar_out_calendar_full;
    wire [PIFO_WIDTH-1:0]           w_pifo_calendar_out_pifo_calendar_top;

    
    pifo_calendar_v0_2_with_no_cpu
    #(
    .PIFO_CALENDAR_SIZE(PIFO_WORD_DEPTH),
    .BUFFER_ADDR_WIDTH(BUFFER_ADDR_WIDTH),
    .PIFO_CALENDAR_INDEX_WIDTH(PIFO_ADDR_WIDTH)
    )
    pifo_calendar_inst
    (
        .s_axis_pifo_info_root(w_pifo_root_info_final),
        .s_axis_insert_en(ctl_pifo_insert_en),
        .s_axis_pop_en(ctl_pifo_pop_en), // pop signal uses combinational logic output.
        
        .m_axis_pifo_calendar_top(w_pifo_calendar_out_pifo_calendar_top),
        .m_axis_buffer_addr(w_pifo_calendar_out_addr), // pop result, buffer address
        .m_axis_calendar_full(w_pifo_calendar_out_calendar_full),

        // reset & clock
        .clk(axis_aclk),
        .rstn(axis_resetn)
        
    );

    wire w_bypass_checker_out_bypass_en;
    wire w_bypass_checker_out_valid;
    
    wire w_bypass_checker_out_bypass_final;
    assign w_bypass_checker_out_bypass_final = w_bypass_checker_out_valid & w_bypass_checker_out_bypass_en;
    
    output_queue_bypass_checker
    #(.OUTPUT_SYNC(1))
    output_queue_bypass_checker_inst
    (   
        .s_axis_valid(s_axis_pifo_insert_en),
        .s_axis_pifo_info(w_pifo_root_info_final),        
        .s_axis_pifo_calandar_top(w_pifo_calendar_out_pifo_calendar_top),
        
        .m_axis_valid(w_bypass_checker_out_valid),
        .m_axis_bypass_en(w_bypass_checker_out_bypass_en),        
                                 
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
        ctl_buffer_wr_en            = r_s_axis_buffer_wr_en_d1;
        ctl_pifo_insert_en          = r_s_axis_pifo_insert_en_d1; 
        pifo_calendar_top_addr      = w_pifo_calendar_out_addr;
        
        r_m_axis_tvalid_next = 0;
        r_m_axis_tdata_next = r_m_axis_tdata;
        r_m_axis_tkeep_next = r_m_axis_tkeep;
        r_m_axis_tlast_next = r_m_axis_tlast;
        r_m_axis_tuser_next = r_m_axis_tuser;
        r_m_axis_tpifo_next = r_m_axis_tpifo;
        
        
        case(output_queue_fsm_state)
            
            // default state:
            // goto BYPASS if [port_ready and input_valid and (bypass_by_lower_rank or bypass_by_buffer_empty)
            // goto UPDATE_FL_TAIL if [port_ready and (input_not_valid or (input_valid and not ((bypass_by_lower_rank or bypass_by_buffer_empty)))]
            // stay IDLE state in oter case.
            IDLE:
                begin
                    if(m_axis_tready) // port ready.
                        begin

                            // condition
                            // if the pifo insert_en_d1 is true and bypass is true, then bypass
                            // else if the buffer is not empty then dequeue from buffer 
                            
                            if(r_s_axis_pifo_insert_en_d1 & w_bypass_checker_out_bypass_final)
                                begin
                                    output_queue_fsm_state_next = BYPASS;
                                    r_m_axis_tvalid_next = r_s_axis_tvalid_d1;
                                    r_m_axis_tdata_next = r_s_axis_tdata_d1;
                                    r_m_axis_tkeep_next = r_s_axis_tkeep_d1;
                                    r_m_axis_tlast_next = r_s_axis_tlast_d1;
                                    r_m_axis_tuser_next = r_s_axis_tuser_d1;
                                    r_m_axis_tpifo_next = r_s_axis_tpifo_d1;
                                    ctl_buffer_wr_en = 0;
                                    ctl_pifo_insert_en = 0;                                     
                                end
                            else if (~addr_manager_out_st_buffer_empty)
                                begin
                                    output_queue_fsm_state_next = UPDATE_FL_TAIL;
                                    ctl_pifo_pop_en = 1;
                                    r_buffer_rd_addr_next = w_pifo_calendar_out_addr;
                                    r_buffer_first_word_en_next = 1; // first word control signal set to 1.
                                    r_buffer_rd_en_next = 1;                                   
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
                    r_m_axis_tvalid_next = r_s_axis_tvalid_d1;
                    r_m_axis_tdata_next = r_s_axis_tdata_d1;
                    r_m_axis_tkeep_next = r_s_axis_tkeep_d1;
                    r_m_axis_tlast_next = r_s_axis_tlast_d1;
                    r_m_axis_tuser_next = r_s_axis_tuser_d1;
                    r_m_axis_tpifo_next = r_s_axis_tpifo_d1;                            

                    if(m_axis_tready) // port ready
                        begin                            
                            // set buffer write signal to 0.
                            ctl_buffer_wr_en = 0;
                            
                            // go to IDLE state if get eop pkt chunk
                            if(r_s_axis_tlast_d1)
                                output_queue_fsm_state_next = IDLE;                            

                        end
                    // else, goto UPDATE_FL_TAIL state
                    else
                        begin
                            // update sop address.
                            output_queue_fsm_state_next = READ_PKT;
                            pifo_calendar_top_addr = w_addr_manager_out_buffer_fl_head;
                            r_buffer_rd_addr_next = w_addr_manager_out_buffer_fl_head;
                            r_buffer_first_word_en_next = 1; // first word control signal set to 1.
                            r_buffer_rd_en_next = 0;
                            ctl_buffer_wr_en = 0;       // TODO: write buffer while update the FL tail?
  
                        end
                end
                
            //  in UPDATE_FL_TAIL state, update fl_tail link,
            // then go to READ_PKT state.
            UPDATE_FL_TAIL:
                begin
//                    output_queue_fsm_state_next = READ_PKT;
//                    r_buffer_rd_en_next = 1;
                    r_buffer_rd_addr_next = w_addr_manager_out_buffer_fl_tail_next;
                    if(m_axis_tready)
                        begin
                            output_queue_fsm_state_next = READ_PKT;
//                            r_buffer_rd_en_next = 1;
                        end
                                                
                end
            // read pkt from buffer until get the eop chunk
            // goto IDLE state if get the eop chunck    
            
//            BYPASS_STOP:
//                begin
//                    r_m_axis_tvalid_next = r_m_axis_tvalid;
//                    r_m_axis_tdata_next = r_m_axis_tdata;
//                    r_m_axis_tkeep_next = r_m_axis_tkeep;
//                    r_m_axis_tlast_next = r_m_axis_tlast;
//                    r_m_axis_tuser_next = r_m_axis_tuser;
//                    r_m_axis_tpifo_next = r_m_axis_tpifo;                 
                
//                    if(m_axis_tready)
//                        begin
//                            output_queue_fsm_state_next = READ_PKT;
//                            r_buffer_rd_en_next = 1;       
//                        end
//                end
            
            READ_PKT:
                begin

                    r_m_axis_tdata_next = w_buffer_wrapper_out_tdata;
                    r_m_axis_tkeep_next = w_buffer_wrapper_out_tkeep;
                    r_m_axis_tlast_next = w_buffer_wrapper_out_tlast;
                    r_m_axis_tuser_next = w_buffer_wrapper_out_tuser;
                    r_m_axis_tpifo_next = w_buffer_wrapper_out_tpifo;

                    if(m_axis_tready)
                        begin
                            // set output value.
                            r_m_axis_tvalid_next = 1;
                            if(w_buffer_wrapper_out_tlast)
                                output_queue_fsm_state_next = IDLE;
                            else
                                begin
                                    r_buffer_rd_en_next = 1;
                                    r_buffer_rd_addr_next = w_addr_manager_out_buffer_fl_tail; 
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
                
                           
            end
    end
    

assign m_axis_tvalid =  (OUTPUT_SYNC)? r_m_axis_tvalid & m_axis_tready : r_m_axis_tvalid_next & m_axis_tready;
//assign m_axis_tvalid = (OUTPUT_SYNC)? r_m_axis_tvalid: r_m_axis_tvalid_next;
assign m_axis_tdata = (OUTPUT_SYNC)? r_m_axis_tdata: r_m_axis_tdata_next;
assign m_axis_tkeep = (OUTPUT_SYNC)? r_m_axis_tkeep: r_m_axis_tkeep_next;
assign m_axis_tlast = (OUTPUT_SYNC)? r_m_axis_tlast: r_m_axis_tlast_next;
assign m_axis_tuser = (OUTPUT_SYNC)? r_m_axis_tuser: r_m_axis_tuser_next;
assign m_axis_tpifo = (OUTPUT_SYNC)? r_m_axis_tpifo: r_m_axis_tpifo_next;

assign m_is_buffer_almost_full = addr_manager_out_st_buffer_almost_full;
assign m_is_pifo_full = w_pifo_calendar_out_calendar_full;
assign m_buffer_remain_size = addr_manager_out_st_buffer_remain_space;

endmodule

