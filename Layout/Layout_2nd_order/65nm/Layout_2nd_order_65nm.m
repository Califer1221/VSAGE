%05/27/2022
%width and length are calculated oppsite in 2nd order script, so need to
%swap them by using fliplr() func

% Rin = [16.2, 5];
% CCO = [36.4, 56.4];
% BUF = [36.4, 4];
% DIG = [59, 7.3];
% DAC_BUF = [15.5, 4];
% DAC = [45, 90];

% Rin = [27, 9];
% CCO = [29, 72];
% BUF = [15, 30];
% DIG = [116, 13];
% DAC_BUF = [34, 3.6];
% DAC = [43, 110];

%!!!gap must be a multiple of 1.8
gap  = 9;% at least 5 since wire width is 1
power_ring = 30;

%x_tot = 2*CCO(2)+gap+gap*2+DAC1(2)*2+gap*2;
x_tot = 2*max([CCO(2), CCO2(2), LaQ(2), Rin(1)])+gap+gap*2+DAC1(2)*2+gap*2;
y_tot = max(DAC1(1)+gap*2+DACBUF1(1)+gap, gap+LaQ(1)+gap+CCO2(1)+gap+SW(1)+gap+PFD(1)+gap+CCO(1)+gap+Rin(1)+gap);


% 
% x_CCO_BUF = max(CCO(1), BUF(1)) + 2*gap;
% y_CCO_BUF = BUF(2) + CCO(2) +  4*gap + DIG(2);

Top_area = x_tot*y_tot;
sprintf('Top Area:%.4f with Width: %.4f; Height: %.4f', Top_area, x_tot, y_tot)

%DAC1&2 center, lef_bottom corner
% Cen_DAC1 = [gap+DAC1(1)/2, gap + 0.5*DAC1(2)];
Cor_DAC1 = [gap, gap*2+DACBUF1(1)];

% Cen_DAC2 = [x_tot-DAC1(1)/2, gap + 0.5*DAC1(2)];
Cor_DAC2 = [x_tot-DAC1(2)-gap, gap*2+DACBUF1(1)];

%DACBUF1&2 center, lef_bottom corner
% Cen_DACBUF1 = [gap+DAC1(1)/2, gap + 0.5*DAC1(2)];
Cor_DACBUF1 = [gap, gap];
% Cen_DACBUF2 = [x_tot-DAC1(1)/2, gap + 0.5*DAC1(2)];
Cor_DACBUF2 = [x_tot-DACBUF1(2)-gap, gap];

%Ls&Q center, lef_bottom corner
% Cen_DACBUF1 = [gap+DAC1(1)/2, gap + 0.5*DAC1(2)];
Cor_LaQ_lef = [x_tot/2-LaQ(2)-gap/2, gap];
Cor_LaQ_rig = [x_tot/2+gap/2, gap];

%CCO2&3 center, lef_bottom corner
Cor_CCO2 = [x_tot/2-CCO2(2)-gap/2, gap+LaQ(1)+gap];
Cor_CCO3 = [x_tot/2+gap/2, gap+LaQ(1)+gap];

%SW center, lef_bottom corner
Cor_SW = [x_tot/2-SW(2)/2, gap+LaQ(1)+gap+CCO2(1)+gap];

%PFD center, lef_bottom corner
Cor_PFD = [x_tot/2-PFD(2)/2, gap+LaQ(1)+gap+CCO2(1)+gap+SW(1)+gap];

%CCO1 center, lef_bottom corner
Cor_CCO1_lef = [x_tot/2-CCO(2)-gap/2, gap+LaQ(1)+gap+CCO2(1)+gap+SW(1)+gap+PFD(1)+gap];
Cor_CCO1_rig = [x_tot/2+gap/2, gap+LaQ(1)+gap+CCO2(1)+gap+SW(1)+gap+PFD(1)+gap];

%Rin center, lef_bottom corner
Cor_Rin_lef = [x_tot/2-Rin(1)-gap/2, gap+LaQ(1)+gap+CCO2(1)+gap+SW(1)+gap+PFD(1)+gap+CCO(1)+gap];
Cor_Rin_rig = [x_tot/2+gap/2, gap+LaQ(1)+gap+CCO2(1)+gap+SW(1)+gap+PFD(1)+gap+CCO(1)+gap];



