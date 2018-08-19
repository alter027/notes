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

//variables
	input				rst_n;
	input	[32-1:0]	src1;
	input	[32-1:0]	src2;
	input	[4-1:0]		ALU_control;
	input	[3-1:0]		bonus_control;

	output	[32-1:0]	result;
	output				zero;
	output				cout;
	output				overflow;

	wire		[32-1:0]	tesult;
	wire		[32-1:0]	dout;
	wire		[1:0]		operation;
	reg		[32-1:0]	result;
	reg					zero;
	reg					cout;
	reg					overflow;

	reg		[1:0]		op;
	reg		iA,iB,cin,less;
//assignment
	assign A_invert = iA;
	assign B_invert = iB;
	assign operation = op;
//alu_top
	alu_top A0 (.src1(src1[0]),.src2(src2[0]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(cin),.operation(operation),.result(tesult[0]),.cout(dout[0]));
	alu_top A1 (.src1(src1[1]),.src2(src2[1]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[0]),.operation(operation),.result(tesult[1]),.cout(dout[1]));
	alu_top A2 (.src1(src1[2]),.src2(src2[2]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[1]),.operation(operation),.result(tesult[2]),.cout(dout[2]));
	alu_top A3 (.src1(src1[3]),.src2(src2[3]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[2]),.operation(operation),.result(tesult[3]),.cout(dout[3]));
	alu_top A4 (.src1(src1[4]),.src2(src2[4]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[3]),.operation(operation),.result(tesult[4]),.cout(dout[4]));
	alu_top A5 (.src1(src1[5]),.src2(src2[5]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[4]),.operation(operation),.result(tesult[5]),.cout(dout[5]));
	alu_top A6 (.src1(src1[6]),.src2(src2[6]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[5]),.operation(operation),.result(tesult[6]),.cout(dout[6]));
	alu_top A7 (.src1(src1[7]),.src2(src2[7]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[6]),.operation(operation),.result(tesult[7]),.cout(dout[7]));
	alu_top A8 (.src1(src1[8]),.src2(src2[8]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[7]),.operation(operation),.result(tesult[8]),.cout(dout[8]));
	alu_top A9 (.src1(src1[9]),.src2(src2[9]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[8]),.operation(operation),.result(tesult[9]),.cout(dout[9]));
	alu_top A10 (.src1(src1[10]),.src2(src2[10]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[9]),.operation(operation),.result(tesult[10]),.cout(dout[10]));
	alu_top A11 (.src1(src1[11]),.src2(src2[11]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[10]),.operation(operation),.result(tesult[11]),.cout(dout[11]));
	alu_top A12 (.src1(src1[12]),.src2(src2[12]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[11]),.operation(operation),.result(tesult[12]),.cout(dout[12]));
	alu_top A13 (.src1(src1[13]),.src2(src2[13]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[12]),.operation(operation),.result(tesult[13]),.cout(dout[13]));
	alu_top A14 (.src1(src1[14]),.src2(src2[14]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[13]),.operation(operation),.result(tesult[14]),.cout(dout[14]));
	alu_top A15 (.src1(src1[15]),.src2(src2[15]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[14]),.operation(operation),.result(tesult[15]),.cout(dout[15]));
	alu_top A16 (.src1(src1[16]),.src2(src2[16]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[15]),.operation(operation),.result(tesult[16]),.cout(dout[16]));
	alu_top A17 (.src1(src1[17]),.src2(src2[17]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[16]),.operation(operation),.result(tesult[17]),.cout(dout[17]));
	alu_top A18 (.src1(src1[18]),.src2(src2[18]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[17]),.operation(operation),.result(tesult[18]),.cout(dout[18]));
	alu_top A19 (.src1(src1[19]),.src2(src2[19]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[18]),.operation(operation),.result(tesult[19]),.cout(dout[19]));
	alu_top A20 (.src1(src1[20]),.src2(src2[20]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[19]),.operation(operation),.result(tesult[20]),.cout(dout[20]));
	alu_top A21 (.src1(src1[21]),.src2(src2[21]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[20]),.operation(operation),.result(tesult[21]),.cout(dout[21]));
	alu_top A22 (.src1(src1[22]),.src2(src2[22]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[21]),.operation(operation),.result(tesult[22]),.cout(dout[22]));
	alu_top A23 (.src1(src1[23]),.src2(src2[23]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[22]),.operation(operation),.result(tesult[23]),.cout(dout[23]));
	alu_top A24 (.src1(src1[24]),.src2(src2[24]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[23]),.operation(operation),.result(tesult[24]),.cout(dout[24]));
	alu_top A25 (.src1(src1[25]),.src2(src2[25]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[24]),.operation(operation),.result(tesult[25]),.cout(dout[25]));
	alu_top A26 (.src1(src1[26]),.src2(src2[26]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[25]),.operation(operation),.result(tesult[26]),.cout(dout[26]));
	alu_top A27 (.src1(src1[27]),.src2(src2[27]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[26]),.operation(operation),.result(tesult[27]),.cout(dout[27]));
	alu_top A28 (.src1(src1[28]),.src2(src2[28]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[27]),.operation(operation),.result(tesult[28]),.cout(dout[28]));
	alu_top A29 (.src1(src1[29]),.src2(src2[29]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[28]),.operation(operation),.result(tesult[29]),.cout(dout[29]));
	alu_top A30 (.src1(src1[30]),.src2(src2[30]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[29]),.operation(operation),.result(tesult[30]),.cout(dout[30]));
	alu_top A31 (.src1(src1[31]),.src2(src2[31]),.less(less), .A_invert(A_invert),.B_invert(B_invert),.cin(dout[30]),.operation(operation),.result(tesult[31]),.cout(dout[31]));

always@(*)begin//control
	if(rst_n)
	begin
	case(ALU_control)
		4'b0000: begin iA=0; iB=0; cin=0; op=2'b00; end
		4'b0001: begin iA=0; iB=0; cin=0; op=2'b01; end
		4'b0010: begin iA=0; iB=0; cin=0; op=2'b10; end
		4'b0110: begin iA=0; iB=1; cin=1; op=2'b10; end
		4'b1100: begin iA=1; iB=1; cin=0; op=2'b00; end
		4'b1101: begin iA=1; iB=1; cin=0; op=2'b01; end
		4'b0111: begin
			case(bonus_control)
			3'b000: begin iA=0;iB=1;cin=1;op=2'b11; end 
			3'b001: begin iA=1;iB=0;cin=1;op=2'b11; end
			3'b010: begin iA=0;iB=0;cin=0;op=2'b11; end
			3'b011: begin iA=0;iB=0;cin=0;op=2'b11; end
			3'b111: begin iA=1;iB=0;cin=1;op=2'b11; end
			3'b110: begin iA=0;iB=1;cin=1;op=2'b11; end
			endcase
		end
		default: begin cin=0; iA=0; iB=0; op=2'b00; end
	endcase
	end
 end
always@(*)begin//zero
	if(result==32'b0)
		zero=1'b1;
	else
		zero=1'b0;
 end
always@(*)begin//cout
	if(rst_n&&dout[31]==1'b1)
		case(ALU_control)
		4'b0010: cout=1'b1;
		4'b0110: cout=1'b1;
		//4'b0111: cout=1'b1;
		default: cout=1'b0;
		endcase
	else cout=1'b0;
 end
always@(*)begin//overflow
	if(rst_n&&dout[31]==1'b1)
		case(ALU_control)
		4'b0010: overflow=1'b1;
		//4'b0110: overflow=1'b1;
		4'b0111: overflow=1'b1;
		default: overflow=1'b0;
		endcase
	else if(rst_n&&dout[31]==1'b0&&ALU_control==4'b0110)
		overflow=1'b1;
	else overflow=1'b0;
 end
always@(*)begin//result
	if(rst_n)begin
		if(ALU_control==4'b0111) begin
		result=32'b0;
		case(bonus_control)
		3'b000: begin if(tesult!=32'b0&&dout[31]==1'b0) 
		result[0]=1'b1; end 
		3'b001: begin if(dout[31]==1'b1) 
		result[0]=1'b1; end 
		3'b010: begin if(tesult==32'b0) 
		result[0]=1'b1; end 
		3'b011: begin if(tesult!=32'b0) 
		result[0]=1'b1; end 
		3'b111: begin if(dout[31]==1'b0) 
		result[0]=1'b1; end 
		3'b110: begin if(tesult!=32'b0&&dout[31]==1'b1) 
		result[0]=1'b1; end 
		endcase
		end
		else result=tesult;
	end
 end

endmodule
