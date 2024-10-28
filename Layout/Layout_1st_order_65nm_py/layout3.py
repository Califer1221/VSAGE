import numpy as np

# Rin = [16.2, 5]
# CCO = [36.4, 56.4]
# BUF = [36.4, 4]
# DIG = [59, 7.3]
# DAC_BUF = [15.5, 4]
# DAC = [45, 90]

# Rin = [27, 9]
# CCO = [29, 72]
# BUF = [15, 30]
# DIG = [116, 13]
# DAC_BUF = [34, 3.6]
# DAC = [43, 110]

# !!!gap must be a multiple of 1.8
gap = 9  # at least 5 since wire width is 1
power_ring = 30

Rin = np.array([27, 9])
CCO = np.array([29, 72])
BUF = np.array([15, 30])
DIG = np.array([116, 13])
DAC_BUF = np.array([34, 3.6])
DAC = np.array([43, 110])

x_tot = max(2 * (max(CCO[0], BUF[0]) + DAC[0] + 2.5 * gap), 2 * gap + DIG[0])
y_tot = max(DIG[1] + DAC_BUF[1] + DAC[1] + 4 * gap, DIG[1] + BUF[1] + CCO[1] + Rin[1] + 5 * gap)

x_CCO_BUF = max(CCO[0], BUF[0]) + 2 * gap
y_CCO_BUF = BUF[1] + CCO[1] + 4 * gap + DIG[1]

Top_area = x_tot * y_tot
print(f'Top Area: {Top_area:.4f} with Width: {x_tot:.4f}; Height: {y_tot:.4f}')

# Digital center, left_bottom corner
Cen_DIG = np.array([0.5 * x_tot, gap + 0.5 * DIG[1]])
Cor_DIG = np.array([0.5 * x_tot - 0.5 * DIG[0], gap])

# DAC_BUF center, left_bottom corner
Cen_DAC_BUF = np.round(np.array([0.5 * x_tot, 2 * gap + DIG[1] + 0.5 * DAC_BUF[1]]))
Cor_DAC_BUF = np.array([0.5 * x_tot - 0.5 * DAC_BUF[0], 2 * gap + DIG[1]])

# CCO left center, left_bottom, corner
Cen_CCO_lef = np.array([gap + 0.5 * CCO[0], 3 * gap + DIG[1] + BUF[1] + 0.5 * CCO[1]])
Cor_CCO_lef = np.array([gap, 3 * gap + DIG[1] + BUF[1]])
Cor_CCO_rig = np.array([x_tot - Cor_CCO_lef[0] - CCO[0], Cor_CCO_lef[1]])

# BUF left, left_bottom corner
Cor_BUF_lef = np.array([gap, 2 * gap + DIG[1]])
Cor_BUF_rig = np.array([x_tot - Cor_BUF_lef[0] - BUF[0], Cor_BUF_lef[1]])

# DAC left
Cor_DAC_lef = np.array([2 * gap + max(CCO[0], BUF[0]), 3 * gap + DIG[1] + DAC_BUF[1]])
Cor_DAC_rig = np.array([x_tot - Cor_DAC_lef[0] - DAC[0], Cor_DAC_lef[1]])

# Rin left
Cor_Rin_lef = np.array([gap, Cor_CCO_lef[1] + CCO[1] + gap])
Cor_Rin_rig = np.array([x_tot - Cor_Rin_lef[0] - Rin[0], Cor_Rin_lef[1]])

# figure(1)
# axis([0 x_tot+50 0 y_tot+50])
# rectangle('Position',[Cor_Rin_lef Rin]);
# rectangle('Position',[Cor_Rin_rig Rin]);
# rectangle('Position',[Cor_CCO_lef CCO]);
# rectangle('Position',[Cor_CCO_rig CCO]);
# rectangle('Position',[Cor_BUF_lef BUF]);
# rectangle('Position',[Cor_BUF_rig BUF]);
# rectangle('Position',[Cor_DIG DIG]);
# rectangle('Position',[Cor_DAC_BUF DAC_BUF]);
# rectangle('Position',[Cor_DAC_lef DAC]);
# rectangle('Position',[Cor_DAC_rig DAC]);
# 
# rectangle('Position',[0,0, x_tot, y_tot]);

