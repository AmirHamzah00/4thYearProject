//-------------------------------------

// Fixed Arithmetic Unit for Comparsion

//-------------------------------------

module comparefixedpoint (input logic [31:0] a, b, 
                         output logic q);

logic signbit;
logic [31:0] temp, A_b, B_b;

//recognise sign bit
assign signbit = ~(a[31]^b[31]);

//two complement to binary
assign A_b = ~(a - 1'b1);
assign B_b = ~(b - 1'b1);

always_comb
	begin
		if (signbit == 0) // The two input have different sign
			begin
			temp = a[31] ? b : a ;
			end
		else // The two inputs have same sign
			begin
				if (a[31] == 0) 
					begin
					temp = a >= b ? a : b ; // Input is positive
					end
			else 
				begin 
					temp = A_b >= B_b ? b : a; // Input is negative
				end
		end
end

assign q = (temp == a) ? 1'b1 : 1'b0;


endmodule 

//-----------------------------------

// Fixed Arithmetic Unit for Addition

//-----------------------------------

module  addfixed(input logic [31:0] a, b, 
                output logic [31:0] q);
  
assign q = a + b;
 
endmodule

//--------------------------------------

// Fixed Arithmetic Unit for Subtraction

//--------------------------------------

module  subfixed(input logic [31:0] a, b, 
                output logic [31:0] q);

logic [31:0] zeros, tmp_b;
logic [31:0] new_b_val;

assign zeros = 32'h00000000;

//Convert Value to Negative Number

assign tmp_b = ~(b ^ zeros);

assign new_b_val = tmp_b + 32'b00000000000000000000000000000001;

assign q = a + new_b_val;
 
endmodule

//-----------------------------------------

// Fixed Arithmetic Unit for Multiplication

//-----------------------------------------

module multfixed (input logic [31:0] a,b,
                 output logic [31:0] q);    

logic [31:0] A_b,B_b,tmp,mult_output;
logic [63:0] mult_result;
logic signbit;

//change to binary if its negative
assign A_b = (a[31]) ? ~(a - 1'b1) : a;
assign B_b = (b[31]) ? ~(b - 1'b1) : b;

//assign sign bit
assign signbit = a[31]^b[31]; //XOR

//multiplication and truncate
assign mult_result = A_b*B_b;
assign tmp = mult_result[63-6:26];

//change to two complement if negative
assign q = (signbit) ? ~tmp + 1'b1 : tmp;
 
endmodule