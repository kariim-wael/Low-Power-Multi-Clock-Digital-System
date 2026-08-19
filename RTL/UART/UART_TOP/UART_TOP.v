
module UART_TOP # ( parameter DATA_WIDTH = 8)

(
 input   wire                          RST,
 input   wire                          TX_CLK,
 input   wire                          RX_CLK,
 input   wire                          RX_IN_S,

 output  wire   [DATA_WIDTH-1:0]       RX_OUT_P,  // Received parallel data
 output  wire                          RX_OUT_V,  // Data valid signal come out from RX

 input   wire   [DATA_WIDTH-1:0]       TX_IN_P,  // Transmit parallel data in
 input   wire                          TX_IN_V,  // Data valid signal come in to TX

 output  wire                          TX_OUT_S,
 output  wire                          TX_OUT_V,  // busy signal

 input   wire   [5:0]                  Prescale, 
 input   wire                          parity_enable,
 input   wire                          parity_type,

 output  wire                          parity_error,
 output  wire                          framing_error
);

UART_TX #(.DATA_WIDTH(DATA_WIDTH)) U_UART_TX (
    .IN_DATA(TX_IN_P),
    .DATA_VALID(TX_IN_V),
    .PAR_EN(parity_enable),
    .PAR_TYP(parity_type),
    .CLK(TX_CLK),
    .RST(RST),

    .TX_OUT(TX_OUT_S),
    .BUSY(TX_OUT_V)
);


UART_RX #(.DATA_WIDTH(DATA_WIDTH)) U_UART_RX (
    .RX_IN(RX_IN_S),
    .PAR_EN(parity_enable),
    .PAR_TYP(parity_type),
    .prescale(Prescale),
    .CLK(RX_CLK),
    .RST(RST),

    .DATA_VALID(RX_OUT_V),
    .par_err(parity_error),
    .stop_err(framing_error),
    .P_DATA(RX_OUT_P)
);    


endmodule 