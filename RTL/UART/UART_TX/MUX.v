
module MUX #(

    parameter MUX_WIDTH = 2          // Number of select bits for the MUX
)
(
    input wire [MUX_WIDTH - 1:0] mux_sel, // MUX select signal
    input wire start_bit,                 // Start bit (0 in UART frame)
    input wire stop_bit,                  // Stop bit (1 in UART frame)
    input wire ser_data,                  // Serial data from shift register
    input wire par_bit,                   // Parity bit
    input wire CLK,                        // System clock
    input wire RST,                        // Asynchronous reset (active low)
    
    output reg TX_OUT                     // UART TX line output
);

    
   always @(posedge CLK or negedge RST) 
	begin
		if(!RST)
          TX_OUT <= 1'b1;
		else
		begin
		case (mux_sel)
			2'b00:   TX_OUT <= start_bit;  // Select start bit
			2'b01:   TX_OUT <= stop_bit;   // Select stop bit
			2'b10:   TX_OUT <= ser_data;   // Select serial data bit
			2'b11:   TX_OUT <= par_bit;    // Select parity bit
			default: TX_OUT <= 1'b1;       // Idle line by default
		endcase
		end
    end
    
endmodule
