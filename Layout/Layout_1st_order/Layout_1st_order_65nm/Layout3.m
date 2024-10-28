%so far same as layout2

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

x_tot = max( 2*(max(CCO(1), BUF(1)) + DAC(1) + 2.5*gap), 2*gap + DIG(1));
y_tot = max(DIG(2) + DAC_BUF(2) + DAC(2) + 4*gap, DIG(2) + BUF(2) + CCO(2) + Rin(2) +5*gap );

x_CCO_BUF = max(CCO(1), BUF(1)) + 2*gap;
y_CCO_BUF = BUF(2) + CCO(2) +  4*gap + DIG(2);

Top_area = x_tot*y_tot;
sprintf('Top Area:%.4f with Width: %.4f; Height: %.4f', Top_area, x_tot, y_tot)

%Digital center, lef_bottom corner
Cen_DIG = [0.5*x_tot, gap + 0.5*DIG(2)];
Cor_DIG = [0.5*x_tot - 0.5*DIG(1), gap];

%DAC_BUF center, lef_bottom corner
Cen_DAC_BUF = round([0.5*x_tot, 2*gap + DIG(2) + 0.5*DAC_BUF(2)]);
%Cor_DAC_BUF = round([0.5*x_tot - 0.5*DAC_BUF(1), 2*gap + DIG(2)]);
Cor_DAC_BUF = [0.5*x_tot - 0.5*DAC_BUF(1), 2*gap + DIG(2)];


%CCO lef center, lef_bottom, corner
Cen_CCO_lef = [gap + 0.5*CCO(1), 3*gap + DIG(2) + BUF(2) + 0.5*CCO(2)];
Cor_CCO_lef = [gap, 3*gap + DIG(2) + BUF(2)];
Cor_CCO_rig = [x_tot - Cor_CCO_lef(1) - CCO(1), Cor_CCO_lef(2)];

%BUF lef, lef_bottom corner
Cor_BUF_lef = [gap, 2*gap + DIG(2)];
Cor_BUF_rig = [x_tot - Cor_BUF_lef(1) - BUF(1), Cor_BUF_lef(2)];

%DAC lef
%Cor_DAC_lef = [2*gap + max(CCO(1), BUF(1)), y_tot - DAC(2) - gap];
Cor_DAC_lef = [2*gap + max(CCO(1), BUF(1)), 3*gap + DIG(2) + DAC_BUF(2)];
Cor_DAC_rig = [x_tot - Cor_DAC_lef(1) - DAC(1), Cor_DAC_lef(2)];

%Rin lef
%Cor_Rin_lef = [gap, y_tot - Rin(2) - gap];
Cor_Rin_lef = [gap, Cor_CCO_lef(2) + CCO(2) + gap];
Cor_Rin_rig = [x_tot - Cor_Rin_lef(1) - Rin(1), Cor_Rin_lef(2)];

% figure(1)
% axis([0 x_tot+50 0 y_tot+50])
% rectangle('Position',[Cor_Rin_lef Rin]);
% rectangle('Position',[Cor_Rin_rig Rin]);
% rectangle('Position',[Cor_CCO_lef CCO]);
% rectangle('Position',[Cor_CCO_rig CCO]);
% rectangle('Position',[Cor_BUF_lef BUF]);
% rectangle('Position',[Cor_BUF_rig BUF]);
% rectangle('Position',[Cor_DIG DIG]);
% rectangle('Position',[Cor_DAC_BUF DAC_BUF]);
% rectangle('Position',[Cor_DAC_lef DAC]);
% rectangle('Position',[Cor_DAC_rig DAC]);
% 
% rectangle('Position',[0,0, x_tot, y_tot]);

% considering power ring
figure(2)
grid on;
drift = [power_ring, power_ring];
Cor_Rin_lef_d = Cor_Rin_lef + drift;
Cor_Rin_rig_d = Cor_Rin_rig + drift;
Cor_CCO_lef_d = Cor_CCO_lef + drift;
Cor_CCO_rig_d = Cor_CCO_rig + drift;
Cor_BUF_lef_d = Cor_BUF_lef + drift;
Cor_BUF_rig_d = Cor_BUF_rig + drift;
Cor_DIG_d = Cor_DIG + drift;
Cor_DAC_BUF_d = Cor_DAC_BUF + drift;
Cor_DAC_lef_d = Cor_DAC_lef + drift;
Cor_DAC_rig_d = Cor_DAC_rig + drift;


