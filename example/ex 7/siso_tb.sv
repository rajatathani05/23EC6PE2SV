//------------------------------------------------------------------------------
// File        : Shift Register
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-02
// Module      : tb
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : Shift Register used for basic functional coverage example.
//------------------------------------------------------------------------------

module tb;
  logic clk=0, si, so;
  siso dut(.*);
  always #5 clk = ~clk;
  logic [3:0] q_ref;
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    repeat(20) begin
      si = $urandom();
      q_ref = {q_ref[2:0], si};
      @(posedge clk);
      #1;
    end
    $finish;
  end
endmodule
