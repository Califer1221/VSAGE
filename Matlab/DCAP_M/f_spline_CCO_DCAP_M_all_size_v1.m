%01/12/2022
%1uA to 210uA, 20pts, 15 stages
%DCAP_M

function [freq, kcco,diff_kcco, Res, Rcco, Vctrl]=f_spline_CCO_DCAP_M_all_size_v1(ictrl,N,CCO_size_num, CCO_load_num)
% %%%test func
% ictrl = 50;
% N = 31;
% CCO_size_num = 1;
% CCO_load_num = 1;
%%%%%

delta = 0.0001; % use to calc kvco
gamma = 0.1;

CCO_size_lib = ["CCO82", "CCO124", "CCO164", "CCO206", "CCO248"];

CCO_load_lib = ["DCAP0", "DCAP1", "DCAP4", "DCAP8", "DCAP16", "DCAP32", "DCAP64"];

%CCO_load_lib = ["noDCAP", "DCAP", "DCAP4", "DCAP8", "DCAP16", "DCAP32", "DCAP64"];

size_CCO_size_lib = size(CCO_size_lib);
size_load_lib = size(CCO_load_lib);
D = zeros(size_CCO_size_lib(2), size_load_lib(2), 20, 3);

%%%
D(1,1,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO82_20pts/Delay_CCO_ring82_15N_noDCAP_20pts.txt');
D(1,2,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO82_20pts/Delay_CCO_ring82_15N_DCAP_20pts.txt');
D(1,3,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO82_20pts/Delay_CCO_ring82_15N_DCAP4_20pts.txt');
D(1,4,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO82_20pts/Delay_CCO_ring82_15N_DCAP8_20pts.txt');
D(1,5,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO82_20pts/Delay_CCO_ring82_15N_DCAP16_20pts.txt');
D(1,6,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO82_20pts/Delay_CCO_ring82_15N_DCAP32_20pts.txt');
D(1,7,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO82_20pts/Delay_CCO_ring82_15N_DCAP64_20pts.txt');
%%%
D(2,1,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO124_20pts/Delay_CCO_ring124_15N_noDCAP_20pts.txt');
D(2,2,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO124_20pts/Delay_CCO_ring124_15N_DCAP_20pts.txt');
D(2,3,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO124_20pts/Delay_CCO_ring124_15N_DCAP4_20pts.txt');
D(2,4,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO124_20pts/Delay_CCO_ring124_15N_DCAP8_20pts.txt');
D(2,5,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO124_20pts/Delay_CCO_ring124_15N_DCAP16_20pts.txt');
D(2,6,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO124_20pts/Delay_CCO_ring124_15N_DCAP32_20pts.txt');
D(2,7,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO124_20pts/Delay_CCO_ring124_15N_DCAP64_20pts.txt');
%%%
D(3,1,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO164_20pts/Delay_CCO_ring164_15N_noDCAP_20pts.txt');
D(3,2,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO164_20pts/Delay_CCO_ring164_15N_DCAP_20pts.txt');
D(3,3,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO164_20pts/Delay_CCO_ring164_15N_DCAP4_20pts.txt');
D(3,4,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO164_20pts/Delay_CCO_ring164_15N_DCAP8_20pts.txt');
D(3,5,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO164_20pts/Delay_CCO_ring164_15N_DCAP16_20pts.txt');
D(3,6,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO164_20pts/Delay_CCO_ring164_15N_DCAP32_20pts.txt');
D(3,7,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO164_20pts/Delay_CCO_ring164_15N_DCAP64_20pts.txt');
%%%
D(4,1,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO206_20pts/Delay_CCO_ring206_15N_noDCAP_20pts.txt');
D(4,2,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO206_20pts/Delay_CCO_ring206_15N_DCAP_20pts.txt');
D(4,3,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO206_20pts/Delay_CCO_ring206_15N_DCAP4_20pts.txt');
D(4,4,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO206_20pts/Delay_CCO_ring206_15N_DCAP8_20pts.txt');
D(4,5,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO206_20pts/Delay_CCO_ring206_15N_DCAP16_20pts.txt');
D(4,6,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO206_20pts/Delay_CCO_ring206_15N_DCAP32_20pts.txt');
D(4,7,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO206_20pts/Delay_CCO_ring206_15N_DCAP64_20pts.txt');
%%%
D(5,1,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO248_20pts/Delay_CCO_ring248_15N_noDCAP_20pts.txt');
D(5,2,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO248_20pts/Delay_CCO_ring248_15N_DCAP_20pts.txt');
D(5,3,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO248_20pts/Delay_CCO_ring248_15N_DCAP4_20pts.txt');
D(5,4,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO248_20pts/Delay_CCO_ring248_15N_DCAP8_20pts.txt');
D(5,5,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO248_20pts/Delay_CCO_ring248_15N_DCAP16_20pts.txt');
D(5,6,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO248_20pts/Delay_CCO_ring248_15N_DCAP32_20pts.txt');
D(5,7,:, :) = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts_DCAP_M/result_DCAP_M_locked/CCO248_20pts/Delay_CCO_ring248_15N_DCAP64_20pts.txt');
%%%
x = [1 2 3 4 5 6 7 8 9 10 30 50 70 90 110 130 150 170 190 210];
size_x = size(x);
%freq_sel = zeros(size_x(2),1);

freq_sel = squeeze(1./D(CCO_size_num, CCO_load_num, :, 1))*15/N;
Res_sel = squeeze(D(CCO_size_num, CCO_load_num, :, 3));
Vol_sel = squeeze(D(CCO_size_num, CCO_load_num, :, 2));

freq_sel_N = freq_sel;
freq = spline(x,freq_sel_N,ictrl);
kcco = (spline(x,freq_sel_N,ictrl+delta/2)-spline(x,freq_sel_N,ictrl-delta/2))/delta;
diff_kcco = ((spline(x,freq_sel_N,ictrl+delta/2+gamma/2)-spline(x,freq_sel_N,ictrl-delta/2+gamma/2))/delta-(spline(x,freq_sel_N,ictrl+delta/2-gamma/2)-spline(x,freq_sel_N,ictrl-delta/2-gamma/2))/delta)/gamma;

Res = spline(x,Res_sel,ictrl);
delta = 1;%0.000001;

Vctrl = spline(x, Vol_sel, ictrl);
Rcco = (spline(x, Vol_sel, ictrl+delta/2)-spline(x, Vol_sel, ictrl-delta/2))/delta*1e6;

end

