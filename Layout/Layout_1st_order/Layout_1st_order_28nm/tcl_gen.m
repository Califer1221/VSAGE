%tcl_gen
%01/2021

%floorplan_gen
fileID = fopen('floorplan.txt', 'w');

fprintf(fileID, '\n');
fprintf(fileID, 'getIoFlowFlag \n');
fprintf(fileID, 'setIoFlowFlag 0 \n');
fprintf(fileID, 'floorPlan -site core12T -s %.4f %.4f 30 30 30 30 \n', x_tot, y_tot);
fprintf(fileID, 'uiSetTool select \n');
fprintf(fileID, 'getIoFlowFlag \n');


fprintf(fileID, 'selectObject Module I0 \n');
fprintf(fileID, 'createInstGroup PD10 -fence %.4f %.4f %.4f %.4f \n', loc_Rin_lef);
fprintf(fileID, 'setInstGroupPhyHier PD10 \n');
fprintf(fileID, 'addInstToInstGroup PD10 {I0 } \n');
fprintf(fileID, 'deselectModule I0 \n');
fprintf(fileID, '\n');

fprintf(fileID, 'selectObject Module I1 \n');
fprintf(fileID, 'createInstGroup PD9 -fence %.4f %.4f %.4f %.4f \n', loc_Rin_rig);
fprintf(fileID, 'setInstGroupPhyHier PD9 \n');
fprintf(fileID, 'addInstToInstGroup PD9 {I1 } \n');
fprintf(fileID, 'deselectModule I1 \n');
fprintf(fileID, '\n');

fprintf(fileID, 'selectObject Module I8 \n');
fprintf(fileID, 'createInstGroup PD8 -fence %.4f %.4f %.4f %.4f \n', loc_DAC_lef);
fprintf(fileID, 'setInstGroupPhyHier PD8 \n');
fprintf(fileID, 'addInstToInstGroup PD8 {I8 } \n');
fprintf(fileID, 'deselectModule I8 \n');
fprintf(fileID, '\n');

fprintf(fileID, 'selectObject Module I9 \n');
fprintf(fileID, 'createInstGroup PD7 -fence %.4f %.4f %.4f %.4f \n', loc_DAC_rig);
fprintf(fileID, 'setInstGroupPhyHier PD7 \n');
fprintf(fileID, 'addInstToInstGroup PD7 {I9 } \n');
fprintf(fileID, 'deselectModule I9 \n');
fprintf(fileID, '\n');

fprintf(fileID, 'selectObject Module I6 \n');
fprintf(fileID, 'createInstGroup PD6 -fence %.4f %.4f %.4f %.4f \n', loc_DIG);
fprintf(fileID, 'setInstGroupPhyHier PD6 \n');
fprintf(fileID, 'addInstToInstGroup PD6 {I6 } \n');
fprintf(fileID, 'deselectModule I6 \n');
fprintf(fileID, '\n');

fprintf(fileID, 'selectObject Module I7 \n');
fprintf(fileID, 'createInstGroup PD5 -fence %.4f %.4f %.4f %.4f \n', loc_DAC_BUF);
fprintf(fileID, 'setInstGroupPhyHier PD5 \n');
fprintf(fileID, 'addInstToInstGroup PD5 {I7 } \n');
fprintf(fileID, 'deselectModule I7 \n');
fprintf(fileID, '\n');

fprintf(fileID, 'selectObject Module I4 \n');
fprintf(fileID, 'createInstGroup PD4 -fence %.4f %.4f %.4f %.4f \n', loc_BUF_lef);
fprintf(fileID, 'setInstGroupPhyHier PD4 \n');
fprintf(fileID, 'addInstToInstGroup PD4 {I4 } \n');
fprintf(fileID, 'deselectModule I4 \n');
fprintf(fileID, '\n');

fprintf(fileID, 'selectObject Module I5 \n');
fprintf(fileID, 'createInstGroup PD3 -fence %.4f %.4f %.4f %.4f \n', loc_BUF_rig);
fprintf(fileID, 'setInstGroupPhyHier PD3 \n');
fprintf(fileID, 'addInstToInstGroup PD3 {I5 } \n');
fprintf(fileID, 'deselectModule I5 \n');
fprintf(fileID, '\n');

fprintf(fileID, 'selectObject Module I3 \n');
fprintf(fileID, 'createInstGroup PD1 -fence %.4f %.4f %.4f %.4f \n', loc_CCO_rig);
fprintf(fileID, 'setInstGroupPhyHier PD1 \n');
fprintf(fileID, 'addInstToInstGroup PD1 {I3 } \n');
fprintf(fileID, 'deselectModule I3 \n');
fprintf(fileID, '\n');

fprintf(fileID, 'selectObject Module I2 \n');
fprintf(fileID, 'createInstGroup PD2 -fence %.4f %.4f %.4f %.4f \n', loc_CCO_lef);
fprintf(fileID, 'setInstGroupPhyHier PD2 \n');
fprintf(fileID, 'addInstToInstGroup PD2 {I2 } \n');
fprintf(fileID, 'deselectModule I2 \n');
fprintf(fileID, '\n');

fclose(fileID);


%%% Follow pin
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

fprintf(fileID, 'setSrouteMode -viaConnectToShape { ring blockring } \n ');

fprintf(fileID, 'sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { M1(1) AP(10) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } ');
fprintf(fileID, '-padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } ');
fprintf(fileID, '-allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -nets { VSSA } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1(1) AP(10) } \n');
fclose(fileID);


