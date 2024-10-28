%05/27/2022
%generate floorplan and constraint file for 2nd order DSM but has no use
%currentlly

fileID = fopen('fp of DSM_2nd.txt', 'w');
fprintf(fileID, 'Guide: I0 %.4f %.4f %.4f %.4f 0\n', loc_Rin_lef);
fprintf(fileID, 'Guide: I1 %.4f %.4f %.4f %.4f 0\n', loc_Rin_rig);
fprintf(fileID, 'Guide: I2 %.4f %.4f %.4f %.4f 0\n', loc_CCO1_lef);
fprintf(fileID, 'Guide: I3 %.4f %.4f %.4f %.4f 0\n', loc_CCO1_rig);
fprintf(fileID, 'Guide: I4 %.4f %.4f %.4f %.4f 0\n', loc_PFD);
fprintf(fileID, 'Guide: I5 %.4f %.4f %.4f %.4f 0\n', loc_CCO2_lef);
fprintf(fileID, 'Guide: I6 %.4f %.4f %.4f %.4f 0\n', loc_CCO2_rig);
fprintf(fileID, 'Guide: I7 %.4f %.4f %.4f %.4f 0\n', loc_QUAN_lef);
fprintf(fileID, 'Guide: I8 %.4f %.4f %.4f %.4f 0\n', loc_QUAN_rig);
fprintf(fileID, 'Guide: I9 %.4f %.4f %.4f %.4f 0\n', loc_DAC_BUF_lef);
fprintf(fileID, 'Guide: I10 %.4f %.4f %.4f %.4f 0\n', loc_DAC_BUF_rig);
fprintf(fileID, 'Guide: I11 %.4f %.4f %.4f %.4f 0\n', loc_DAC_lef);
fprintf(fileID, 'Guide: I12 %.4f %.4f %.4f %.4f 0\n', loc_DAC_rig);

fprintf(fileID, 'Fence: PD0 %.4f %.4f %.4f %.4f 0\n', loc_Rin_lef);
fprintf(fileID, 'Fence: PD1 %.4f %.4f %.4f %.4f 0\n', loc_Rin_rig);
fprintf(fileID, 'Fence: PD2 %.4f %.4f %.4f %.4f 0\n', loc_CCO1_lef);
fprintf(fileID, 'Fence: PD3 %.4f %.4f %.4f %.4f 0\n', loc_CCO1_rig);
fprintf(fileID, 'Fence: PD4 %.4f %.4f %.4f %.4f 0\n', loc_PFD);
fprintf(fileID, 'Fence: PD5 %.4f %.4f %.4f %.4f 0\n', loc_CCO2_lef);
fprintf(fileID, 'Fence: PD6 %.4f %.4f %.4f %.4f 0\n', loc_CCO2_rig);
fprintf(fileID, 'Fence: PD7 %.4f %.4f %.4f %.4f 0\n', loc_QUAN_lef);
fprintf(fileID, 'Fence: PD8 %.4f %.4f %.4f %.4f 0\n', loc_QUAN_rig);
fprintf(fileID, 'Fence: PD9 %.4f %.4f %.4f %.4f 0\n', loc_DAC_BUF_lef);
fprintf(fileID, 'Fence: PD10 %.4f %.4f %.4f %.4f 0\n', loc_DAC_BUF_rig);
fprintf(fileID, 'Fence: PD11 %.4f %.4f %.4f %.4f 0\n', loc_DAC_lef);
fprintf(fileID, 'Fence: PD12 %.4f %.4f %.4f %.4f 0\n', loc_DAC_rig);

fclose(fileID);

fileID = fopen('Constraint of DSM_2nd.txt', 'w');
fprintf(fileID, '</Constraints>\n');
fprintf(fileID, '    <Constraint type="Guide" name="I0" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_Rin_lef);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Guide" name="I1" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_Rin_rig);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Guide" name="I2" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_CCO1_lef);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Guide" name="I3" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_CCO1_rig);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Guide" name="I4" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_PFD);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Guide" name="I5" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_CCO2_lef);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Guide" name="I6" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_CCO2_rig);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Guide" name="I7" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_QUAN_lef);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Guide" name="I8" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_QUAN_rig);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Guide" name="I9" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_DAC_BUF_lef);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Guide" name="I10" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_DAC_BUF_rig);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Guide" name="I11" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_DAC_lef);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Guide" name="I12" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_DAC_rig);
fprintf(fileID, '    </Constraint>\n');

fprintf(fileID, '    <Constraint type="Fence" name="PD0" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_Rin_lef);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Fence" name="PD1" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_Rin_rig);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Fence" name="PD2" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_CCO1_lef);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Fence" name="PD3" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_CCO1_rig);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Fence" name="PD4" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_PFD);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Fence" name="PD5" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_CCO2_lef);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Fence" name="PD6" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_CCO2_rig);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Fence" name="PD7" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_QUAN_lef);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Fence" name="PD8" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_QUAN_rig);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Fence" name="PD9" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_DAC_BUF_lef);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Fence" name="PD10" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_DAC_BUF_rig);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Fence" name="PD11" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_DAC_lef);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '    <Constraint type="Fence" name="PD12" llx=%.4f lly=%.4f urx=%.4f ury=%.4f nrBox=0 > \n', loc_DAC_rig);
fprintf(fileID, '    </Constraint>\n');
fprintf(fileID, '</Constraints>\n');

fclose(fileID);
