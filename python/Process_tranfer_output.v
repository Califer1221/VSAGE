
//CCO_2nd_DSM_top_15N 
//08-15-2024
module CCO_2nd_DSM_15N_1S_2kRin_v1(INP, INN, CLK, VDD, VSSA, VREFP, OUTP, OUTN,    IN_A, IN_AN, IN_B, IN_BN, IN2_A, IN2_AN, IN2_B, IN2_BN, VCTRLP, VCTRLN, VCTRLP2, VCTRLN2,    UP1, DOWN1, UP2, DOWN2, UP3, DOWN3, UP4, DOWN4); 
inout VDD, VSSA, VREFP; 
input CLK; 
input INP; 
input INN; 
output [14:0] OUTP; 
output [14:0] OUTN; 
inout VCTRLP2; 
inout VCTRLN2; 
output UP1, DOWN1; 
output UP2, DOWN2; 
output UP3, DOWN3; 
output UP4, DOWN4; 
inout IN_A; 
inout IN_B; 
inout IN_AN; 
inout IN_BN; 
inout IN2_A; 
inout IN2_B; 
inout IN2_AN; 
inout IN2_BN; 
inout VCTRLP; 
inout VCTRLN; 
wire [60:0] XA; 
wire [60:0] XB; 
wire [60:0] XAN; 
wire [60:0] XBN; 
wire [14:0] X2A; 
wire [14:0] X2B; 
wire [14:0] X2AN; 
wire [14:0] X2BN; 
wire [14:0] DAC_INPP; 
wire [14:0] DAC_INPN; 
wire [14:0] DAC_INNP; 
wire [14:0] DAC_INNN; 

assign In_A = XA[0]; 
assign In_AN = XAN[0]; 
assign In_B = XB[0]; 
assign In_BN = XBN[0]; 
assign In2_A = X2A[0]; 
assign In2_AN = X2AN[0]; 
assign In2_B = X2B[0]; 
assign In2_BN = X2BN[0]; 

RIN_2k I0  (.OUT(VCTRLP), .IN(INP)); 
RIN_2k I1  (.OUT(VCTRLN), .IN(INN)); 
CCO_ring_61N I2  (.X(XA), .XN(XAN), .VCTRL(VCTRLP), .VSS(VSSA)); 
CCO_ring_61N I3 (.X(XB), .XN(XBN), .VCTRL(VCTRLN), .VSS(VSSA)); 
LS_PFD2 I4 (.X1(XA[1]), .X1N(XAN[1]), .X2(XB[1]), .X2N(XBN[1]), .VDD(VDD), .VSS(VSSA), .UP1(UP1), .DOWN1(DOWN1), .UP2(UP2), .DOWN2(DOWN2)); 
LS_PFD2 I4_2 (.X1(XA[30]), .X1N(XAN[30]), .X2(XB[30]), .X2N(XBN[30]), .VDD(VDD), .VSS(VSSA), .UP1(UP3), .DOWN1(DOWN3), .UP2(UP4), .DOWN2(DOWN4)); 
CCO_ring2_15N I5  (.X(X2A), .XN(X2AN), .VCTRL(VCTRLP2), .VSS(VSSA)); 
CCO_ring2_15N I6 (.X(X2B), .XN(X2BN), .VCTRL(VCTRLN2), .VSS(VSSA)); 
LS_Quan_15N I7 (.OUT(OUTP), .VDD(VDD), .VSS(VSSA), .CLK(CLK), .INP(X2A), .INN(X2AN)); 
LS_Quan_15N I8 (.OUT(OUTN), .VDD(VDD), .VSS(VSSA), .CLK(CLK), .INP(X2B), .INN(X2BN)); 
DAC_BUF_15N I9 (.OUT(DAC_INPP), .OUT_N(DAC_INPN),  .VREFP(VREFP), .VREFN(VSSA), .INP(OUTP), .INN(OUTN)); 
DAC_BUF_15N I10 (.OUT(DAC_INNP), .OUT_N(DAC_INNN), .VREFP(VREFP), .VREFN(VSSA), .INP(OUTN), .INN(OUTP)); 
DAC_15N_30k I11 (.OUT(VCTRLP), .INP(DAC_INPP), .INN(DAC_INPN)); 
DAC_15N_30k I12 (.OUT(VCTRLN), .INP(DAC_INNP), .INN(DAC_INNN)); 
endmodule 

