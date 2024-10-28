Rin = [27, 9];
CCO = [29, 72];
BUF = [15, 30];
DIG = [116, 13];
DAC_BUF = [34, 3.6];
DAC = [43, 110];

figure(2)
axis([0 200 0 200])
rectangle('Position',[32 163 Rin]);
rectangle('Position',[155 163 Rin]);
rectangle('Position',[32 90 CCO]);
rectangle('Position',[155 90 CCO]);
rectangle('Position',[32 55 BUF]);
rectangle('Position',[155 55 BUF]);
rectangle('Position',[50 33 DIG]);
rectangle('Position',[86 55 DAC_BUF]);
rectangle('Position',[62 64 DAC]);
rectangle('Position',[109 64 DAC]);