%2 kinds of Rcco, R2 and Rcco
%in this version, Icomp is eliminated
% add a new variable S, which is # of CCO for a CCO_unit
%R2 used for Vdc calculation, Rcco used for kdac calculation

%!!!!!R2 is valid when Ictrl<200uA

clearvars;
clc

addpath '/nethome/kli416/Downloads/VCO/Work/PloT_DCAP/DCAP_M'

%solve parameters with differenct ictrl
%V = 0.55;  %VDC
Amp = 0.6;%1.2;%1.2;%0.6;%0.07;
LG = 1;%1;%0.25;%0.25;%1;%0.24;
fs = 1e6;%0.5e6;%250e6;
N = 11;%127;%15;%31;
VDD = 1.2; % VDD of RDAC
S = 29; %S should be odd number
ratio = 0.7;%0.7; %degradation ratio of kcco in layout
CCO_size_num = 5;
CCO_load_num = 7;

CCO_size_lib = ["CCO82", "CCO124", "CCO164", "CCO206", "CCO248"];
CCO_load_lib = ["DCAP0", "DCAP1", "DCAP4", "DCAP8", "DCAP16", "DCAP32", "DCAP64"];
disp(CCO_size_lib(CCO_size_num));
disp(CCO_load_lib(CCO_load_num));

N_half = (N-1)/2;%round(N/2);

params = zeros(20,6);
count = 1;

for ictrl = 10:10:200 %190:1:190%11.3:5:11.3
%for ictrl = 120:1:120
    [freq, kcco,diff_kcco, R2, Rcco, Vctrl] = f_spline_CCO_DCAP_M_all_size_v1(ictrl,N*S,CCO_size_num,CCO_load_num);
    %[freq, kcco,diff_kcco, R2, Rcco, Vctrl]=f_spline_CCO_DCAP_all_size_v1(ictrl,N*S,CCO_size_num,CCO_load_num);
    %[freq, kcco,diff_kcco, R2, Rcco, Vctrl]=f_spline_CCO_DCAP_all_size_1to350u_v1(ictrl,N*S,CCO_size_num,CCO_load_num);
    %[R2, Rcco] = f_spline_CCO_Res_N(ictrl, N*S);
    %[freq, kcco,diff_kcco]=f_spline_CCO82_N(ictrl,N*S);
    kdac = fs*LG/(4*N*kcco*ratio);
    
    %R1 = 2*Amp/(N*kdac*1e-6) - Rcco - Rcco*2*Amp/(VDD);
    %Ru = N*R1*VDD/(2*Amp);
    Ru = VDD/(kdac*1e-6) - (Rcco*VDD*N)/(2*Amp) - N*Rcco;
    Rdac = Ru/N;
    R1 = (2*Amp*Ru)/(VDD*N);
    %Icomp = ictrl*(1+R2/R1+N*R2/Ru) - V/R1*1e6 - N_half*VDD/Ru*1e6;
    V = R1*(ictrl*(1+R2/R1+N*R2/Ru)-N_half*VDD/Ru*1e6)/1e6;
    
    params(count, :) = [ictrl, R1, R2, Rdac, V, Rcco];
    %params_m(count) = params; 
    count = count + 1;
end

%params;


s = size(params);
params_valid = zeros(s(1),6);
t = 1;
for i = 1: s(1)
    scale = params(i,2)/params(i,3);
    %if (params(i,2)>0 && params(i,4)>0 && params(i,4)<300 && params(i,5)<1000 && scale<3)
    if (params(i,2)>0 && params(i,4)>0 && params(i,5)>0 && scale>2.5)
        params_valid(t,:) = params(i, :);
        t = t + 1;
    end
end
%params_valid
%remove all-zero column
params_valid(all(params_valid == 0,2), :)=[];
s = size(params_valid);
size_valid = s(1);