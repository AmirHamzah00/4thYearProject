module Register(input logic clk, 
					 input logic [31:0] d, 
					 output logic [31:0] q);

 always@(posedge clk) begin
  q <= d;
 end
 
endmodule