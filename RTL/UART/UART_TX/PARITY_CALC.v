
module PARITY_CALC #(

    parameter DATA_WIDTH = 8
)
(
    input wire [DATA_WIDTH - 1:0] IN_DATA, // Parallel input data
    input wire DATA_VALID,                 // Pulse indicates new data is ready
    input wire PAR_TYP,                    // 0 = even, 1 = odd
    input wire CLK,                        // System clock
    input wire RST,                        // Asynchronous reset (active low)
    input wire BUSY,                       // High when transmitter is sending

    output reg par_bit                     // Calculated parity bit
);

   always @(posedge CLK or negedge RST) 
	begin
        if (!RST)
            par_bit <= 1'b0;
        else 
		begin
            // Calculate parity only when new data is valid and TX is not busy
            if (DATA_VALID && !BUSY) 
				begin
					if (PAR_TYP)
						par_bit <= ~^IN_DATA; // Odd parity
					else
						par_bit <=  ^IN_DATA; // Even parity
				end
        end
    end
endmodule
