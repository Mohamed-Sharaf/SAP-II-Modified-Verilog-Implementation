module ring_count(T,rst,clk,clr);
input      rst,clk,clr;
output reg [5:0]T;


always @ ( negedge clk)
if(clr)       T<=6'b00_0001;
else if(~rst) T<=6'b00_0001;
else          T<={T[4:0],T[5]};
endmodule 

module  T_ring_count;
reg   rst,clk,clr;
wire [5:0]T;
ring_count M(T,rst,clk,clr);
initial begin 
clk=1'b0;
forever #50 clk=~clk;
end
initial begin 
clr =1'b1; rst=1;
#10  clr=1'b0; 
#8000 rst=0;
end 
endmodule
