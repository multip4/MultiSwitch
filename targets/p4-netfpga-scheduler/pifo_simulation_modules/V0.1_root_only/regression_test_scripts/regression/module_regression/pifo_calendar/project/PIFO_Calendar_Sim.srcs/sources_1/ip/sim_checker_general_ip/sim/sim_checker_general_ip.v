// (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
// 
// DO NOT MODIFY THIS FILE.


// IP VLNV: NetFPGA:NetFPGA:sim_checker_general:1.00
// IP Revision: 1

`timescale 1ns/1ps

(* IP_DEFINITION_SOURCE = "package_project" *)
(* DowngradeIPIdentifiedWarnings = "yes" *)
module sim_checker_general_ip (
  clk,
  rstn,
  s_axis_ready,
  s_axis_valid,
  s_axis_data0,
  s_axis_data1,
  s_axis_data2,
  s_axis_data3,
  s_axis_data4,
  s_axis_data5,
  s_axis_data6,
  s_axis_data7,
  s_axis_data8,
  s_axis_data9
);

(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME clk, ASSOCIATED_RESET rstn, FREQ_HZ 100000000, PHASE 0.000" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:clock:1.0 clk CLK" *)
input wire clk;
(* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME rstn, POLARITY ACTIVE_LOW" *)
(* X_INTERFACE_INFO = "xilinx.com:signal:reset:1.0 rstn RST" *)
input wire rstn;
output wire s_axis_ready;
input wire s_axis_valid;
input wire [0 : 0] s_axis_data0;
input wire [0 : 0] s_axis_data1;
input wire [0 : 0] s_axis_data2;
input wire [0 : 0] s_axis_data3;
input wire [0 : 0] s_axis_data4;
input wire [0 : 0] s_axis_data5;
input wire [0 : 0] s_axis_data6;
input wire [0 : 0] s_axis_data7;
input wire [0 : 0] s_axis_data8;
input wire [0 : 0] s_axis_data9;

  sim_checker_general #(
    .STOP_FAIL(1),
    .DATA_COUNT(3),
    .MAX_DATA_WIDTH(256),
    .MAX_DATA_DEPTH_WIDTH(10),
    .FILE_PATH("/home/jkchoi/Documents/git/MultiSwitch/targets/p4-netfpga-scheduler/pifo_simulation_modules/V0.1_root_only/regression_test_scripts/regression/module_regression/pifo_calendar/test_data/test01/data_exp.txt"),
    .LOG_FILE_PATH("/home/jkchoi/Documents/git/MultiSwitch/targets/p4-netfpga-scheduler/pifo_simulation_modules/V0.1_root_only/regression_test_scripts/regression/module_regression/pifo_calendar/log_test01_18112020_140754.txt"),
    .DATA_0_WIDTH(1),
    .DATA_1_WIDTH(1),
    .DATA_2_WIDTH(1),
    .DATA_3_WIDTH(1),
    .DATA_4_WIDTH(1),
    .DATA_5_WIDTH(1),
    .DATA_6_WIDTH(1),
    .DATA_7_WIDTH(1),
    .DATA_8_WIDTH(1),
    .DATA_9_WIDTH(1)
  ) inst (
    .clk(clk),
    .rstn(rstn),
    .s_axis_ready(s_axis_ready),
    .s_axis_valid(s_axis_valid),
    .s_axis_data0(s_axis_data0),
    .s_axis_data1(s_axis_data1),
    .s_axis_data2(s_axis_data2),
    .s_axis_data3(s_axis_data3),
    .s_axis_data4(s_axis_data4),
    .s_axis_data5(s_axis_data5),
    .s_axis_data6(s_axis_data6),
    .s_axis_data7(s_axis_data7),
    .s_axis_data8(s_axis_data8),
    .s_axis_data9(s_axis_data9)
  );
endmodule
