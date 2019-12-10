`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2019 09:19:43 PM
// Design Name: 
// Module Name: cpu_sub
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

`include "top_scheduler_cpu_defines.v"
module cpu_sub
#(
parameter C_S_AXI_ADDR_WIDTH = 23,
parameter C_S_AXI_DATA_WIDTH = 32,
parameter ADDR_PORT_WIDTH = 3,
parameter ADDR_BUFFER_TYPE_WIDTH = 3,
parameter ADDR_OFFSET_WIDTH = 4,
parameter ADDR_INDEX_WIDTH = 12,
parameter PORT_NUM = 5,
parameter PKT_BUFFER_WIDTH = 289,
parameter SUME_BUFFER_WIDTH = 128,
parameter PIFO_BUFFER_WIDTH = 32,
parameter PIFO_CALENDAR_WIDTH = 32
)
(
    // AXI-LITE Interface
    // AXI Lite ports
    input                                     S_AXI_ACLK,
    input                                     S_AXI_ARESETN, 
    // write channel
    input                                     S_AXI_BREADY,
    input                                     S_AXI_AWVALID,
    input      [C_S_AXI_ADDR_WIDTH-1 : 0]     S_AXI_AWADDR,
    input                                     S_AXI_WVALID,
    input      [C_S_AXI_DATA_WIDTH-1 : 0]     S_AXI_WDATA,
    input      [C_S_AXI_DATA_WIDTH/8-1 : 0]   S_AXI_WSTRB,
    output                                    S_AXI_AWREADY,
    output                                    S_AXI_WREADY,
    output     [1 :0]                         S_AXI_BRESP,
    output                                    S_AXI_BVALID,
    //read channel
    input                                     S_AXI_RREADY,
    input                                     S_AXI_ARVALID,    
    input      [C_S_AXI_ADDR_WIDTH-1 : 0]     S_AXI_ARADDR,
    output                                    S_AXI_ARREADY,
    output                                    S_AXI_RVALID,
    output     [C_S_AXI_DATA_WIDTH-1 : 0]     S_AXI_RDATA,
    output     [1 : 0]                        S_AXI_RRESP,

    // status input signal,
        
    // cpu2ip read signal
    
    // read from pkt buffer
    output     [ADDR_INDEX_WIDTH-1:0]       cpu2ip_read_pkt_buffer_req_addr,
    output     [PORT_NUM-1:0]               cpu2ip_read_pkt_buffer_req_valid,
    input      [PKT_BUFFER_WIDTH-1:0]        ip2cpu_read_pkt_buffer_resp_value,
    input      [PORT_NUM-1:0]               ip2cpu_read_pkt_buffer_resp_valid,
        
    // read from sume meta buffer
    output     [ADDR_INDEX_WIDTH-1:0]       cpu2ip_read_sume_buffer_req_addr,
    output     [PORT_NUM-1:0]               cpu2ip_read_sume_buffer_req_valid,
    input       [SUME_BUFFER_WIDTH-1:0]     ip2cpu_read_sume_buffer_resp_value,
    input      [PORT_NUM-1:0]               ip2cpu_read_sume_buffer_resp_valid,
    

    // read from pifo info buffer
    output     [ADDR_INDEX_WIDTH-1:0]       cpu2ip_read_pifo_buffer_req_addr,
    output     [PORT_NUM-1:0]               cpu2ip_read_pifo_buffer_req_valid,
    input      [PIFO_BUFFER_WIDTH-1:0]      ip2cpu_read_pifo_buffer_resp_value,
    input      [PORT_NUM-1:0]                ip2cpu_read_pifo_buffer_resp_valid,
        
    // read from pifo calendar
    output     [ADDR_INDEX_WIDTH-1:0]       cpu2ip_read_pifo_calendar_req_addr,
    output     [PORT_NUM-1:0]               cpu2ip_read_pifo_calendar_req_valid,
    input      [PIFO_CALENDAR_WIDTH-1:0]    ip2cpu_read_pifo_calendar_resp_value,
    input      [PORT_NUM-1:0]               ip2cpu_read_pifo_calendar_resp_valid,    
    
    
    // cpu2ip write    
    
    // write pkt buffer
    
    output     [ADDR_INDEX_WIDTH-1:0]       cpu2ip_write_pkt_buffer_req_addr,
    output     [PKT_BUFFER_WIDTH-1:0]       cpu2ip_write_pkt_buffer_req_value,
    output     [PORT_NUM-1:0]               cpu2ip_write_pkt_buffer_req_valid,
    input      [PORT_NUM-1:0]                ip2cpu_write_pkt_buffer_resp_valid,
        
    // write sume buffer

    output     [ADDR_INDEX_WIDTH-1:0]       cpu2ip_write_sume_buffer_req_addr,
    output     [SUME_BUFFER_WIDTH-1:0]      cpu2ip_write_sume_buffer_req_value,
    output     [PORT_NUM-1:0]               cpu2ip_write_sume_buffer_req_valid,
    input      [PORT_NUM-1:0]                ip2cpu_write_sume_buffer_resp_valid,    
    
    // write pifo buffer

    output     [ADDR_INDEX_WIDTH-1:0]       cpu2ip_write_pifo_buffer_req_addr,
    output     [PIFO_BUFFER_WIDTH-1:0]      cpu2ip_write_pifo_buffer_req_value,
    output     [PORT_NUM-1:0]               cpu2ip_write_pifo_buffer_req_valid,
    input      [PORT_NUM-1:0]               ip2cpu_write_pifo_buffer_resp_valid,    
    
    
    // write pifo calendar
    
    output     [ADDR_INDEX_WIDTH-1:0]       cpu2ip_write_pifo_calendar_req_addr,
    output     [PIFO_CALENDAR_WIDTH-1:0]    cpu2ip_write_pifo_calendar_req_value,
    output     [PORT_NUM-1:0]               cpu2ip_write_pifo_calendar_req_valid,
    input      [PORT_NUM-1:0]               ip2cpu_write_pifo_calendar_resp_valid,        
    
    
    // read enqueue agent status
    
    output     [ADDR_INDEX_WIDTH-1:0]       cpu2ip_read_stat_enqueue_agent_req_addr,  
    output                                  cpu2ip_read_stat_enqueue_agent_req_valid, 
    input      [C_S_AXI_DATA_WIDTH-1:0]     ip2cpu_read_stat_enqueue_agent_resp_value,
    input                                   ip2cpu_read_stat_enqueue_agent_resp_valid
    
    
    
    
);


