//------------------------------------------------------------------------------
// File        : SVA Temporal Sequences
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-02
// Module      : tb
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : SVA Temporal Sequences used for basic functional coverage example.
//------------------------------------------------------------------------------

module tb;

  bit clk, req, gnt;

  always #5 clk = ~clk;

  property p_handshake;
    @(posedge clk) req |=> ##2 gnt;
  endproperty

  assert property (p_handshake)
    else $error("Protocol Fail!");

  initial begin
    clk = 0;
    req = 0;
    gnt = 0;

    @(posedge clk) req <= 1;
    @(posedge clk) req <= 0;
    @(posedge clk) gnt <= 1;

    #50 $finish;
  end

endmodule
