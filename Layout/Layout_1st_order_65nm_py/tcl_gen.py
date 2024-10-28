# tcl_gen
# 01/2021

# floorplan_gen
with open('floorplan.txt', 'w') as fileID:
    fileID.write('\n')
    fileID.write('getIoFlowFlag \n')
    fileID.write('setIoFlowFlag 0 \n')
    fileID.write(f'floorPlan -coreMarginsBy die -site core -s {x_tot:.4f} {y_tot:.4f} 30 30 30 30 \n')
    fileID.write('uiSetTool select \n')
    fileID.write('getIoFlowFlag \n')

    fileID.write('selectObject Module I0 \n')
    fileID.write(f'createInstGroup PD10 -fence {loc_Rin_lef[0]:.4f} {loc_Rin_lef[1]:.4f} {loc_Rin_lef[2]:.4f} {loc_Rin_lef[3]:.4f} \n')
    fileID.write('setInstGroupPhyHier PD10 \n')
    fileID.write('addInstToInstGroup PD10 {I0 } \n')
    fileID.write('deselectModule I0 \n')
    fileID.write('\n')

    fileID.write('selectObject Module I1 \n')
    fileID.write(f'createInstGroup PD9 -fence {loc_Rin_rig[0]:.4f} {loc_Rin_rig[1]:.4f} {loc_Rin_rig[2]:.4f} {loc_Rin_rig[3]:.4f} \n')
    fileID.write('setInstGroupPhyHier PD9 \n')
    fileID.write('addInstToInstGroup PD9 {I1 } \n')
    fileID.write('deselectModule I1 \n')
    fileID.write('\n')

    fileID.write('selectObject Module I8 \n')
    fileID.write(f'createInstGroup PD8 -fence {loc_DAC_lef[0]:.4f} {loc_DAC_lef[1]:.4f} {loc_DAC_lef[2]:.4f} {loc_DAC_lef[3]:.4f} \n')
    fileID.write('setInstGroupPhyHier PD8 \n')
    fileID.write('addInstToInstGroup PD8 {I8 } \n')
    fileID.write('deselectModule I8 \n')
    fileID.write('\n')

    fileID.write('selectObject Module I9 \n')
    fileID.write(f'createInstGroup PD7 -fence {loc_DAC_rig[0]:.4f} {loc_DAC_rig[1]:.4f} {loc_DAC_rig[2]:.4f} {loc_DAC_rig[3]:.4f} \n')
    fileID.write('setInstGroupPhyHier PD7 \n')
    fileID.write('addInstToInstGroup PD7 {I9 } \n')
    fileID.write('deselectModule I9 \n')
    fileID.write('\n')

    fileID.write('selectObject Module I6 \n')
    fileID.write(f'createInstGroup PD6 -fence {loc_DIG[0]:.4f} {loc_DIG[1]:.4f} {loc_DIG[2]:.4f} {loc_DIG[3]:.4f} \n')
    fileID.write('setInstGroupPhyHier PD6 \n')
    fileID.write('addInstToInstGroup PD6 {I6 } \n')
    fileID.write('deselectModule I6 \n')
    fileID.write('\n')

    fileID.write('selectObject Module I7 \n')
    fileID.write(f'createInstGroup PD5 -fence {loc_DAC_BUF[0]:.4f} {loc_DAC_BUF[1]:.4f} {loc_DAC_BUF[2]:.4f} {loc_DAC_BUF[3]:.4f} \n')
    fileID.write('setInstGroupPhyHier PD5 \n')
    fileID.write('addInstToInstGroup PD5 {I7 } \n')
    fileID.write('deselectModule I7 \n')
    fileID.write('\n')

    fileID.write('selectObject Module I4 \n')
    fileID.write(f'createInstGroup PD4 -fence {loc_BUF_lef[0]:.4f} {loc_BUF_lef[1]:.4f} {loc_BUF_lef[2]:.4f} {loc_BUF_lef[3]:.4f} \n')
    fileID.write('setInstGroupPhyHier PD4 \n')
    fileID.write('addInstToInstGroup PD4 {I4 } \n')
    fileID.write('deselectModule I4 \n')
    fileID.write('\n')

    fileID.write('selectObject Module I5 \n')
    fileID.write(f'createInstGroup PD3 -fence {loc_BUF_rig[0]:.4f} {loc_BUF_rig[1]:.4f} {loc_BUF_rig[2]:.4f} {loc_BUF_rig[3]:.4f} \n')
    fileID.write('setInstGroupPhyHier PD3 \n')
    fileID.write('addInstToInstGroup PD3 {I5 } \n')
    fileID.write('deselectModule I5 \n')
    fileID.write('\n')

    fileID.write('selectObject Module I3 \n')
    fileID.write(f'createInstGroup PD1 -fence {loc_CCO_rig[0]:.4f} {loc_CCO_rig[1]:.4f} {loc_CCO_rig[2]:.4f} {loc_CCO_rig[3]:.4f} \n')
    fileID.write('setInstGroupPhyHier PD1 \n')
    fileID.write('addInstToInstGroup PD1 {I3 } \n')
    fileID.write('deselectModule I3 \n')
    fileID.write('\n')

    fileID.write('selectObject Module I2 \n')
    fileID.write(f'createInstGroup PD2 -fence {loc_CCO_lef[0]:.4f} {loc_CCO_lef[1]:.4f} {loc_CCO_lef[2]:.4f} {loc_CCO_lef[3]:.4f} \n')
    fileID.write('setInstGroupPhyHier PD2 \n')
    fileID.write('addInstToInstGroup PD2 {I2 } \n')
    fileID.write('deselectModule I2 \n')
    fileID.write('\n')

