%estimate the areas
%12/19/2021

% input
CCO_size = 4;
CCO_load = 4;
N = 31;
S = 3;
Rin_value = 4;
RDAC_u = 4*31;%6*63;

%height of standard cell
H = 1.8;

%scale factor
factor = 0.8;

%%%%%%%%%%%%%%%%%%%%%%%%
CCO_size_lib = ["CCO82", "CCO124", "CCO164", "CCO206", "CCO248"];
%sum of 2 inv
CCO_size_lib_size = [3.2, 4.8, 5.8, 7.2, 8.8];

CCO_load_lib = ["DCAP0", "DCAP1", "DCAP4", "DCAP8", "DCAP16", "DCAP32", "DCAP64"];
%size of 1 DCAP
CCO_load_lib_size = [0, 0.6, 0.8, 1.6, 3.2, 6.4, 12.8];

RES_lib = ["RES25", "RES10", "RES5", "RES1"];
RES_lib_size = [28.8, 12.2, 6.7, 2.2];
%%%%%%%%%%%%%%%%%%%%%%%%


%CCO
area_CCO = (CCO_size_lib_size(CCO_size) + CCO_load_lib_size(CCO_load))*2 * N * S * H;
area_CCO_act = area_CCO/factor;

%BUF
area_BUF = 1.8*2*N*H;
area_BUF_act = area_BUF/factor;

%DAC_BUF
area_DAC_BUF = 0.8*N*2*H;
are_DAC_BUF_act = area_DAC_BUF/factor;

%digital
area_DIG = 15.8*N*H;
area_DIG_act = area_DIG/factor;

%DAC
s_dac = res_gen(RDAC_u);
area_DAC = dot(RES_lib_size, s_dac)* N * H;
area_DAC_act = area_DAC/factor;

%Rin
s_Rin = res_gen(Rin_value);
area_Rin = dot(RES_lib_size, s_Rin) * H;
area_Rin_act = area_Rin/factor;

%%%calculate width and length of each block

%Rin
W_Rin = round(area_Rin_act/H);
L_Rin = 4;
Rin = [W_Rin, L_Rin];

%DAC W/L = 1/2
W_DAC = round((area_DAC_act/2)^0.5);
L_DAC = round(area_DAC_act/W_DAC);
DAC = [W_DAC, L_DAC];

%CCO W/L = 2/3
W_CCO = round((area_CCO_act/6)^0.5 * 2);
L_CCO = round(area_CCO_act/W_CCO/1.8)*1.8;
CCO = [W_CCO, L_CCO];

%BUF same width as CCO
W_BUF = W_CCO;
L_BUF = round(area_BUF_act/W_BUF/1.8)*1.8;
BUF = [W_BUF, L_BUF];

%DAC_BUF assume L=6um (3 row), when cal W assume L = 4um
L_DAC_BUF = 5.4;
W_DAC_BUF = round(area_DAC_BUF/4/1.8)*1.8;
DAC_BUF = [W_DAC_BUF, L_DAC_BUF];


%digital W/L = 8
L_DIG = round((area_DIG_act/8)^0.5/1.8)*1.8;
W_DIG = round(area_DIG_act/L_DIG);
L_DIG = L_DIG + 3.6; %Add extra 2 rows
DIG = [W_DIG, L_DIG];



%%%%%
function s = res_gen(z)
res_units = [25, 10, 5, 1];
size_res = size(res_units);
s = zeros(1, size_res(2));
for i=1:size_res(2)
    a = fix(z/res_units(i));
    s(i) = a;
    z = z - a * res_units(i);
end
end
%%%%%

