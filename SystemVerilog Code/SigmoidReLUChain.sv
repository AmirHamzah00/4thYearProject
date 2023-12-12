//MAIN

module SigmoidReLUChain (input logic clk, reset,
						       input logic x_input, y_input,
								 output logic [1:0] predicted,
					          output logic [31:0] neuron_output1, neuron_output2);

logic flag;
logic [31:0] threshold;
								 
								 
logic [31:0] xn_input, yn_input;
logic [31:0] zeros;
					  
logic [31:0] weights1, weights2, weights3, weights4, weights5;
logic [31:0] bias1, bias2;

assign weights1 = 32'h4019999a;
assign weights2 = 32'h4019999a; 
assign weights3 = 32'h4019999a; 
assign weights4 = 32'h4019999a;
assign weights5 = 32'h4019999a;
assign bias1 = 32'h00000000; 
assign bias2 = 32'h00000000; 

assign zeros = 32'h00000000;
assign threshold = 32'h3f000000;

assign xn_input = (x_input == 0) ? 32'h00000000:32'h3f800000;
assign yn_input = (y_input == 0) ? 32'h00000000:32'h3f800000;
					  
ReLUNeuron r0(clk, reset, xn_input, yn_input, weights1, weights2, bias1, neuron_output1);
SigmoidNeuron s0(clk, reset, neuron_output1, zeros, zeros, weights3, weights4, weights5, bias2, neuron_output2);

CompareFPU c0(
					.clk    (clk),   
					.areset (reset),
					.a      (neuron_output2),  
					.b      (threshold),      
					.q      (flag)       
					);
				
assign predicted = (flag) ? 2'b10:2'b01;
										  
endmodule

//NEURON

module ReLUNeuron (input logic clk, reset,
					    input logic [31:0] neuron_input1, neuron_input2,
                   input logic [31:0] weights1, weights2,
					    input logic [31:0] bias,
				      output logic [31:0] neuron_output);

logic [31:0] multFPU_outputs1, multFPU_outputs2;
logic [31:0] addFPU_output;
logic [31:0] activation_input, activation_output;

multFPU m0(
			.clk    (clk),    
			.areset (reset), 
			.a      (neuron_input1),      
			.b      (weights1),     
			.q      (multFPU_outputs1)      
			 );
			 
multFPU m1(
			.clk    (clk),    
			.areset (reset), 
			.a      (neuron_input2),      
			.b      (weights2),      
			.q      (multFPU_outputs2)      
			 );
			 
addFPU a0(
			.clk    (clk),    
			.areset (reset), 
			.a      (multFPU_outputs1),      
			.b      (multFPU_outputs2),     
			.q      (addFPU_output)      
			 );
			 
addFPU a1(
			.clk    (clk),    
			.areset (reset), 
			.a      (addFPU_output),      
			.b      (bias),      
			.q      (activation_input)       
			 );

			 
ReLU r0(activation_input, activation_output);

assign neuron_output = activation_output;	
			 
endmodule

module ReLU (input logic [31:0] activation_input,
            output logic [31:0] activation_output);
				 
assign activation_output = (activation_input[31] == 0) ? activation_input : 32'b0;

endmodule

module SigmoidNeuron (input logic clk, reset,
					       input logic [31:0] neuron_input1, neuron_input2, neuron_input3,
                      input logic [31:0] weights1, weights2, weights3,
					       input logic [31:0] bias,
				         output logic [31:0] neuron_output);

logic [31:0] multFPU_outputs1, multFPU_outputs2, multFPU_outputs3;
logic [31:0] addFPU_outputs1, addFPU_outputs2;
logic [31:0] activation_input, activation_output;

multFPU m0(
			.clk    (clk),    
			.areset (reset), 
			.a      (neuron_input1),      
			.b      (weights1),     
			.q      (multFPU_outputs1)      
			 );
			 
multFPU m1(
			.clk    (clk),    
			.areset (reset), 
			.a      (neuron_input2),      
			.b      (weights2),      
			.q      (multFPU_outputs2)      
			 );
			 
multFPU m2(
			.clk    (clk),    
			.areset (reset), 
			.a      (neuron_input3),      
			.b      (weights3),      
			.q      (multFPU_outputs3)      
			 );
			 
addFPU a0(
			.clk    (clk),    
			.areset (reset), 
			.a      (multFPU_outputs1),      
			.b      (multFPU_outputs2),     
			.q      (addFPU_outputs1)      
			 );
			 
addFPU a1(
			.clk    (clk),    
			.areset (reset), 
			.a      (multFPU_outputs3),      
			.b      (bias),      
			.q      (addFPU_outputs2)       
			 );

addFPU a2(
			.clk    (clk),    
			.areset (reset), 
			.a      (addFPU_outputs1),      
			.b      (addFPU_outputs2),      
			.q      (activation_input)       
			 );

			 
SigmoidLUTs s0(clk, reset, activation_input, activation_output);

assign neuron_output = activation_output;	
			 
endmodule

//TESTBENCH

`timescale 1ps/1ps

module SigmoidReLUChain_tb;

logic clk, reset;
logic x_input, y_input;
logic [1:0] predicted;
logic [31:0] neuron_output1, neuron_output2;

SigmoidReLUChain uut(clk, reset, x_input, y_input, predicted, neuron_output1, neuron_output2);

initial begin // clock cycle of 2ps
    clk = 0;
    forever #1 clk = ~clk;
end

initial begin // stimulus is applied here
    reset = 1; #2; 
    reset = 0; #2; 
    x_input = 1; 
	 y_input = 1;
	 #200;
	 reset = 1; #2; 
    reset = 0; #2; 
    x_input = 0; 
	 y_input = 0;
	 #200;  
    $stop;
end

initial begin // response monitor
    $monitor ("t = %d clk = %b, reset = %b, neuron_output1 = %b, neuron_output2 = %b, predicted = %b", $time, clk, reset, neuron_output1, neuron_output2, predicted);
end

endmodule