# considering power ring
# figure(2)
# grid on;
drift = np.array([power_ring, power_ring])
Cor_Rin_lef_d = Cor_Rin_lef + drift
Cor_Rin_rig_d = Cor_Rin_rig + drift
Cor_CCO_lef_d = Cor_CCO_lef + drift
Cor_CCO_rig_d = Cor_CCO_rig + drift
Cor_BUF_lef_d = Cor_BUF_lef + drift
Cor_BUF_rig_d = Cor_BUF_rig + drift
Cor_DIG_d = Cor_DIG + drift
Cor_DAC_BUF_d = Cor_DAC_BUF + drift
Cor_DAC_lef_d = Cor_DAC_lef + drift
Cor_DAC_rig_d = Cor_DAC_rig + drift

# axis([0 x_tot+power_ring+50 0 y_tot+power_ring+50])
# rectangle('Position',[Cor_Rin_lef_d Rin]);
# rectangle('Position',[Cor_Rin_rig_d Rin]);
# rectangle('Position',[Cor_CCO_lef_d CCO]);
# rectangle('Position',[Cor_CCO_rig_d CCO]);
# rectangle('Position',[Cor_BUF_lef_d BUF]);
# rectangle('Position',[Cor_BUF_rig_d BUF]);
# rectangle('Position',[Cor_DIG_d DIG]);
# rectangle('Position',[Cor_DAC_BUF_d DAC_BUF]);
# rectangle('Position',[Cor_DAC_lef_d DAC]);
# rectangle('Position',[Cor_DAC_rig_d DAC]);

# rectangle('Position',[power_ring,power_ring, x_tot, y_tot]);

loc_Rin_lef = np.concatenate((Cor_Rin_lef_d, Cor_Rin_lef_d + Rin))
loc_Rin_rig = np.concatenate((Cor_Rin_rig_d, Cor_Rin_rig_d + Rin))
loc_CCO_lef = np.concatenate((Cor_CCO_lef_d, Cor_CCO_lef_d + CCO))
loc_CCO_rig = np.concatenate((Cor_CCO_rig_d, Cor_CCO_rig_d + CCO))
loc_BUF_lef = np.concatenate((Cor_BUF_lef_d, Cor_BUF_lef_d + BUF))
loc_BUF_rig = np.concatenate((Cor_BUF_rig_d, Cor_BUF_rig_d + BUF))

# %sometime calc BUF height is 0, so add 1.8*3
# loc_BUF_lef(4) = loc_BUF_lef(4)+1.8*3;
# loc_BUF_rig(4) = loc_BUF_rig(4)+1.8*3;

loc_DIG = np.concatenate((Cor_DIG_d, Cor_DIG_d + DIG))
loc_DAC_BUF = np.concatenate((Cor_DAC_BUF_d, Cor_DAC_BUF_d + DAC_BUF))
loc_DAC_lef = np.concatenate((Cor_DAC_lef_d, Cor_DAC_lef_d + DAC))
loc_DAC_rig = np.concatenate((Cor_DAC_rig_d, Cor_DAC_rig_d + DAC))

