function rownania = model_de_Pillis(t, x)

K_T = 9e-1;
K_N = 6.75e-2;
K_L = 4.86e-2;
K_C = 3.4e-2;
v_L = x(7);
v_M = x(8);
v_I = x(9);

T = x(1);
N = x(2);
L = x(3);
C = x(4);
M = x(5);
I = x(6);

% ustawienie parametrów
a = 4.31e-1;
b = 1.02e-9;
c = 2.9077e-13;
delta_T = 1.8328;
delta_N = 1.8328;
delta_L = 1.8328;
delta_C = 1.8328;
d = 2.34;
% d = 1.88;
e = 2.08e-7;
l = 2.09;
% l = 1.81;
f = 1.25e-2;
g_N = 2.5036e5;
jj = 1.245e-2;
k = 2.019e7;
kappa = 2.5036e3;
m = 9e-3;
p = 2.794e-13;
p_N = 6.68e-2;
s = 3.8e-3;
% s = 3.5e-2;
r1 = 2.9077e-11;
r2 = 5.8467e-13;
u = 4.417e-14;
alfa = 7.5e8;
beta = 6.3e-3;
gamma = 5.199e-1;
theta = 2.5036e-3;
q = 3.422e-10;
p_I = 2.971;
g_I = 2.5036e3;
mi_I = 1e1;

D = count_D(d, L, T, s, l);

% równania modelu
dTdt = (a * T *(1 - (b * T))) - (c * N * T) - (D * T) - (K_T * (1 - (exp(-delta_T*M))) * T);
dNdt = (e * C) - (f * N) - (p * N * T) + ((p_N*N*I)/(g_N+I)) - (K_N * (1 - exp(-delta_N*M)) * N);
dLdt = ((theta*m*L)/(theta+I)) + (jj*(T/(k+T))*L) - (q * L * T) + (((r1 * N) + (r2 * C)) * T) - ((u*L^2*C*I)/(kappa+I)) - (K_L * (1 - exp(-delta_L*M)) * L) + ((p_I * L * I) / (g_I + I)) + v_L;
dCdt = alfa - (beta * C) - (K_C * (1 - exp(-delta_C*M)) * C);
dMdt = ((-gamma) * M) + v_M;
dIdt = ((-mi_I) * I) + v_I;

rownania = [dTdt; dNdt; dLdt; dCdt; dMdt; dIdt; 0; 0; 0];

end

