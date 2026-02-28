`timescale 1s/1ms 
program clock_test (clock_if.TB cif);

    initial begin
     
        cif.reset = 1'b1;
        repeat (3) @(posedge cif.clk);

        cif.reset = 1'b0;

        repeat (2000) @(posedge cif.clk);

        $display("Simulation completed successfully");
        $finish;
    end

    always @(posedge cif.clk) begin
        assert (cif.seconds <= 59);
        assert (cif.minutes <= 59);
    end

endprogram

