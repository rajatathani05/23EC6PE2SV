//------------------------------------------------------------------------------
// File        : Arbiter (Assertions)
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-02
// Module      : arbiter
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : Arbiter (Assertions) used for basic functional coverage example.
//------------------------------------------------------------------------------

module arbiter(input clk, rst, input [3:0] req, output reg [3:0] gnt);
  always_ff @(posedge clk) begin
    if(rst) gnt <= 0;
    else if(req[0]) gnt <= 4'b0001;
    else if(req[1]) gnt <= 4'b0010;
    else if(req[2]) gnt <= 4'b0100;
    else if(req[3]) gnt <= 4'b1000;
  end 
endmodule