axis([0 x_tot+power_ring+50 0 y_tot+power_ring+50])
rectangle('Position',[Cor_Rin_lef_d Rin]);
rectangle('Position',[Cor_Rin_rig_d Rin]);
rectangle('Position',[Cor_CCO_lef_d CCO]);
rectangle('Position',[Cor_CCO_rig_d CCO]);
rectangle('Position',[Cor_BUF_lef_d BUF]);
rectangle('Position',[Cor_BUF_rig_d BUF]);
rectangle('Position',[Cor_DIG_d DIG]);
rectangle('Position',[Cor_DAC_BUF_d DAC_BUF]);
rectangle('Position',[Cor_DAC_lef_d DAC]);
rectangle('Position',[Cor_DAC_rig_d DAC]);

rectangle('Position',[power_ring,power_ring, x_tot, y_tot]);


loc_Rin_lef = [Cor_Rin_lef_d,Cor_Rin_lef_d + Rin];
loc_Rin_rig = [Cor_Rin_rig_d,Cor_Rin_rig_d + Rin];
loc_CCO_lef = [Cor_CCO_lef_d, Cor_CCO_lef_d + CCO];
loc_CCO_rig = [Cor_CCO_rig_d, Cor_CCO_rig_d + CCO];
loc_BUF_lef = [Cor_BUF_lef_d, Cor_BUF_lef_d + BUF];
loc_BUF_rig = [Cor_BUF_rig_d, Cor_BUF_rig_d + BUF];

% %sometime calc BUF height is 0, so add 1.8*3
% loc_BUF_lef(4) = loc_BUF_lef(4)+1.8*3;
% loc_BUF_rig(4) = loc_BUF_rig(4)+1.8*3;

loc_DIG = [Cor_DIG_d, Cor_DIG_d + DIG];
loc_DAC_BUF = [Cor_DAC_BUF_d, Cor_DAC_BUF_d + DAC_BUF];
loc_DAC_lef = [Cor_DAC_lef_d, Cor_DAC_lef_d + DAC];
loc_DAC_rig = [Cor_DAC_rig_d, Cor_DAC_rig_d + DAC];

fileID = fopen('fp of DSM.txt', 'w');
fprintf(fileID, 'Guide: I0 %.4f %.4f %.4f %.4f 0\n', loc_Rin_lef);
fprintf(fileID, 'Guide: I1 %.4f %.4f %.4f %.4f 0\n', loc_Rin_rig);
fprintf(fileID, 'Guide: I8 %.4f %.4f %.4f %.4f 0\n', loc_DAC_lef);
fprintf(fileID, 'Guide: I9 %.4f %.4f %.4f %.4f 0\n', loc_DAC_rig);
fprintf(fileID, 'Guide: I6 %.4f %.4f %.4f %.4f 0\n', loc_DIG);
fprintf(fileID, 'Guide: I7 %.4f %.4f %.4f %.4f 0\n', loc_DAC_BUF);
fprintf(fileID, 'Guide: I4 %.4f %.4f %.4f %.4f 0\n', loc_BUF_lef);
fprintf(fileID, 'Guide: I5 %.4f %.4f %.4f %.4f 0\n', loc_BUF_rig);
fprintf(fileID, 'Guide: I3 %.4f %.4f %.4f %.4f 0\n', loc_CCO_rig);
fprintf(fileID, 'Guide: I2 %.4f %.4f %.4f %.4f 0\n', loc_CCO_lef);

fprintf(fileID, 'Fence: PD1 %.4f %.4f %.4f %.4f 0\n', loc_CCO_rig);
fprintf(fileID, 'Fence: PD2 %.4f %.4f %.4f %.4f 0\n', loc_CCO_lef);
fprintf(fileID, 'Fence: PD3 %.4f %.4f %.4f %.4f 0\n', loc_BUF_rig);
fprintf(fileID, 'Fence: PD4 %.4f %.4f %.4f %.4f 0\n', loc_BUF_lef);
fprintf(fileID, 'Fence: PD5 %.4f %.4f %.4f %.4f 0\n', loc_DAC_BUF);
fprintf(fileID, 'Fence: PD6 %.4f %.4f %.4f %.4f 0\n', loc_DIG);
fprintf(fileID, 'Fence: PD7 %.4f %.4f %.4f %.4f 0\n', loc_DAC_rig);
fprintf(fileID, 'Fence: PD8 %.4f %.4f %.4f %.4f 0\n', loc_DAC_lef);
fprintf(fileID, 'Fence: PD9 %.4f %.4f %.4f %.4f 0\n', loc_Rin_rig);
fprintf(fileID, 'Fence: PD10 %.4f %.4f %.4f %.4f 0\n', loc_Rin_lef);

fclose(fileID);

