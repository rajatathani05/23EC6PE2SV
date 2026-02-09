//------------------------------------------------------------------------------
// File        : FIFO with Interfaces
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-02
// Module      : tb
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : FIFO with Interfaces used for basic functional coverage example.
//------------------------------------------------------------------------------

interface fifo_if(input clk);
  logic wr, rd, full, empty; logic [7:0] din;
endinterface

module tb;
  bit clk=0; always #5 clk=~clk;
  fifo_if vif(clk);
  
  fifo dut(.clk(clk), .wr(vif.wr), .rd(vif.rd), .din(vif.din), .full(vif.full), .empty(vif.empty));
  
  covergroup cg_fifo @(posedge clk);
    cross_wr_full: cross vif.wr, vif.full;
  endgroup
  cg_fifo cg = new();
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    vif.wr=1; repeat(18) @(posedge clk);
    vif.wr=0;
    $display("Coverage: %0.2f %%", cg.get_inst_coverage());
    $finish;
  end
endmodule
