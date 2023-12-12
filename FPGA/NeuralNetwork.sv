module NeuralNetwork (input logic clk, reset, reset_value, TestFlag,
						    input logic x_input, y_input,
							output logic [1:0] predicted, expected,
					      output logic [31:0] neuron_r0_output, neuron_r1_output, neuron_r2_output, neuron_s0_output,
						   output logic [31:0] ReLU_delta0, ReLU_delta1, ReLU_delta2, Sigmoid_delta0,
							output logic [31:0] weights_r0_1, weights_r0_2, bias_r0,
							output logic [31:0] weights_r1_1, weights_r1_2, bias_r1,
							output logic [31:0] weights_r2_1, weights_r2_2, bias_r2,
							output logic [31:0] weights_s0_1, weights_s0_2, weights_s0_3, bias_s0);
							
logic PredictFlag, ExpectResult;
logic read_en, write_en;
logic [2:0] counter;

// VARIABLE DECLARATION

logic [31:0] learning_rate;

logic [31:0] SigmoidThreshold;

logic [31:0] xn_input, yn_input, n_expected;
					  
logic [31:0] new_weights_r0_1, new_weights_r0_2;
logic [31:0] new_weights_r1_1, new_weights_r1_2;
logic [31:0] new_weights_r2_1, new_weights_r2_2;
logic [31:0] new_weights_s0_1, new_weights_s0_2, new_weights_s0_3;
logic [31:0] new_bias_r0, new_bias_r1, new_bias_r2, new_bias_s0;

logic [31:0] init_value_weights_r0_1;
logic [31:0] init_value_weights_r0_2;
logic [31:0] init_value_bias_r0;

logic [31:0] init_value_weights_r1_1;
logic [31:0] init_value_weights_r1_2;
logic [31:0] init_value_bias_r1;

logic [31:0] init_value_weights_r2_1;
logic [31:0] init_value_weights_r2_2;
logic [31:0] init_value_bias_r2;

logic [31:0] init_value_weights_s0_1;
logic [31:0] init_value_weights_s0_2;
logic [31:0] init_value_weights_s0_3;
logic [31:0] init_value_bias_s0;

// INITIAL VALUE ASSIGNMENT 

assign init_value_weights_r0_1 = 32'h000EEAA1;
assign init_value_weights_r0_2 = 32'h002E95A3;
assign init_value_bias_r0 = 32'h00000000;

assign init_value_weights_r1_1 = 32'h004EEDA2;
assign init_value_weights_r1_2 = 32'h00483E9B;
assign init_value_bias_r1 = 32'h00000000;

assign init_value_weights_r2_1 = 32'h004AF3DD;
assign init_value_weights_r2_2 = 32'h002C6452;
assign init_value_bias_r2 = 32'h00000000;

assign init_value_weights_s0_1 = 32'h0051EC0E;
assign init_value_weights_s0_2 = 32'h003691B0;
assign init_value_weights_s0_3 = 32'h0008352E;
assign init_value_bias_s0 = 32'h00000000;

assign learning_rate = 32'h00A3D70;
assign SigmoidThreshold = 32'h02000000;

assign n_expected = (ExpectResult) ? 32'h04000000 : 32'h00000000;

assign xn_input = (x_input) ? 32'h04000000 : 32'h00000000;
assign yn_input = (y_input) ? 32'h04000000 : 32'h00000000;

// PROGRAM COUNTER

always_ff @(posedge clk)
begin
	if (reset) begin
		counter <= 3'b000;
	end
	else begin
		counter <= counter + 3'b001;
	end
end

assign read_en = (TestFlag) ? 1'b1 : (counter[2] == 1) ? 1'b1:1'b0;
assign write_en = (TestFlag) ? 1'b0 : (counter[2] == 0) ? 1'b1:1'b0;

// TRAINING DATASET ROM

// will be implemented soon

// TESTING DATASET ROM (Simple XOR GATE is used first)

assign ExpectResult = x_input ^ y_input;

// NEURON RAM

NeuronRAM r0_w1(clk, reset, reset_value, read_en, write_en, init_value_weights_r0_1, new_weights_r0_1, weights_r0_1);
NeuronRAM r0_w2(clk, reset, reset_value, read_en, write_en, init_value_weights_r0_2, new_weights_r0_2, weights_r0_2);
NeuronRAM r0_b(clk, reset, reset_value, read_en, write_en, init_value_bias_r0, new_bias_r0, bias_r0);

