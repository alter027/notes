`timescale 1ns/1ps

module And(
	src1,          // 32 bits source 1          (input)
	src2,          // 32 bits source 2          (input)
	result,        // 32 bits result            (output)
	zero,          // 1 bit when the output is 0, zero must be set (output)
	cout,          // 1 bit carry out           (output)
	overflow       // 1 bit overflow            (output)
);

input	[32-1:0]	src1;
input	[32-1:0]	src2;

output	[32-1:0]	result;
output				zero;
output				cout;
output				overflow;

reg		[32-1:0]	ans;
reg a,b,c;

//alu_0_31 alu_0_31_0(src1,src2,result,zero,cout,overflow);
alu_top AT0(src1[0],src2[0],0,0,0,0,0,result[0],cout);

always@( * ) begin
	ans=result;
	if(ans == 0)
		a = 1;
end

assign zero = a;
assign cout = 0;
assign overflow = 0;

endmodule