// wire to decode cpu read addr.

wire                                w_cpu_read_req_type;  // states or buffer
wire [ADDR_PORT_WIDTH-1:0]          w_cpu_read_req_port;
wire [ADDR_BUFFER_TYPE_WIDTH-1:0]   w_cpu_read_req_buffer_type;
wire [ADDR_OFFSET_WIDTH-1:0]        w_cpu_read_req_offset;
wire [ADDR_INDEX_WIDTH-1:0]         w_cpu_read_req_index;

assign {w_cpu_read_req_type, w_cpu_read_req_port, w_cpu_read_req_buffer_type, 
        w_cpu_read_req_index, w_cpu_read_req_offset} = S_AXI_ARADDR;

// wire to decode cpu write addr.

wire                                w_cpu_write_req_type;  // states or buffer
wire [ADDR_PORT_WIDTH-1:0]          w_cpu_write_req_port;
wire [ADDR_BUFFER_TYPE_WIDTH-1:0]   w_cpu_write_req_buffer_type;
wire [ADDR_OFFSET_WIDTH-1:0]        w_cpu_write_req_offset;
wire [ADDR_INDEX_WIDTH-1:0]         w_cpu_write_req_index;

assign {w_cpu_write_req_type, w_cpu_write_req_port, w_cpu_write_req_buffer_type, 
        w_cpu_write_req_index, w_cpu_write_req_offset} = S_AXI_AWADDR;

// assign cpu2ip signals.

