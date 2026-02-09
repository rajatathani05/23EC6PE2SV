//------------------------------------------------------------------------------
// File        : alu.sv
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-04
// Module      : Exercise 1: The Calculator Design:
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : A basic calculator implemented in SystemVerilog to demonstrate 
//                 combinational logic and functional verification.
//------------------------------------------------------------------------------

typedef enum logic [1:0] {ADD, SUB, MUL, XOR} opcode_t;

module alu (
  input  logic [7:0] a,
  input  logic [7:0] b,
  input  opcode_t    op,
  output logic [15:0] y
);

  always_comb begin
    case (op)
      ADD: y = a + b;
      SUB: y = a - b;
      MUL: y = a * b;
      XOR: y = a ^ b;
      default: y = 0;
    endcase
  end

endmodule
