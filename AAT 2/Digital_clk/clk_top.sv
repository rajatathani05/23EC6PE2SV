`timescale 1s/1ms

module clock_tb;

    logic clk;

    initial clk = 0;
    always #0.5 clk = ~clk;

    clock_if cif (clk);

    digital_clock dut (
        .clk     (clk),
        .reset   (cif.reset),
        .seconds (cif.seconds),
        .minutes (cif.minutes)
    );

    clock_test test (cif);
    initial begin
        $dumpfile("digi_clk_vcd.vcd");
        $dumpvars(0, clock_tb);
    end

endmodule

