

module SYS_TOP # ( parameter DATA_WIDTH = 8 ,  RF_ADDR = 4 )

(
 input   wire                          RST_N,
 input   wire                          UART_CLK,
 input   wire                          REF_CLK,
 input   wire                          UART_RX_IN,
 
 output  wire                          UART_TX_O,
 output  wire                          parity_error,
 output  wire                          framing_error
);


wire                                   SYNC_UART_RST,
                                       SYNC_REF_RST;
									   
wire					               UART_TX_CLK;
wire					               UART_RX_CLK;


wire      [DATA_WIDTH-1:0]             Operand_A,
                                       Operand_B,
									   UART_Config,
									   Div_RATIO;
									   
wire      [DATA_WIDTH-1:0]             DIV_RATIO_RX;
									   
wire      [DATA_WIDTH-1:0]             UART_RX_OUT;
wire         						   UART_RX_V_OUT; 
wire      [DATA_WIDTH-1:0]			   UART_RX_SYNC;
wire                                   UART_RX_V_SYNC;

wire      [DATA_WIDTH-1:0]             UART_TX_IN; 
wire        						   UART_TX_VLD;
wire      [DATA_WIDTH-1:0]             UART_TX_SYNC;
wire        						   UART_TX_V_SYNC;

wire                                   UART_TX_Busy;	
wire                                   UART_TX_Busy_PULSE;	
									   
wire                                   RF_WrEn;
wire                                   RF_RdEn;
wire      [RF_ADDR-1:0]                RF_Address;
wire      [DATA_WIDTH-1:0]             RF_WrData;
wire      [DATA_WIDTH-1:0]             RF_RdData;
wire                                   RF_RdData_VLD;									   

wire                                   CLKG_EN;
wire                                   ALU_EN;
wire      [3:0]                        ALU_FUN; 
wire      [DATA_WIDTH*2-1:0]           ALU_OUT;
wire                                   ALU_OUT_VLD; 
									   
wire                                   ALU_CLK ;								   

wire                                   FIFO_FULL ;
	
wire                                   CLKDIV_EN ;
		
		
///********************************************************///
//////////////////// Reset synchronizers /////////////////////
///********************************************************///

RST_SYNC # (.NUM_STAGES(2)) REF_RST_SYNC (
.clk(REF_CLK),
.rst(RST_N),

.SYNC_RST(SYNC_REF_RST)
);

RST_SYNC # (.NUM_STAGES(2)) UART_RST_SYNC (
.clk(UART_CLK),
.rst(RST_N),

.SYNC_RST(SYNC_UART_RST)
);

///********************************************************///
////////////////////// Data Synchronizer /////////////////////
///********************************************************///

DATA_SYNC # (.NUM_STAGES(2) , .DATA_WIDTH(DATA_WIDTH)) DATA_sync_ref (
.CLK(REF_CLK),
.RST(SYNC_REF_RST),
.bus_enable(UART_RX_V_OUT),
.Unsync_bus(UART_RX_OUT),

.sync_bus(UART_RX_SYNC),
.enable_pulse(UART_RX_V_SYNC)
);

///********************************************************///
///////////////////////// Async FIFO /////////////////////////
///********************************************************///

ASYNC_FIFO #(.DATA_WIDTH(DATA_WIDTH) , .ADDRES_WIDTH(4)  , .FIFO_DEPTH(8)) U_FIFO (
.W_CLK(REF_CLK),
.W_RST(SYNC_REF_RST),  
.W_INC(UART_TX_VLD),
.R_CLK(UART_TX_CLK),             
.R_RST(SYNC_UART_RST),              
.R_INC(UART_TX_Busy_PULSE),              
.WR_DATA(UART_TX_IN), 
             
.FULL(FIFO_FULL),             
.EMPTY(UART_TX_V_SYNC),               
.RD_DATA(UART_TX_SYNC)               
);

///********************************************************///
//////////////////////// Pulse Generator /////////////////////
///********************************************************///

PULSE_GEN U_PULSE_GEN (
.CLK(UART_TX_CLK),
.RST(SYNC_UART_RST),
.lvl_sig(UART_TX_Busy),

.pulse_sig(UART_TX_Busy_PULSE)
);

