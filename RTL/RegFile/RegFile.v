
module RegFile #(parameter WIDTH = 8, DEPTH = 16, ADDR = 4 )

(
input    wire                CLK,
input    wire                RST,
input    wire                WrEn,
input    wire                RdEn,
input    wire   [ADDR-1:0]   Address,
input    wire   [WIDTH-1:0]  WrData,

output   reg    [WIDTH-1:0]  RdData,
output   reg                 RdData_VLD,
output   wire   [WIDTH-1:0]  OP_A,        // Operand A for ALU
output   wire   [WIDTH-1:0]  OP_B,        // Operand B for ALU
output   wire   [WIDTH-1:0]  UART_CONFIG, // UART Configuration register, bit[7:2] Prescale, bit[1] Even/Odd parity select, bit[0] Parity enable
output   wire   [WIDTH-1:0]  DIV_RATIO    // Divider ratio for UART TX, is constant with value 32 
);

integer I ; 
  
// register file of 8 registers each of 16 bits width
reg [WIDTH-1:0] regArr [DEPTH-1:0] ;    

always @(posedge CLK or negedge RST)
 begin
   if(!RST)  
    begin
	 RdData_VLD <= 1'b0 ;
	 RdData     <= {WIDTH{1'b0}} ;
      for (I = 0 ; I < DEPTH ; I = I + 1)
        begin
		 if(I==2)
          regArr[I] <= 'b100000_0_1 ;   // UART Configuration register, prescale = 32, parity enable = 1, even parity = 0
		 else if (I==3) 
          regArr[I] <= 'b00_100000 ;    // Divid ratio register (32 decimal)
         else
          regArr[I] <= {WIDTH{1'b0}} ;		 
        end
     end
   else if (WrEn && !RdEn) // Register Write Operation
     begin
        regArr[Address] <= WrData ;
     end
   else if (RdEn && !WrEn) // Register Read Operation
     begin    
       RdData <= regArr[Address] ;
	     RdData_VLD <= 1'b1 ;
     end  
   else
     begin
	   RdData_VLD <= 1'b0 ;
     end	 
  end

// Output assignments for specific registers
assign OP_A = regArr[0] ;
assign OP_B = regArr[1] ;
assign UART_CONFIG = regArr[2] ;
assign DIV_RATIO = regArr[3] ;

endmodule