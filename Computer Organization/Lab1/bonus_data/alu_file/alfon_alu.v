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
	input           rst_n;
	input  [32-1:0] src1;
	input  [32-1:0] src2;
	input   [4-1:0] ALU_control;
	input   [3-1:0] bonus_control; 

	output          result;
	output          zero;
	output          cout;
	output          overflow;

	wire   [32-1:0] result;
	wire   [32-1:0] trans_cout;
	wire    [2-1:0] operation;
	wire 			out31;
	reg             cout;
	reg             zero;
	reg             overflow;

//assign for basic   (reg to wire)
	reg             t_A_invert;
	reg             t_B_invert;
	reg    [2-1:0]  t_operation;
	reg             t_less;
	reg             t_cin;

//parameter for bonus
	parameter Slt=3'b000;//Set less than
	parameter Sgt=3'b001;//Set great than
	parameter Sle=3'b010;//Set less equal
	parameter Sge=3'b011;//Set great equal
	parameter Seq=3'b110;//Set equal
	parameter Sne=3'b100;//Set not equal
	//reg for bonus
	//assign for basic
	assign cin = t_cin;
	assign A_invert = t_A_invert;
	assign B_invert = t_B_invert;
	assign operation = t_operation;
	assign less = t_less;
	//assign for bonus
	//call the alu one bit model
