module Flag(S_f,Z_f,In,clk);
input      [7:0]In;
input      clk;
output reg S_f,Z_f;

always @(posedge clk)

begin
S_f=(In[7]);
Z_f=(In==0);
end

//if (In==0)     begin Z_f=1'b1; S_f=1'b0; end
//else if(In[7]) begin S_f=1'b1; Z_f=1'b0; end
//else           begin Z_f=1'b0; S_f=1'b0; end

endmodule
 
module T_Flag;
reg   [7:0]In;
reg       clk;  
wire  S_f,Z_f;

Flag m(S_f,Z_f,In,clk);

initial begin clk=0; forever #50 clk=~clk; end
initial begin
     In=8'b0;
#100 In=8'b1000_0000;
#100 In=8'H4D;
end
endmodule