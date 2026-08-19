
module RST_SYNC #(
    parameter NUM_STAGES = 2   // Number of synchronization stages (default = 2)
)(
    input  wire clk,           // Clock input
    input  wire rst,           // Asynchronous active-low reset
    
    output wire SYNC_RST       // Synchronized reset output
);

    reg [NUM_STAGES-1:0] sync_reg;  // Shift register for synchronization

always @(posedge clk or negedge rst) begin
    if(!rst)
        sync_reg <= 'b0;  // Clear all stages when reset is active
    else begin
        sync_reg <= {sync_reg[NUM_STAGES-2:0] , 1'b1}; // Shift in '1' each clock
    end
end

// Output is taken from the last stage
assign SYNC_RST = sync_reg[NUM_STAGES-1];

endmodule
