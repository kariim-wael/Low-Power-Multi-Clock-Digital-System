
module FSM (
	input wire PAR_EN,
	input wire RX_IN,
    input wire  [5:0]  edge_cnt,        // Counts oversampling edges
    input wire  [3:0]  bit_cnt,         // Counts UART bits (START + DATA + PARITY + STOP)
    input wire  [5:0]  prescale,        // Oversampling prescale value	
	input wire start_glitch,
	input wire stop_err,
	input wire par_err,
	input wire CLK,
	input wire RST,
	
	output reg DATA_VALID,
	output reg count_enable,
	output reg deser_en,
	output reg stop_chk_en,
	output reg start_chk_en,
	output reg par_chk_en,	
	output reg data_sampl_en	
);

    // State encoding (Gray code)
	typedef enum bit [2:0]	{	
			STOP   = 3'b110,
			IDLE   = 3'b000,
            START  = 3'b001,
            DATA   = 3'b011,
            PARITY = 3'b010,
			VALID  = 3'b111
			
	} state_e;		
		

    state_e current_state, next_state;
	
	always @(posedge CLK or negedge RST)
	begin
		if(!RST)
			current_state <= IDLE;
		else
			current_state <= next_state;
	end
	
	always @(*)
	begin
		case(current_state)
			IDLE: begin
				if (RX_IN)
					next_state = IDLE;
				else	
					next_state = START;			
			end
		
			START: begin
				if (bit_cnt == 4'b0 && edge_cnt == prescale-1)
					if(!start_glitch)
						next_state = DATA;
					else
						next_state = IDLE;
				else
					next_state = START;			
			end
		
			DATA: begin
				if (bit_cnt == 4'd8 && edge_cnt == prescale-1)
					if(PAR_EN)
						next_state = PARITY;
					else
						next_state = STOP;
				else
					next_state = DATA;		
			end
			
			PARITY: begin
				if (bit_cnt == 4'd9 && edge_cnt == prescale-1)
					next_state = STOP;
				else
					next_state = PARITY;
			end
			
			STOP: begin
				if (PAR_EN)
				begin
					if (bit_cnt == 4'd10 && edge_cnt == prescale-2)
						next_state = VALID;
					else
						next_state = STOP;	
				end 
				else begin
					if (bit_cnt == 4'd9 && edge_cnt == prescale-2)
						next_state = VALID;
					else
						next_state = STOP;
				end
			end
			
			VALID: begin
					if(!RX_IN)
						next_state = START;
					else
						next_state = IDLE;
			end
			
			default : next_state = IDLE;		
		endcase	
	end
	
	
	
	always @(*)
	begin
		DATA_VALID    = 1'b0;
		count_enable  = 1'b0;
		deser_en      = 1'b0;
		stop_chk_en   = 1'b0;
		start_chk_en  = 1'b0;
		par_chk_en    = 1'b0;
		data_sampl_en = 1'b0;
		case (current_state)
			IDLE: begin
					count_enable  = 1'b0;
					deser_en      = 1'b0;
					stop_chk_en   = 1'b0;
					start_chk_en  = 1'b0;
					par_chk_en    = 1'b0;
					data_sampl_en = 1'b0;				
			end
			
			START: begin
					count_enable  = 1'b1;
					deser_en      = 1'b0;
					stop_chk_en   = 1'b0;
					start_chk_en  = 1'b1;
					par_chk_en    = 1'b0;
					data_sampl_en = 1'b1;			
			end
			
			DATA: begin
					count_enable  = 1'b1;
					deser_en      = 1'b1;
					stop_chk_en   = 1'b0;
					start_chk_en  = 1'b0;
					par_chk_en    = 1'b0;
					data_sampl_en = 1'b1;			
			end
			
			PARITY: begin
					count_enable  = 1'b1;
					deser_en      = 1'b0;
					stop_chk_en   = 1'b0;
					start_chk_en  = 1'b0;
					par_chk_en    = 1'b1;
					data_sampl_en = 1'b1;			
			end
			
			STOP: begin
					count_enable  = 1'b1;
					deser_en      = 1'b0;
					stop_chk_en   = 1'b1;
					start_chk_en  = 1'b0;
					par_chk_en    = 1'b0;
					data_sampl_en = 1'b1;			
			end
			
			VALID: begin
					count_enable  = 1'b0;
					deser_en      = 1'b0;
					stop_chk_en   = 1'b0;
					start_chk_en  = 1'b0;
					par_chk_en    = 1'b0;
					data_sampl_en = 1'b0;	
					if(stop_err || par_err)
						DATA_VALID = 1'b0;
					else
						DATA_VALID = 1'b1;					
			end
			
			default: begin
					DATA_VALID    = 1'b0;
					count_enable  = 1'b0;
					deser_en      = 1'b0;
					stop_chk_en   = 1'b0;
					start_chk_en  = 1'b0;
					par_chk_en    = 1'b0;
					data_sampl_en = 1'b0;
			end
		endcase	
	end
	
endmodule