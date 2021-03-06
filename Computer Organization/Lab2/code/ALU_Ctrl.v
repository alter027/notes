//Subject:     CO project 2 - ALU Controller
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module ALU_Ctrl(
          funct_i,
          ALUOp_i,
          ALUCtrl_o
          );
          
//I/O ports 
input      [6-1:0] funct_i;
input      [3-1:0] ALUOp_i;

output     [4-1:0] ALUCtrl_o;    
     
//Internal Signals
reg        [4-1:0] ALUCtrl_o;

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
	alu_srav=4'd10;
//Select exact operation

always@(*)
begin
	case(ALUOp_i)
	3'b000:begin    // R-Type
	    case(funct_i)
	    	6'b100001:ALUCtrl_o=alu_add;
	    	6'b100011:ALUCtrl_o=alu_sub;
	    	6'b100100:ALUCtrl_o=alu_and;
	    	6'b100101:ALUCtrl_o=alu_or;
	    	6'b101010:ALUCtrl_o=alu_slt;
	    	6'b000011:ALUCtrl_o=alu_sra;
	    	6'b000111:ALUCtrl_o=alu_srav;
		endcase		
	 end//however the addi version
	3'b001:begin   	// addi
		ALUCtrl_o=alu_add;
	 end//however the beq version
	3'b010:begin	// sltiu
	    ALUCtrl_o=alu_slt;	
	 end
	3'b011:begin 	// beq
		ALUCtrl_o=alu_beq; 
	 end//however the beq version
	3'b100:begin 	// lup
		ALUCtrl_o=alu_lup; 
	 end
	3'b101:begin 	// ori
		ALUCtrl_o=alu_or;
	 end
	3'b110:begin 	// bne
		ALUCtrl_o=alu_bne;
	 end
	endcase
end

endmodule     





                    
                    