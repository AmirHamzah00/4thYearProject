// ReLU Neuron Testbench

`timescale 1ps/1ps

module ReLUNeuron_tb;

logic clk, reset;
logic [31:0] neuron_input [2:0];
logic [31:0] weights [2:0];
logic [31:0] bias;
logic [31:0] neuron_output;

ReLUNeuron uut(clk, reset, neuron_input, weights, bias, neuron_output);

initial begin // clock cycle of 2ps
    clk = 0;
    forever #1 clk = ~clk;
end

initial begin // stimulus is applied here
    reset = 1; #2;
    reset = 0; #2; 
    neuron_input[0] = 32'h40066666;
	 neuron_input[1] = 32'h40066666;
	 neuron_input[2] = 32'h40066666;
	 weights[0] = 32'h40066666;
	 weights[1] = 32'h40066666;
	 weights[2] = 32'h40066666;
	 bias = 32'b0;
	 #100;
    $stop;
end

initial begin // response monitor
    $monitor ("t = %d clk = %b, reset = %b, neuron output = %b", $time, clk, reset, neuron_output);
end

endmodule

// SigmoidLUTs Testbench

`timescale 1ps/1ps

module SigmoidLUTs_tb;

logic clk, reset;
logic [31:0] activation_input, activation_output;

SigmoidLUTs uut(clk, reset, activation_input, activation_output);

initial begin // clock cycle of 2ps
    clk = 0;
    forever #1 clk = ~clk;
end

initial begin // stimulus is applied here
    reset = 1; #2; 
    reset = 0; #2; 
    activation_input = 32'h3e800000;
	 #200; 
    $stop;
end

initial begin // response monitor
    $monitor ("t = %d clk = %b, reset = %b, activation_output = %b", $time, clk, reset, activation_output);
end

endmodule