assign cpu2ip_read_pkt_buffer_req_addr = w_cpu_read_req_index;
assign cpu2ip_read_sume_buffer_req_addr = w_cpu_read_req_index;
assign cpu2ip_read_pifo_buffer_req_addr = w_cpu_read_req_index;
assign cpu2ip_read_pifo_calendar_req_addr = w_cpu_read_req_index;

assign cpu2ip_write_pkt_buffer_req_addr = w_cpu_write_req_index;
assign cpu2ip_write_sume_buffer_req_addr = w_cpu_write_req_index;
assign cpu2ip_write_pifo_buffer_req_addr = w_cpu_write_req_index;
assign cpu2ip_write_pifo_calendar_req_addr = w_cpu_write_req_index;

// register for read valid signal
reg [PORT_NUM-1:0]                  r_cpu2ip_read_pkt_buffer_req_valid;
reg [PORT_NUM-1:0]                  r_cpu2ip_read_pkt_buffer_req_valid_next; 
reg [PORT_NUM-1:0]                  r_cpu2ip_read_sume_buffer_req_valid;
reg [PORT_NUM-1:0]                  r_cpu2ip_read_sume_buffer_req_valid_next; 
reg [PORT_NUM-1:0]                  r_cpu2ip_read_pifo_buffer_req_valid;
reg [PORT_NUM-1:0]                  r_cpu2ip_read_pifo_buffer_req_valid_next; 
reg [PORT_NUM-1:0]                  r_cpu2ip_read_pifo_calendar_req_valid;
reg [PORT_NUM-1:0]                  r_cpu2ip_read_pifo_calendar_req_valid_next; 


assign cpu2ip_read_pkt_buffer_req_valid = r_cpu2ip_read_pkt_buffer_req_valid;
assign cpu2ip_read_sume_buffer_req_valid = r_cpu2ip_read_sume_buffer_req_valid;
assign cpu2ip_read_pifo_buffer_req_valid = r_cpu2ip_read_pifo_buffer_req_valid;
assign cpu2ip_read_pifo_calendar_req_valid = r_cpu2ip_read_pifo_calendar_req_valid;

// register for write valid signal
reg [PORT_NUM-1:0]               r_cpu2ip_write_pkt_buffer_req_valid;
reg [PORT_NUM-1:0]               r_cpu2ip_write_pkt_buffer_req_valid_next;
reg [PORT_NUM-1:0]               r_cpu2ip_write_sume_buffer_req_valid;
reg [PORT_NUM-1:0]               r_cpu2ip_write_sume_buffer_req_valid_next;
reg [PORT_NUM-1:0]               r_cpu2ip_write_pifo_buffer_req_valid;
reg [PORT_NUM-1:0]               r_cpu2ip_write_pifo_buffer_req_valid_next;
reg [PORT_NUM-1:0]               r_cpu2ip_write_pifo_calendar_req_valid;
reg [PORT_NUM-1:0]               r_cpu2ip_write_pifo_calendar_req_valid_next;


assign cpu2ip_write_pkt_buffer_req_valid = r_cpu2ip_write_pkt_buffer_req_valid;
assign cpu2ip_write_sume_buffer_req_valid = r_cpu2ip_write_sume_buffer_req_valid;
assign cpu2ip_write_pifo_buffer_req_valid = r_cpu2ip_write_pifo_buffer_req_valid;
assign cpu2ip_write_pifo_calendar_req_valid = r_cpu2ip_write_pifo_calendar_req_valid;

wire                       w_read_valid;
wire                       w_write_valid;

assign w_read_valid =   ip2cpu_write_pkt_buffer_resp_valid | 
                        ip2cpu_write_sume_buffer_resp_valid |
                        ip2cpu_write_pifo_buffer_resp_valid | ip2cpu_write_pifo_calendar_resp_valid;

assign w_write_valid =  ip2cpu_read_pkt_buffer_resp_valid |
                        ip2cpu_read_sume_buffer_resp_valid |
                        ip2cpu_read_pifo_buffer_resp_valid |
                        ip2cpu_read_pifo_calendar_resp_valid;                       

//register for write & read response

