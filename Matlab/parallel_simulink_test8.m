%11/08/2022
%run for different N

%11/06/2022
%run for model CCO_DSM_RDAC_03

%10/25/2022
%set variables
%parallel computing with 2 loop (R1 & Bias)
%works perfectly
%test6: Rcco_fixed is now changing with different inputs

addpath '/nethome/kli416/Downloads/VCO/Work'


% 1) Load model
%open('CCO_DSM_RDAC_03');
model = 'CCO_DSM_RDAC_03';
load_system(model);

% 2) Set up the sweep parameters
% Cf_sweep  = 2500*(0.05:0.1:0.95);
% numSims   = numel(Cf_sweep);
N = 27;
S = 5;
fs = 200e6;
%Res_CCO_fix = 6981;
%Ru = 3e3;
%Bias = 1;

%N=27
R1_space = [0.5:0.5:10]*1e3;
Rdac_space = R1_space;%[1:2:10]*1e3;
Bias_space = [0.4:0.2:2.2];

% R1_space = [0.5:0.1:10]*1e3;
% Rdac_space = R1_space;%[1:2:10]*1e3;
% Bias_space = [0.4:0.1:2.2];

[~, num_R1] = size(R1_space);
%[~, num_Ru] = size(Ru_space);
[~, num_Bias] = size(Bias_space);

Rcco_LS = zeros(num_R1, num_Bias);
Rcco_SS = zeros(num_R1, num_Bias);
LG = zeros(num_R1, num_Bias);

parfor i = 1: num_R1
    for j = 1:num_Bias
        %R1 = R1_space(i);
        %Vbias = Bias_space(j);
        [Rcco_LS(i, j), Rcco_SS(i, j), LG(i,j), ~, ~] = cal_CCO_params_v2(R1_space(i), R1_space(i), Bias_space(j), N, S, 1);
    end
end


N_stage = N;
for i = 1: N_stage
        if (mod(i,2)==1)
            Ph(i) = pi - pi*i/N_stage -1;
        else
            Ph(i) = -pi*i/N_stage -1;
        end
end
    

result_SNDR_max = zeros(num_R1, num_Bias);
result_SNDR_max50 = zeros(num_R1, num_Bias);
result_SNDR_max60 = zeros(num_R1, num_Bias);
result_SNDR_max70 = zeros(num_R1, num_Bias);


% 3) Create an array of SimulationInput objects and specify the sweep value for each simulation
simIn(1:num_R1,1:num_Bias) = Simulink.SimulationInput(model);

for idx = 1:num_R1
    for jdx = 1:num_Bias
        simIn(idx,jdx) = simIn(idx,jdx).setVariable('Res', R1_space(idx), 'Workspace', 'CCO_DSM_RDAC_03');
        simIn(idx,jdx) = simIn(idx,jdx).setVariable('Ru', Rdac_space(idx)*N, 'Workspace', 'CCO_DSM_RDAC_03');
        simIn(idx,jdx) = simIn(idx,jdx).setVariable('Res_CCO_LS', Rcco_LS(idx, jdx), 'Workspace', 'CCO_DSM_RDAC_03');
        simIn(idx,jdx) = simIn(idx,jdx).setVariable('Res_CCO_SS', Rcco_SS(idx, jdx), 'Workspace', 'CCO_DSM_RDAC_03');
        %simIn(idx,jdx) = simIn(idx,jdx).setVariable('fix_valid', 1);
        simIn(idx,jdx) = simIn(idx,jdx).setVariable('VDD', 1.2);
        simIn(idx,jdx) = simIn(idx,jdx).setVariable('N', N);
        
        
        simIn(idx,jdx) = simIn(idx,jdx).setVariable('Bias', Bias_space(jdx), 'Workspace', 'CCO_DSM_RDAC_03');
        simIn(idx,jdx) = simIn(idx,jdx).setVariable('Compen', 0);
        simIn(idx,jdx) = simIn(idx,jdx).setVariable('clk_p', 1/fs);
        
        
        % # of stages
        N_stage = N;%15;%25;%31;%15;%31;
        
        simIn(idx,jdx) = simIn(idx,jdx).setVariable('N_stage', N_stage);
        simIn(idx,jdx) = simIn(idx,jdx).setVariable('kcco_gain', 0.6);
        simIn(idx,jdx) = simIn(idx,jdx).setVariable('S', S);
        %mismatch of DAC
        
        %mismatch = ones(1, N_stage+1);
        %assignin(mdlwks, 'mismatch',ones(1, N_stage+1));
        
        simIn(idx,jdx) = simIn(idx,jdx).setVariable('mismatch', ones(1, N_stage+1));
        Ph2 = circshift(Ph, (N_stage+1)/2);
        
        simIn(idx,jdx) = simIn(idx,jdx).setVariable('Ph', Ph);
        simIn(idx,jdx) = simIn(idx,jdx).setVariable('Ph2', Ph2);
        
        simIn(idx,jdx) = simIn(idx,jdx).setVariable('gain_DAC', 1);
        
        %clk
        clk = fs;
        clk_p = 1/clk;
        
        N_in = 4096;
        M = 11;%5;%155;%11;%87;%11;
        finw = 2*pi*M/(N_in*clk_p); %2*pi*1.171875e7;
        fin = finw/(2*pi);
        
        simIn(idx,jdx) = simIn(idx,jdx).setVariable('Amp_in', 0.55);
        simIn(idx,jdx) = simIn(idx,jdx).setVariable('finw', finw);

       simIn(idx) = simIn(idx).setModelParameter('StopTime', num2str(6000*clk_p));
    end
