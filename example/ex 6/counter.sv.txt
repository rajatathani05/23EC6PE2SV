//------------------------------------------------------------------------------
// File        : 4-bitCounter
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-02
// Module      : 4-bitCounter
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : 4-bitCounter used for basic functional coverage example.
//------------------------------------------------------------------------------

module counter(input clk, rst, output logic [3:0] count);
  always_ff @(posedge clk)
    if(rst) 
      count <= 0;
  else 
    count <= count + 1;
endmodule
