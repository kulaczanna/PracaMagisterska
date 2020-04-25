clc; clear all
close all

n = 5; % wybór przypadku

switch n
    case 1 % no treatment V_M i V_I musi byc rowne 0, regresja guza
        T_0 = 1e5;% tumor cells population T(t)
        N_0 = 1e5;% natural killer cells N(t)
        L_0 = 1e2;% CD8+T cells L(t)
        C_0 = 6e10;% cell C(t)
        M_0 = 0; % chemo concentration
        I_0 = 0; % iL-2 concentration
        liczba_dni_w_cyklu = 5;
        
    case 2 % no treatment V_M i V_I musi byc rowne 0, guz rosnie
        T_0 = 1e6;% tumor cells population T(t)
        N_0 = 1e3;% natural killer cells N(t)
        L_0 = 1e1;% CD8+T cells L(t)
        C_0 = 6e8;% cell C(t)
        M_0 = 0; % chemo concentration
        I_0 = 0; % iL-2 concentration
        liczba_dni_w_cyklu = 5;
        
    case 3 % 1 chemio dawki co 5 dni V_M = 5 V_I = 0
        T_0 = 2e7;% tumor cells population T(t)
        N_0 = 1e3;% natural killer cells N(t)
        L_0 = 1e1;% CD8+T cells L(t)
        C_0 = 6e8;% cell C(t)
        M_0 = 0; % chemo concentration
        I_0 = 0; % iL-2 concentration
        liczba_dni_w_cyklu = 5;
       
    case 4  % chemio dawki co 10 dni V_M = 5 V_I = 0
        T_0 = 2e7;% tumor cells population T(t)
        N_0 = 1e3;% natural killer cells N(t)
        L_0 = 1e1;% CD8+T cells L(t)
        C_0 = 6e8;% cell C(t)
        M_0 = 0; % chemo concentration
        I_0 = 0; % iL-2 concentration
        liczba_dni_w_cyklu = 10;
        
    case 5  % immuno dziala
        T_0 = 1e6;% tumor cells population T(t)
        N_0 = 1e3;% natural killer cells N(t)
        L_0 = 1e1;% CD8+T cells L(t)
        C_0 = 6e8;% cell C(t)
        M_0 = 0; % chemo concentration
        I_0 = 0; % iL-2 concentration
        liczba_dni_w_cyklu = 10;
       
    case 6  % immuno nie dziala
        T_0 = 1e7;% tumor cells population T(t)
        N_0 = 1e3;% natural killer cells N(t)
        L_0 = 1e1;% CD8+T cells L(t)
        C_0 = 6e8;% cell C(t)
        M_0 = 0; % chemo concentration
        I_0 = 0; % iL-2 concentration
        liczba_dni_w_cyklu = 10;
        
    case 7  % combination chemo i IL-2 V_M = 5 .. . . . 
        T_0 = 1e7;% tumor cells population T(t)
        N_0 = 1e3;% natural killer cells N(t)
        L_0 = 1e1;% CD8+T cells L(t)
        C_0 = 6e8;% cell C(t)
        M_0 = 0; % chemo concentration
        I_0 = 0; % iL-2 concentration
        liczba_dni_w_cyklu = 10;
end
       
x = [T_0; N_0; L_0; C_0; M_0; I_0; liczba_dni_w_cyklu]; % parametry wejœciowe  uk³adu równañ bez sk³adowych leczenia
t = 0 : 1/24 : 120;
[t,y] = ode45(@model_de_Pillis_immunotherapy, t, x); % rozwi¹zanie uk³adu równañ ró¿niczkowych

% wyœwietlenie wykresów
figure
semilogy(t, y(:,1), 'r');
hold on
semilogy(t, y(:,2), 'g');
legend();
hold on
semilogy(t, y(:,3), 'b');
hold on
semilogy(t, y(:,4), 'c');
axis([0, 120, 10e-1, 10e12])
legend('Komórki nowotworowe', 'Komórki NK', 'Limfocyty T_{CD8+}', 'Kr¹¿¹ce limfocyty');
ylabel('Liczba komórek')
xlabel('Czas [dni]')

figure
plot(t, y(:, 6), 'g');
legend('IL-2 concentration')
ylabel('Stê¿enie interleukiny-2')
xlabel('Czas [dni]')

figure
plot(t, y(:, 5), 'g');
legend('chemio concentration')
ylabel('Stê¿enie cytostatyku')
xlabel('Czas [dni]')