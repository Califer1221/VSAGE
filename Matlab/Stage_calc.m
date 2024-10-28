
fs = 200e6;
BW = 1.5e6;
SNDR = 65;%70;;
Delta1 = 10;
Delta2 = 20;
SQNR_1st = SNDR + Delta1;
SQNR_2nd = SNDR + Delta2;

OSR = fs/2/BW;

%1st order
N_1st = 2^((SQNR_1st - 30*log10(OSR) + 5.2 - 1.76)/6.02)


OSR2 = 40;
%2nd order
N_2nd = 2^((SQNR_2nd - 50*log10(OSR2) + 10*log10(pi^4/5) - 1.76)/6.02)


