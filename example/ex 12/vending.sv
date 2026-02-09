//------------------------------------------------------------------------------
// File        : Vending Machine
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-02
// Module      : vending
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : Vending Machine used for basic functional coverage example.
//------------------------------------------------------------------------------

module vending (input  logic clk, input logic rst, input logic [4:0]  coin, output logic dispense);
  typedef enum logic [1:0] {IDLE, HAS5, HAS10} state_t;
  state_t state, next;

  always_ff @(posedge clk or posedge rst) begin
    if (rst)
      state <= IDLE;
    else
      state <= next;
  end

  always_comb begin
    next = state;
    dispense = 0;

    case (state)
      IDLE: begin
        if (coin == 5)       next = HAS5;
        else if (coin == 10) next = HAS10;
      end

      HAS5: begin
        if (coin == 10) begin
          dispense = 1;
          next = IDLE;
        end
        else if (coin == 5)
          next = HAS10;
      end

      HAS10: begin
        if (coin == 5 || coin == 10) begin
          dispense = 1;
          next = IDLE;
        end
      end
    endcase
  end

endmodule
