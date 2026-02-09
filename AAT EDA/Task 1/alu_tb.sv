//------------------------------------------------------------------------------
// File        : expt1_tb
// Author      : Rajat Athani / <USN>
// Created     : 2026-02-04
// Module      : The Calculator Design:
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : This testbench is used to verify the functional correctness of the
//               calculator design by applying various arithmetic operations and
//               validating the corresponding outputs through simulation.
//------------------------------------------------------------------------------
class alu_txn;
  rand bit [7:0] a, b;
  rand opcode_t  op;

  constraint op_dist {
    op dist {
      ADD := 20,
      SUB := 20,
      MUL := 40,
      XOR := 20
    };
  }
endclass


module tb;

  logic [7:0]  a, b;
  logic [15:0] y;
  opcode_t     op;

  alu dut (.a(a), .b(b), .op(op), .y(y));

  alu_txn tr = new();

  covergroup cg_alu;
    cp_op : coverpoint op {
      bins add = {ADD};
      bins sub = {SUB};
      bins mul = {MUL};
      bins bxor = {XOR};
    }
  endgroup

  cg_alu cg = new();

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    repeat (50) begin
      tr.randomize();
      a  = tr.a;
      b  = tr.b;
      op = tr.op;
      #1;
      cg.sample();
    end

    $display("ALU Coverage = %0.2f %%", cg.get_inst_coverage());
    $finish;
  end

endmodule
