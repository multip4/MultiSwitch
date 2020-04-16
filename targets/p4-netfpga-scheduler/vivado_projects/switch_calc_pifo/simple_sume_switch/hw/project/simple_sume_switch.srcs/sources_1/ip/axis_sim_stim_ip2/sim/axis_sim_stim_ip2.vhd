-- (c) Copyright 1995-2020 Xilinx, Inc. All rights reserved.
-- 
-- This file contains confidential and proprietary information
-- of Xilinx, Inc. and is protected under U.S. and
-- international copyright and other intellectual property
-- laws.
-- 
-- DISCLAIMER
-- This disclaimer is not a license and does not grant any
-- rights to the materials distributed herewith. Except as
-- otherwise provided in a valid license issued to you by
-- Xilinx, and to the maximum extent permitted by applicable
-- law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
-- WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
-- AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
-- BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
-- INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
-- (2) Xilinx shall not be liable (whether in contract or tort,
-- including negligence, or under any other theory of
-- liability) for any loss or damage of any kind or nature
-- related to, arising under or in connection with these
-- materials, including for any direct, or any indirect,
-- special, incidental, or consequential loss or damage
-- (including loss of data, profits, goodwill, or any type of
-- loss or damage suffered as a result of any action brought
-- by a third party) even if such damage or loss was
-- reasonably foreseeable or Xilinx had been advised of the
-- possibility of the same.
-- 
-- CRITICAL APPLICATIONS
-- Xilinx products are not designed or intended to be fail-
-- safe, or for use in any application requiring fail-safe
-- performance, such as life-support or safety devices or
-- systems, Class III medical devices, nuclear facilities,
-- applications related to the deployment of airbags, or any
-- other applications that could lead to death, personal
-- injury, or severe property or environmental damage
-- (individually and collectively, "Critical
-- Applications"). Customer assumes the sole risk and
-- liability of any use of Xilinx products in Critical
-- Applications, subject only to applicable laws and
-- regulations governing limitations on product liability.
-- 
-- THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
-- PART OF THIS FILE AT ALL TIMES.
-- 
-- DO NOT MODIFY THIS FILE.

-- IP VLNV: NetFPGA:NetFPGA:axis_sim_stim:1.00
-- IP Revision: 1

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY axis_sim_stim_ip2 IS
  PORT (
    ACLK : IN STD_LOGIC;
    ARESETN : IN STD_LOGIC;
    M_AXIS_TDATA : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
    M_AXIS_TKEEP : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
    M_AXIS_TUSER : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
    M_AXIS_TVALID : OUT STD_LOGIC;
    M_AXIS_TREADY : IN STD_LOGIC;
    M_AXIS_TLAST : OUT STD_LOGIC;
    counter : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
    activity_stim : OUT STD_LOGIC;
    barrier_req : OUT STD_LOGIC;
    barrier_proceed : IN STD_LOGIC
  );
END axis_sim_stim_ip2;

ARCHITECTURE axis_sim_stim_ip2_arch OF axis_sim_stim_ip2 IS
  ATTRIBUTE DowngradeIPIdentifiedWarnings : STRING;
  ATTRIBUTE DowngradeIPIdentifiedWarnings OF axis_sim_stim_ip2_arch: ARCHITECTURE IS "yes";
  COMPONENT axis_sim_stim IS
    GENERIC (
      C_M_AXIS_DATA_WIDTH : INTEGER;
      C_M_AXIS_TUSER_WIDTH : INTEGER;
      input_file : STRING
    );
    PORT (
      ACLK : IN STD_LOGIC;
      ARESETN : IN STD_LOGIC;
      M_AXIS_TDATA : OUT STD_LOGIC_VECTOR(255 DOWNTO 0);
      M_AXIS_TKEEP : OUT STD_LOGIC_VECTOR(31 DOWNTO 0);
      M_AXIS_TUSER : OUT STD_LOGIC_VECTOR(127 DOWNTO 0);
      M_AXIS_TVALID : OUT STD_LOGIC;
      M_AXIS_TREADY : IN STD_LOGIC;
      M_AXIS_TLAST : OUT STD_LOGIC;
      counter : IN STD_LOGIC_VECTOR(10 DOWNTO 0);
      activity_stim : OUT STD_LOGIC;
      barrier_req : OUT STD_LOGIC;
      barrier_proceed : IN STD_LOGIC
    );
  END COMPONENT axis_sim_stim;
  ATTRIBUTE IP_DEFINITION_SOURCE : STRING;
  ATTRIBUTE IP_DEFINITION_SOURCE OF axis_sim_stim_ip2_arch: ARCHITECTURE IS "package_project";
  ATTRIBUTE X_INTERFACE_INFO : STRING;
  ATTRIBUTE X_INTERFACE_PARAMETER : STRING;
  ATTRIBUTE X_INTERFACE_INFO OF M_AXIS_TLAST: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS TLAST";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXIS_TREADY: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS TREADY";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXIS_TVALID: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS TVALID";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXIS_TUSER: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS TUSER";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXIS_TKEEP: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS TKEEP";
  ATTRIBUTE X_INTERFACE_PARAMETER OF M_AXIS_TDATA: SIGNAL IS "XIL_INTERFACENAME M_AXIS, TDATA_NUM_BYTES 32, TDEST_WIDTH 0, TID_WIDTH 0, TUSER_WIDTH 128, HAS_TREADY 1, HAS_TSTRB 0, HAS_TKEEP 1, HAS_TLAST 1, FREQ_HZ 100000000, PHASE 0.000, LAYERED_METADATA undef";
  ATTRIBUTE X_INTERFACE_INFO OF M_AXIS_TDATA: SIGNAL IS "xilinx.com:interface:axis:1.0 M_AXIS TDATA";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ARESETN: SIGNAL IS "XIL_INTERFACENAME ARESETN, POLARITY ACTIVE_LOW";
  ATTRIBUTE X_INTERFACE_INFO OF ARESETN: SIGNAL IS "xilinx.com:signal:reset:1.0 ARESETN RST";
  ATTRIBUTE X_INTERFACE_PARAMETER OF ACLK: SIGNAL IS "XIL_INTERFACENAME ACLK, ASSOCIATED_BUSIF M_AXIS, ASSOCIATED_RESET ARESETN, FREQ_HZ 100000000, PHASE 0.000";
  ATTRIBUTE X_INTERFACE_INFO OF ACLK: SIGNAL IS "xilinx.com:signal:clock:1.0 ACLK CLK";
BEGIN
  U0 : axis_sim_stim
    GENERIC MAP (
      C_M_AXIS_DATA_WIDTH => 256,
      C_M_AXIS_TUSER_WIDTH => 128,
      input_file => "/home/rym/Documents/P4-NetFPGA-live/contrib-projects/sume-sdnet-switch/projects/switch_calc_pifo/simple_sume_switch/test/nf_interface_2_stim.axi"
    )
    PORT MAP (
      ACLK => ACLK,
      ARESETN => ARESETN,
      M_AXIS_TDATA => M_AXIS_TDATA,
      M_AXIS_TKEEP => M_AXIS_TKEEP,
      M_AXIS_TUSER => M_AXIS_TUSER,
      M_AXIS_TVALID => M_AXIS_TVALID,
      M_AXIS_TREADY => M_AXIS_TREADY,
      M_AXIS_TLAST => M_AXIS_TLAST,
      counter => counter,
      activity_stim => activity_stim,
      barrier_req => barrier_req,
      barrier_proceed => barrier_proceed
    );
END axis_sim_stim_ip2_arch;
