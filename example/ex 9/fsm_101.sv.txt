//------------------------------------------------------------------------------
// File        : Sequence Detector (101)
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-02
// Module      : fsm_101
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : Sequence Detector (101) used for basic functional coverage example.
//------------------------------------------------------------------------------

module fsm_101(input clk, rst, in, output logic out);

  typedef enum logic [1:0] {S0, S1, S2} state_t;
  state_t state, next;

  logic out_r;
  assign out = out_r;

  always_ff @(posedge clk or posedge rst) begin
    if (rst)
      state <= S0;
    else
      state <= next;
  end

  always_comb begin
    next = state;
    case (state)
      S0: if (in)       next = S1;
      S1: if (!in)      next = S2;
          else          next = S1;
      S2: if (in)       next = S1;
          else          next = S0;
    endcase
  end

  always_ff @(posedge clk or posedge rst) begin
    if (rst)
      out_r <= 0;
    else if (state == S2 && in)
      out_r <= 1;
    else
      out_r <= 0;
  end

endmodule
