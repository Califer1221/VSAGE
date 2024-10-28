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
set init_verilog /nethome/kli416/work/TSMC28/Innovus/Design/ASPDAC_2nd_order/verilog/CCO_2nd_DSM_15N_1S_10kRin_v1_200M_28nm.v
#CCO_DSM_15N_5S_3kRin_v1
#Buffer.v
set init_mmmc_file Default.view
init_design
getIoFlowFlag 
setIoFlowFlag 0 
floorPlan  -site core12T -s 212.1100 119.6000 30 30 30 30 
uiSetTool select 
getIoFlowFlag 
selectObject Module I0 
createInstGroup PD0 -fence 121.4550 125.2000 132.4550 129.2000 
setInstGroupPhyHier PD0 
addInstToInstGroup PD0 {I0 } 
deselectModule I0 

selectObject Module I1 
createInstGroup PD1 -fence 139.6550 125.2000 150.6550 129.2000 
setInstGroupPhyHier PD1 
addInstToInstGroup PD1 {I1 } 
deselectModule I1 

selectObject Module I2 
createInstGroup PD2 -fence 108.4550 103.0000 132.4550 118.0000 
setInstGroupPhyHier PD2 
addInstToInstGroup PD2 {I2 } 
deselectModule I2 

selectObject Module I3 
createInstGroup PD3 -fence 139.6550 103.0000 163.6550 118.0000 
setInstGroupPhyHier PD3 
addInstToInstGroup PD3 {I3 } 
deselectModule I3 

selectObject Module I4 
createInstGroup PD4 -fence 129.0550 88.8000 143.0550 95.8000 
setInstGroupPhyHier PD4 
addInstToInstGroup PD4 {I4 } 
deselectModule I4 

selectObject Module I4_2 
createInstGroup PD4 -fence 129.0550 88.8000 143.0550 95.8000 
setInstGroupPhyHier PD4 
addInstToInstGroup PD4 {I4_2 } 
deselectModule I4_2 

selectObject Module I5 
createInstGroup PD5 -fence 121.4550 59.4000 132.4550 67.4000 
setInstGroupPhyHier PD5 
addInstToInstGroup PD5 {I5 } 
deselectModule I5 

selectObject Module I6 
createInstGroup PD6 -fence 139.6550 59.4000 150.6550 67.4000 
setInstGroupPhyHier PD6 
addInstToInstGroup PD6 {I6 } 
deselectModule I6 

selectObject Module I7 
createInstGroup PD7 -fence 102.4550 37.2000 132.4550 52.2000 
setInstGroupPhyHier PD7 
addInstToInstGroup PD7 {I7 } 
deselectModule I7 

selectObject Module I8 
createInstGroup PD8 -fence 139.6550 37.2000 169.6550 52.2000 
setInstGroupPhyHier PD8 
addInstToInstGroup PD8 {I8 } 
deselectModule I8 

selectObject Module I9 
createInstGroup PD9 -fence 37.2000 37.2000 45.2000 41.2000 
setInstGroupPhyHier PD9 
addInstToInstGroup PD9 {I9 } 
deselectModule I9 

selectObject Module I10 
createInstGroup PD10 -fence 226.9100 37.2000 234.9100 41.2000 
setInstGroupPhyHier PD10 
addInstToInstGroup PD10 {I10 } 
deselectModule I10 

selectObject Module I11 
createInstGroup PD11 -fence 37.2000 48.4000 95.2550 142.4000 
setInstGroupPhyHier PD11 
addInstToInstGroup PD11 {I11 } 
deselectModule I11 

selectObject Module I12 
createInstGroup PD12 -fence 176.8550 48.4000 234.9100 142.4000 
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
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 106.4550 101.0000 134.4550 120.0000 } -nets { VCTRLP } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 137.6550 101.0000 165.6550 120.0000 } -nets { VCTRLN } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 119.4550 57.4000 134.4550 69.4000 } -nets { VCTRLP2 } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 137.6550 57.4000 152.6550 69.4000 } -nets { VCTRLN2 } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 35.2000 35.2000 47.2000 43.2000 } -nets { VREFP } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 224.9100 35.2000 236.9100 43.2000 } -nets { VREFP } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 127.0550 86.8000 145.0550 97.8000 } -nets { VDD } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 100.4550 35.2000 134.4550 54.2000 } -nets { VDD } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox 
 uiSetTool select 
 setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { corePin } -layerChangeRange { M1(1) M9(9) } -blockPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -area { 137.6550 35.2000 171.6550 54.2000 } -nets { VDD } -allowLayerChange 1 -targetViaLayerRange { M1(1) AP(10) }
deselectAll 
setSrouteMode -viaConnectToShape { ring blockring } 
 sroute -connect { blockPin padPin padRing corePin floatingStripe } -layerChangeRange { M1(1) AP(10) } -blockPinTarget { nearestTarget } -padPinPortConnect { allPort oneGeom } -padPinTarget { nearestTarget } -corePinTarget { firstAfterRowEnd } -floatingStripeTarget { blockring padring ring stripe ringpin blockpin followpin } -allowJogging 1 -crossoverViaLayerRange { M1(1) AP(10) } -nets { VSSA } -allowLayerChange 1 -blockPin useLef -targetViaLayerRange { M1(1) AP(10) } 





