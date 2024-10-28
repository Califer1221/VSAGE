%v6 is derived from v5
%v6 optimze FoM
%v5 is derived from v1
%11/08/2022
%09/26/2022
%new version of gradient descent
%optimze Rin, Rdac and Voltage bias for 1st-order VCO-based DSM

%Gradient Descent + CCO_DSM
clear all;
clc;

FoMs_aim = 170;
SNDR_aim = 80;%68.5;
%input = [90,4309.34827227077,6981.44000000000,4309.34827227077,1.06385538321405,1073.50373035331];
%input = [90, 4309, 6981, 4309, 1.06, 1073.5];
%input = [90, 2000, 6981, 2000, 1.06, 1073.5];
N = 31;
S = 5;
fs = 200e6;

OSR = 60;
BW = fs/2/OSR;
%optimization ways: SNDR(0) or FoMs(1)
opti_way = 1;

% R1_current = input(2);
% Rdac_current = input(4); %attention in ANN donot need to *N
% Bias_current = input(5);
% Res_CCO_fix = input(3);

R1_current = 4.3e3;
Rdac_current = 4.3e3; %attention in ANN donot need to *N
Bias_current = 1.06;

%[SNDR_max,~,~] = CCO_DSM_ANN_v11_v2([R1_current, Bias_current]);


[FoMs, FoMw, SNDR_max, Power, P_analog, P_digital] = CCO_DSM_evaluator(N, S, R1_current, R1_current, Bias_current, BW);
FoMs_initial = FoMs;
FoMs_current = FoMs_initial;

SNDR_initial = SNDR_max;
SNDR_current = SNDR_initial;

% R1_new = R1_current*1.1;
% Rdac_new = Rdac_current*1.1;
% Bias_new = Bias_current*1.03;

% R1_new = R1_current*0.9;
% Rdac_new = Rdac_current*0.9;
% Bias_new = Bias_current*0.97;

R1_new = R1_current*1.1;
Rdac_new = Rdac_current*1.1;
Bias_new = Bias_current*0.9;

% R1_new = R1_current*0.9;
% Rdac_new = Rdac_current*0.9;
% Bias_new = Bias_current*1.03;

%[ENOB_max, SNDR_max, SNDR_max50, SNDR_max60, SNDR_max70] = CCO_DSM(fs, N, S, R1_new, Rdac_new, Res_CCO_fix, Bias_new);
%[SNDR_max,~,~] = CCO_DSM_ANN_v5([fs, N, S, R1_new, Rdac_new, Res_CCO_fix, Bias_new]);
%[SNDR_max,~,~] = CCO_DSM_ANN_v11_v2([R1_new, Bias_new]);
[FoMs, FoMw, SNDR_max, Power, P_analog, P_digital] = CCO_DSM_evaluator(N, S, R1_new, R1_new, Bias_new, BW);
FoMs_new = FoMs;



SNDR_new = SNDR_max;



% LG_new = 0.5;
% [out_new, valid] = solver_param(V, Amp, LG_current, N, fs);
% [SNDR16, SNDR32, SNDR64_new, ENOB16, ENOB32, ENOB64] = CCO_DSM(out_new(2),out_new(4),out_new(5),N);
% SNDR_new = SNDR64_new;
%LG_best = LG_current;

%SNDR_current = SNDR64;
%SNDR_best = SNDR_current;

%rand('state', sum(clock));
%t = 90; %initial temp
%tf = 88; %end temp
%a = 0.99; % temp reduce scale
% step_R1 = 50000;%0.5;
% step_Rdac = 50000;%0.5;
% step_bias = 0.001;%0.1;

step_R1 = 500;%0.5;
step_Rdac = 500;%0.5;
step_bias = 0.001;%0.1;

% step_R1 = 500000;%0.5;
% step_Rdac = 500000;%0.5;
% step_bias = 0.01;%0.1;

% step_R1 = 50000;%0.5;
% step_Rdac = 50000;%0.5;
% step_bias = 0.001;%0.1;

i = 1;
Bias_route = [Bias_current];
R1_route = [R1_current];
Rdac_route = [Rdac_current];
SNDR_route = [SNDR_current];
FoMs_route = [FoMs_current];

SNDR_best = SNDR_current;
FoMs_best = FoMs_current;
%err = abs(SNDR_new - SNDR_current);
%err = abs(SNDR_new - SNDR_current);

