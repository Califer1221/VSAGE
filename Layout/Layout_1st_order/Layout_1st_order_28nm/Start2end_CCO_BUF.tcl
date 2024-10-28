set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
set init_lef_file ../../tech_files/lef_LK_v2.lef
set init_design_settop 0
set init_verilog /nethome/kli416/work/TSMC65/CCO_DSM_gen/CCO_BUF_31N_3S_v1.v
set init_mmmc_file Default.view
init_design
getIoFlowFlag 
setIoFlowFlag 0 
floorPlan -coreMarginsBy die -site core -s 67.0000 129.6000 30 30 30 30 
uiSetTool select 
getIoFlowFlag 
selectObject Module I4 
createInstGroup PD4 -fence 39.0000 64.2000 88.0000 69.6000 
setInstGroupPhyHier PD4 
addInstToInstGroup PD4 {I4 } 
deselectModule I4 

selectObject Module I2 
createInstGroup PD2 -fence 39.0000 78.6000 88.0000 150.6000 
setInstGroupPhyHier PD2 
addInstToInstGroup PD2 {I2 } 
deselectModule I2 


addRing -nets {VBUF2 VSSA} -type core_rings -follow core -layer {top M5 bottom M5 left M6 right M6} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 1.8 bottom 1.8 left 1.8 right 1.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

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


deselectAll
selectObject Group PD4
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer AP -stacked_via_bottom_layer M1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets VBUF2 -type block_rings -around power_domain -layer {top M5 bottom M5 left M6 right M6} -width {top 1 bottom 1 left 1 right 1} -spacing {top 1 bottom 1 left 1 right 1} -offset {top 1 bottom 1 left 1 right 1} -center 0 -extend_corner {tl bl } -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None


deselectAll
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 37.0000 76.6000 90.0000 152.6000 } -nets { VCTRLP } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 37.0000 62.2000 90.0000 71.6000 } -nets { VBUF2 } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
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

