//------------------------------------------------------------------------------
// File        : ALU
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-02
// Module      : ALU
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : ALU used for basic functional coverage example.
//------------------------------------------------------------------------------

typedef enum bit [1:0] {ADD, SUB, AND, OR} opcode_e;

module alu(input logic [7:0] a, b, input opcode_e op, output logic [7:0] y);
  always_comb begin
    case(op)
    ADD: y = a + b;
    SUB: y = a - b;
    AND: y = a & b;
    OR:  y = a | b;
  endcase
  end
endmodule

