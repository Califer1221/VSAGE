%10/04/2022
%calculate N
function [N, archi] = N_selection(SNDR_aim, OSR)

if (OSR>45)
    delta = 10;
    archi = 1;
else
    delta = 20;
    archi = 2;
end

SQNR = SNDR_aim + delta;

if archi==1
    N =2^((SQNR - 1.76 + 5.2 - 30*log10(OSR))/6.02);
else
    N =2^((SQNR - 1.76 + 10*log(pi^4/5) - 50*log10(OSR))/6.02);
end
N = ceil(N);

