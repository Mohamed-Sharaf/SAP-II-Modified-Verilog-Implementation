module data_in_teg(Out_Bus,In,E,clk,clr);
input  E,clk,clr;
input  [7:0]In;
output [7:0]Out_Bus;
reg    [7:0]data;

assign Out_Bus=(E)?data:8'bz;

always @(posedge clk)

if (clr)    data<=8'b0;
else        data<=In;

endmodule

module T_data_in_teg;
reg  E,clk,clr;
reg  [7:0]In;
wire [7:0]Out_Bus;

data_in_teg m(Out_Bus,In,E,clk,clr);

initial begin clk=0; forever #50 clk=~clk; end

initial begin
clr=1;
#100 clr=0; In=8'h3; E=0;
#100 clr=0; In=8'h3; E=1;
#100 clr=0; In=8'h6; E=1;
end

endmodule