figure(2)
grid on;
drift = [power_ring, power_ring];
Cor_DAC_lef_d = Cor_DAC1 + drift;
Cor_DAC_rig_d = Cor_DAC2 + drift;
Cor_DACBUF_lef_d = Cor_DACBUF1 + drift;
Cor_DACBUF_rig_d = Cor_DACBUF2 + drift;
Cor_LaQ_lef_d=Cor_LaQ_lef+drift;
Cor_LaQ_rig_d=Cor_LaQ_rig+drift;
Cor_CCO2_d=Cor_CCO2+drift;
Cor_CCO3_d=Cor_CCO3+drift;
Cor_SW_d=Cor_SW+drift;
Cor_PFD_d=Cor_PFD+drift;
Cor_CCO1_lef_d = Cor_CCO1_lef + drift;
Cor_CCO1_rig_d = Cor_CCO1_rig + drift;
Cor_Rin_lef_d=Cor_Rin_lef+drift;
Cor_Rin_rig_d=Cor_Rin_rig+drift;

axis([0 x_tot+power_ring+50 0 y_tot+power_ring+50])
rectangle('Position',[Cor_DAC_lef_d fliplr(DAC1)]);
rectangle('Position',[Cor_DAC_rig_d fliplr(DAC2)]);
rectangle('Position',[Cor_DACBUF_lef_d fliplr(DACBUF1)]);
rectangle('Position',[Cor_DACBUF_rig_d fliplr(DACBUF2)]);
rectangle('Position',[Cor_LaQ_lef_d fliplr(LaQ)]);
rectangle('Position',[Cor_LaQ_rig_d fliplr(LaQ)]);
rectangle('Position',[Cor_CCO2_d fliplr(CCO2)]);
rectangle('Position',[Cor_CCO3_d fliplr(CCO3)]);
rectangle('Position',[Cor_SW_d fliplr(SW)]);
rectangle('Position',[Cor_PFD_d fliplr(PFD)]);
rectangle('Position',[Cor_CCO1_lef_d fliplr(CCO)]);
rectangle('Position',[Cor_CCO1_rig_d fliplr(CCO)]);
rectangle('Position',[Cor_Rin_lef_d Rin]);
rectangle('Position',[Cor_Rin_rig_d Rin]);
rectangle('Position',[power_ring,power_ring, x_tot, y_tot]);


loc_Rin_lef = [Cor_Rin_lef_d,Cor_Rin_lef_d + Rin];
loc_Rin_rig = [Cor_Rin_rig_d,Cor_Rin_rig_d + Rin];
loc_CCO1_lef = [Cor_CCO1_lef_d, Cor_CCO1_lef_d + fliplr(CCO)];
loc_CCO1_rig = [Cor_CCO1_rig_d, Cor_CCO1_rig_d + fliplr(CCO)];
loc_CCO2_lef = [Cor_CCO2_d, Cor_CCO2_d + fliplr(CCO2)];
loc_CCO2_rig = [Cor_CCO3_d, Cor_CCO3_d + fliplr(CCO3)];
loc_PFD = [Cor_PFD_d, Cor_PFD_d + fliplr(PFD)];
loc_QUAN_lef = [Cor_LaQ_lef_d, Cor_LaQ_lef_d + fliplr(LaQ)];
loc_QUAN_rig = [Cor_LaQ_rig_d, Cor_LaQ_rig_d + fliplr(LaQ)]; 
loc_DAC_BUF_lef = [Cor_DACBUF_lef_d, Cor_DACBUF_lef_d + fliplr(DACBUF1)];
loc_DAC_BUF_rig = [Cor_DACBUF_rig_d, Cor_DACBUF_rig_d + fliplr(DACBUF2)];
loc_DAC_lef = [Cor_DAC_lef_d, Cor_DAC_lef_d + fliplr(DAC1)];
loc_DAC_rig = [Cor_DAC_rig_d, Cor_DAC_rig_d + fliplr(DAC2)];

loc_SW = [Cor_SW_d, Cor_SW_d + fliplr(SW)];


%%%%Follow pin
VCTRLP1 = [loc_CCO1_lef(1:2)-2, loc_CCO1_lef(3:4)+2];
VCTRLN1 = [loc_CCO1_rig(1:2)-2, loc_CCO1_rig(3:4)+2];
VCTRLP2 = [loc_CCO2_lef(1:2)-2, loc_CCO2_lef(3:4)+2];
VCTRLN2 = [loc_CCO2_rig(1:2)-2, loc_CCO2_rig(3:4)+2];

VDD4 = [loc_PFD(1:2)-2, loc_PFD(3:4)+2];
VDD7 = [loc_QUAN_lef(1:2)-2, loc_QUAN_lef(3:4)+2];
VDD8 = [loc_QUAN_rig(1:2)-2, loc_QUAN_rig(3:4)+2];

VREFP9 = [loc_DAC_BUF_lef(1:2)-2, loc_DAC_BUF_lef(3:4)+2];
VREFP10 = [loc_DAC_BUF_rig(1:2)-2, loc_DAC_BUF_rig(3:4)+2];







