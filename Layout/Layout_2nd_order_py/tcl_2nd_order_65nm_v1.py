import numpy as np

# Define your variables here
# x_tot, y_tot, loc_Rin_lef, loc_Rin_rig, loc_CCO1_lef, loc_CCO1_rig, loc_PFD, loc_CCO2_lef, loc_CCO2_rig, loc_QUAN_lef, loc_QUAN_rig, loc_DAC_BUF_lef, loc_DAC_BUF_rig, loc_DAC_lef, loc_DAC_rig, loc_SW

# floorplan_gen
with open('floorplan_2nd.txt', 'w') as fileID:
    fileID.write('\n')
    fileID.write('getIoFlowFlag \n')
    fileID.write('setIoFlowFlag 0 \n')
    fileID.write(f'floorPlan -coreMarginsBy die -site core -s {x_tot:.4f} {y_tot:.4f} 30 30 30 30 \n')
    fileID.write('uiSetTool select \n')
    fileID.write('getIoFlowFlag \n')

    for i, loc in enumerate([loc_Rin_lef, loc_Rin_rig, loc_CCO1_lef, loc_CCO1_rig, loc_PFD, loc_PFD, loc_CCO2_lef, loc_CCO2_rig, loc_QUAN_lef, loc_QUAN_rig, loc_DAC_BUF_lef, loc_DAC_BUF_rig, loc_DAC_lef, loc_DAC_rig, loc_SW], start=0):
        fileID.write(f'selectObject Module I{i} \n')
        fileID.write(f'createInstGroup PD{i} -fence {loc[0]:.4f} {loc[1]:.4f} {loc[2]:.4f} {loc[3]:.4f} \n')
        fileID.write(f'setInstGroupPhyHier PD{i} \n')
        fileID.write(f'addInstToInstGroup PD{i} {{I{i} }} \n')
        fileID.write(f'deselectModule I{i} \n')
        fileID.write('\n')

    fileID.write('\n')
    fileID.write('\n')

# Follow pin
VCTRLP1 = [loc_CCO1_lef[0:2] - 2, loc_CCO1_lef[2:4] + 2]
VCTRLN1 = [loc_CCO1_rig[0:2] - 2, loc_CCO1_rig[2:4] + 2]
VCTRLP2 = [loc_CCO2_lef[0:2] - 2, loc_CCO2_lef[2:4] + 2]
VCTRLN2 = [loc_CCO2_rig[0:2] - 2, loc_CCO2_rig[2:4] + 2]

VDD4 = [loc_PFD[0:2] - 2, loc_PFD[2:4] + 2]
VDD7 = [loc_QUAN_lef[0:2] - 2, loc_QUAN_lef[2:4] + 2]
VDD8 = [loc_QUAN_rig[0:2] - 2, loc_QUAN_rig[2:4] + 2]

VREFP9 = [loc_DAC_BUF_lef[0:2] - 2, loc_DAC_BUF_lef[2:4] + 2]
VREFP10 = [loc_DAC_BUF_rig[0:2] - 2, loc_DAC_BUF_rig[2:4] + 2]

VDD9 = [loc_SW[0:2] - 2, loc_SW[2:4] + 2]

