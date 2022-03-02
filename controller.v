module controller(Cont_Singal,S_f,Z_f,Cy,State,Op_Code);
input      [5:0] State;
input      [7:0] Op_Code;
input      S_f,Z_f,Cy;
output reg [28:0] Cont_Singal;

/*parameter T1=18'd1,      T2=18'd2,      T3=18'd4,       T4=18'd8,       T5=18'16,      T6=18'd32,
          T7=18'd64,     T8=18'd128,    T9=18'd256,     T10=18'd512,    T11=18'1024,   T12=18'd2048,
          T13=18'd4096,  T14=18'd8192,  T15=18'd16384,  T16=18'd32768,  T17=18'65536,  T18=18'd131072;*/
		  
parameter T1=6'b00_0001,   T2=6'b00_0010,   T3=6'b00_0100,
		  T4=6'b00_1000,   T5=6'b01_0000,   T6=6'b10_0000;
		  
parameter ADD_B    = 8'H80, ADD_C    = 8'H81, ANA_B    = 8'HA0, ANA_C    = 8'HA1, ANI      = 8'HE6,
          CALL     = 8'HCD, CMA      = 8'H2F, DCR_A    = 8'H3D, DCR_B    = 8'H05, DCR_C    = 8'H0D,
		  HLT      = 8'H76, IN       = 8'HDB, INR_A    = 8'H3C, INR_B    = 8'H04, INR_C    = 8'H0C,
		  JM       = 8'HFA, JMP      = 8'HC3, JNZ      = 8'HC2, JZ       = 8'HCA, LDA      = 8'H3A,
		  MOV_A_B  = 8'H78, MOV_A_C  = 8'H79, MOV_B_A  = 8'H47, MOV_B_C  = 8'H41, MOV_C_A  = 8'H4F,
		  MOV_C_B  = 8'H48, MVI_A    = 8'H3E, MVI_B    = 8'H06, MVI_C    = 8'H0E, NOP      = 8'H00,
		  ORA_B    = 8'HB0, ORA_C    = 8'HB1, ORI      = 8'HF6, OUT      = 8'HD3, RAL      = 8'H17,
		  RAR      = 8'H1F, RET      = 8'HC9, STA      = 8'H32, SUB_B    = 8'H90, SUB_C    = 8'H91,
		  XRA_B    = 8'HA8, XRA_C    = 8'HA9, XRI      = 8'HEE;

always @(*)                         //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs;
     if (State==T1)  Cont_Singal<=29'b_0__0__0__1__1__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T2)  Cont_Singal<=29'b_0__0__1__0__0__x__x__x__1__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T3)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__1__1__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;
 //----------------------------------------------------Instructions---------------------------------------------------------
else case (Op_Code)
 //-------------------------------------------------------ADD_B-------------------------------------------------------------
ADD_B:                              //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__1__1__0__0__0__0__1__0__0__1__0__0__0__1;
	 
                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T5)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__1__1__0__0__1__0__0__0__0__0__0__0__0__1; 

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                 Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0; 
 //-------------------------------------------------------ADD_C-------------------------------------------------------------
ADD_C:                              //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__1__1__0__0__0__0__1__0__0__0__0__1__0__1;
	 
                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T5)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__1__1__0__0__1__0__0__0__0__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                 Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0; 
 //-------------------------------------------------------ANA_B-------------------------------------------------------------
ANA_B:                              //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__0__1__0__0__0__1;
	 
                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T5)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__0__0__0__0__1__0__0__0__0__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                 Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0; 
 //-------------------------------------------------------ANA_C-------------------------------------------------------------
ANA_C:                              //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__0__0__0__1__0__1;
	 
                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T5)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__0__0__0__0__1__0__0__0__0__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                 Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0; 
 //-------------------------------------------------------ANI-------------------------------------------------------------
ANI:                                //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4)  Cont_Singal<=29'b_0__0__0__1__1__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__1;
	 
                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T5)  Cont_Singal<=29'b_0__0__1__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__1__1__0__0__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T6)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__0__0__0__0__1__0__0__0__0__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                 Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0; 
 //-------------------------------------------------------CALL-------------------------------------------------------------
