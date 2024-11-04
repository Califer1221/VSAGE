import os
# Open the file and write floorplan generation commands
with open('floorplan_2nd.txt', 'w') as file:
    file.write('\n')
    file.write('getIoFlowFlag \n')
    file.write('setIoFlowFlag 0 \n')
    file.write(f'floorPlan -coreMarginsBy die -site core -s {x_tot:.4f} {y_tot:.4f} 30 30 30 30 \n')
    file.write('uiSetTool select \n')
    file.write('getIoFlowFlag \n')
    
    # Add instances
    def create_instance(file, instance_name, location):
        file.write(f'selectObject Module {instance_name} \n')
        file.write(f'createInstGroup {instance_name} -fence {location[0]:.4f} {location[1]:.4f} {location[2]:.4f} {location[3]:.4f} \n')
        file.write(f'setInstGroupPhyHier {instance_name} \n')
        file.write(f'addInstToInstGroup {instance_name} {{{instance_name} }} \n')
        file.write(f'deselectModule {instance_name} \n\n')
    
    create_instance(file, "PD0", loc_Rin_lef)
    create_instance(file, "PD1", loc_Rin_rig)
    create_instance(file, "PD2", loc_CCO1_lef)
    create_instance(file, "PD3", loc_CCO1_rig)
    create_instance(file, "PD4", loc_PFD)
    create_instance(file, "PD5", loc_CCO2_lef)
    create_instance(file, "PD6", loc_CCO2_rig)
    create_instance(file, "PD7", loc_QUAN_lef)
    create_instance(file, "PD8", loc_QUAN_rig)
    create_instance(file, "PD9", loc_DAC_BUF_lef)
    create_instance(file, "PD10", loc_DAC_BUF_rig)
    create_instance(file, "PD11", loc_DAC_lef)
    create_instance(file, "PD12", loc_DAC_rig)
    create_instance(file, "PD13", loc_SW)

# Route definitions
VCTRLP1 = [loc_CCO1_lef[0] - 2, loc_CCO1_lef[1] - 2, loc_CCO1_lef[2] + 2, loc_CCO1_lef[3] + 2]
VCTRLN1 = [loc_CCO1_rig[0] - 2, loc_CCO1_rig[1] - 2, loc_CCO1_rig[2] + 2, loc_CCO1_rig[3] + 2]
# Define other routing pins similarly

with open('Follow_pin_2nd.txt', 'w') as file:
    def write_route(file, area, net_name):
        file.write('::uiSetTool defineArea ::Rda_Route::RoutePowerPin::advancedSetAreaBBox \n')
        file.write('uiSetTool select \n')
        file.write('setSrouteMode -viaConnectToShape { ring blockring } \n')
        file.write(f'sroute -connect {{ corePin }} -layerChangeRange {{ M1(1) M9(9) }} -blockPinTarget {{ nearestTarget }} '
                   f'-corePinTarget {{ firstAfterRowEnd }} -allowJogging 1 -crossoverViaLayerRange {{ M1(1) AP(10) }} '
                   f'-area {{ {area[0]:.4f} {area[1]:.4f} {area[2]:.4f} {area[3]:.4f} }} -nets {{ {net_name} }} '
                   f'-allowLayerChange 1 -targetViaLayerRange {{ M1(1) AP(10) }}\n\n')
    
    write_route(file, VCTRLP1, 'VCTRLP')
    write_route(file, VCTRLN1, 'VCTRLN')
    # Continue for other nets as required

# Combine files using cat (Linux/Mac) or type (Windows)
os.system("cat start_loading_2nd_order.txt floorplan_2nd.txt power_ring_2nd_order_SW.txt Follow_pin_2nd.txt P_R.txt > Start2end_2nd.tcl")