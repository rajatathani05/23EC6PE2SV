//------------------------------------------------------------------------------
// File        : D flip flop
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-02
// Module      : tb
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : D flip flop used for basic functional coverage example.
//------------------------------------------------------------------------------

class packet;
  rand bit d, rst;
  constraint cl { rst dist {0:=90, 1:=10};}
endclass

module tb;
  logic clk=0, rst, d, q;
  dff dut(.*);
  always #5 clk = ~clk;
  
  covergroup cg @(posedge clk);
    cross_rst_d : cross rst, d;
  endgroup
  cg c_inst = new();
  packet pkt = new();
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    repeat(100) begin
      pkt.randomize();
      rst <= pkt.rst; d<= pkt.d;
      @(posedge clk);
    end
    $display("Coverage: %0.2f %%", c_inst.get_inst_coverage());
    $finish;
  end
endmodule

