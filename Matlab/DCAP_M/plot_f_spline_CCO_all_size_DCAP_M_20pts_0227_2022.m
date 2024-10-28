%01/12/2022 plot f_spline of DCAP_M

% plot f_spline for different size and load of CCO
%12/8/2021

%figure step, when step =6, only plot DCAP0 and DCAP64
step = 7;

x = 10:5:200;
size_x = size(x);
N = 15;
CCO_size_lib = ["CCO82", "CCO124", "CCO164", "CCO206", "CCO248"];

CCO_load_lib = ["DCAP0", "DCAP1", "DCAP4", "DCAP8", "DCAP16", "DCAP32", "DCAP64"];

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

figure(1);
for i=1:size_CCO_size(2)
    for j = 1:step:size_CCO_load(2)
        %plot(x, freq(:,i)/1e6,'g-','LineWidth',2);
        p(i,j) = plot(x, freq(:,i,j)/1e6,'color',c(i,:),'LineWidth',2);
        hold on;
    end
end
set(gca,'Fontname', 'Arial Narrow','FontSize',14);
title('fc vs. Ictrl')
xlabel({'Ictrl/uA'},'Fontname', 'Arial Narrow','FontSize',16)
ylabel({'MHz'},'Fontname', 'Arial Narrow','FontSize',16)
legend([p(1,1),p(2,1),p(3,1),p(4,1),p(5,1)],CCO_size_lib);


figure(2);
for i=1:size_CCO_size(2)
    for j = 1:step:size_CCO_load(2)
        p(i,j) =plot(x, kcco(:,i,j)/1e6,'color',c(i,:),'LineWidth',2);
        hold on;
    end
end
set(gca,'Fontname', 'Arial Narrow','FontSize',14);
title('kcco vs. Ictrl ')
xlabel({'Ictrl/uA'},'Fontname', 'Arial Narrow','FontSize',16)
ylabel({'MHz/uA'},'Fontname', 'Arial Narrow','FontSize',16)
legend([p(1,1),p(2,1),p(3,1),p(4,1),p(5,1)],CCO_size_lib);


figure(3)
for i=1:size_CCO_size(2)
    for j = 1:step:size_CCO_load(2)
        p(i,j) =plot(x, diff_kcco(:,i,j)/1e6,'color',c(i,:),'LineWidth',2);
        hold on;
    end
end
set(gca,'Fontname', 'Arial Narrow','FontSize',14);
title('Defivative of kcco vs. Ictrl')
xlabel({'Ictrl/uA'},'Fontname', 'Arial Narrow','FontSize',16)
ylabel({'MHz/uA^2'},'Fontname', 'Arial Narrow','FontSize',16)
legend([p(1,1),p(2,1),p(3,1),p(4,1),p(5,1)],CCO_size_lib);


figure(4)
for i=1:size_CCO_size(2)
    for j = 1:step:size_CCO_load(2)
        p(i,j) =plot(x, Res(:,i,j)/1e3,'color',c(i,:),'LineWidth',2);
        hold on;
    end
end
set(gca,'Fontname', 'Arial Narrow','FontSize',14);
title('Res vs. Ictrl')
xlabel({'Ictrl/uA'},'Fontname', 'Arial Narrow','FontSize',16)
ylabel({'kOhm'},'Fontname', 'Arial Narrow','FontSize',16)
legend([p(1,1),p(2,1),p(3,1),p(4,1),p(5,1)],CCO_size_lib);


figure(5)
for i=1:size_CCO_size(2)
    for j = 1:step:size_CCO_load(2)
        p(i,j) =plot(x, Rcco(:,i,j)/1e3,'color',c(i,:),'LineWidth',2);
        hold on;
    end
end
set(gca,'Fontname', 'Arial Narrow','FontSize',14);
title('Rcco vs. Ictrl')
xlabel({'Ictrl/uA'},'Fontname', 'Arial Narrow','FontSize',16)
ylabel({'kOhm'},'Fontname', 'Arial Narrow','FontSize',16)
legend([p(1,1),p(2,1),p(3,1),p(4,1),p(5,1)],CCO_size_lib);

figure(6)
for i=1:size_CCO_size(2)
    for j = 1:step:size_CCO_load(2)
        p(i,j) = plot(x, Vctrl(:,i,j)*1e3,'color',c(i,:),'LineWidth',2);
        hold on;
    end
end
set(gca,'Fontname', 'Arial Narrow','FontSize',14);
title('Vctrl vs. Ictrl')
xlabel({'Ictrl/uA'},'Fontname', 'Arial Narrow','FontSize',14, 'fontweight', 'bold')
ylabel({'Vctrl/mV'},'Fontname', 'Arial Narrow','FontSize',14, 'fontweight', 'bold')
legend([p(1,1),p(2,1),p(3,1),p(4,1),p(5,1)],CCO_size_lib);
grid on;




