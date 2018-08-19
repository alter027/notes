//Subject:     CO project 2 - Decoder
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Decoder(
    instr_op_i,
	RegWrite_o,
	ALU_op_o,
	ALUSrc_o,
	RegDst_o,
	Branch_o,
	Jump_o,
	MemRead_o,
	MemWrite_o,
	MemtoReg_o,
	SetZero
	);
     
//I/O ports
	input  [6-1:0] instr_op_i;

	output         RegWrite_o;
	output [3-1:0] ALU_op_o;
	output         ALUSrc_o;
	output         RegDst_o;
	output         Branch_o;
	output		   Jump_o;
	output		   MemRead_o;
	output		   MemWrite_o;
	output [2-1:0] MemtoReg_o;
	output		   SetZero;
 
//Internal Signals
	reg    [3-1:0] ALU_op_o;
	reg            ALUSrc_o;
	reg            RegWrite_o;
	reg            RegDst_o;
	reg            Branch_o;
	reg            Jump_o;
	reg            MemRead_o;
	reg            MemWrite_o;
	reg    [2-1:0] MemtoReg_o;
	reg            SetZero;

//Parameter
//assign
//Main function
always@(instr_op_i) begin
//	$display("instr_op_i=%b", instr_op_i);
	case(instr_op_i)
		6'b000000: begin //R-type
			RegWrite_o = 1;
			ALU_op_o = 3'b000;
			ALUSrc_o = 0;
			RegDst_o = 1;
			Branch_o = 0;
			Jump_o = 0;
			MemRead_o = 0;
			MemWrite_o = 0;
			MemtoReg_o = 0;
			SetZero = 0;
		 end
		6'b001000: begin //addi
			RegWrite_o = 1;
			ALU_op_o = 3'b001;
			ALUSrc_o = 1;
			RegDst_o = 0;
			Branch_o = 0;
			Jump_o = 0;
			MemRead_o = 0;
			MemWrite_o = 0;
			MemtoReg_o = 0;
			SetZero = 0;
		 end
		6'b001011: begin //sltiu
		 //6'b001001: begin //set less than u
			RegWrite_o = 1;
			ALU_op_o = 3'b010;
			ALUSrc_o = 1;
			RegDst_o = 0;
			Branch_o = 0;
			Jump_o = 0;
			MemRead_o = 0;
			MemWrite_o = 0;
			MemtoReg_o = 0;
			SetZero = 0;
		 end
		6'b000100: begin //beq
			RegWrite_o = 0;
			ALU_op_o = 3'b011;
			ALUSrc_o = 0;
			RegDst_o = 0;
			Branch_o = 1;
			Jump_o = 0;
			MemRead_o = 0;
			MemWrite_o = 0;
			MemtoReg_o = 0;
			SetZero = 0;
		 end
		6'b001111: begin //lui
			RegWrite_o = 1;
			ALU_op_o = 3'b100;
			ALUSrc_o = 1;
			RegDst_o = 0;
			Branch_o = 0;
			Jump_o = 0;
			MemRead_o = 0;
			MemWrite_o = 0;
			MemtoReg_o = 0;
			SetZero = 0;
		 end
		6'b001101: begin //ori
			RegWrite_o = 1;
			ALU_op_o = 3'b101;
			ALUSrc_o = 1;
			RegDst_o = 0;
			Branch_o = 0;
			Jump_o = 0;
			MemRead_o = 0;
			MemWrite_o = 0;
			MemtoReg_o = 0;
			SetZero = 0;
		 end
		6'b000101: begin //bnq
			RegWrite_o = 0;
			ALU_op_o = 3'b110;
			ALUSrc_o = 0;
			RegDst_o = 0;
			Branch_o = 1;
			Jump_o = 0;
			MemRead_o = 0;
			MemWrite_o = 0;
			MemtoReg_o = 0;
			SetZero = 0;
		 end
		6'b000110: begin //ble
			RegWrite_o = 0;
			ALU_op_o = 3'b111;
			ALUSrc_o = 0;
			RegDst_o = 0;
			Branch_o = 1;
			Jump_o = 0;
			MemRead_o = 0;
			MemWrite_o = 0;
			MemtoReg_o = 0;
			SetZero = 0;
		 end
		/*6'b000101: begin //bnez
			RegWrite_o = 0;
			ALU_op_o = 3'b010;
			ALUSrc_o = 0;
			RegDst_o = 0;
			Branch_o = 1;
			Jump_o = 0;
			MemRead_o = 0;
			MemWrite_o = 0;
			MemtoReg_o = 0;
			SetZero = 1;
		 end*/
		6'b000001: begin //bltz
			RegWrite_o = 0;
			ALU_op_o = 3'b010;
			ALUSrc_o = 0;
			RegDst_o = 0;
			Branch_o = 1;
			Jump_o = 0;
			MemRead_o = 0;
			MemWrite_o = 0;
			MemtoReg_o = 0;
			SetZero = 1;
		 end
		6'b100011: begin //lw
			ALU_op_o = 3'b001;
			ALUSrc_o = 1;
			RegWrite_o = 1;
			RegDst_o = 0;
			Branch_o = 0;
			Jump_o = 0;
			MemRead_o = 1;
			MemWrite_o = 0;
			MemtoReg_o = 1;
			SetZero = 0;
		 end
		6'b101011: begin //sw
			RegWrite_o = 0;
			ALU_op_o = 3'b001;
			ALUSrc_o = 1;
			RegDst_o = 0;
			Branch_o = 0;
			Jump_o = 0;
			MemRead_o = 0;
			MemWrite_o = 1;
			MemtoReg_o = 0;
			SetZero = 0;
		 end
		6'b000010: begin //jump 
			RegWrite_o = 0;
			ALU_op_o = ALU_op_o; //don't care
			ALUSrc_o = 1;
			RegDst_o = 0;
			Branch_o = 0;
			Jump_o = 1;
			MemRead_o = 0;
			MemWrite_o = 0;
			MemtoReg_o = 0;
			SetZero = 0;
		 end
		6'b000011: begin //jal
			RegWrite_o = 1;
			ALU_op_o = ALU_op_o; //don't care
			ALUSrc_o = 1;
			RegDst_o = 0;
			Branch_o = 0;
			Jump_o = 1;
			MemRead_o = 0;
			MemWrite_o = 0;
			MemtoReg_o = 2;
			SetZero = 0;
		 end
	endcase
end

endmodule





                    
                    