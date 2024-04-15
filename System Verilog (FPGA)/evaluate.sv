module evaluate # (parameter NUM_OF_DATA = 300,
						 parameter NUM_OF_WEIGHTS = 784) 
						 
						(input logic clk, reset,
						output logic stop_nn,
						output logic [15:0] error_counter);

logic error;
logic [2:0] counter;
logic [8:0] test_addr;
logic [9:0] addr_counter, weight_id, data_id; 

logic [3:0] prediction, expected;
logic [31:0] data;
logic [783:0] test_data;

logic [31:0] weights_0, weights_1, weights_2, weights_3, weights_4, weights_5, weights_6, weights_7, weights_8, weights_9;
logic [31:0] mult_n0, mult_n1, mult_n2, mult_n3, mult_n4, mult_n5, mult_n6, mult_n7, mult_n8, mult_n9;
logic [31:0] sum_n0, sum_n1, sum_n2, sum_n3, sum_n4, sum_n5, sum_n6, sum_n7, sum_n8, sum_n9;
logic [31:0] activate_n0, activate_n1, activate_n2, activate_n3, activate_n4, activate_n5, activate_n6, activate_n7, activate_n8, activate_n9;

logic [31:0] compare_0, compare_1, compare_2, compare_3, compare_4, compare_5, compare_6, compare_7, max_value;

input_data ROM_input(.address(test_addr), .clock(clk), .q(test_data)); 
label_data ROM_label(.address(test_addr), .clock(clk), .q(expected));

weights_0 ROM_n0(.address(weight_id), .clock(clk), .q(weights_0));
weights_1 ROM_n1(.address(weight_id), .clock(clk), .q(weights_1));
weights_2 ROM_n2(.address(weight_id), .clock(clk), .q(weights_2));
weights_3 ROM_n3(.address(weight_id), .clock(clk), .q(weights_3));
weights_4 ROM_n4(.address(weight_id), .clock(clk), .q(weights_4));
weights_5 ROM_n5(.address(weight_id), .clock(clk), .q(weights_5));
weights_6 ROM_n6(.address(weight_id), .clock(clk), .q(weights_6));
weights_7 ROM_n7(.address(weight_id), .clock(clk), .q(weights_7));
weights_8 ROM_n8(.address(weight_id), .clock(clk), .q(weights_8));
weights_9 ROM_n9(.address(weight_id), .clock(clk), .q(weights_9));

always_ff @ (posedge clk or negedge reset) begin 
	if (~reset) begin
		error_counter <= 0;
		addr_counter <= 0;
		test_addr <= 0;
		counter <= 0;
		stop_nn <= 0;
		sum_n0 <= 0;
		sum_n1 <= 0;
		sum_n2 <= 0;
		sum_n3 <= 0;
		sum_n4 <= 0;
		sum_n5 <= 0;
		sum_n6 <= 0;
		sum_n7 <= 0;
		sum_n8 <= 0;
		sum_n9 <= 0;
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
				sum_n4 <= sum_n4 + mult_n4;
				sum_n5 <= sum_n5 + mult_n5;
				sum_n6 <= sum_n6 + mult_n6;
				sum_n7 <= sum_n7 + mult_n7;
				sum_n8 <= sum_n8 + mult_n8;
				sum_n9 <= sum_n9 + mult_n9;
			end
			if (addr_counter > NUM_OF_WEIGHTS) begin
				addr_counter <= 0;
				test_addr <= test_addr + 1'b1;
				error_counter <= error_counter + error;
				sum_n0 <= 0;
				sum_n1 <= 0;
				sum_n2 <= 0;
				sum_n3 <= 0;
				sum_n4 <= 0;
				sum_n5 <= 0;
				sum_n6 <= 0;
				sum_n7 <= 0;
				sum_n8 <= 0;
				sum_n9 <= 0;
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

always_ff @ (posedge clk or negedge reset) begin
	if (~reset) begin
		data <= 0;
	end
	else begin
		if (test_data[NUM_OF_WEIGHTS - 1 - data_id] == 1 && addr_counter < NUM_OF_WEIGHTS) begin
			data <= 32'b00000100000000000000000000000000;
		end
		else begin
			data <= 32'b00000000000000000000000000000000;
		end
	end
end

multfixed m0(data, weights_0, mult_n0);
multfixed m1(data, weights_1, mult_n1);
multfixed m2(data, weights_2, mult_n2);
multfixed m3(data, weights_3, mult_n3);
multfixed m4(data, weights_4, mult_n4);
multfixed m5(data, weights_5, mult_n5);
multfixed m6(data, weights_6, mult_n6);
multfixed m7(data, weights_7, mult_n7);
multfixed m8(data, weights_8, mult_n8);
multfixed m9(data, weights_9, mult_n9);

SigmoidLUTs active_n0(sum_n0, activate_n0);
SigmoidLUTs active_n1(sum_n1, activate_n1);
SigmoidLUTs active_n2(sum_n2, activate_n2);
SigmoidLUTs active_n3(sum_n3, activate_n3);
SigmoidLUTs active_n4(sum_n4, activate_n4);
SigmoidLUTs active_n5(sum_n5, activate_n5);
SigmoidLUTs active_n6(sum_n6, activate_n6);
SigmoidLUTs active_n7(sum_n7, activate_n7);
SigmoidLUTs active_n8(sum_n8, activate_n8);
SigmoidLUTs active_n9(sum_n9, activate_n9);

assign max_value = (compare_4 > compare_7) ? compare_4 : compare_7;

assign compare_0 = (activate_n0 > activate_n1) ? activate_n0 : activate_n1;
assign compare_1 = (activate_n2 > activate_n3) ? activate_n2 : activate_n3;
assign compare_2 = (activate_n4 > activate_n5) ? activate_n4 : activate_n5;
assign compare_3 = (activate_n6 > activate_n7) ? activate_n6 : activate_n7;
assign compare_4 = (activate_n8 > activate_n9) ? activate_n8 : activate_n9;

assign compare_5 = (compare_0 > compare_1) ? compare_0 : compare_1;
assign compare_6 = (compare_2 > compare_3) ? compare_2 : compare_3;
assign compare_7 = (compare_5 > compare_6) ? compare_5 : compare_6;

always_comb begin
	if (max_value == activate_n0) begin
		prediction = 4'd0;
	end
	else if (max_value == activate_n1) begin
		prediction = 4'd1;
	end
	else if (max_value == activate_n2) begin
		prediction = 4'd2;
	end
	else if (max_value == activate_n3) begin
		prediction = 4'd3;
	end
	else if (max_value == activate_n4) begin
		prediction = 4'd4;
	end
	else if (max_value == activate_n5) begin
		prediction = 4'd5;
	end
	else if (max_value == activate_n6) begin
		prediction = 4'd6;
	end
	else if (max_value == activate_n7) begin
		prediction = 4'd7;
	end
	else if (max_value == activate_n8) begin
		prediction = 4'd8;
	end
	else if (max_value == activate_n9) begin
		prediction = 4'd9;
	end
	else begin
		prediction = 4'bxxxx;
	end
end

assign error = (expected != prediction) ? 1'b1 : 1'b0;

endmodule 