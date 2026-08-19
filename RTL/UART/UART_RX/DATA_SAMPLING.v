
module DATA_SAMPLING (

    input wire [5:0] edge_cnt,           // Oversampling edge counter
    input wire       data_sampl_en,      // Sampling enable
    input wire       RX_IN,              // Serial input line
    input wire [5:0] prescale,           // Oversampling prescale
    input wire       CLK,
    input wire       RST,                // Active-low reset
 
    output reg        sampled_bit,       // Final sampled bit (after majority)
    output reg        sampled_bit_valid  // High for 1 clock when a new sampled bit is ready
);

    reg sample_1, sample_2, sample_3;    // Temporary registers to store 3 samples

    always @(posedge CLK or negedge RST) 
	begin
        if (!RST) 
		begin
            sample_1           <= 1'b0;
            sample_2           <= 1'b0;
            sample_3           <= 1'b0;
            sampled_bit        <= 1'b0;
            sampled_bit_valid  <= 1'b0;
        end 
        else if (data_sampl_en) 
		begin
            // Default: no new bit until we finish majority vote
            sampled_bit_valid <= 1'b0; 

            // First sample: one cycle before the middle of the bit period
            if (edge_cnt == (prescale >> 1) - 2) 
			begin
                sample_1 <= RX_IN;
            end 
            // Second sample: exactly in the middle of the bit period
            else if (edge_cnt == (prescale >> 1) - 1) 
			begin
                sample_2 <= RX_IN;
            end 
            // Third sample: one cycle after the middle of the bit period
            else if (edge_cnt == (prescale >> 1)) 
			begin
                sample_3 <= RX_IN;
			end 
			// Majority voting: decide the final sampled bit
			else if (edge_cnt == (prescale >> 1) + 1)
			begin
                sampled_bit <= (sample_1 & sample_2) |
                               (sample_1 & sample_3) |
                               (sample_2 & sample_3);
                sampled_bit_valid <= 1'b1; // Indicate that a new sampled bit is ready
            end
        end
		else begin
				sample_1           <= 1'b0;
				sample_2           <= 1'b0;
				sample_3           <= 1'b0;
				sampled_bit        <= 1'b0;
				sampled_bit_valid  <= 1'b0;		
		end
    end
	
endmodule
