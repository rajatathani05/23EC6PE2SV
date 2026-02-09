//------------------------------------------------------------------------------
// File        : atm controller
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-04
// Module      : tb
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : This testbench validates the ATM controller by simulating different user
//               interactions and verifying correct state transitions and outputs.
//------------------------------------------------------------------------------

module tb;

  logic clk = 0;
  logic rst;
  logic card, pin_ok, bal_ok;
  logic dispense;

  always #5 clk = ~clk;

  atm_fsm dut (
    .clk(clk),
    .rst(rst),
    .card(card),
    .pin_ok(pin_ok),
    .bal_ok(bal_ok),
    .dispense(dispense)
  );

  // Assertion 1:
  // Cash is dispensed ONLY if pin_ok AND bal_ok
  property dispense_only_if_valid;
    @(posedge clk)
      dispense |-> (pin_ok && bal_ok);
  endproperty

  assert property (dispense_only_if_valid)
    else $error("ERROR: Dispense without valid PIN and balance");

  // Assertion 2:
  // Machine returns to IDLE after dispensing
  property return_to_idle;
    @(posedge clk)
    dispense |=> (dut.state == dut.IDLE);
  endproperty

  assert property (return_to_idle)
    else $error("ERROR: FSM did not return to IDLE after dispense");

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, tb);

    rst = 1;
    card = 0; pin_ok = 0; bal_ok = 0;
    #10 rst = 0;

    // Valid transaction
    @(posedge clk) card   = 1;
    @(posedge clk) card   = 0;
    @(posedge clk) pin_ok = 1;
    @(posedge clk) bal_ok = 1;

    // Invalid PIN
    @(posedge clk) card   = 1;
    @(posedge clk) card   = 0;
    @(posedge clk) pin_ok = 0;

    #50 $finish;
  end


endmodule
