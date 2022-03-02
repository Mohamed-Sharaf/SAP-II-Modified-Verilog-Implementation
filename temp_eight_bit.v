module temp_eight_bit(Alu,Out_Bus,In_Bus,L,E,clk,clr);
input   L,E,clk,clr;
input   [7:0] In_Bus;
output  [7:0] Alu,Out_Bus;
reg     [7:0] data;

assign Alu=data;
assign Out_Bus = E?data:8'bz;
always@(posedge clk)
if(clr)    data <=8'b0;
else if(L) data <= In_Bus;
else       data <= data;  
endmodule

module t_temp_eight_bit;
reg  L,E,clk,clr;
reg  [7:0] In_Bus;
wire [7:0] Alu,Out_Bus;

temp_eight_bit m(Alu,Out_Bus,In_Bus,L,E,clk,clr);

initial
begin 
clk=1;
forever #50 clk=~clk;
end
initial
begin 
     clr=1; L=1; In_Bus=8'b00101100; E=1;
#100 clr=0; L=1; In_Bus=8'b10101100; E=0;
#40  clr=0; L=0; In_Bus=8'b00101100; E=1;
#40  clr=0; L=1; In_Bus=8'b00101100; E=1;
end
endmodule