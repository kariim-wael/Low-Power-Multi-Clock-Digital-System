
module STOP_CHECK (
    input wire stop_chk_en,          // Enable stop bit check
    input wire sampled_bit_valid,    // Indicates when sampled_bit is valid
    input wire sampled_bit,          // The sampled bit value
    input wire CLK,          		 // System clock
    input wire RST,          	     // Active-low reset	

    output reg stop_err              // High when stop bit error detected
);

	always @(posedge CLK or negedge RST) 
	begin
		if(!RST)
			stop_err <= 1'b0;
		else if (stop_chk_en && sampled_bit_valid)	
			stop_err <= ~sampled_bit;
		else if(!stop_chk_en)
			stop_err <= 1'b0;
			
	end
	
endmodule
