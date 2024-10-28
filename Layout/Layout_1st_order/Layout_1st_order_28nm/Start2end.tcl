set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
set_global _enable_mmmc_by_default_flow      $CTE::mmmc_default
suppressMessage ENCEXT-2799
win
set init_lef_file {\  /nethome/kli416/work/TSMC28/Tech_files/PRTF_EDI_28nm_Cad_V19_1a/PR_tech/Cadence/LefHeader/HVH/tsmcn28_10lm5X2Y2ZRDL.tlef\
/nethome/kli416/work/TSMC28/Tech_files/lef/tcbn28hpcplusbwp12t30p140lvt.lef\
/nethome/kli416/work/TSMC28/Tech_files/lef/DCAP_RES_v3.lef}
#tcbn28hpcplusbwp12t30p140lvt.lef  tcbn28_LK_v1
set init_design_settop 0
set init_verilog /nethome/kli416/work/TSMC28/verilog_gen/CCO_DSM_15N_5S_3kRin_v1.v
#CCO_DSM_15N_5S_3kRin_v1
#Buffer.v
set init_mmmc_file Default.view
init_design
getIoFlowFlag 
setIoFlowFlag 0 
floorPlan -site core12T -s 275.0000 218.0000 30 30 30 30 
uiSetTool select 
getIoFlowFlag 
selectObject Module I0 
createInstGroup PD10 -fence 39.0000 130.8000 45.0000 134.8000 
setInstGroupPhyHier PD10 
addInstToInstGroup PD10 {I0 } 
deselectModule I0 

selectObject Module I1 
createInstGroup PD9 -fence 290.0000 130.8000 296.0000 134.8000 
setInstGroupPhyHier PD9 
addInstToInstGroup PD9 {I1 } 
deselectModule I1 

selectObject Module I8 
createInstGroup PD8 -fence 81.0000 75.0000 163.0000 239.0000 
setInstGroupPhyHier PD8 
addInstToInstGroup PD8 {I8 } 
deselectModule I8 

selectObject Module I9 
createInstGroup PD7 -fence 172.0000 75.0000 254.0000 239.0000 
setInstGroupPhyHier PD7 
addInstToInstGroup PD7 {I9 } 
deselectModule I9 

selectObject Module I6 
createInstGroup PD6 -fence 135.5000 39.0000 199.5000 51.6000 
setInstGroupPhyHier PD6 
addInstToInstGroup PD6 {I6 } 
deselectModule I6 

selectObject Module I7 
createInstGroup PD5 -fence 163.9000 60.6000 171.1000 66.0000 
setInstGroupPhyHier PD5 
addInstToInstGroup PD5 {I7 } 
deselectModule I7 

selectObject Module I4 
createInstGroup PD4 -fence 39.0000 60.6000 72.0000 64.2000 
setInstGroupPhyHier PD4 
addInstToInstGroup PD4 {I4 } 
deselectModule I4 

selectObject Module I5 
createInstGroup PD3 -fence 263.0000 60.6000 296.0000 64.2000 
setInstGroupPhyHier PD3 
addInstToInstGroup PD3 {I5 } 
deselectModule I5 

selectObject Module I3 
createInstGroup PD1 -fence 263.0000 73.2000 296.0000 121.8000 
setInstGroupPhyHier PD1 
addInstToInstGroup PD1 {I3 } 
deselectModule I3 

selectObject Module I2 
createInstGroup PD2 -fence 39.0000 73.2000 72.0000 121.8000 
setInstGroupPhyHier PD2 
addInstToInstGroup PD2 {I2 } 
deselectModule I2 

addRing -nets {VBUF VBUF2 VDD VREFP VSSA} -type core_rings -follow core -layer {top M5 bottom M5 left M6 right M6} -width {top 1.8 bottom 1.8 left 1.8 right 1.8} -spacing {top 1.8 bottom 1.8 left 1.8 right 1.8} -offset {top 1.8 bottom 1.8 left 1.8 right 1.8} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

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

selectObject Group PD1
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer AP -stacked_via_bottom_layer M1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets VCTRLN -type block_rings -around power_domain -layer {top M5 bottom M5 left M6 right M6} -width {top 1 bottom 1 left 1 right 1} -spacing {top 1 bottom 1 left 1 right 1} -offset {top 1 bottom 1 left 1 right 1} -center 0 -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

deselectAll
selectObject Group PD3
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer AP -stacked_via_bottom_layer M1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets VBUF -type block_rings -around power_domain -layer {top M5 bottom M5 left M6 right M6} -width {top 1 bottom 1 left 1 right 1} -spacing {top 1 bottom 1 left 1 right 1} -offset {top 1 bottom 1 left 1 right 1} -center 0 -extend_corner {br tr } -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

deselectAll
selectObject Group PD4
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer AP -stacked_via_bottom_layer M1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets VBUF2 -type block_rings -around power_domain -layer {top M5 bottom M5 left M6 right M6} -width {top 1 bottom 1 left 1 right 1} -spacing {top 1 bottom 1 left 1 right 1} -offset {top 1 bottom 1 left 1 right 1} -center 0 -extend_corner {tl bl } -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

