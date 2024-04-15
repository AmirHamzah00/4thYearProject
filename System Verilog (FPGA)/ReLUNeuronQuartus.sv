module ReLUNeuron (input logic clk, reset,
					    input logic [31:0] neuron_input [2:0],
                   input logic [31:0] weights [2:0],
					    input logic [31:0] bias,
				      output logic [31:0] neuron_output);

logic [31:0] multFPU_outputs [2:0];
logic [31:0] addFPU_outputs [1:0];
logic [31:0] activation_input, activation_output;

multFPU m0(
			.clk    (clk),    //    clk.clk
			.areset (areset), // areset.reset
			.a      (neuron_input[0]),      //      a.a
			.b      (weights[0]),      //      b.b
			.q      (multFPU_outputs[0])       //      q.q
			 );
			 
multFPU m1(
			.clk    (clk),    //    clk.clk
			.areset (areset), // areset.reset
			.a      (neuron_input[1]),      //      a.a
			.b      (weights[1]),      //      b.b
			.q      (multFPU_outputs[1])       //      q.q
			 );
			 
multFPU m2(
			.clk    (clk),    //    clk.clk
			.areset (areset), // areset.reset
			.a      (neuron_input[2]),      //      a.a
			.b      (weights[2]),      //      b.b
			.q      (multFPU_outputs[2])       //      q.q
			 );
			 
addFPU a0(
			.clk    (clk),    //    clk.clk
			.areset (areset), // areset.reset
			.a      (multFPU_outputs[0]),      //      a.a
			.b      (multFPU_outputs[1]),      //      b.b
			.q      (addFPU_outputs[0])       //      q.q
			 );
			 
addFPU a1(
			.clk    (clk),    //    clk.clk
			.areset (areset), // areset.reset
			.a      (multFPU_outputs[2]),      //      a.a
			.b      (bias),      //      b.b
			.q      (addFPU_outputs[1])       //      q.q
			 );

addFPU a2(
			.clk    (clk),    //    clk.clk
			.areset (areset), // areset.reset
			.a      (addFPU_outputs[0]),      //      a.a
			.b      (addFPU_outputs[1]),      //      b.b
			.q      (activation_input)       //      q.q
			 );
			 
ReLU r0(activation_input, activation_output);

assign neuron_output = activation_output;	
			 
endmodule


module ReLU (input logic [31:0] activation_input,
            output logic [31:0] activation_output);
				 
assign activation_output = (activation_input[31] == 0) ? activation_input : 32'b0;

endmodule


