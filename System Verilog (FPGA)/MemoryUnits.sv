module NeuronRAM (input logic clk, reset_val, read_en, write_en,
					   input logic [31:0] init_value,
					   input logic [31:0] data_in,
					  output logic [31:0] data_out);

logic [31:0] data;

assign data = (reset_val) ? init_value : data_in ;
	
ram r0(
	    .address(1'b0),
	    .clock(clk),
	    .data(data),
	    .rden(read_en),
	    .wren(write_en),
	    .q(data_out)
		);
		
endmodule 