function rownania = model_de_Pillis_chemiotherapy(t, x)

T = x(1);
N = x(2);
L = x(3);
C = x(4);
M = x(5);
liczba_dni_w_cyklu = x(6);

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

D = count_D(d, L, T, s, l);

% chemioterapia
K_T = 9e-1;
K_N = 6e-1;
K_L = 6e-1;
K_C = 6e-1;

% funkcja stê¿enia cytostatyku
    if(t >= 0 && t <= 1 || t >= liczba_dni_w_cyklu && t <= liczba_dni_w_cyklu+1 ...
            || t >= 2*liczba_dni_w_cyklu && t <= (2*liczba_dni_w_cyklu)+1 ...
            || t >= 3*liczba_dni_w_cyklu && t <= (3*liczba_dni_w_cyklu)+1 ...
            || t >= 4*liczba_dni_w_cyklu && t <= (4*liczba_dni_w_cyklu)+1 ...
            || t >= 5*liczba_dni_w_cyklu && t <= (5*liczba_dni_w_cyklu)+1 ...
            || t >= 6*liczba_dni_w_cyklu && t <= (6*liczba_dni_w_cyklu)+1 ...
            || t >= 7*liczba_dni_w_cyklu && t <= (7*liczba_dni_w_cyklu)+1 ...
            || t >= 8*liczba_dni_w_cyklu && t <= (8*liczba_dni_w_cyklu)+1)
        V_m = 5;
    else
        V_m = 0;
    end

% równania modelu
dTdt = (a * T *(1 - (b * T))) - (c * N * T) - (D * T) - (K_T * (1 - (exp(-M))) * T);
dNdt = (e * C) - (f * N) + (g * ((T^2) / (h + (T^2))) * N) - (p * N * T) - (K_N * (1 - (exp(-M))) * N);
dLdt = ((-m) * L) + (jj * ((D^2 * T^2) / (k + (D^2 * T^2))) * L) - (q * L * T) + (((r1 * N) + (r2 * C)) * T) - (u * N * (L^2)) - (K_L * (1 - (exp(-M))) * L);
dCdt = alfa - (beta * C) - (K_C * (1 - (exp(-M))) * C);
dMdt = -gamma * M + V_m;

rownania = [dTdt; dNdt; dLdt; dCdt; dMdt; 0];
end