CALL:                               //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4)  Cont_Singal<=29'b_0__0__0__1__1__0__1__0__1__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;
	 
                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T5)  Cont_Singal<=29'b_0__0__0__0__0__0__1__0__1__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T6)  Cont_Singal<=29'b_0__1__0__0__0__0__0__0__0__0__0__1__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
//else if (State==T6)  Cont_Singal<=29'b_0__1__0__0__0__0__1__1__0__0__1__0__0__0__0__x__x__x__x__0__x__0__0__0__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                 Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0; 
 //-------------------------------------------------------CMA--------------------------------------------------------------
CMA:                                //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__1__0__1__0__1__0__0__0__0__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                 Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0; 
 //-------------------------------------------------------DCR_A-------------------------------------------------------------
DCR_A:                              //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__1__1__1__0__1__0__0__0__0__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                 Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0; 
 //-------------------------------------------------------DCR_B-------------------------------------------------------------
DCR_B:                              //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__1__1__0__1__0__0__1__0__0__1__0__0__0__1;
	 
                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T5)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__1__1__0__1__1__0__0__0__1__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                 Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0; 
 //-------------------------------------------------------DCR_C-------------------------------------------------------------
DCR_C:                              //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__1__1__0__1__0__0__1__0__0__0__0__1__0__1;
	 
                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T5)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__1__1__0__1__1__0__0__0__0__0__1__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                 Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0; 
 //-------------------------------------------------------HLT-------------------------------------------------------------
HLT:                                //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                 Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1; 
 //-------------------------------------------------------IN-------------------------------------------------------------
IN:                                 //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4)  Cont_Singal<=29'b_1__0__0__0__0__0__0__0__0__0__0__0__0__1__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                 Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0;  
 //-------------------------------------------------------INR_A-------------------------------------------------------------
INR_A:                              //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__0__1__1__0__1__0__0__0__0__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                 Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0; 
 //-------------------------------------------------------INR_B-------------------------------------------------------------
INR_B:                              //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__1__0__0__1__0__0__1__0__0__0__1;
	 
                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T5)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__1__1__0__0__0__1__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                 Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0; 
 //-------------------------------------------------------INR_C-------------------------------------------------------------
INR_C:                             //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4) Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__1__0__0__1__0__0__0__0__1__0__1;
	 
                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T5) Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__1__1__0__0__0__0__0__1__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0; 
 //--------------------------------------------------------JM--------------------------------------------------------------
JM:                                //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    if (State==T4)  Cont_Singal<=29'b_0__0__0__1__1__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;
    else if(S_f) begin
                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    if(State==T5)   Cont_Singal<=29'b_0__0__0__0__0__0__0__0__1__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    else if(State==T6)   Cont_Singal<=29'b_0__1__0__0__0__0__0__0__0__0__0__1__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    else            Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0; 
	end
    else  begin
                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    if(State==T5)   Cont_Singal<=29'b_0__0__1__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    else            Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0; 	
	end
 //--------------------------------------------------------JMP--------------------------------------------------------------
JMP:                               //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    if (State==T4)  Cont_Singal<=29'b_0__0__0__1__1__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;
	 
                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if(State==T5)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__1__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if(State==T6)  Cont_Singal<=29'b_0__1__0__0__0__0__0__0__0__0__0__1__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0; 
 //--------------------------------------------------------JNZ--------------------------------------------------------------
JNZ:                               //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    if (State==T4)  Cont_Singal<=29'b_0__0__0__1__1__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;
	else if((S_f)|(~Z_f)) begin
                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    if(State==T5)   Cont_Singal<=29'b_0__0__0__0__0__0__0__0__1__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;
	
	                               //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    else if(State==T6)   Cont_Singal<=29'b_0__1__0__0__0__0__0__0__0__0__0__1__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    else            Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0; 
	end
    else  begin
                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    if(State==T5)   Cont_Singal<=29'b_0__0__1__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    else            Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0; 	
	end
 //--------------------------------------------------------JZ--------------------------------------------------------------
