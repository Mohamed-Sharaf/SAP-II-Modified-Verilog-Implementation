module  MAR(out,in,L,clk,clr);
output reg [7:0]   out;
input      L,clk,clr;
input      [7:0]   in;

always@(posedge clk)

if(clr)    out<=8'b0;
else if(L) out<=in;
else 	   out<= out;

endmodule

module T_MAR;
reg  L,clk,clr;
reg  [7:0]   in;
wire [7:0]   out;

MAR m(out,in,L,clk,clr);

initial begin clk=0; forever #50 clk=~clk; end
initial begin
clr=1;
#100 clr=0; L=1; in=8'h32;
#100 clr=0; L=0; 
end
endmodule