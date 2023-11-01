module ALU_Logic(input  logic [1 :0] ALUK,
					  input  logic [15:0] A, B,
					  output logic [15:0] ALU_out);
					  
always_comb
	begin
	
		if(ALUK == 2'b00) begin
			ALU_out = A + B; end
		
		else if(ALUK == 2'b01) begin
			ALU_out = A & B; end
		
		else if(ALUK == 2'b10) begin
			ALU_out = ~A; end
		
		else if(ALUK == 2'b11) begin
			ALU_out = A; end
	
		else begin
			ALU_out = 16'hxxxx; end
	end				  
					  
endmodule
