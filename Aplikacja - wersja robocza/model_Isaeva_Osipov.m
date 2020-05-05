function rownania = model_de_Pillis(t, x)

T = x(1);
L = x(2);
M = x(3);
I = x(4);
I_alfa = x(5);
I_alfa0 = x(6);
liczba_dni_w_cyklu = x(7);
pacjent = x(8);
metoda_leczenia = x(9);

V_M = 0;
V_I = 0;
V_Ialfa = 0;

% ustawienie parametrów I
a = 0.13;
b = 3e-10;
c_CTL = 4.4e-9;
d = 7.3e6;
e = 9.9e-9;
f = 0.33;
g = 1.6e7;
jj = 3.3e-9;
k = 1.8e-8;
l = 3e6;
p = 6.4;
q = 1.7;

% % ustawienie parametrów II
% a = 0.13;
% b = 3e-10;
% c_CTL = 3.3e-9;
% d = 7.3e6;
% e = 9.6e-9;
% f = 0.33;
% g = 1.4e7;
% jj = 2.9e-9;
% k = 1.5e-8;
% l = 3e6;
% p = 6.4;
% q = 1.7;
% 
% % ustawienie parametrów III
% a = 0.13;
% b = 3e-10;
% c_CTL = 5.5e-9;
% d = 7.3e6;
% e = 1e-8;
% f = 0.33;
% g = 2.4e7;
% jj = 3.7e-9;
% k = 2.1e-8;
% l = 3e6;
% p = 6.4;
% q = 1.7;

% parametry dla chemioterapii
K_T = 0.9;
K_L = 0.6;

% % funkcja stężenia cytostatyku
%     if(metoda_leczenia == 3 || metoda_leczenia == 4 || metoda_leczenia == 7)
%         if(t >= 0 && t <= 3 || t >= liczba_dni_w_cyklu && t <= liczba_dni_w_cyklu+3 ...
%                 || t >= 2*liczba_dni_w_cyklu && t <= (2*liczba_dni_w_cyklu)+3 ...
%                 || t >= 3*liczba_dni_w_cyklu && t <= (3*liczba_dni_w_cyklu)+3 ...
%                 || t >= 4*liczba_dni_w_cyklu && t <= (4*liczba_dni_w_cyklu)+3 ...
%                 || t >= 5*liczba_dni_w_cyklu && t <= (5*liczba_dni_w_cyklu)+3 ...
%                 || t >= 6*liczba_dni_w_cyklu && t <= (6*liczba_dni_w_cyklu)+3 ...
%                 || t >= 7*liczba_dni_w_cyklu && t <= (7*liczba_dni_w_cyklu)+3 ...
%                 || t >= 8*liczba_dni_w_cyklu && t <= (8*liczba_dni_w_cyklu)+3)
%             V_M = 2;
%         end
%     end
    
% % funkcja stężenia TIL
%     if(metoda_leczenia == 5 || metoda_leczenia == 6 || metoda_leczenia == 7)
%         if(t >= 7 && t < 9)
%             V_L = 1e9;
%         end
% 
% % funkcja stężenia interleukiny-2
%         if(t >= 8 && t <= 8.45 || t >= 8.7 && t <= 9.15 ...
%                 || t >= 9.4 && t <= 9.85 || t >= 10.1 && t <= 10.55 ...
%                 || t >= 10.8 && t <= 11.25 || t >= 11.5 && t <= 11.85 ...
%                 || t >= 12.1 && t <= 12.45 || t >= 12.6 && t <= 12.95)
%         %         ...
%         %             || t >= 20 && t <= 20.5 || t >= 21 && t <= 21.5 ...
%         %             || t >= 22 && t <= 22.5 || t >= 23 && t <= 23.5 ...
%         %             || t >= 24 && t <= 24.5 || t >= 80 && t <= 80.5 ...
%         %             || t >= 81 && t <= 81.5 || t >= 82 && t <= 82.5 ...
%         %             || t >= 83 && t <= 83.5 || t >= 84 && t <= 84.5 ...
%         %             || t >= 85 && t <= 85.5 || t >= 86 && t <= 86.5 ...
%         %             || t >= 87 && t <= 87.5 || t >= 88 && t <= 88.5 ...
%         %             || t >= 89 && t <= 89.5)
% 
%         V_I = 5e6;
%         end
%     end

c = c_CTL*(2 - (exp((-I_alfa)/I_alfa0))); % błąd

% równania modelu
dTdt = - a*T*log((b*T)/a) - c*T*L - ...
    (K_T*(1 - (exp(-M)))*T);
dLdt = d + (e*L*I) - (f*L) - (K_L*(1 - (exp(-M)))*L);
dMdt = V_M - (p*M);
dIdt = V_I + ((g*T)/(T+l)) - (jj*L*I) - (k*T*I);
dIalfadt = V_Ialfa - (q*I_alfa);

rownania = [dTdt; dLdt; dMdt; dIdt; dIalfadt; I_alfa0; 0; 0; 0];
end
