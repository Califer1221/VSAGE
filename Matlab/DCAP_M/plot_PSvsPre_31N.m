%01/21/2021
%Pre vs PS

Delay_CCO_31N_Pre = load('/nethome/kli416/work/TSMC65/ocean/PS/CCO_31N_3S/results_locked/Delay_CCO_ring_31N_Pre.txt');
Delay_CCO_31N_PS = load('/nethome/kli416/work/TSMC65/ocean/PS/CCO_31N_3S/results_locked/Delay_CCO_ring_31N_PS.txt');
Delay_CCO_BUF_31N_Pre = load('/nethome/kli416/work/TSMC65/ocean/PS/CCO_31N_3S/results_locked/Delay_CCO_BUF_31N_Pre.txt');
Delay_CCO_BUF_31N_PS = load('/nethome/kli416/work/TSMC65/ocean/PS/CCO_31N_3S/results_locked/Delay_CCO_BUF_31N_PS.txt');


x = [1 5 10 50 90 130 170  190 210];


size_x_1 = size(x1);
freq_sel = zeros(size_x_1(2),1);

freq_CCO_31N_Pre = 1./Delay_CCO_31N_Pre(:,1);
freq_CCO_31N_PS = 1./Delay_CCO_31N_PS(:,1);
freq_CCO_BUF_31N_Pre = 1./Delay_CCO_BUF_31N_Pre(:,1);
freq_CCO_BUF_31N_PS = 1./Delay_CCO_BUF_31N_PS(:,1);

%%%%%%%%%

%%%%%%%%%
c = colormap(lines(4));
figure(1);

plot(x, freq_CCO_31N_Pre/1e6, 'color',c(1,:),'LineWidth',2);
hold on;
plot(x, freq_CCO_31N_PS/1e6, 'color',c(2,:),'LineWidth',2);
plot(x, freq_CCO_BUF_31N_Pre/1e6, 'color',c(3,:),'LineWidth',2);
plot(x, freq_CCO_BUF_31N_PS/1e6, 'color',c(4,:),'LineWidth',2);


%legend_name = ["0f","DCAP","DCAP4", "DCAP8", "DCAP16", "DCAP32", "DCAP64"];
legend_name = ["CCO 31N Pre","CCO 31N PS","CCO BUF 31N Pre", "CCO BUF 31N PS"];
title('Freq vs. Ictrl of CCO (original data)')
xlabel({'Ictrl/uA'},'Fontname', 'Times New Roman','FontSize',16)
ylabel({'Freq/MHz'},'Fontname', 'Times New Roman','FontSize',16)
set(gca,'Fontname', 'Times New Roman','FontSize',10);
legend(legend_name);
