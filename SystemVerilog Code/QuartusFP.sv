// MAIN

module ForwardPropagate (input logic clk, reset,
						       input logic x_input, y_input,
								output logic [1:0] predicted,
					         output logic [1:0] expected);
/*
Structure of the neuron will take in two input and give out two binary outputs 1/0

The structure [2, 3, 2]:
  
	 	   .-[]-.
	  []-. .  . .-[]
 		   .-[]-.
 	  []-. .  . .-[]
		   .-[]-.


 {In}-{Hidden Layer}-{Out}

Note that this is a fully connnected NN.

*/	

// VARIABLE DECLARATION
logic flag1, flag2;
logic [31:0] xn_input, yn_input;
					  
logic [31:0] weights_r0_1, weights_r0_2;
logic [31:0] weights_r1_1, weights_r1_2;
logic [31:0] weights_r2_1, weights_r2_2;

logic [31:0] weights_s0_1, weights_s0_2, weights_s0_3;
logic [31:0] weights_s1_1, weights_s1_2, weights_s1_3;

logic [31:0] bias_r0, bias_r1, bias_r2, bias_s0, bias_s1;

logic [31:0] neuron_r0_output, neuron_r1_output, neuron_r2_output, neuron_s0_output, neuron_s1_output;

//VALUE ASSIGNMENT (WILL LATER BE REPLACED WITH A ROM)
assign weights_r0_1 = 32'hc0893d63;
assign weights_r0_2 = 32'h40893d64;
assign bias_r0 = 32'hb43e1ea5;

assign weights_r1_1 = 32'h3fc265f3;
assign weights_r1_2 = 32'hbea93ff7;
assign bias_r1 = 32'h3f5d3607;

assign weights_r2_1 = 32'hc01112e8;
assign weights_r2_2 = 32'h40320bcf;
assign bias_r2 = 32'h401112f7;

assign weights_s0_1 = 32'h40892db8;
assign weights_s0_2 = 32'h3fa27341;
assign weights_s0_3 = 32'hc03fb292;
assign bias_s0 = 32'h3f8bd357;

assign weights_s1_1 = 32'hc0895129;
assign weights_s1_2 = 32'hbf9f0996;
assign weights_s1_3 = 32'h404071fd;
assign bias_s1 = 32'hbf7f615a;

assign xn_input = (x_input == 0) ? 32'h00000000:32'h3f800000;
assign yn_input = (y_input == 0) ? 32'h00000000:32'h3f800000;

// NN STRUCTURE STARTS HERE
					  
ReLUNeuron r0(clk, reset, xn_input, yn_input, weights_r0_1, weights_r0_2, bias_r0, neuron_r0_output);
ReLUNeuron r1(clk, reset, xn_input, yn_input, weights_r1_1, weights_r1_2, bias_r1, neuron_r1_output);
ReLUNeuron r2(clk, reset, xn_input, yn_input, weights_r2_1, weights_r2_2, bias_r2, neuron_r2_output);

SigmoidNeuron s0(clk, reset, neuron_r0_output, neuron_r1_output, neuron_r2_output, weights_s0_1, weights_s0_2, weights_s0_3, bias_s0, neuron_s0_output);
SigmoidNeuron s1(clk, reset, neuron_r0_output, neuron_r1_output, neuron_r2_output, weights_s1_1, weights_s1_2, weights_s1_3, bias_s1, neuron_s1_output);

// COMPARISON ACTS AS PREDICTION UNIT
CompareFPU c0(.clk(clk), .areset(reset), .a(neuron_s0_output), .b(neuron_s1_output), .q(flag1));

// XOR FUNCTION			
assign flag2 = x_input ^ y_input;

// RETURNS PREDICTION AND EXPECTED
assign predicted = (flag1) ? 2'b10:2'b01;
assign expected = (flag2) ? 2'b10:2'b01; 
										  
endmodule 

// TESTBENCH

`timescale 1ps/1ps

module ForwardPropagate_tb;

logic clk, reset;
logic x_input, y_input;
logic [1:0] predicted, expected;

ForwardPropagate uut(clk, reset, x_input, y_input, predicted, expected);

initial begin // clock cycle of 2ps
    clk = 0;
    forever #1 clk = ~clk;
end

initial begin // stimulus is applied here
    reset = 1; #2; 
    reset = 0; #2; 
    x_input = 0; 
	 y_input = 0;
	 #200;
	 reset = 1; #2; 
    reset = 0; #2; 
    x_input = 1; 
	 y_input = 0;
	 #200;
	 reset = 1; #2; 
    reset = 0; #2; 
    x_input = 0; 
	 y_input = 1;
	 #200;
	 reset = 1; #2; 
    reset = 0; #2; 
    x_input = 1; 
	 y_input = 1;
	 #200;	 
    $stop;
end

initial begin // response monitor
    $monitor ("t = %d clk = %b, reset = %b, predicted = %b, expected = %b", $time, clk, reset, predicted, expected);
end

endmodule