NeuronRAM r1_w1(clk, reset, reset_value, read_en, write_en, init_value_weights_r1_1, new_weights_r1_1, weights_r1_1);
NeuronRAM r1_w2(clk, reset, reset_value, read_en, write_en, init_value_weights_r1_2, new_weights_r1_2, weights_r1_2);
NeuronRAM r1_b(clk, reset, reset_value, read_en, write_en, init_value_bias_r1, new_bias_r1, bias_r1);

NeuronRAM r2_w1(clk, reset, reset_value, read_en, write_en, init_value_weights_r2_1, new_weights_r2_1, weights_r2_1);
NeuronRAM r2_w2(clk, reset, reset_value, read_en, write_en, init_value_weights_r2_2, new_weights_r2_2, weights_r2_2);
NeuronRAM r2_b(clk, reset, reset_value, read_en, write_en, init_value_bias_r2, new_bias_r2, bias_r2);

NeuronRAM s0_w1(clk, reset, reset_value, read_en, write_en, init_value_weights_s0_1, new_weights_s0_1, weights_s0_1);
NeuronRAM s0_w2(clk, reset, reset_value, read_en, write_en, init_value_weights_s0_2, new_weights_s0_2, weights_s0_2);
NeuronRAM s0_w3(clk, reset, reset_value, read_en, write_en, init_value_weights_s0_3, new_weights_s0_3, weights_s0_3);
NeuronRAM s0_b(clk, reset, reset_value, read_en, write_en, init_value_bias_s0, new_bias_s0, bias_s0);

// NN STRUCTURE STARTS HERE

// Forward-Propagation
					  
ReLUNeuronFP FP_r0(xn_input, yn_input, weights_r0_1, weights_r0_2, bias_r0, neuron_r0_output);
ReLUNeuronFP FP_r1(xn_input, yn_input, weights_r1_1, weights_r1_2, bias_r1, neuron_r1_output);
ReLUNeuronFP FP_r2(xn_input, yn_input, weights_r2_1, weights_r2_2, bias_r2, neuron_r2_output);

SigmoidNeuronFP FP_s0(neuron_r0_output, neuron_r1_output, neuron_r2_output, weights_s0_1, weights_s0_2, weights_s0_3, bias_s0, neuron_s0_output);
			
// Back-Propagation

ReLUNeuronBP BP_r0(neuron_r0_output, weights_s0_1, Sigmoid_delta0, ReLU_delta0);
ReLUNeuronBP BP_r1(neuron_r1_output, weights_s0_2, Sigmoid_delta0, ReLU_delta1);
ReLUNeuronBP BP_r2(neuron_r2_output, weights_s0_3, Sigmoid_delta0, ReLU_delta2);

SigmoidNeuronBP BP_s0(neuron_s0_output, n_expected, Sigmoid_delta0);

// Parameter Optimisation

ReLUNeuronOP OP_r0(xn_input, yn_input, weights_r0_1, weights_r0_2, bias_r0, ReLU_delta0, learning_rate, new_weights_r0_1, new_weights_r0_2, new_bias_r0);
ReLUNeuronOP OP_r1(xn_input, yn_input, weights_r1_1, weights_r1_2, bias_r1, ReLU_delta1, learning_rate, new_weights_r1_1, new_weights_r1_2, new_bias_r1);
ReLUNeuronOP OP_r2(xn_input, yn_input, weights_r2_1, weights_r2_2, bias_r2, ReLU_delta2, learning_rate, new_weights_r2_1, new_weights_r2_2, new_bias_r2);

SigmoidNeuronOP OP_s0(neuron_r0_output, neuron_r1_output, neuron_r2_output, weights_s0_1, weights_s0_2, weights_s0_3, bias_s0, Sigmoid_delta0, learning_rate, new_weights_s0_1, new_weights_s0_2, new_weights_s0_3, new_bias_s0);

// Prediction Unit

comparefixedpoint c0(neuron_s0_output, SigmoidThreshold, PredictFlag);

assign predicted = (~TestFlag) ? 2'b00 : (PredictFlag) ? 2'b10 : 2'b01;
assign expected = (~TestFlag) ? 2'b00 : (ExpectResult) ? 2'b10 : 2'b01;

endmodule 		  


