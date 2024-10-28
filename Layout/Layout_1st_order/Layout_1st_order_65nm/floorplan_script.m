%
fileID = fopen('floorplan.txt', 'w');

fprintf(fileID, '\n');
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