deselectAll
selectObject Group PD6
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer AP -stacked_via_bottom_layer M1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets VDD -type block_rings -around power_domain -layer {top M5 bottom M5 left M6 right M6} -width {top 1 bottom 1 left 1 right 1} -spacing {top 1 bottom 1 left 1 right 1} -offset {top 1 bottom 1 left 1 right 1} -center 0 -extend_corner {lb rb } -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None
deselectAll
selectObject Group PD5
setAddRingMode -ring_target default -extend_over_row 0 -ignore_rows 0 -avoid_short 0 -skip_crossing_trunks none -stacked_via_top_layer AP -stacked_via_bottom_layer M1 -via_using_exact_crossover_size 1 -orthogonal_only true -skip_via_on_pin {  standardcell } -skip_via_on_wire_shape {  noshape }
addRing -nets VREFP -type block_rings -around power_domain -layer {top M5 bottom M5 left M6 right M6} -width {top 1 bottom 1 left 1 right 1} -spacing {top 1 bottom 1 left 1 right 1} -offset {top 1 bottom 1 left 1 right 1} -center 0 -extend_corner {lb rb } -threshold 0 -jog_distance 0 -snap_wire_center_to_grid None

deselectAll
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 37.0000 71.2000 74.0000 123.8000 } -nets { VCTRLP } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 261.0000 71.2000 298.0000 123.8000 } -nets { VCTRLN } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 261.0000 58.6000 298.0000 66.2000 } -nets { VBUF } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 37.0000 58.6000 74.0000 66.2000 } -nets { VBUF2 } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 161.9000 58.6000 173.1000 68.0000 } -nets { VREFP } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 133.5000 37.0000 201.5000 53.6000 } -nets { VDD } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
deselectAll 
setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { M1(1) AP(10) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -nets { VSSA } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1(1) AP(10) } 


addWellTap -cell TAPCELLBWP12T30P140 -cellInterval {10.0000} -prefix WELLTAP -area { 37.0000 71.2000 74.0000 123.8000 } 
addWellTap -cell TAPCELLBWP12T30P140 -cellInterval {10.0000} -prefix WELLTAP -area { 261.0000 71.2000 298.0000 123.8000 } 
addWellTap -cell TAPCELLBWP12T30P140 -cellInterval {10.0000} -prefix WELLTAP -area { 261.0000 58.6000 298.0000 66.2000 } 
addWellTap -cell TAPCELLBWP12T30P140 -cellInterval {10.0000} -prefix WELLTAP -area { 37.0000 58.6000 74.0000 66.2000 } 
addWellTap -cell TAPCELLBWP12T30P140 -cellInterval {10.0000} -prefix WELLTAP -area { 161.9000 58.6000 173.1000 68.0000 } 
addWellTap -cell TAPCELLBWP12T30P140 -cellInterval {10.0000} -prefix WELLTAP -area { 133.5000 37.0000 201.5000 53.6000 } 



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

addFiller -cell TAPCELLBWP12T30P140 FILL8BWP12T30P140LVT FILL64BWP12T30P140LVT FILL4BWP12T30P140LVT FILL3BWP12T30P140LVT FILL32BWP12T30P140LVT FILL2BWP12T30P140LVT FILL16BWP12T30P140LVT -prefix FILLER -area { 37.0000 71.2000 74.0000 123.8000 } 
addFiller -cell TAPCELLBWP12T30P140 FILL8BWP12T30P140LVT FILL64BWP12T30P140LVT FILL4BWP12T30P140LVT FILL3BWP12T30P140LVT FILL32BWP12T30P140LVT FILL2BWP12T30P140LVT FILL16BWP12T30P140LVT -prefix FILLER -area { 261.0000 71.2000 298.0000 123.8000 } 
addFiller -cell TAPCELLBWP12T30P140 FILL8BWP12T30P140LVT FILL64BWP12T30P140LVT FILL4BWP12T30P140LVT FILL3BWP12T30P140LVT FILL32BWP12T30P140LVT FILL2BWP12T30P140LVT FILL16BWP12T30P140LVT -prefix FILLER -area { 261.0000 58.6000 298.0000 66.2000 } 
addFiller -cell TAPCELLBWP12T30P140 FILL8BWP12T30P140LVT FILL64BWP12T30P140LVT FILL4BWP12T30P140LVT FILL3BWP12T30P140LVT FILL32BWP12T30P140LVT FILL2BWP12T30P140LVT FILL16BWP12T30P140LVT -prefix FILLER -area { 37.0000 58.6000 74.0000 66.2000 } 
addFiller -cell TAPCELLBWP12T30P140 FILL8BWP12T30P140LVT FILL64BWP12T30P140LVT FILL4BWP12T30P140LVT FILL3BWP12T30P140LVT FILL32BWP12T30P140LVT FILL2BWP12T30P140LVT FILL16BWP12T30P140LVT -prefix FILLER -area { 161.9000 58.6000 173.1000 68.0000 } 
addFiller -cell TAPCELLBWP12T30P140 FILL8BWP12T30P140LVT FILL64BWP12T30P140LVT FILL4BWP12T30P140LVT FILL3BWP12T30P140LVT FILL32BWP12T30P140LVT FILL2BWP12T30P140LVT FILL16BWP12T30P140LVT -prefix FILLER -area { 133.5000 37.0000 201.5000 53.6000 } 


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