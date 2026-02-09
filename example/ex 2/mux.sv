//------------------------------------------------------------------------------
// File        : 2 to 1 mux
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-02
// Module      : mux
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : 2-input Multipexer used for basic functional coverage example.
//------------------------------------------------------------------------------

module mux2to1(input logic [7:0] a, b, input logic sel, output logic [7:0] y);
  assign y = sel ? b : a;
endmodule
