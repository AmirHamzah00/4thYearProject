`timescale 1ps/1ps

module evaluate_tb;

logic clk, reset;
logic [3:0] addr_counter;
logic [3:0] test_data;
logic [31:0] weights_0, weights_1, weights_2, weights_3, data, error_counter;
logic [31:0] activate_n0, activate_n1, activate_n2, activate_n3;

evaluate uut(clk, reset,  addr_counter, test_data, weights_0, weights_1, weights_2, weights_3, data, error_counter, activate_n0, activate_n1, activate_n2, activate_n3);

initial begin // clock cycle of 2ps
    clk = 0;
    forever #1 clk = ~clk;
end

initial begin // stimulus is applied here

// Initailse Value
	 reset = 1; #5
	 reset = 0; #500;
    $stop;
end

initial begin // response monitor
    $monitor ("t = %d clk = %d, reset = %d,  addr_counter = %d, test_data = %d, weights_0 = %d, weights_1 = %d, weights_2 = %d, weights_3 = %d, data = %d,  error_counter = %d, act_n0 = %d, act_n1 = %d, act_n2 = %d, act_n3 = %d",
					$time, clk, reset,  addr_counter, test_data, weights_0, weights_1, weights_2, weights_3, data,  error_counter, activate_n0, activate_n1, activate_n2, activate_n3);
end

endmodule 