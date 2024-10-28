%tcl_gen
%CCO+BUF as a block
%01/13/2021
%floorplan_gen
fileID = fopen('floorplan_CCO_BUF.txt', 'w');

fprintf(fileID, '\n');
fprintf(fileID, 'getIoFlowFlag \n');
fprintf(fileID, 'setIoFlowFlag 0 \n');
fprintf(fileID, 'floorPlan -coreMarginsBy die -site core -s %.4f %.4f 30 30 30 30 \n', x_CCO_BUF, y_CCO_BUF);
fprintf(fileID, 'uiSetTool select \n');
fprintf(fileID, 'getIoFlowFlag \n');

fprintf(fileID, 'selectObject Module I4 \n');
fprintf(fileID, 'createInstGroup PD4 -fence %.4f %.4f %.4f %.4f \n', loc_BUF_lef);
fprintf(fileID, 'setInstGroupPhyHier PD4 \n');
fprintf(fileID, 'addInstToInstGroup PD4 {I4 } \n');
fprintf(fileID, 'deselectModule I4 \n');
fprintf(fileID, '\n');

fprintf(fileID, 'selectObject Module I2 \n');
fprintf(fileID, 'createInstGroup PD2 -fence %.4f %.4f %.4f %.4f \n', loc_CCO_lef);
fprintf(fileID, 'setInstGroupPhyHier PD2 \n');
fprintf(fileID, 'addInstToInstGroup PD2 {I2 } \n');
fprintf(fileID, 'deselectModule I2 \n');
fprintf(fileID, '\n');

fclose(fileID);


%%% Follow pin
fileID = fopen('Follow_pin_CCO_BUF.txt', 'w');

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
    'sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { %.4f %.4f %.4f %.4f } -nets { VBUF2 } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }'...
    , VBUF2(1), VBUF2(2), VBUF2(3), VBUF2(4));
fprintf(fileID, '\n');


fprintf(fileID, 'deselectAll \n');

fclose(fileID);
%%%
system('copy start_loading_CCO_BUF.txt + floorplan_CCO_BUF.txt + power_ring_CCO_BUF.txt + Follow_pin_CCO_BUF.txt + P_R.txt Start2end_CCO_BUF.tcl')
