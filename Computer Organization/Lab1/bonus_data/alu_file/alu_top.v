`timescale 1ns/1ps

module alu_top(
	src1,       //1 bit source 1 (input)
	src2,       //1 bit source 2 (input)
	less,       //1 bit less     (input)
	A_invert,   //1 bit A_invert (input)
	B_invert,   //1 bit B_invert (input)
	cin,        //1 bit carry in (input)
	operation,  //operation      (input)
	result,     //1 bit result   (output)
	cout        //1 bit carry out(output)
);

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

always@( * )
begin
	if(A_invert == 1'b1)
		a = ~src1;
	if(B_invert == 1'b1)
		b = ~src2;
	case(operation)
		2'b00: tmp = src1 & src2;
		2'b01: tmp = src1 | src2;
		2'b10: tmp = src1 ^ src2 ^ cin;
		2'b11: tmp = less;
	endcase
end

assign result = tmp;
assign cout = src1 & src2;

endmodule