addWellTap -cell TAPCELLBWP12T30P140 -cellInterval {10.0000} -prefix WELLTAP -area { 106.4550 101.0000 134.4550 120.0000 } 
addWellTap -cell TAPCELLBWP12T30P140 -cellInterval {10.0000} -prefix WELLTAP -area { 137.6550 101.0000 165.6550 120.0000 } 
addWellTap -cell TAPCELLBWP12T30P140 -cellInterval {10.0000} -prefix WELLTAP -area { 119.4550 57.4000 134.4550 69.4000 } 
addWellTap -cell TAPCELLBWP12T30P140 -cellInterval {10.0000} -prefix WELLTAP -area { 137.6550 57.4000 152.6550 69.4000 } 
addWellTap -cell TAPCELLBWP12T30P140 -cellInterval {10.0000} -prefix WELLTAP -area { 127.0550 86.8000 145.0550 97.8000 } 
addWellTap -cell TAPCELLBWP12T30P140 -cellInterval {10.0000} -prefix WELLTAP -area { 100.4550 35.2000 134.4550 54.2000 } 
addWellTap -cell TAPCELLBWP12T30P140 -cellInterval {10.0000} -prefix WELLTAP -area { 137.6550 35.2000 171.6550 54.2000 } 
addWellTap -cell TAPCELLBWP12T30P140 -cellInterval {10.0000} -prefix WELLTAP -area { 35.2000 35.2000 47.2000 43.2000 } 
addWellTap -cell TAPCELLBWP12T30P140 -cellInterval {10.0000} -prefix WELLTAP -area { 224.9100 35.2000 236.9100 43.2000 } 



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

addFiller -cell TAPCELLBWP12T30P140 FILL8BWP12T30P140LVT FILL64BWP12T30P140LVT FILL4BWP12T30P140LVT FILL3BWP12T30P140LVT FILL32BWP12T30P140LVT FILL2BWP12T30P140LVT FILL16BWP12T30P140LVT -prefix FILLER -area { 106.4550 101.0000 134.4550 120.0000 } 
addFiller -cell TAPCELLBWP12T30P140 FILL8BWP12T30P140LVT FILL64BWP12T30P140LVT FILL4BWP12T30P140LVT FILL3BWP12T30P140LVT FILL32BWP12T30P140LVT FILL2BWP12T30P140LVT FILL16BWP12T30P140LVT -prefix FILLER -area { 137.6550 101.0000 165.6550 120.0000 } 
addFiller -cell TAPCELLBWP12T30P140 FILL8BWP12T30P140LVT FILL64BWP12T30P140LVT FILL4BWP12T30P140LVT FILL3BWP12T30P140LVT FILL32BWP12T30P140LVT FILL2BWP12T30P140LVT FILL16BWP12T30P140LVT -prefix FILLER -area { 119.4550 57.4000 134.4550 69.4000 } 
addFiller -cell TAPCELLBWP12T30P140 FILL8BWP12T30P140LVT FILL64BWP12T30P140LVT FILL4BWP12T30P140LVT FILL3BWP12T30P140LVT FILL32BWP12T30P140LVT FILL2BWP12T30P140LVT FILL16BWP12T30P140LVT -prefix FILLER -area { 137.6550 57.4000 152.6550 69.4000 } 
addFiller -cell TAPCELLBWP12T30P140 FILL8BWP12T30P140LVT FILL64BWP12T30P140LVT FILL4BWP12T30P140LVT FILL3BWP12T30P140LVT FILL32BWP12T30P140LVT FILL2BWP12T30P140LVT FILL16BWP12T30P140LVT -prefix FILLER -area { 127.0550 86.8000 145.0550 97.8000 } 
addFiller -cell TAPCELLBWP12T30P140 FILL8BWP12T30P140LVT FILL64BWP12T30P140LVT FILL4BWP12T30P140LVT FILL3BWP12T30P140LVT FILL32BWP12T30P140LVT FILL2BWP12T30P140LVT FILL16BWP12T30P140LVT -prefix FILLER -area { 100.4550 35.2000 134.4550 54.2000 } 
addFiller -cell TAPCELLBWP12T30P140 FILL8BWP12T30P140LVT FILL64BWP12T30P140LVT FILL4BWP12T30P140LVT FILL3BWP12T30P140LVT FILL32BWP12T30P140LVT FILL2BWP12T30P140LVT FILL16BWP12T30P140LVT -prefix FILLER -area { 137.6550 35.2000 171.6550 54.2000 } 
addFiller -cell TAPCELLBWP12T30P140 FILL8BWP12T30P140LVT FILL64BWP12T30P140LVT FILL4BWP12T30P140LVT FILL3BWP12T30P140LVT FILL32BWP12T30P140LVT FILL2BWP12T30P140LVT FILL16BWP12T30P140LVT -prefix FILLER -area { 35.2000 35.2000 47.2000 43.2000 } 
addFiller -cell TAPCELLBWP12T30P140 FILL8BWP12T30P140LVT FILL64BWP12T30P140LVT FILL4BWP12T30P140LVT FILL3BWP12T30P140LVT FILL32BWP12T30P140LVT FILL2BWP12T30P140LVT FILL16BWP12T30P140LVT -prefix FILLER -area { 224.9100 35.2000 236.9100 43.2000 } 


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
