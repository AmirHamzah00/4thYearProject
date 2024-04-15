`timescale 1ps/1ps

module NeuralNetwork_tb;

logic clk, clk2, reset, reset_value, TestFlag;
logic x_input, y_input;
logic read_en, write_en, read_en1, write_en1, read_en2, write_en2;
logic [1:0] predicted, expected;
logic [31:0] FP_neuron_r0_output, FP_neuron_r1_output, FP_neuron_r2_output, FP_neuron_s0_output;
logic [31:0] ReLU_delta0, ReLU_delta1, ReLU_delta2, Sigmoid_delta0;
logic [31:0] weights_r0_1, weights_r0_2, bias_r0;
logic [31:0] weights_r1_1, weights_r1_2, bias_r1;
logic [31:0] weights_r2_1, weights_r2_2, bias_r2;
logic [31:0] weights_s0_1, weights_s0_2, weights_s0_3, bias_s0;

NeuralNetwork uut(clk, clk2, reset_value, TestFlag, 
						x_input, y_input,
					   read_en, write_en, read_en1, write_en1, read_en2, write_en2, 	
						predicted, expected,
                  FP_neuron_r0_output, FP_neuron_r1_output, FP_neuron_r2_output, FP_neuron_s0_output,
						ReLU_delta0, ReLU_delta1, ReLU_delta2, Sigmoid_delta0,
						weights_r0_1, weights_r0_2, bias_r0,
						weights_r1_1, weights_r1_2, bias_r1,
						weights_r2_1, weights_r2_2, bias_r2,
						weights_s0_1, weights_s0_2, weights_s0_3, bias_s0);

initial begin // clock cycle of 2ps
    clk = 0;
    forever #1 clk = ~clk;
end

initial begin // clock cycle of 40ps
	clk2 = 0;
	forever #25 clk2 = ~clk2;
end

initial begin // stimulus is applied here

    // Initialse Value

	 TestFlag = 0;  
	 reset_value = 1; #5;
	 
	 read_en = 0;write_en = 1; #5; //Initial Param -> NeuronRAM
	 read_en = 1;write_en = 0; #5; //NeuronRAM -> reg
	 
	 x_input = 0;                  //Input -> reg
	 y_input = 0;
	 
	 #10; //Posedge t = 25; Cycle start
	 
	 for (int i = 0; i < 10000; i++) begin
	 
	 read_en1 = 0;write_en1 = 1; #5; //FP Param -> RAM1
	 read_en1 = 1;write_en1 = 0; #5; //RAM1 -> BP-NN
	 
	 read_en2 = 0;write_en2 = 1; #5; //BP Param > RAM2
	 read_en2 = 1;write_en2 = 0; #5; //RAM2 -> NeuronRAM
	 
	 reset_value = 0;#5 //NeuronRAM data = new value t - 50
	 
	 read_en = 0;write_en = 1; #5;   //Updated Param -> NeuronRAM
	 read_en = 1;write_en = 0; #5;   //NeuronRAM -> reg 
	 
	 x_input = 1;                    //Input -> reg
	 y_input = 0;
	 
	 #15; //Posedge t = 75; Cycle repeats
	 
	 read_en1 = 0;write_en1 = 1; #5; //FP Param -> RAM1
	 read_en1 = 1;write_en1 = 0; #5; //RAM1 -> BP-NN
	 
	 read_en2 = 0;write_en2 = 1; #5; //BP Param > RAM2
	 read_en2 = 1;write_en2 = 0; #5; //RAM2 -> NeuronRAM
	 
	 reset_value = 0;#5; //NeuronRAM data = new value t - 50
	 
	 read_en = 0;write_en = 1; #5;   //Updated Param -> NeuronRAM
	 read_en = 1;write_en = 0; #5;   //NeuronRAM -> reg 
	 
	 x_input = 0;                    //Input -> reg
	 y_input = 1;
	 
	 #15; //Posedge t = 75; Cycle repeats
	 
	 read_en1 = 0;write_en1 = 1; #5; //FP Param -> RAM1
	 read_en1 = 1;write_en1 = 0; #5; //RAM1 -> BP-NN
	 
	 read_en2 = 0;write_en2 = 1; #5; //BP Param > RAM2
	 read_en2 = 1;write_en2 = 0; #5; //RAM2 -> NeuronRAM
	 
	 reset_value = 0;#5; //NeuronRAM data = new value t - 50
	 
	 read_en = 0;write_en = 1; #5;   //Updated Param -> NeuronRAM
	 read_en = 1;write_en = 0; #5;   //NeuronRAM -> reg 
	 
	 x_input = 1;                    //Input -> reg
	 y_input = 1;
	 
	 #15; //Posedge t = 75; Cycle repeats
	 
	 read_en1 = 0;write_en1 = 1; #5; //FP Param -> RAM1
	 read_en1 = 1;write_en1 = 0; #5; //RAM1 -> BP-NN
	 
	 read_en2 = 0;write_en2 = 1; #5; //BP Param > RAM2
	 read_en2 = 1;write_en2 = 0; #5; //RAM2 -> NeuronRAM
	 
	 reset_value = 0;#5; //NeuronRAM data = new value t - 50
	 
	 read_en = 0;write_en = 1; #5;   //Updated Param -> NeuronRAM
	 read_en = 1;write_en = 0; #5;   //NeuronRAM -> reg 
	 
	 x_input = 0;                    //Input -> reg
	 y_input = 0;
	 
	 #15; //Posedge t = 125
	 
	 end
	 
	 TestFlag = 1;
	 #30
	 x_input = 0;                    //Input -> reg
	 y_input = 0;
	 #30;
	 x_input = 1;                    //Input -> reg
	 y_input = 0;
	 #30;
	 x_input = 0;                    //Input -> reg
	 y_input = 1;
	 #30;
	 x_input = 1;                    //Input -> reg
	 y_input = 1;
    #30;
		 
	 $stop;
	
end

initial begin // response monitor

    



    $monitor ("t = %d clk = %b, reset = %b, predicted = %b, expected = %b, neuron_r0_output =  %b, neuron_r1_output =  %b, neuron_r2_output =  %b, neuron_s0_output =  %b, \
	            ReLU_delta0 =  %b, ReLU_delta1 =  %b, ReLU_delta2 =  %b, Sigmoid_delta0 =  %b, \
	 			   weights_r0_1 =  %b, weights_r0_2 =  %b, bias_r0 =  %b, \
	 				weights_r1_1 =  %b, weights_r1_2 =  %b, bias_r1 =  %b, \
	 				weights_r2_1 =  %b, weights_r2_2 =  %b, bias_r2 =  %b, \
	 				weights_s0_1 =  %b, weights_s0_2 =  %b, weights_s0_3 =  %b, bias_s0 =  %b,", 
	           $time, clk, reset, predicted, expected, FP_neuron_r0_output, FP_neuron_r1_output, FP_neuron_r2_output, FP_neuron_s0_output,
	 				ReLU_delta0, ReLU_delta1, ReLU_delta2, Sigmoid_delta0,
	 				weights_r0_1, weights_r0_2, bias_r0,
	 				weights_r1_1, weights_r1_2, bias_r1,
	 				weights_r2_1, weights_r2_2, bias_r2,
	 				weights_s0_1, weights_s0_2, weights_s0_3, bias_s0);
end

endmodule