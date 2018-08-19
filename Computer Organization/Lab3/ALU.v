//Subject:     CO project 2 - ALU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
//Line 49 66
module ALU(
    src1_i,
	src2_i,
	shamt,
	ctrl_i,
	result_o,
	zero_o
	);
     
//I/O ports
input  signed [32-1:0]  src1_i;
input  signed [32-1:0]	 src2_i;
input  signed [5-1:0]	 shamt;
input  [4-1:0]   ctrl_i;

output [32-1:0]	 result_o;
output           zero_o;

//Internal signals
reg	   signed [32-1:0]  pic;
reg    signed [32-1:0]  result_o;
reg    signed      zero_o;


//Parameter
localparam
 	alu_add=4'd0,
	alu_sub=4'd1,
    alu_and=4'd2,
    alu_or=4'd3,
    alu_slt=4'd4,
	alu_beq=4'd5,
	alu_sra=4'd6,
	alu_lui=4'd7,
	alu_bne=4'd8,
	alu_lup=4'd9,
	alu_srav=4'd10,
	alu_mul=4'd11,
	alu_ble=4'd12,
	alu_zero=4'd13;

//Main function
always@(ctrl_i,src1_i,src2_i)begin
	pic = src2_i;
	case(ctrl_i)
		0: result_o = src1_i + src2_i;
		1: result_o = src1_i - src2_i;
		2: result_o = src1_i & src2_i;
		3: result_o = src1_i | src2_i;
		4: result_o = (src1_i < src2_i) ? 1 : 0;
		5: result_o = (src1_i == src2_i) ? 1 : 0;
		6: result_o = pic >>> shamt;
		7: result_o = src2_i << 16;
		8: result_o = (src1_i != src2_i) ? 1 : 0;
		9: result_o = src2_i;
		10: result_o = pic >>> src1_i;
		11: result_o = src1_i*src2_i; //mul
		12: result_o = !(src1_i > src2_i) ? 1 : 0;
		13: result_o = 0;
		default: result_o <= 0;
	endcase
	if(result_o == 1) begin
		zero_o=1;
	 end
	else begin
		zero_o=0;
	 end
	//$display("**shamt=%d,src2_i=%d,ctrl_i=%d,reult_o=%d ",shamt,src2_i,ctrl_i,result_o);
end

endmodule





                    
                    