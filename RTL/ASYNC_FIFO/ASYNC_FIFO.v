
module ASYNC_FIFO #(
    parameter ADDRES_WIDTH = 4,   // Address pointer width
    parameter DATA_WIDTH   = 8,   // Data width
    parameter FIFO_DEPTH   = 8,   // FIFO depth (number of entries)
    parameter NUM_STAGES   = 2,   // Synchronizer stages
    parameter BUS_WIDTH    = 4    // Width of synchronized bus
)
(
    input wire W_CLK,                      // Write clock
    input wire W_RST,                      // Write reset (active-low)
    input wire W_INC,                      // Write enable
    input wire R_CLK,                      // Read clock
    input wire R_RST,                      // Read reset (active-low)
    input wire R_INC,                      // Read enable
    input wire [DATA_WIDTH-1:0] WR_DATA,   // Data input

    output wire FULL,                      // FIFO full flag
    output wire EMPTY,                     // FIFO empty flag
    output wire [DATA_WIDTH-1:0] RD_DATA   // Data output
);
    
    // Internal pointers and synchronized signals
    wire [ADDRES_WIDTH-1:0] R_PTR;       // Read pointer (Gray)
    wire [ADDRES_WIDTH-1:0] WQ2_R_PTR;   // Read pointer synced into write domain
    
    wire [ADDRES_WIDTH-1:0] W_PTR;       // Write pointer (Gray)
    wire [ADDRES_WIDTH-1:0] WQ2_W_PTR;   // Write pointer synced into read domain
    
    wire [ADDRES_WIDTH-2:0] READ_ADDRES;   // Binary read address
    wire [ADDRES_WIDTH-2:0] WRITE_ADDRES;  // Binary write address
    

// ================= WRITE POINTER MODULE =================
FIFO_WR #(.ADDRES_WIDTH(ADDRES_WIDTH)) WRITE_MODULE (
    .W_CLK(W_CLK),
    .W_RST(W_RST),
    .W_INC(W_INC),
    .GRAY_R_ADD(WQ2_R_PTR),   // Synced read pointer from read domain
    
    .FULL(FULL),              // FIFO full flag
    .W_ADD(WRITE_ADDRES),     // Binary write address
    .GRAY_W_ADD(W_PTR)        // Write pointer in Gray code
);

// ================= READ POINTER MODULE =================
FIFO_RD #(.ADDRES_WIDTH(ADDRES_WIDTH)) READ_MODULE (
    .R_CLK(R_CLK),
    .R_RST(R_RST),
    .R_INC(R_INC),
    .GRAY_W_ADD(WQ2_W_PTR),   // Synced write pointer from write domain
    
    .EMPTY(EMPTY),            // FIFO empty flag
    .R_ADD(READ_ADDRES),      // Binary read address
    .GRAY_R_ADD(R_PTR)        // Read pointer in Gray code
);

// ================= MEMORY CONTROL MODULE =================
FIFO_MEM_CNTRL #(
    .ADDRES_WIDTH(ADDRES_WIDTH),
    .DATA_WIDTH(DATA_WIDTH),
    .FIFO_DEPTH(FIFO_DEPTH)
) MEMORY_MODULE (
    .W_CLK(W_CLK),
    .W_RST(W_RST),
    .W_INC(W_INC),
    .FULL(FULL),
    .WR_DATA(WR_DATA),
    .R_ADD(READ_ADDRES),
    .W_ADD(WRITE_ADDRES),
    
    .RD_DATA(RD_DATA)         // Data read out
);

// ================= SYNCHRONIZER: R->W =================
BIT_SYNC #(
    .NUM_STAGES(NUM_STAGES),
    .BUS_WIDTH(BUS_WIDTH)
) BIT_SYNC_R_TO_W (
    .CLK(W_CLK),              // Sync into write domain
    .RST(W_RST),
    .ASYNC(R_PTR),            // Async read pointer
    .SYNC(WQ2_R_PTR)          // Synced read pointer
);

// ================= SYNCHRONIZER: W->R =================
BIT_SYNC #(
    .NUM_STAGES(NUM_STAGES),
    .BUS_WIDTH(BUS_WIDTH)
) BIT_SYNC_W_TO_R (
    .CLK(R_CLK),              // Sync into read domain
    .RST(R_RST),
    .ASYNC(W_PTR),            // Async write pointer
    .SYNC(WQ2_W_PTR)          // Synced write pointer
);

endmodule
