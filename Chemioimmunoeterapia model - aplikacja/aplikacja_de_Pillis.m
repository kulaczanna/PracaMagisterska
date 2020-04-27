clc; clear all
close all
format long

metoda_leczenia = 7;
pacjent = 9;

% pocz�tkowe st�enie lek�w
M_0 = 0; % st�enie cytostatyku M(t)
liczba_dni_w_cyklu = 0;
I_0 = 0; % st�enie IL-2 I(t)
Ialfa_0 = 0; % st�enie IFN-alfa Ialfa(t)
        
switch metoda_leczenia
    case 1 % brak leczenia - regresja nowotworu
        T_0 = 1e6; % pocz�tkowa liczba kom�rek nowotworowych T(t)
        N_0 = 1e5; % pocz�tkowa liczba 'naturalnych zab�jc�w' N(t)
        L_0 = 1e2; % pocz�tkowa liczba limfocyt�w CD8+T L(t)
        C_0 = 6e10; % pocz�tkowa liczba limfocyt�w kr���cych C(t)
        model = @model_de_Pillis_bez_leczenia;
        
    case 2 % brak leczenia - rozw�j nowotworu
        T_0 = 1e6;
        N_0 = 1e3;
        L_0 = 1e1;
        C_0 = 6e8;
        model = @model_de_Pillis_bez_leczenia;        
     
    case 3 % chemioterapia, dawki co 5 dni, V_M = 5 - regresja nowotworu
        T_0 = 2e7;
        N_0 = 1e3;
        L_0 = 1e1;
        C_0 = 6e8;
        liczba_dni_w_cyklu = 5;
        model = @model_de_Pillis_chemiotherapy; 
       
    case 4  % chemioterapia, dawki co 10 dni, V_M = 5 - rozw�j nowotworu
        T_0 = 2e7;
        N_0 = 1e3;
        L_0 = 1e1;
        C_0 = 6e8;
        liczba_dni_w_cyklu = 10;
        model = @model_de_Pillis_chemiotherapy;
        
    case 5  % immunoterapia
        T_0 = 1e6;
        N_0 = 1e3;
        L_0 = 1e1;
        C_0 = 6e8;
        model = @model_de_Pillis_immunotherapy;
       
    case 6  % immunoterapia
        T_0 = 1e7;
        N_0 = 1e3;
        L_0 = 1e1;
        C_0 = 6e8;
        model = @model_de_Pillis_immunotherapy;

    case 7  % biochemioterapia
        T_0 = 1e7;
        N_0 = 1e3;
        L_0 = 1e1;
        C_0 = 6e8;
        liczba_dni_w_cyklu = 10;
        model = @model_de_Pillis_biochemiotherapy;
end

x = [T_0; N_0; L_0; C_0; M_0; I_0; Ialfa_0; liczba_dni_w_cyklu; pacjent]; % parametry wej�ciowe  uk�adu r�wna�
t = 0 : 1/24 : 120; % czas symulacji
[t,y] = ode45(model, t, x); % rozwi�zanie uk�adu r�wna� r�niczkowych

wyswietl_wykresy(t, y);
% doda� tytu�y ;)
