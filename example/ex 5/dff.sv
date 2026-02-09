//------------------------------------------------------------------------------
// File        : D flip flop
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-02
// Module      : dff
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : D flip flop used for basic functional coverage example.
//------------------------------------------------------------------------------

module dff(input clk, rst, d, output reg q);
  always_ff @(posedge clk or posedge rst)
    if(rst) q <= 0; else q <= d;
endmodule

