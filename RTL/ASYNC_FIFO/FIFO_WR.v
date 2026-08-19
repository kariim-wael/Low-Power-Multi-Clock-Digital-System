
module FIFO_WR #(
    parameter ADDRES_WIDTH = 4    // Pointer width
)
(
    input  wire W_CLK,            // Write clock
    input  wire W_RST,            // Active-low reset
    input  wire W_INC,            // Write enable 
    input  wire [ADDRES_WIDTH-1:0] GRAY_R_ADD, // Read pointer (Gray)

    output wire FULL,             // FIFO full flag
    output wire [ADDRES_WIDTH-2:0] W_ADD,      // Binary write address (to memory)
    output reg [ADDRES_WIDTH-1:0] GRAY_W_ADD   // Write pointer (Gray)
);

    reg [ADDRES_WIDTH-1:0] ADD_COUNTER;  // Binary write counter
    wire [ADDRES_WIDTH-1:0] COMP_GRAY_W_ADD;


    // Convert binary counter to Gray code
    assign COMP_GRAY_W_ADD = (ADD_COUNTER >> 1) ^ ADD_COUNTER;


    // Update binary write counter
    always @(posedge W_CLK or negedge W_RST) begin
        if(!W_RST)
            ADD_COUNTER <= 'b0;         
        else if (W_INC && !FULL)  
            ADD_COUNTER <= ADD_COUNTER + 1;
    end


    // converting binary write pointer to gray coded
    always @(posedge W_CLK or negedge W_RST)
    begin
     if(!W_RST)
      begin
       GRAY_W_ADD <= 0 ;
     end
    else
     begin
      GRAY_W_ADD <= COMP_GRAY_W_ADD;
     end
    end


    // Full condition detection
    assign FULL = ((COMP_GRAY_W_ADD[ADDRES_WIDTH-1] != GRAY_R_ADD[ADDRES_WIDTH-1]) &&
                   (COMP_GRAY_W_ADD[ADDRES_WIDTH-2] != GRAY_R_ADD[ADDRES_WIDTH-2]) &&
                   (GRAY_R_ADD[ADDRES_WIDTH-3:0] == COMP_GRAY_W_ADD[ADDRES_WIDTH-3:0]));


    // Binary write address for memory
    assign W_ADD = ADD_COUNTER[ADDRES_WIDTH-2:0];

endmodule