with open('fp of DSM.txt', 'w') as fileID:
    fileID.write(f'Guide: I0 {loc_Rin_lef[0]:.4f} {loc_Rin_lef[1]:.4f} {loc_Rin_lef[2]:.4f} {loc_Rin_lef[3]:.4f} 0\n')
    fileID.write(f'Guide: I1 {loc_Rin_rig[0]:.4f} {loc_Rin_rig[1]:.4f} {loc_Rin_rig[2]:.4f} {loc_Rin_rig[3]:.4f} 0\n')
    fileID.write(f'Guide: I8 {loc_DAC_lef[0]:.4f} {loc_DAC_lef[1]:.4f} {loc_DAC_lef[2]:.4f} {loc_DAC_lef[3]:.4f} 0\n')
    fileID.write(f'Guide: I9 {loc_DAC_rig[0]:.4f} {loc_DAC_rig[1]:.4f} {loc_DAC_rig[2]:.4f} {loc_DAC_rig[3]:.4f} 0\n')
    fileID.write(f'Guide: I6 {loc_DIG[0]:.4f} {loc_DIG[1]:.4f} {loc_DIG[2]:.4f} {loc_DIG[3]:.4f} 0\n')
    fileID.write(f'Guide: I7 {loc_DAC_BUF[0]:.4f} {loc_DAC_BUF[1]:.4f} {loc_DAC_BUF[2]:.4f} {loc_DAC_BUF[3]:.4f} 0\n')
    fileID.write(f'Guide: I4 {loc_BUF_lef[0]:.4f} {loc_BUF_lef[1]:.4f} {loc_BUF_lef[2]:.4f} {loc_BUF_lef[3]:.4f} 0\n')
    fileID.write(f'Guide: I5 {loc_BUF_rig[0]:.4f} {loc_BUF_rig[1]:.4f} {loc_BUF_rig[2]:.4f} {loc_BUF_rig[3]:.4f} 0\n')
    fileID.write(f'Guide: I3 {loc_CCO_rig[0]:.4f} {loc_CCO_rig[1]:.4f} {loc_CCO_rig[2]:.4f} {loc_CCO_rig[3]:.4f} 0\n')
    fileID.write(f'Guide: I2 {loc_CCO_lef[0]:.4f} {loc_CCO_lef[1]:.4f} {loc_CCO_lef[2]:.4f} {loc_CCO_lef[3]:.4f} 0\n')

    fileID.write(f'Fence: PD1 {loc_CCO_rig[0]:.4f} {loc_CCO_rig[1]:.4f} {loc_CCO_rig[2]:.4f} {loc_CCO_rig[3]:.4f} 0\n')
    fileID.write(f'Fence: PD2 {loc_CCO_lef[0]:.4f} {loc_CCO_lef[1]:.4f} {loc_CCO_lef[2]:.4f} {loc_CCO_lef[3]:.4f} 0\n')
    fileID.write(f'Fence: PD3 {loc_BUF_rig[0]:.4f} {loc_BUF_rig[1]:.4f} {loc_BUF_rig[2]:.4f} {loc_BUF_rig[3]:.4f} 0\n')
    fileID.write(f'Fence: PD4 {loc_BUF_lef[0]:.4f} {loc_BUF_lef[1]:.4f} {loc_BUF_lef[2]:.4f} {loc_BUF_lef[3]:.4f} 0\n')
    fileID.write(f'Fence: PD5 {loc_DAC_BUF[0]:.4f} {loc_DAC_BUF[1]:.4f} {loc_DAC_BUF[2]:.4f} {loc_DAC_BUF[3]:.4f} 0\n')
    fileID.write(f'Fence: PD6 {loc_DIG[0]:.4f} {loc_DIG[1]:.4f} {loc_DIG[2]:.4f} {loc_DIG[3]:.4f} 0\n')
    fileID.write(f'Fence: PD7 {loc_DAC_rig[0]:.4f} {loc_DAC_rig[1]:.4f} {loc_DAC_rig[2]:.4f} {loc_DAC_rig[3]:.4f} 0\n')
    fileID.write(f'Fence: PD8 {loc_DAC_lef[0]:.4f} {loc_DAC_lef[1]:.4f} {loc_DAC_lef[2]:.4f} {loc_DAC_lef[3]:.4f} 0\n')
    fileID.write(f'Fence: PD9 {loc_Rin_rig[0]:.4f} {loc_Rin_rig[1]:.4f} {loc_Rin_rig[2]:.4f} {loc_Rin_rig[3]:.4f} 0\n')
    fileID.write(f'Fence: PD10 {loc_Rin_lef[0]:.4f} {loc_Rin_lef[1]:.4f} {loc_Rin_lef[2]:.4f} {loc_Rin_lef[3]:.4f} 0\n')

