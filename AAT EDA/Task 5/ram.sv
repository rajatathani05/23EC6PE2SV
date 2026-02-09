//------------------------------------------------------------------------------
// File        : Dual Port RAM 
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-04
// Module      : Dual Port RAM 
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : Dual Port RAM supporting simultaneous read and write operations.
//------------------------------------------------------------------------------

module dual_port_ram #(
  parameter DATA_WIDTH = 8,
  parameter ADDR_WIDTH = 8
)(
  input  logic                  clk,
  
  // Port A (Write)
  input  logic                  wr_en_a,
  input  logic [ADDR_WIDTH-1:0] addr_a,
  input  logic [DATA_WIDTH-1:0] data_in_a,
  
  // Port B (Read)
  input  logic                  rd_en_b,
  input  logic [ADDR_WIDTH-1:0] addr_b,
  output logic [DATA_WIDTH-1:0] data_out_b
);

  
  logic [DATA_WIDTH-1:0] mem [2**ADDR_WIDTH];

 
  always_ff @(posedge clk) begin
    if (wr_en_a) begin
      mem[addr_a] <= data_in_a;
    end
  end

 
  always_ff @(posedge clk) begin
    if (rd_en_b) begin
      data_out_b <= mem[addr_b];
    end
  end

endmodule
