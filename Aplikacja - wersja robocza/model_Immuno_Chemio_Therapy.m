function rownania = model_Immuno_Chemio_Therapy(t, x)

K_T = 0;
K_N = 0;
K_L = 0;
K_C = 0;
v_alfa = 0;

T = x(1);
N = x(2);
L = x(3);
C = x(4);
M = x(5);
I = x(6);
I_alfa = x(7);
% I_alfa0 = x(8);

% ustawienie parametrów
a = 4.31e-1;
b = 1.02e-9;
c = 6.41e-11;
d = 2.34;
e = 2.08e-7;
l = 2.09;
f = 4.12e-2;
g = 1.25e-2;
h = 2.02e7;
jj = 2.49e-2;
k = 3.66e7;
m = 2.04e-1;
q = 1.42e-6;
p = 3.42e-6;
s = 8.39e-2;
r1 = 1.1e-7;
r2 = 6.5e-11;
u = 3e-10;
alfa = 7.5e8;
beta = 1.2e-2;
gamma = 9e-1;
p_i = 1.25e-1;
g_i = 2e2;
mi_i = 1e1;
c_CTL = 4.4e-9;
g_prim = 1.7;
j_prim = 3.3e-9;
k_prim = 1.8e-8;
mi_I = 1e1;

V_M = 0;
V_I = 0;
V_L = 0;

D = licz_D(d, L, T, s, l);
% c_prim = c_CTL * (2 - (exp((-I_alfa) / I_alfa0))); % I_alfa, CD8T, tumor interact - inactivation
c_prim = c_CTL;

% równania modelu
dTdt = (a * T *(1 - (b * T))) - (c * N * T) - (D * T) - (K_T * (1 - (exp(-M))) * T) - (c_prim * T * L);
dNdt = (e * C) - (f * N) + (g * ((T^2) / (h + (T^2))) * N) - (p * N * T) - (K_N * (1 - exp(-M)) * N);
dLdt = ((-m) * L) + (jj * ((D^2 * T^2) / (k + (D^2 * T^2))) * L) - (q * L * T) + (((r1 * N) + (r2 * C)) * T) - (u * N * (L^2)) - (K_L * (1 - exp(-M)) * L) + ((p_i * L * I) / (g_i)) + V_L;
dCdt = alfa - (beta * C) - (K_C * (1 - exp(-M)) * C);
dMdt = ((-gamma) * M) + V_M;
dIdt = ((-mi_I) * L) - (j_prim * L * I) - (k_prim * T * I) + V_I;
dI_alfadt = v_alfa - (g * I_alfa);

rownania = [dTdt; dNdt; dLdt; dCdt; dMdt; 0; 0]; 
% rownania = [dTdt; dNdt; dLdt; dCdt; dMdt; dIdt; dI_alfadt]; % wektor równañ

end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % growth and death terms
% tumor_growth = a * T *(1 - (b * T));
% NK_growth = e * C - f * N;
% CD8T_decrease = (-m) * L;
% lymphocytes_generated = alfa - (beta * C);
% decay_of_chemioth_drug = (-gamma) * M;
% exp_decay_of_IL2 = (-mi_i) * L - (j_prim * L * I) - (k_prim * T * I);
% exp_decay_of_INF_alfa = (-g) * I_alfa;
% 
% % fractional cell kill terms
% tumor_NK_interact = (- c) * N * T;
% tumor_inactivation_by_CD8T = (-D) * T;
% chemio_on_tumor = K_T * (1 - (exp(-M))) * T;
% chemio_on_NK = K_N * (1 - exp(-M)) * N;
% chemio_on_CD8T = K_L * (1 - exp(-M)) * L;
% chemio_on_lymphocytes = K_C * (1 - exp(-M)) * C;
% IL2_stimmulates_CD8T = ((p_i * L * I) / g_i);
% 
% % recruitment terms
% recr_NK = g * ((T^2) / (h + (T^2))) * N;
% tumor_CD8T_interact = jj * ((D^2 * T^2) / k + (D^2 + T^2)) * L;
% tumor_NK_CD8T_impact = ((r1 * N) + (r2 * C)) * T;
% 
% % inactivation terms
% I_alfa_CD8T_tumor_inactiv = c_prim * T * L;
% NK_inactiv_after_interact_with_tumor = (-p) * N * T;
% CD8T_inactiv_after_interact_with_tumor = (-q) * L * T;
% NK_regulation_of_CD8T = - u * N * (L^2);

% % model
% dTdt = tumor_growth + tumor_NK_interact + tumor_inactivation_by_CD8T - chemio_on_tumor - I_alfa_CD8T_tumor_inactiv;
% dNdt = NK_growth + recr_NK + NK_inactiv_after_interact_with_tumor - chemio_on_NK;
% dLdt = CD8T_decrease + tumor_CD8T_interact + CD8T_inactiv_after_interact_with_tumor ...
%     + tumor_NK_CD8T_impact + NK_regulation_of_CD8T - chemio_on_CD8T + IL2_stimmulates_CD8T + v_L;
% dCdt = lymphocytes_generated - chemio_on_lymphocytes;
% dMdt = decay_of_chemioth_drug + v_M;
% dIdt = exp_decay_of_IL2 + v_I;
% dI_alfadt = v_alfa + exp_decay_of_INF_alfa;

% rownania = [dTdt; dNdt; dLdt; dCdt; dMdt; dIdt; dI_alfadt; 0]; % wektor równañ