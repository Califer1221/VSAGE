%11/06/2022
%power estimation
%input N,S,R1,Rdac,Vbias
%output power
function [Power, P_analog, P_digital, P_CCO] = power_esti_v1(N, S, R1, Rdac, Vbias)
%this is only valid when N = 31 because cal_CCO_params_v1 can only work
%for N = 31

% R1 = 2.52e3;
% Rdac = 2.52e3;
% Vbias = 1.23;

%%%%%%%%%%%%%%
Amp = 0.6;
Vref = 1.2;
%LG = 1;
fs = 200e6;
N = 31;
VDD = 1.2; % VDD of RDAC
S = 5;
CCO_type_num = 1;
%%%%%%%%%%%%%%

%power unit is W
digital_one_bit = 8*1e-6;


[Rcco_LS, Rcco_SS, LG, Ictrl, ~] = cal_CCO_params_v1(R1, Rdac, Vbias);
Vctrl = Rcco_LS*Ictrl*1e-6;

%CCO
P_CCO = Vctrl*Ictrl*1e-6;

%R1 power
P_R1 = (Vbias - Vctrl)^2/R1;

%Rdac
%P_Rdac = ((Vbias - Vctrl)/R1 - Ictrl*1e-6)^2 * Rdac;
P_Rdac = ((Vref - Vctrl)/(Rdac/2))^2*(Rdac/2) + ((Vctrl)/(Rdac/2))^2*(Rdac/2);

%digital
P_digital = digital_one_bit * N;

P_analog = (P_CCO + P_R1 + P_Rdac)*2;

Power = P_analog + P_digital;

end