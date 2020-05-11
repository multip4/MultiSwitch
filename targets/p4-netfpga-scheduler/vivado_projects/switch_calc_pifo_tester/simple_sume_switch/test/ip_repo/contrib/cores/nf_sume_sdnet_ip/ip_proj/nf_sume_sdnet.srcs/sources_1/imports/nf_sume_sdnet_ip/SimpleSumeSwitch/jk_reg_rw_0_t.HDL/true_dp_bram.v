//  Xilinx True Dual Port RAM Write First Dual Clock
//  This code implements a parameterizable true dual port memory (both ports can read and write).
//  This implements write-first mode where the data being written to the RAM also resides on
//  the output port.  If the output data is not needed during writes or the last read value is
//  desired to be retained, it is suggested to use no change as it is more power efficient.
//  If a reset or enable is not necessary, it may be tied off or removed from the code.

`timescale 1 ps / 1 ps

module true_dp_bram
#(
    parameter L2_DEPTH = 8,
    parameter WIDTH = 32
)
(
    input                              clk,

    input                              we1,
    input                              en1,
    input       [L2_DEPTH-1:0]         addr1,
    input       [WIDTH-1:0]            din1,
    input                              rst1,
    input                              regce1,
    output      [WIDTH-1:0]            dout1,

    input                              we2,
    input                              en2,
    input       [L2_DEPTH-1:0]         addr2,
    input       [WIDTH-1:0]            din2,
    input                              rst2,
    input                              regce2,
    output      [WIDTH-1:0]            dout2
);

  parameter INIT_FILE = "";                       // Specify name/location of RAM initialization file if using one (leave blank if not)

//  <wire_or_reg> [clogb2(RAM_DEPTH-1)-1:0] addra;  // Port A address bus, width determined from RAM_DEPTH
//  <wire_or_reg> [clogb2(RAM_DEPTH-1)-1:0] addrb;  // Port B address bus, width determined from RAM_DEPTH
//  <wire_or_reg> [RAM_WIDTH-1:0] dina;           // Port A RAM input data
//  <wire_or_reg> [RAM_WIDTH-1:0] dinb;           // Port B RAM input data
//  <wire_or_reg> clka;                           // Port A clock
//  <wire_or_reg> clkb;                           // Port B clock
//  <wire_or_reg> wea;                            // Port A write enable
//  <wire_or_reg> web;                            // Port B write enable
//  <wire_or_reg> ena;                            // Port A RAM Enable, for additional power savings, disable port when not in use
//  <wire_or_reg> enb;                            // Port B RAM Enable, for additional power savings, disable port when not in use
//  <wire_or_reg> rsta;                           // Port A output reset (does not affect memory contents)
//  <wire_or_reg> rstb;                           // Port B output reset (does not affect memory contents)
//  <wire_or_reg> regcea;                         // Port A output register enable
//  <wire_or_reg> regceb;                         // Port B output register enable
//  wire [RAM_WIDTH-1:0] douta;                   // Port A RAM output data
//  wire [RAM_WIDTH-1:0] doutb;                   // Port B RAM output data

  localparam DEPTH = 2**L2_DEPTH;

  reg [WIDTH-1:0] RAM [DEPTH-1:0];
  reg [WIDTH-1:0] RAM_data_1 = {WIDTH{1'b0}};
  reg [WIDTH-1:0] RAM_data_2 = {WIDTH{1'b0}};

  // The following code either initializes the memory values to a specified file or to all zeros to match hardware
  generate
    if (INIT_FILE != "") begin: use_init_file
      initial
        $readmemh(INIT_FILE, RAM, 0, DEPTH-1);
    end else begin: init_bram_to_zero
      integer ram_index;
      initial
        for (ram_index = 0; ram_index < DEPTH; ram_index = ram_index + 1)
          RAM[ram_index] = {WIDTH{1'b0}};
    end
  endgenerate

  always @(posedge clk)
    if (en1)
      if (we1) begin
        RAM[addr1] <= din1;
        RAM_data_1 <= din1;
      end else
        RAM_data_1 <= RAM[addr1];

  always @(posedge clk)
    if (en2)
      if (we2) begin
        RAM[addr2] <= din2;
        RAM_data_2 <= din2;
      end else
        RAM_data_2 <= RAM[addr2];

  // The following is a 2 clock cycle read latency with improve clock-to-out timing

  reg [WIDTH-1:0] dout1_reg = {WIDTH{1'b0}};
  reg [WIDTH-1:0] dout2_reg = {WIDTH{1'b0}};

  always @(posedge clk)
    if (rst1)
      dout1_reg <= {WIDTH{1'b0}};
    else if (regce1)
      dout1_reg <= RAM_data_1;

  always @(posedge clk)
    if (rst2)
      dout2_reg <= {WIDTH{1'b0}};
    else if (regce2)
      dout2_reg <= RAM_data_2;

  assign dout1 = dout1_reg;
  assign dout2 = dout2_reg;

endmodule


