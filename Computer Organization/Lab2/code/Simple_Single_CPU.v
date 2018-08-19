//Subject:     CO project 2 - Simple Single CPU
//--------------------------------------------------------------------------------
//Version:     1
//--------------------------------------------------------------------------------
//Writer:      
//----------------------------------------------
//Date:        
//----------------------------------------------
//Description: 
//--------------------------------------------------------------------------------
module Simple_Single_CPU(
    clk_i,
	rst_i
	);
	
//I/O port
    input         clk_i;
    input         rst_i;

//Internal Signles
//first
    wire [32-1:0] Pc_ini;
    wire [32-1:0] Pc_out;
    wire [32-1:0] Addr_i1;
    wire [32-1:0] Addr_i2;
    wire [32-1:0] Add_1o;
    wire [32-1:0] Instr;
    wire regwrite,alusrc,regdst,branch;
    wire [3-1:0] alu_op;
//second
    wire [5-1:0] mux_1o;
    wire [32-1:0] Read_d1;
    wire [32-1:0] Read_d2;
    wire [32-1:0] Sign_ex;
    wire [4-1:0]alu_ct_o;
//third
    wire [32-1:0] alu_result;
    wire [32-1:0] Add_2o;
    wire [32-1:0] mux_2o;
    wire [32-1:0] mux_3o;
    wire [32-1:0] Shif_o;
    wire [32-1:0] shamt_result;
    wire zero;
    reg shamt;
//assign
reg br_and_ze;

//Greate componentes
//first
    ProgramCounter PC(
        .clk_i(clk_i),      
        .rst_i (rst_i),     
        .pc_in_i(mux_3o) ,   
        .pc_out_o(Pc_out) 
	    );
    Adder Adder1(
        .src1_i(32'd4),     
        .src2_i(Pc_out),     
        .sum_o(Add_1o)    
	    );
    Instr_Memory IM(
        .pc_addr_i(Pc_out),  
        .instr_o(Instr)    
	    );
//second
    Decoder Decoder(
        .instr_op_i(Instr[31:26]), 
        .RegWrite_o(regwrite),
        .ALU_op_o(alu_op),   
        .ALUSrc_o(alusrc),   
        .RegDst_o(regdst),   
        .Branch_o(branch)   
            );
    MUX_2to1 #(.size(5)) Mux_Write_Reg(
        .data0_i(Instr[20:16]),
        .data1_i(Instr[15:11]),
        .select_i(regdst),
        .data_o(mux_1o)
        );	
    Reg_File RF(
        .clk_i(clk_i),      
        .rst_i(rst_i) ,     
        .RSaddr_i(Instr[25:21]) ,  
        .RTaddr_i(Instr[20:16]) ,  
        .RDaddr_i(mux_1o) ,  
        .RDdata_i(alu_result)  , 
        .RegWrite_i (regwrite),
        .RSdata_o(Read_d1) ,  
        .RTdata_o(Read_d2)   
        );
    Sign_Extend SE(
        .data_i(Instr[15:0]),
        .data_o(Sign_ex)
        );
    ALU_Ctrl AC(
        .funct_i(Instr[5:0]),   
        .ALUOp_i(alu_op),   
        .ALUCtrl_o(alu_ct_o) 
        );
//third
    MUX_2to1 #(.size(32)) Mux_ALUSrc(
        .data0_i(Read_d2),
        .data1_i(Sign_ex),
        .select_i(alusrc),
        .data_o(mux_2o)
        );		
    ALU ALU(
        .src1_i(Read_d1),
        .src2_i(mux_2o),
        .shamt(Instr[10:6]),
        .ctrl_i(alu_ct_o),
        .result_o(alu_result),
        .zero_o(zero)
	    );
    Shift_Left_Two_32 Shifter(
        .ctrl_i(alu_ct_o),
        .data_i(Sign_ex),
        .data_o(Shif_o)
        );      
    Adder Adder2(
        .src1_i(Add_1o),     
        .src2_i(Shif_o),     
        .sum_o(Add_2o)      
	    );
    MUX_2to1 #(.size(32)) Mux_PC_Source(
        .data0_i(Add_1o),
        .data1_i(Add_2o),
        .select_i(zero&branch),
        .data_o(mux_3o)
        );


endmodule
	  


