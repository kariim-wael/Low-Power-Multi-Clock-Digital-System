
module SYS_CTRL #(parameter D_WIDTH = 8, ADDRS = 4 )

(
    input    wire                   CLK,
    input    wire                   RST,
    // ALU interface
    input    wire   [D_WIDTH*2-1:0] ALU_OUT,
    input    wire                   ALU_OUT_VALID,
    // Resister file interface
    input    wire   [D_WIDTH-1:0]   RF_RdData,
    input    wire                   RF_RdData_VALID,
    // DATA SYNC interface 
    input    wire   [D_WIDTH-1:0]   UART_IN_DATA, 
    input    wire                   UART_IN_VALID,
    // FIFO interface
    input    wire                   FULL_FLAG,

    // ALU interface
    output   reg                    ALU_EN,
    output   reg    [3:0]           ALU_FUN,  
    // Resister file interface
    output   reg                    RF_WrEn,
    output   reg                    RF_RdEn,
    output   reg   [ADDRS-1:0]      RF_Addres,
    output   reg   [D_WIDTH-1:0]    RF_WrData,
    // FIFO interface
    output   reg   [D_WIDTH-1:0]    TX_P_DATA, 
    output   reg                    TX_D_VALID,
        
    output   reg                    CLK_GATE_EN, 
    output   reg                    CLK_DIV_EN
);

// State encoding for FSM
localparam [3:0]    IDLE = 4'b0000,
                    RF_WRITE_ADDR = 4'b0001,
                    RF_WRITE_DATA = 4'b0011,
                    RF_READ_ADDR = 4'b0100,
                    WRITE_RF_D_TO_FIFO = 4'b0110,
					
                    ALU_WAIT_OP_A = 4'b0010,
                    ALU_WAIT_OP_B = 4'b1010,					   
                    ALU_WAIT_FUN = 4'b1000,
                    ALU_SEND_1st_DATA = 4'b1100,
                    ALU_SEND_2nd_DATA = 4'b1110;
					
// UART command values
localparam  [D_WIDTH-1:0]      RF_W_CMD        = 8'hAA,
                               RF_R_CMD        = 8'hBB,
					           ALU_OP_CMD      = 8'hCC,
					           ALU_NO_OP_CMD   = 8'hDD;  
							   
// Register addresses for operands
localparam [ADDRS-1:0] OP_A_ADDR = 4'd0;
localparam [ADDRS-1:0] OP_B_ADDR = 4'd1;

// Constant to keep clock divider always enabled
localparam ENABLE_CLK_DIV = 1'b1;
							   
// Internal registers for storing temporary values
reg STORE_ADDRESS_VALID;							   
reg [ADDRS-1:0] STORE_ADDRESS_DATA;	
reg STORE_2ND_BYTE_OF_ALU_OUT_VALID;
reg [D_WIDTH-1:0] STORE_2ND_BYTE_OF_ALU_OUT;			   

// FSM state registers
reg [3:0] current_state, next_state;                    

// Sequential state update
always @ (posedge CLK or negedge RST)
 begin
  if(!RST)
    current_state <= IDLE;
  else
    current_state <= next_state;
 end

// Next state logic
always @ (*)
begin
	next_state = IDLE ;
    case (current_state)
        IDLE : begin
                if (UART_IN_VALID)
                begin
					next_state = IDLE ;
					case(UART_IN_DATA)
						RF_W_CMD          : next_state = RF_WRITE_ADDR ;				
						RF_R_CMD          : next_state = RF_READ_ADDR ;				
						ALU_OP_CMD        : next_state = ALU_WAIT_OP_A ;				
						ALU_NO_OP_CMD     : next_state = ALU_WAIT_FUN ;						   
						default           : next_state = IDLE ;				
					endcase					
                end else 
					next_state = IDLE ;
			end    

		RF_WRITE_ADDR : begin
						if (UART_IN_VALID)
							next_state = RF_WRITE_DATA ;
						else	
							next_state = RF_WRITE_ADDR ;
			end
			
		RF_WRITE_DATA : begin
						if (UART_IN_VALID)
							next_state = IDLE ;
						else	
							next_state = RF_WRITE_DATA ;
			end	
			
		RF_READ_ADDR : begin
					if(UART_IN_VALID)
						next_state = WRITE_RF_D_TO_FIFO ;
					else
						next_state = RF_READ_ADDR ;
			end

		WRITE_RF_D_TO_FIFO : begin
					if (RF_RdData_VALID)
						next_state = IDLE ;
					else
						next_state = WRITE_RF_D_TO_FIFO ;
			end
		
		ALU_WAIT_OP_A : begin
					if (UART_IN_VALID)
						next_state = ALU_WAIT_OP_B ;
					else
						next_state = ALU_WAIT_OP_A ;
			end
			
		ALU_WAIT_OP_B : begin
					if (UART_IN_VALID)
						next_state = ALU_WAIT_FUN ;
					else
						next_state = ALU_WAIT_OP_B ;			
			end
			
		ALU_WAIT_FUN : begin
					if (UART_IN_VALID)
						next_state = ALU_SEND_1st_DATA ;
					else
						next_state = ALU_WAIT_FUN ;			
			end		

		ALU_SEND_1st_DATA : begin
					if (ALU_OUT_VALID)
						next_state = ALU_SEND_2nd_DATA ;
					else
						next_state = ALU_SEND_1st_DATA ;			
			end	

		ALU_SEND_2nd_DATA : next_state = IDLE ;


		default : next_state = IDLE ;

    endcase

end    

