module datapath(input  logic Clk, Reset,
					 input  logic [15:0] MDR_In,
					 input  logic [15:0] SW,
					 input  logic LD_MDR, LD_MAR, LD_PC, LD_IR, LD_CC, LD_BEN, LD_REG, LD_LED, MIO_EN,
					 input  logic GatePC, GateMDR, GateMARMUX, GateALU,
					 input  logic ADDR1MUX, DRMUX, SR1MUX, SR2MUX,
					 input  logic [1:0] PCMUX, ADDR2MUX, ALUK,
					 output logic [15:0] LED,
					 output logic [15:0] MDR, MAR, PC, IR, ALU,
					 output logic BEN );


logic [15:0] SEXT_10_OUT;
logic [15:0] SEXT_8_OUT;
logic [15:0] SEXT_5_OUT;
logic [15:0] SEXT_4_OUT;

logic [15:0] PC_Val, PCMUX_IN_new;
logic [15:0] BusOut, PC_MuxOut, MIO_EN_Out;

logic [15:0] ADDR1_MuxOut, ADDR2_MuxOut;

logic [15:0] SR2Mux_Out;

logic [15:0]  SR2OUT, SR1OUT;

logic [15:0] ALU_Out;

logic [2:0] SR1Mux_Out, DRMux_Out;

logic BENin;

assign LED = IR[9:0]; //not needed for now


// Assignments if needed
assign PC = PC_Val;
assign ALU = ALU_Out;
					 
Bus_Module bus(.inputPC(PC_Val),
					 .inputMAR(PCMUX_IN_new),
					 .inputMDR(MDR),
					 .inputALU(ALU_Out),
					 .GatePC,
					 .GateALU,
					 .GateMDR,
					 .GateMAR(GateMARMUX),
					 .Bus_Out(BusOut));					 
					 
reg_unit #(16) PC_reg(.Clk,
							 .Reset,
							 .Load(LD_PC),
							 .Din(PC_MuxOut),
							 .Data_Out(PC_Val));
					 
reg_unit #(16) MDR_reg(.Clk,
							  .Reset,
							  .Load(LD_MDR),
							  .Din(MIO_EN_Out),
							  .Data_Out(MDR));

reg_unit #(16) MAR_reg(.Clk,
							  .Reset,
							  .Load(LD_MAR),
							  .Din(BusOut),
							  .Data_Out(MAR));
					
reg_unit #(16) IR_reg(.Clk,
							 .Reset,
							 .Load(LD_IR),
							 .Din(BusOut),
							 .Data_Out(IR));
					
reg_unit #(1) BEN_Reg(.Clk,
							 .Reset,
							 .Load(LD_BEN),
							 .Din(BENin),
							 .Data_Out(BEN));
					
mux_3_1_16 PC_Mux(.A(PC_Val + 1'b1),
					  .B(BusOut),
					  .C(PCMUX_IN_new),
					  .SelectBit(PCMUX),
					  .Out(PC_MuxOut));

mux_2_1_16	MIO_Mux(.A(MDR_In),
						  .B(BusOut),
						  .SelectBit(MIO_EN),
						  .Out(MIO_EN_Out));
						  
// All SEXT's need to be made here
SEXT_10	sext_10_0(.In(IR[10:0]), .SEXT_OUT(SEXT_10_OUT));
SEXT_8	sext_8_0 (.In(IR[8 :0]), .SEXT_OUT(SEXT_8_OUT));
SEXT_5	sext_5_0 (.In(IR[5 :0]), .SEXT_OUT(SEXT_5_OUT));
SEXT_4	Sext_4_0 (.In(IR[4 :0]), .SEXT_OUT(SEXT_4_OUT));

// ADDER1MUX & ADDER2MUX
//mostly 5.2 stuff, before is 5.1
							 
mux_4_1_16	ADDR2_Mux(.A(16'b0),
							 .B(SEXT_5_OUT),
							 .C(SEXT_8_OUT),
							 .D(SEXT_10_OUT),
							 .SelectBit(ADDR2MUX),
							 .Out(ADDR2_MuxOut));
								

ALU_Logic	ALU_Unit     (.A(SR1OUT),
							     .B(SR2Mux_Out),
							     .ALUK(ALUK),
							     .ALU_out(ALU_Out));	

ALU_Logic	ADDR1_2_MUX(.A(ADDR1_MuxOut),
								 .B(ADDR2_MuxOut),
								 .ALUK(2'b00),
								 .ALU_out(PCMUX_IN_new));
				
				
reg_file     regFile    (.Clk,
						  .Reset,
						  .LD_REG,
						  .SR1_In(SR1Mux_Out),
						  .SR2_In(IR[2:0]),
						  .DR_In(DRMux_Out),
						  .SR1OUT,
						  .SR2OUT,
						  .Bus_In(BusOut));				 
								 
						  

mux_2_1_16	#(16)	ADDR1_Mux (.A(SR1OUT),
									  .B(PC),
									  .SelectBit(ADDR1MUX),
									  .Out(ADDR1_MuxOut));



mux_2_1_16	#(16) SR2_Mux (.A(SEXT_4_OUT),
								  .B(SR2OUT),
								  .SelectBit(SR2MUX),
								  .Out(SR2Mux_Out));

mux_2_1_16	#(3)  SR1_Mux (.A(IR[8 :6]),						
								  .B(IR[11:9]),
								  .SelectBit(SR1MUX),
								  .Out(SR1Mux_Out));
										
mux_2_1_16	#(3)	DR_Mux  (.A(3'b111),							
								  .B(IR[11:9]),
								  .SelectBit(DRMUX),
								  .Out(DRMux_Out));
								 	 

 
CC_Module	BENlogic    (.Clk,
							     .Reset,
							     .LD_CC,
							     .IR_Val(IR),
							     .Bus_in(BusOut),
							     .BEN_out(BENin));



endmodule
