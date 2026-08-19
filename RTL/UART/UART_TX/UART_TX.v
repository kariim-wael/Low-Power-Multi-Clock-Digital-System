
module UART_TX #(

	parameter MUX_WIDTH = 2,          // Number of select bits for the MUX
	parameter DATA_WIDTH = 8,
	parameter COUNT = 3,
	parameter START_BIT = 1'b0,
	parameter STOP_BIT = 1'b1
)
(
	input wire [DATA_WIDTH - 1:0] IN_DATA, // Parallel input data
	input wire DATA_VALID,                 // New data ready
	input wire PAR_EN,                     // Enable parity bit
	input wire PAR_TYP,                    // 0 = even, 1 = odd
    input wire CLK,                        // Clock signal
    input wire RST,                        // Asynchronous reset (active low)

	output wire TX_OUT,					   // UART TX line output
	output wire BUSY			   		   // High when transmitter is sending
);
	
	// Internal wires
	wire SER_DONE;
	wire ser_data;
	wire [MUX_WIDTH - 1:0] mux_sel;
	wire par_bit;
	wire SER_EN;


	SERIALIZER #(.DATA_WIDTH(DATA_WIDTH),.COUNT(COUNT))  U1 (
		
		.IN_DATA(IN_DATA),
		.SER_EN(SER_EN),
		.CLK(CLK),
		.RST(RST),
		.BUSY(BUSY),
		
		.SER_DONE(SER_DONE),
		.ser_data(ser_data)			
	);
	
	
	FSM_tx #(.MUX_WIDTH(MUX_WIDTH))  U2 (
	
		.DATA_VALID(DATA_VALID),
		.PAR_EN(PAR_EN),
		.SER_DONE(SER_DONE),
		.CLK(CLK),
		.RST(RST),
		
		.BUSY(BUSY),
		.SER_EN(SER_EN),
		.mux_sel(mux_sel)	
	);
	
	
	PARITY_CALC #(.DATA_WIDTH(DATA_WIDTH))  U3 (
		
		.IN_DATA(IN_DATA),
		.DATA_VALID(DATA_VALID),
		.PAR_TYP(PAR_TYP),
		.CLK(CLK),
		.RST(RST),
		.BUSY(BUSY),
		
		.par_bit(par_bit)		
	);
	
	
	MUX #(.MUX_WIDTH(MUX_WIDTH))  U4 (
	
		.mux_sel(mux_sel),
		.start_bit(START_BIT),
		.stop_bit(STOP_BIT),
		.ser_data(ser_data),
		.par_bit(par_bit),
		.CLK(CLK),
		.RST(RST),
		
		.TX_OUT(TX_OUT)		
	);

endmodule