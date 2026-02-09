//------------------------------------------------------------------------------
// File        : Associative Arrays
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-02
// Module      : tb
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : Associative Arrays used for basic functional coverage example.
//------------------------------------------------------------------------------

module tb;
  int mem [int];
  int addr;
  
  initial begin
    repeat(10) begin
      addr = $urandom_range(0, 100000);
      mem[addr] = $urandom();
    end
    foreach(mem[idx]) 
      $display("Addr:%0d Data:%0h", idx, mem[idx]);
  end 
endmodule
