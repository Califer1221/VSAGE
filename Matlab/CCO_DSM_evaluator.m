function [FoMs, FoMw, SNDR, Power, P_analog, P_digital] = CCO_DSM_evaluator(N, S, Rin, Rdac, Bias, BW)
[SNDR,~,~] = CCO_DSM_ANN_v11_v2([Rdac, Bias]);
[Power, P_analog, P_digital, P_CCO] = power_esti_v1(N, S, Rin, Rdac, Bias);
[FoMs, FoMw] = FoM_esti(SNDR, Power, BW);
end