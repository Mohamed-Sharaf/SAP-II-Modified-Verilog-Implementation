module Mem_2(Out,Out_bus,In,R_W,C_R,L_S,Lf,Address,clr);
	output [07:0]Out,Out_bus;
	input  [07:0]In;
	input  [07:0]Address;
	input  R_W,C_R,L_S,Lf,clr;
	reg    [07:0]Data;
	reg    [07:0]Datam;
	reg    [07:0]mem[255:0];
	
	assign Out=Data;
	assign Out_bus=Lf?Data:8'hz;
	
	always @(*)
	if (clr) begin      //     Op_Co  Add
	                mem[00]<=8'b0011_1010; // LDA      = 8'H3A
					mem[01]<=8'b0000_0101;
					mem[02]<=8'b0011_1110; // MVI_A,98 
					mem[03]<=8'b1001_1000; 
					mem[04]<=8'b0011_0010; // STA      = 8'H32 
					mem[05]<=8'b0110_0110; 
                    mem[06]<=8'b0011_1110; // MVI_A,38 
					mem[07]<=8'b0011_1000;
					mem[08]<=8'b1101_0011; // OUT   
	                mem[09]<=8'b0011_1010; // LDA      = 8'H3A
					mem[10]<=8'b0110_0110;
					mem[11]<=8'b1101_0011; // OUT 
					mem[12]<=8'b1100_1101; // CALL     = 8'HCD
					mem[13]<=8'b0000_1111;
					mem[14]<=8'b1101_0011;
					mem[15]<=8'b1110_0110; // ANI      = 8'HE6
					mem[16]<=8'b0001_1000;
					mem[17]<=8'b1101_0011; // OUT
					mem[18]<=8'b1110_1110; // XRI      = 8'HEE
					mem[19]<=8'b0111_1110; 
					mem[20]<=8'b1101_0011; // OUT
					mem[21]<=8'b0000_0110; // MVI_B    = 8'H06
					mem[22]<=8'b0010_0010; 
					mem[23]<=8'b1000_0000; // ADD_B    = 8'H80 
					mem[24]<=8'b1101_0011; // OUT 
					mem[25]<=8'b0000_0101; // DCR_B    = 8'H05
					mem[26]<=8'b1010_0000; // ANA_B    = 8'HA0
					mem[27]<=8'b1101_0011; // OUT
					mem[28]<=8'b1100_1010; // JZ       = 8'HCA
					mem[29]<=8'b0011_0001;
					mem[30]<=8'b1100_1001; // RET      = 8'HC9 
					mem[31]<=8'b0111_0110; // HLT		
	         end 
			 
	else case ({R_W,C_R,L_S})

3'b000:        Data<=mem[Address];     //read	
3'b001: begin  Datam<=mem[Address];  Data<=mem[Datam]; end //LDA
3'b010: begin  Data<=mem[Address];   Datam=Address+8'h01;  mem[255]=Datam;   end   //call
3'b011:        mem[Data]=In;
3'b100:        Data<=mem[255];         //RET
3'b101: begin  Data=mem[Address];    mem[Data]=In;    end //STA
3'b110:        mem[Address]<=In;       //write

    endcase

endmodule

module t_Mem_2;
reg  R_W,C_R,L_S,Lf,clr;
reg  [7:0]Address;
reg  [07:0]In;
wire [07:0]Out,Out_bus;
Mem_2 m(Out,Out_bus,In,R_W,C_R,L_S,Lf,Address,clr);
initial
begin 
    clr=1;  
#50 clr=0;   Address=8'h01; R_W=0; C_R=0; L_S=1;
#50 clr=0;   Address=8'h05; R_W=0; C_R=0; L_S=1;
#50 clr=0;   Address=8'h06; R_W=1; C_R=0; L_S=1; In=8'h22;
#50 clr=0;   Address=8'h85; R_W=1; C_R=1; L_S=0; 
#50 clr=0;   Address=8'h2b;
#50 clr=0;   In=8'h34; R_W=0; C_R=1;
#50 clr=0;             R_W=1; C_R=0;
end
endmodule