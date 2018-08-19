module ALU(rst_n,src1,src2,ALU_control,result,zero,cout,overflow);
	input rst_n;
	input [31:0]src1,src2;
	input [3:0]ALU_control;
	output [31:0]result;
	output zero,cout,overflow;
	always@(src1,src2,ALU_control)begin
		if(rst_n)begin
			case(ALU_control)
				4'b0000:result<=src1&src2; //And
				4'b0001:result<=src1|src2; //Or
				4'b0010:begin     //Addu
					{cout,result}=src1+src2; 
						if(result[32:31]==(2'b11|2'b10))overflow <= 1'b1;
		            else overflow <= 1'b0;
				end
				4'b0110:begin     //Subu
					{cout,result}=src1+(~src2+1); 
					if((result[32+32])&&(~result [32+31:31] != 0)) overflow <= 1'b1;
		            else if((~result[32+32])&&(result [32+31:31] != 0)) overflow <= 1'b1;
					else overflow <= 1'b0;
				end	
				4'b1100:result=~(src1|src2); //Nor
				4'b1101:result=~(src1&src2); //Nand
				4'b0111:begin			//sltu	
					if(src1<src2) begin
						result<=src1<src2;
					end else begin
						result<=src1>src2;
					end	
				end	
			endcase
		end	
	end				
	always@(result)begin
		if(result==32'b00000000000000000000000000000000)begin
			zero<=1'b1;
		end else begin
			zero<=1'b0;
		end
		if(result[31:0])begin

		end
	end	
endmodule