///********************************************************///
//////////// Clock Divider for UART_TX Clock /////////////////
///********************************************************///

ClkDiv Clk_Div_TX_CONS (
.i_ref_clk(UART_CLK),             
.i_rst_n(SYNC_UART_RST),                 
.i_clk_en(CLKDIV_EN),               
.i_div_ratio(Div_RATIO),    
       
.o_div_clk(UART_TX_CLK)             
);

///********************************************************///
/////////////////////// Custom Mux Clock /////////////////////
///********************************************************///

CLKDIV_MUX CLKDIV_MUX (
.IN(UART_Config[7:2]),

.OUT(DIV_RATIO_RX)
);

///********************************************************///
//////////// Clock Divider for UART_RX Clock /////////////////
///********************************************************///

ClkDiv Clk_Div_RX_Prescale (
.i_ref_clk(UART_CLK),             
.i_rst_n(SYNC_UART_RST),                 
.i_clk_en(CLKDIV_EN),               
.i_div_ratio(DIV_RATIO_RX),    
       
.o_div_clk(UART_RX_CLK)             
);

///********************************************************///
/////////////////////////// UART /////////////////////////////
///********************************************************///

UART_TOP  UART (
.RST(SYNC_UART_RST),
.TX_CLK(UART_TX_CLK),
.RX_CLK(UART_RX_CLK),
.RX_IN_S(UART_RX_IN),

.RX_OUT_P(UART_RX_OUT),
.RX_OUT_V(UART_RX_V_OUT),

.TX_IN_P(UART_TX_SYNC),
.TX_IN_V(!UART_TX_V_SYNC), 
                     
.TX_OUT_S(UART_TX_O),                      
.TX_OUT_V(UART_TX_Busy), 

.Prescale(UART_Config[7:2]), 
.parity_enable(UART_Config[0]),
.parity_type(UART_Config[1]),

.parity_error(parity_error),
.framing_error(framing_error)                  
);

///********************************************************///
//////////////////// System Controller ///////////////////////
///********************************************************///

SYS_CTRL U_SYS_CTRL (
.CLK(REF_CLK),
.RST(SYNC_REF_RST),
.ALU_OUT(ALU_OUT),
.ALU_OUT_VALID(ALU_OUT_VLD),
.RF_RdData(RF_RdData),
.RF_RdData_VALID(RF_RdData_VLD),
.UART_IN_DATA(UART_RX_SYNC),
.UART_IN_VALID(UART_RX_V_SYNC),
.FULL_FLAG(FIFO_FULL),

.ALU_EN(ALU_EN), 
.ALU_FUN(ALU_FUN),
.RF_WrEn(RF_WrEn),  
.RF_RdEn(RF_RdEn), 
.RF_Addres(RF_Address),   
.RF_WrData(RF_WrData),
.TX_P_DATA(UART_TX_IN), 
.TX_D_VALID(UART_TX_VLD),
.CLK_GATE_EN(CLKG_EN), 
.CLK_DIV_EN(CLKDIV_EN)
);

///********************************************************///
/////////////////////// Register File ////////////////////////
///********************************************************///

RegFile U_RegFile (
.CLK(REF_CLK),
.RST(SYNC_REF_RST),
.WrEn(RF_WrEn),
.RdEn(RF_RdEn),
.Address(RF_Address),
.WrData(RF_WrData),

.RdData(RF_RdData),
.RdData_VLD(RF_RdData_VLD),
.OP_A(Operand_A),
.OP_B(Operand_B),
.UART_CONFIG(UART_Config),
.DIV_RATIO(Div_RATIO)
);

///********************************************************///
//////////////////////////// ALU /////////////////////////////
///********************************************************///
 
ALU U_ALU (
.A(Operand_A),
.B(Operand_B),  
.EN(ALU_EN), 
.ALU_FUN(ALU_FUN),
.CLK(ALU_CLK),
.RST(SYNC_REF_RST),

.ALU_OUT(ALU_OUT),
.OUT_VALID(ALU_OUT_VLD)
);

///********************************************************///
///////////////////////// Clock Gating ///////////////////////
///********************************************************///

CLK_GATE U_CLK_GATE (
.CLK(REF_CLK),
.CLK_en(CLKG_EN),

.gated_clk(ALU_CLK)
);


endmodule
 
