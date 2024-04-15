//-------------------------------------------------------------------

// THIS PART DEFINES THE FORWARD PROPAGATION ALGORITHM OF THE NEURONS

//-------------------------------------------------------------------

// main formula: neuron output = sum(weight x input) + bias

module ReLUNeuronFP (input logic [31:0] neuron_input1, neuron_input2, 
                     input logic [31:0] weights1, weights2,
					      input logic [31:0] bias,
				        output logic [31:0] neuron_output);

logic [31:0] multfixed_outputs1, multfixed_outputs2; // used as tmp to store multfixed values
logic [31:0] addfixed_output; // used as tmp to store addfixed values
logic [31:0] activation_input, activation_output; // used as tmp for i/o of the activation module

// The multfixed is used to compute the multiplcation of the weights and the inputs

multfixed m0(
			.a      (neuron_input1),      
			.b      (weights1),     
			.q      (multfixed_outputs1)      
			 );
			 
multfixed m1( 
			.a      (neuron_input2),      
			.b      (weights2),      
			.q      (multfixed_outputs2)      
			 );
			
// The addfixed is used to add the output from the multfixed with the bias

addfixed a0(
			.a      (multfixed_outputs1),      
			.b      (multfixed_outputs2),     
			.q      (addfixed_output)      
			 );
			 
addfixed a1(
			.a      (addfixed_output),      
			.b      (bias),      
			.q      (activation_input)       
			 );

// The addition result is passed to the ReLU module which act as the activation function
			 
ReLU r0(activation_input, activation_output);

assign neuron_output = activation_output;	// neuron returns the output after the activation function 
			 
endmodule

module SigmoidNeuronFP (input logic [31:0] neuron_input1, neuron_input2, neuron_input3,
                        input logic [31:0] weights1, weights2, weights3,
					         input logic [31:0] bias,
				           output logic [31:0] neuron_output);

logic [31:0] multfixed_outputs1, multfixed_outputs2, multfixed_outputs3; // used as tmp to store multfixed values
logic [31:0] addfixed_outputs1, addfixed_outputs2; // used as tmp to store addfixed values
logic [31:0] activation_input, activation_output; // used as tmp for i/o of the activation module

// The multfixed is used to compute the multiplcation of the weights and the inputs

multfixed m0(
			.a      (neuron_input1),      
			.b      (weights1),     
			.q      (multfixed_outputs1)      
			 );
			 
multfixed m1(
			.a      (neuron_input2),      
			.b      (weights2),      
			.q      (multfixed_outputs2)      
			 );
			 
multfixed m2(
			.a      (neuron_input3),      
			.b      (weights3),      
			.q      (multfixed_outputs3)      
			 );

// The addfixed is used to add the output from the multfixed with the bias
			 
addfixed a0(
			.a      (multfixed_outputs1),      
			.b      (multfixed_outputs2),     
			.q      (addfixed_outputs1)      
			 );
			 
addfixed a1( 
			.a      (multfixed_outputs3),      
			.b      (bias),      
			.q      (addfixed_outputs2)       
			 );

addfixed a2(
			.a      (addfixed_outputs1),      
			.b      (addfixed_outputs2),      
			.q      (activation_input)       
			 );

// The addition result is passed to the SigmoidLUTs module which act as the activation function
			 
SigmoidLUTs s0(activation_input, activation_output);

assign neuron_output = activation_output;	// neuron returns the output after the activation function 
			 
endmodule 


//---------------------------------------------------------------

// THIS PART DEFINES THE BACKPROPAGATION ALGORITHM OF THE NEURONS

//---------------------------------------------------------------

// main formula: delta = loss x activation derivative function of neuron output

module SigmoidNeuronBP (input logic [31:0] neuron_output,
						      input logic [31:0] expected,
					        output logic [31:0] delta);
					  
logic [31:0] dSigmoid_input, dSigmoid_output; // used as tmp for sigmoid derivative calculation

// The purpose of this Module is to compute th chain derivative value 'Delta' which will be used for parameter optimisation

// This part computes the following formula [ Sigmoid Derivative = output(1 - output) ]

subfixed s0(
			.a(neuron_output),      
			.b(expected),      
			.q(delta)   			
			);
					  
endmodule 


module ReLUNeuronBP (input logic [31:0] neuron_output,
			    	      input logic [31:0] weight,
					      input logic [31:0] dSigmoid, 
				        output logic [31:0] delta);
				  
logic [31:0] dresult; // used as tmp to calculate the loss value for the ReLU neurons

// This part is used to compute the weighted loss [ReLU loss = Sum of (Sigmoid Delta x ReLU Weights)]
			