//CCO_ring_61N 
//08-15-2024
module CCO_ring_61N(X, XN, VCTRL, VSS); 
inout VCTRL, VSS; 
output [60:0] X; 
output [60:0] XN; 

CCO_unit_1S I0 (.OUT(XN[0]), .OUTN(X[0]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[60]), .INN(XN[60])); 
CCO_unit_1S I1 (.OUT(XN[1]), .OUTN(X[1]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[0]), .INN(XN[0]));
CCO_unit_1S I2 (.OUT(XN[2]), .OUTN(X[2]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[1]), .INN(XN[1]));
CCO_unit_1S I3 (.OUT(XN[3]), .OUTN(X[3]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[2]), .INN(XN[2]));
CCO_unit_1S I4 (.OUT(XN[4]), .OUTN(X[4]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[3]), .INN(XN[3]));
CCO_unit_1S I5 (.OUT(XN[5]), .OUTN(X[5]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[4]), .INN(XN[4]));
CCO_unit_1S I6 (.OUT(XN[6]), .OUTN(X[6]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[5]), .INN(XN[5]));
CCO_unit_1S I7 (.OUT(XN[7]), .OUTN(X[7]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[6]), .INN(XN[6]));
CCO_unit_1S I8 (.OUT(XN[8]), .OUTN(X[8]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[7]), .INN(XN[7]));
CCO_unit_1S I9 (.OUT(XN[9]), .OUTN(X[9]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[8]), .INN(XN[8]));
CCO_unit_1S I10 (.OUT(XN[10]), .OUTN(X[10]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[9]), .INN(XN[9]));
CCO_unit_1S I11 (.OUT(XN[11]), .OUTN(X[11]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[10]), .INN(XN[10]));
CCO_unit_1S I12 (.OUT(XN[12]), .OUTN(X[12]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[11]), .INN(XN[11]));
CCO_unit_1S I13 (.OUT(XN[13]), .OUTN(X[13]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[12]), .INN(XN[12]));
CCO_unit_1S I14 (.OUT(XN[14]), .OUTN(X[14]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[13]), .INN(XN[13]));
CCO_unit_1S I15 (.OUT(XN[15]), .OUTN(X[15]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[14]), .INN(XN[14]));
CCO_unit_1S I16 (.OUT(XN[16]), .OUTN(X[16]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[15]), .INN(XN[15]));
CCO_unit_1S I17 (.OUT(XN[17]), .OUTN(X[17]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[16]), .INN(XN[16]));
CCO_unit_1S I18 (.OUT(XN[18]), .OUTN(X[18]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[17]), .INN(XN[17]));
CCO_unit_1S I19 (.OUT(XN[19]), .OUTN(X[19]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[18]), .INN(XN[18]));
CCO_unit_1S I20 (.OUT(XN[20]), .OUTN(X[20]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[19]), .INN(XN[19]));
CCO_unit_1S I21 (.OUT(XN[21]), .OUTN(X[21]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[20]), .INN(XN[20]));
CCO_unit_1S I22 (.OUT(XN[22]), .OUTN(X[22]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[21]), .INN(XN[21]));
CCO_unit_1S I23 (.OUT(XN[23]), .OUTN(X[23]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[22]), .INN(XN[22]));
CCO_unit_1S I24 (.OUT(XN[24]), .OUTN(X[24]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[23]), .INN(XN[23]));
CCO_unit_1S I25 (.OUT(XN[25]), .OUTN(X[25]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[24]), .INN(XN[24]));
CCO_unit_1S I26 (.OUT(XN[26]), .OUTN(X[26]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[25]), .INN(XN[25]));
CCO_unit_1S I27 (.OUT(XN[27]), .OUTN(X[27]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[26]), .INN(XN[26]));
CCO_unit_1S I28 (.OUT(XN[28]), .OUTN(X[28]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[27]), .INN(XN[27]));
CCO_unit_1S I29 (.OUT(XN[29]), .OUTN(X[29]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[28]), .INN(XN[28]));
CCO_unit_1S I30 (.OUT(XN[30]), .OUTN(X[30]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[29]), .INN(XN[29]));
CCO_unit_1S I31 (.OUT(XN[31]), .OUTN(X[31]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[30]), .INN(XN[30]));
CCO_unit_1S I32 (.OUT(XN[32]), .OUTN(X[32]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[31]), .INN(XN[31]));
CCO_unit_1S I33 (.OUT(XN[33]), .OUTN(X[33]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[32]), .INN(XN[32]));
CCO_unit_1S I34 (.OUT(XN[34]), .OUTN(X[34]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[33]), .INN(XN[33]));
CCO_unit_1S I35 (.OUT(XN[35]), .OUTN(X[35]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[34]), .INN(XN[34]));
CCO_unit_1S I36 (.OUT(XN[36]), .OUTN(X[36]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[35]), .INN(XN[35]));
CCO_unit_1S I37 (.OUT(XN[37]), .OUTN(X[37]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[36]), .INN(XN[36]));
CCO_unit_1S I38 (.OUT(XN[38]), .OUTN(X[38]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[37]), .INN(XN[37]));
CCO_unit_1S I39 (.OUT(XN[39]), .OUTN(X[39]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[38]), .INN(XN[38]));
CCO_unit_1S I40 (.OUT(XN[40]), .OUTN(X[40]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[39]), .INN(XN[39]));
CCO_unit_1S I41 (.OUT(XN[41]), .OUTN(X[41]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[40]), .INN(XN[40]));
CCO_unit_1S I42 (.OUT(XN[42]), .OUTN(X[42]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[41]), .INN(XN[41]));
CCO_unit_1S I43 (.OUT(XN[43]), .OUTN(X[43]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[42]), .INN(XN[42]));
CCO_unit_1S I44 (.OUT(XN[44]), .OUTN(X[44]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[43]), .INN(XN[43]));
CCO_unit_1S I45 (.OUT(XN[45]), .OUTN(X[45]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[44]), .INN(XN[44]));
CCO_unit_1S I46 (.OUT(XN[46]), .OUTN(X[46]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[45]), .INN(XN[45]));
CCO_unit_1S I47 (.OUT(XN[47]), .OUTN(X[47]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[46]), .INN(XN[46]));
CCO_unit_1S I48 (.OUT(XN[48]), .OUTN(X[48]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[47]), .INN(XN[47]));
CCO_unit_1S I49 (.OUT(XN[49]), .OUTN(X[49]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[48]), .INN(XN[48]));
CCO_unit_1S I50 (.OUT(XN[50]), .OUTN(X[50]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[49]), .INN(XN[49]));
CCO_unit_1S I51 (.OUT(XN[51]), .OUTN(X[51]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[50]), .INN(XN[50]));
CCO_unit_1S I52 (.OUT(XN[52]), .OUTN(X[52]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[51]), .INN(XN[51]));
CCO_unit_1S I53 (.OUT(XN[53]), .OUTN(X[53]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[52]), .INN(XN[52]));
CCO_unit_1S I54 (.OUT(XN[54]), .OUTN(X[54]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[53]), .INN(XN[53]));
CCO_unit_1S I55 (.OUT(XN[55]), .OUTN(X[55]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[54]), .INN(XN[54]));
CCO_unit_1S I56 (.OUT(XN[56]), .OUTN(X[56]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[55]), .INN(XN[55]));
CCO_unit_1S I57 (.OUT(XN[57]), .OUTN(X[57]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[56]), .INN(XN[56]));
CCO_unit_1S I58 (.OUT(XN[58]), .OUTN(X[58]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[57]), .INN(XN[57]));
CCO_unit_1S I59 (.OUT(XN[59]), .OUTN(X[59]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[58]), .INN(XN[58]));
CCO_unit_1S I60 (.OUT(XN[60]), .OUTN(X[60]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[59]), .INN(XN[59]));
endmodule 