with open('Constraint of DSM.txt', 'w') as fileID:
    fileID.write('</Constraints>\n')
    fileID.write(f'    <Constraint type="Guide" name="I0" llx={loc_Rin_lef[0]:.4f} lly={loc_Rin_lef[1]:.4f} urx={loc_Rin_lef[2]:.4f} ury={loc_Rin_lef[3]:.4f} nrBox=0 > \n')
    fileID.write('    </Constraint>\n')
    fileID.write(f'    <Constraint type="Guide" name="I1" llx={loc_Rin_rig[0]:.4f} lly={loc_Rin_rig[1]:.4f} urx={loc_Rin_rig[2]:.4f} ury={loc_Rin_rig[3]:.4f} nrBox=0 > \n')
    fileID.write('    </Constraint>\n')
    fileID.write(f'    <Constraint type="Guide" name="I8" llx={loc_DAC_lef[0]:.4f} lly={loc_DAC_lef[1]:.4f} urx={loc_DAC_lef[2]:.4f} ury={loc_DAC_lef[3]:.4f} nrBox=0 > \n')
    fileID.write('    </Constraint>\n')
    fileID.write(f'    <Constraint type="Guide" name="I9" llx={loc_DAC_rig[0]:.4f} lly={loc_DAC_rig[1]:.4f} urx={loc_DAC_rig[2]:.4f} ury={loc_DAC_rig[3]:.4f} nrBox=0 > \n')
    fileID.write('    </Constraint>\n')
    fileID.write(f'    <Constraint type="Guide" name="I6" llx={loc_DIG[0]:.4f} lly={loc_DIG[1]:.4f} urx={loc_DIG[2]:.4f} ury={loc_DIG[3]:.4f} nrBox=0 > \n')
    fileID.write('    </Constraint>\n')
    fileID.write(f'    <Constraint type="Guide" name="I7" llx={loc_DAC_BUF[0]:.4f} lly={loc_DAC_BUF[1]:.4f} urx={loc_DAC_BUF[2]:.4f} ury={loc_DAC_BUF[3]:.4f} nrBox=0 > \n')
    fileID.write('    </Constraint>\n')
    fileID.write(f'    <Constraint type="Guide" name="I4" llx={loc_BUF_lef[0]:.4f} lly={loc_BUF_lef[1]:.4f} urx={loc_BUF_lef[2]:.4f} ury={loc_BUF_lef[3]:.4f} nrBox=0 > \n')
    fileID.write('    </Constraint>\n')
    fileID.write(f'    <Constraint type="Guide" name="I5" llx={loc_BUF_rig[0]:.4f} lly={loc_BUF_rig[1]:.4f} urx={loc_BUF_rig[2]:.4f} ury={loc_BUF_rig[3]:.4f} nrBox=0 > \n')
    fileID.write('    </Constraint>\n')
    fileID.write(f'    <Constraint type="Guide" name="I3" llx={loc_CCO_rig[0]:.4f} lly={loc_CCO_rig[1]:.4f} urx={loc_CCO_rig[2]:.4f} ury={loc_CCO_rig[3]:.4f} nrBox=0 > \n')
    fileID.write('    </Constraint>\n')
    fileID.write(f'    <Constraint type="Guide" name="I2" llx={loc_CCO_lef[0]:.4f} lly={loc_CCO_lef[1]:.4f} urx={loc_CCO_lef[2]:.4f} ury={loc_CCO_lef[3]:.4f} nrBox=0 > \n')
    fileID.write('    </Constraint>\n')

    fileID.write(f'    <Constraint type="Fence" name="PD1" llx={loc_CCO_rig[0]:.4f} lly={loc_CCO_rig[1]:.4f} urx={loc_CCO_rig[2]:.4f} ury={loc_CCO_rig[3]:.4f} nrBox=0 > \n')
    fileID.write('    </Constraint>\n')
    fileID.write(f'    <Constraint type="Fence" name="PD2" llx={loc_CCO_lef[0]:.4f} lly={loc_CCO_lef[1]:.4f} urx={loc_CCO_lef[2]:.4f} ury={loc_CCO_lef[3]:.4f} nrBox=0 > \n')
    fileID.write('    </Constraint>\n')
    fileID.write(f'    <Constraint type="Fence" name="PD3" llx={loc_BUF_rig[0]:.4f} lly={loc_BUF_rig[1]:.4f} urx={loc_BUF_rig[2]:.4f} ury={loc_BUF_rig[3]:.4f} nrBox=0 > \n')
    fileID.write('    </Constraint>\n')
    fileID.write(f'    <Constraint type="Fence" name="PD4" llx={loc_BUF_lef[0]:.4f} lly={loc_BUF_lef[1]:.4f} urx={loc_BUF_lef[2]:.4f} ury={loc_BUF_lef[3]:.4f} nrBox=0 > \n')
    fileID.write('    </Constraint>\n')
    fileID.write(f'    <Constraint type="Fence" name="PD5" llx={loc_DAC_BUF[0]:.4f} lly={loc_DAC_BUF[1]:.4f} urx={loc_DAC_BUF[2]:.4f} ury={loc_DAC_BUF[3]:.4f} nrBox=0 > \n')
    fileID.write('    </Constraint>\n')
    fileID.write(f'    <Constraint type="Fence" name="PD6" llx={loc_DIG[0]:.4f} lly={loc_DIG[1]:.4f} urx={loc_DIG[2]:.4f} ury={loc_DIG[3]:.4f} nrBox=0 > \n')
    fileID.write('    </Constraint>\n')
    fileID.write(f'    <Constraint type="Fence" name="PD7" llx={loc_DAC_rig[0]:.4f} lly={loc_DAC_rig[1]:.4f} urx={loc_DAC_rig[2]:.4f} ury={loc_DAC_rig[3]:.4f} nrBox=0 > \n')
    fileID.write('    </Constraint>\n')
    fileID.write(f'    <Constraint type="Fence" name="PD8" llx={loc_DAC_lef[0]:.4f} lly={loc_DAC_lef[1]:.4f} urx={loc_DAC_lef[2]:.4f} ury={loc_DAC_lef[3]:.4f} nrBox=0 > \n')
    fileID.write('    </Constraint>\n')
    fileID.write(f'    <Constraint type="Fence" name="PD9" llx={loc_Rin_rig[0]:.4f} lly={loc_Rin_rig[1]:.4f} urx={loc_Rin_rig[2]:.4f} ury={loc_Rin_rig[3]:.4f} nrBox=0 > \n')
    fileID.write('    </Constraint>\n')
    fileID.write(f'    <Constraint type="Fence" name="PD10" llx={loc_Rin_lef[0]:.4f} lly={loc_Rin_lef[1]:.4f} urx={loc_Rin_lef[2]:.4f} ury={loc_Rin_lef[3]:.4f} nrBox=0 > \n')
    fileID.write('    </Constraint>\n')
    fileID.write('</Constraints>\n')

# % %Follow pin
VCTRLP = np.array([loc_CCO_lef[0:2] - 2, loc_CCO_lef[2:4] + 2])
VCTRLN = np.array([loc_CCO_rig[0:2] - 2, loc_CCO_rig[2:4] + 2])
VBUF = np.array([loc_BUF_rig[0:2] - 2, loc_BUF_rig[2:4] + 2])
VBUF2 = np.array([loc_BUF_lef[0:2] - 2, loc_BUF_lef[2:4] + 2])
VREFP = np.array([loc_DAC_BUF[0:2] - 2, loc_DAC_BUF[2:4] + 2])
VDD = np.array([loc_DIG[0:2] - 2, loc_DIG[2:4] + 2])

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

