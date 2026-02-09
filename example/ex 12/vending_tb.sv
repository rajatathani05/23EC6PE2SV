//------------------------------------------------------------------------------
// File        : Vending Machine
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-02
// Module      : tb
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : Vending Machine used for basic functional coverage example.
//------------------------------------------------------------------------------

module tb;

  logic clk = 0;
  logic rst;
  logic [4:0] coin;
  logic dispense;

  always #5 clk = ~clk;

  vending dut (
    .clk(clk),
    .rst(rst),
    .coin(coin),
    .dispense(dispense)
  );

  covergroup cg_vend @(posedge clk);
    cp_state : coverpoint dut.state;
  endgroup
  cg_vend cg = new();

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    rst = 1; coin = 0;
    #10 rst = 0;

    repeat (20) begin
      coin = ( $urandom_range(0,1) ) ? 5 : 10;
      @(posedge clk);
    end

    $display("Vending FSM Coverage = %0.2f %%", cg.get_inst_coverage());
    $finish;
  end
endmodule