//CCO_unit_1S 
//08-15-2024
module CCO_unit_1S(IN, INN, VCTRL, VSS, OUT, OUTN); 
inout VCTRL, VSS; 
input IN, INN; 
output OUT, OUTN; 
CCO82 I0 (.OUT(OUT), .OUTN(OUTN), .VCTRL(VCTRL), .VSS(VSS), .IN(IN), .INN(INN)); 
endmodule 

//CCO82 
//08-15-2024
module CCO82(IN, INN, VCTRL, VSS, OUT, OUTN); 
inout VCTRL, VSS; 
input IN, INN; 
output OUT, OUTN; 

INVD8BWP12T30P140LVT I0(.ZN(OUTN), .VDD(VCTRL), .VSS(VSS), .I(IN)); 
INVD8BWP12T30P140LVT I1(.ZN(OUT), .VDD(VCTRL), .VSS(VSS), .I(INN)); 
INVD2BWP12T30P140LVT I2(.ZN(OUTN), .VDD(VCTRL), .VSS(VSS), .I(OUT)); 
INVD2BWP12T30P140LVT I3(.ZN(OUT), .VDD(VCTRL), .VSS(VSS), .I(OUTN)); 
endmodule 

//CCO_ring2_15N 
//08-15-2024
module CCO_ring2_15N(X, XN, VCTRL, VSS); 
inout VCTRL, VSS; 
output [14:0] X; 
output [14:0] XN; 

