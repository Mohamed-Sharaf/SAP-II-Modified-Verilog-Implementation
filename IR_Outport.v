module IR_Outport(Out,In_Bus,L,clk,clr);
input      L,clk,clr;
input      [7:0]In_Bus;
output reg [7:0]Out;
always @(posedge clk)
if(clr)    Out<=8'b0;
else if(L) Out<=In_Bus;
else	   Out<=Out;
endmodule

module t_IR_Outport;
reg  L,clk,clr;
reg  [7:0]In_Bus;
wire [7:0]Out;

IR_Outport m(Out,In_Bus,L,clk,clr);

initial begin clk=0; forever #50 clk=~clk; end
initial begin 
clr=1;
#100 clr=0; In_Bus=8'H0A; L=1;
#100 clr=0;  L=0;
end
endmodule

