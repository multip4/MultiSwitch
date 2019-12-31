`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/27/2019 09:11:46 PM
// Design Name: 
// Module Name: sim_checker_general
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


module sim_checker_general
#(
parameter DATA_COUNT = 10,
parameter MAX_DATA_WIDTH = 256,
parameter MAX_DATA_DEPTH_WIDTH = 10,
parameter FILE_PATH="",
parameter LOG_FILE_PATH="log_dummy.txt",
parameter DATA_0_WIDTH = 1,
parameter DATA_1_WIDTH = 1,
parameter DATA_2_WIDTH = 1,
parameter DATA_3_WIDTH = 1,
parameter DATA_4_WIDTH = 1,
parameter DATA_5_WIDTH = 1,
parameter DATA_6_WIDTH = 1,
parameter DATA_7_WIDTH = 1,
parameter DATA_8_WIDTH = 1,
parameter DATA_9_WIDTH = 1
)
(

input clk,
input rstn,

output                          s_axis_ready,
input                           s_axis_valid,
input      [DATA_0_WIDTH-1:0]   s_axis_data0,
input      [DATA_1_WIDTH-1:0]   s_axis_data1,
input      [DATA_2_WIDTH-1:0]   s_axis_data2,
input      [DATA_3_WIDTH-1:0]   s_axis_data3,
input      [DATA_4_WIDTH-1:0]   s_axis_data4,
input      [DATA_5_WIDTH-1:0]   s_axis_data5,
input      [DATA_6_WIDTH-1:0]   s_axis_data6,
input      [DATA_7_WIDTH-1:0]   s_axis_data7,
input      [DATA_8_WIDTH-1:0]   s_axis_data8,
input      [DATA_9_WIDTH-1:0]   s_axis_data9
    );


reg      [DATA_0_WIDTH-1:0]   r_exp_data0;
reg      [DATA_1_WIDTH-1:0]   r_exp_data1;
reg      [DATA_2_WIDTH-1:0]   r_exp_data2;
reg      [DATA_3_WIDTH-1:0]   r_exp_data3;
reg      [DATA_4_WIDTH-1:0]   r_exp_data4;
reg      [DATA_5_WIDTH-1:0]   r_exp_data5;
reg      [DATA_6_WIDTH-1:0]   r_exp_data6;
reg      [DATA_7_WIDTH-1:0]   r_exp_data7;
reg      [DATA_8_WIDTH-1:0]   r_exp_data8;
reg      [DATA_9_WIDTH-1:0]   r_exp_data9;

reg     [MAX_DATA_DEPTH_WIDTH-1:0] r_file_read_line_counter, r_file_read_line_counter_next;


reg     [DATA_COUNT-1:0] r_check_result;

integer expected_check_result = 2 ** DATA_COUNT - 1;

//file read
integer               exp_data_file    ; // file handler
integer               exp_scan_file    ; // file handler
localparam NULL = 0;

integer               log_data_file    ; // file handler
initial begin
    exp_data_file = $fopen(FILE_PATH, "r");
    if (exp_data_file == NULL) begin
        $display("exp_data_file handle was NULL");
        $finish;
    end
  
    log_data_file = $fopen(LOG_FILE_PATH, "w"); 
    if (log_data_file == NULL) begin
        $display("log_file handle was NULL");
        $finish;
    end    
end

always @(*) begin
    r_file_read_line_counter_next = r_file_read_line_counter + 1;
end

always @(posedge clk) begin
    
    if(~rstn) begin
    //reset here

        r_exp_data0 <= 0;
        r_exp_data1 <= 0;
        r_exp_data2 <= 0;
        r_exp_data3 <= 0;
        r_exp_data4 <= 0;
        r_exp_data5 <= 0;
        r_exp_data6 <= 0;
        r_exp_data7 <= 0;
        r_exp_data8 <= 0;
        r_exp_data9 <= 0;
        r_check_result <= 0;
        r_file_read_line_counter <=0;

    end
    else    begin
    // read expected file and check with data,

        if(s_axis_valid) begin
            $fwrite(log_data_file,"[Time: %0t] %h,%h,%h,%h,%h,%h,%h,%h,%h,%h\n",$time,s_axis_data0,s_axis_data1,s_axis_data2,s_axis_data3,s_axis_data4,s_axis_data5,s_axis_data6,s_axis_data7,s_axis_data8,s_axis_data9);
        end
        
        //read next line
        if (!$feof(exp_data_file) & s_axis_valid) begin 
    
            
            r_file_read_line_counter <= r_file_read_line_counter_next;
            //read file        
            exp_scan_file = $fscanf(exp_data_file, "%h,%h,%h,%h,%h,%h,%h,%h,%h,%h\n", r_exp_data0,r_exp_data1,r_exp_data2,r_exp_data3,r_exp_data4,r_exp_data5,r_exp_data6,r_exp_data7,r_exp_data8,r_exp_data9); 
            //use captured_data as you would any other wire or reg value;
            $display("[%0t] [Sim Checker IP] Read next line: %h,%h,%h,%h,%h,%h,%h,%h,%h,%h", $time, r_exp_data0,r_exp_data1,r_exp_data2,r_exp_data3,r_exp_data4,r_exp_data5,r_exp_data6,r_exp_data7,r_exp_data8,r_exp_data9);
            
            r_check_result[0] = (DATA_COUNT > 0 && (s_axis_data0 == r_exp_data0)) ? 1 : 0;
            r_check_result[1] = (DATA_COUNT > 1 && (s_axis_data1 == r_exp_data1)) ? 1 : 0;
            r_check_result[2] = (DATA_COUNT > 2 && (s_axis_data2 == r_exp_data2)) ? 1 : 0;
            r_check_result[3] = (DATA_COUNT > 3 && (s_axis_data3 == r_exp_data3)) ? 1 : 0;
            r_check_result[4] = (DATA_COUNT > 4 && (s_axis_data4 == r_exp_data4)) ? 1 : 0;
            r_check_result[5] = (DATA_COUNT > 5 && (s_axis_data5 == r_exp_data5)) ? 1 : 0;
            r_check_result[6] = (DATA_COUNT > 6 && (s_axis_data6 == r_exp_data6)) ? 1 : 0;
            r_check_result[7] = (DATA_COUNT > 7 && (s_axis_data7 == r_exp_data7)) ? 1 : 0;
            r_check_result[8] = (DATA_COUNT > 8 && (s_axis_data8 == r_exp_data8)) ? 1 : 0;
            r_check_result[9] = (DATA_COUNT > 9 && (s_axis_data9 == r_exp_data9)) ? 1 : 0;    
     
            if(r_check_result ==  expected_check_result)
                $display("[%0t] [Sim Checker IP] (Pass) : Line %d .", $time, r_file_read_line_counter);
            else begin
                $display("[%0t] [Sim Checker IP] (Fail) : Line %d .", $time, r_file_read_line_counter);            
                $display("[%0t] [Sim Checker IP] Expected: %h,%h,%h,%h,%h,%h,%h,%h,%h,%h", $time, r_exp_data0,r_exp_data1,r_exp_data2,r_exp_data3,r_exp_data4,r_exp_data5,r_exp_data6,r_exp_data7,r_exp_data8,r_exp_data9);
                $display("[%0t] [Sim Checker IP] Actual  : %h,%h,%h,%h,%h,%h,%h,%h,%h,%h", $time, s_axis_data0,s_axis_data1,s_axis_data2,s_axis_data3,s_axis_data4,s_axis_data5,s_axis_data6,s_axis_data7,s_axis_data8,s_axis_data9);
                $display("[%0t] [Sim Checker IP] TEST FAIL !!!",$time);
                $fclose(log_data_file);  
                $finish;                          
            end
        end
        
        else if($feof(exp_data_file)) begin
            $display("[%0t] [Sim Checker IP] End read exp file",$time);
            $display("TEST PASS !!!");
            $fclose(log_data_file);
            $finish;
        end
        
    end
end
    
endmodule
