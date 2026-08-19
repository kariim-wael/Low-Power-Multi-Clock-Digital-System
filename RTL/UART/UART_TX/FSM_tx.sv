
/////////////////////////////////////
///////////// Moore FSM ///////////// 
/////////////////////////////////////

module FSM_tx #(

    parameter MUX_WIDTH = 2
)
(
    input wire DATA_VALID,              // New data ready
    input wire PAR_EN,                  // Enable parity bit
    input wire SER_DONE,                // Serializer finished sending
    input wire CLK,
    input wire RST,                     // Active-low reset

    output reg BUSY,                    // High during any TX process
	output reg SER_EN,                  // Enable serializer
    output reg [MUX_WIDTH-1:0] mux_sel  // Select which bit to send (start/data/parity/stop)
);

    // State encoding (Gray code)
	typedef enum bit [2:0]	{	
			STOP_STATE   = 3'b110,
			IDLE         = 3'b000,
            START_STATE  = 3'b001,
            DATA_STATE   = 3'b011,
            PARITY_STATE = 3'b010
	} state_e;		
		

    state_e current_state, next_state;

	reg BUSY_C;
	
    // State register
    always @(posedge CLK or negedge RST) 
	begin
        if (!RST)
            current_state <= IDLE;
        else
            current_state <= next_state;
    end
	

    // Next state logic
    always @(*) begin
        case (current_state)
            IDLE: begin
                if (DATA_VALID)
                    next_state = START_STATE;
                else
                    next_state = IDLE;
            end

            START_STATE: next_state = DATA_STATE;

            DATA_STATE: begin
                if (SER_DONE) 
				begin
                    if (PAR_EN)
                        next_state = PARITY_STATE;
                    else
                        next_state = STOP_STATE;
                end
                else
                    next_state = DATA_STATE;
            end

            PARITY_STATE: next_state = STOP_STATE;
            STOP_STATE:   next_state = IDLE;
            default:      next_state = IDLE;
        endcase
    end

	
    // Output logic (Moore)
    always @(*) begin
        // Initial values to avoiding latches
        BUSY_C    = 'b0;
        SER_EN  = 'b0;
        mux_sel = 2'b01;

        case (current_state)
            IDLE: begin
                BUSY_C    = 'b0;
				SER_EN  = 'b0;
                mux_sel = 2'b01; // Idle line
            end
            START_STATE: begin
                BUSY_C    = 'b1;
				SER_EN  = 'b1;
                mux_sel = 2'b00; // Start bit
            end
            DATA_STATE: begin
                BUSY_C    = 'b1;
				SER_EN  = 'b1;
                mux_sel = 2'b10; // Data bits
				if(SER_DONE)
					SER_EN = 1'b0 ;  
				else
					SER_EN = 1'b1 ;
            end
			
            PARITY_STATE: begin
                BUSY_C    = 'b1;
				SER_EN  = 'b0;
                mux_sel = 2'b11; // Parity bit
            end
            STOP_STATE: begin
                BUSY_C    = 'b1;
				SER_EN  = 'b0;
                mux_sel = 2'b01; // Stop bit
            end
            default: begin
                BUSY_C    = 'b0;
				SER_EN  = 'b0;
                mux_sel = 2'b01;
            end
        endcase
    end
	
	
	always @(posedge CLK or negedge RST) 
	begin
		if(!RST)
			BUSY <= 1'b0;
		else
			BUSY <= BUSY_C;
	end
	
endmodule
