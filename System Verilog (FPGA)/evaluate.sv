module evaluate # (parameter NUM_OF_DATA = 4,
						 parameter NUM_OF_WEIGHTS = 4) 
						 
						(input logic clk, reset,
						 output logic [3:0] addr_counter,
						 output logic [3:0] test_data,
						 output logic [31:0] weights_0, weights_1, weights_2, weights_3, data, error_counter,
						 output logic [31:0] activate_n0, activate_n1, activate_n2, activate_n3);

/*

test = 0001
       0010
		 0100
		 1000
		 
weights = 0
          0 
			 0
			 10
			 
weights = 0
          0 
			 10
			 0

weights = 0
          10 
			 0
			 0

weights = 10
          0 
			 0
			 0
*/

						 
logic error, stop_nn;
logic [1:0] test_addr;
logic [1:0] weight_id, data_id, prediction, expected;
logic [2:0] counter;
logic [31:0] mult_n0, mult_n1, mult_n2, mult_n3, compare_0, compare_1, max_value;
logic [31:0] sum_n0, sum_n1, sum_n2, sum_n3;

input_data ROM_input(.address(test_addr), .clock(clk), .q(test_data)); 
label_input ROM_label(.address(test_addr), .clock(clk), .q(expected));

weights_0 ROM_n0(.address(weight_id), .clock(clk), .q(weights_0));
weights_1 ROM_n1(.address(weight_id), .clock(clk), .q(weights_1));
weights_2 ROM_n2(.address(weight_id), .clock(clk), .q(weights_2));
weights_3 ROM_n3(.address(weight_id), .clock(clk), .q(weights_3));

always_ff @ (posedge clk or posedge reset) begin 
	if (reset) begin
		error_counter <= 0;
		addr_counter <= 0;
		test_addr <= 0;
		counter <= 0;
		stop_nn <= 0;
		sum_n0 <= 0;
		sum_n1 <= 0;
		sum_n2 <= 0;
		sum_n3 <= 0;
	end
	else begin
		if(~stop_nn) begin
			counter <= counter + 1'b1;
			if (counter == 7) begin
				addr_counter <= addr_counter + 1'b1;
				sum_n0 <= sum_n0 + mult_n0;
				sum_n1 <= sum_n1 + mult_n1;
				sum_n2 <= sum_n2 + mult_n2;
				sum_n3 <= sum_n3 + mult_n3;
			end
			if (addr_counter > NUM_OF_WEIGHTS) begin
				addr_counter <= 0;
				test_addr <= test_addr + 1'b1;
				error_counter <= error_counter + error;
				sum_n0 <= 0;
				sum_n1 <= 0;
				sum_n2 <= 0;
				sum_n3 <= 0;
				if (test_addr == NUM_OF_DATA - 1) begin
					stop_nn <= 1'b1;
				end
			end
		end
		else begin
			test_addr <= NUM_OF_DATA - 1;
		end
	end
end

assign weight_id = (addr_counter < NUM_OF_WEIGHTS) ? addr_counter : NUM_OF_WEIGHTS - 1;
assign data_id = (addr_counter < NUM_OF_WEIGHTS) ? addr_counter : NUM_OF_WEIGHTS - 1;

always_ff @ (posedge clk or posedge reset) begin
	if (reset) begin
		data <= 0;
	end
	else begin
		if (test_data[NUM_OF_WEIGHTS - 1 - data_id] == 1 && addr_counter < 4) begin
			data <= 32'b00000100000000000000000000000000;
		end
		else begin
			data <= 32'b00000000000000000000000000000000;
		end
	end
end

/*
assign mult_n0 = data * weights_0;
assign mult_n1 = data * weights_1;
assign mult_n2 = data * weights_2;
assign mult_n3 = data * weights_3;
*/

multfixed m0(data, weights_0, mult_n0);
multfixed m1(data, weights_1, mult_n1);
multfixed m2(data, weights_2, mult_n2);
multfixed m3(data, weights_3, mult_n3);

SigmoidLUTs active_n0(sum_n0, activate_n0);
SigmoidLUTs active_n1(sum_n1, activate_n1);
SigmoidLUTs active_n2(sum_n2, activate_n2);
SigmoidLUTs active_n3(sum_n3, activate_n3);

assign max_value = (compare_0 > compare_1) ? compare_0 : compare_1;

assign compare_0 = (activate_n0 > activate_n1) ? activate_n0 : activate_n1;
assign compare_1 = (activate_n2 > activate_n3) ? activate_n2 : activate_n3;

always_comb begin
	if (max_value == activate_n0) begin
		prediction = 2'd0;
	end
	else if (max_value == activate_n1) begin
		prediction = 2'd1;
	end
	else if (max_value == activate_n2) begin
		prediction = 2'd2;
	end
	else if (max_value == activate_n3) begin
		prediction = 2'd3;
	end
	else begin
		prediction = 2'bxx;
	end
end

assign error = (expected != prediction) ? 1'b1 : 1'b0;

endmodule 