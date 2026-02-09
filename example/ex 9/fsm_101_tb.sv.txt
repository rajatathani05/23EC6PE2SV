//------------------------------------------------------------------------------
// File        : Sequence Detector (101)
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-02
// Module      : tb
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : Sequence Detector (101) used for basic functional coverage example.
//------------------------------------------------------------------------------

module tb;
  logic clk = 0;
  logic rst;
  logic in;
  logic out;
  always #5 clk=~clk;
  fsm_101 dut(.*);
  
  covergroup cg_fsm @(posedge clk);
    cp_state: coverpoint dut.state;
  endgroup
  cg_fsm cg = new();
  
   initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    rst = 1; in = 0;
    #10 rst = 0;

    repeat (20) begin
      in = $urandom_range(0,1);
      @(posedge clk);
    end

    $display("FSM coverage = %0.2f %%", cg.get_inst_coverage());
    $finish;
  end
  
endmodule
