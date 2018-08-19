`timescale 1ns/1ps

//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:15:11 08/18/2013
// Design Name:
// Module Name:    alu
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module alu(
           clk,           // system clock              (input)
           rst_n,         // negative reset            (input)
           src1,          // 32 bits source 1          (input)
           src2,          // 32 bits source 2          (input)
           ALU_control,   // 4 bits ALU control input  (input)
			  //bonus_control, // 3 bits bonus control input(input) 
           result,        // 32 bits result            (output)
           zero,          // 1 bit when the output is 0, zero must be set (output)
           cout,          // 1 bit carry out           (output)
           overflow       // 1 bit overflow            (output)
           );

parameter [4-1:0] AND = 4'b0000;
parameter [4-1:0] OR  = 4'b0001;
parameter [4-1:0] ADD = 4'b0010;
parameter [4-1:0] SUB = 4'b0110;
parameter [4-1:0] NOR = 4'b1100;
parameter [4-1:0] SLT = 4'b0111;

input           clk;
input           rst_n;
input  [32-1:0] src1;
input  [32-1:0] src2;
input   [4-1:0] ALU_control;
//input   [3-1:0] bonus_control; 

output [32-1:0] result;
output          zero;
output          cout;
output          overflow;

reg    [32-1:0] result;
reg             zero;
reg             cout;
reg             overflow;

wire   [32-1:0] temp;
wire   [32-1:0] out;
wire		set;
wire		first_in;

assign first_in = (ALU_control == SUB || ALU_control == SLT)?1'd1:1'd0;

genvar i;
generate
for(i = 0;i < 32;i = i+1) begin: generate_32_bit_ALU
	if(i == 0)
		alu_top alu_top(
               		.src1(src1[i]),       			//1 bit source 1 (input)
               		.src2(src2[i]),       			//1 bit source 2 (input)
               		.less(set),       			//1 bit less     (input)
               		.A_invert(ALU_control[3]),   		//1 bit A_invert (input)
               		.B_invert(ALU_control[2]),   		//1 bit B_invert (input)
              		.cin(first_in),  			//1 bit carry in (input)
               		.operation(ALU_control[1:0]),  		//operation      (input)
               		.result(temp[i]),     			//1 bit result   (output)
               		.cout(out[i])       			//1 bit carry out(output)
              	);
	else if(i <= 30)
		alu_top alu_top(
               		.src1(src1[i]),       			//1 bit source 1 (input)
               		.src2(src2[i]),       			//1 bit source 2 (input)
               		.less(1'd0),       			//1 bit less     (input)
               		.A_invert(ALU_control[3]),   		//1 bit A_invert (input)
               		.B_invert(ALU_control[2]),   		//1 bit B_invert (input)
              		.cin(out[i-1]),        			//1 bit carry in (input)
               		.operation(ALU_control[1:0]),  		//operation      (input)
               		.result(temp[i]),     			//1 bit result   (output)
               		.cout(out[i])       			//1 bit carry out(output)
              	);
	else
		alu_bottom alu_bottom(
               		.src1(src1[i]),       			//1 bit source 1 (input)
               		.src2(src2[i]),       			//1 bit source 2 (input)
               		.less(1'd0),       			//1 bit less     (input)
               		.A_invert(ALU_control[3]),   		//1 bit A_invert (input)
               		.B_invert(ALU_control[2]),   		//1 bit B_invert (input)
              		.cin(out[i-1]),        			//1 bit carry in (input)
               		.operation(ALU_control[1:0]),  		//operation      (input)
               		.result(temp[i]),     			//1 bit result   (output)
               		.cout(out[i]),       			//1 bit carry out(output)
			.set(set)				//1 bit set	 (output)
              	);
		end
endgenerate

always@( posedge clk or negedge rst_n ) 
begin
	if(!rst_n) begin
		result <= 32'd0;
		zero <= 1'd0;
		cout <= 1'd0;
		overflow <= 1'd0;
	end
	else begin
		result <= temp;
		zero <= (temp == 32'd0)?1'd1:1'd0;
		cout <= (ALU_control == SLT)?1'd0:out[32-1];
		overflow <= (ALU_control == SLT)?1'd0:out[32-1]^out[32-2];
	end
end

endmodule