fileID = fopen('Constraint of DSM.txt', 'w');
fprintf(fileID, '</Constraints>\n');
fprintf(fileID, '    <Constraint type="Guide" name="I0" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_Rin_lef);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Guide" name="I1" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_Rin_rig);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Guide" name="I8" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_DAC_lef);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Guide" name="I9" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_DAC_rig);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Guide" name="I6" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_DIG);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Guide" name="I7" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_DAC_BUF);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Guide" name="I4" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_BUF_lef);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Guide" name="I5" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_BUF_rig);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Guide" name="I3" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_CCO_rig);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Guide" name="I2" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_CCO_lef);
fprintf(fileID, '    </Constraint>\n');

fprintf(fileID, '    <Constraint type="Fence" name="PD1" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_CCO_rig);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Fence" name="PD2" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_CCO_lef);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Fence" name="PD3" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_BUF_rig);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Fence" name="PD4" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_BUF_lef);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Fence" name="PD5" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_DAC_BUF);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Fence" name="PD6" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_DIG);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Fence" name="PD7" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_DAC_rig);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Fence" name="PD8" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_DAC_lef);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Fence" name="PD9" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_Rin_rig);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Fence" name="PD10" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_Rin_lef);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '</Constraints>\n');

fclose(fileID);


%%%%Follow pin
VCTRLP = [loc_CCO_lef(1:2)-2, loc_CCO_lef(3:4)+2];
VCTRLN = [loc_CCO_rig(1:2)-2, loc_CCO_rig(3:4)+2];
VBUF = [loc_BUF_rig(1:2)-2, loc_BUF_rig(3:4)+2];
VBUF2 = [loc_BUF_lef(1:2)-2, loc_BUF_lef(3:4)+2];
VREFP = [loc_DAC_BUF(1:2)-2, loc_DAC_BUF(3:4)+2];
VDD = [loc_DIG(1:2)-2, loc_DIG(3:4)+2];

fileID = fopen('Follow_pin.txt', 'w');

fprintf(fileID, '::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ');
fprintf(fileID, 'uiSetTool select \n ');
fprintf(fileID, 'setSrouteMode -viaConnectToShape { ring blockring } \n ');
fprintf(fileID, ...
    'sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { %.4f %.4f %.4f %.4f } -nets { VCTRLP } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }'...
    , VCTRLP(1), VCTRLP(2), VCTRLP(3), VCTRLP(4));
fprintf(fileID, '\n');

fprintf(fileID, '::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ');
fprintf(fileID, 'uiSetTool select \n ');
fprintf(fileID, 'setSrouteMode -viaConnectToShape { ring blockring } \n ');
fprintf(fileID, ...
    'sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { %.4f %.4f %.4f %.4f } -nets { VCTRLN } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }'...
    , VCTRLN(1), VCTRLN(2), VCTRLN(3), VCTRLN(4));
fprintf(fileID, '\n');

fprintf(fileID, '::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ');
fprintf(fileID, 'uiSetTool select \n ');
fprintf(fileID, 'setSrouteMode -viaConnectToShape { ring blockring } \n ');
fprintf(fileID, ...
    'sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { %.4f %.4f %.4f %.4f } -nets { VBUF } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }'...
    , VBUF(1), VBUF(2), VBUF(3), VBUF(4));
fprintf(fileID, '\n');

fprintf(fileID, '::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ');
fprintf(fileID, 'uiSetTool select \n ');
fprintf(fileID, 'setSrouteMode -viaConnectToShape { ring blockring } \n ');
fprintf(fileID, ...
    'sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { %.4f %.4f %.4f %.4f } -nets { VBUF2 } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }'...
    , VBUF2(1), VBUF2(2), VBUF2(3), VBUF2(4));
fprintf(fileID, '\n');

fprintf(fileID, '::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ');
fprintf(fileID, 'uiSetTool select \n ');
fprintf(fileID, 'setSrouteMode -viaConnectToShape { ring blockring } \n ');
fprintf(fileID, ...
    'sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { %.4f %.4f %.4f %.4f } -nets { VREFP } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }'...
    , VREFP(1), VREFP(2), VREFP(3), VREFP(4));
fprintf(fileID, '\n');

fprintf(fileID, '::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ');
fprintf(fileID, 'uiSetTool select \n ');
fprintf(fileID, 'setSrouteMode -viaConnectToShape { ring blockring } \n ');
fprintf(fileID, ...
    'sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { %.4f %.4f %.4f %.4f } -nets { VDD } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }'...
    , VDD(1), VDD(2), VDD(3), VDD(4));
fprintf(fileID, '\n');
fprintf(fileID, 'deselectAll \n');

fclose(fileID);





