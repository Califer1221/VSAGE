set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
#set init_lef_file { ../../tech_files/lef_LK_v4.lef}
set init_lef_file {\  /nethome/kli416/work/TSMC65/innovus/tech_files/lef_LK_v5.lef \
 ../../tech_files/lef_LS_SW_v2.lef}
set init_design_settop 0
set init_verilog /nethome/kli416/work/TSMC65/innovus/Design/ICCAD_Design_2nd_order/ICCAD/CCO_2nd_DSM_15N_9S_5kRin_v1.v

set init_mmmc_file Default.view
init_design
getIoFlowFlag 
setIoFlowFlag 0 
getIoFlowFlag 
setIoFlowFlag 0 
floorPlan -coreMarginsBy die -site core -s 307.0000 172.0000 30 30 30 30 
uiSetTool select 
getIoFlowFlag 
selectObject Module I0 
createInstGroup PD0 -fence 169.0000 183.0000 179.0000 187.0000 
setInstGroupPhyHier PD0 
addInstToInstGroup PD0 {I0 } 
deselectModule I0 

selectObject Module I1 
createInstGroup PD1 -fence 188.0000 183.0000 198.0000 187.0000 
setInstGroupPhyHier PD1 
addInstToInstGroup PD1 {I1 } 
deselectModule I1 

selectObject Module I2 
createInstGroup PD2 -fence 110.6000 128.0000 179.0000 174.0000 
setInstGroupPhyHier PD2 
addInstToInstGroup PD2 {I2 } 
deselectModule I2 

selectObject Module I3 
createInstGroup PD3 -fence 188.0000 128.0000 256.4000 174.0000 
setInstGroupPhyHier PD3 
addInstToInstGroup PD3 {I3 } 
deselectModule I3 

selectObject Module I4 
createInstGroup PD4 -fence 172.0000 108.0000 195.0000 119.0000 
setInstGroupPhyHier PD4 
addInstToInstGroup PD4 {I4 } 
deselectModule I4 

selectObject Module I4_2 
createInstGroup PD4 -fence 172.0000 108.0000 195.0000 119.0000 
setInstGroupPhyHier PD4 
addInstToInstGroup PD4 {I4_2 } 
deselectModule I4_2 

selectObject Module I5 
createInstGroup PD5 -fence 160.0000 65.0000 179.0000 78.0000 
setInstGroupPhyHier PD5 
addInstToInstGroup PD5 {I5 } 
deselectModule I5 

selectObject Module I6 
createInstGroup PD6 -fence 188.0000 65.0000 207.0000 78.0000 
setInstGroupPhyHier PD6 
addInstToInstGroup PD6 {I6 } 
deselectModule I6 

selectObject Module I7 
createInstGroup PD7 -fence 145.0000 39.0000 179.0000 56.0000 
setInstGroupPhyHier PD7 
addInstToInstGroup PD7 {I7 } 
deselectModule I7 

selectObject Module I8 
createInstGroup PD8 -fence 188.0000 39.0000 222.0000 56.0000 
setInstGroupPhyHier PD8 
addInstToInstGroup PD8 {I8 } 
deselectModule I8 

selectObject Module I9 
createInstGroup PD9 -fence 39.0000 39.0000 52.0000 46.0000 
setInstGroupPhyHier PD9 
addInstToInstGroup PD9 {I9 } 
deselectModule I9 

selectObject Module I10 
createInstGroup PD10 -fence 315.0000 39.0000 328.0000 46.0000 
setInstGroupPhyHier PD10 
addInstToInstGroup PD10 {I10 } 
deselectModule I10 

selectObject Module I11 
createInstGroup PD11 -fence 39.0000 55.0000 101.6000 161.0000 
setInstGroupPhyHier PD11 
addInstToInstGroup PD11 {I11 } 
deselectModule I11 

selectObject Module I12 
createInstGroup PD12 -fence 265.4000 55.0000 328.0000 161.0000 
setInstGroupPhyHier PD12 
addInstToInstGroup PD12 {I12 } 
deselectModule I12 





addRing -nets {VDD VREFP VSSA} -type core_rings -follow core -layer {top M5 bottom M5 left M6 right M6} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 1.8 bottom 1.8 left 1.8 right 1.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

setDrawView fplan

