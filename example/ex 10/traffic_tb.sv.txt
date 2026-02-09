//------------------------------------------------------------------------------
// File        : Traffic Light Controller
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-02
// Module      : tb
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : Traffic Light Controller used for basic functional coverage example.
//------------------------------------------------------------------------------

module tb;

  logic clk = 0;
  logic rst;
  light_t color;

  always #5 clk = ~clk;

  traffic dut (.clk(clk), .rst(rst), .color(color));

  covergroup cg_light @(posedge clk);
    cp_c: coverpoint color {
      bins cycle = (RED => GREEN => YELLOW => RED);
    }
  endgroup
  cg_light cg = new();

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    rst = 1;
    #10 rst = 0;

    repeat (10) @(posedge clk);

    $display("Coverage = %0.2f %%", cg.get_inst_coverage());
    $finish;
  end

endmodule
