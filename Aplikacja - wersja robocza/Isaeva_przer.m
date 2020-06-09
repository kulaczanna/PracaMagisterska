clc; clear all
close all
format long

metoda_leczenia = 0;
grupa = 1;

% Metody leczenia:
% 1. chemio
% 2. immuno
% 3. chemio/immuno
% 4. immuno/chemio
% 5. jednoczesna chemio + immuno
% 6. szczepionki

% początkowe stężenie leków

M_0 = 0; % stężenie cytostatyku M(t)
% liczba_dni_w_cyklu = 5; % co ile dni występuje dodzowanie cytostatyku
t = 0 : 1/24 : 140; % czas symulacji
w = 1;

switch w
    case 1
 % brak leczenia
        T_0 = 8e6; % początkowa liczba komórek nowotworowych T(t)
        N_0 = 1e5;
        L_0 = 2.25e7; % początkowa liczba limfocytów CD8+T L(t)
        I_0 = 2.4e7; % początkowa liczba interleukin-2 I(t)
        I_alfa_0 = 1e7; % początkowa liczba interferonów-alfa I_alfa(t)
        liczba_dni_w_cyklu0 = 0;
        
        x0 = [T_0; L_0; M_0; I_0; I_alfa_0; liczba_dni_w_cyklu0; grupa; metoda_leczenia; N_0]; % parametry wejściowe  układu równań
        [t,y] = ode45(@model_Isaeva_Osipov, t, x0); % rozwiązanie układu równań różniczkowych

%  % chemioterapia
%         liczba_dni_w_cyklu1 = 5;
%         metoda_leczenia = 1;
%         
%         x1 = [T_0; L_0; M_0; I_0; I_alfa_0; liczba_dni_w_cyklu1; grupa; metoda_leczenia]; % parametry wejściowe  układu równań
%         [t,y0] = ode45(@model_Isaeva_Osipov, t, x1); % rozwiązanie układu równań różniczkowych
% 
% % % immunoterapia IL-2
%         liczba_dni_w_cyklu2 = 10;
%         metoda_leczenia = 2;
%                 
%         x2 = [T_0; L_0; M_0; I_0; I_alfa_0; liczba_dni_w_cyklu2; grupa; metoda_leczenia]; % parametry wejściowe  układu równań
%         [t,y1] = ode45(@model_Isaeva_Osipov, t, x2); % rozwiązanie układu równań różniczkowych
% 
% % % immunoterapia IL-2 + IFN-alfa
%         liczba_dni_w_cyklu3 = 10;
%         metoda_leczenia = 3;
%                 
%         x3 = [T_0; L_0; M_0; I_0; I_alfa_0; liczba_dni_w_cyklu3; grupa; metoda_leczenia]; % parametry wejściowe  układu równań
%         [t,y2] = ode45(@model_Isaeva_Osipov, t, x3); % rozwiązanie układu równań różniczkowych

    case 2
        T_0 = 8e6; % początkowa liczba komórek nowotworowych T(t)
        L_0 = 2.25e7; % początkowa liczba limfocytów CD8+T L(t)
        I_0 = 2.4e7; % początkowa liczba interleukin-2 I(t)
        I_alfa_0 = 1e7; % początkowa liczba interferonów-alfa I_alfa(t)
        liczba_dni_w_cyklu0 = 0;
        metoda_leczenia = 0;
        
        x0 = [T_0; L_0; M_0; I_0; I_alfa_0; liczba_dni_w_cyklu0; grupa; metoda_leczenia]; % parametry wejściowe  układu równań
        [t,y] = ode45(@model_Isaeva_Osipov, t, x0); % rozwiązanie układu równań różniczkowych

         % chemio/immuno
         liczba_dni_w_cyklu4 = 0;
        metoda_leczenia = 4;
        x4 = [T_0; L_0; M_0; I_0; I_alfa_0; liczba_dni_w_cyklu4; grupa; metoda_leczenia]; % parametry wejściowe  układu równań
        [t,y] = ode45(@model_Isaeva_Osipov, t, x4); % rozwiązanie układu równań różniczkowych

         % immuno/chemio
         liczba_dni_w_cyklu5 = 0;
        metoda_leczenia = 5;
         x5 = [T_0; L_0; M_0; I_0; I_alfa_0; liczba_dni_w_cyklu5; grupa; metoda_leczenia]; % parametry wejściowe  układu równań
        [t,y] = ode45(@model_Isaeva_Osipov, t, x5); % rozwiązanie układu równań różniczkowych

        
          % jednoczesna chemio i immuno
         liczba_dni_w_cyklu6 = 0;
        metoda_leczenia = 6;
        x6 = [T_0; L_0; M_0; I_0; I_alfa_0; liczba_dni_w_cyklu6; grupa; metoda_leczenia]; % parametry wejściowe  układu równań
        [t,y] = ode45(@model_Isaeva_Osipov, t, x6); % rozwiązanie układu równań różniczkowych

       
%          % szczepionki
%         T_0 = 1e8; % początkowa liczba komórek nowotworowych T(t)
%         L_0 = 9e7; % początkowa liczba limfocytów CD8+T L(t)
%         I_0 = 2e7; % początkowa liczba interleukin-2 I(t)
%         I_alfa_0 = 1e7; % początkowa liczba interferonów-alfa I_alfa(t)
end

% x = [T_0; L_0; M_0; I_0; I_alfa_0; liczba_dni_w_cyklu; grupa; metoda_leczenia]; % parametry wejściowe  układu równań
% t = 0 : 1/24 : 140; % czas symulacji
% [t,y] = ode45(@model_Isaeva_Osipov, t, x); % rozwiązanie układu równań różniczkowych

wyswietl_wykresy(t, y);
