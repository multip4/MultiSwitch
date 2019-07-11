
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
parameter NUM_PIFO_BLOCK = 5

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
// Registers
//-------------------------------------------------------------

 wire                                   reg_tvalid ;
 wire     [DATA_WIDTH-1:0]              reg_tdata ;
 wire     [DATA_WIDTH/8-1:0]            reg_tkeep ;
 wire                                   reg_tlast ;
 wire     [SUME_META_WIDTH-1:0]         reg_user ;
 wire                                   reg_ready;

 wire                                   clk;


 //debug
 reg    [PORT_NUM-1:0]                  queue_status = 'b00001;

//-------------------------------------------------------------
// Init SubModules
//-------------------------------------------------------------

Enqueue_Agent
#(
.DATA_WIDTH(DATA_WIDTH),
.SUME_META_WIDTH(SUME_META_WIDTH)
)
myenqueue
(
.s_axis_tdata(reg_tdata),
.s_axis_tkeep(reg_tkeep),
.s_axis_tuser(reg_user),
.s_axis_tvalid(reg_tvalid),
.s_axis_tready(reg_ready),
.s_axis_tlast(reg_tlast),
.s_axis_data_buffer_is_almost_full_array(queue_status),
.s_axis_meta_buffer_is_almost_full_array(queue_status)
);


//-------------------------------------------------------------
// Reset Operation
//-------------------------------------------------------------

always @(reset) begin
    if(reset) begin
    
    // reset all sub modules
    
    end
end


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