%%% Well_Tap
fileID = fopen('Well_Tap.txt', 'w');
interval = 10; % interval between taps
fprintf(fileID, '\n');
fprintf(fileID, '\n');
fprintf(fileID, 'addWellTap -cell TAPCELLBWP12T30P140 -cellInterval {%.4f} -prefix WELLTAP -area { %.4f %.4f %.4f %.4f } \n', interval, VCTRLP(1), VCTRLP(2), VCTRLP(3), VCTRLP(4));
fprintf(fileID, 'addWellTap -cell TAPCELLBWP12T30P140 -cellInterval {%.4f} -prefix WELLTAP -area { %.4f %.4f %.4f %.4f } \n', interval, VCTRLN(1), VCTRLN(2), VCTRLN(3), VCTRLN(4));
fprintf(fileID, 'addWellTap -cell TAPCELLBWP12T30P140 -cellInterval {%.4f} -prefix WELLTAP -area { %.4f %.4f %.4f %.4f } \n', interval, VBUF(1), VBUF(2), VBUF(3), VBUF(4));
fprintf(fileID, 'addWellTap -cell TAPCELLBWP12T30P140 -cellInterval {%.4f} -prefix WELLTAP -area { %.4f %.4f %.4f %.4f } \n', interval, VBUF2(1), VBUF2(2), VBUF2(3), VBUF2(4));
fprintf(fileID, 'addWellTap -cell TAPCELLBWP12T30P140 -cellInterval {%.4f} -prefix WELLTAP -area { %.4f %.4f %.4f %.4f } \n', interval, VREFP(1), VREFP(2), VREFP(3), VREFP(4));
fprintf(fileID, 'addWellTap -cell TAPCELLBWP12T30P140 -cellInterval {%.4f} -prefix WELLTAP -area { %.4f %.4f %.4f %.4f } \n', interval, VDD(1), VDD(2), VDD(3), VDD(4));

fprintf(fileID, '\n');

%%% Filler
fileID = fopen('Filler.txt', 'w');
interval = 10; % interval between taps
fprintf(fileID, '\n');
fprintf(fileID, '\n');
fprintf(fileID, 'addFiller -cell TAPCELLBWP12T30P140 FILL8BWP12T30P140LVT FILL64BWP12T30P140LVT FILL4BWP12T30P140LVT FILL3BWP12T30P140LVT FILL32BWP12T30P140LVT FILL2BWP12T30P140LVT FILL16BWP12T30P140LVT -prefix FILLER -area { %.4f %.4f %.4f %.4f } \n'...
    ,VCTRLP(1), VCTRLP(2), VCTRLP(3), VCTRLP(4));
fprintf(fileID, 'addFiller -cell TAPCELLBWP12T30P140 FILL8BWP12T30P140LVT FILL64BWP12T30P140LVT FILL4BWP12T30P140LVT FILL3BWP12T30P140LVT FILL32BWP12T30P140LVT FILL2BWP12T30P140LVT FILL16BWP12T30P140LVT -prefix FILLER -area { %.4f %.4f %.4f %.4f } \n'...
    ,VCTRLN(1), VCTRLN(2), VCTRLN(3), VCTRLN(4));
fprintf(fileID, 'addFiller -cell TAPCELLBWP12T30P140 FILL8BWP12T30P140LVT FILL64BWP12T30P140LVT FILL4BWP12T30P140LVT FILL3BWP12T30P140LVT FILL32BWP12T30P140LVT FILL2BWP12T30P140LVT FILL16BWP12T30P140LVT -prefix FILLER -area { %.4f %.4f %.4f %.4f } \n'...
    ,VBUF(1), VBUF(2), VBUF(3), VBUF(4));
fprintf(fileID, 'addFiller -cell TAPCELLBWP12T30P140 FILL8BWP12T30P140LVT FILL64BWP12T30P140LVT FILL4BWP12T30P140LVT FILL3BWP12T30P140LVT FILL32BWP12T30P140LVT FILL2BWP12T30P140LVT FILL16BWP12T30P140LVT -prefix FILLER -area { %.4f %.4f %.4f %.4f } \n'...
    ,VBUF2(1), VBUF2(2), VBUF2(3), VBUF2(4));
fprintf(fileID, 'addFiller -cell TAPCELLBWP12T30P140 FILL8BWP12T30P140LVT FILL64BWP12T30P140LVT FILL4BWP12T30P140LVT FILL3BWP12T30P140LVT FILL32BWP12T30P140LVT FILL2BWP12T30P140LVT FILL16BWP12T30P140LVT -prefix FILLER -area { %.4f %.4f %.4f %.4f } \n'...
    ,VREFP(1), VREFP(2), VREFP(3), VREFP(4));
fprintf(fileID, 'addFiller -cell TAPCELLBWP12T30P140 FILL8BWP12T30P140LVT FILL64BWP12T30P140LVT FILL4BWP12T30P140LVT FILL3BWP12T30P140LVT FILL32BWP12T30P140LVT FILL2BWP12T30P140LVT FILL16BWP12T30P140LVT -prefix FILLER -area { %.4f %.4f %.4f %.4f } \n'...
    ,VDD(1), VDD(2), VDD(3), VDD(4));

fprintf(fileID, '\n');

%%%
system('copy start_loading.txt + floorplan.txt + power_ring.txt + Follow_pin.txt + Well_Tap.txt + Placement.txt + Filler.txt + Routing.txt Start2end.tcl')
