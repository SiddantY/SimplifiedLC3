module Bus_Module(input  logic [15:0] inputPC, inputMAR, inputMDR, inputALU,
						input	 logic GatePC, GateALU, GateMDR, GateMAR,
						output logic [15:0] Bus_Out);

always_comb
begin
	if(GatePC) begin
		Bus_Out = inputPC; end
		
	else if(GateALU) begin
		Bus_Out = inputALU; end
		
	else if(GateMDR) begin
		Bus_Out = inputMDR; end
		
	else if(GateMAR) begin
		Bus_Out = inputMAR; end
		
	else begin
		Bus_Out = 16'hABCD; end
end
						
endmodule