CCO2_unit_1S I0 (.OUT(XN[0]), .OUTN(X[0]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[14]), .INN(XN[14])); 
CCO2_unit_1S I1 (.OUT(XN[1]), .OUTN(X[1]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[0]), .INN(XN[0]));
CCO2_unit_1S I2 (.OUT(XN[2]), .OUTN(X[2]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[1]), .INN(XN[1]));
CCO2_unit_1S I3 (.OUT(XN[3]), .OUTN(X[3]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[2]), .INN(XN[2]));
CCO2_unit_1S I4 (.OUT(XN[4]), .OUTN(X[4]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[3]), .INN(XN[3]));
CCO2_unit_1S I5 (.OUT(XN[5]), .OUTN(X[5]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[4]), .INN(XN[4]));
CCO2_unit_1S I6 (.OUT(XN[6]), .OUTN(X[6]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[5]), .INN(XN[5]));
CCO2_unit_1S I7 (.OUT(XN[7]), .OUTN(X[7]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[6]), .INN(XN[6]));
CCO2_unit_1S I8 (.OUT(XN[8]), .OUTN(X[8]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[7]), .INN(XN[7]));
CCO2_unit_1S I9 (.OUT(XN[9]), .OUTN(X[9]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[8]), .INN(XN[8]));
CCO2_unit_1S I10 (.OUT(XN[10]), .OUTN(X[10]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[9]), .INN(XN[9]));
CCO2_unit_1S I11 (.OUT(XN[11]), .OUTN(X[11]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[10]), .INN(XN[10]));
CCO2_unit_1S I12 (.OUT(XN[12]), .OUTN(X[12]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[11]), .INN(XN[11]));
CCO2_unit_1S I13 (.OUT(XN[13]), .OUTN(X[13]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[12]), .INN(XN[12]));
CCO2_unit_1S I14 (.OUT(XN[14]), .OUTN(X[14]), .VCTRL(VCTRL), .VSS(VSS), .IN(X[13]), .INN(XN[13]));
endmodule 

//CCO2_unit_1S 
//08-15-2024
module CCO2_unit_1S(IN, INN, VCTRL, VSS, OUT, OUTN); 
inout VCTRL, VSS; 
input IN, INN; 
output OUT, OUTN; 
CCO82 I0 (.OUT(OUT), .OUTN(OUTN), .VCTRL(VCTRL), .VSS(VSS), .IN(IN), .INN(INN)); 
endmodule 

//CCO82 
//08-15-2024
module CCO82(IN, INN, VCTRL, VSS, OUT, OUTN); 
inout VCTRL, VSS; 
input IN, INN; 
output OUT, OUTN; 

INVD8BWP12T30P140LVT I0(.ZN(OUTN), .VDD(VCTRL), .VSS(VSS), .I(IN)); 
INVD8BWP12T30P140LVT I1(.ZN(OUT), .VDD(VCTRL), .VSS(VSS), .I(INN)); 
INVD2BWP12T30P140LVT I2(.ZN(OUTN), .VDD(VCTRL), .VSS(VSS), .I(OUT)); 
INVD2BWP12T30P140LVT I3(.ZN(OUT), .VDD(VCTRL), .VSS(VSS), .I(OUTN)); 
endmodule 

//LS_Quan_15N 
//08-15-2024
module LS_Quan_15N(INP, INN, CLK, VDD, VSS, OUT); 
inout VDD, VSS; 
input CLK; 
input [14:0] INP; 
input [14:0] INN; 
output [14:0] OUT; 
wire [14:0] net; 