end

simOut = parsim(simIn, 'showSimulationManager', 'on', 'ShowProgress', 'on');
%simOut = parsim(simIn(:, 52:num_Bias), 'showSimulationManager', 'on', 'ShowProgress', 'on');
%simOut = parsim(simIn(1:5, 1:5), 'showSimulationManager', 'on', 'ShowProgress', 'on');
%simOut = parsim(simIn); 
%simOut = sim(simIn(1));    

%simOut = parsim(simIn);    
%simOut = parsim('CCO_DSM_RDAC_03', 5500/clk);
%parsim('CCO_DSM_RDAC_01', 5500/clk);

tic;
result_SNDR_max = zeros(num_R1, num_Bias);
result_SNDR_max50 = zeros(num_R1, num_Bias);
result_SNDR_max60 = zeros(num_R1, num_Bias);
result_SNDR_max70 = zeros(num_R1, num_Bias);

counter = 0;
parfor i = 1:num_R1
    for k = 1:num_Bias %1:51
        x = simOut(i, k).vco_out1;
        x1 = x(1000:2:end);
        Num = 4096;
        M = 11;
        OSR = 67.5;
        [ENOB_max, SNDR_max] = test_FFT_loop_nowin(fs, Num, M, OSR, x1);
        [ENOB_max50, SNDR_max50] = test_FFT_loop_nowin(fs, Num, M, 50, x1);
        [ENOB_max60, SNDR_max60] = test_FFT_loop_nowin(fs, Num, M, 60, x1);
        [ENOB_max70, SNDR_max70] = test_FFT_loop_nowin(fs, Num, M, 70, x1);
        
        %result(end+1) = SNDR_max;
        result_SNDR_max(i, k) = SNDR_max;
        result_SNDR_max50(i, k) = SNDR_max50;
        result_SNDR_max60(i, k) = SNDR_max60;
        result_SNDR_max70(i, k) = SNDR_max70;
        formatSpec = '%4.2f\n';
        fprintf(formatSpec,counter)
        counter = counter+1;
    end
end
time = toc;
writematrix(result_SNDR_max,'./results_1108_N/result_SNDR_max_1108_1632sample_N27.txt','Delimiter','tab');
writematrix(result_SNDR_max50,'./results_1108_N/result_SNDR_max50_1108_1632sample_N27.txt','Delimiter','tab');
writematrix(result_SNDR_max60,'./results_1108_N/result_SNDR_max60_1108_1632sample_N27.txt','Delimiter','tab');
writematrix(result_SNDR_max70,'./results_1108_N/result_SNDR_max70_1108_1632sample_N27.txt','Delimiter','tab');
    