reg                        r_write_resp_valid_clock_dp;
reg                        r_read_resp_valid_clock_dp;
reg                        r_write_resp_valid_clock_dp_next;
reg                        r_read_resp_valid_clock_dp_next;


// register to keep pkt buffer words.
reg [7:0]                  r_pkt_buffer_write_req_valud_last_index;
reg [7:0]                  r_pkt_buffer_write_req_valud_last_index_next;
            
reg [PKT_BUFFER_WIDTH-1:0] r_cpu2ip_write_pkt_buffer_req_value;
reg [PKT_BUFFER_WIDTH-1:0] r_cpu2ip_write_pkt_buffer_req_value_next;
// register to keep sume buffer words.

reg [1:0]                  r_sume_buffer_write_req_valud_last_index;
reg [1:0]                  r_sume_buffer_write_req_valud_last_index_next;

reg [SUME_BUFFER_WIDTH-1:0] r_cpu2ip_write_sume_buffer_req_value;
reg [SUME_BUFFER_WIDTH-1:0] r_cpu2ip_write_sume_buffer_req_value_next;

reg [PIFO_BUFFER_WIDTH-1:0] r_cpu2ip_write_pifo_buffer_req_value;
reg [PIFO_BUFFER_WIDTH-1:0] r_cpu2ip_write_pifo_buffer_req_value_next;

reg [PIFO_CALENDAR_WIDTH-1:0] r_cpu2ip_write_pifo_calendar_req_value;
reg [PIFO_CALENDAR_WIDTH-1:0] r_cpu2ip_write_pifo_calendar_req_value_next;


assign cpu2ip_write_pkt_buffer_req_value = r_cpu2ip_write_pkt_buffer_req_value;
assign cpu2ip_write_sume_buffer_req_value = r_cpu2ip_write_sume_buffer_req_value;
assign cpu2ip_write_pifo_buffer_req_value = r_cpu2ip_write_pifo_buffer_req_value;
assign cpu2ip_write_pifo_calendar_req_value = r_cpu2ip_write_pifo_calendar_req_value;




// AXI4LITE signals
reg                                 r_axi_awready;
reg                                 r_axi_wready;
reg [1 : 0]                         r_axi_bresp;
reg                                 r_axi_bvalid;
reg                                 r_axi_arready;
reg [C_S_AXI_DATA_WIDTH-1 : 0]      r_axi_rdata;
reg [1 : 0]                         r_axi_rresp;
reg                                 r_axi_rvalid;


reg                                 r_axi_awready_next;
reg                                 r_axi_wready_next;
reg [1 : 0]                         r_axi_bresp_next;
reg                                 r_axi_bvalid_next;
reg                                 r_axi_arready_next;
reg [C_S_AXI_DATA_WIDTH-1 : 0]      r_axi_rdata_next;
reg [1 : 0]                         r_axi_rresp_next;
reg                                 r_axi_rvalid_next;


// I/O Connections assignments
assign S_AXI_AWREADY    = r_axi_awready; // signal to indicate the slave receive write addr
assign S_AXI_WREADY     = r_axi_wready;  // signal to indicate the slave receive write value
assign S_AXI_BRESP      = r_axi_bresp;   // write result response: 0 for ok, 2 for slave error, 3 for decoding error.
assign S_AXI_BVALID     = r_axi_bvalid;  // write response valid
assign S_AXI_ARREADY    = r_axi_arready; // signal to indicate the slave has received the read addr,
assign S_AXI_RDATA      = r_axi_rdata;   // read response data
assign S_AXI_RRESP      = r_axi_rresp;   // read response, 0 for ok, 2 for slave error, 3 for decoding error.
assign S_AXI_RVALID     = r_axi_rvalid;  // read response valid






// assumption: the input addr is not changed until receive the data.,
//             if not, then use register instead of wire.
// wire to split pkt buffer value
wire [C_S_AXI_DATA_WIDTH-1:0] w_pkt_buffer_read_resp_data_chunk[0:`PKT_BUFFER_WORD_COUNT-1];
// wire to split sume buffer value
wire [C_S_AXI_DATA_WIDTH-1:0] w_sume_buffer_read_resp_data_chunk[0:`SUME_BUFFER_WORD_COUNT-1];

