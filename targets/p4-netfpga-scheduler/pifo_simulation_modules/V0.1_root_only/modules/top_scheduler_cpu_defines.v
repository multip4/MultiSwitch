`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/25/2019 03:15:41 AM
// Design Name: 
// Module Name: top_scheduler_cpu_defines
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: cpu addr and data type defines
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`define  PKT_BUFFER_ID                      0 
`define  PKT_BUFFER_DATA_BITS				288:0
`define  PKT_BUFFER_WORD_COUNT				10
`define  PKT_BUFFER_DATA_SHIFT_OFFSET		257

`define  SUME_BUFFER_ID                     1
`define  SUME_BUFFER_DATA_BITS				127:0
`define  SUME_BUFFER_WORD_COUNT				4
`define  SUME_BUFFER_DATA_SHIFT_OFFSET		96

`define  PIFO_BUFFER_ID                     2 
`define  PIFO_BUFFER_DATA_BITS				31:0
`define  PIFO_BUFFER_WORD_COUNT				1

`define  PIFO_CALENDAR_ID                   3
`define  PIFO_CALENDAR_DATA_BITS		    31:0
`define  PIFO_CALENDAR_WORD_COUNT		    1

`define  STAT_EQ_AGENT                      0


