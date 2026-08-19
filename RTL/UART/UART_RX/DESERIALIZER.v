
module DESERIALIZER #(
    parameter DATA_WIDTH = 8   // Number of data bits in received frame
)
(
    input wire sampled_bit,  	 	    // Incoming serial bit
    input wire deser_en,     		    // Enable loading bits
    input wire sampled_bit_valid,       // High for 1 clock cycle when the sampled bit is valid (after majority voting)    
    input wire CLK,          		    // System clock
    input wire RST,          		    // Active-low reset

    output reg [DATA_WIDTH-1:0] P_DATA  // Parallel output data
);


    always @(posedge CLK or negedge RST) 
	begin
        if (!RST) 
		begin
            P_DATA  <= 'b0;
        end 
        else if (deser_en && sampled_bit_valid) 
		begin
            // Store the sampled bit (LSB first)
            P_DATA <= {sampled_bit,P_DATA[DATA_WIDTH-1:1]};
        end
    end

endmodule
