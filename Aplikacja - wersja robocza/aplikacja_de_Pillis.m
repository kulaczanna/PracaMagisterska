clc; clear all
close all
format long

metoda_leczenia = 7;

% Metody leczenia:
% 1. brak leczenia - regresja nowotworu
% 2. brak leczenia - rozwój nowotworu 
% 3. chemioterapia, dawki co 5 dni, V_M = 5 - regresja nowotworu
% 4. chemioterapia, dawki co 10 dni, V_M = 5 - rozwój nowotworu
% 5. immunoterapia - regresja nowotworu
% 6. immunoterapia - rozwój nowotworu
% 7. immunoterapia + chemioterapia

pacjent = 10; % 9 lub 10 jak w artykule

% pocz¹tkowe stê¿enie leków

M_0 = 0; % stê¿enie cytostatyku M(t)
liczba_dni_w_cyklu = 0; % co ile dni wystêpuje dodzowanie cytostatyku
I_0 = 0; % stê¿enie IL-2 I(t)
Ialfa_0 = 0; % stê¿enie IFN-alfa Ialfa(t)
        
switch metoda_leczenia
    case 1 % brak leczenia - regresja nowotworu
           % rys. 7 w artykule
        T_0 = 1e6; % pocz¹tkowa liczba komórek nowotworowych T(t)
        N_0 = 1e5; % pocz¹tkowa liczba 'naturalnych zabójców' N(t)
        L_0 = 1e2; % pocz¹tkowa liczba limfocytów CD8+T L(t)
        C_0 = 6e10; % pocz¹tkowa liczba limfocytów kr¹¿¹cych C(t)
        
    case 2 % brak leczenia - rozwój nowotworu 
           % rys. 7 w artykule
        T_0 = 1e6;
        N_0 = 1e3;
        L_0 = 1e1;
        C_0 = 6e8;       
     
    case 3 % chemioterapia, dawki co 5 dni, V_M = 5 - regresja nowotworu
           % rys. 8 w artykule
        T_0 = 2e7;
        N_0 = 1e3;
        L_0 = 1e1;
        C_0 = 6e8;
        liczba_dni_w_cyklu = 5;
       
    case 4  % chemioterapia, dawki co 10 dni, V_M = 5 - rozwój nowotworu
            % rys. 8 w artykule
        T_0 = 2e7; %
        N_0 = 3e5; % zmiana
        L_0 = 1e2; %
        C_0 = 10e10; %
        liczba_dni_w_cyklu = 10;
        
    case 5  % immunoterapia
            % rys. 9 w artykule
        T_0 = 1e6;
        N_0 = 1e3;
        L_0 = 1e1;
        C_0 = 6e8;
       
    case 6  % immunoterapia
            % rys. 9 w artykule
        T_0 = 2e7; %
        N_0 = 3e5; % zmiana
        L_0 = 1e2; %
        C_0 = 10e10; %

    case 7  % biochemioterapia
            % rys. 10 w artykule
        T_0 = 2e7; %
        N_0 = 3e5; % zmiana
        L_0 = 1e2; %
        C_0 = 10e10; %
        liczba_dni_w_cyklu = 10;
end

x = [T_0; N_0; L_0; C_0; M_0; I_0; Ialfa_0; liczba_dni_w_cyklu; pacjent; metoda_leczenia]; % parametry wejœciowe  uk³adu równañ
t = 0 : 1/24 : 120; % czas symulacji
[t,y] = ode45(@model_de_Pillis, t, x); % rozwi¹zanie uk³adu równañ ró¿niczkowych

wyswietl_wykresy(t, y, 1);