# Follow pin
with open('Follow_pin.txt', 'w') as fileID:
    fileID.write('::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ')
    fileID.write('uiSetTool select \n ')
    fileID.write('setSrouteMode -viaConnectToShape { ring blockring } \n ')
    fileID.write(f'sroute -connect {{ corePin }} -layerChangeRange {{ M1(1) M9(9) }} -blockPinTarget {{ nearestTarget }} -corePinTarget {{ firstAfterRowEnd }} -allowJogging 1 -crossoverViaLayerRange {{ M1(1) AP(10) }} -area {{ {VCTRLP[0]:.4f} {VCTRLP[1]:.4f} {VCTRLP[2]:.4f} {VCTRLP[3]:.4f} }} -nets {{ VCTRLP }} -allowLayerChange 1 -targetViaLayerRange {{ M1(1) AP(10) }}\n')

    fileID.write('::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ')
    fileID.write('uiSetTool select \n ')
    fileID.write('setSrouteMode -viaConnectToShape { ring blockring } \n ')
    fileID.write(f'sroute -connect {{ corePin }} -layerChangeRange {{ M1(1) M9(9) }} -blockPinTarget {{ nearestTarget }} -corePinTarget {{ firstAfterRowEnd }} -allowJogging 1 -crossoverViaLayerRange {{ M1(1) AP(10) }} -area {{ {VCTRLN[0]:.4f} {VCTRLN[1]:.4f} {VCTRLN[2]:.4f} {VCTRLN[3]:.4f} }} -nets {{ VCTRLN }} -allowLayerChange 1 -targetViaLayerRange {{ M1(1) AP(10) }}\n')

    fileID.write('::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ')
    fileID.write('uiSetTool select \n ')
    fileID.write('setSrouteMode -viaConnectToShape { ring blockring } \n ')
    fileID.write(f'sroute -connect {{ corePin }} -layerChangeRange {{ M1(1) M9(9) }} -blockPinTarget {{ nearestTarget }} -corePinTarget {{ firstAfterRowEnd }} -allowJogging 1 -crossoverViaLayerRange {{ M1(1) AP(10) }} -area {{ {VBUF[0]:.4f} {VBUF[1]:.4f} {VBUF[2]:.4f} {VBUF[3]:.4f} }} -nets {{ VBUF }} -allowLayerChange 1 -targetViaLayerRange {{ M1(1) AP(10) }}\n')

    fileID.write('::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ')
    fileID.write('uiSetTool select \n ')
    fileID.write('setSrouteMode -viaConnectToShape { ring blockring } \n ')
    fileID.write(f'sroute -connect {{ corePin }} -layerChangeRange {{ M1(1) M9(9) }} -blockPinTarget {{ nearestTarget }} -corePinTarget {{ firstAfterRowEnd }} -allowJogging 1 -crossoverViaLayerRange {{ M1(1) AP(10) }} -area {{ {VBUF2[0]:.4f} {VBUF2[1]:.4f} {VBUF2[2]:.4f} {VBUF2[3]:.4f} }} -nets {{ VBUF2 }} -allowLayerChange 1 -targetViaLayerRange {{ M1(1) AP(10) }}\n')

    fileID.write('::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ')
    fileID.write('uiSetTool select \n ')
    fileID.write('setSrouteMode -viaConnectToShape { ring blockring } \n ')
    fileID.write(f'sroute -connect {{ corePin }} -layerChangeRange {{ M1(1) M9(9) }} -blockPinTarget {{ nearestTarget }} -corePinTarget {{ firstAfterRowEnd }} -allowJogging 1 -crossoverViaLayerRange {{ M1(1) AP(10) }} -area {{ {VREFP[0]:.4f} {VREFP[1]:.4f} {VREFP[2]:.4f} {VREFP[3]:.4f} }} -nets {{ VREFP }} -allowLayerChange 1 -targetViaLayerRange {{ M1(1) AP(10) }}\n')

    fileID.write('::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ')
    fileID.write('uiSetTool select \n ')
    fileID.write('setSrouteMode -viaConnectToShape { ring blockring } \n ')
    fileID.write(f'sroute -connect {{ corePin }} -layerChangeRange {{ M1(1) M9(9) }} -blockPinTarget {{ nearestTarget }} -corePinTarget {{ firstAfterRowEnd }} -allowJogging 1 -crossoverViaLayerRange {{ M1(1) AP(10) }} -area {{ {VDD[0]:.4f} {VDD[1]:.4f} {VDD[2]:.4f} {VDD[3]:.4f} }} -nets {{ VDD }} -allowLayerChange 1 -targetViaLayerRange {{ M1(1) AP(10) }}\n')
    fileID.write('deselectAll \n')

import os
os.system('cat start_loading.txt floorplan.txt power_ring.txt Follow_pin.txt P_R.txt > Start2end.tcl')

