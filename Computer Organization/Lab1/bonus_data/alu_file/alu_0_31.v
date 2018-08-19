`timescale 1ns/1ps

module alu_0_31(
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

wire		[32-1:0]	result;
wire					zero;
wire					cout;
wire					overflow;

reg a,b,c;
alu_top AT0(src1[0],src2[0],0,0,0,0,0,result[0],cout);
alu_top AT1(src1[1],src2[1],0,0,0,0,0,result[1],cout);
alu_top AT2(src1[2],src2[2],0,0,0,0,0,result[2],cout);
alu_top AT3(src1[3],src2[3],0,0,0,0,0,result[3],cout);
alu_top AT4(src1[4],src2[4],0,0,0,0,0,result[4],cout);
alu_top AT5(src1[5],src2[5],0,0,0,0,0,result[5],cout);
alu_top AT6(src1[6],src2[6],0,0,0,0,0,result[6],cout);
alu_top AT7(src1[7],src2[7],0,0,0,0,0,result[7],cout);
alu_top AT8(src1[8],src2[8],0,0,0,0,0,result[8],cout);
alu_top AT9(src1[9],src2[9],0,0,0,0,0,result[9],cout);
alu_top AT10(src1[10],src2[10],0,0,0,0,0,result[10],cout);
alu_top AT11(src1[11],src2[11],0,0,0,0,0,result[11],cout);
alu_top AT12(src1[12],src2[12],0,0,0,0,0,result[12],cout);
alu_top AT13(src1[13],src2[13],0,0,0,0,0,result[13],cout);
alu_top AT14(src1[14],src2[14],0,0,0,0,0,result[14],cout);
alu_top AT15(src1[15],src2[15],0,0,0,0,0,result[15],cout);
alu_top AT16(src1[16],src2[16],0,0,0,0,0,result[16],cout);
alu_top AT17(src1[17],src2[17],0,0,0,0,0,result[17],cout);
alu_top AT18(src1[18],src2[18],0,0,0,0,0,result[18],cout);
alu_top AT19(src1[19],src2[19],0,0,0,0,0,result[19],cout);
alu_top AT20(src1[20],src2[20],0,0,0,0,0,result[20],cout);
alu_top AT21(src1[21],src2[21],0,0,0,0,0,result[21],cout);
alu_top AT22(src1[22],src2[22],0,0,0,0,0,result[22],cout);
alu_top AT23(src1[23],src2[23],0,0,0,0,0,result[23],cout);
alu_top AT24(src1[24],src2[24],0,0,0,0,0,result[24],cout);
alu_top AT25(src1[25],src2[25],0,0,0,0,0,result[25],cout);
alu_top AT26(src1[26],src2[26],0,0,0,0,0,result[26],cout);
alu_top AT27(src1[27],src2[27],0,0,0,0,0,result[27],cout);
alu_top AT28(src1[28],src2[28],0,0,0,0,0,result[28],cout);
alu_top AT29(src1[29],src2[29],0,0,0,0,0,result[29],cout);
alu_top AT30(src1[30],src2[30],0,0,0,0,0,result[30],cout);
alu_top AT31(src1[31],src2[31],0,0,0,0,0,result[31],cout);

endmodule
