%01/21/2021
%Pre vs PS

Delay_CCO_63N_Pre = load('/nethome/kli416/work/TSMC65/ocean/PS/CCO_63N/results_locked/Delay_CCO_63N_Pre.txt');
Delay_CCO_63N_PS = load('/nethome/kli416/work/TSMC65/ocean/PS/CCO_63N/results_locked/Delay_CCO_63N_PS.txt');
Delay_CCO_BUF_63N_Pre = load('/nethome/kli416/work/TSMC65/ocean/PS/CCO_63N/results_locked/Delay_CCO_BUF_63N_Pre.txt');
Delay_CCO_BUF_63N_PS = load('/nethome/kli416/work/TSMC65/ocean/PS/CCO_63N/results_locked/Delay_CCO_BUF_63N_PS.txt');

x1 = [1 2 3 4 5 6 7 8 9 10 30 50 70 90 110 130 150 170 190 210];
x2 = [1 3 5 7 9 10 30 50 70 90 110 130 150 170 190 210];


size_x_1 = size(x1);
freq_sel = zeros(size_x_1(2),1);

freq_CCO_63N_Pre = 1./Delay_CCO_63N_Pre(:,1);
freq_CCO_63N_PS = 1./Delay_CCO_63N_PS(:,1);
freq_CCO_BUF_63N_Pre = 1./Delay_CCO_BUF_63N_Pre(:,1);
freq_CCO_BUF_63N_PS = 1./Delay_CCO_BUF_63N_PS(:,1);

%%%%%%%%%

%%%%%%%%%
c = colormap(lines(4));
figure(1);

plot(x1, freq_CCO_63N_Pre/1e6, 'color',c(1,:),'LineWidth',2);
hold on;
plot(x1, freq_CCO_63N_PS/1e6, 'color',c(2,:),'LineWidth',2);
plot(x2, freq_CCO_BUF_63N_Pre/1e6, 'color',c(3,:),'LineWidth',2);
plot(x2, freq_CCO_BUF_63N_PS/1e6, 'color',c(4,:),'LineWidth',2);


%legend_name = ["0f","DCAP","DCAP4", "DCAP8", "DCAP16", "DCAP32", "DCAP64"];
legend_name = ["CCO 63N Pre","CCO 63N PS","CCO BUF 63N Pre", "CCO BUF 63N PS"];
title('Freq vs. Ictrl of CCO (original data)')
xlabel({'Ictrl/uA'},'Fontname', 'Times New Roman','FontSize',16)
ylabel({'Freq/MHz'},'Fontname', 'Times New Roman','FontSize',16)
set(gca,'Fontname', 'Times New Roman','FontSize',10);
legend(legend_name);
