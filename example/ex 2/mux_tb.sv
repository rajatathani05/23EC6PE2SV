//------------------------------------------------------------------------------
// File        : 2 to 1 mux
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-02
// Module      : tb
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : 2-input Multipexer used for basic functional coverage example.
//------------------------------------------------------------------------------

class Transaction;
  rand bit [7:0] a, b;
  rand bit sel;
endclass

module tb;
  logic [7:0] a, b, y;
  logic sel;
  mux2to1 dut(.*);
  
  covergroup cg_mux;
    cp_sel : coverpoint sel;
  endgroup
  cg_mux cg = new();
  Transaction tr = new();
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);
    
    repeat(20) begin
      tr.randomize();
      a = tr.a; b = tr.b; sel = tr.sel;
      #5;
      cg.sample();
      
      if(y !== (sel ? b : a)) $error(" Mismatch! ");
    end
    $display("Coverage = %0.2f %%", cg.get_inst_coverage());
  end
endmodule
