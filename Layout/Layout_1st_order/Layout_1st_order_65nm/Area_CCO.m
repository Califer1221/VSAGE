%%% Area consideration of CCO
%12/23/2021

% input
%CCO_size = 1;
%CCO_load = 6;
N = 1;%15;%63;
S = 1;%2;%4;

%height of standard cell
H = 1;%1.8;

%scale factor
factor = 0.7;

%%%%%%%%%%%%%%%%%%%%%%%%
CCO_size_lib = ["CCO82", "CCO124", "CCO164", "CCO206", "CCO248"];
%sum of 2 inv
CCO_size_lib_size = [3.2, 4.8, 5.8, 7.2, 8.8];

CCO_load_lib = ["DCAP0", "DCAP1", "DCAP4", "DCAP8", "DCAP16", "DCAP32", "DCAP64"];
%size of 1 DCAP
CCO_load_lib_size = [0, 0.6, 0.8, 1.6, 3.2, 6.4, 12.8];
%%%%%%%%%%%%%%%%%%%%%%%%

size_CCO_size_lib_size = size(CCO_size_lib_size);
size_CCO_load_lib_size = size(CCO_load_lib_size);

area_CCO = zeros(size_CCO_size_lib_size(2), size_CCO_load_lib_size(2));
%CCO
for CCO_size = 1:size_CCO_size_lib_size(2)
    for CCO_load = 1:size_CCO_load_lib_size(2)
        area_CCO(CCO_size, CCO_load) = (CCO_size_lib_size(CCO_size) + CCO_load_lib_size(CCO_load))*2 * N * S * H;
        area_CCO_act(CCO_size, CCO_load) = area_CCO(CCO_size, CCO_load)/factor;
    end
end

bar(area_CCO);
title('Area estimation of CCO unit for different size and load')
set(gca,'xticklabel',CCO_size_lib,'Fontname', 'Times New Roman','FontWeight','bold','FontSize',11);
xlabel({'Sizes of CCO'},'Fontname', 'Times New Roman','FontWeight','bold','FontSize',11)
ylabel({'Area estimation for CCO unit / um^2'},'Fontname', 'Times New Roman','FontWeight','bold','FontSize',11)
legend(CCO_load_lib);
set(legend,'Fontname', 'Times New Roman','FontWeight','bold','FontSize',8)
