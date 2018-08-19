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
        wire regwrite,alusrc,regdst,setzero,branch;
        wire [32-1:0] Mux_MemtoReg_data_o; 
        wire [32-1:0] Mux_MemtoJal_data_o; 
        wire [3-1:0] alu_op;
        wire          Jump;
        wire          MemRead;
        wire          MemWrite;
        wire [2-1:0]  MemtoReg;
    //second
        wire [5-1:0] mux_1o;
        wire [32-1:0] Read_d1;
        wire [32-1:0] Read_d2;
        wire [32-1:0] Sign_ex;
        wire [4-1:0] alu_ct_o;
        wire [5-1:0] RegWrite_i;
    //third
        wire [32-1:0] src; 
        wire [32-1:0] alu_result;
        wire [32-1:0] Add_2o;
        wire [32-1:0] mux_2o;
        wire [32-1:0] mux_3o;
        wire [32-1:0] Shif_o;
        wire [32-1:0] shamt_result;
        wire [32-1:0] mux_branch;
        wire zero;
        reg shamt;
        wire [28-1:0] jump_shifter_data_o;
        wire [32-1:0] jump_address;
        wire [32-1:0] MemData_o;
        wire branch_jr;
//assign
reg br_and_ze;          
assign jump_address = {Add_1o[31:28],jump_shifter_data_o};

//Greate componentes
//first
    ProgramCounter PC(
        .clk_i(clk_i),      
        .rst_i (rst_i),     
        .pc_in_i(mux_3o) ,   
        .pc_out_o(Pc_out) 
	    );
    Adder Adder1(
        .src1_i(Pc_out),     
        .src2_i(32'd4),     
        .sum_o(Add_1o)    
	    );
    Instr_Memory IM(
        //.pc_addr_i(Pc_out),  
        .addr_i(Pc_out),
        .instr_o(Instr)    
	    );        
//second
    Decoder Decoder(
        .instr_op_i(Instr[31:26]), 
        .RegWrite_o(regwrite),
        .ALU_op_o(alu_op),   
        .ALUSrc_o(alusrc),   
        .RegDst_o(regdst),   
        .Branch_o(branch),
        .Jump_o(Jump),
        .MemRead_o(MemRead),
        .MemWrite_o(MemWrite),
        .MemtoReg_o(MemtoReg),
        .SetZero(setzero)
        ); 
    MUX_2to1 #(.size(5)) Mux_Write_Reg(
        .data0_i(Instr[20:16]),
        .data1_i(Instr[15:11]),
        .select_i(regdst),
        .data_o(mux_1o)
        );  
    MUX_2to1 #(.size(5)) Mux_Write_Reg1(
        .data0_i(mux_1o),
        .data1_i(5'b11111),
        .select_i(MemtoReg[1]),
        .data_o(RegWrite_i)
        );  
    Reg_File RF(
        .clk_i(clk_i),      
        .rst_i(rst_i) ,     
        .RSaddr_i(Instr[25:21]) ,  
        .RTaddr_i(Instr[20:16]) ,  
        .RDaddr_i(RegWrite_i) ,  
        //.RDdata_i(alu_result)  , 
        .RDdata_i(Mux_MemtoReg_data_o)  , 
        .RegWrite_i(regwrite),
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
        .ALUCtrl_o(alu_ct_o),
        .branch_jr(branch_jr) 
        );
//third
    MUX_2to1 #(.size(32)) Mux_ALUSrc(
        .data0_i(Read_d2),
        .data1_i(Sign_ex),
        .select_i(alusrc),
        .data_o(src)
        );      
    MUX_2to1 #(.size(32)) Mux_setzero(
        .data0_i(src),
        .data1_i(0),
        .select_i(setzero),
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
    MUX_2to1 #(.size(32)) Mux_branch(
        .data0_i(Add_2o),
        .data1_i(Read_d1),
        .select_i(branch_jr),
        .data_o(mux_branch)
        );
    MUX_2to1 #(.size(32)) Mux_PC_Source(
        .data0_i(Add_1o),
        .data1_i(mux_branch),
        .select_i((zero&branch)||branch_jr),
        .data_o(Pc_ini)
        );
    Data_Memory Data_Memory(
          .clk_i(clk_i),
          .addr_i(alu_result),
          .data_i(Read_d2),
          .MemRead_i(MemRead),
          .MemWrite_i(MemWrite),
          .data_o(MemData_o)
          );
    MUX_2to1 #(.size(32)) Mux_MemtoReg(
        .data0_i(alu_result),
        .data1_i(MemData_o),
        .select_i(MemtoReg[0]),
        .data_o(Mux_MemtoJal_data_o)
        );
    MUX_2to1 #(.size(32)) Mux_jal(
        .data0_i(Mux_MemtoJal_data_o),
        .data1_i(Add_1o),
        .select_i(MemtoReg[1]),
        .data_o(Mux_MemtoReg_data_o)
        );
    Jump_Shifter Jump_shifter(
        .data_i(Instr[25:0]),
        .data_o(jump_shifter_data_o)
        );
    MUX_2to1 #(.size(32)) PC_Jump(
        .data0_i(Pc_ini),
        .data1_i(jump_address),
        .select_i(Jump),
        .data_o(mux_3o)
        );

    //$display("Instr=%b", Instr);

/*always@(branch_jr)begin
    $display("zero=%d,branch=%d,branch_jr=%d",zero,branch,branch_jr);
end*/

endmodule
	  


