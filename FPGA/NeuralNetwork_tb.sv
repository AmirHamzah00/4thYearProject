`timescale 1ps/1ps

module NeuralNetwork_tb;

logic clk, reset, reset_value, TestFlag;
logic x_input, y_input;
logic [1:0] predicted, expected;
logic [31:0] neuron_r0_output, neuron_r1_output, neuron_r2_output, neuron_s0_output;
logic [31:0] ReLU_delta0, ReLU_delta1, ReLU_delta2, Sigmoid_delta0;
logic [31:0] weights_r0_1, weights_r0_2, bias_r0;
logic [31:0] weights_r1_1, weights_r1_2, bias_r1;
logic [31:0] weights_r2_1, weights_r2_2, bias_r2;
logic [31:0] weights_s0_1, weights_s0_2, weights_s0_3, bias_s0;

NeuralNetwork uut(clk, reset, reset_value, TestFlag, x_input, y_input, predicted, expected,
                  neuron_r0_output, neuron_r1_output, neuron_r2_output, neuron_s0_output,
						ReLU_delta0, ReLU_delta1, ReLU_delta2, Sigmoid_delta0,
						weights_r0_1, weights_r0_2, bias_r0,
						weights_r1_1, weights_r1_2, bias_r1,
						weights_r2_1, weights_r2_2, bias_r2,
						weights_s0_1, weights_s0_2, weights_s0_3, bias_s0);

initial begin // clock cycle of 2ps
    clk = 0;
    forever #1 clk = ~clk;
end

initial begin // stimulus is applied here

// Initailse Value

    reset = 1; TestFlag = 0; #2; 
    reset = 0; #2; 
	 reset_value = 1; #8;
	 reset_value = 0; #8;
	 for (int i = 0; i < 5; i++) begin
	 x_input = 0; 
	 y_input = 0;
	 #20;
	 x_input = 1; 
	 y_input = 0;
	 #20;
	 x_input = 0; 
	 y_input = 1;
	 #20;
	 x_input = 1; 
	 y_input = 1;
	 #20;	
	 end
	 TestFlag = 1;
	 #10;
	 x_input = 0; 
	 y_input = 0;
	 #10;
	 x_input = 1; 
	 y_input = 0;
	 #10;
	 x_input = 0; 
	 y_input = 1;
	 #10;
	 x_input = 1; 
	 y_input = 1;
	 #10;
    $stop;
end

initial begin // response monitor
    $monitor ("t = %d clk = %b, reset = %b, predicted = %b, expected = %b, neuron_r0_output =  %b, neuron_r1_output =  %b, neuron_r2_output =  %b, neuron_s0_output =  %b, \
	            ReLU_delta0 =  %b, ReLU_delta1 =  %b, ReLU_delta2 =  %b, Sigmoid_delta0 =  %b, \
				   weights_r0_1 =  %b, weights_r0_2 =  %b, bias_r0 =  %b, \
					weights_r1_1 =  %b, weights_r1_2 =  %b, bias_r1 =  %b, \
					weights_r2_1 =  %b, weights_r2_2 =  %b, bias_r2 =  %b, \
					weights_s0_1 =  %b, weights_s0_2 =  %b, weights_s0_3 =  %b, bias_s0 =  %b,", 
	           $time, clk, reset, predicted, expected, neuron_r0_output, neuron_r1_output, neuron_r2_output, neuron_s0_output,
					ReLU_delta0, ReLU_delta1, ReLU_delta2, Sigmoid_delta0,
					weights_r0_1, weights_r0_2, bias_r0,
					weights_r1_1, weights_r1_2, bias_r1,
					weights_r2_1, weights_r2_2, bias_r2,
					weights_s0_1, weights_s0_2, weights_s0_3, uut.learning_rate);
end

endmodule