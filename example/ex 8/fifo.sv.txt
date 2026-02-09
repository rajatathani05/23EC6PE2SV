//------------------------------------------------------------------------------
// File        : FIFO with Interfaces
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-02
// Module      : fifo
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : FIFO with Interfaces used for basic functional coverage example.
//------------------------------------------------------------------------------

module fifo(input clk, wr, rd, input [7:0] din, output logic full, empty);
  logic [7:0] mem [15:0];
  logic [4:0] cnt = 0;
  assign full = (cnt==16); assign empty = (cnt==0);
  always_ff @(posedge clk) begin
    if(wr && !full) cnt++;
    if(rd && !empty) cnt--;
  end
endmodule
