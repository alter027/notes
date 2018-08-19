//Subject:     CO project 2 - Sign extend
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Sign_Extend(
    data_i,
    data_o
    );
               
//I/O ports
input   [16-1:0] data_i;
output  [32-1:0] data_o;

//Internal Signals
reg     [32-1:0] data_o;

//Sign extended
always@(data_i)
begin
	if(data_i[15]==1'b0) begin
		data_o=0;
		data_o[15:0]=data_i;
	end
	else begin
		data_o=-1;
		data_o[15:0]=data_i;
	end
end
endmodule      
     