JZ:                                //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    if (State==T4)  Cont_Singal<=29'b_0__0__0__1__1__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;
	else if(Z_f) begin
                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    if(State==T5)   Cont_Singal<=29'b_0__0__0__0__0__0__0__0__1__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;
	
	                               //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    else if(State==T6)   Cont_Singal<=29'b_0__1__0__0__0__0__0__0__0__0__0__1__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    else            Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0; 
	end
    else  begin
                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    if(State==T5)   Cont_Singal<=29'b_0__0__1__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    else            Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0; 	
	end
 //--------------------------------------------------------LDA--------------------------------------------------------------
LDA:                               //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    if (State==T4)  Cont_Singal<=29'b_0__0__0__1__1__0__0__1__1__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;
	 
                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if(State==T5)  Cont_Singal<=29'b_0__0__1__0__0__x__x__x__1__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if(State==T6)  Cont_Singal<=29'b_0__0__0__0__0__x__x__x__0__0__0__1__0__1__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
//else if(State==T6)  Cont_Singal<=29'b_0__0__1__0__0__0__0__0__0__0__0__1__0__1__0__x__x__x__x__0__x__0__0__0__0__0__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0;
 //--------------------------------------------------------MOV_A_B-----------------------------------------------------------
MOV_A_B:                           //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    if (State==T4)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__x__x__x__x__0__0__0__0__0__1__0__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0; 
 //--------------------------------------------------------MOV_A_C-----------------------------------------------------------
MOV_A_C:                           //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    if (State==T4)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__x__x__x__x__0__0__0__0__0__0__0__1__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0;
 //--------------------------------------------------------MOV_B_A-----------------------------------------------------------
MOV_B_A:                           //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    if (State==T4)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__1__x__x__x__x__0__0__0__0__1__0__0__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0;
 //--------------------------------------------------------MOV_B_C-----------------------------------------------------------
MOV_B_C:                           //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    if (State==T4)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__1__0__0__1__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0; 
 //--------------------------------------------------------MOV_C_A-----------------------------------------------------------
MOV_C_A:                           //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    if (State==T4)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__1__x__x__x__x__0__0__0__0__0__0__1__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0; 
 //--------------------------------------------------------MOV_C_B-----------------------------------------------------------
MOV_C_B:                           //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    if (State==T4)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__1__1__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0; 
 //--------------------------------------------------------MVI_A-------------------------------------------------------------
MVI_A:                             //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    if (State==T4)  Cont_Singal<=29'b_0__0__0__1__1__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;
	 
                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if(State==T5)  Cont_Singal<=29'b_0__0__1__0__0__0__0__0__1__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if(State==T6)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__1__0__1__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0;
 //--------------------------------------------------------MVI_B-------------------------------------------------------------
MVI_B:                             //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    if (State==T4)  Cont_Singal<=29'b_0__0__0__1__1__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;
	 
                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if(State==T5)  Cont_Singal<=29'b_0__0__1__0__0__0__0__0__1__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if(State==T6)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__1__0__0__0__x__x__x__x__0__0__0__0__1__0__0__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0;
 //--------------------------------------------------------MVI_C-------------------------------------------------------------
MVI_C:                             //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    if (State==T4)  Cont_Singal<=29'b_0__0__0__1__1__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;
	 
                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if(State==T5)  Cont_Singal<=29'b_0__0__1__0__0__0__0__0__1__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if(State==T6)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__1__0__0__0__x__x__x__x__0__0__0__0__0__0__1__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0;
 //----------------------------------------------------------NOP-------------------------------------------------------------
NOP:                               //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
    if (State==T4)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;
	 
                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if(State==T5)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0;
 //-------------------------------------------------------ORA_B-------------------------------------------------------------
ORA_B:                              //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4) Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__0__0__0__0__1__0__0__1__0__0__0__1;
	 
                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T5) Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__1__0__0__0__1__0__0__0__0__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0; 
 //-------------------------------------------------------ORA_C-------------------------------------------------------------
