
module FIFO_RD #(
    parameter ADDRES_WIDTH = 4    // Pointer width	
)
(
    input  wire R_CLK,                          // Read clock
    input  wire R_RST,                          // Active-low reset
    input  wire R_INC,                          // Read enable
    input  wire [ADDRES_WIDTH-1:0] GRAY_W_ADD,  // Write pointer (Gray)

    output wire EMPTY,                          // FIFO empty flag
    output reg [ADDRES_WIDTH-1:0] GRAY_R_ADD,   // Read pointer (Gray)
    output wire [ADDRES_WIDTH-2:0] R_ADD        // Binary read address (to memory)
);

    reg [ADDRES_WIDTH-1:0] R_ADD_COUNTER;       // Binary read counter
    wire [ADDRES_WIDTH-1:0] COMB_GRAY_R_ADD;
	
    // Update binary read counter
    always @(posedge R_CLK or negedge R_RST) begin
        if(!R_RST)
            R_ADD_COUNTER <= 'b0;               // Reset counter
        else if (R_INC && !EMPTY)
            R_ADD_COUNTER <= R_ADD_COUNTER + 1;
    end
	
    // Convert binary counter to Gray code
    assign COMB_GRAY_R_ADD = (R_ADD_COUNTER >> 1) ^ R_ADD_COUNTER;


    // converting binary read pointer to gray coded
    always @(posedge R_CLK or negedge R_RST)
    begin
    if(!R_RST)
    begin
        GRAY_R_ADD <= 0 ;
    end
    else 
    begin
        GRAY_R_ADD <= COMB_GRAY_R_ADD;
    end
    end
	
    // Empty condition detection
    assign EMPTY = (COMB_GRAY_R_ADD == GRAY_W_ADD);
	
    // Binary read address for memory
    assign R_ADD = R_ADD_COUNTER[ADDRES_WIDTH-2:0];
	
endmodule
