clc; clear all
close all
format long

metoda_leczenia = 5;

% Metody leczenia:
% 1. brak leczenia - regresja nowotworu
% 2. brak leczenia - rozwój nowotworu 
% 3. chemioterapia, dawki co 5 dni, V_M = 5 - regresja nowotworu
% 4. chemioterapia, dawki co 10 dni, V_M = 5 - rozwój nowotworu
% 5. immunoterapia - regresja nowotworu
% 6. immunoterapia - rozwój nowotworu
% 7. immunoterapia + chemioterapia

pacjent = 9; % 9 lub 10 jak w artykule

% pocz¹tkowe stê¿enie leków
M_0 = 0; % stê¿enie cytostatyku M(t)
liczba_dni_w_cyklu = 0; % co ile dni wystêpuje dodzowanie cytostatyku
I_0 = 0; % stê¿enie IL-2 I(t)
dni_dawkowania = 0;
        
switch metoda_leczenia
    case 1 % brak leczenia - regresja nowotworu
           % rys. 7 w artykule
        T_0 = 1.8e7; % pocz¹tkowa liczba komórek nowotworowych T(t)
        N_0 = 1e5; % pocz¹tkowa liczba 'naturalnych zabójców' N(t)
        L_0 = 1e2; % pocz¹tkowa liczba limfocytów CD8+T L(t)
        C_0 = 6e10; % pocz¹tkowa liczba limfocytów kr¹¿¹cych C(t)
        
    case 2 % brak leczenia - rozwój nowotworu 
           % rys. 7 w artykule
        T_0 = 1e6;
        N_0 = 1e5;
        L_0 = 1e2;
        C_0 = 3e9;
     
    case 3 % chemioterapia, dawki co 5 dni, V_M = 5 - regresja nowotworu
           % rys. 8 w artykule
        T_0 = 1.8e7; % zmiana wartoœci z 2e7!!!
        N_0 = 1e5;
        L_0 = 1e2;
        C_0 = 3.5e9;
        liczba_dni_w_cyklu = 4;
        dni_dawkowania = 1;
       
    case 4  % chemioterapia, dawki co 10 dni, V_M = 5 - rozwój nowotworu
            % rys. 8 w artykule
        T_0 = 2e7; % zmiana wartoœci z 2e7!!!
        N_0 = 1e3;
        L_0 = 1e1;
        C_0 = 6e8;
        liczba_dni_w_cyklu = 10;
        
    case 5  % immunoterapia regresja
            % rys. 9 w artykule
        T_0 = 1e6; % zmiana wartoœci z 2e7!!!
        N_0 = 1e5;
        L_0 = 1e2;
        C_0 = 3.5e9;
%         T_0 = 1e6;  %2e6
%         N_0 = 1e3;
%         L_0 = 1e1;
%         C_0 = 6e8;
       
    case 6  % immunoterapia rozwoj
            % rys. 9 w artykule
        T_0 = 1.8e7; % zmiana wartoœci z 2e7!!!
        N_0 = 1e5;
        L_0 = 1e2;
        C_0 = 3.5e9;
%         T_0 = 2e7;  %2e7
%         N_0 = 1e3;
%         L_0 = 1e1;
%         C_0 = 6e8;

    case 7  % biochemioterapia
            % rys. 10 w artykule
        T_0 = 1.8e7; % zmiana wartoœci z 2e7!!!
        N_0 = 1e5;
        L_0 = 1e2;
        C_0 = 3.5e9;
%         T_0 = 2e7;
%         N_0 = 1e3;
%         L_0 = 1e1;
%         C_0 = 6e8;
        liczba_dni_w_cyklu = 8;
        dni_dawkowania = 1;
end

x = [T_0; N_0; L_0; C_0; M_0; I_0; liczba_dni_w_cyklu; metoda_leczenia; pacjent; dni_dawkowania]; % parametry wejœciowe  uk³adu równañ
t = 0 : 1/24 : 120; % czas symulacji
[t,y] = ode45(@model_de_Pillis, t, x); % rozwi¹zanie uk³adu równañ ró¿niczkowych

wyswietl_wykresy(t, y);

for n = 1 : 2881
    if(y(n,1) < 1) 
    disp('dzieñ regresji:')
    disp(t(n))
    break
    end
end

disp('T(120):')
disp(y(2881, 1))
% max(y(:,1))