LS I_LS_0 (.OUTP(net[0]), .OUTN(), .VDD(VDD), .GND(VSS), .VIP(INP[0]), .VIN(INN[0]));
LS I_LS_1 (.OUTP(net[1]), .OUTN(), .VDD(VDD), .GND(VSS), .VIP(INP[1]), .VIN(INN[1]));
LS I_LS_2 (.OUTP(net[2]), .OUTN(), .VDD(VDD), .GND(VSS), .VIP(INP[2]), .VIN(INN[2]));
LS I_LS_3 (.OUTP(net[3]), .OUTN(), .VDD(VDD), .GND(VSS), .VIP(INP[3]), .VIN(INN[3]));
LS I_LS_4 (.OUTP(net[4]), .OUTN(), .VDD(VDD), .GND(VSS), .VIP(INP[4]), .VIN(INN[4]));
LS I_LS_5 (.OUTP(net[5]), .OUTN(), .VDD(VDD), .GND(VSS), .VIP(INP[5]), .VIN(INN[5]));
LS I_LS_6 (.OUTP(net[6]), .OUTN(), .VDD(VDD), .GND(VSS), .VIP(INP[6]), .VIN(INN[6]));
LS I_LS_7 (.OUTP(net[7]), .OUTN(), .VDD(VDD), .GND(VSS), .VIP(INP[7]), .VIN(INN[7]));
LS I_LS_8 (.OUTP(net[8]), .OUTN(), .VDD(VDD), .GND(VSS), .VIP(INP[8]), .VIN(INN[8]));
LS I_LS_9 (.OUTP(net[9]), .OUTN(), .VDD(VDD), .GND(VSS), .VIP(INP[9]), .VIN(INN[9]));
LS I_LS_10 (.OUTP(net[10]), .OUTN(), .VDD(VDD), .GND(VSS), .VIP(INP[10]), .VIN(INN[10]));
LS I_LS_11 (.OUTP(net[11]), .OUTN(), .VDD(VDD), .GND(VSS), .VIP(INP[11]), .VIN(INN[11]));
LS I_LS_12 (.OUTP(net[12]), .OUTN(), .VDD(VDD), .GND(VSS), .VIP(INP[12]), .VIN(INN[12]));
LS I_LS_13 (.OUTP(net[13]), .OUTN(), .VDD(VDD), .GND(VSS), .VIP(INP[13]), .VIN(INN[13]));
LS I_LS_14 (.OUTP(net[14]), .OUTN(), .VDD(VDD), .GND(VSS), .VIP(INP[14]), .VIN(INN[14]));
quantizer I0 (.OUT(OUT[0]), .VDD(VDD), .VSS(VSS), .CLK(CLK), .IN(net[0]));
quantizer I1 (.OUT(OUT[1]), .VDD(VDD), .VSS(VSS), .CLK(CLK), .IN(net[1]));
quantizer I2 (.OUT(OUT[2]), .VDD(VDD), .VSS(VSS), .CLK(CLK), .IN(net[2]));
quantizer I3 (.OUT(OUT[3]), .VDD(VDD), .VSS(VSS), .CLK(CLK), .IN(net[3]));
quantizer I4 (.OUT(OUT[4]), .VDD(VDD), .VSS(VSS), .CLK(CLK), .IN(net[4]));
quantizer I5 (.OUT(OUT[5]), .VDD(VDD), .VSS(VSS), .CLK(CLK), .IN(net[5]));
quantizer I6 (.OUT(OUT[6]), .VDD(VDD), .VSS(VSS), .CLK(CLK), .IN(net[6]));
quantizer I7 (.OUT(OUT[7]), .VDD(VDD), .VSS(VSS), .CLK(CLK), .IN(net[7]));
quantizer I8 (.OUT(OUT[8]), .VDD(VDD), .VSS(VSS), .CLK(CLK), .IN(net[8]));
quantizer I9 (.OUT(OUT[9]), .VDD(VDD), .VSS(VSS), .CLK(CLK), .IN(net[9]));
quantizer I10 (.OUT(OUT[10]), .VDD(VDD), .VSS(VSS), .CLK(CLK), .IN(net[10]));
quantizer I11 (.OUT(OUT[11]), .VDD(VDD), .VSS(VSS), .CLK(CLK), .IN(net[11]));
quantizer I12 (.OUT(OUT[12]), .VDD(VDD), .VSS(VSS), .CLK(CLK), .IN(net[12]));
quantizer I13 (.OUT(OUT[13]), .VDD(VDD), .VSS(VSS), .CLK(CLK), .IN(net[13]));
quantizer I14 (.OUT(OUT[14]), .VDD(VDD), .VSS(VSS), .CLK(CLK), .IN(net[14]));
endmodule 

