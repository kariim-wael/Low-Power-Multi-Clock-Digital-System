
module UART_RX #(
    parameter DATA_WIDTH = 8   // Number of data bits in received frame
)
(
	input wire RX_IN,
	input wire PAR_EN,
	input wire PAR_TYP,
	input wire [5:0]  prescale,        // Oversampling prescale value
	input wire CLK,
	input wire RST,
	
	output wire DATA_VALID,
	output wire par_err,
	output wire stop_err,
	output wire [DATA_WIDTH-1:0] P_DATA  // Parallel output data
);
	
	wire count_enable;
	wire deser_en;
	wire stop_chk_en;
	wire start_chk_en;
	wire par_chk_en;
	wire data_sampl_en;
	wire [5:0] edge_cnt;
	wire [3:0] bit_cnt;
	wire sampled_bit;
	wire start_glitch;
	wire sampled_bit_valid;
	

	EDGE_BIT_COUNTER U1 (
		
		.count_enable(count_enable),
		.prescale(prescale),
		.CLK(CLK),
		.RST(RST),
		
		.edge_cnt(edge_cnt),
		.bit_cnt(bit_cnt)
	);
	
	
	DESERIALIZER #(.DATA_WIDTH(DATA_WIDTH)) U2 (
		
		.sampled_bit(sampled_bit),
		.deser_en(deser_en),
		.sampled_bit_valid(sampled_bit_valid),
		.CLK(CLK),
		.RST(RST),

		.P_DATA(P_DATA)	
	);
	
	
	START_CHECK U3 (
		
		.start_chk_en(start_chk_en),
		.sampled_bit_valid(sampled_bit_valid),
		.sampled_bit(sampled_bit),
		.CLK(CLK),
		.RST(RST),
		
		.start_glitch(start_glitch)	
	);
	
	
	STOP_CHECK U4 (
		
		.stop_chk_en(stop_chk_en),
		.sampled_bit_valid(sampled_bit_valid),
		.sampled_bit(sampled_bit),
		.CLK(CLK),
		.RST(RST),

		.stop_err(stop_err)
	);
	
	
	PAR_CHECK #(.DATA_WIDTH(DATA_WIDTH)) U5 (
		
		.par_chk_en(par_chk_en),
		.PAR_TYP(PAR_TYP),
		.sampled_bit_valid(sampled_bit_valid),
		.sampled_bit(sampled_bit),
		.P_DATA(P_DATA),
		.CLK(CLK),
		.RST(RST),
		
		.par_err(par_err)
	);
	
	
	DATA_SAMPLING U6 (
		
		.edge_cnt(edge_cnt),
		.data_sampl_en(data_sampl_en),
		.RX_IN(RX_IN),
		.prescale(prescale),
		.CLK(CLK),
		.RST(RST),
		
		.sampled_bit(sampled_bit),
		.sampled_bit_valid(sampled_bit_valid)	
	);
	
	
	FSM U7 (
		
		.PAR_EN(PAR_EN),
		.RX_IN(RX_IN),
		.edge_cnt(edge_cnt),
		.bit_cnt(bit_cnt),
		.prescale(prescale),
		.start_glitch(start_glitch),
		.stop_err(stop_err),
		.par_err(par_err),
		.CLK(CLK),
		.RST(RST),
		
		.DATA_VALID(DATA_VALID),
		.count_enable(count_enable),
		.deser_en(deser_en),
		.stop_chk_en(stop_chk_en),
		.start_chk_en(start_chk_en),
		.par_chk_en(par_chk_en),
		.data_sampl_en(data_sampl_en)
	);
	
	
endmodule