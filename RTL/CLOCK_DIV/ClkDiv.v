
module ClkDiv #( 
 parameter RATIO_WD = 8 
)
(
    input wire i_ref_clk,          // Reference clock
    input wire i_rst_n,            // Active-low reset
    input wire i_clk_en,           // Clock enable
    input wire [RATIO_WD-1:0] i_div_ratio,  // Division ratio

    output wire o_div_clk          // Divided clock output
);

    reg  [RATIO_WD-1:0] counter;                    // Counts clock cycles
    reg                 output_clk;                 // Internal divided clock
    wire [RATIO_WD-1:0] half_togg_high;             // Division/2
    wire [RATIO_WD-1:0] half_togg_low;              // Division/2 + 1
    wire                odd;                        // 1 if ratio is odd
    wire                flag;                       // Tracks clock phase (odd division)
    
    assign half_togg_high = i_div_ratio >> 1;   // Divide by 2
    assign half_togg_low  = half_togg_high + 1; // +1 for odd division
    assign odd  = i_div_ratio[0];               // Odd/even check
    assign flag = (o_div_clk) ? 1'b1 : 1'b0;    // Phase select

    assign CLK_EN   = (i_clk_en && i_div_ratio != 0 && i_div_ratio != 1);
    assign o_div_clk = (CLK_EN && i_rst_n) ? output_clk : i_ref_clk;
    
    always @(posedge i_ref_clk or negedge i_rst_n)
    begin
        if(!i_rst_n) 
        begin
            counter <= 1;
            output_clk <= i_ref_clk;
        end 
        else if(CLK_EN) 
        begin
            // Even division
            if (!odd && counter == half_togg_high) 
            begin
                counter <= 1;
                output_clk <= ~output_clk;
            end
            // Odd division
            else if (odd && ((counter == half_togg_high && flag) || (counter == half_togg_low && !flag))) 
            begin
                counter <= 1;
                output_clk <= ~output_clk;
            end 
            else if(counter > half_togg_low) 
                counter <= 1;
            else    
                counter <= counter + 1;
        end
    end

endmodule
