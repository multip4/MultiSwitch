`timescale 1ps / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/23/2019 10:32:51 AM
// Design Name: 
// Module Name: sim_stim_general
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


module sim_stim_general
#(
parameter DATA_COUNT = 10,
parameter FILE_PATH="",
parameter DATA_0_WIDTH = 1,
parameter DATA_1_WIDTH = 1,
parameter DATA_2_WIDTH = 1,
parameter DATA_3_WIDTH = 1,
parameter DATA_4_WIDTH = 1,
parameter DATA_5_WIDTH = 1,
parameter DATA_6_WIDTH = 1,
parameter DATA_7_WIDTH = 1,
parameter DATA_8_WIDTH = 1,
parameter DATA_9_WIDTH = 1,
parameter HAND_SHAKE = 1
)
(
input clk,
input rstn,

input                       m_axis_ready,
output reg                     m_axis_valid,
output reg [DATA_0_WIDTH-1:0]   m_axis_data0,
output reg [DATA_1_WIDTH-1:0]   m_axis_data1,
output reg [DATA_2_WIDTH-1:0]   m_axis_data2,
output reg [DATA_3_WIDTH-1:0]   m_axis_data3,
output reg [DATA_4_WIDTH-1:0]   m_axis_data4,
output reg [DATA_5_WIDTH-1:0]   m_axis_data5,
output reg [DATA_6_WIDTH-1:0]   m_axis_data6,
output reg [DATA_7_WIDTH-1:0]   m_axis_data7,
output reg [DATA_8_WIDTH-1:0]   m_axis_data8,
output reg [DATA_9_WIDTH-1:0]   m_axis_data9
    );

// register for set delay,
reg r_is_first_line, r_is_first_line_next; 
reg read_next;

//file read
integer               data_file    ; // file handler
integer               scan_file    ; // file handler
localparam NULL = 0;

initial begin
  data_file = $fopen(FILE_PATH, "r");
  if (data_file == NULL) begin
    $display("data_file handle was NULL");
    $finish;
    end
end

always @(*) begin
    
    
    read_next = 0;
    if(HAND_SHAKE) begin
        
        if(r_is_first_line) begin 
            read_next = 1;
            r_is_first_line_next = 0;
        end
        else if(m_axis_ready)
            read_next = 1;
        
    end
    else if(~HAND_SHAKE)
        read_next = 1;
end

always @(posedge clk) begin

    if(~rstn) begin // reset at low

        r_is_first_line <= 1;
        m_axis_data0 <= 0;
        m_axis_data1 <= 0;
        m_axis_data2 <= 0;
        m_axis_data3 <= 0;
        m_axis_data4 <= 0;
        m_axis_data5 <= 0;
        m_axis_data6 <= 0;
        m_axis_data7 <= 0;
        m_axis_data8 <= 0;
        m_axis_data9 <= 0;
        m_axis_valid <= 0;
    end
    else begin // sync, update FF registers
        r_is_first_line <= r_is_first_line_next;
        if (!$feof(data_file) & read_next) begin 
        //read file
        m_axis_valid <= 1;
        scan_file = $fscanf(data_file, "%h,%h,%h,%h,%h,%h,%h,%h,%h,%h\n", m_axis_data0,m_axis_data1,m_axis_data2,m_axis_data3,m_axis_data4,m_axis_data5,m_axis_data6,m_axis_data7,m_axis_data8,m_axis_data9); 
        //use captured_data as you would any other wire or reg value;
        $display("[%0t] [Sim Stim IP   ] Read next line: %h,%h,%h,%h,%h,%h,%h,%h,%h,%h", $time,m_axis_data0,m_axis_data1,m_axis_data2,m_axis_data3,m_axis_data4,m_axis_data5,m_axis_data6,m_axis_data7,m_axis_data8,m_axis_data9); 

        end
        
        // if read the end of line and receive the handshake signal, then set m_axis_valid signal to 0
        
        else if($feof(data_file) & read_next) begin
            m_axis_valid <= 0;
        end
            
    end

end

endmodule