`timescale 1ps/1ps

module evaluate_tb;

logic clk, reset;
logic stop_nn;
//logic [9:0] addr_counter;
logic [15:0] error_counter;

evaluate uut(clk, reset, stop_nn, error_counter);

initial begin // clock cycle of 2ps
    clk = 0;
    forever #1 clk = ~clk;
end

initial begin // stimulus is applied here

// Initailse Value
	 reset = 1; #5
	 reset = 0; #50000;
    $stop;
end

initial begin // response monitor
    $monitor ("t = %d clk = %d, reset = %d, stop_nn = %b, error_counter = %d", $time, clk, reset, stop_nn, error_counter);
end

endmodule 