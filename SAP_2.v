module SAP_2(OUT_put,OOP,Con,IN_put,Clock,Clr);
output [7:0]OUT_put,OOP;
output [28:0] Con;
input  [7:0]IN_put;
input  Clock,Clr;
 
wire [28:0] Cont_Signal;
wire [07:0] Bus,AC_A,TR_T;
wire [07:0] address,Op_cod,Mem_in,Mem_out;
wire [05:0] state;
wire SF,ZF,CARRY; 

assign Con=Cont_Signal;
assign OOP=Op_cod;

                   //28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10 09 08 07 06 05 04 03 02 01 00
                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs;
ring_count r(.T(state),.rst(Cont_Signal[00]),.clk(Clock),.clr(Clr));
data_in_teg n(.Out_Bus(Bus),.In(IN_put),.E(Cont_Signal[28]),.clk(Clock),.clr(Clr));			
program_counter P(.Pc_w(Bus),.Pc_in(Bus),.C(Cont_Signal[26]),.L(Cont_Signal[27]),.E(Cont_Signal[25]),.clk(Clock),.clr(Clr));
MAR M(.out(address),.in(Bus),.L(Cont_Signal[24]),.clk(Clock),.clr(Clr));
Mem_2 g2(.Out(Mem_out),.Out_bus(Bus),.In(Mem_in),.R_W(Cont_Signal[23]),.C_R(Cont_Signal[22]),.L_S(Cont_Signal[21]),.Lf(Cont_Signal[08]),.Address(address),.clr(Clr));
MDR D(.Out_mem(Mem_in),.Out_bus(Bus),.In_mem(Mem_out),.In_bus(Bus),.Lm(Cont_Signal[20]),.Lb(Cont_Signal[19]),.Em(Cont_Signal[18]),.Eb(Cont_Signal[17]),.clk(Clock),.clr(Clr));
IR_Outport I(.Out(Op_cod),.In_Bus(Bus),.L(Cont_Signal[16]),.clk(Clock),.clr(Clr));
controller c(.Cont_Singal(Cont_Signal),.S_f(SF),.Z_f(ZF),.Cy(CARRY),.State(state),.Op_Code(Op_cod));
temp_eight_bit A(.Alu(AC_A),.Out_Bus(Bus),.In_Bus(Bus),.L(Cont_Signal[15]),.E(Cont_Signal[14]),.clk(Clock),.clr(Clr));
ALU g1(.out_bus(Bus),.carry(CARRY),.A(AC_A),.T(TR_T),.S1(Cont_Signal[13]),.S2(Cont_Signal[12]),.S3(Cont_Signal[11]),.S4(Cont_Signal[10]),.E(Cont_Signal[09]));
Flag f(.S_f(SF),.Z_f(ZF),.In(AC_A),.clk(Clock));
temp_eight_bit T(.Alu(TR_T),.Out_Bus(Bus),.In_Bus(Bus),.L(Cont_Signal[07]),.E(Cont_Signal[06]),.clk(Clock),.clr(Clr));
reg_eight_bit B(.Out_Bus(Bus),.In_Bus(Bus),.L(Cont_Signal[05]),.E(Cont_Signal[04]),.clk(Clock),.clr(Clr));
reg_eight_bit C(.Out_Bus(Bus),.In_Bus(Bus),.L(Cont_Signal[03]),.E(Cont_Signal[02]),.clk(Clock),.clr(Clr));
IR_Outport O(.Out(OUT_put),.In_Bus(Bus),.L(Cont_Signal[01]),.clk(Clock),.clr(Clr));





endmodule


module T_SAP_2;
reg  Clock,Clr;
reg  [7:0]IN_put;
wire [7:0]OUT_put,OOP;
wire [28:0] Con;

SAP_2 y(OUT_put,OOP,Con,IN_put,Clock,Clr);

initial  begin Clock=0; forever #50 Clock=~Clock; end
initial
begin
Clr=1;
#150 Clr=0;
end
endmodule
