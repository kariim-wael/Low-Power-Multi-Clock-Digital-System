


module FIFO_MEM_CNTRL #(
    parameter ADDRES_WIDTH = 4,   // Address pointer width
    parameter DATA_WIDTH   = 8,   // Data width
    parameter FIFO_DEPTH   = 8    // FIFO depth (number of entries)
)
(
    input  wire                  W_CLK,     // Write clock
    input  wire                  W_RST,     // Active-low reset
    input  wire                  W_INC,     // Write enable
    input  wire                  FULL,      // Full flag
    input  wire [DATA_WIDTH-1:0] WR_DATA,   // Data to be written
    input  wire [ADDRES_WIDTH-2:0] R_ADD,   // Read address (binary)
    input  wire [ADDRES_WIDTH-2:0] W_ADD,   // Write address (binary)
    
    output wire  [DATA_WIDTH-1:0] RD_DATA   // Data read
);
    
    integer i;

    // FIFO memory array
    reg [DATA_WIDTH-1:0] MEMORY [FIFO_DEPTH-1:0];
    
    // Write process
    always @(posedge W_CLK or negedge W_RST)
    begin
        if(!W_RST) begin
            // Clear memory on reset
            for(i=0; i<FIFO_DEPTH; i=i+1)
                MEMORY[i] <= {DATA_WIDTH{1'b0}};
        end 
        else if (W_INC && !FULL) begin
            // Write new data when enabled and not full
            MEMORY[W_ADD] <= WR_DATA;
        end
    end
    
    // Asynchronous read process

    assign RD_DATA = MEMORY[R_ADD];   // Output data from memory at R_ADD

    
endmodule
