// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.2 (lin64) Build 2258646 Thu Jun 14 20:02:38 MDT 2018
// Date        : Thu Oct 31 19:48:25 2019
// Host        : jkchoi-KU running 64-bit Ubuntu 16.04.5 LTS
// Command     : write_verilog test.v
// Design      : cpu_module
// Purpose     : This is a Verilog netlist of the current design or from a specific cell of the design. The output is an
//               IEEE 1364-2001 compliant Verilog HDL file that contains netlist information obtained from the input
//               design files.
// Device      : xc7vx690tffg1761-3
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* C_BASE_ADDRESS = "4'b0000" *) (* C_S_AXI_ADDR_WIDTH = "4" *) (* C_S_AXI_DATA_WIDTH = "32" *) 
(* ECO_CHECKSUM = "660d0813" *) (* INDEX_WIDTH = "4" *) 
(* STRUCTURAL_NETLIST = "yes" *)
module cpu_module
   (clk,
    resetn,
    cpu_resetn_soft,
    resetn_soft,
    resetn_sync,
    ip2cpu_jk_reg_data,
    ip2cpu_jk_reg_index,
    ip2cpu_jk_reg_valid,
    ipReadReq_jk_reg_index,
    ipReadReq_jk_reg_valid,
    cpu2ip_jk_reg_data,
    cpu2ip_jk_reg_index,
    cpu2ip_jk_reg_valid,
    S_AXI_ACLK,
    S_AXI_ARESETN,
    S_AXI_AWADDR,
    S_AXI_AWVALID,
    S_AXI_WDATA,
    S_AXI_WSTRB,
    S_AXI_WVALID,
    S_AXI_BREADY,
    S_AXI_ARADDR,
    S_AXI_ARVALID,
    S_AXI_RREADY,
    S_AXI_ARREADY,
    S_AXI_RDATA,
    S_AXI_RRESP,
    S_AXI_RVALID,
    S_AXI_WREADY,
    S_AXI_BRESP,
    S_AXI_BVALID,
    S_AXI_AWREADY);
  input clk;
  input resetn;
  input cpu_resetn_soft;
  output resetn_soft;
  output resetn_sync;
  input [31:0]ip2cpu_jk_reg_data;
  input [3:0]ip2cpu_jk_reg_index;
  input ip2cpu_jk_reg_valid;
  output [3:0]ipReadReq_jk_reg_index;
  output ipReadReq_jk_reg_valid;
  output [31:0]cpu2ip_jk_reg_data;
  output [3:0]cpu2ip_jk_reg_index;
  output cpu2ip_jk_reg_valid;
  input S_AXI_ACLK;
  input S_AXI_ARESETN;
  input [3:0]S_AXI_AWADDR;
  input S_AXI_AWVALID;
  input [31:0]S_AXI_WDATA;
  input [3:0]S_AXI_WSTRB;
  input S_AXI_WVALID;
  input S_AXI_BREADY;
  input [3:0]S_AXI_ARADDR;
  input S_AXI_ARVALID;
  input S_AXI_RREADY;
  output S_AXI_ARREADY;
  output [31:0]S_AXI_RDATA;
  output [1:0]S_AXI_RRESP;
  output S_AXI_RVALID;
  output S_AXI_WREADY;
  output [1:0]S_AXI_BRESP;
  output S_AXI_BVALID;
  output S_AXI_AWREADY;

  wire \<const0> ;
  wire \<const1> ;
  wire S_AXI_ACLK;
  wire S_AXI_ACLK_IBUF;
  wire S_AXI_ACLK_IBUF_BUFG;
  wire [3:0]S_AXI_ARADDR;
  wire [3:0]S_AXI_ARADDR_IBUF;
  wire S_AXI_ARESETN;
  wire S_AXI_ARESETN_IBUF;
  wire S_AXI_ARREADY;
  wire S_AXI_ARREADY_OBUF;
  wire S_AXI_ARVALID;
  wire S_AXI_ARVALID_IBUF;
  wire [3:0]S_AXI_AWADDR;
  wire [3:0]S_AXI_AWADDR_IBUF;
  wire S_AXI_AWREADY;
  wire S_AXI_AWREADY_OBUF;
  wire S_AXI_AWVALID;
  wire S_AXI_AWVALID_IBUF;
  wire S_AXI_BREADY;
  wire S_AXI_BREADY_IBUF;
  wire [1:0]S_AXI_BRESP;
  wire S_AXI_BVALID;
  wire S_AXI_BVALID_OBUF;
  wire [31:0]S_AXI_RDATA;
  wire [31:0]S_AXI_RDATA_OBUF;
  wire S_AXI_RREADY;
  wire S_AXI_RREADY_IBUF;
  wire [1:0]S_AXI_RRESP;
  wire S_AXI_RVALID;
  wire S_AXI_RVALID_OBUF;
  wire [31:0]S_AXI_WDATA;
  wire [31:0]S_AXI_WDATA_IBUF;
  wire S_AXI_WREADY;
  wire S_AXI_WREADY_OBUF;
  wire [3:0]S_AXI_WSTRB;
  wire [3:0]S_AXI_WSTRB_IBUF;
  wire S_AXI_WVALID;
  wire S_AXI_WVALID_IBUF;
  wire [3:0]axi_araddr;
  wire axi_arready0;
  wire axi_arready_i_1_n_0;
  wire [3:0]axi_awaddr;
  wire axi_awready0;
  wire axi_bvalid_i_1_n_0;
  wire axi_rvalid_i_1_n_0;
  wire axi_wready0;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [31:0]cpu2ip_jk_reg_data;
  wire \cpu2ip_jk_reg_data[0]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[10]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[11]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[12]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[13]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[14]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[15]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[15]_i_2_n_0 ;
  wire \cpu2ip_jk_reg_data[16]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[17]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[18]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[19]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[1]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[20]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[21]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[22]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[23]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[23]_i_2_n_0 ;
  wire \cpu2ip_jk_reg_data[24]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[25]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[26]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[27]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[28]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[29]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[2]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[30]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[31]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[31]_i_2_n_0 ;
  wire \cpu2ip_jk_reg_data[31]_i_3_n_0 ;
  wire \cpu2ip_jk_reg_data[3]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[4]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[5]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[6]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[7]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[7]_i_2_n_0 ;
  wire \cpu2ip_jk_reg_data[8]_i_1_n_0 ;
  wire \cpu2ip_jk_reg_data[9]_i_1_n_0 ;
  wire [31:0]cpu2ip_jk_reg_data_OBUF;
  wire [3:0]cpu2ip_jk_reg_index;
  wire \cpu2ip_jk_reg_index[3]_i_1_n_0 ;
  wire [3:0]cpu2ip_jk_reg_index_OBUF;
  wire cpu2ip_jk_reg_valid;
  wire cpu2ip_jk_reg_valid_OBUF;
  wire cpu_resetn_soft;
  wire cpu_resetn_soft_IBUF;
  wire [31:0]ip2cpu_jk_reg_data;
  wire [31:0]ip2cpu_jk_reg_data_IBUF;
  wire ip2cpu_jk_reg_valid;
  wire ip2cpu_jk_reg_valid_IBUF;
  wire [3:0]ipReadReq_jk_reg_index;
  wire \ipReadReq_jk_reg_index[3]_i_1_n_0 ;
  wire [3:0]ipReadReq_jk_reg_index_OBUF;
  wire ipReadReq_jk_reg_valid;
  wire ipReadReq_jk_reg_valid0;
  wire ipReadReq_jk_reg_valid_OBUF;
  wire reg_wren;
  wire resetn;
  wire resetn_IBUF;
  wire resetn_soft;
  wire resetn_soft_OBUF;
  wire resetn_sync;
  wire resetn_sync_OBUF;
  wire resetn_sync_d;
  wire resetn_sync_i_1_n_0;
  wire resetn_sync_reg_lopt_replica_1;

  GND GND
       (.G(\<const0> ));
  BUFG S_AXI_ACLK_IBUF_BUFG_inst
       (.I(S_AXI_ACLK_IBUF),
        .O(S_AXI_ACLK_IBUF_BUFG));
  IBUF S_AXI_ACLK_IBUF_inst
       (.I(S_AXI_ACLK),
        .O(S_AXI_ACLK_IBUF));
  IBUF \S_AXI_ARADDR_IBUF[0]_inst 
       (.I(S_AXI_ARADDR[0]),
        .O(S_AXI_ARADDR_IBUF[0]));
  IBUF \S_AXI_ARADDR_IBUF[1]_inst 
       (.I(S_AXI_ARADDR[1]),
        .O(S_AXI_ARADDR_IBUF[1]));
  IBUF \S_AXI_ARADDR_IBUF[2]_inst 
       (.I(S_AXI_ARADDR[2]),
        .O(S_AXI_ARADDR_IBUF[2]));
  IBUF \S_AXI_ARADDR_IBUF[3]_inst 
       (.I(S_AXI_ARADDR[3]),
        .O(S_AXI_ARADDR_IBUF[3]));
  IBUF S_AXI_ARESETN_IBUF_inst
       (.I(S_AXI_ARESETN),
        .O(S_AXI_ARESETN_IBUF));
  OBUF S_AXI_ARREADY_OBUF_inst
       (.I(S_AXI_ARREADY_OBUF),
        .O(S_AXI_ARREADY));
  IBUF S_AXI_ARVALID_IBUF_inst
       (.I(S_AXI_ARVALID),
        .O(S_AXI_ARVALID_IBUF));
  IBUF \S_AXI_AWADDR_IBUF[0]_inst 
       (.I(S_AXI_AWADDR[0]),
        .O(S_AXI_AWADDR_IBUF[0]));
  IBUF \S_AXI_AWADDR_IBUF[1]_inst 
       (.I(S_AXI_AWADDR[1]),
        .O(S_AXI_AWADDR_IBUF[1]));
  IBUF \S_AXI_AWADDR_IBUF[2]_inst 
       (.I(S_AXI_AWADDR[2]),
        .O(S_AXI_AWADDR_IBUF[2]));
  IBUF \S_AXI_AWADDR_IBUF[3]_inst 
       (.I(S_AXI_AWADDR[3]),
        .O(S_AXI_AWADDR_IBUF[3]));
  OBUF S_AXI_AWREADY_OBUF_inst
       (.I(S_AXI_AWREADY_OBUF),
        .O(S_AXI_AWREADY));
  IBUF S_AXI_AWVALID_IBUF_inst
       (.I(S_AXI_AWVALID),
        .O(S_AXI_AWVALID_IBUF));
  IBUF S_AXI_BREADY_IBUF_inst
       (.I(S_AXI_BREADY),
        .O(S_AXI_BREADY_IBUF));
  OBUF \S_AXI_BRESP_OBUF[0]_inst 
       (.I(\<const0> ),
        .O(S_AXI_BRESP[0]));
  OBUF \S_AXI_BRESP_OBUF[1]_inst 
       (.I(\<const0> ),
        .O(S_AXI_BRESP[1]));
  OBUF S_AXI_BVALID_OBUF_inst
       (.I(S_AXI_BVALID_OBUF),
        .O(S_AXI_BVALID));
  OBUF \S_AXI_RDATA_OBUF[0]_inst 
       (.I(S_AXI_RDATA_OBUF[0]),
        .O(S_AXI_RDATA[0]));
  OBUF \S_AXI_RDATA_OBUF[10]_inst 
       (.I(S_AXI_RDATA_OBUF[10]),
        .O(S_AXI_RDATA[10]));
  OBUF \S_AXI_RDATA_OBUF[11]_inst 
       (.I(S_AXI_RDATA_OBUF[11]),
        .O(S_AXI_RDATA[11]));
  OBUF \S_AXI_RDATA_OBUF[12]_inst 
       (.I(S_AXI_RDATA_OBUF[12]),
        .O(S_AXI_RDATA[12]));
  OBUF \S_AXI_RDATA_OBUF[13]_inst 
       (.I(S_AXI_RDATA_OBUF[13]),
        .O(S_AXI_RDATA[13]));
  OBUF \S_AXI_RDATA_OBUF[14]_inst 
       (.I(S_AXI_RDATA_OBUF[14]),
        .O(S_AXI_RDATA[14]));
  OBUF \S_AXI_RDATA_OBUF[15]_inst 
       (.I(S_AXI_RDATA_OBUF[15]),
        .O(S_AXI_RDATA[15]));
  OBUF \S_AXI_RDATA_OBUF[16]_inst 
       (.I(S_AXI_RDATA_OBUF[16]),
        .O(S_AXI_RDATA[16]));
  OBUF \S_AXI_RDATA_OBUF[17]_inst 
       (.I(S_AXI_RDATA_OBUF[17]),
        .O(S_AXI_RDATA[17]));
  OBUF \S_AXI_RDATA_OBUF[18]_inst 
       (.I(S_AXI_RDATA_OBUF[18]),
        .O(S_AXI_RDATA[18]));
  OBUF \S_AXI_RDATA_OBUF[19]_inst 
       (.I(S_AXI_RDATA_OBUF[19]),
        .O(S_AXI_RDATA[19]));
  OBUF \S_AXI_RDATA_OBUF[1]_inst 
       (.I(S_AXI_RDATA_OBUF[1]),
        .O(S_AXI_RDATA[1]));
  OBUF \S_AXI_RDATA_OBUF[20]_inst 
       (.I(S_AXI_RDATA_OBUF[20]),
        .O(S_AXI_RDATA[20]));
  OBUF \S_AXI_RDATA_OBUF[21]_inst 
       (.I(S_AXI_RDATA_OBUF[21]),
        .O(S_AXI_RDATA[21]));
  OBUF \S_AXI_RDATA_OBUF[22]_inst 
       (.I(S_AXI_RDATA_OBUF[22]),
        .O(S_AXI_RDATA[22]));
  OBUF \S_AXI_RDATA_OBUF[23]_inst 
       (.I(S_AXI_RDATA_OBUF[23]),
        .O(S_AXI_RDATA[23]));
  OBUF \S_AXI_RDATA_OBUF[24]_inst 
       (.I(S_AXI_RDATA_OBUF[24]),
        .O(S_AXI_RDATA[24]));
  OBUF \S_AXI_RDATA_OBUF[25]_inst 
       (.I(S_AXI_RDATA_OBUF[25]),
        .O(S_AXI_RDATA[25]));
  OBUF \S_AXI_RDATA_OBUF[26]_inst 
       (.I(S_AXI_RDATA_OBUF[26]),
        .O(S_AXI_RDATA[26]));
  OBUF \S_AXI_RDATA_OBUF[27]_inst 
       (.I(S_AXI_RDATA_OBUF[27]),
        .O(S_AXI_RDATA[27]));
  OBUF \S_AXI_RDATA_OBUF[28]_inst 
       (.I(S_AXI_RDATA_OBUF[28]),
        .O(S_AXI_RDATA[28]));
  OBUF \S_AXI_RDATA_OBUF[29]_inst 
       (.I(S_AXI_RDATA_OBUF[29]),
        .O(S_AXI_RDATA[29]));
  OBUF \S_AXI_RDATA_OBUF[2]_inst 
       (.I(S_AXI_RDATA_OBUF[2]),
        .O(S_AXI_RDATA[2]));
  OBUF \S_AXI_RDATA_OBUF[30]_inst 
       (.I(S_AXI_RDATA_OBUF[30]),
        .O(S_AXI_RDATA[30]));
  OBUF \S_AXI_RDATA_OBUF[31]_inst 
       (.I(S_AXI_RDATA_OBUF[31]),
        .O(S_AXI_RDATA[31]));
  OBUF \S_AXI_RDATA_OBUF[3]_inst 
       (.I(S_AXI_RDATA_OBUF[3]),
        .O(S_AXI_RDATA[3]));
  OBUF \S_AXI_RDATA_OBUF[4]_inst 
       (.I(S_AXI_RDATA_OBUF[4]),
        .O(S_AXI_RDATA[4]));
  OBUF \S_AXI_RDATA_OBUF[5]_inst 
       (.I(S_AXI_RDATA_OBUF[5]),
        .O(S_AXI_RDATA[5]));
  OBUF \S_AXI_RDATA_OBUF[6]_inst 
       (.I(S_AXI_RDATA_OBUF[6]),
        .O(S_AXI_RDATA[6]));
  OBUF \S_AXI_RDATA_OBUF[7]_inst 
       (.I(S_AXI_RDATA_OBUF[7]),
        .O(S_AXI_RDATA[7]));
  OBUF \S_AXI_RDATA_OBUF[8]_inst 
       (.I(S_AXI_RDATA_OBUF[8]),
        .O(S_AXI_RDATA[8]));
  OBUF \S_AXI_RDATA_OBUF[9]_inst 
       (.I(S_AXI_RDATA_OBUF[9]),
        .O(S_AXI_RDATA[9]));
  IBUF S_AXI_RREADY_IBUF_inst
       (.I(S_AXI_RREADY),
        .O(S_AXI_RREADY_IBUF));
  OBUF \S_AXI_RRESP_OBUF[0]_inst 
       (.I(\<const0> ),
        .O(S_AXI_RRESP[0]));
  OBUF \S_AXI_RRESP_OBUF[1]_inst 
       (.I(\<const0> ),
        .O(S_AXI_RRESP[1]));
  OBUF S_AXI_RVALID_OBUF_inst
       (.I(S_AXI_RVALID_OBUF),
        .O(S_AXI_RVALID));
  IBUF \S_AXI_WDATA_IBUF[0]_inst 
       (.I(S_AXI_WDATA[0]),
        .O(S_AXI_WDATA_IBUF[0]));
  IBUF \S_AXI_WDATA_IBUF[10]_inst 
       (.I(S_AXI_WDATA[10]),
        .O(S_AXI_WDATA_IBUF[10]));
  IBUF \S_AXI_WDATA_IBUF[11]_inst 
       (.I(S_AXI_WDATA[11]),
        .O(S_AXI_WDATA_IBUF[11]));
  IBUF \S_AXI_WDATA_IBUF[12]_inst 
       (.I(S_AXI_WDATA[12]),
        .O(S_AXI_WDATA_IBUF[12]));
  IBUF \S_AXI_WDATA_IBUF[13]_inst 
       (.I(S_AXI_WDATA[13]),
        .O(S_AXI_WDATA_IBUF[13]));
  IBUF \S_AXI_WDATA_IBUF[14]_inst 
       (.I(S_AXI_WDATA[14]),
        .O(S_AXI_WDATA_IBUF[14]));
  IBUF \S_AXI_WDATA_IBUF[15]_inst 
       (.I(S_AXI_WDATA[15]),
        .O(S_AXI_WDATA_IBUF[15]));
  IBUF \S_AXI_WDATA_IBUF[16]_inst 
       (.I(S_AXI_WDATA[16]),
        .O(S_AXI_WDATA_IBUF[16]));
  IBUF \S_AXI_WDATA_IBUF[17]_inst 
       (.I(S_AXI_WDATA[17]),
        .O(S_AXI_WDATA_IBUF[17]));
  IBUF \S_AXI_WDATA_IBUF[18]_inst 
       (.I(S_AXI_WDATA[18]),
        .O(S_AXI_WDATA_IBUF[18]));
  IBUF \S_AXI_WDATA_IBUF[19]_inst 
       (.I(S_AXI_WDATA[19]),
        .O(S_AXI_WDATA_IBUF[19]));
  IBUF \S_AXI_WDATA_IBUF[1]_inst 
       (.I(S_AXI_WDATA[1]),
        .O(S_AXI_WDATA_IBUF[1]));
  IBUF \S_AXI_WDATA_IBUF[20]_inst 
       (.I(S_AXI_WDATA[20]),
        .O(S_AXI_WDATA_IBUF[20]));
  IBUF \S_AXI_WDATA_IBUF[21]_inst 
       (.I(S_AXI_WDATA[21]),
        .O(S_AXI_WDATA_IBUF[21]));
  IBUF \S_AXI_WDATA_IBUF[22]_inst 
       (.I(S_AXI_WDATA[22]),
        .O(S_AXI_WDATA_IBUF[22]));
  IBUF \S_AXI_WDATA_IBUF[23]_inst 
       (.I(S_AXI_WDATA[23]),
        .O(S_AXI_WDATA_IBUF[23]));
  IBUF \S_AXI_WDATA_IBUF[24]_inst 
       (.I(S_AXI_WDATA[24]),
        .O(S_AXI_WDATA_IBUF[24]));
  IBUF \S_AXI_WDATA_IBUF[25]_inst 
       (.I(S_AXI_WDATA[25]),
        .O(S_AXI_WDATA_IBUF[25]));
  IBUF \S_AXI_WDATA_IBUF[26]_inst 
       (.I(S_AXI_WDATA[26]),
        .O(S_AXI_WDATA_IBUF[26]));
  IBUF \S_AXI_WDATA_IBUF[27]_inst 
       (.I(S_AXI_WDATA[27]),
        .O(S_AXI_WDATA_IBUF[27]));
  IBUF \S_AXI_WDATA_IBUF[28]_inst 
       (.I(S_AXI_WDATA[28]),
        .O(S_AXI_WDATA_IBUF[28]));
  IBUF \S_AXI_WDATA_IBUF[29]_inst 
       (.I(S_AXI_WDATA[29]),
        .O(S_AXI_WDATA_IBUF[29]));
  IBUF \S_AXI_WDATA_IBUF[2]_inst 
       (.I(S_AXI_WDATA[2]),
        .O(S_AXI_WDATA_IBUF[2]));
  IBUF \S_AXI_WDATA_IBUF[30]_inst 
       (.I(S_AXI_WDATA[30]),
        .O(S_AXI_WDATA_IBUF[30]));
  IBUF \S_AXI_WDATA_IBUF[31]_inst 
       (.I(S_AXI_WDATA[31]),
        .O(S_AXI_WDATA_IBUF[31]));
  IBUF \S_AXI_WDATA_IBUF[3]_inst 
       (.I(S_AXI_WDATA[3]),
        .O(S_AXI_WDATA_IBUF[3]));
  IBUF \S_AXI_WDATA_IBUF[4]_inst 
       (.I(S_AXI_WDATA[4]),
        .O(S_AXI_WDATA_IBUF[4]));
  IBUF \S_AXI_WDATA_IBUF[5]_inst 
       (.I(S_AXI_WDATA[5]),
        .O(S_AXI_WDATA_IBUF[5]));
  IBUF \S_AXI_WDATA_IBUF[6]_inst 
       (.I(S_AXI_WDATA[6]),
        .O(S_AXI_WDATA_IBUF[6]));
  IBUF \S_AXI_WDATA_IBUF[7]_inst 
       (.I(S_AXI_WDATA[7]),
        .O(S_AXI_WDATA_IBUF[7]));
  IBUF \S_AXI_WDATA_IBUF[8]_inst 
       (.I(S_AXI_WDATA[8]),
        .O(S_AXI_WDATA_IBUF[8]));
  IBUF \S_AXI_WDATA_IBUF[9]_inst 
       (.I(S_AXI_WDATA[9]),
        .O(S_AXI_WDATA_IBUF[9]));
  OBUF S_AXI_WREADY_OBUF_inst
       (.I(S_AXI_WREADY_OBUF),
        .O(S_AXI_WREADY));
  IBUF \S_AXI_WSTRB_IBUF[0]_inst 
       (.I(S_AXI_WSTRB[0]),
        .O(S_AXI_WSTRB_IBUF[0]));
  IBUF \S_AXI_WSTRB_IBUF[1]_inst 
       (.I(S_AXI_WSTRB[1]),
        .O(S_AXI_WSTRB_IBUF[1]));
  IBUF \S_AXI_WSTRB_IBUF[2]_inst 
       (.I(S_AXI_WSTRB[2]),
        .O(S_AXI_WSTRB_IBUF[2]));
  IBUF \S_AXI_WSTRB_IBUF[3]_inst 
       (.I(S_AXI_WSTRB[3]),
        .O(S_AXI_WSTRB_IBUF[3]));
  IBUF S_AXI_WVALID_IBUF_inst
       (.I(S_AXI_WVALID),
        .O(S_AXI_WVALID_IBUF));
  VCC VCC
       (.P(\<const1> ));
  FDRE #(
    .INIT(1'b0)) 
    \axi_araddr_reg[0] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(axi_arready0),
        .D(S_AXI_ARADDR_IBUF[0]),
        .Q(axi_araddr[0]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_araddr_reg[1] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(axi_arready0),
        .D(S_AXI_ARADDR_IBUF[1]),
        .Q(axi_araddr[1]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_araddr_reg[2] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(axi_arready0),
        .D(S_AXI_ARADDR_IBUF[2]),
        .Q(axi_araddr[2]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_araddr_reg[3] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(axi_arready0),
        .D(S_AXI_ARADDR_IBUF[3]),
        .Q(axi_araddr[3]),
        .R(axi_arready_i_1_n_0));
  LUT1 #(
    .INIT(2'h1)) 
    axi_arready_i_1
       (.I0(S_AXI_ARESETN_IBUF),
        .O(axi_arready_i_1_n_0));
  LUT2 #(
    .INIT(4'h2)) 
    axi_arready_i_2
       (.I0(S_AXI_ARVALID_IBUF),
        .I1(S_AXI_ARREADY_OBUF),
        .O(axi_arready0));
  FDRE #(
    .INIT(1'b0)) 
    axi_arready_reg
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(\<const1> ),
        .D(axi_arready0),
        .Q(S_AXI_ARREADY_OBUF),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_awaddr_reg[0] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(axi_awready0),
        .D(S_AXI_AWADDR_IBUF[0]),
        .Q(axi_awaddr[0]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_awaddr_reg[1] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(axi_awready0),
        .D(S_AXI_AWADDR_IBUF[1]),
        .Q(axi_awaddr[1]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_awaddr_reg[2] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(axi_awready0),
        .D(S_AXI_AWADDR_IBUF[2]),
        .Q(axi_awaddr[2]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_awaddr_reg[3] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(axi_awready0),
        .D(S_AXI_AWADDR_IBUF[3]),
        .Q(axi_awaddr[3]),
        .R(axi_arready_i_1_n_0));
  LUT3 #(
    .INIT(8'h08)) 
    axi_awready_i_1
       (.I0(S_AXI_AWVALID_IBUF),
        .I1(S_AXI_WVALID_IBUF),
        .I2(S_AXI_AWREADY_OBUF),
        .O(axi_awready0));
  FDRE #(
    .INIT(1'b0)) 
    axi_awready_reg
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(\<const1> ),
        .D(axi_awready0),
        .Q(S_AXI_AWREADY_OBUF),
        .R(axi_arready_i_1_n_0));
  LUT6 #(
    .INIT(64'h55C0550055005500)) 
    axi_bvalid_i_1
       (.I0(S_AXI_BREADY_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WVALID_IBUF),
        .I3(S_AXI_BVALID_OBUF),
        .I4(S_AXI_WREADY_OBUF),
        .I5(S_AXI_AWREADY_OBUF),
        .O(axi_bvalid_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_bvalid_reg
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(\<const1> ),
        .D(axi_bvalid_i_1_n_0),
        .Q(S_AXI_BVALID_OBUF),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[0] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[0]),
        .Q(S_AXI_RDATA_OBUF[0]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[10] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[10]),
        .Q(S_AXI_RDATA_OBUF[10]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[11] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[11]),
        .Q(S_AXI_RDATA_OBUF[11]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[12] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[12]),
        .Q(S_AXI_RDATA_OBUF[12]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[13] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[13]),
        .Q(S_AXI_RDATA_OBUF[13]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[14] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[14]),
        .Q(S_AXI_RDATA_OBUF[14]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[15] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[15]),
        .Q(S_AXI_RDATA_OBUF[15]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[16] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[16]),
        .Q(S_AXI_RDATA_OBUF[16]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[17] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[17]),
        .Q(S_AXI_RDATA_OBUF[17]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[18] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[18]),
        .Q(S_AXI_RDATA_OBUF[18]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[19] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[19]),
        .Q(S_AXI_RDATA_OBUF[19]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[1] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[1]),
        .Q(S_AXI_RDATA_OBUF[1]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[20] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[20]),
        .Q(S_AXI_RDATA_OBUF[20]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[21] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[21]),
        .Q(S_AXI_RDATA_OBUF[21]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[22] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[22]),
        .Q(S_AXI_RDATA_OBUF[22]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[23] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[23]),
        .Q(S_AXI_RDATA_OBUF[23]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[24] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[24]),
        .Q(S_AXI_RDATA_OBUF[24]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[25] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[25]),
        .Q(S_AXI_RDATA_OBUF[25]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[26] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[26]),
        .Q(S_AXI_RDATA_OBUF[26]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[27] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[27]),
        .Q(S_AXI_RDATA_OBUF[27]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[28] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[28]),
        .Q(S_AXI_RDATA_OBUF[28]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[29] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[29]),
        .Q(S_AXI_RDATA_OBUF[29]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[2] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[2]),
        .Q(S_AXI_RDATA_OBUF[2]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[30] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[30]),
        .Q(S_AXI_RDATA_OBUF[30]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[31] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[31]),
        .Q(S_AXI_RDATA_OBUF[31]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[3] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[3]),
        .Q(S_AXI_RDATA_OBUF[3]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[4] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[4]),
        .Q(S_AXI_RDATA_OBUF[4]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[5] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[5]),
        .Q(S_AXI_RDATA_OBUF[5]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[6] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[6]),
        .Q(S_AXI_RDATA_OBUF[6]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[7] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[7]),
        .Q(S_AXI_RDATA_OBUF[7]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[8] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[8]),
        .Q(S_AXI_RDATA_OBUF[8]),
        .R(axi_arready_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    \axi_rdata_reg[9] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_data_IBUF[9]),
        .Q(S_AXI_RDATA_OBUF[9]),
        .R(axi_arready_i_1_n_0));
  LUT3 #(
    .INIT(8'h8F)) 
    axi_rvalid_i_1
       (.I0(S_AXI_RVALID_OBUF),
        .I1(S_AXI_RREADY_IBUF),
        .I2(S_AXI_ARESETN_IBUF),
        .O(axi_rvalid_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    axi_rvalid_reg
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(ip2cpu_jk_reg_valid_IBUF),
        .D(ip2cpu_jk_reg_valid_IBUF),
        .Q(S_AXI_RVALID_OBUF),
        .R(axi_rvalid_i_1_n_0));
  LUT3 #(
    .INIT(8'h08)) 
    axi_wready_i_1
       (.I0(S_AXI_AWVALID_IBUF),
        .I1(S_AXI_WVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .O(axi_wready0));
  FDRE #(
    .INIT(1'b0)) 
    axi_wready_reg
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(\<const1> ),
        .D(axi_wready0),
        .Q(S_AXI_WREADY_OBUF),
        .R(axi_arready_i_1_n_0));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[0]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[0]),
        .O(\cpu2ip_jk_reg_data[0]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[10]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[10]),
        .O(\cpu2ip_jk_reg_data[10]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[11]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[11]),
        .O(\cpu2ip_jk_reg_data[11]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[12]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[12]),
        .O(\cpu2ip_jk_reg_data[12]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[13]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[13]),
        .O(\cpu2ip_jk_reg_data[13]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[14]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[14]),
        .O(\cpu2ip_jk_reg_data[14]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7FFF)) 
    \cpu2ip_jk_reg_data[15]_i_1 
       (.I0(S_AXI_AWREADY_OBUF),
        .I1(S_AXI_WREADY_OBUF),
        .I2(S_AXI_AWVALID_IBUF),
        .I3(S_AXI_WVALID_IBUF),
        .I4(S_AXI_WSTRB_IBUF[1]),
        .O(\cpu2ip_jk_reg_data[15]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[15]_i_2 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[15]),
        .O(\cpu2ip_jk_reg_data[15]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[16]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[16]),
        .O(\cpu2ip_jk_reg_data[16]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[17]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[17]),
        .O(\cpu2ip_jk_reg_data[17]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[18]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[18]),
        .O(\cpu2ip_jk_reg_data[18]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[19]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[19]),
        .O(\cpu2ip_jk_reg_data[19]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[1]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[1]),
        .O(\cpu2ip_jk_reg_data[1]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[20]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[20]),
        .O(\cpu2ip_jk_reg_data[20]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[21]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[21]),
        .O(\cpu2ip_jk_reg_data[21]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[22]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[22]),
        .O(\cpu2ip_jk_reg_data[22]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7FFF)) 
    \cpu2ip_jk_reg_data[23]_i_1 
       (.I0(S_AXI_AWREADY_OBUF),
        .I1(S_AXI_WREADY_OBUF),
        .I2(S_AXI_AWVALID_IBUF),
        .I3(S_AXI_WVALID_IBUF),
        .I4(S_AXI_WSTRB_IBUF[2]),
        .O(\cpu2ip_jk_reg_data[23]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[23]_i_2 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[23]),
        .O(\cpu2ip_jk_reg_data[23]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[24]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[24]),
        .O(\cpu2ip_jk_reg_data[24]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[25]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[25]),
        .O(\cpu2ip_jk_reg_data[25]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[26]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[26]),
        .O(\cpu2ip_jk_reg_data[26]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[27]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[27]),
        .O(\cpu2ip_jk_reg_data[27]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[28]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[28]),
        .O(\cpu2ip_jk_reg_data[28]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[29]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[29]),
        .O(\cpu2ip_jk_reg_data[29]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[2]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[2]),
        .O(\cpu2ip_jk_reg_data[2]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[30]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[30]),
        .O(\cpu2ip_jk_reg_data[30]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \cpu2ip_jk_reg_data[31]_i_1 
       (.I0(resetn_sync_OBUF),
        .O(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7FFF)) 
    \cpu2ip_jk_reg_data[31]_i_2 
       (.I0(S_AXI_AWREADY_OBUF),
        .I1(S_AXI_WREADY_OBUF),
        .I2(S_AXI_AWVALID_IBUF),
        .I3(S_AXI_WVALID_IBUF),
        .I4(S_AXI_WSTRB_IBUF[3]),
        .O(\cpu2ip_jk_reg_data[31]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[31]_i_3 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[31]),
        .O(\cpu2ip_jk_reg_data[31]_i_3_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[3]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[3]),
        .O(\cpu2ip_jk_reg_data[3]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[4]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[4]),
        .O(\cpu2ip_jk_reg_data[4]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[5]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[5]),
        .O(\cpu2ip_jk_reg_data[5]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[6]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[6]),
        .O(\cpu2ip_jk_reg_data[6]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'hFFFF7FFF)) 
    \cpu2ip_jk_reg_data[7]_i_1 
       (.I0(S_AXI_AWREADY_OBUF),
        .I1(S_AXI_WREADY_OBUF),
        .I2(S_AXI_AWVALID_IBUF),
        .I3(S_AXI_WVALID_IBUF),
        .I4(S_AXI_WSTRB_IBUF[0]),
        .O(\cpu2ip_jk_reg_data[7]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[7]_i_2 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[7]),
        .O(\cpu2ip_jk_reg_data[7]_i_2_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[8]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[8]),
        .O(\cpu2ip_jk_reg_data[8]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h80000000)) 
    \cpu2ip_jk_reg_data[9]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(S_AXI_WDATA_IBUF[9]),
        .O(\cpu2ip_jk_reg_data[9]_i_1_n_0 ));
  OBUF \cpu2ip_jk_reg_data_OBUF[0]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[0]),
        .O(cpu2ip_jk_reg_data[0]));
  OBUF \cpu2ip_jk_reg_data_OBUF[10]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[10]),
        .O(cpu2ip_jk_reg_data[10]));
  OBUF \cpu2ip_jk_reg_data_OBUF[11]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[11]),
        .O(cpu2ip_jk_reg_data[11]));
  OBUF \cpu2ip_jk_reg_data_OBUF[12]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[12]),
        .O(cpu2ip_jk_reg_data[12]));
  OBUF \cpu2ip_jk_reg_data_OBUF[13]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[13]),
        .O(cpu2ip_jk_reg_data[13]));
  OBUF \cpu2ip_jk_reg_data_OBUF[14]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[14]),
        .O(cpu2ip_jk_reg_data[14]));
  OBUF \cpu2ip_jk_reg_data_OBUF[15]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[15]),
        .O(cpu2ip_jk_reg_data[15]));
  OBUF \cpu2ip_jk_reg_data_OBUF[16]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[16]),
        .O(cpu2ip_jk_reg_data[16]));
  OBUF \cpu2ip_jk_reg_data_OBUF[17]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[17]),
        .O(cpu2ip_jk_reg_data[17]));
  OBUF \cpu2ip_jk_reg_data_OBUF[18]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[18]),
        .O(cpu2ip_jk_reg_data[18]));
  OBUF \cpu2ip_jk_reg_data_OBUF[19]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[19]),
        .O(cpu2ip_jk_reg_data[19]));
  OBUF \cpu2ip_jk_reg_data_OBUF[1]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[1]),
        .O(cpu2ip_jk_reg_data[1]));
  OBUF \cpu2ip_jk_reg_data_OBUF[20]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[20]),
        .O(cpu2ip_jk_reg_data[20]));
  OBUF \cpu2ip_jk_reg_data_OBUF[21]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[21]),
        .O(cpu2ip_jk_reg_data[21]));
  OBUF \cpu2ip_jk_reg_data_OBUF[22]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[22]),
        .O(cpu2ip_jk_reg_data[22]));
  OBUF \cpu2ip_jk_reg_data_OBUF[23]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[23]),
        .O(cpu2ip_jk_reg_data[23]));
  OBUF \cpu2ip_jk_reg_data_OBUF[24]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[24]),
        .O(cpu2ip_jk_reg_data[24]));
  OBUF \cpu2ip_jk_reg_data_OBUF[25]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[25]),
        .O(cpu2ip_jk_reg_data[25]));
  OBUF \cpu2ip_jk_reg_data_OBUF[26]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[26]),
        .O(cpu2ip_jk_reg_data[26]));
  OBUF \cpu2ip_jk_reg_data_OBUF[27]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[27]),
        .O(cpu2ip_jk_reg_data[27]));
  OBUF \cpu2ip_jk_reg_data_OBUF[28]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[28]),
        .O(cpu2ip_jk_reg_data[28]));
  OBUF \cpu2ip_jk_reg_data_OBUF[29]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[29]),
        .O(cpu2ip_jk_reg_data[29]));
  OBUF \cpu2ip_jk_reg_data_OBUF[2]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[2]),
        .O(cpu2ip_jk_reg_data[2]));
  OBUF \cpu2ip_jk_reg_data_OBUF[30]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[30]),
        .O(cpu2ip_jk_reg_data[30]));
  OBUF \cpu2ip_jk_reg_data_OBUF[31]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[31]),
        .O(cpu2ip_jk_reg_data[31]));
  OBUF \cpu2ip_jk_reg_data_OBUF[3]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[3]),
        .O(cpu2ip_jk_reg_data[3]));
  OBUF \cpu2ip_jk_reg_data_OBUF[4]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[4]),
        .O(cpu2ip_jk_reg_data[4]));
  OBUF \cpu2ip_jk_reg_data_OBUF[5]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[5]),
        .O(cpu2ip_jk_reg_data[5]));
  OBUF \cpu2ip_jk_reg_data_OBUF[6]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[6]),
        .O(cpu2ip_jk_reg_data[6]));
  OBUF \cpu2ip_jk_reg_data_OBUF[7]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[7]),
        .O(cpu2ip_jk_reg_data[7]));
  OBUF \cpu2ip_jk_reg_data_OBUF[8]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[8]),
        .O(cpu2ip_jk_reg_data[8]));
  OBUF \cpu2ip_jk_reg_data_OBUF[9]_inst 
       (.I(cpu2ip_jk_reg_data_OBUF[9]),
        .O(cpu2ip_jk_reg_data[9]));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[7]_i_1_n_0 ),
        .D(\cpu2ip_jk_reg_data[0]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[0]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[10] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[15]_i_1_n_0 ),
        .D(\cpu2ip_jk_reg_data[10]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[10]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[11] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[15]_i_1_n_0 ),
        .D(\cpu2ip_jk_reg_data[11]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[11]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[12] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[15]_i_1_n_0 ),
        .D(\cpu2ip_jk_reg_data[12]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[12]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[13] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[15]_i_1_n_0 ),
        .D(\cpu2ip_jk_reg_data[13]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[13]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[14] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[15]_i_1_n_0 ),
        .D(\cpu2ip_jk_reg_data[14]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[14]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[15] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[15]_i_1_n_0 ),
        .D(\cpu2ip_jk_reg_data[15]_i_2_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[15]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[16] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[23]_i_1_n_0 ),
        .D(\cpu2ip_jk_reg_data[16]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[16]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[17] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[23]_i_1_n_0 ),
        .D(\cpu2ip_jk_reg_data[17]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[17]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[18] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[23]_i_1_n_0 ),
        .D(\cpu2ip_jk_reg_data[18]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[18]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[19] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[23]_i_1_n_0 ),
        .D(\cpu2ip_jk_reg_data[19]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[19]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[7]_i_1_n_0 ),
        .D(\cpu2ip_jk_reg_data[1]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[1]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[20] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[23]_i_1_n_0 ),
        .D(\cpu2ip_jk_reg_data[20]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[20]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[21] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[23]_i_1_n_0 ),
        .D(\cpu2ip_jk_reg_data[21]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[21]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[22] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[23]_i_1_n_0 ),
        .D(\cpu2ip_jk_reg_data[22]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[22]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[23] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[23]_i_1_n_0 ),
        .D(\cpu2ip_jk_reg_data[23]_i_2_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[23]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[24] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[31]_i_2_n_0 ),
        .D(\cpu2ip_jk_reg_data[24]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[24]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[25] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[31]_i_2_n_0 ),
        .D(\cpu2ip_jk_reg_data[25]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[25]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[26] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[31]_i_2_n_0 ),
        .D(\cpu2ip_jk_reg_data[26]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[26]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[27] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[31]_i_2_n_0 ),
        .D(\cpu2ip_jk_reg_data[27]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[27]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[28] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[31]_i_2_n_0 ),
        .D(\cpu2ip_jk_reg_data[28]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[28]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[29] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[31]_i_2_n_0 ),
        .D(\cpu2ip_jk_reg_data[29]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[29]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[7]_i_1_n_0 ),
        .D(\cpu2ip_jk_reg_data[2]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[2]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[30] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[31]_i_2_n_0 ),
        .D(\cpu2ip_jk_reg_data[30]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[30]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[31] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[31]_i_2_n_0 ),
        .D(\cpu2ip_jk_reg_data[31]_i_3_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[31]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[7]_i_1_n_0 ),
        .D(\cpu2ip_jk_reg_data[3]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[3]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[7]_i_1_n_0 ),
        .D(\cpu2ip_jk_reg_data[4]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[4]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[7]_i_1_n_0 ),
        .D(\cpu2ip_jk_reg_data[5]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[5]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[7]_i_1_n_0 ),
        .D(\cpu2ip_jk_reg_data[6]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[6]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[7]_i_1_n_0 ),
        .D(\cpu2ip_jk_reg_data[7]_i_2_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[7]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[8] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[15]_i_1_n_0 ),
        .D(\cpu2ip_jk_reg_data[8]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[8]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_data_reg[9] 
       (.C(clk_IBUF_BUFG),
        .CE(\cpu2ip_jk_reg_data[15]_i_1_n_0 ),
        .D(\cpu2ip_jk_reg_data[9]_i_1_n_0 ),
        .Q(cpu2ip_jk_reg_data_OBUF[9]),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  LUT5 #(
    .INIT(32'h7FFFFFFF)) 
    \cpu2ip_jk_reg_index[3]_i_1 
       (.I0(S_AXI_WVALID_IBUF),
        .I1(S_AXI_AWVALID_IBUF),
        .I2(S_AXI_WREADY_OBUF),
        .I3(S_AXI_AWREADY_OBUF),
        .I4(resetn_sync_OBUF),
        .O(\cpu2ip_jk_reg_index[3]_i_1_n_0 ));
  OBUF \cpu2ip_jk_reg_index_OBUF[0]_inst 
       (.I(cpu2ip_jk_reg_index_OBUF[0]),
        .O(cpu2ip_jk_reg_index[0]));
  OBUF \cpu2ip_jk_reg_index_OBUF[1]_inst 
       (.I(cpu2ip_jk_reg_index_OBUF[1]),
        .O(cpu2ip_jk_reg_index[1]));
  OBUF \cpu2ip_jk_reg_index_OBUF[2]_inst 
       (.I(cpu2ip_jk_reg_index_OBUF[2]),
        .O(cpu2ip_jk_reg_index[2]));
  OBUF \cpu2ip_jk_reg_index_OBUF[3]_inst 
       (.I(cpu2ip_jk_reg_index_OBUF[3]),
        .O(cpu2ip_jk_reg_index[3]));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_index_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(axi_awaddr[0]),
        .Q(cpu2ip_jk_reg_index_OBUF[0]),
        .R(\cpu2ip_jk_reg_index[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_index_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(axi_awaddr[1]),
        .Q(cpu2ip_jk_reg_index_OBUF[1]),
        .R(\cpu2ip_jk_reg_index[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_index_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(axi_awaddr[2]),
        .Q(cpu2ip_jk_reg_index_OBUF[2]),
        .R(\cpu2ip_jk_reg_index[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \cpu2ip_jk_reg_index_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(axi_awaddr[3]),
        .Q(cpu2ip_jk_reg_index_OBUF[3]),
        .R(\cpu2ip_jk_reg_index[3]_i_1_n_0 ));
  OBUF cpu2ip_jk_reg_valid_OBUF_inst
       (.I(cpu2ip_jk_reg_valid_OBUF),
        .O(cpu2ip_jk_reg_valid));
  LUT4 #(
    .INIT(16'h8000)) 
    cpu2ip_jk_reg_valid_i_1
       (.I0(S_AXI_AWREADY_OBUF),
        .I1(S_AXI_WREADY_OBUF),
        .I2(S_AXI_AWVALID_IBUF),
        .I3(S_AXI_WVALID_IBUF),
        .O(reg_wren));
  FDRE #(
    .INIT(1'b0)) 
    cpu2ip_jk_reg_valid_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(reg_wren),
        .Q(cpu2ip_jk_reg_valid_OBUF),
        .R(\cpu2ip_jk_reg_data[31]_i_1_n_0 ));
  IBUF cpu_resetn_soft_IBUF_inst
       (.I(cpu_resetn_soft),
        .O(cpu_resetn_soft_IBUF));
  IBUF \ip2cpu_jk_reg_data_IBUF[0]_inst 
       (.I(ip2cpu_jk_reg_data[0]),
        .O(ip2cpu_jk_reg_data_IBUF[0]));
  IBUF \ip2cpu_jk_reg_data_IBUF[10]_inst 
       (.I(ip2cpu_jk_reg_data[10]),
        .O(ip2cpu_jk_reg_data_IBUF[10]));
  IBUF \ip2cpu_jk_reg_data_IBUF[11]_inst 
       (.I(ip2cpu_jk_reg_data[11]),
        .O(ip2cpu_jk_reg_data_IBUF[11]));
  IBUF \ip2cpu_jk_reg_data_IBUF[12]_inst 
       (.I(ip2cpu_jk_reg_data[12]),
        .O(ip2cpu_jk_reg_data_IBUF[12]));
  IBUF \ip2cpu_jk_reg_data_IBUF[13]_inst 
       (.I(ip2cpu_jk_reg_data[13]),
        .O(ip2cpu_jk_reg_data_IBUF[13]));
  IBUF \ip2cpu_jk_reg_data_IBUF[14]_inst 
       (.I(ip2cpu_jk_reg_data[14]),
        .O(ip2cpu_jk_reg_data_IBUF[14]));
  IBUF \ip2cpu_jk_reg_data_IBUF[15]_inst 
       (.I(ip2cpu_jk_reg_data[15]),
        .O(ip2cpu_jk_reg_data_IBUF[15]));
  IBUF \ip2cpu_jk_reg_data_IBUF[16]_inst 
       (.I(ip2cpu_jk_reg_data[16]),
        .O(ip2cpu_jk_reg_data_IBUF[16]));
  IBUF \ip2cpu_jk_reg_data_IBUF[17]_inst 
       (.I(ip2cpu_jk_reg_data[17]),
        .O(ip2cpu_jk_reg_data_IBUF[17]));
  IBUF \ip2cpu_jk_reg_data_IBUF[18]_inst 
       (.I(ip2cpu_jk_reg_data[18]),
        .O(ip2cpu_jk_reg_data_IBUF[18]));
  IBUF \ip2cpu_jk_reg_data_IBUF[19]_inst 
       (.I(ip2cpu_jk_reg_data[19]),
        .O(ip2cpu_jk_reg_data_IBUF[19]));
  IBUF \ip2cpu_jk_reg_data_IBUF[1]_inst 
       (.I(ip2cpu_jk_reg_data[1]),
        .O(ip2cpu_jk_reg_data_IBUF[1]));
  IBUF \ip2cpu_jk_reg_data_IBUF[20]_inst 
       (.I(ip2cpu_jk_reg_data[20]),
        .O(ip2cpu_jk_reg_data_IBUF[20]));
  IBUF \ip2cpu_jk_reg_data_IBUF[21]_inst 
       (.I(ip2cpu_jk_reg_data[21]),
        .O(ip2cpu_jk_reg_data_IBUF[21]));
  IBUF \ip2cpu_jk_reg_data_IBUF[22]_inst 
       (.I(ip2cpu_jk_reg_data[22]),
        .O(ip2cpu_jk_reg_data_IBUF[22]));
  IBUF \ip2cpu_jk_reg_data_IBUF[23]_inst 
       (.I(ip2cpu_jk_reg_data[23]),
        .O(ip2cpu_jk_reg_data_IBUF[23]));
  IBUF \ip2cpu_jk_reg_data_IBUF[24]_inst 
       (.I(ip2cpu_jk_reg_data[24]),
        .O(ip2cpu_jk_reg_data_IBUF[24]));
  IBUF \ip2cpu_jk_reg_data_IBUF[25]_inst 
       (.I(ip2cpu_jk_reg_data[25]),
        .O(ip2cpu_jk_reg_data_IBUF[25]));
  IBUF \ip2cpu_jk_reg_data_IBUF[26]_inst 
       (.I(ip2cpu_jk_reg_data[26]),
        .O(ip2cpu_jk_reg_data_IBUF[26]));
  IBUF \ip2cpu_jk_reg_data_IBUF[27]_inst 
       (.I(ip2cpu_jk_reg_data[27]),
        .O(ip2cpu_jk_reg_data_IBUF[27]));
  IBUF \ip2cpu_jk_reg_data_IBUF[28]_inst 
       (.I(ip2cpu_jk_reg_data[28]),
        .O(ip2cpu_jk_reg_data_IBUF[28]));
  IBUF \ip2cpu_jk_reg_data_IBUF[29]_inst 
       (.I(ip2cpu_jk_reg_data[29]),
        .O(ip2cpu_jk_reg_data_IBUF[29]));
  IBUF \ip2cpu_jk_reg_data_IBUF[2]_inst 
       (.I(ip2cpu_jk_reg_data[2]),
        .O(ip2cpu_jk_reg_data_IBUF[2]));
  IBUF \ip2cpu_jk_reg_data_IBUF[30]_inst 
       (.I(ip2cpu_jk_reg_data[30]),
        .O(ip2cpu_jk_reg_data_IBUF[30]));
  IBUF \ip2cpu_jk_reg_data_IBUF[31]_inst 
       (.I(ip2cpu_jk_reg_data[31]),
        .O(ip2cpu_jk_reg_data_IBUF[31]));
  IBUF \ip2cpu_jk_reg_data_IBUF[3]_inst 
       (.I(ip2cpu_jk_reg_data[3]),
        .O(ip2cpu_jk_reg_data_IBUF[3]));
  IBUF \ip2cpu_jk_reg_data_IBUF[4]_inst 
       (.I(ip2cpu_jk_reg_data[4]),
        .O(ip2cpu_jk_reg_data_IBUF[4]));
  IBUF \ip2cpu_jk_reg_data_IBUF[5]_inst 
       (.I(ip2cpu_jk_reg_data[5]),
        .O(ip2cpu_jk_reg_data_IBUF[5]));
  IBUF \ip2cpu_jk_reg_data_IBUF[6]_inst 
       (.I(ip2cpu_jk_reg_data[6]),
        .O(ip2cpu_jk_reg_data_IBUF[6]));
  IBUF \ip2cpu_jk_reg_data_IBUF[7]_inst 
       (.I(ip2cpu_jk_reg_data[7]),
        .O(ip2cpu_jk_reg_data_IBUF[7]));
  IBUF \ip2cpu_jk_reg_data_IBUF[8]_inst 
       (.I(ip2cpu_jk_reg_data[8]),
        .O(ip2cpu_jk_reg_data_IBUF[8]));
  IBUF \ip2cpu_jk_reg_data_IBUF[9]_inst 
       (.I(ip2cpu_jk_reg_data[9]),
        .O(ip2cpu_jk_reg_data_IBUF[9]));
  IBUF ip2cpu_jk_reg_valid_IBUF_inst
       (.I(ip2cpu_jk_reg_valid),
        .O(ip2cpu_jk_reg_valid_IBUF));
  LUT3 #(
    .INIT(8'h7F)) 
    \ipReadReq_jk_reg_index[3]_i_1 
       (.I0(S_AXI_ARREADY_OBUF),
        .I1(S_AXI_ARVALID_IBUF),
        .I2(S_AXI_ARESETN_IBUF),
        .O(\ipReadReq_jk_reg_index[3]_i_1_n_0 ));
  OBUF \ipReadReq_jk_reg_index_OBUF[0]_inst 
       (.I(ipReadReq_jk_reg_index_OBUF[0]),
        .O(ipReadReq_jk_reg_index[0]));
  OBUF \ipReadReq_jk_reg_index_OBUF[1]_inst 
       (.I(ipReadReq_jk_reg_index_OBUF[1]),
        .O(ipReadReq_jk_reg_index[1]));
  OBUF \ipReadReq_jk_reg_index_OBUF[2]_inst 
       (.I(ipReadReq_jk_reg_index_OBUF[2]),
        .O(ipReadReq_jk_reg_index[2]));
  OBUF \ipReadReq_jk_reg_index_OBUF[3]_inst 
       (.I(ipReadReq_jk_reg_index_OBUF[3]),
        .O(ipReadReq_jk_reg_index[3]));
  FDRE #(
    .INIT(1'b0)) 
    \ipReadReq_jk_reg_index_reg[0] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(\<const1> ),
        .D(axi_araddr[0]),
        .Q(ipReadReq_jk_reg_index_OBUF[0]),
        .R(\ipReadReq_jk_reg_index[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ipReadReq_jk_reg_index_reg[1] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(\<const1> ),
        .D(axi_araddr[1]),
        .Q(ipReadReq_jk_reg_index_OBUF[1]),
        .R(\ipReadReq_jk_reg_index[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ipReadReq_jk_reg_index_reg[2] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(\<const1> ),
        .D(axi_araddr[2]),
        .Q(ipReadReq_jk_reg_index_OBUF[2]),
        .R(\ipReadReq_jk_reg_index[3]_i_1_n_0 ));
  FDRE #(
    .INIT(1'b0)) 
    \ipReadReq_jk_reg_index_reg[3] 
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(\<const1> ),
        .D(axi_araddr[3]),
        .Q(ipReadReq_jk_reg_index_OBUF[3]),
        .R(\ipReadReq_jk_reg_index[3]_i_1_n_0 ));
  OBUF ipReadReq_jk_reg_valid_OBUF_inst
       (.I(ipReadReq_jk_reg_valid_OBUF),
        .O(ipReadReq_jk_reg_valid));
  LUT2 #(
    .INIT(4'h8)) 
    ipReadReq_jk_reg_valid_i_1
       (.I0(S_AXI_ARVALID_IBUF),
        .I1(S_AXI_ARREADY_OBUF),
        .O(ipReadReq_jk_reg_valid0));
  FDRE #(
    .INIT(1'b0)) 
    ipReadReq_jk_reg_valid_reg
       (.C(S_AXI_ACLK_IBUF_BUFG),
        .CE(\<const1> ),
        .D(ipReadReq_jk_reg_valid0),
        .Q(ipReadReq_jk_reg_valid_OBUF),
        .R(axi_arready_i_1_n_0));
  IBUF resetn_IBUF_inst
       (.I(resetn),
        .O(resetn_IBUF));
  OBUF resetn_soft_OBUF_inst
       (.I(resetn_soft_OBUF),
        .O(resetn_soft));
  FDRE #(
    .INIT(1'b0)) 
    resetn_soft_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(cpu_resetn_soft_IBUF),
        .Q(resetn_soft_OBUF),
        .R(\<const0> ));
  OBUF resetn_sync_OBUF_inst
       (.I(resetn_sync_reg_lopt_replica_1),
        .O(resetn_sync));
  FDRE #(
    .INIT(1'b0)) 
    resetn_sync_d_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(resetn_IBUF),
        .Q(resetn_sync_d),
        .R(\<const0> ));
  LUT2 #(
    .INIT(4'h8)) 
    resetn_sync_i_1
       (.I0(resetn_IBUF),
        .I1(resetn_sync_d),
        .O(resetn_sync_i_1_n_0));
  FDRE #(
    .INIT(1'b0)) 
    resetn_sync_reg
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(resetn_sync_i_1_n_0),
        .Q(resetn_sync_OBUF),
        .R(\<const0> ));
  (* OPT_INSERTED_REPDRIVER *) 
  FDRE #(
    .INIT(1'b0)) 
    resetn_sync_reg_lopt_replica
       (.C(clk_IBUF_BUFG),
        .CE(\<const1> ),
        .D(resetn_sync_i_1_n_0),
        .Q(resetn_sync_reg_lopt_replica_1),
        .R(\<const0> ));
endmodule
