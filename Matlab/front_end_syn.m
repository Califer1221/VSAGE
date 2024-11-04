
disp("Config input specs in each of files after every step.");

stage_calc


%disp(['The archi is: ', num2str(var)]);
Archi = input('Do you want to proceed with 1st order (enter 1) or 2nd order (enter 2)? ');
N = input('How many stages of quantizer (enter num)? ');

if (Archi == 1)
    solve_param_comb_v1
    CCO_type = input('What is CCO_type (enter num from 1 to 5)? ');
    CCO_load = input('What is CCO_load (enter num from 1 to 7)? ');
    solve_param_RDAC_N_v6
end

if (Archi == 2)
    solve_param_2nd_1st
    CCO_type_1st = input('What is 1st stage CCO_type (enter num from 1 to 5)? ');
    CCO_load_1st = input('What is 1st stage CCO_load (enter num from 1 to 7)? ');
    CCO_type_2nd = input('What is 2nd stage CCO_type (enter num from 1 to 5)? ');
    CCO_load_2nd = input('What is 2nd stage CCO_load (enter num from 1 to 7)? ');
    solve_param_2nd
end

disp("Based on params_valid_ranked_filt, choose all parameters");
