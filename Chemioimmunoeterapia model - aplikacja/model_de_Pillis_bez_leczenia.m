function rownania = model_de_Pillis_bez_leczenia(t, x)

T = x(1);
N = x(2);
L = x(3);
C = x(4);

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

D = count_D(d, L, T, s, l);

% równania modelu
dTdt = (a * T *(1 - (b * T))) - (c * N * T) - (D * T);
dNdt = (e * C) - (f * N) + (g * ((T^2) / (h + (T^2))) * N) - (p * N * T);
dLdt = ((-m) * L) + (jj * ((D^2 * T^2) / (k + (D^2 * T^2))) * L) - (q * L * T) + (((r1 * N) + (r2 * C)) * T) - (u * N * (L^2));
dCdt = alfa - (beta * C);

rownania = [dTdt; dNdt; dLdt; dCdt];
end

