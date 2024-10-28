%tcl_gen
%01/2021

%floorplan_gen
fileID = fopen('floorplan_2nd.txt', 'w');

fprintf(fileID, '\n');
fprintf(fileID, 'getIoFlowFlag \n');
fprintf(fileID, 'setIoFlowFlag 0 \n');
fprintf(fileID, 'floorPlan -coreMarginsBy die -site core -s %.4f %.4f 30 30 30 30 \n', x_tot, y_tot);
fprintf(fileID, 'uiSetTool select \n');
fprintf(fileID, 'getIoFlowFlag \n');


fprintf(fileID, 'selectObject Module I0 \n');
fprintf(fileID, 'createInstGroup PD0 -fence %.4f %.4f %.4f %.4f \n', loc_Rin_lef);
fprintf(fileID, 'setInstGroupPhyHier PD0 \n');
fprintf(fileID, 'addInstToInstGroup PD0 {I0 } \n');
fprintf(fileID, 'deselectModule I0 \n');
fprintf(fileID, '\n');

fprintf(fileID, 'selectObject Module I1 \n');
fprintf(fileID, 'createInstGroup PD1 -fence %.4f %.4f %.4f %.4f \n', loc_Rin_rig);
fprintf(fileID, 'setInstGroupPhyHier PD1 \n');
fprintf(fileID, 'addInstToInstGroup PD1 {I1 } \n');
fprintf(fileID, 'deselectModule I1 \n');
fprintf(fileID, '\n');

fprintf(fileID, 'selectObject Module I2 \n');
fprintf(fileID, 'createInstGroup PD2 -fence %.4f %.4f %.4f %.4f \n', loc_CCO1_lef);
fprintf(fileID, 'setInstGroupPhyHier PD2 \n');
fprintf(fileID, 'addInstToInstGroup PD2 {I2 } \n');
fprintf(fileID, 'deselectModule I2 \n');
fprintf(fileID, '\n');

fprintf(fileID, 'selectObject Module I3 \n');
fprintf(fileID, 'createInstGroup PD3 -fence %.4f %.4f %.4f %.4f \n', loc_CCO1_rig);
fprintf(fileID, 'setInstGroupPhyHier PD3 \n');
fprintf(fileID, 'addInstToInstGroup PD3 {I3 } \n');
fprintf(fileID, 'deselectModule I3 \n');
fprintf(fileID, '\n');

fprintf(fileID, 'selectObject Module I4 \n');
fprintf(fileID, 'createInstGroup PD4 -fence %.4f %.4f %.4f %.4f \n', loc_PFD);
fprintf(fileID, 'setInstGroupPhyHier PD4 \n');
fprintf(fileID, 'addInstToInstGroup PD4 {I4 } \n');
fprintf(fileID, 'deselectModule I4 \n');
fprintf(fileID, '\n');

fprintf(fileID, 'selectObject Module I4_2 \n');
fprintf(fileID, 'createInstGroup PD4 -fence %.4f %.4f %.4f %.4f \n', loc_PFD);
fprintf(fileID, 'setInstGroupPhyHier PD4 \n');
fprintf(fileID, 'addInstToInstGroup PD4 {I4_2 } \n');
fprintf(fileID, 'deselectModule I4_2 \n');
fprintf(fileID, '\n');

fprintf(fileID, 'selectObject Module I5 \n');
fprintf(fileID, 'createInstGroup PD5 -fence %.4f %.4f %.4f %.4f \n', loc_CCO2_lef);
fprintf(fileID, 'setInstGroupPhyHier PD5 \n');
fprintf(fileID, 'addInstToInstGroup PD5 {I5 } \n');
fprintf(fileID, 'deselectModule I5 \n');
fprintf(fileID, '\n');

