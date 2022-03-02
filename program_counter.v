module program_counter(Pc_w,Pc_in,C,L,E,clk,clr);
output  [7:0]Pc_w;
input   [7:0]Pc_in;
input   C,L,E,clk,clr;
reg     [7:0] count;


  assign Pc_w=(E)? count:8'bz;
  
always @(posedge clk)
  if (clr)     count<=8'b0;
  else if (L)  count<=Pc_in;
  else if (C)  count<= count+1'b1;
  else         count<= count;
endmodule

module t_program_counter;
 
  wire [7:0]Pc_w;
  reg  [7:0]Pc_in;  
  reg  C,L,E,clk,clr;
  
program_counter m(Pc_w,Pc_in,C,L,E,clk,clr);

 initial  begin clk=0; forever #50 clk=~clk; end
 initial  begin
     E=0;    L=0;
     clr=1;  C=0; E=0;
#100 clr=0;  C=0; E=0;
#100         C=1;
#100         C=0; E=1; Pc_in=8'h8; L=1;
#100         C=1; E=1; L=0;
#100         C=1; E=1; L=0;
end
endmodule