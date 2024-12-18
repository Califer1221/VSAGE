with open('floorplan.txt', 'w') as fileID:
    fileID.write('\n')
    fileID.write('selectObject Module I0 \n')
    fileID.write('createInstGroup PD10 -fence {:.4f} {:.4f} {:.4f} {:.4f} \n'.format(*loc_Rin_lef))
    fileID.write('setInstGroupPhyHier PD10 \n')
    fileID.write('addInstToInstGroup PD10 {I0 } \n')
    fileID.write('deselectModule I0 \n')
    fileID.write('\n')

    fileID.write('selectObject Module I1 \n')
    fileID.write('createInstGroup PD9 -fence {:.4f} {:.4f} {:.4f} {:.4f} \n'.format(*loc_Rin_rig))
    fileID.write('setInstGroupPhyHier PD9 \n')
    fileID.write('addInstToInstGroup PD9 {I1 } \n')
    fileID.write('deselectModule I1 \n')
    fileID.write('\n')

    fileID.write('selectObject Module I8 \n')
    fileID.write('createInstGroup PD8 -fence {:.4f} {:.4f} {:.4f} {:.4f} \n'.format(*loc_DAC_lef))
    fileID.write('setInstGroupPhyHier PD8 \n')
    fileID.write('addInstToInstGroup PD8 {I8 } \n')
    fileID.write('deselectModule I8 \n')
    fileID.write('\n')

    fileID.write('selectObject Module I9 \n')
    fileID.write('createInstGroup PD7 -fence {:.4f} {:.4f} {:.4f} {:.4f} \n'.format(*loc_DAC_rig))
    fileID.write('setInstGroupPhyHier PD7 \n')
    fileID.write('addInstToInstGroup PD7 {I9 } \n')
    fileID.write('deselectModule I9 \n')
    fileID.write('\n')

    fileID.write('selectObject Module I6 \n')
    fileID.write('createInstGroup PD6 -fence {:.4f} {:.4f} {:.4f} {:.4f} \n'.format(*loc_DIG))
    fileID.write('setInstGroupPhyHier PD6 \n')
    fileID.write('addInstToInstGroup PD6 {I6 } \n')
    fileID.write('deselectModule I6 \n')
    fileID.write('\n')

    fileID.write('selectObject Module I7 \n')
    fileID.write('createInstGroup PD5 -fence {:.4f} {:.4f} {:.4f} {:.4f} \n'.format(*loc_DAC_BUF))
    fileID.write('setInstGroupPhyHier PD5 \n')
    fileID.write('addInstToInstGroup PD5 {I7 } \n')
    fileID.write('deselectModule I7 \n')
    fileID.write('\n')

    fileID.write('selectObject Module I4 \n')
    fileID.write('createInstGroup PD4 -fence {:.4f} {:.4f} {:.4f} {:.4f} \n'.format(*loc_BUF_lef))
    fileID.write('setInstGroupPhyHier PD4 \n')
    fileID.write('addInstToInstGroup PD4 {I4 } \n')
    fileID.write('deselectModule I4 \n')
    fileID.write('\n')

    fileID.write('selectObject Module I5 \n')
    fileID.write('createInstGroup PD3 -fence {:.4f} {:.4f} {:.4f} {:.4f} \n'.format(*loc_BUF_rig))
    fileID.write('setInstGroupPhyHier PD3 \n')
    fileID.write('addInstToInstGroup PD3 {I5 } \n')
    fileID.write('deselectModule I5 \n')
    fileID.write('\n')

    fileID.write('selectObject Module I3 \n')
    fileID.write('createInstGroup PD1 -fence {:.4f} {:.4f} {:.4f} {:.4f} \n'.format(*loc_CCO_rig))
    fileID.write('setInstGroupPhyHier PD1 \n')
    fileID.write('addInstToInstGroup PD1 {I3 } \n')
    fileID.write('deselectModule I3 \n')
    fileID.write('\n')

    fileID.write('selectObject Module I2 \n')
    fileID.write('createInstGroup PD2 -fence {:.4f} {:.4f} {:.4f} {:.4f} \n'.format(*loc_CCO_lef))
    fileID.write('setInstGroupPhyHier PD2 \n')
    fileID.write('addInstToInstGroup PD2 {I2 } \n')
    fileID.write('deselectModule I2 \n')
    fileID.write('\n')