fprintf(fileID, 'selectObject Module I6 \n');
fprintf(fileID, 'createInstGroup PD6 -fence %.4f %.4f %.4f %.4f \n', loc_CCO2_rig);
fprintf(fileID, 'setInstGroupPhyHier PD6 \n');
fprintf(fileID, 'addInstToInstGroup PD6 {I6 } \n');
fprintf(fileID, 'deselectModule I6 \n');
fprintf(fileID, '\n');

fprintf(fileID, 'selectObject Module I7 \n');
fprintf(fileID, 'createInstGroup PD7 -fence %.4f %.4f %.4f %.4f \n', loc_QUAN_lef);
fprintf(fileID, 'setInstGroupPhyHier PD7 \n');
fprintf(fileID, 'addInstToInstGroup PD7 {I7 } \n');
fprintf(fileID, 'deselectModule I7 \n');
fprintf(fileID, '\n');

fprintf(fileID, 'selectObject Module I8 \n');
fprintf(fileID, 'createInstGroup PD8 -fence %.4f %.4f %.4f %.4f \n', loc_QUAN_rig);
fprintf(fileID, 'setInstGroupPhyHier PD8 \n');
fprintf(fileID, 'addInstToInstGroup PD8 {I8 } \n');
fprintf(fileID, 'deselectModule I8 \n');
fprintf(fileID, '\n');

fprintf(fileID, 'selectObject Module I9 \n');
fprintf(fileID, 'createInstGroup PD9 -fence %.4f %.4f %.4f %.4f \n', loc_DAC_BUF_lef);
fprintf(fileID, 'setInstGroupPhyHier PD9 \n');
fprintf(fileID, 'addInstToInstGroup PD9 {I9 } \n');
fprintf(fileID, 'deselectModule I9 \n');
fprintf(fileID, '\n');

fprintf(fileID, 'selectObject Module I10 \n');
fprintf(fileID, 'createInstGroup PD10 -fence %.4f %.4f %.4f %.4f \n', loc_DAC_BUF_rig);
fprintf(fileID, 'setInstGroupPhyHier PD10 \n');
fprintf(fileID, 'addInstToInstGroup PD10 {I10 } \n');
fprintf(fileID, 'deselectModule I10 \n');
fprintf(fileID, '\n');

fprintf(fileID, 'selectObject Module I11 \n');
fprintf(fileID, 'createInstGroup PD11 -fence %.4f %.4f %.4f %.4f \n', loc_DAC_lef);
fprintf(fileID, 'setInstGroupPhyHier PD11 \n');
fprintf(fileID, 'addInstToInstGroup PD11 {I11 } \n');
fprintf(fileID, 'deselectModule I11 \n');
fprintf(fileID, '\n');

fprintf(fileID, 'selectObject Module I12 \n');
fprintf(fileID, 'createInstGroup PD12 -fence %.4f %.4f %.4f %.4f \n', loc_DAC_rig);
fprintf(fileID, 'setInstGroupPhyHier PD12 \n');
fprintf(fileID, 'addInstToInstGroup PD12 {I12 } \n');
fprintf(fileID, 'deselectModule I12 \n');
fprintf(fileID, '\n');
fprintf(fileID, '\n');
fprintf(fileID, '\n');

fclose(fileID);


%%% Follow pin
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


fileID = fopen('Follow_pin_2nd.txt', 'w');
fprintf(fileID, '\n ');
fprintf(fileID, '::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ');
fprintf(fileID, 'uiSetTool select \n ');
fprintf(fileID, 'setSrouteMode -viaConnectToShape { ring blockring } \n ');
fprintf(fileID, ...
    'sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { %.4f %.4f %.4f %.4f } -nets { VCTRLP } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }'...
    , VCTRLP1(1), VCTRLP1(2), VCTRLP1(3), VCTRLP1(4));
fprintf(fileID, '\n');

fprintf(fileID, '::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ');
fprintf(fileID, 'uiSetTool select \n ');
fprintf(fileID, 'setSrouteMode -viaConnectToShape { ring blockring } \n ');
fprintf(fileID, ...
    'sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { %.4f %.4f %.4f %.4f } -nets { VCTRLN } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }'...
    , VCTRLN1(1), VCTRLN1(2), VCTRLN1(3), VCTRLN1(4));
