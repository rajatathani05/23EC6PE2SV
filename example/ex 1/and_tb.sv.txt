//------------------------------------------------------------------------------
// File        : and_gate.tb
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-02
// Module      : tb
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : 2-input AND gate used for basic functional coverage example.
//------------------------------------------------------------------------------

module tb;
  logic a, b, y;
  and_gate dut(.*);
  
  covergroup cg_and;
    cp_a: coverpoint a;
    cp_b: coverpoint b;
    cross_ab: cross cp_a, cp_b;
  endgroup
  
  cg_and cg = new();
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
    
    repeat(20) begin
      a=$urandom();
      b=$urandom();
      #5;
      cg.sample();
    end
    $display ("Final Coverage = %0.2f %%", cg.get_inst_coverage());
  end 
endmodule
