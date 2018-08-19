`timescale 1ns/1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:30:01 04/05/2018
// Design Name: 
// Module Name:    alu_bottom 
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

module alu_bottom(
              	src1,       //1 bit source 1 (input)
              	src2,       //1 bit source 2 (input)
              	less,       //1 bit less     (input)
               	A_invert,   //1 bit A_invert (input)
               	B_invert,   //1 bit B_invert (input)
             	cin,        //1 bit carry in (input)
              	operation,  //operation      (input)
              	result,     //1 bit result   (output)
               	cout,       //1 bit carry out(output)
              	set	    //1 bit set	    (output)
               	);

parameter [1:0] AND  = 2'd0;
parameter [1:0] OR = 2'd1;
parameter [1:0] ADD = 2'd2;
parameter [1:0] SLT  = 2'd3;

input         src1;
input         src2;
input         less;
input         A_invert;
input         B_invert;
input         cin;
input [2-1:0] operation;

output        result;
output        cout;
output 	      set;

reg           result;
reg	      cout;
reg	      set;

wire	      src1_temp;
wire	      src2_temp;

assign src1_temp = (A_invert)?~src1:src1;
assign src2_temp = (B_invert)?~src2:src2;

always@( src1_temp or src2_temp or operation or cin)
begin
	cout = 1'd0;
	case(operation)
		AND: begin
			result = src1_temp & src2_temp;
		end
		OR:  begin
			result = src1_temp | src2_temp;
		end
		ADD: begin
			result = src1_temp ^ src2_temp ^ cin;
			cout = (src1_temp & src2_temp) | (src1_temp & cin) | (src2_temp & cin);
		end
		SLT: begin
			result = less;
			cout = (src1_temp & src2_temp) | (src1_temp & cin) | (src2_temp & cin);
			set = src1_temp ^ src2_temp ^ cout;
		end
	endcase
end

endmodule
