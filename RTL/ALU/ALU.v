
module ALU #( parameter OPER_WIDTH = 8,             // Input width
                        OUT_WIDTH = OPER_WIDTH*2    // Output width (16 bit to accommodate operations like multiplication)
)
(
  input wire [OPER_WIDTH-1:0] A,        // Input operand A
  input wire [OPER_WIDTH-1:0] B,        // Input operand B
  input wire                  EN,       // Enable signal
  input wire [3:0]            ALU_FUN,  // ALU function select
  input wire                  CLK,
  input wire                  RST,  
  
  output reg [OUT_WIDTH-1:0]  ALU_OUT,   // ALU result output
  output reg                  OUT_VALID  // Output valid signal
);
  
  reg [OUT_WIDTH-1:0] ALU_OUT_Comb;
  reg                 OUT_VALID_Comb;
  
// Sequential always block: register outputs
always @(posedge CLK or negedge RST)
 begin
  if(!RST)
   begin
    ALU_OUT   <= {OUT_WIDTH{1'b0}} ;
    OUT_VALID <= 1'b0 ;	
   end
  else 
   begin  
    ALU_OUT   <= ALU_OUT_Comb ;
    OUT_VALID <= OUT_VALID_Comb ;
   end	
 end  
  
// Combinational always block: ALU operations  
always @(*)
 begin
   OUT_VALID_Comb = 1'b0 ;
   ALU_OUT_Comb   = {OUT_WIDTH{1'b0}} ;
   if(EN)
    begin   
	 OUT_VALID_Comb = 1'b1 ;
     case (ALU_FUN) 
     4'b0000: begin
               ALU_OUT_Comb = A + B;
              end
     4'b0001: begin
               ALU_OUT_Comb = A - B;
              end
     4'b0010: begin
               ALU_OUT_Comb = A * B;
              end
     4'b0011: begin
               ALU_OUT_Comb = (B != 0) ? (A / B) : {OUT_WIDTH{1'b0}}; // Avoid divide-by-zero
              end
     4'b0100: begin
               ALU_OUT_Comb = A & B;
              end
     4'b0101: begin
               ALU_OUT_Comb = A | B;
              end
     4'b0110: begin
               ALU_OUT_Comb = ~ (A & B);
              end
     4'b0111: begin
               ALU_OUT_Comb = ~ (A | B);
              end     
     4'b1000: begin
               ALU_OUT_Comb =  (A ^ B);
              end
     4'b1001: begin
               ALU_OUT_Comb = ~ (A ^ B);
              end           
     4'b1010: begin
              if (A==B)
                 ALU_OUT_Comb = {{(OUT_WIDTH-1){1'b0}}, 1'b1};
              else
                 ALU_OUT_Comb = {OUT_WIDTH{1'b0}};
              end
     4'b1011: begin
               if (A>B)
                 ALU_OUT_Comb = {{(OUT_WIDTH-2){1'b0}}, 2'b10};
               else
                 ALU_OUT_Comb = {OUT_WIDTH{1'b0}};
              end 
     4'b1100: begin
               if (A<B)
                 ALU_OUT_Comb = {{(OUT_WIDTH-2){1'b0}}, 2'b11};
               else
                 ALU_OUT_Comb = {OUT_WIDTH{1'b0}};
              end     
     4'b1101: begin
               ALU_OUT_Comb = A >> 1;
              end
     4'b1110: begin 
               ALU_OUT_Comb = A << 1;
              end
    default: begin
               ALU_OUT_Comb = {OUT_WIDTH{1'b0}};
             end
    endcase
   end
  else
   begin
	 OUT_VALID_Comb = 1'b0 ;
   ALU_OUT_Comb   = {OUT_WIDTH{1'b0}} ;
   end   
 end  
  
endmodule