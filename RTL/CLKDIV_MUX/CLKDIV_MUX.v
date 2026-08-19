
module CLKDIV_MUX #(parameter WIDTH = 8)  (
input    wire     [5:0]              IN,

output   reg      [WIDTH-1:0]        OUT
);

always @(*)
  begin
	OUT = 'd1;	// default value
	case(IN) 
	6'b100000 : OUT = 'd1;	// divide by 1
	6'b010000 : OUT = 'd2;	// divide by 2
	6'b001000 : OUT = 'd4;	// divide by 4
	6'b000100 : OUT = 'd8;	// divide by 8
	default   : OUT = 'd1;	// default divide by 1			
	endcase
  end	
  
endmodule