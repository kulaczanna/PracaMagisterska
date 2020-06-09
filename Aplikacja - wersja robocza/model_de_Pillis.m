function rownania = model_de_Pillis(t, x)

T = x(1);
N = x(2);
L = x(3);
C = x(4);
M = x(5);
I = x(6);
% Ialfa = x(7);
liczba_dni_w_cyklu = x(7);
pacjent = x(8);
metoda_leczenia = x(9);

V_M = 0;
V_L = 0;
V_I = 0;

% ustawienie parametrów
a = 4.31e-1;
b = 1.02e-9;
c = 6.41e-11;
e = 2.08e-7;
f = 4.12e-2;
g = 1.25e-2;
h = 2.02e7;
jj = 2.49e-2;
r1 = 1.1e-7;
r2 = 6.5e-11;
u = 3e-10;
gamma = 9e-1;
mi_I = 1e1;
p_I = 1.25e-1;
g_I = 2e7;

    switch pacjent
        case 9
            d = 2.34;
            l = 2.09;
            k = 3.66e7;
            m = 2.04e-1;
            q = 1.42e-6;
            p = 3.42e-6;
            s = 8.39e-2;
            alfa = 7.5e8;
            beta = 1.2e-2;
        case 10
            d = 1.88;
            l = 1.81;
            k = 5.66e7;
            m = 9.12;
            q = 1.59e-6;
            p = 3.59e-6;
            s = 5.12e-1;
            alfa = 5e8;
            beta = 8e-3;
    end

% parametry dla chemioterapii
K_T = 9e-1;
K_N = 6e-1;
K_L = 6e-1;
K_C = 6e-1;

% a mo¿e tak?
% KT = K_T*(2 - (exp((-I)/I_0)));
% KL = K_L*(2 - (exp((-I)/I_0)));

% funkcja stê¿enia cytostatyku
if(metoda_leczenia == 3 || metoda_leczenia == 4 || metoda_leczenia == 7) 
    V_M = podaj_cytostatyk(t, liczba_dni_w_cyklu);
end
    
% funkcja stê¿enia TIL
    if(metoda_leczenia == 5 || metoda_leczenia == 6 || metoda_leczenia == 7)
        if(t >= 7 && t < 8)
            V_L = 1e11;
        end
        
% funkcja stê¿enia interleukiny-2
        if(t >= 8 && t <= 8.45 || t >= 8.7 && t <= 9.15 ...
                || t >= 9.4 && t <= 9.85 || t >= 10.1 && t <= 10.55 ...
                || t >= 10.8 && t <= 11.25 || t >= 11.5 && t <= 11.85)
        V_I = 5e6;
        end
    end

D = licz_D(d, L, T, s, l);

jot = 3.3e-9;
ka = 1.8e-8;
gie = 1.6e7;
el = 3e6;

% równania modelu
dTdt = (a * T *(1 - (b * T))) - (c * N * T) - ...
    (D * T) - (K_T * (1 - (exp(-M))) * T);
dNdt = (e * C) - (f * N) + (g * ((T^2) / (h + (T^2))) * N) - ...
    (p * N * T) - (K_N * (1 - (exp(-M))) * N);
dLdt = ((-m) * L) + (jj * ((D^2 * T^2) / ...
    (k + (D^2 * T^2))) * L) - (q * L * T) + ...
    (((r1 * N) + (r2 * C)) * T) - (u * N * (L^2)) - ...
    (K_L * (1 - (exp(-M))) * L) + ((p_I * L * I) / (g_I + I)) + V_L;
dCdt = alfa - (beta * C) - (K_C * (1 - (exp(-M))) * C);
dMdt = ((-gamma) * M) + V_M;
% dIdt = ((-mi_I) * I) + V_I;
dIdt = V_I + ((gie*T)/(T+el)) - (jot * L * I) - (ka * T * I); % z Isaevy
% dIalfadt = Ialfa;

rownania = [dTdt; dNdt; dLdt; dCdt; dMdt; dIdt; 0; 0; 0];
end