with open('Follow_pin_2nd.txt', 'w') as fileID:
    fileID.write('\n ')
    fileID.write('::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ')
    fileID.write('uiSetTool select \n ')
    fileID.write('setSrouteMode -viaConnectToShape { ring blockring } \n ')
    fileID.write(f'sroute -connect {{ corePin }} -layerChangeRange {{ M1(1) M9(9) }} -blockPinTarget {{ nearestTarget }} -corePinTarget {{ firstAfterRowEnd }} -allowJogging 1 -crossoverViaLayerRange {{ M1(1) AP(10) }} -area {{ {VCTRLP1[0]:.4f} {VCTRLP1[1]:.4f} {VCTRLP1[2]:.4f} {VCTRLP1[3]:.4f} }} -nets {{ VCTRLP }} -allowLayerChange 1 -targetViaLayerRange {{ M1(1) AP(10) }}\n')
    fileID.write('\n')

    fileID.write('::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ')
    fileID.write('uiSetTool select \n ')
    fileID.write('setSrouteMode -viaConnectToShape { ring blockring } \n ')
    fileID.write(f'sroute -connect {{ corePin }} -layerChangeRange {{ M1(1) M9(9) }} -blockPinTarget {{ nearestTarget }} -corePinTarget {{ firstAfterRowEnd }} -allowJogging 1 -crossoverViaLayerRange {{ M1(1) AP(10) }} -area {{ {VCTRLN1[0]:.4f} {VCTRLN1[1]:.4f} {VCTRLN1[2]:.4f} {VCTRLN1[3]:.4f} }} -nets {{ VCTRLN }} -allowLayerChange 1 -targetViaLayerRange {{ M1(1) AP(10) }}\n')
    fileID.write('\n')

    fileID.write('::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ')
    fileID.write('uiSetTool select \n ')
    fileID.write('setSrouteMode -viaConnectToShape { ring blockring } \n ')
    fileID.write(f'sroute -connect {{ corePin }} -layerChangeRange {{ M1(1) M9(9) }} -blockPinTarget {{ nearestTarget }} -corePinTarget {{ firstAfterRowEnd }} -allowJogging 1 -crossoverViaLayerRange {{ M1(1) AP(10) }} -area {{ {VCTRLP2[0]:.4f} {VCTRLP2[1]:.4f} {VCTRLP2[2]:.4f} {VCTRLP2[3]:.4f} }} -nets {{ VCTRLP2 }} -allowLayerChange 1 -targetViaLayerRange {{ M1(1) AP(10) }}\n')
    fileID.write('\n')

    fileID.write('::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ')
    fileID.write('uiSetTool select \n ')
    fileID.write('setSrouteMode -viaConnectToShape { ring blockring } \n ')
    fileID.write(f'sroute -connect {{ corePin }} -layerChangeRange {{ M1(1) M9(9) }} -blockPinTarget {{ nearestTarget }} -corePinTarget {{ firstAfterRowEnd }} -allowJogging 1 -crossoverViaLayerRange {{ M1(1) AP(10) }} -area {{ {VCTRLN2[0]:.4f} {VCTRLN2[1]:.4f} {VCTRLN2[2]:.4f} {VCTRLN2[3]:.4f} }} -nets {{ VCTRLN2 }} -allowLayerChange 1 -targetViaLayerRange {{ M1(1) AP(10) }}\n')
    fileID.write('\n')

    fileID.write('::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ')
    fileID.write('uiSetTool select \n ')
    fileID.write('setSrouteMode -viaConnectToShape { ring blockring } \n ')
    fileID.write(f'sroute -connect {{ corePin }} -layerChangeRange {{ M1(1) M9(9) }} -blockPinTarget {{ nearestTarget }} -corePinTarget {{ firstAfterRowEnd }} -allowJogging 1 -crossoverViaLayerRange {{ M1(1) AP(10) }} -area {{ {VREFP9[0]:.4f} {VREFP9[1]:.4f} {VREFP9[2]:.4f} {VREFP9[3]:.4f} }} -nets {{ VREFP }} -allowLayerChange 1 -targetViaLayerRange {{ M1(1) AP(10) }}\n')
    fileID.write('\n')

    fileID.write('::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ')
    fileID.write('uiSetTool select \n ')
    fileID.write('setSrouteMode -viaConnectToShape { ring blockring } \n ')
    fileID.write(f'sroute -connect {{ corePin }} -layerChangeRange {{ M1(1) M9(9) }} -blockPinTarget {{ nearestTarget }} -corePinTarget {{ firstAfterRowEnd }} -allowJogging 1 -crossoverViaLayerRange {{ M1(1) AP(10) }} -area {{ {VREFP10[0]:.4f} {VREFP10[1]:.4f} {VREFP10[2]:.4f} {VREFP10[3]:.4f} }} -nets {{ VREFP }} -allowLayerChange 1 -targetViaLayerRange {{ M1(1) AP(10) }}\n')
    fileID.write('\n')

    fileID.write('::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ')
    fileID.write('uiSetTool select \n ')
    fileID.write('setSrouteMode -viaConnectToShape { ring blockring } \n ')
    fileID.write(f'sroute -connect {{ corePin }} -layerChangeRange {{ M1(1) M9(9) }} -blockPinTarget {{ nearestTarget }} -corePinTarget {{ firstAfterRowEnd }} -allowJogging 1 -crossoverViaLayerRange {{ M1(1) AP(10) }} -area {{ {VDD4[0]:.4f} {VDD4[1]:.4f} {VDD4[2]:.4f} {VDD4[3]:.4f} }} -nets {{ VDD }} -allowLayerChange 1 -targetViaLayerRange {{ M1(1) AP(10) }}\n')
    fileID.write('\n')

    fileID.write('::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ')
    fileID.write('uiSetTool select \n ')
    fileID.write('setSrouteMode -viaConnectToShape { ring blockring } \n ')
    fileID.write(f'sroute -connect {{ corePin }} -layerChangeRange {{ M1(1) M9(9) }} -blockPinTarget {{ nearestTarget }} -corePinTarget {{ firstAfterRowEnd }} -allowJogging 1 -crossoverViaLayerRange {{ M1(1) AP(10) }} -area {{ {VDD7[0]:.4f} {VDD7[1]:.4f} {VDD7[2]:.4f} {VDD7[3]:.4f} }} -nets {{ VDD }} -allowLayerChange 1 -targetViaLayerRange {{ M1(1) AP(10) }}\n')
    fileID.write('\n')

    fileID.write('::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ')
    fileID.write('uiSetTool select \n ')
    fileID.write('setSrouteMode -viaConnectToShape { ring blockring } \n ')
    fileID.write(f'sroute -connect {{ corePin }} -layerChangeRange {{ M1(1) M9(9) }} -blockPinTarget {{ nearestTarget }} -corePinTarget {{ firstAfterRowEnd }} -allowJogging 1 -crossoverViaLayerRange {{ M1(1) AP(10) }} -area {{ {VDD8[0]:.4f} {VDD8[1]:.4f} {VDD8[2]:.4f} {VDD8[3]:.4f} }} -nets {{ VDD }} -allowLayerChange 1 -targetViaLayerRange {{ M1(1) AP(10) }}\n')
    fileID.write('\n')

    fileID.write('::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n ')
    fileID.write('uiSetTool select \n ')
    fileID.write('setSrouteMode -viaConnectToShape { ring blockring } \n ')
    fileID.write(f'sroute -connect {{ corePin }} -layerChangeRange {{ M1(1) M9(9) }} -blockPinTarget {{ nearestTarget }} -corePinTarget {{ firstAfterRowEnd }} -allowJogging 1 -crossoverViaLayerRange {{ M1(1) AP(10) }} -area {{ {VDD9[0]:.4f} {VDD9[1]:.4f} {VDD9[2]:.4f} {VDD9[3]:.4f} }} -nets {{ VDD }} -allowLayerChange 1 -targetViaLayerRange {{ M1(1) AP(10) }}\n')
    fileID.write('\n')

    fileID.write('deselectAll \n')
    fileID.write('\n')
    fileID.write('\n')
    fileID.write('\n')

# system('cat start_loading_2nd_order.txt  floorplan_2nd.txt  power_ring_2nd_order_SW.txt  Follow_pin_2nd.txt  P_R.txt > Start2end_2nd.tcl')
import os
os.system('cat start_loading_2nd_order.txt floorplan_2nd.txt power_ring_2nd_order_SW.txt Follow_pin_2nd.txt P_R.txt > Start2end_2nd.tcl')

