module CC_Module(input  logic Clk, Reset, LD_CC,
					  input  logic [15:0] IR_Val,
					  input  logic [15:0] Bus_in,
					  output logic BEN_out);
					  
logic N, Z, P;
logic Nnew, Znew, Pnew;

always_ff @ (posedge Clk)
	begin
	
	if(Reset) begin
		N <= 1'b0;
		Z <= 1'b0;
		P <= 1'b0;
	end
	
	else if(LD_CC) begin
		N <= Nnew;
		Z <= Znew;
		P <= Pnew;
	end

	end
	
always_comb
	begin
	
	Nnew = 1'b0;
	Znew = 1'b0;
	Pnew = 1'b0;
	
	if(Bus_in == 16'h0000) begin
		Znew = 1'b1; end
	
	else if(Bus_in[15] == 1) begin
		Nnew = 1'b1; end
	
	else begin
		Pnew = 1'b1; end
		
	if((IR_Val[11] & N) | (IR_Val[10] & Z) | (IR_Val[9] & P)) begin
		BEN_out = 1'b1; end
	
	else begin
		BEN_out = 1'b0; end
	
	end

endmodule
