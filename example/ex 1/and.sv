//------------------------------------------------------------------------------
// File        : and_gate
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-02
// Module      : and gate
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : 2-input AND gate used for basic functional coverage example.
//------------------------------------------------------------------------------
module and_gate(input logic a, b, output logic y);
  assign y = a & b;
endmodule