selectObject Group PD2
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
set sprCreateIeRingOffset 1.0
set sprCreateIeRingThreshold 1.0
set sprCreateIeRingJogDistance 1.0
set sprCreateIeRingLayers {}
set sprCreateIeStripeWidth 10.0
set sprCreateIeStripeThreshold 1.0
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer AP -stacked_via_bottom_layer M1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets VCTRLP -type block_rings -around power_domain -layer {top M5 bottom M5 left M6 right M6} -width {top 1 bottom 1 left 1 right 1} -spacing {top 1 bottom 1 left 1 right 1} -offset {top 1 bottom 1 left 1 right 1} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None
deselectAll

selectObject Group PD5
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer AP -stacked_via_bottom_layer M1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets VCTRLP2 -type block_rings -around power_domain -layer {top M5 bottom M5 left M6 right M6} -width {top 1 bottom 1 left 1 right 1} -spacing {top 1 bottom 1 left 1 right 1} -offset {top 1 bottom 1 left 1 right 1} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None
deselectAll

selectObject Group PD3
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer AP -stacked_via_bottom_layer M1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets VCTRLN -type block_rings -around power_domain -layer {top M5 bottom M5 left M6 right M6} -width {top 1 bottom 1 left 1 right 1} -spacing {top 1 bottom 1 left 1 right 1} -offset {top 1 bottom 1 left 1 right 1} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None
deselectAll

selectObject Group PD6
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer AP -stacked_via_bottom_layer M1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets VCTRLN2 -type block_rings -around power_domain -layer {top M5 bottom M5 left M6 right M6} -width {top 1 bottom 1 left 1 right 1} -spacing {top 1 bottom 1 left 1 right 1} -offset {top 1 bottom 1 left 1 right 1} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None
deselectAll

selectObject Group PD9
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer AP -stacked_via_bottom_layer M1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets VREFP -type block_rings -around power_domain -layer {top M5 bottom M5 left M6 right M6} -width {top 1 bottom 1 left 1 right 1} -spacing {top 1 bottom 1 left 1 right 1} -offset {top 1 bottom 1 left 1 right 1} -center 0 -extend_corner {tl bl lb rb } -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None
deselectAll

selectObject Group PD10
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer AP -stacked_via_bottom_layer M1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets VREFP -type block_rings -around power_domain -layer {top M5 bottom M5 left M6 right M6} -width {top 1 bottom 1 left 1 right 1} -spacing {top 1 bottom 1 left 1 right 1} -offset {top 1 bottom 1 left 1 right 1} -center 0 -extend_corner {lb rb br tr } -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None
deselectAll

selectObject Group PD7
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer AP -stacked_via_bottom_layer M1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets VDD -type block_rings -around power_domain -layer {top M5 bottom M5 left M6 right M6} -width {top 1 bottom 1 left 1 right 1} -spacing {top 1 bottom 1 left 1 right 1} -offset {top 1 bottom 1 left 1 right 1} -center 0 -extend_corner {lb rb } -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None
deselectAll

selectObject Group PD8
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer AP -stacked_via_bottom_layer M1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets VDD -type block_rings -around power_domain -layer {top M5 bottom M5 left M6 right M6} -width {top 1 bottom 1 left 1 right 1} -spacing {top 1 bottom 1 left 1 right 1} -offset {top 1 bottom 1 left 1 right 1} -center 0 -extend_corner {lb rb } -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

selectObject Group PD4
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer AP -stacked_via_bottom_layer M1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets VDD -type block_rings -around power_domain -layer {top M5 bottom M5 left M6 right M6} -width {top 1 bottom 1 left 1 right 1} -spacing {top 1 bottom 1 left 1 right 1} -offset {top 1 bottom 1 left 1 right 1} -center 0 -extend_corner {tl bl br tr } -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None


 ::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 108.6000 126.0000 181.0000 176.0000 } -nets { VCTRLP } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 186.0000 126.0000 258.4000 176.0000 } -nets { VCTRLN } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 158.0000 63.0000 181.0000 80.0000 } -nets { VCTRLP2 } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 186.0000 63.0000 209.0000 80.0000 } -nets { VCTRLN2 } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 37.0000 37.0000 54.0000 48.0000 } -nets { VREFP } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 313.0000 37.0000 330.0000 48.0000 } -nets { VREFP } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 170.0000 106.0000 197.0000 121.0000 } -nets { VDD } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 143.0000 37.0000 181.0000 58.0000 } -nets { VDD } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 186.0000 37.0000 224.0000 58.0000 } -nets { VDD } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
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
place_design -noPrePlaceOpt

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

