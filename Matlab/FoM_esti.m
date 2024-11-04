%FoM estimation
function [FoMs, FoMw] = FoM_esti(SNDR, power, BW)

FoMs = SNDR + 10*log10(BW/power);
ENOB = (SNDR - 1.76)/6.02;
FoMw = power/(2^ENOB*2*BW);

end