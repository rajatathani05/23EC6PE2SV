//------------------------------------------------------------------------------
// File        : Shift Register
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-02
// Module      : siso
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : Shift Register used for basic functional coverage example.
//------------------------------------------------------------------------------

module siso(input clk, si, output so);
  logic [3:0] q;
  assign so = q[3];
  always_ff @(posedge clk) q <= {q[2:0], si};
endmodule
