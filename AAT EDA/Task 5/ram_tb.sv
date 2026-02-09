//------------------------------------------------------------------------------
// File        : Dual Port RAM 
// Author      : Rajat Athani / 1BM24EC417
// Created     : 2026-02-04
// Module      : tb
// Project     : SystemVerilog and Verification (23EC6PE2SV)
// Faculty     : Prof. Ajaykumar Devarapalli
//
// Description : Verifies read and write functionality of Dual Port RAM.
//------------------------------------------------------------------------------

`timescale 1ns\1ps

module tb;
  
  parameter DATA_WIDTH = 8;
  parameter ADDR_WIDTH = 8;

  logic                  clk = 0;
  logic                  wr_en_a;
  logic [ADDR_WIDTH-1:0] addr_a;
  logic [DATA_WIDTH-1:0] data_in_a;
  logic                  rd_en_b;
  logic [ADDR_WIDTH-1:0] addr_b;
  logic [DATA_WIDTH-1:0] data_out_b;


  bit [DATA_WIDTH-1:0] ref_model [int];


  int written_addrs[$];

  always #5 clk = ~clk;

  dual_port_ram #(DATA_WIDTH, ADDR_WIDTH) dut (
    .clk(clk),
    .wr_en_a(wr_en_a),
    .addr_a(addr_a),
    .data_in_a(data_in_a),
    .rd_en_b(rd_en_b),
    .addr_b(addr_b),
    .data_out_b(data_out_b)
  );


  covergroup cg_ram @(posedge clk);
    cp_wr_addr: coverpoint addr_a iff (wr_en_a) {
      bins low  = {[0:85]};
      bins mid  = {[86:170]};
      bins high = {[171:255]};
    }

    cp_wr_data: coverpoint data_in_a iff (wr_en_a) {
      option.auto_bin_max = 8; // Split 0-255 into 8 bins
    }
  endgroup

  cg_ram cg;


  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;

    cg = new();
    
    wr_en_a = 0; rd_en_b = 0;
    addr_a = 0; data_in_a = 0; addr_b = 0;


    $display(" Challenge: Dual Port RAM with Associative Array");

    $display("--- Step 1: Writing Random Data ---");
    
    repeat(100) begin
      @(posedge clk);
      wr_en_a = 1;
      rd_en_b = 0;
      
      addr_a = $urandom_range(0, 255);
      data_in_a = $urandom_range(0, 255);

      ref_model[addr_a] = data_in_a;
      
      written_addrs.push_back(addr_a);
    end
    

    @(posedge clk);
    wr_en_a = 0;

    $display("\n--- Step 2: Reading & Verifying ---");
    
 
    foreach (written_addrs[i]) begin
      @(posedge clk);
      rd_en_b = 1;
      addr_b = written_addrs[i]; 
     
      @(posedge clk);
      #1;
      
      if (data_out_b === ref_model[addr_b]) begin
      end else begin
        $error("Check Addr %0d: Expected %0d, Got %0d --> [FAIL]", 
                 addr_b, ref_model[addr_b], data_out_b);
      end
    end
    
    $display("All checks completed.");
    $display(" Final Coverage: %0.2f %%", cg.get_inst_coverage());
    $finish;
  end


endmodule
