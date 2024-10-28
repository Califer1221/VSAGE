
getIoFlowFlag 
setIoFlowFlag 0 
floorPlan -coreMarginsBy die -site core -s 245.8000 157.0000 30 30 30 30 
uiSetTool select 
getIoFlowFlag 
selectObject Module I0 
createInstGroup PD0 -fence 138.4000 168.0000 148.4000 172.0000 
setInstGroupPhyHier PD0 
addInstToInstGroup PD0 {I0 } 
deselectModule I0 

selectObject Module I1 
createInstGroup PD1 -fence 157.4000 168.0000 167.4000 172.0000 
setInstGroupPhyHier PD1 
addInstToInstGroup PD1 {I1 } 
deselectModule I1 

selectObject Module I2 
createInstGroup PD2 -fence 110.6000 133.0000 148.4000 159.0000 
setInstGroupPhyHier PD2 
addInstToInstGroup PD2 {I2 } 
deselectModule I2 

selectObject Module I3 
createInstGroup PD3 -fence 157.4000 133.0000 195.2000 159.0000 
setInstGroupPhyHier PD3 
addInstToInstGroup PD3 {I3 } 
deselectModule I3 

selectObject Module I4 
createInstGroup PD4 -fence 141.4000 113.0000 164.4000 124.0000 
setInstGroupPhyHier PD4 
addInstToInstGroup PD4 {I4 } 
deselectModule I4 

selectObject Module I4_2 
createInstGroup PD4 -fence 141.4000 113.0000 164.4000 124.0000 
setInstGroupPhyHier PD4 
addInstToInstGroup PD4 {I4_2 } 
deselectModule I4_2 

selectObject Module I5 
createInstGroup PD5 -fence 129.4000 65.0000 148.4000 78.0000 
setInstGroupPhyHier PD5 
addInstToInstGroup PD5 {I5 } 
deselectModule I5 

selectObject Module I6 
createInstGroup PD6 -fence 157.4000 65.0000 176.4000 78.0000 
setInstGroupPhyHier PD6 
addInstToInstGroup PD6 {I6 } 
deselectModule I6 

selectObject Module I7 
createInstGroup PD7 -fence 114.4000 39.0000 148.4000 56.0000 
setInstGroupPhyHier PD7 
addInstToInstGroup PD7 {I7 } 
deselectModule I7 

selectObject Module I8 
createInstGroup PD8 -fence 157.4000 39.0000 191.4000 56.0000 
setInstGroupPhyHier PD8 
addInstToInstGroup PD8 {I8 } 
deselectModule I8 

selectObject Module I9 
createInstGroup PD9 -fence 39.0000 39.0000 52.0000 46.0000 
setInstGroupPhyHier PD9 
addInstToInstGroup PD9 {I9 } 
deselectModule I9 

selectObject Module I10 
createInstGroup PD10 -fence 253.8000 39.0000 266.8000 46.0000 
setInstGroupPhyHier PD10 
addInstToInstGroup PD10 {I10 } 
deselectModule I10 

selectObject Module I11 
createInstGroup PD11 -fence 39.0000 55.0000 101.6000 161.0000 
setInstGroupPhyHier PD11 
addInstToInstGroup PD11 {I11 } 
deselectModule I11 

selectObject Module I12 
createInstGroup PD12 -fence 204.2000 55.0000 266.8000 161.0000 
setInstGroupPhyHier PD12 
addInstToInstGroup PD12 {I12 } 
deselectModule I12 

selectObject Module I13 
createInstGroup PD13 -fence 136.4000 87.0000 169.4000 104.0000 
setInstGroupPhyHier PD13 
addInstToInstGroup PD13 {I13 } 
deselectModule I13 




 ::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 108.6000 131.0000 150.4000 161.0000 } -nets { VCTRLP } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 155.4000 131.0000 197.2000 161.0000 } -nets { VCTRLN } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 127.4000 63.0000 150.4000 80.0000 } -nets { VCTRLP2 } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 155.4000 63.0000 178.4000 80.0000 } -nets { VCTRLN2 } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 37.0000 37.0000 54.0000 48.0000 } -nets { VREFP } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 251.8000 37.0000 268.8000 48.0000 } -nets { VREFP } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 139.4000 111.0000 166.4000 126.0000 } -nets { VDD } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 112.4000 37.0000 150.4000 58.0000 } -nets { VDD } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 155.4000 37.0000 193.4000 58.0000 } -nets { VDD } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 134.4000 85.0000 171.4000 106.0000 } -nets { VDD } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
deselectAll 




setSrouteMode -viaConnectToShape { ring blockring }
sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { M1(1) AP(10) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -nets { VSSA } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1(1) AP(10) }


setRouteMode -earlyGlobalHonorMsvRouteConstraint false -earlyGlobalRoutePartitionPinGuide true
setEndCapMode -reset
setEndCapMode -boundary_tap false
setNanoRouteMode -quiet -droutePostRouteSpreadWire 1
setNanoRouteMode -quiet -timingEngine {}
setUsefulSkewMode -maxSkew false -noBoundary false -useCells {DEL4 DEL3 DEL2 DEL1 DEL02 DEL015 DEL01 DEL005 DEL0 CKBD8 CKBD6 CKBD4 CKBD3 CKBD2 CKBD16 CKBD12 CKBD1 CKBD0 BUFFD8 BUFFD6 BUFFD4 BUFFD3 BUFFD2 BUFFD16 BUFFD12 BUFFD1 BUFFD0 INVD8 INVD6 INVD4 INVD3 INVD2 INVD16 INVD12 INVD1 INVD0 CKND8 CKND6 CKND4 CKND3 CKND2 CKND16 CKND12 CKND1 CKND0} -maxAllowedDelay 1
setPlaceMode -reset
setPlaceMode -congEffort auto -timingDriven 1 -modulePlan 1 -clkGateAware 0 -powerDriven 0 -ignoreScan 1 -reorderScan 1 -ignoreSpare 1 -placeIOPins 1 -moduleAwareSpare 0 -checkPinLayerForAccess {  1 } -preserveRouting 0 -rmAffectedRouting 0 -checkRoute 0 -swapEEQ 0
setPlaceMode -fp false
place_design

setRouteMode -earlyGlobalHonorMsvRouteConstraint false -earlyGlobalRoutePartitionPinGuide true
setEndCapMode -reset
setEndCapMode -boundary_tap false
setUsefulSkewMode -maxSkew false -noBoundary false -useCells {BUFFD0 BUFFD1 BUFFD12 BUFFD16 BUFFD2 BUFFD3 BUFFD4 BUFFD6 BUFFD8 CKBD0 CKBD1 CKBD12 CKBD16 CKBD2 CKBD3 CKBD4 CKBD6 CKBD8 DEL0 DEL005 DEL01 DEL015 DEL02 DEL1 DEL2 DEL3 DEL4 CKND0 CKND1 CKND12 CKND16 CKND2 CKND3 CKND4 CKND6 CKND8 INVD0 INVD1 INVD12 INVD16 INVD2 INVD3 INVD4 INVD6 INVD8} -maxAllowedDelay 1
setNanoRouteMode -quiet -routeTopRoutingLayer 10
setNanoRouteMode -quiet -routeBottomRoutingLayer 1
setNanoRouteMode -quiet -drouteEndIteration 1
setNanoRouteMode -quiet -routeWithTimingDriven false
setNanoRouteMode -quiet -routeWithSiDriven false
routeDesign -globalDetail

