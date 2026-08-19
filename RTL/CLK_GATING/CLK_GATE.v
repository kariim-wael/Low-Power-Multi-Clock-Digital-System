
module CLK_GATE (
	input wire CLK,			// Ref clock
	input wire CLK_en,  	// clock enable

	output wire gated_clk	// gated clock (output)
);

	reg latch_out;
	
	// THIS CODE FOR RTL SIMULATION TOOL

	always @(CLK_en or CLK)
	begin
		if(!CLK)
			latch_out <= CLK_en;
	end
	
	assign gated_clk = latch_out & CLK;

	// THIS CODE FOR SYNTHESIS TOOL

// ICG (INTEGRATED CLOCK GATING) cell instantiation
/*
TLATNCAX12M U0_TLATNCAX12M (
.E(CLK_en),
.CK(CLK),
.ECK(gated_clk)
); */

endmodule