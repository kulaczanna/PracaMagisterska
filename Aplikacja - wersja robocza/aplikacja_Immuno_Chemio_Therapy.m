clc; clear all
close all
format long

metoda_leczenia = 3;

% Metody leczenia:
% 1. brak leczenia - regresja nowotworu
% 2. brak leczenia - rozw�j nowotworu 
% 3. chemioterapia, dawki co 5 dni, V_M = 5 - regresja nowotworu
% 4. chemioterapia, dawki co 10 dni, V_M = 5 - rozw�j nowotworu
% 5. immunoterapia - regresja nowotworu
% 6. immunoterapia - rozw�j nowotworu
% 7. immunoterapia + chemioterapia

pacjent = 9; % 9 lub 10 jak w artykule

% pocz�tkowe st�enie lek�w

M_0 = 0; % st�enie cytostatyku M(t)
liczba_dni_w_cyklu = 0; % co ile dni wyst�puje dodzowanie cytostatyku
I_0 = 0; % st�enie IL-2 I(t)
Ialfa_0 = 0; % st�enie IFN-alfa Ialfa(t)
        
switch metoda_leczenia
   case 1 %ok
        T_0 = 1e6;% tumor cells population T(t)
        N_0 = 1e5;% natural killer cells N(t)
        L_0 = 1e2;% CD8+T cells L(t)
        C_0 = 6e10;% cell C(t)
  
    case 2 %ok
        T_0 = 1e6;% tumor cells population T(t)
        N_0 = 1e3;% natural killer cells N(t)
        L_0 = 1e1;% CD8+T cells L(t)
        C_0 = 6e8;% cell C(t)
            
    case 3 % chemioterapia, dawki co 5 dni, V_M = 5 - regresja nowotworu
           % rys. 8 w artykule
        T_0 = 1e6;
        N_0 = 1e3;
        L_0 = 1e1;
        C_0 = 6e8;
        liczba_dni_w_cyklu = 5;
       
    case 4  % chemioterapia, dawki co 10 dni, V_M = 5 - rozw�j nowotworu
            % rys. 8 w artykule
        T_0 = 7e6;
        N_0 = 1e3;
        L_0 = 1e1;
        C_0 = 6e8;
        liczba_dni_w_cyklu = 5;
        
    case 5  % immunoterapia
            % rys. 9 w artykule
        T_0 = 1e6;
        N_0 = 1e5;
        L_0 = 1e2;
        C_0 = 6e10;
       
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

x = [T_0; N_0; L_0; C_0; M_0; I_0; Ialfa_0; liczba_dni_w_cyklu; pacjent; metoda_leczenia]; % parametry wej�ciowe  uk�adu r�wna�
t = 0 : 1/24 : 120;
[t,y] = ode45(@model_Immuno_Chemio_Therapy, t, x); % rozwi�zanie uk�adu r�wna� r�niczkowych

% wy�wietlenie wykres�w
figure
semilogy(t, y(:,1), 'b');
hold on
semilogy(t, y(:,2), 'g');
hold on
semilogy(t, y(:,3), 'r');
hold on
semilogy(t, y(:,4), 'c');
hold on
semilogy(t, y(:,5), 'k');
hold on
semilogy(t, y(:,6), 'b');
hold on
semilogy(t, y(:,7), 'y');
axis([0, 120, 10e-1, 10e12])
legend('Tumour', 'Natural killer cells', 'CD8+ T cells', 'Circulating lymphocytes', 'Chemotherapy drug', 'IL2', 'IFN-alfa');
