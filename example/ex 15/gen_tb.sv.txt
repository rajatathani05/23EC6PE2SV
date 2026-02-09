//------------------------------------------------------------------------------
// File        : Generator-Driver(Mailbox)
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-02
// Module      : tb
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : Generator-Driver(Mailbox) used for basic functional coverage example.
//------------------------------------------------------------------------------



class Packet;
  rand bit [7:0] val;
endclass

module tb;

  mailbox #(Packet) mbx = new();

  task automatic generator();
    Packet p;
    repeat (5) begin
      p = new();
      p.randomize();
      mbx.put(p);
    end
  endtask

  task automatic driver();
    Packet p;
    repeat (5) begin
      mbx.get(p);
      $display("Driver got: %0d", p.val);
    end
  endtask

  initial begin
    fork
      generator();
      driver();
    join
  end
endmodule
