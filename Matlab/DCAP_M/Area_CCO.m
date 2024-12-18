%01/12/2021
%plot area*kcco

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

figure(1);
bar(area_CCO);
title('Area estimation of CCO unit for different size and load')
set(gca,'xticklabel',CCO_size_lib,'Fontname', 'Times New Roman','FontWeight','bold','FontSize',11);
xlabel({'Sizes of CCO'},'Fontname', 'Times New Roman','FontWeight','bold','FontSize',11)
ylabel({'Area estimation for CCO unit / um^2'},'Fontname', 'Times New Roman','FontWeight','bold','FontSize',11)
legend(CCO_load_lib);
set(legend,'Fontname', 'Times New Roman','FontWeight','bold','FontSize',8)

%%%% plot kcco with different Ictrl
step = 1;

x = 10:5:200;
size_x = size(x);
N = 15;
%CCO_size_lib = ["CCO82", "CCO124", "CCO164", "CCO206", "CCO248"];

%CCO_load_lib = ["DCAP0", "DCAP1", "DCAP4", "DCAP8", "DCAP16", "DCAP32", "DCAP64"];

size_CCO_size = size(CCO_size_lib);
size_CCO_load = size(CCO_load_lib);
freq = zeros(size_x(2), size_CCO_size(2), size_CCO_load(2));

for j = 1:size_x(2)
    for i=1:size_CCO_size(2)
        for k = 1:step:size_CCO_load(2)
        %disp(CCO_size(i));
        [freq(j, i, k), kcco(j, i, k),diff_kcco(j, i, k), Res(j,i, k), Rcco(j,i, k), Vctrl(j,i, k)]=f_spline_CCO_DCAP_M_all_size_v1(x(j),N,i,k);
        end
    end
end

%c = colormap(jet(size_CCO_size(2)));
%c = colormap(hsv(size_CCO_size(2)));
c = colormap(lines(size_CCO_size(2)));
%linestyle = ['--o', '--+', '--*', '--d', '--h', '--s', '--p'];
%linestyle = ['--o', '--+', '*', 'd', 'h', 's', 'p'];
linestyle = {'--o', '--+', '--*', '--d', '--h', '--s', '--p'};

figure(2);
for i=1:size_CCO_size(2)
    for j = 1:step:size_CCO_load(2)
        %plot(x, freq(:,i)/1e6,'g-','LineWidth',2);
        p(i,j) = plot(x, freq(:,i,j)/1e6 * area_CCO_act(i,j),char(linestyle(j)),'MarkerSize',10, 'color',c(i,:),'LineWidth',2);
        hold on;
    end
end
title('fc*area vs. Ictrl')
xlabel({'Ictrl/uA'},'Fontname', 'Times New Roman','FontSize',16)
ylabel({'um^2*MHz'},'Fontname', 'Times New Roman','FontSize',16)
set(gca,'Fontname', 'Times New Roman','FontSize',10);
legend([p(1,1),p(2,1),p(3,1),p(4,1),p(5,1)],CCO_size_lib);


figure(3);
for i=1:size_CCO_size(2)
    for j = 1:step:size_CCO_load(2)
        p(i,j) =plot(x, kcco(:,i,j)/1e6 * area_CCO_act(i,j),char(linestyle(j)), 'MarkerSize',10, 'color',c(i,:),'LineWidth',2);
        hold on;
    end
end
title('kcco*area vs. Ictrl ')
xlabel({'Ictrl/uA'},'Fontname', 'Times New Roman','FontSize',16)
ylabel({'um^2*MHz/uA'},'Fontname', 'Times New Roman','FontSize',16)
set(gca,'Fontname', 'Times New Roman','FontSize',10);
legend([p(1,1),p(2,1),p(3,1),p(4,1),p(5,1)],CCO_size_lib);