fprintf(fileID, '\n');


fprintf(fileID, '::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ');
fprintf(fileID, 'uiSetTool select \n ');
fprintf(fileID, 'setSrouteMode -viaConnectToShape { ring blockring } \n ');
fprintf(fileID, ...
    'sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { %.4f %.4f %.4f %.4f } -nets { VCTRLP2 } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }'...
    , VCTRLP2(1), VCTRLP2(2), VCTRLP2(3), VCTRLP2(4));
fprintf(fileID, '\n');

fprintf(fileID, '::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ');
fprintf(fileID, 'uiSetTool select \n ');
fprintf(fileID, 'setSrouteMode -viaConnectToShape { ring blockring } \n ');
fprintf(fileID, ...
    'sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { %.4f %.4f %.4f %.4f } -nets { VCTRLN2 } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }'...
    , VCTRLN2(1), VCTRLN2(2), VCTRLN2(3), VCTRLN2(4));
fprintf(fileID, '\n');


fprintf(fileID, '::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ');
fprintf(fileID, 'uiSetTool select \n ');
fprintf(fileID, 'setSrouteMode -viaConnectToShape { ring blockring } \n ');
fprintf(fileID, ...
    'sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { %.4f %.4f %.4f %.4f } -nets { VREFP } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }'...
    , VREFP9(1), VREFP9(2), VREFP9(3), VREFP9(4));
fprintf(fileID, '\n');

fprintf(fileID, '::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ');
fprintf(fileID, 'uiSetTool select \n ');
fprintf(fileID, 'setSrouteMode -viaConnectToShape { ring blockring } \n ');
fprintf(fileID, ...
    'sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { %.4f %.4f %.4f %.4f } -nets { VREFP } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }'...
    , VREFP10(1), VREFP10(2), VREFP10(3), VREFP10(4));
fprintf(fileID, '\n');

fprintf(fileID, '::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ');
fprintf(fileID, 'uiSetTool select \n ');
fprintf(fileID, 'setSrouteMode -viaConnectToShape { ring blockring } \n ');
fprintf(fileID, ...
    'sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { %.4f %.4f %.4f %.4f } -nets { VDD } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }'...
    , VDD4(1), VDD4(2), VDD4(3), VDD4(4));
fprintf(fileID, '\n');

fprintf(fileID, '::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ');
fprintf(fileID, 'uiSetTool select \n ');
fprintf(fileID, 'setSrouteMode -viaConnectToShape { ring blockring } \n ');
fprintf(fileID, ...
    'sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { %.4f %.4f %.4f %.4f } -nets { VDD } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }'...
    , VDD7(1), VDD7(2), VDD7(3), VDD7(4));
fprintf(fileID, '\n');

fprintf(fileID, '::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ');
fprintf(fileID, 'uiSetTool select \n ');
fprintf(fileID, 'setSrouteMode -viaConnectToShape { ring blockring } \n ');
fprintf(fileID, ...
    'sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { %.4f %.4f %.4f %.4f } -nets { VDD } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }'...
    , VDD8(1), VDD8(2), VDD8(3), VDD8(4));
fprintf(fileID, '\n');
fprintf(fileID, 'deselectAll \n');
fprintf(fileID, '\n');
fprintf(fileID, '\n');
fprintf(fileID, '\n');

fclose(fileID);


%%%
%system('copy start_loading_2nd_order.txt + floorplan_2nd.txt + power_ring_2nd_order.txt + Follow_pin_2nd.txt + P_R.txt Start2end_2nd.tcl')
system('cat start_loading_2nd_order.txt  floorplan_2nd.txt  power_ring_2nd_order.txt  Follow_pin_2nd.txt  P_R.txt > Start2end_2nd.tcl')
