
module START_CHECK (
    input wire start_chk_en,         // Enable start bit check
    input wire sampled_bit_valid,    // Indicates when sampled_bit is valid
    input wire sampled_bit,          // The sampled bit value
    input wire CLK,          		 // System clock
    input wire RST,          	     // Active-low reset	

    output reg  start_glitch         // 0 = correct start bit, 1 = wrong start bit
);

	always @(posedge CLK or negedge RST) 
	begin
		if(!RST)
			start_glitch <= 1'b0;			// Default = no glitch (error)
		else if(start_chk_en && sampled_bit_valid)
			start_glitch <= sampled_bit;		// Detect wrong start bit
		else if(!start_chk_en)
			start_glitch <= 1'b0;
	end

endmodule