//DAC_BUF_15N 
//08-15-2024
module DAC_BUF_15N(OUT, OUT_N, VREFP, VREFN, INP, INN); 
inout VREFP, VREFN; 
input [14:0] INP; 
input [14:0] INN; 
output [14:0] OUT; 
output [14:0] OUT_N; 
wire [14:0] temp; 

INVD2BWP12T30P140LVT  I_INVDA_0 (.I(INP[0]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT[0]));
INVD2BWP12T30P140LVT  I_INVDA_1 (.I(INP[1]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT[1]));
INVD2BWP12T30P140LVT  I_INVDA_2 (.I(INP[2]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT[2]));
INVD2BWP12T30P140LVT  I_INVDA_3 (.I(INP[3]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT[3]));
INVD2BWP12T30P140LVT  I_INVDA_4 (.I(INP[4]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT[4]));
INVD2BWP12T30P140LVT  I_INVDA_5 (.I(INP[5]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT[5]));
INVD2BWP12T30P140LVT  I_INVDA_6 (.I(INP[6]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT[6]));
INVD2BWP12T30P140LVT  I_INVDA_7 (.I(INP[7]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT[7]));
INVD2BWP12T30P140LVT  I_INVDA_8 (.I(INP[8]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT[8]));
INVD2BWP12T30P140LVT  I_INVDA_9 (.I(INP[9]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT[9]));
INVD2BWP12T30P140LVT  I_INVDA_10 (.I(INP[10]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT[10]));
INVD2BWP12T30P140LVT  I_INVDA_11 (.I(INP[11]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT[11]));
INVD2BWP12T30P140LVT  I_INVDA_12 (.I(INP[12]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT[12]));
INVD2BWP12T30P140LVT  I_INVDA_13 (.I(INP[13]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT[13]));
INVD2BWP12T30P140LVT  I_INVDA_14 (.I(INP[14]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT[14]));

