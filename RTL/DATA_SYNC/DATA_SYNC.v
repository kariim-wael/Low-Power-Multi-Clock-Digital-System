
module DATA_SYNC # ( 
     parameter NUM_STAGES = 2 ,   // Number of flip-flop stages in bit synchronizer
     parameter DATA_WIDTH = 8     // Width of the Unsync and Sync bus
)(
    input wire CLK,               // Destination domain clock
    input wire RST,               // Active-low asynchronous reset
    input wire bus_enable,        // Source domain enable signal
    input wire [DATA_WIDTH - 1:0] Unsync_bus, // Unsynchronized data bus
    
    output reg [DATA_WIDTH - 1:0] sync_bus,   // Synchronized data bus
    output reg enable_pulse       // One-cycle enable pulse in destination domain
); 

    wire enable_signal;                  // Internal enable signal (edge-detected)
    reg pulse_gen_reg;                   // Register to detect rising edge of wire_signal
    wire wire_signal;                    // Output of BIT_SYNC for bus_enable
    reg [NUM_STAGES-1:0] bit_sync_reg;   // Shift register for BIT_SYNC


// Simple shift register implementation for BIT_SYNC
assign wire_signal = bit_sync_reg[NUM_STAGES-1];


// Shift register to synchronize bus_enable signal with number of stages = 2
always @(posedge CLK or negedge RST) begin
    if (!RST)
        bit_sync_reg <= 1'b0;
    else
        bit_sync_reg <= {bit_sync_reg[NUM_STAGES-2:0], bus_enable};
end


// Edge detection: generates pulse when bus_enable rises
assign enable_signal = ~pulse_gen_reg & wire_signal;


// Register data bus into sync_bus when enable_signal is asserted
always @(posedge CLK or negedge RST) begin
    if (!RST)
    begin
        sync_bus <= 'b0;
    end else begin
        if(enable_signal) 
            sync_bus <= Unsync_bus;
    end 
end


// Register used for edge detection of bus_enable
always @(posedge CLK or negedge RST) begin
    if(!RST)
    begin
        pulse_gen_reg <= 1'b0;
    end else begin
        pulse_gen_reg <= wire_signal;
    end
end


// Generate one-cycle enable pulse
always @(posedge CLK or negedge RST) begin
    if(!RST)
    begin
        enable_pulse <= 1'b0;
    end else begin
        enable_pulse <= enable_signal;
    end
end

endmodule
