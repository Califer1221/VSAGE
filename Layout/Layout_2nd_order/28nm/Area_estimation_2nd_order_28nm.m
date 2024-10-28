%estimate the areas
%12/19/2021

% input
CCO_size = 1;
CCO_load = 1;
N = 15;
S = 1;
Rin_value = 10;
RDAC_u = 10*15;%6*63;

%height of standard cell
H = 1.2;

%scale factor
factor = 0.7;

%%%%%%%%%%%%%%%%%%%%%%%%
CCO_size_lib = ["CCO82", "CCO124", "CCO164", "CCO206", "CCO248"];
%sum of 2 inv
% CCO_size_lib_size = [3.2, 4.8, 5.8, 7.2, 8.8];
CCO_size_lib_size = [3.36/2, 1.82+0.7, 2.38+0.7, 2.94+0.98, 3.5+1.26];


CCO_load_lib = ["DCAP0", "DCAP1", "DCAP4", "DCAP8", "DCAP16", "DCAP32", "DCAP64"];
%size of 1 DCAP
CCO_load_lib_size = [0, 0.28, 0.56, 1.12, 2.24, 4.48, 8.96];

RES_lib = ["RES25", "RES10", "RES5", "RES1"];
RES_lib_size = [17.685, 7.455, 4.05, 1.36];
%%%%%%%%%%%%%%%%%%%%%%%%


%CCO1
area_CCO = (CCO_size_lib_size(CCO_size) + CCO_load_lib_size(CCO_load))*2 * N * S * H;
area_CCO_act = area_CCO/factor;




%PFD+LS
%level shifter=1.6*2
%+     2.8*2+   1.2   +   0.42    + 0.7*2 + 2.4*2
%      DFCND1  DEL005      ND2D0    CKBD3   CKBD6
area_PFD=(1.6*2+2.8*2+1.2+ 0.42+ 0.7*2 + 1.26*2)*H;
area_PFD_act=area_PFD/factor;

%Switch
% 4*2.4    +  22.8*2
% INVD8        switches
area_SW=(4*1.26    +  11.44*2)*H;
area_SW_act=area_SW/factor;

%CCO2
% 0.8*2+   2.4*2
% INVD2   INVD8
area_CCO2_1= (0.8*2+   2.4*2)*H*N;
area_CCO2_act_1=area_CCO2_1/factor;

%CCO3
% 0.8*2+   2.4*2
% INVD2   INVD8
area_CCO2_2= (0.42*2+   1.26*2)*H*N;
area_CCO2_act_2=area_CCO2_2/factor;

%Level_shift+quantizer
%   5.165*2+         2*(4*2+2)
%  level shifter     quantizer
area_LaQ=(1.6*2+         2*(3.08*2+1.12))*H;
area_LaQ_act=area_LaQ/factor;

%DACBUF1
% INVD2*3 = 0.8*3
area_DACBUF1=0.42*3*H*N;
area_DACBUF_act1=area_DACBUF1/factor;

%DACBUF2
% INVD2*3 = 0.8*3
area_DACBUF2=0.42*3*H*N;
area_DACBUF_act2=area_DACBUF2/factor;

%DAC1
area_DAC1= sum(res_gen(Rin_value).*RES_lib_size)*H*N*2;
area_DAC_act1=area_DAC1/factor;

%DAC2
area_DAC2= sum(res_gen(Rin_value).*RES_lib_size)*H*N*2;
area_DAC_act2=area_DAC2/factor;

%Rin
s_Rin = res_gen(Rin_value);
area_Rin = dot(RES_lib_size, s_Rin) * H;
area_Rin_act = area_Rin/factor;

%%%calculate width and length of each block

%Rin
W_Rin = round(area_Rin_act/H);
L_Rin = 4;
Rin = [W_Rin, L_Rin];

%CCO W/L = 2/3
W_CCO = round((area_CCO_act/6)^0.5 * 2);
L_CCO = round(area_CCO_act/W_CCO/H)*H;
CCO = [W_CCO, L_CCO];


%PFD W/L = 1/2
W_PFD = round((area_PFD_act/2)^0.5);
L_PFD = round(area_PFD_act/W_PFD);
PFD = [W_PFD, L_PFD];

%switch W/L = 1/2
W_SW = round((area_SW_act/2)^0.5);
L_SW = round(area_SW_act/W_SW);
SW = [W_SW, L_SW];


%CCO2 & CCO3 1/2
W_CCO2 = round((area_CCO2_act_1/2)^0.5);
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