INVD2BWP12T30P140LVT  I_INVDB1_0 (.I(INN[0]), .VDD(VREFP), .VSS(VREFN), .ZN(temp[0]));
INVD2BWP12T30P140LVT  I_INVDB2_0 (.I(temp[0]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT_N[0]));
INVD2BWP12T30P140LVT  I_INVDB1_1 (.I(INN[1]), .VDD(VREFP), .VSS(VREFN), .ZN(temp[1]));
INVD2BWP12T30P140LVT  I_INVDB2_1 (.I(temp[1]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT_N[1]));
INVD2BWP12T30P140LVT  I_INVDB1_2 (.I(INN[2]), .VDD(VREFP), .VSS(VREFN), .ZN(temp[2]));
INVD2BWP12T30P140LVT  I_INVDB2_2 (.I(temp[2]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT_N[2]));
INVD2BWP12T30P140LVT  I_INVDB1_3 (.I(INN[3]), .VDD(VREFP), .VSS(VREFN), .ZN(temp[3]));
INVD2BWP12T30P140LVT  I_INVDB2_3 (.I(temp[3]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT_N[3]));
INVD2BWP12T30P140LVT  I_INVDB1_4 (.I(INN[4]), .VDD(VREFP), .VSS(VREFN), .ZN(temp[4]));
INVD2BWP12T30P140LVT  I_INVDB2_4 (.I(temp[4]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT_N[4]));
INVD2BWP12T30P140LVT  I_INVDB1_5 (.I(INN[5]), .VDD(VREFP), .VSS(VREFN), .ZN(temp[5]));
INVD2BWP12T30P140LVT  I_INVDB2_5 (.I(temp[5]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT_N[5]));
INVD2BWP12T30P140LVT  I_INVDB1_6 (.I(INN[6]), .VDD(VREFP), .VSS(VREFN), .ZN(temp[6]));
INVD2BWP12T30P140LVT  I_INVDB2_6 (.I(temp[6]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT_N[6]));
INVD2BWP12T30P140LVT  I_INVDB1_7 (.I(INN[7]), .VDD(VREFP), .VSS(VREFN), .ZN(temp[7]));
INVD2BWP12T30P140LVT  I_INVDB2_7 (.I(temp[7]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT_N[7]));
INVD2BWP12T30P140LVT  I_INVDB1_8 (.I(INN[8]), .VDD(VREFP), .VSS(VREFN), .ZN(temp[8]));
INVD2BWP12T30P140LVT  I_INVDB2_8 (.I(temp[8]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT_N[8]));
INVD2BWP12T30P140LVT  I_INVDB1_9 (.I(INN[9]), .VDD(VREFP), .VSS(VREFN), .ZN(temp[9]));
INVD2BWP12T30P140LVT  I_INVDB2_9 (.I(temp[9]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT_N[9]));
INVD2BWP12T30P140LVT  I_INVDB1_10 (.I(INN[10]), .VDD(VREFP), .VSS(VREFN), .ZN(temp[10]));
INVD2BWP12T30P140LVT  I_INVDB2_10 (.I(temp[10]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT_N[10]));
INVD2BWP12T30P140LVT  I_INVDB1_11 (.I(INN[11]), .VDD(VREFP), .VSS(VREFN), .ZN(temp[11]));
INVD2BWP12T30P140LVT  I_INVDB2_11 (.I(temp[11]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT_N[11]));
INVD2BWP12T30P140LVT  I_INVDB1_12 (.I(INN[12]), .VDD(VREFP), .VSS(VREFN), .ZN(temp[12]));
INVD2BWP12T30P140LVT  I_INVDB2_12 (.I(temp[12]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT_N[12]));
INVD2BWP12T30P140LVT  I_INVDB1_13 (.I(INN[13]), .VDD(VREFP), .VSS(VREFN), .ZN(temp[13]));
INVD2BWP12T30P140LVT  I_INVDB2_13 (.I(temp[13]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT_N[13]));
INVD2BWP12T30P140LVT  I_INVDB1_14 (.I(INN[14]), .VDD(VREFP), .VSS(VREFN), .ZN(temp[14]));
INVD2BWP12T30P140LVT  I_INVDB2_14 (.I(temp[14]), .VDD(VREFP), .VSS(VREFN), .ZN(OUT_N[14]));
endmodule 

//DAC_15N_30k 
//08-15-2024
module DAC_15N_30k(INP, INN, OUT); 
inout [14:0] INP; 
inout [14:0] INN; 
inout OUT; 

DAC_u_30k IP0 (.OUT(OUT), .IN(INP[0]));
DAC_u_30k IN0 (.OUT(OUT), .IN(INN[0]));
DAC_u_30k IP1 (.OUT(OUT), .IN(INP[1]));
DAC_u_30k IN1 (.OUT(OUT), .IN(INN[1]));
DAC_u_30k IP2 (.OUT(OUT), .IN(INP[2]));
DAC_u_30k IN2 (.OUT(OUT), .IN(INN[2]));
DAC_u_30k IP3 (.OUT(OUT), .IN(INP[3]));
DAC_u_30k IN3 (.OUT(OUT), .IN(INN[3]));
DAC_u_30k IP4 (.OUT(OUT), .IN(INP[4]));
DAC_u_30k IN4 (.OUT(OUT), .IN(INN[4]));
DAC_u_30k IP5 (.OUT(OUT), .IN(INP[5]));
DAC_u_30k IN5 (.OUT(OUT), .IN(INN[5]));
DAC_u_30k IP6 (.OUT(OUT), .IN(INP[6]));
DAC_u_30k IN6 (.OUT(OUT), .IN(INN[6]));
DAC_u_30k IP7 (.OUT(OUT), .IN(INP[7]));
DAC_u_30k IN7 (.OUT(OUT), .IN(INN[7]));
DAC_u_30k IP8 (.OUT(OUT), .IN(INP[8]));
DAC_u_30k IN8 (.OUT(OUT), .IN(INN[8]));
DAC_u_30k IP9 (.OUT(OUT), .IN(INP[9]));
DAC_u_30k IN9 (.OUT(OUT), .IN(INN[9]));
DAC_u_30k IP10 (.OUT(OUT), .IN(INP[10]));
DAC_u_30k IN10 (.OUT(OUT), .IN(INN[10]));
DAC_u_30k IP11 (.OUT(OUT), .IN(INP[11]));
DAC_u_30k IN11 (.OUT(OUT), .IN(INN[11]));
DAC_u_30k IP12 (.OUT(OUT), .IN(INP[12]));
DAC_u_30k IN12 (.OUT(OUT), .IN(INN[12]));
DAC_u_30k IP13 (.OUT(OUT), .IN(INP[13]));
DAC_u_30k IN13 (.OUT(OUT), .IN(INN[13]));
DAC_u_30k IP14 (.OUT(OUT), .IN(INP[14]));
DAC_u_30k IN14 (.OUT(OUT), .IN(INN[14]));
endmodule 



