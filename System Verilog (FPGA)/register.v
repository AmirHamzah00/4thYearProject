module Register(input clk, input [31:0] d, output [31:0] q);

 always@(posedge clk) begin
  q <= d;
 end
 
endmodule