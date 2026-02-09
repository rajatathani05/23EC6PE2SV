//------------------------------------------------------------------------------
// File        : Traffic Light Controller
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-02
// Module      : traffic
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : Traffic Light Controller used for basic functional coverage example.
//------------------------------------------------------------------------------

typedef enum {RED, GREEN, YELLOW} light_t;
module traffic(input clk, rst, output light_t color);
  always_ff @(posedge clk) begin
    if (rst) color <= RED;
    else case(color)
      RED:    color <= GREEN;
      GREEN:  color <= YELLOW;
      YELLOW: color <= RED;
    endcase
  end 
endmodule
