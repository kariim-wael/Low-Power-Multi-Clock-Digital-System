
module PAR_CHECK #(
    parameter DATA_WIDTH = 8   // Number of data bits in received frame
)
(
    input wire par_chk_en,                 // Enable parity check
    input wire PAR_TYP,                    // 0 = Even parity, 1 = Odd parity
    input wire sampled_bit_valid,          // Indicates when sampled_bit is valid
    input wire sampled_bit,                // The sampled parity bit from RX line
    input wire [DATA_WIDTH-1:0] P_DATA,    // Parallel received data
    input wire CLK,          			   // System clock
    input wire RST,          	           // Active-low reset

    output reg  par_err                    // High when parity error detected
);

    wire expected_parity; // Expected parity bit
	

	assign expected_parity = (PAR_TYP) ? (~^P_DATA) : (^P_DATA);


    always @(posedge CLK or negedge RST) 
    begin
		if(!RST)
			par_err <= 1'b0;
		else if(par_chk_en && sampled_bit_valid)
			par_err <= expected_parity ^ sampled_bit;  // Error if expected != received parity bit
    end

endmodule