genvar i;
generate
    for(i=0;i<`PKT_BUFFER_WORD_COUNT; i=i+1)
        begin
            if(i == (`PKT_BUFFER_WORD_COUNT - 1))
                // last chunck handling
                assign w_pkt_buffer_read_resp_data_chunk[i] = {31'b0, ip2cpu_read_pkt_buffer_resp_value[PKT_BUFFER_WIDTH-1]}; 
            else
                assign w_pkt_buffer_read_resp_data_chunk[i] = ip2cpu_read_pkt_buffer_resp_value[C_S_AXI_DATA_WIDTH*(i+1)-1:C_S_AXI_DATA_WIDTH*i];
            
        end

    for(i=0;i<`SUME_BUFFER_WORD_COUNT; i=i+1)
        begin
            assign w_sume_buffer_read_resp_data_chunk[i] = ip2cpu_read_sume_buffer_resp_value[C_S_AXI_DATA_WIDTH*(i+1)-1:C_S_AXI_DATA_WIDTH*i];
        end
        
endgenerate

// fsm
reg  r_cpu_fsm_states;
reg  r_cpu_fsm_states_next;


localparam IDLE = 0;
localparam RECEIVE_REMAIN = 1;


// combinational block to handle input/ output data.
always @(*)
begin


    r_axi_awready_next = 0;
    r_axi_wready_next  = 0;
    r_axi_bvalid_next  = 0;
    r_axi_arready_next = 0;
    r_axi_rvalid_next  = 0;
    r_axi_rresp_next = 0;
    r_axi_rdata_next = 0;
    r_axi_bresp_next = 0;
    
    // read valid
    r_cpu2ip_read_pkt_buffer_req_valid_next = 0;
    r_cpu2ip_read_sume_buffer_req_valid_next = 0;
    r_cpu2ip_read_pifo_buffer_req_valid_next = 0;            
    r_cpu2ip_read_pifo_calendar_req_valid_next = 0;
    
    // write valid
    r_cpu2ip_write_pkt_buffer_req_valid_next = 0;
    r_cpu2ip_write_sume_buffer_req_valid_next = 0;
    r_cpu2ip_write_pifo_buffer_req_valid_next = 0;
    r_cpu2ip_write_pifo_calendar_req_valid_next = 0;
    
    // fsm
    r_cpu_fsm_states_next = r_cpu_fsm_states;
    
    // write value register    
    r_cpu2ip_write_pifo_buffer_req_value_next = r_cpu2ip_write_pifo_buffer_req_value;    
    r_cpu2ip_write_pifo_calendar_req_value_next = r_cpu2ip_write_pifo_calendar_req_value;    
    r_cpu2ip_write_sume_buffer_req_value_next = r_cpu2ip_write_sume_buffer_req_value;
    r_cpu2ip_write_pkt_buffer_req_value_next = r_cpu2ip_write_pkt_buffer_req_value;
    
    // index for pkt,sume buffer chunk.
    r_pkt_buffer_write_req_valud_last_index_next = r_pkt_buffer_write_req_valud_last_index;
    r_sume_buffer_write_req_valud_last_index_next = r_sume_buffer_write_req_valud_last_index;
    
     // set read ready if the read request is valid
    if(S_AXI_ARVALID) r_axi_arready_next = 1;
    
    // set write ready if both the write addr and valud is valid 
    if(S_AXI_WVALID & S_AXI_AWVALID) 
        begin
            r_axi_awready_next = 1;
            r_axi_wready_next = 1;
        end
    
    // set read response valid, if the response input signal is valid.
    
    if(ip2cpu_read_pkt_buffer_resp_valid | ip2cpu_read_sume_buffer_resp_valid | 
        ip2cpu_read_pifo_buffer_resp_valid | ip2cpu_read_pifo_calendar_resp_valid)  r_axi_rvalid_next = 0;

        
    // set write response valid,
    
    if(ip2cpu_write_pkt_buffer_resp_valid | ip2cpu_write_sume_buffer_resp_valid |
       ip2cpu_write_pifo_buffer_resp_valid | ip2cpu_write_pifo_calendar_resp_valid) r_axi_bvalid_next = 0;

 
    
    // CPU2IP Read request
    // generate read valid signal
    if(S_AXI_ARVALID)
        case(w_cpu_read_req_buffer_type)
            `PKT_BUFFER_ID:
                begin
                    r_cpu2ip_read_pkt_buffer_req_valid_next = 1 <<  w_cpu_read_req_port;
                end
            `SUME_BUFFER_ID:
                begin
                    r_cpu2ip_read_sume_buffer_req_valid_next = 1 << w_cpu_read_req_port;
                end
            `PIFO_BUFFER_ID:
                begin
                    r_cpu2ip_read_pifo_buffer_req_valid_next = 1 << w_cpu_read_req_port;
                end
            `PIFO_CALENDAR_ID:
                begin
                    r_cpu2ip_read_pifo_calendar_req_valid_next = 1 << w_cpu_read_req_port;
                end
        endcase    
    
    
    // IP2CPU READ RESPOND    
    // generate read response value.
    case({ip2cpu_read_pkt_buffer_resp_valid,ip2cpu_read_sume_buffer_resp_valid,ip2cpu_read_pifo_buffer_resp_valid,ip2cpu_read_pifo_calendar_resp_valid})
    
        'b1000: // ip2cpu_read_pkt_buffer_resp_valid 
            begin
                r_axi_rdata_next = w_pkt_buffer_read_resp_data_chunk[w_cpu_read_req_offset];
            end
        'b0100: // ip2cpu_read_meta_buffer_resp_valid
            begin
                r_axi_rdata_next = w_sume_buffer_read_resp_data_chunk[w_cpu_read_req_offset];
            end
        'b0010: // ip2cpu_read_pifo_buffer_resp_valid
            begin
                r_axi_rdata_next = S_AXI_RDATA;
            end
        'b0001: // ip2cpu_read_pifo_calendar_resp_valid
            begin
                r_axi_rdata_next = S_AXI_RDATA;
            end
    endcase
    
    
    // IP2CPU WRITE REQ DATA & VALID Signal
    // generate write data and valid signal.
    
    case(r_cpu_fsm_states)
        IDLE:
        
            // if the cpu_write data type is pifo, which is 1 word width, 
            // set request data and valid signal,
            
            // check awready & wready, which is 1 delay compare to the awvalid, wvalid, 
            if(r_axi_awready & r_axi_wready)
                begin
                    if(w_cpu_write_req_buffer_type == `PIFO_BUFFER_ID)
                        begin
                            r_cpu2ip_write_pifo_buffer_req_valid_next = 1 << w_cpu_write_req_port;
                            r_cpu2ip_write_pifo_buffer_req_value_next = S_AXI_WDATA;
                        end
                    else if(w_cpu_write_req_buffer_type == `PIFO_CALENDAR_ID)
                        begin
                            r_cpu2ip_write_pifo_calendar_req_valid_next = 1 << w_cpu_write_req_port;
                            r_cpu2ip_write_pifo_calendar_req_value_next = S_AXI_WDATA;
                        end
                    else if(w_cpu_write_req_buffer_type == `SUME_BUFFER_ID)
                        begin
                            r_cpu2ip_write_sume_buffer_req_value_next = {`SUME_BUFFER_DATA_SHIFT_OFFSET'b0,S_AXI_WDATA};
                            r_sume_buffer_write_req_valud_last_index_next = r_sume_buffer_write_req_valud_last_index + 1;
                            r_axi_bvalid_next = 1;
                            r_cpu_fsm_states_next = RECEIVE_REMAIN;
                        end
                    else if(w_cpu_write_req_buffer_type == `PKT_BUFFER_ID)
                        begin
                            r_cpu2ip_write_pkt_buffer_req_value_next = {`PKT_BUFFER_DATA_SHIFT_OFFSET'b0, S_AXI_WDATA};
                            r_pkt_buffer_write_req_valud_last_index_next = r_pkt_buffer_write_req_valud_last_index + 1;
                            r_axi_bvalid_next = 1;
                            r_cpu_fsm_states_next = RECEIVE_REMAIN;
                        end
                end
            // else, return write response valid signal to wait next word value
            // move state to RECEIVE_REMAIN.
            
        RECEIVE_REMAIN:
            begin
                // continue to receive remain chunk values.
                if(r_axi_awready & r_axi_wready)
                    begin
                        if(w_cpu_write_req_buffer_type == `PKT_BUFFER_ID)
                            begin
                                // update index
                                r_pkt_buffer_write_req_valud_last_index_next = r_pkt_buffer_write_req_valud_last_index + 1;
                                
                                // set value
                                r_cpu2ip_write_pkt_buffer_req_value_next = r_cpu2ip_write_pkt_buffer_req_value << C_S_AXI_DATA_WIDTH | S_AXI_WDATA;
                                
                                // check if the updated index is last index, then set request valid field. and go to IDLE states
                                if(r_pkt_buffer_write_req_valud_last_index == `PKT_BUFFER_WORD_COUNT - 1)
                                    begin
                                        r_cpu2ip_write_pkt_buffer_req_valid_next = 1;
                                        r_cpu_fsm_states_next = IDLE;
                                        r_pkt_buffer_write_req_valud_last_index_next = 0;
                                    end
                                r_axi_bvalid_next = 1;
                            end
                        else if(w_cpu_write_req_buffer_type == `SUME_BUFFER_ID)
                            begin
                                r_sume_buffer_write_req_valud_last_index_next = r_sume_buffer_write_req_valud_last_index + 1;
                                r_cpu2ip_write_sume_buffer_req_value_next = r_cpu2ip_write_sume_buffer_req_value << C_S_AXI_DATA_WIDTH | S_AXI_WDATA;
                            
                                if(r_sume_buffer_write_req_valud_last_index == `SUME_BUFFER_WORD_COUNT -1)
                                    begin
                                        r_cpu2ip_write_sume_buffer_req_valid_next = 1;
                                        r_cpu_fsm_states_next = IDLE;
                                        r_sume_buffer_write_req_valud_last_index_next = 0;
                                    end
                                r_axi_bvalid_next = 1;
                            end
                        else // exception. return true and error code
                            begin
                                r_cpu_fsm_states_next = IDLE;
                                r_axi_bvalid_next = 1;
                                r_axi_bresp_next = 'b11;
                                r_sume_buffer_write_req_valud_last_index_next = 0;
                            end
                    end
            end
    endcase
end

// sync block for handle AXI signal
always @(posedge S_AXI_ACLK)
begin
    if(~S_AXI_ARESETN)
        begin
            r_axi_awready <= 0;
            r_axi_wready  <= 0;
            r_axi_bresp   <= 0;
            r_axi_bvalid  <= 0;
            r_axi_arready <= 0;
            r_axi_rdata   <= 0;
            r_axi_rresp   <= 0;
            r_axi_rvalid  <= 0;
        
        end
    else
        begin
            r_axi_awready <= r_axi_awready_next;
            r_axi_wready  <= r_axi_wready_next;
            r_axi_bresp   <= r_axi_bresp_next;
            r_axi_bvalid  <= r_axi_bvalid_next;
            r_axi_arready <= r_axi_arready_next;
            r_axi_rdata   <= r_axi_rdata_next;
            r_axi_rresp   <= r_axi_rresp_next;
            r_axi_rvalid  <= r_axi_rvalid_next;
        end
end

// sync block for registers
always @(posedge S_AXI_ACLK)
begin
    if(~S_AXI_ARESETN)
        begin
            r_cpu_fsm_states <= 0;
            r_cpu2ip_read_pkt_buffer_req_valid <= 0;
            r_cpu2ip_read_sume_buffer_req_valid <= 0;
            r_cpu2ip_read_pifo_buffer_req_valid <= 0;            
            r_cpu2ip_read_pifo_calendar_req_valid <= 0;
            
            r_cpu2ip_write_pkt_buffer_req_valid <= 0;
            r_cpu2ip_write_sume_buffer_req_valid <= 0;
            r_cpu2ip_write_pifo_buffer_req_valid <= 0;
            r_cpu2ip_write_pifo_calendar_req_valid <= 0;
            
            r_cpu2ip_write_pifo_buffer_req_value <= 0;
            r_cpu2ip_write_pifo_calendar_req_value <= 0;
            r_cpu2ip_write_sume_buffer_req_value <= 0;
            r_cpu2ip_write_pkt_buffer_req_value <= 0;
            
            r_pkt_buffer_write_req_valud_last_index <= 0;
            r_sume_buffer_write_req_valud_last_index <= 0;
            
        end
    else
        begin
            r_cpu_fsm_states <= r_cpu_fsm_states_next;
            r_cpu2ip_read_pkt_buffer_req_valid <= r_cpu2ip_read_pkt_buffer_req_valid_next;
            r_cpu2ip_read_sume_buffer_req_valid <= r_cpu2ip_read_sume_buffer_req_valid_next;
            r_cpu2ip_read_pifo_buffer_req_valid <= r_cpu2ip_read_pifo_buffer_req_valid_next;            
            r_cpu2ip_read_pifo_calendar_req_valid <= r_cpu2ip_read_pifo_calendar_req_valid_next;
            
            r_cpu2ip_write_pkt_buffer_req_valid <= r_cpu2ip_write_pkt_buffer_req_valid_next;
            r_cpu2ip_write_sume_buffer_req_valid <= r_cpu2ip_write_sume_buffer_req_valid_next;
            r_cpu2ip_write_pifo_buffer_req_valid <= r_cpu2ip_write_pifo_buffer_req_valid_next;
            r_cpu2ip_write_pifo_calendar_req_valid <= r_cpu2ip_write_pifo_calendar_req_valid_next;
            
            r_cpu2ip_write_pifo_buffer_req_value <= r_cpu2ip_write_pifo_buffer_req_value_next;
            r_cpu2ip_write_pifo_calendar_req_value <= r_cpu2ip_write_pifo_calendar_req_value_next;
            r_cpu2ip_write_sume_buffer_req_value <= r_cpu2ip_write_sume_buffer_req_value_next;
            r_cpu2ip_write_pkt_buffer_req_value <= r_cpu2ip_write_pkt_buffer_req_value_next;
            
            r_pkt_buffer_write_req_valud_last_index <= r_pkt_buffer_write_req_valud_last_index_next;
            r_sume_buffer_write_req_valud_last_index <= r_sume_buffer_write_req_valud_last_index_next;
        end

end

// sync write & read response valid signal in DP clock

always @(*)
begin
    r_write_resp_valid_clock_dp_next = r_write_resp_valid_clock_dp;
    r_read_resp_valid_clock_dp_next = r_read_resp_valid_clock_dp;

    // if either input read valid signal or read register is valid 
    // and the combinational logic output for axi_rvalid is 0
    // then keep value to 1
    // else, set to 0
    if((w_read_valid | r_read_resp_valid_clock_dp) & ~r_axi_rvalid_next)
        r_read_resp_valid_clock_dp_next = 1;
    else
        r_read_resp_valid_clock_dp_next = 0;


    // if ether the input write valid signal or register value is 1
    // and the combinational logic output for axi_bvalid is 0,
    // then keep the register value to 1
    // else, set to 0
    if((w_write_valid | r_write_resp_valid_clock_dp) & ~r_axi_bvalid_next)
        r_write_resp_valid_clock_dp_next = 0;
    else
        r_write_resp_valid_clock_dp_next = 1;
end

always @(posedge S_AXI_ACLK)
begin
    if(~S_AXI_ARESETN)
        begin
            r_write_resp_valid_clock_dp <= 0;
            r_read_resp_valid_clock_dp <= 0;
        end
    else
        begin
            r_write_resp_valid_clock_dp <= r_write_resp_valid_clock_dp_next;
            r_read_resp_valid_clock_dp <= r_read_resp_valid_clock_dp_next;
        end
end



endmodule
