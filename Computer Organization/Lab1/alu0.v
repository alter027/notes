`timescale 1ns/1ps

module alu(
	rst_n,         // negative reset            (input)
	src1,          // 32 bits source 1          (input)
	src2,          // 32 bits source 2          (input)
	ALU_control,   // 4 bits ALU control input  (input)
	bonus_control, // 3 bits bonus control input(input)
	result,        // 32 bits result            (output)
	zero,          // 1 bit when the output is 0, zero must be set (output)
	cout,          // 1 bit carry out           (output)
	overflow       // 1 bit overflow            (output)
);


input				rst_n;
input	[32-1:0]	src1;
input	[32-1:0]	src2;
input	[4-1:0]		ALU_control;
input	[3-1:0]		bonus_control;

output	[32-1:0]	result;
output				zero;
output				cout;
output				overflow;

reg		[32-1:0]	result;
reg					zero;
reg					cout;
reg					overflow;

integer i;

always@(ALU_control or bonus_control) begin
	result = 0;
	case(ALU_control)
		4'b0000: result = src1 & src2;
		4'b0001: result = src1 | src2;	
		4'b0010: result = src1 + src2;	
		4'b0110: result = src1 - src2;	
		4'b1100: result = ~(src1 | src2);	
		4'b1101: result = ~(src1 & src2);	
		4'b0111: begin
			if(src1<src2) result = 1;
			case(bonus_control)
				3'b000: if(src1<src2) result = 1;
				3'b001: if(src1<=src2) result = 1;
				3'b010: if(!src1==src2) result = 1;
				3'b011: if(src1!=src2) result = 1;
				3'b111: if(src1==src2) result = 1;
				3'b110: if(src1>src2) result = 1;
			endcase
		end
	endcase
end

endmodule