// Output logic based on current state and inputs
always @(*)
begin
	ALU_EN = 1'b0;
	ALU_FUN = 4'b0;
	RF_WrEn = 1'b0;
	RF_RdEn = 1'b0;
	RF_Addres = 'b0;
	RF_WrData = 'b0;
	TX_P_DATA = 'b0;
	TX_D_VALID = 1'b0;
	CLK_GATE_EN = 1'b0;
	CLK_DIV_EN = ENABLE_CLK_DIV;	// CLK DIVIDERS always ON
	STORE_ADDRESS_VALID = 1'b0;
	STORE_2ND_BYTE_OF_ALU_OUT_VALID = 1'b0;
	case (current_state)
			// Wait for new command
			IDLE : begin
				ALU_EN = 1'b0;
				ALU_FUN = 4'b0;
				RF_WrEn = 1'b0;
				RF_RdEn = 1'b0;
				RF_Addres = 'b0;
				RF_WrData = 'b0;
				TX_P_DATA = 'b0;
				TX_D_VALID = 1'b0;
				CLK_GATE_EN = 1'b0;
				CLK_DIV_EN = ENABLE_CLK_DIV;	
				STORE_ADDRESS_VALID = 1'b0;
				STORE_2ND_BYTE_OF_ALU_OUT_VALID = 1'b0;
			end
			
			// Store target address for write opretion
			RF_WRITE_ADDR : begin
				if (UART_IN_VALID)
					STORE_ADDRESS_VALID = 1'b1;
				else
					STORE_ADDRESS_VALID = 1'b0;
			end
			
			// Write data into register file
			RF_WRITE_DATA : begin
				if (UART_IN_VALID)
				begin
					RF_WrEn = 1'b1;
					RF_Addres = STORE_ADDRESS_DATA;
					RF_WrData = UART_IN_DATA;
				end	
				else
					RF_WrEn = 1'b0;
			end
			
			// Read data from register file
			RF_READ_ADDR : begin
				if (UART_IN_VALID)
				begin
					RF_Addres = UART_IN_DATA [ADDRS-1:0];
					RF_RdEn = 1'b1;
				end
				else
					RF_RdEn = 1'b0;					
			end
			
			// Send RF read data to FIFO and then to UART TX
			WRITE_RF_D_TO_FIFO : begin
				if (RF_RdData_VALID && !FULL_FLAG)
				begin
					TX_P_DATA = RF_RdData ;
					TX_D_VALID = 1'b1;					
				end else 
					TX_D_VALID = 1'b0;
			end
			
			// Write first ALU operand (OP_A)
			ALU_WAIT_OP_A : begin
				if (UART_IN_VALID) 
				begin
					RF_WrEn = 1'b1;
					RF_Addres = OP_A_ADDR;
					RF_WrData = UART_IN_DATA;
				end else
					RF_WrEn = 1'b0;
			end
			
			// Write second ALU operand (OP_B)
			ALU_WAIT_OP_B : begin
				if (UART_IN_VALID) 
				begin
					RF_WrEn = 1'b1;
					RF_Addres = OP_B_ADDR;
					RF_WrData = UART_IN_DATA;
				end else
					RF_WrEn = 1'b0;
			end		

			// Receive ALU function and enable ALU & CLK GATE block to ensure the ALU will be stable 
			ALU_WAIT_FUN : begin
				CLK_GATE_EN = 1'b1;
				if (UART_IN_VALID) 
				begin
					ALU_EN = 1'b1;
					ALU_FUN = UART_IN_DATA [3:0];
				end else
					ALU_EN = 1'b0;
			end		
			
			// Send first byte of ALU result and apply signal to store the 2nd byte of ALU out (16 bit)
			ALU_SEND_1st_DATA : begin
				CLK_GATE_EN = 1'b1;
				if (ALU_OUT_VALID && !FULL_FLAG)
				begin
					TX_P_DATA = ALU_OUT [D_WIDTH-1:0];
					TX_D_VALID = 1'b1;
					STORE_2ND_BYTE_OF_ALU_OUT_VALID = 1'b1;
				end else 
				begin
					TX_D_VALID = 1'b0;
					STORE_2ND_BYTE_OF_ALU_OUT_VALID = 1'b0;
				end	
			end
			
			// Send second byte of ALU result
			ALU_SEND_2nd_DATA : begin
				CLK_GATE_EN = 1'b1;
				if (!FULL_FLAG)
				begin
					TX_P_DATA = STORE_2ND_BYTE_OF_ALU_OUT;
					TX_D_VALID = 1'b1;
				end else 
					TX_D_VALID = 1'b0;
			end			
		
			default : begin
					ALU_EN = 1'b0;
					ALU_FUN = 4'b0;
					RF_WrEn = 1'b0;
					RF_RdEn = 1'b0;
					RF_Addres = 'b0;
					RF_WrData = 'b0;
					TX_P_DATA = 'b0;
					TX_D_VALID = 1'b0;
					CLK_GATE_EN = 1'b0;
					CLK_DIV_EN = ENABLE_CLK_DIV;	
					STORE_ADDRESS_VALID = 1'b0;
					STORE_2ND_BYTE_OF_ALU_OUT_VALID = 1'b0;
			end		
		
	endcase
	
	
end

// Store the write address in Register file write command (AA)
always @(posedge CLK or negedge RST)
begin
	if(!RST)
		STORE_ADDRESS_DATA <= 'b0;
	else if (STORE_ADDRESS_VALID)	
		STORE_ADDRESS_DATA <= UART_IN_DATA [ADDRS-1:0];
end

// Store the Most byte of ALU result in ALU commands
always @(posedge CLK or negedge RST)
begin
	if(!RST)
		STORE_2ND_BYTE_OF_ALU_OUT <= 'b0;
	else if (STORE_2ND_BYTE_OF_ALU_OUT_VALID)	
		STORE_2ND_BYTE_OF_ALU_OUT <= ALU_OUT [D_WIDTH*2-1 : D_WIDTH];
end


endmodule 