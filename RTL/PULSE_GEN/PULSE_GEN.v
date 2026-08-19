
module PULSE_GEN 
(
input    wire                      CLK,
input    wire                      RST,
input    wire                      lvl_sig,

output   wire                      pulse_sig  // single clock pulse output
);

reg  rcv_flop;      // received signal flop
reg  pulse_flop;  	// pulse signal flop 
					 
always @(posedge CLK or negedge RST)
 begin
  if(!RST)      
   begin
    rcv_flop <= 1'b0 ;
    pulse_flop <= 1'b0 ;	
   end
  else
   begin
    rcv_flop <= lvl_sig;   
    pulse_flop <= rcv_flop;
   end  
 end
 
// pulse generator 
assign pulse_sig = rcv_flop && !pulse_flop ;

endmodule