`timescale 1ns/1ps

module Compare(
 );

//variables
	input			src1;
	input			src2;
	input			less;
	input			A_invert;
	input			B_invert;
	input			cin;
	input	[2-1:0]	operation;

	output			result;
	output			cout;

	reg a,b,tmp;
//assignment
	assign result = tmp;
	assign cout = (a&b)|(a&cin)|(b&cin);

always@(*)begin
	if(A_invert == 1'b1) a = ~src1; else a = src1;
	if(B_invert == 1'b1) b = ~src2; else b = src2;
	case(operation)
		2'b00: tmp = a & b;
		2'b01: tmp = a | b;
		2'b10: tmp = a ^ b ^ cin;
		2'b11: tmp = less;
	endcase
 end

endmodule
