%estimate the areas
%12/19/2021
%06/11/2022 2nd order with multiple PFDs

% input
CCO_size = 2;
CCO_load = 1;
N = 127;
S = 1;
Rin_value = 5;
RDAC_u = 5*15;%6*63;

N_PFD = 4;

%2nd stage of CCO
CCO_size2 = 1;
CCO_load2 = 1;
N2 = 15;
S2 = 1;

%height of standard cell
H = 1.8;

%scale factor
factor = 0.7;

%%%%%%%%%%%%%%%%%%%%%%%%
CCO_size_lib = ["CCO82", "CCO124", "CCO164", "CCO206", "CCO248"];
%sum of 2 inv
CCO_size_lib_size = [3.2, 4.8, 5.8, 7.2, 8.8];

CCO_load_lib = ["DCAP0", "DCAP1", "DCAP4", "DCAP8", "DCAP16", "DCAP32", "DCAP64"];
%size of 1 DCAP
CCO_load_lib_size = [0, 0.6, 0.8, 1.6, 3.2, 6.4, 12.8];

RES_lib = ["RES25", "RES10", "RES5", "RES1"];
RES_lib_size = [28.8, 12.2, 6.7, 2.2];
%%%%%%%%%%%%%%%%%%%%%%%%


%CCO1 1st stage
area_CCO = (CCO_size_lib_size(CCO_size) + CCO_load_lib_size(CCO_load))*2 * N * S * H;
area_CCO_act = area_CCO/factor;

%PFD+LS
%level shifter=5.165*2
%+     4.8*2+   1.2   +   0.8    + 1.4*2 + 2.4*2
%      DFCND1  DEL005      ND2D0    CKBD3   CKBD6
% 2 PFD and 2 LS contributes to 2 PFDs
area_PFD=(5.165+4.8*2+1.2+ 0.8+ 1.4*2 + 2.4*2) * 2 * H * N_PFD/2;
area_PFD_act=area_PFD/factor;

%Switch
% 4*2.4    +  22.8*2
% INVD8        switches
area_SW=(4*2.4    +  22.8*2)*H*N_PFD;
area_SW_act=area_SW/factor;

%CCO2 2nd stage
% 0.8*2+   2.4*2
% INVD2   INVD8
area_CCO2_1= (CCO_size_lib_size(CCO_size2) + CCO_load_lib_size(CCO_load2))*2 * N2 * S2 * H;
area_CCO2_act_1=area_CCO2_1/factor;

%CCO3
% 0.8*2+   2.4*2
% INVD2   INVD8
%area_CCO2_2= (0.8*2+   2.4*2)*H*N;
%area_CCO2_act_2=area_CCO2_2/factor;

%Level_shift+quantizer
%   5.165+         (4*2+2)
%  level shifter     quantizer
area_LaQ=(5.165+         (4*2+2))*H*N2;
area_LaQ_act=area_LaQ/factor;

%DACBUF1
% INVD2*3 = 0.8*3
area_DACBUF1=0.8*3*H*N2;
area_DACBUF_act1=area_DACBUF1/factor;

%DACBUF2
% INVD2*3 = 0.8*3
area_DACBUF2=0.8*3*H*N2;
area_DACBUF_act2=area_DACBUF2/factor;

%DAC1
s_dac = res_gen(RDAC_u);
area_DAC1= dot(RES_lib_size, s_dac)*H*N2*2;
area_DAC_act1=area_DAC1/factor;

%DAC2
%s_dac = res_gen(RDAC_u);
area_DAC2= dot(RES_lib_size, s_dac)*H*N2*2;
area_DAC_act2=area_DAC2/factor;

%Rin
s_Rin = res_gen(Rin_value);
area_Rin = dot(RES_lib_size, s_Rin) * H;
area_Rin_act = area_Rin/factor;

%%%calculate width and length of each block

%Rin L is height
if (Rin_value < 25)
    W_Rin = round(area_Rin_act/H);
    L_Rin = max([round(area_Rin_act/W_Rin),4]);
else
    W_Rin = RES_lib_size(1) + 4;
    L_Rin = round(area_Rin_act/W_Rin);
end
Rin = [W_Rin, L_Rin];

%CCO W/L = 2/3
W_CCO = round((area_CCO_act/6)^0.5 * 2);
L_CCO = round(area_CCO_act/W_CCO/H)*H;
CCO = [W_CCO, L_CCO];


%PFD W/L = 1/2
W_PFD = round((area_PFD_act/2)^0.5);
L_PFD = round(area_PFD_act/W_PFD);
PFD = [W_PFD, L_PFD];

%switch W/L = 1/4
W_SW = round((area_SW_act/4)^0.5);
L_SW = round(area_SW_act/W_SW);
SW = [W_SW, L_SW];


%CCO2 & CCO3 2/3
W_CCO2 = round((area_CCO2_act_1/6)^0.5*2);
L_CCO2= round(area_CCO2_act_1/W_CCO2);
CCO2 = [W_CCO2, L_CCO2];
CCO3=  [W_CCO2, L_CCO2];


%Level_shift+quantizer
W_LaQ = round((area_LaQ_act/2)^0.5);
L_LaQ= round(area_LaQ_act/W_LaQ);
LaQ = [W_LaQ, L_LaQ];

%DACBUF1&2   W/L=1/2
W_DACBUF = round((area_DACBUF_act1/2)^0.5);
L_DACBUF= round(area_DACBUF_act1/W_DACBUF);
DACBUF1 = [W_DACBUF, L_DACBUF];
DACBUF2 = [W_DACBUF, L_DACBUF];

% DAC1&2  W/L=3/1
W_DAC = round((area_DAC_act1*3)^0.5);
L_DAC= round(area_DAC_act1/W_DAC);
%try to make L be N*length of R25k
b = mod(L_DAC,RES_lib_size(1));
if (b/RES_lib_size(1) > 0.5)
    L_DAC = round(L_DAC/RES_lib_size(1))*RES_lib_size(1) + 5;
    W_DAC = round(area_DAC_act1/L_DAC);
end
DAC1 = [W_DAC, L_DAC];
DAC2 = [W_DAC, L_DAC];



%%%%%
function s = res_gen(z)
res_units = [25, 10, 5, 1];
size_res = size(res_units);
s = zeros(1, size_res(2));
for i=1:size_res(2)
    a = fix(z/res_units(i));
    s(i) = a;
    z = z - a * res_units(i);
end
end
%%%%%