multfixed m1( 
			.a(dSigmoid),      
			.b(weight),      
			.q(dresult)   			
			);	
			
// The derivative of the ReLU function is 1 for positive value and 0 for negative value, hence delta will be result of weighted loss if positive, zero if negative
			
assign delta = (neuron_output[31] == 0) ? dresult : 32'h00000000; // checks the 32nd bit to determine the sign of the neuron output

endmodule 


//----------------------------------------------------------------------

// THIS PART DEFINES THE PARAMETER OPTIMISATION ALGORITHM OF THE NEURONS

//----------------------------------------------------------------------

// main formulae:
// new weight = old weight - learning_rate x delta x input
// new bias = old bias - learning rate x delta

module SigmoidNeuronOP (input logic [31:0] SigmoidNeuron_input1, SigmoidNeuron_input2, SigmoidNeuron_input3,
								input logic [31:0] SigmoidNeuron_weight1, SigmoidNeuron_weight2, SigmoidNeuron_weight3,
								input logic [31:0] Sigmoid_bias,
								input logic [31:0] delta,
								input logic [31:0] learning_rate,
							  output logic [31:0] new_Sigmoid_weight1, new_Sigmoid_weight2, new_Sigmoid_weight3, new_Sigmoid_bias);

logic [31:0] delta_lr; // store the delta-learning_rate product value
logic [31:0] update_Sigmoid_weight1, update_Sigmoid_weight2, update_Sigmoid_weight3; // store the product of delta_lr with the input

// computes the delta_lr value
multfixed m0(
			.a      (delta),      
			.b      (learning_rate),     
			.q      (delta_lr)      
			 );
			 
// these units compute the delta_lr x input values 
multfixed m1(
			.a      (SigmoidNeuron_input1),      
			.b      (delta_lr),      
			.q      (update_Sigmoid_weight1)      
			 );
			 
multfixed m2(
			.a      (SigmoidNeuron_input2),      
			.b      (delta_lr),      
			.q      (update_Sigmoid_weight2)      
			 );
			 
multfixed m3(
			.a      (SigmoidNeuron_input3),      
			.b      (delta_lr),      
			.q      (update_Sigmoid_weight3)      
			 );
			 
// this computes the new bias value	 
subfixed s0(
			.a(Sigmoid_bias),      
			.b(delta_lr),      
			.q(new_Sigmoid_bias)   			
			);
			
// these units computes the new weight values	 
subfixed s1(
			.a(SigmoidNeuron_weight1),      
			.b(update_Sigmoid_weight1),      
			.q(new_Sigmoid_weight1)   			
			);
			
subfixed s2(
			.a(SigmoidNeuron_weight2),      
			.b(update_Sigmoid_weight2),      
			.q(new_Sigmoid_weight2)   			
			);
			
subfixed s3(
			.a(SigmoidNeuron_weight3),      
			.b(update_Sigmoid_weight3),      
			.q(new_Sigmoid_weight3)   			
			);

endmodule


module ReLUNeuronOP (input logic [31:0] ReLUNeuron_input1, ReLUNeuron_input2,
							input logic [31:0] ReLUNeuron_weight1, ReLUNeuron_weight2, 
							input logic [31:0] ReLU_bias,
							input logic [31:0] delta,
							input logic [31:0] learning_rate,
						  output logic [31:0] new_ReLU_weight1, new_ReLU_weight2, new_ReLU_bias);
	
logic [31:0] delta_lr; // store the delta-learning_rate product value
logic [31:0] update_ReLU_weight1, update_ReLU_weight2; // store the product of delta_lr with the input

// computes the delta_lr value
multfixed m0( 
			.a      (delta),      
			.b      (learning_rate),     
			.q      (delta_lr)      
			 );

// these units compute the delta_lr x input values 		 
multfixed m1( 
			.a      (ReLUNeuron_input1),      
			.b      (delta_lr),      
			.q      (update_ReLU_weight1)      
			 );
			 
multfixed m2(
			.a      (ReLUNeuron_input2),      
			.b      (delta_lr),      
			.q      (update_ReLU_weight2)      
			 );
			 
// this computes the new bias value				 
subfixed s0( 
			.a(ReLU_bias),      
			.b(delta_lr),      
			.q(new_ReLU_bias)   			
			);
 
 // these units computes the new weight values
subfixed s1( 
			.a(ReLUNeuron_weight1),      
			.b(update_ReLU_weight1),      
			.q(new_ReLU_weight1)   			
			);
			
subfixed s2(
			.a(ReLUNeuron_weight2),      
			.b(update_ReLU_weight2),      
			.q(new_ReLU_weight2)   			
			);

endmodule 