ORA_C:                              //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__0__0__0__0__1__0__0__0__0__1__0__1;
	 
                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T5)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__1__0__0__0__1__0__0__0__0__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                 Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0;
 //-------------------------------------------------------ORI-------------------------------------------------------------
ORI:                                //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4)  Cont_Singal<=29'b_0__0__0__1__1__0__0__0__0__0__0__0__0__0__0__1__0__0__0__0__0__0__0__0__0__0__0__0__1;
	 
                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T5)  Cont_Singal<=29'b_0__0__1__0__0__0__0__0__0__0__0__0__0__0__0__1__0__0__0__0__1__1__0__0__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T6)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__1__0__0__0__1__0__0__0__0__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                 Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0; 
 //-------------------------------------------------------OUT-------------------------------------------------------------
OUT:                                //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__1__x__x__x__x__0__0__0__0__0__0__0__0__1__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                 Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0;
 //-------------------------------------------------------RAL-------------------------------------------------------------
RAL:                                //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__0__0__0__1__1__0__0__0__0__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                 Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0; 
 //-------------------------------------------------------RAR-------------------------------------------------------------
RAR:                                //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__1__0__0__1__1__0__0__0__0__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                 Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0;  
 //-------------------------------------------------------RET-------------------------------------------------------------
RET:                               //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4) Cont_Singal<=29'b_0__0__0__0__0__1__0__0__1__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T5) Cont_Singal<=29'b_0__1__0__0__0__1__0__0__0__0__0__1__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0;
 //-------------------------------------------------------STA-------------------------------------------------------------
STA:                               //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
  //   if (State==T3) Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__x__0__0__0__0__0__0__0__1;
	 
                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4) Cont_Singal<=29'b_0__0__0__1__1__1__0__1__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T5) Cont_Singal<=29'b_0__0__1__0__0__1__0__1__0__1__0__0__0__0__1__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T6) Cont_Singal<=29'b_0__0__0__0__0__1__0__1__0__0__1__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__1;

                                   //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0;
 //-------------------------------------------------------SUB_B-------------------------------------------------------------
SUB_B:                              //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__0__0__1__0__0__1__0__0__0__1;
	 
                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T5)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__0__0__1__0__1__0__0__0__0__0__0__0__0__1; 

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                 Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0;
 //-------------------------------------------------------SUB_C-------------------------------------------------------------
SUB_C:                              //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__0__0__1__0__0__0__0__1__0__1;
	 
                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T5)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__0__0__1__0__1__0__0__0__0__0__0__0__0__1; 

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                 Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0;
 //-------------------------------------------------------XRA_B-------------------------------------------------------------
XRA_B:                              //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__0__0__0__1__0__0__1__0__0__0__1;
	 
                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T5)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__0__1__0__0__1__0__0__0__0__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                 Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0; 
 //-------------------------------------------------------XRA_C-------------------------------------------------------------
XRA_C:                              //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__0__0__0__1__0__0__0__0__1__0__1;
	 
                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T5)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__0__1__0__0__1__0__0__0__0__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                 Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0;
 //-------------------------------------------------------XRI-------------------------------------------------------------
XRI:                                //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
     if (State==T4)  Cont_Singal<=29'b_0__0__0__1__1__0__0__0__0__0__0__0__0__0__0__0__1__0__0__0__0__0__0__0__0__0__0__0__1;
	 
                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T5)  Cont_Singal<=29'b_0__0__1__0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__0__0__1__1__0__0__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else if (State==T6)  Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__1__0__0__1__0__0__1__0__0__0__0__0__0__0__0__1;

                                    //En_Lp_Cp_Ep_Lm_RW_CR_Em_Ld_Lw_Ed_Ew_Li_La_Ea_S1_S2_S3_S4_Eu_Lf_Lt_Et_Lb_Eb_Lc_Ec_Lo_Rs
else                 Cont_Singal<=29'b_0__0__0__0__0__0__0__0__0__0__0__0__0__0__0__x__x__x__x__0__0__0__0__0__0__0__0__0__0;



endcase
endmodule