# VSAGE
VSAGE: VCO-based DSM Generator Brief Tutorial
: https://kenno.notion.site/VSAGE-Tutorial-12dec0a92e4a80d49190e62efdf1a9a7?pvs=4

## 1. Creating the CCO surrogate model

ocean file:

`TOP_82to248.ocn` : Ocean script to obtain all kinds of CCO information on different CCO type.  

MATLAB file:

`f_spline_CCO_DCAP_M_all_size_v1` : generate the surrogate model of CCO

`plot_f_spline_CCO_all_size_DCAP_M_20pts_0227_2022` : visualization of CCO surrogate model

`parallel_simulink_test8` : Dataset Gen

## 2. Front-end synthesis

parameter gen

`solve_param_RDAC_N_v5`

parameter optimization

`GradientD_v6`

`CCO_DSM_evaluator`

circuit gen

`CCO_DSM_top_innovus_v12`

`CCO_DSM_top_innovus_2nd_order_v3`

## 3. Back-end synthesis

layout floorplan gen

`Area_estimation`

`layout3`: plot the floorplan priorly for designer to check. 

layout gen

`tcl_gen`
