
//----------------------------------------------------------------------------
// File name: pifo_module.v
// File created: 2019/05/09 22:41:48
// Created by: Zhenguo Cui & Lim 1000

// PIFO Modules for Scheduling in NetFPGA-SUME

//----------------------------------------------------------------------------

`timescale 1 ns / 100 ps

module PIFO_MODULE 
#(
       

// I/O Parameters
parameter DATA_WIDTH = 256,
parameter SUME_META_WIDTH = 128,
parameter PORT_NUM = 5,

// PIFO Block Parameters
parameter NUM_PIFO_BLOCK = 5,


// Buffer Parameters
parameter PKT_BUFFER_SIZE = 128000,  //in byte, buffer per physical port.
parameter MIN_PKT_SIZE = 64,     //in byte,
parameter MAX_PKT_SIZE = 1518    //in byte
)
(

    // slave -> input 
    s_axis_tdata,
    s_axis_tkeep,
    s_axis_tuser,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tlast,

    // master -> output
    m_axis_tdata,
    m_axis_tkeep,
    m_axis_tuser,
    m_axis_tvalid,
    m_axis_tlast,
    m_axis_tready,
    
    // control signals
   
    reset,
    clk_in_0
);

//-------------------------------------------------------------
// I/O
//-------------------------------------------------------------
 input		                                s_axis_tvalid;
 input	     [DATA_WIDTH-1:0]               s_axis_tdata;
 input	     [DATA_WIDTH/8-1:0]             s_axis_tkeep;
 input		                                s_axis_tlast;
 input                                      s_axis_tready;
 input       [SUME_META_WIDTH-1:0]          s_axis_tuser;

 output                                     m_axis_tvalid;
 output      [DATA_WIDTH-1:0]               m_axis_tdata;
 output      [DATA_WIDTH/8-1:0]             m_axis_tkeep;
 output                                     m_axis_tlast;
 output      [SUME_META_WIDTH-1:0]          m_axis_tuser;
 output                                     m_axis_tready;
 
 input                                      reset;
 input		                                clk_in_0 ;

//-------------------------------------------------------------
// end for I/O
//-------------------------------------------------------------



//-------------------------------------------------------------
// Wire for I/O
//-------------------------------------------------------------

 wire                                   reg_tvalid ;
 wire     [DATA_WIDTH-1:0]              reg_tdata ;
 wire     [DATA_WIDTH/8-1:0]            reg_tkeep ;
 wire                                   reg_tlast ;
 wire     [SUME_META_WIDTH-1:0]         reg_user ;
 wire                                   reg_ready;

 wire                                   clk;

//-------------------------------------------------------------
// end for Wire
//-------------------------------------------------------------




//-------------------------------------------------------------
// Functions
//-------------------------------------------------------------

// function.log2
function integer log2;
  input integer number;
  begin
     log2=0;
     while(2**log2<number) begin
        log2=log2+1;
     end
  end
endfunction // log2


//-------------------------------------------------------------
// end for Functions
//-------------------------------------------------------------




//-------------------------------------------------------------
// Local Parameters
//-------------------------------------------------------------
// Enqueue States
localparam IDLE = 0;    // default states
localparam ENQUEUE = 1; // enqueue states
localparam DROP = 2;    // drop states
reg [1:0] enqueue_state;
reg [1:0] enqueue_state_next;
// Dequeue States:
// 


// parameter for buffer width and depth.
localparam PKT_BUFFER_DEPTH = PKT_BUFFER_SIZE / (DATA_WIDTH / 8);
localparam PKT_BUFFER_WIDTH   = log2(PKT_BUFFER_DEPTH);
localparam META_BUFFER_DEPTH = PKT_BUFFER_SIZE / MIN_PKT_SIZE;
localparam META_BUFFER_WIDTH = log2(META_BUFFER_DEPTH);


// queue buffer address 

// pkt buffer address
reg     [PKT_BUFFER_WIDTH-1:0]  pkt_buffer_addr [PORT_NUM-1:0][PKT_BUFFER_DEPTH-1:0];
// meta buffer address
reg     [META_BUFFER_WIDTH-1:0] meta_buffer_addr[PORT_NUM-1:0][META_BUFFER_DEPTH-1:0];


reg     [PKT_BUFFER_WIDTH-1:0] pkt_buffer_prev_addr;

// pkt free list header
reg     [PKT_BUFFER_WIDTH-1:0]  pkt_fl_head[PORT_NUM-1:0];
// pkt free list tail
reg     [PKT_BUFFER_WIDTH-1:0]  pkt_fl_tail[PORT_NUM-1:0];

// meta free list header
reg     [META_BUFFER_WIDTH-1:0]  meta_fl_head[PORT_NUM-1:0];
// meta free list tail
reg     [META_BUFFER_WIDTH-1:0]  meta_fl_tail[PORT_NUM-1:0];

//debug
reg    [PORT_NUM-1:0]                  queue_status = 'b00001;


//-------------------------------------------------------------
// end for Local Parameters
//-------------------------------------------------------------


//-------------------------------------------------------------
// code blocks: Tasks
//-------------------------------------------------------------


// block 1. get next pkt addr.
// algorithm:
//next_addr = fl_head                          // get address from fl_head 
//addr_array[next_addr]  = N/A           // mark current addr is the                                                              lattest packet chunk
//if last_addr is not N/A: then
//  addr_array[last_addr] = cur_addr   // update packet chunk link
//endif 
//fl_head = addr_array[next_addr]      // update free list head
//last_addr = next_addr                        // update last_addr
//return next_addr;

//task get_next_pkt_addr;
//input [PKT_BUFFER_WIDTH-1:0] buffer_addr[PKT_BUFFER_DEPTH-1:0];
//input [PKT_BUFFER_WIDTH-1:0] fl_head;
//input [PKT_BUFFER_WIDTH-1:0] last_addr;
//output [PKT_BUFFER_WIDTH-1:0] next_addr;

//begin
//next_addr = fl_head;
//buffer_addr[fl_head] = 



//end

//endtask





//-------------------------------------------------------------
// end for code blocks
//-------------------------------------------------------------







//-------------------------------------------------------------
// Finite State Machine for Enqueue
//-------------------------------------------------------------

always @(posedge clk) begin

// set default value befor run state process
enqueue_state_next = enqueue_state;

//case(enqueue_state)

//IDLE: begin

//end



//ENQUEUE: begin

//end

//DROP: begin

//end

end



//-------------------------------------------------------------
// end for Finite State Machine for Enqueue
//-------------------------------------------------------------


//-------------------------------------------------------------
// Finate State Machine for Dequeue
//-------------------------------------------------------------

//-------------------------------------------------------------
// end for Finate State Machine for Dequeue
//-------------------------------------------------------------



//-------------------------------------------------------------
// Init SubModules
//-------------------------------------------------------------


//-------------------------------------------------------------
// end for Init SubModules
//-------------------------------------------------------------

//-------------------------------------------------------------
// Always block
//-------------------------------------------------------------


always @(posedge clk) begin
    //if(reset == 1) // means reset all stateful parameters.
    
    // reset all sub modules
    
    //else
    // update Flip Flop values
    
    

end

//-------------------------------------------------------------
// end for Always block
//-------------------------------------------------------------





assign clk = clk_in_0;

assign reg_tvalid = s_axis_tvalid;
assign reg_tdata = s_axis_tdata;
assign reg_tkeep = s_axis_tkeep;
assign reg_tlast = s_axis_tlast;
assign reg_user = s_axis_tuser;
assign reg_ready = s_axis_tready;

assign m_axis_tready = reg_ready;
assign m_axis_tvalid = reg_tvalid;
assign m_axis_tdata = reg_tdata;
assign m_axis_tkeep = reg_tkeep;
assign m_axis_tlast = reg_tlast;
assign m_axis_tuser = reg_user;

endmodule