//alu_top
	alu_top bit0 (.src1(src1[0 ]),.src2(src2[0 ]),.less(less),.A_invert(A_invert),.B_invert(B_invert),.cin(cin),           .operation(operation),.result(result[0 ]),.cout(trans_cout[0 ]));
	alu_top bit1 (.src1(src1[1 ]),.src2(src2[1 ]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[0 ]),.operation(operation),.result(result[1 ]),.cout(trans_cout[1 ]));
	alu_top bit2 (.src1(src1[2 ]),.src2(src2[2 ]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[1 ]),.operation(operation),.result(result[2 ]),.cout(trans_cout[2 ]));
	alu_top bit3 (.src1(src1[3 ]),.src2(src2[3 ]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[2 ]),.operation(operation),.result(result[3 ]),.cout(trans_cout[3 ]));
	alu_top bit4 (.src1(src1[4 ]),.src2(src2[4 ]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[3 ]),.operation(operation),.result(result[4 ]),.cout(trans_cout[4 ]));
	alu_top bit5 (.src1(src1[5 ]),.src2(src2[5 ]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[4 ]),.operation(operation),.result(result[5 ]),.cout(trans_cout[5 ]));
	alu_top bit6 (.src1(src1[6 ]),.src2(src2[6 ]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[5 ]),.operation(operation),.result(result[6 ]),.cout(trans_cout[6 ]));
	alu_top bit7 (.src1(src1[7 ]),.src2(src2[7 ]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[6 ]),.operation(operation),.result(result[7 ]),.cout(trans_cout[7 ]));
	alu_top bit8 (.src1(src1[8 ]),.src2(src2[8 ]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[7 ]),.operation(operation),.result(result[8 ]),.cout(trans_cout[8 ]));
	alu_top bit9 (.src1(src1[9 ]),.src2(src2[9 ]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[8 ]),.operation(operation),.result(result[9 ]),.cout(trans_cout[9 ]));
	alu_top bit10(.src1(src1[10]),.src2(src2[10]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[9 ]),.operation(operation),.result(result[10]),.cout(trans_cout[10]));
	alu_top bit11(.src1(src1[11]),.src2(src2[11]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[10]),.operation(operation),.result(result[11]),.cout(trans_cout[11]));
	alu_top bit12(.src1(src1[12]),.src2(src2[12]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[11]),.operation(operation),.result(result[12]),.cout(trans_cout[12]));
	alu_top bit13(.src1(src1[13]),.src2(src2[13]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[12]),.operation(operation),.result(result[13]),.cout(trans_cout[13]));
	alu_top bit14(.src1(src1[14]),.src2(src2[14]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[13]),.operation(operation),.result(result[14]),.cout(trans_cout[14]));
	alu_top bit15(.src1(src1[15]),.src2(src2[15]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[14]),.operation(operation),.result(result[15]),.cout(trans_cout[15]));
	alu_top bit16(.src1(src1[16]),.src2(src2[16]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[15]),.operation(operation),.result(result[16]),.cout(trans_cout[16]));
	alu_top bit17(.src1(src1[17]),.src2(src2[17]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[16]),.operation(operation),.result(result[17]),.cout(trans_cout[17]));
	alu_top bit18(.src1(src1[18]),.src2(src2[18]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[17]),.operation(operation),.result(result[18]),.cout(trans_cout[18]));
	alu_top bit19(.src1(src1[19]),.src2(src2[19]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[18]),.operation(operation),.result(result[19]),.cout(trans_cout[19]));
	alu_top bit20(.src1(src1[20]),.src2(src2[20]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[19]),.operation(operation),.result(result[20]),.cout(trans_cout[20]));
	alu_top bit21(.src1(src1[21]),.src2(src2[21]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[20]),.operation(operation),.result(result[21]),.cout(trans_cout[21]));
	alu_top bit22(.src1(src1[22]),.src2(src2[22]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[21]),.operation(operation),.result(result[22]),.cout(trans_cout[22]));
	alu_top bit23(.src1(src1[23]),.src2(src2[23]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[22]),.operation(operation),.result(result[23]),.cout(trans_cout[23]));
	alu_top bit24(.src1(src1[24]),.src2(src2[24]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[23]),.operation(operation),.result(result[24]),.cout(trans_cout[24]));
	alu_top bit25(.src1(src1[25]),.src2(src2[25]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[24]),.operation(operation),.result(result[25]),.cout(trans_cout[25]));
	alu_top bit26(.src1(src1[26]),.src2(src2[26]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[25]),.operation(operation),.result(result[26]),.cout(trans_cout[26]));
	alu_top bit27(.src1(src1[27]),.src2(src2[27]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[26]),.operation(operation),.result(result[27]),.cout(trans_cout[27]));
	alu_top bit28(.src1(src1[28]),.src2(src2[28]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[27]),.operation(operation),.result(result[28]),.cout(trans_cout[28]));
	alu_top bit29(.src1(src1[29]),.src2(src2[29]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[28]),.operation(operation),.result(result[29]),.cout(trans_cout[29]));
	alu_top bit30(.src1(src1[30]),.src2(src2[30]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[29]),.operation(operation),.result(result[30]),.cout(trans_cout[30]));
	alu_top bit31(.src1(src1[31]),.src2(src2[31]),.less(1'b0),.A_invert(A_invert),.B_invert(B_invert),.cin(trans_cout[30]),.operation(operation),.result(result[31]),.cout(trans_cout[31]),.out31(out31));

always@(*)begin
    if(rst_n)
	begin
      case(ALU_control)
        4'b0000:
		begin
		  t_cin=0;
		  t_A_invert=0;
		  t_B_invert=0;
		  t_operation=2'b00;
		end
        4'b0001:
		begin
		  t_cin=0;
		  t_A_invert=0;
		  t_B_invert=0;
		  t_operation=2'b01;  
		end
        4'b0010:
		begin
		  t_cin=0;
		  t_A_invert=0;
		  t_B_invert=0;
		  t_operation=2'b10;  
		end
        4'b0110:
		begin
		  t_cin=1;
		  t_A_invert=0;
		  t_B_invert=1;
		  t_operation=2'b10;  
		end
		4'b1100:
		begin
		  t_cin=0;
		  t_A_invert=1;
		  t_B_invert=1;
		  t_operation=2'b00;  
		end
		4'b1101:
		begin
		  t_cin=0;
		  t_A_invert=1;
		  t_B_invert=1;
		  t_operation=2'b01; 
		end
		4'b0111:
		begin
			case(bonus_control)
			Slt: begin
				t_cin=1;
				t_A_invert=0;
				t_B_invert=1;
				t_operation=2'b11;
			end
			Sgt: begin
				t_cin=1;
				t_A_invert=0;
				t_B_invert=1;
				t_operation=2'b11;
			end
			Sle: begin
				t_cin=1;
				t_A_invert=0;
				t_B_invert=1;
				t_operation=2'b11;
			end
			Sge: begin
				t_cin=1;
				t_A_invert=0;
				t_B_invert=1;
				t_operation=2'b11;
			end
			Seq: begin
				t_cin=1;
				t_A_invert=0;
				t_B_invert=1;
				t_operation=2'b11;
			end
			Sne: begin
				t_cin=1;
				t_A_invert=0;
				t_B_invert=1;
				t_operation=2'b11;
			end
			default: begin
				t_cin=1;
				t_A_invert=0;
				t_B_invert=1;
				t_operation=2'b11;
			end
			endcase
		end
		default:
		begin
		  t_cin=0;
		  t_A_invert=0;
		  t_B_invert=0;
		  t_operation=2'b00;
		end
	endcase
    end
 end

 //set less then 
always@(*) begin
	if(rst_n&&(out31^overflow)) //slt
	begin
		t_less=1'b1;
	end
	else if(rst_n&&(!out31&&!overflow))
	begin
		t_less=1'b1;
	end
	else if(rst_n&&!(!out31&&!overflow))
	begin
		t_less=1'b1;
	end
	else if(rst_n&&!(out31^overflow))
	begin
		t_less=1'b1;
	end
	else if(rst_n&&result==32'b0)
	begin
		t_less=1'b1;
	end
	else if(rst_n&&result!=32'b0)
	begin
		t_less=1'b1;
	end
	else
    begin
		t_less=1'b0;
	end
 end
always@(*) begin
	if(rst_n)
		cout=trans_cout[31];
	else
		cout=0;	
 end
always@(*)begin
    if(rst_n&&result==32'b0)
		zero=1;
	else
		zero=0;
 end
always@(*)begin
  if(rst_n&&(ALU_control==4'b0010||ALU_control==4'b0110))
    if(trans_cout[31]^trans_cout[30])
		overflow=1;
	else
		overflow=0;
	else
		overflow=0;
 end
 
endmodule