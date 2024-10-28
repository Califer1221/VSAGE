%%%%%%%%
Delay_CCO164_noDCAP = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts/result/CCO164_20pts/Delay_CCO_ring164_15N_noDCAP_20pts.txt');
Delay_CCO164_DCAP = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts/result/CCO164_20pts/Delay_CCO_ring164_15N_DCAP_20pts.txt');
Delay_CCO164_DCAP4 = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts/result/CCO164_20pts/Delay_CCO_ring164_15N_DCAP4_20pts.txt');
Delay_CCO164_DCAP8 = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts/result/CCO164_20pts/Delay_CCO_ring164_15N_DCAP8_20pts.txt');
Delay_CCO164_DCAP16 = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts/result/CCO164_20pts/Delay_CCO_ring164_15N_DCAP16_20pts.txt');
Delay_CCO164_DCAP32 = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts/result/CCO164_20pts/Delay_CCO_ring164_15N_DCAP32_20pts.txt');
Delay_CCO164_DCAP64 = load('/nethome/kli416/work/TSMC65/ocean/DCAP/20pts/result/CCO164_20pts/Delay_CCO_ring164_15N_DCAP64_20pts.txt');
x = [1 2 3 4 5 6 7 8 9 10 30 50 70 90 110 130 150 170 190 210];
size_x = size(x);
freq_sel = zeros(size_x(2),1);

freq_CCO164_noDCAP = 1./Delay_CCO164_noDCAP(:,1);
freq_CCO164_DCAP = 1./Delay_CCO164_DCAP(:,1);
freq_CCO164_DCAP4 = 1./Delay_CCO164_DCAP4(:,1);
freq_CCO164_DCAP8 = 1./Delay_CCO164_DCAP8(:,1);
freq_CCO164_DCAP16 = 1./Delay_CCO164_DCAP16(:,1);
freq_CCO164_DCAP32 = 1./Delay_CCO164_DCAP32(:,1);
freq_CCO164_DCAP64 = 1./Delay_CCO164_DCAP64(:,1);
%%%%%%%%%

%%%%%%%%%
c = colormap(lines(12));
figure(1);

plot(x, freq_CCO164_noDCAP/1e6, 'color',c(1,:),'LineWidth',2);
hold on;
plot(x, freq_CCO164_DCAP/1e6, 'color',c(2,:),'LineWidth',2);
plot(x, freq_CCO164_DCAP4/1e6, 'color',c(3,:),'LineWidth',2);
plot(x, freq_CCO164_DCAP8/1e6, 'color',c(4,:),'LineWidth',2);
plot(x, freq_CCO164_DCAP16/1e6, 'color',c(5,:),'LineWidth',2);
plot(x, freq_CCO164_DCAP32/1e6, 'color',c(6,:),'LineWidth',2);
plot(x, freq_CCO164_DCAP64/1e6, 'color',c(7,:),'LineWidth',2);

legend_name = ["0f","DCAP","DCAP4", "DCAP8", "DCAP16", "DCAP32", "DCAP64"];
%, "MOMmin=2.6f"...
%    ,"DCAP initialCond","DCAP4 initialCond","DCAP8 initialCond","DCAP16 initialCond","DCAP32 initialCond","DCAP64 initialCond",];
title('Freq vs. Ictrl of CCO164 (original data)')
xlabel({'Ictrl/uA'},'Fontname', 'Times New Roman','FontSize',16)
ylabel({'Freq/MHz'},'Fontname', 'Times New Roman','FontSize',16)
set(gca,'Fontname', 'Times New Roman','FontSize',10);
legend(legend_name);