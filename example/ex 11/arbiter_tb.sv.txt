//------------------------------------------------------------------------------
// File        : Arbiter (Assertions)
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-02
// Module      : tb
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : Arbiter (Assertions) used for basic functional coverage example.
//------------------------------------------------------------------------------

module tb;

  logic clk = 0;
  logic rst;
  logic [3:0] req;
  logic [3:0] gnt;

  always #5 clk = ~clk;

  arbiter dut (.*);

  property onehot_grant;
    @(posedge clk) $onehot0(gnt);
  endproperty

  assert property (onehot_grant)
    else $error("Protocol Violation: Multiple Grants!");

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    rst = 1; req = 0;
    #10 rst = 0;

    repeat (10) begin
      req = $urandom_range(0,15);
      @(posedge clk);
    end

    $finish;
  end
endmodule