module LS_PFD2 (X1, X1N, X2, X2N, VDD, VSS, UP1, DOWN1, UP2, DOWN2);
output UP1, DOWN1, UP2, DOWN2;
inout VDD, VSS;
input X1, X1N, X2, X2N;
wire net1, net2;
    LS I1 (.OUTP(net1), .OUTN(net3), .VDD(VDD), .GND(VSS), .VIP(X1), .VIN(X1N));
    LS I2 (.OUTP(net2), .OUTN(net4), .VDD(VDD), .GND(VSS), .VIP(X2), .VIN(X2N));
    PFD I3 (.DOWN(DOWN1), .UP(UP1), .VSS(VSS), .VDD(VDD), .IN1(net1), . IN2(net2));
    PFD I4 (.DOWN(DOWN2), .UP(UP2), .VSS(VSS), .VDD(VDD), .IN1(net3), . IN2(net4));
endmodule




module quantizer(OUT, VDD, VSS, IN, CLK);
inout VDD, VSS;
input IN, CLK;
output OUT;

    DFD1BWP12T30P140LVT   I0 (.D(IN), .CP(CLK), .VDD(VDD), .VSS(VSS), .Q(net1), .QN());
    DFD1BWP12T30P140LVT   I1 (.D(net1), .CP(CLK), .VDD(VDD), .VSS(VSS), .Q(net2), .QN());
    XOR2D1BWP12T30P140LVT I3 (.A1(net1), .A2(net2), .VDD(VDD), .VSS(VSS), .Z(OUT));
    
endmodule


module PFD ( DOWN, UP, VSS, VDD, IN1, IN2 );
output  DOWN, UP;
inout  VSS, VDD;
input  IN1, IN2;
wire net1, net4;
wire net5, net6, net7, net8;
wire net9, net10, net11, net12, net13;
    
    ND2D0BWP12T30P140LVT I47 ( .ZN(net1), .VDD(VDD), .VSS(VSS), .A1(net12), .A2(net11));
    DFCND1BWP12T30P140LVT I45 ( .Q(net12), .QN(), .VDD(VDD), .VSS(VSS), .CDN(net4), .CP(IN1), .D(VDD));
    DFCND1BWP12T30P140LVT I46 ( .Q(net11), .QN(), .VDD(VDD), .VSS(VSS), .CDN(net4), .CP(IN2), .D(VDD));
    DEL075D1BWP12T30P140LVT I5 ( .Z(net4), .VDD(VDD), .VSS(VSS), .I(net1));
    CKBD3BWP12T30P140LVT I8 ( .Z(net5), .VDD(VDD), .VSS(VSS), .I(net11));
    CKBD3BWP12T30P140LVT I16 ( .Z(net13), .VDD(VDD), .VSS(VSS), .I(net12));
    CKBD6BWP12T30P140LVT I9 ( .Z(DOWN), .VDD(VDD), .VSS(VSS), .I(net5));
    CKBD6BWP12T30P140LVT I18 ( .Z(UP), .VDD(VDD), .VSS(VSS), .I(net13));

endmodule








//RIN_2k 
//08-15-2024
module RIN_2k(IN, OUT); 
inout  IN; 
inout  OUT; 

RES1 I0 (.Z(net0), .I(IN));
RES1 I1 (.Z(OUT), .I(net0));
endmodule 

//DAC_u_30k 
//08-15-2024
module DAC_u_30k(IN, OUT); 
inout  IN; 
inout  OUT; 

RES25 I0 (.Z(net0), .I(IN));
RES5 I1 (.Z(OUT), .I(net0));
endmodule 
