
module EDGE_BIT_COUNTER (
    input wire        count_enable,    // Enable counting
    input wire [5:0]  prescale,        // Oversampling prescale value
    input wire        CLK,
    input wire        RST,             // Active-low reset

    output reg  [5:0]  edge_cnt,       // Counts oversampling edges
    output reg  [3:0]  bit_cnt         // Counts UART bits (start + data + parity + stop)
);

always @ (posedge CLK or negedge RST) 
begin
    if (!RST) 
	begin
        edge_cnt <= 6'b0;
        bit_cnt  <= 4'b0;
    end 
    else if (count_enable) 
	begin
        // Increment edge counter
        if (edge_cnt == prescale - 1) 
		begin
            edge_cnt <= 6'b0;         // Reset edge counter
            bit_cnt  <= bit_cnt + 1;  // Move to next bit
        end 
        else begin
            edge_cnt <= edge_cnt + 1;
        end

    end 
	else begin
		bit_cnt  <= 4'b0;
		edge_cnt <= 6'b0; 
	end
end

endmodule
