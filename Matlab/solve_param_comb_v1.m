

Amp = 0.6;%1.2;%1.2;%0.6;%0.07;
LG = 1;%1;%0.25;%0.25;%1;%0.24;
fs = 1e6;%200e6;%1e6;%0.5e6;%250e6;
N = 15;%127;%15;%31;
VDD = 1.2; % VDD of RDAC
%S = 5; %S should be odd number
ratio = 0.7;%0.7; %degradation ratio of kcco in layout
%CCO_size_num = 3;
%CCO_load_num = 4;

%%%%%%%%%%%%%%%%%%%%%%%%
CCO_size_lib = ["CCO82", "CCO124", "CCO164", "CCO206", "CCO248"];
%sum of 2 inv
CCO_size_lib_size = [3.2, 4.8, 5.8, 7.2, 8.8];

CCO_load_lib = ["DCAP0", "DCAP1", "DCAP4", "DCAP8", "DCAP16", "DCAP32", "DCAP64"];
%size of 1 DCAP
CCO_load_lib_size = [0, 0.6, 0.8, 1.6, 3.2, 6.4, 12.8];
H = 1; %normalized height of std cell 
%%%%%%%%%%%%%%%%%%%%%%%%


N_half = (N-1)/2;%round(N/2);


ictrl = 100;
S  = 1;
range = zeros(1,8);
range_valid = zeros(1,8);
count = 1;
count_valid = 1;
for CCO_size_num = 1:5
    for CCO_load_num = 1:7
        for S = 1:4:17
            [freq, kcco,diff_kcco, R2, Rcco, Vctrl] = f_spline_CCO_DCAP_M_all_size_v1(ictrl,N*S,CCO_size_num,CCO_load_num);
            area_CCO = (CCO_size_lib_size(CCO_size_num) + CCO_load_lib_size(CCO_load_num))*2 * N * S * H;
            kdac = fs*LG/(4*N*kcco*ratio);
            Ru = VDD/(kdac*1e-6) - (Rcco*VDD*N)/(2*Amp) - N*Rcco;
            Rdac = Ru/N;
            R1 = (2*Amp*Ru)/(VDD*N);
            %Icomp = ictrl*(1+R2/R1+N*R2/Ru) - V/R1*1e6 - N_half*VDD/Ru*1e6;
            V = R1*(ictrl*(1+R2/R1+N*R2/Ru)-N_half*VDD/Ru*1e6)/1e6;
    
            range(count, :) = [CCO_size_num, CCO_load_num, S, Ru, Rdac, R1, V, area_CCO];
            count = count + 1;
            %if (R1 >900 && R1 < 10e3 && V < 2)
            %if (R1 >900 && R1 < 10e3)
                range_valid(count_valid, :) = [CCO_size_num, CCO_load_num, S, Ru, Rdac, R1, V, area_CCO];
                count_valid = count_valid + 1;
            %end
        end
    end
end

range_valid_area = sortrows(range_valid,8, "ascend");
%A = range_valid_area();
range_valid_area_2 = range_valid_area(range_valid_area(:,1) >2 & range_valid_area(:,2) <6 & range_valid_area(:,2) >1, :);

%sort based on Rdac
range_valid_area_3 = sortrows(range_valid_area_2,5, "ascend");
disp("Based on range_valid_area_3, select the CCO type");