if (opti_way == 1)
    err = abs(FoMs_current - FoMs_aim);
else
    err = abs(SNDR_current - SNDR_aim);
end
    
    

while err > 0.05%0.01
    %for r = 1:10
        %out_new(4) = out_new(4) + rand*0.5;
        % -0.25~0.25 random (rand*2-1)*0.25
        if (opti_way == 1)
            Grad_R1 = (FoMs_new - FoMs_current)/(R1_new - R1_current);
            Grad_Rdac = (FoMs_new - FoMs_current)/(Rdac_new - Rdac_current);
            Grad_Bias = (FoMs_new - FoMs_current)/(Bias_new - Bias_current);
        
        else
            Grad_R1 = (SNDR_new - SNDR_current)/(R1_new - R1_current);
            Grad_Rdac = (SNDR_new - SNDR_current)/(Rdac_new - Rdac_current);
            Grad_Bias = (SNDR_new - SNDR_current)/(Bias_new - Bias_current);
        end
        
        
      
        
        R1_current = R1_new;
        Rdac_current = Rdac_new;
        Bias_current = Bias_new;
        
        SNDR_current = SNDR_new;
        FoMs_current = FoMs_new;
        %Grad_R1 * step_R1
        R1_new = R1_new + Grad_R1 * step_R1;
        if R1_new > 0
        else
            R1_new = rand*0.5;
            continue;
        end
        
        %Grad_Rdac * step_Rdac
        Rdac_new = Rdac_new + Grad_Rdac * step_Rdac;
        if Rdac_new > 0
        else
            Rdac_new = rand*0.5;
            continue;
        end
        
        %Grad_Bias * step_bias
        Bias_new = Bias_new + Grad_Bias * step_bias;
        if Bias_new > 0
        else
            Bias_new = rand*0.5;
            continue;
        end
        
        %[SNDR_max,~,~] = CCO_DSM_ANN_v11_v2([R1_new, Bias_new]);
        [FoMs, FoMw, SNDR_max, Power, P_analog, P_digital] = CCO_DSM_evaluator(N, S, R1_new, R1_new, Bias_new, BW);
        FoMs_new = FoMs;


        SNDR_new = SNDR_max;
        
        %err = abs(SNDR_new - SNDR_current);
        if (opti_way == 1)
            err = abs(FoMs_new - FoMs_current);
        else
            err = abs(SNDR_new - SNDR_current);
        end

            
        
        
        %err = abs(SNDR_current - SNDR_aim);
        
%         if SNDR_new > SNDR_current
%             SNDR_current = SNDR_new;
%             LG_current = LG_new;
%             if SNDR_new > SNDR_best
%                 SNDR_best = SNDR_new;
%                 LG_best = LG_new;
%             end
%         else
%             if rand < exp((SNDR_new - SNDR_current)*10/t)
%                 SNDR_current = SNDR_new;
%                 LG_current = LG_new;
%             else
%                 LG_new = LG_current;
%             end
%         end
%         i = i+1;
%         figure(1)
%         plot(i, SNDR_new, '-*');
%         hold on;
%         figure(2)
%         plot(i, Bias_new, '-*');
%         hold on;
%         figure(3)
%         plot(i, R1_new, '-*');
%         hold on;
%         hold on;
        R1_route(end+1) = R1_new;
        Rdac_route(end+1) = Rdac_new;
        Bias_route(end+1) = Bias_new;
        SNDR_route(end+1) = SNDR_new;
        FoMs_route(end+1) = FoMs_new;
        if (i>500)
            break;
        end
    %end
    %t = t*a;
end
R1_best = R1_current;
Rdac_best = Rdac_current;
Bias_best = Bias_current;
SNDR_best = SNDR_current;

figure(5)
subplot(2,2,1);
plot(SNDR_route, 'r-*', 'LineWidth', 2);
title('SNDR\_route');

subplot(2,2,2);
plot(FoMs_route, 'r-*', 'LineWidth', 2);
title('FoMs\_route');

subplot(2,2,3);
plot(Bias_route, 'r-*', 'LineWidth', 2);
title('Bias\_route');


subplot(2,2,4);
plot(R1_route, 'r-*', 'LineWidth', 2);
title('R1\_route');

figure(2)
hold on
plot(Bias_route, R1_route, 'r-*', 'LineWidth', 2);

figure(1)
hold on
plot3(Bias_route, R1_route, FoMs_route, 'r-*', 'LineWidth', 2);


