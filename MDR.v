module MDR(Out_mem,Out_bus,In_mem,In_bus,Lm,Lb,Em,Eb,clk,clr);
input  Lm,Lb,Em,Eb,clk,clr;
input  [7:0]In_mem,In_bus;
output [7:0]Out_mem,Out_bus;
reg    [7:0]data;

assign Out_bus=(Eb)?data:8'bz;
assign Out_mem=(Em)?data:8'bz;
//assign Out_mem=data;

always @(posedge clk)
if(clr)     data<=8'b0;
else if(Lb) data<=In_bus;
else if(Lm) data<=In_mem;
else        data<=data;
endmodule 
 
module t_MDR;
reg   Lm,Lb,Em,Eb,clk,clr;
reg   [7:0]In_mem,In_bus;
wire  [7:0]Out_mem,Out_bus;

MDR m(Out_mem,Out_bus,In_mem,In_bus,Lm,Lb,Em,Eb,clk,clr);

initial begin clk=0; forever #50 clk=~clk; end
initial begin
clr=1;  Lm=0;  Lb=0;  Em=0;  Eb=0;
#100 clr=0;  Lm=0;  Lb=1;  Em=1;  Eb=0; In_bus=8'h6;
#100 clr=0;  Lm=1;  Lb=0;  Em=0;  Eb=1; In_mem=8'h2;
end
endmodule