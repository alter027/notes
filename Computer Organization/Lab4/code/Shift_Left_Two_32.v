//Subject:      CO project 2 - Shift_Left_Two_32
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Description: 
//--------------------------------------------------------------------------------

module Shift_Left_Two_32(
    ctrl_i,
    data_i,
    data_o
    );

//I/O ports      
input [4-1:0]  ctrl_i;
input [32-1:0] data_i;
output [32-1:0] data_o;
reg [32-1:0] data_o;

//shift left 2  
always@(data_i)
begin
	data_o=data_i<<2;
	/*$display("data_i=%d, data_o=%d",data_i,data_o );
	$display("data_i=%d, data_o=%d",-data_i,-data_o );*/
end
endmodule
