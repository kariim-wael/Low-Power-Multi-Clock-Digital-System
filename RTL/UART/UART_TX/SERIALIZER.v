
module SERIALIZER #(

    parameter DATA_WIDTH = 8,
    parameter COUNT = 3
) 
(
    input  wire [DATA_WIDTH-1:0] IN_DATA,   // Parallel input data
    input  wire SER_EN,                     // Enable to start serialization
    input  wire CLK,                        // System clock
    input  wire RST,                        // Active-low asynchronous reset
    input  wire BUSY,                       // High when transmitter is sending	

    output reg  SER_DONE,                   // Goes high when serialization finishes
    output reg  ser_data                    // Serial output (LSB first)
);

    reg [COUNT-1:0] counter;              
    reg [DATA_WIDTH-1:0] register;        

    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            counter   <= 'b0;
            SER_DONE  <= 'b0;
            ser_data  <= 'b0;
            register  <= 'b0;
        end
        else if (SER_EN && !BUSY) begin
            // Load data and immediately output LSB
            ser_data  <= IN_DATA[0];           // Output first bit immediately
            register  <= IN_DATA >> 1;         // Shift right to prepare next bits
            counter   <= 'b1;                  // Start from 1 (first bit already sent)
            SER_DONE  <= 'b0;
        end
        else if (BUSY) begin
            // Shift out data LSB first
            ser_data  <= register[0];
            register  <= register >> 1;
            counter   <= counter + 1;

            if (counter == DATA_WIDTH-1) begin
                SER_DONE <= 'b1;                 // Signal done
            end
            else begin
                SER_DONE <= 'b0;
				end
        end
        else begin
            SER_DONE <= 'b0;
        end
    end
endmodule
