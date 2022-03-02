module ALU(out_bus,carry,/*out_flag,*/A,T,S1,S2,S3,S4,E);
input  [7:0]A,T;
input  S1,S2,S3,S4,E;
output [7:0]out_bus;
output reg carry;
//output out_flag;
reg    [7:0]out;

assign out_bus=E?out:8'bz;
//assign out_flag=(A<0)?1'b1:((A==0)?1'b0:1'bz);

always @(*)
case ({S4,S3,S2,S1})
 
 4'h0: out = A & T;
 4'h1: out = A | T;
 4'h2: out = A ^ T; 
 4'h3: {carry,out} = A + T;
 4'h4: {carry,out} = A - T;
 4'h5: out = ~A;
 4'h6: out = A + 1'b1;
 4'h7: out = A - 1'b1;
 4'h8: out = {A[6:0],A[7]};
 4'h9: out = {A[0],A[7:1]};
 4'ha: out = T + 1'b1;
 4'hb: out = T - 1'b1; 
 
endcase

endmodule

module t_ALU;
reg   [7:0]A,T;
reg   S1,S2,S3,S4,E;
wire  [7:0]out_bus;
wire  carry;
//wire  out_flag;

 ALU m(out_bus,carry,/*out_flag,*/A,T,S1,S2,S3,S4,E);
 
initial begin 
S1=0; S2=1; S3=1; S4=0; E=1; A=8'b0;  T=8'b00110101;
#100 S1=0; S2=0; S3=0; S4=1; E=1; A=8'b00111100;  T=8'b00110101;
#100 S1=1; S2=1; S3=0; S4=1; E=1;                 T=8'b00110101;
#100 S1=0; S2=0; S3=1; S4=0; E=1; A=8'b00011100;  T=8'b01110101;
#100 S1=1; S2=1; S3=0; S4=0; E=1; A=8'b01001111;  T=8'b00111111;
 end
 endmodule
 
 
