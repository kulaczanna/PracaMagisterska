clc; clear all
close all

n = 1; % wyb�r przypadku
liczba_dni_w_cyklu = 5;

switch n
    case 1 % no treatment
        T_0 = 1e6;% tumor cells population T(t)
        N_0 = 1e5;% natural killer cells N(t)
        L_0 = 1e2;% CD8+T cells L(t)
        C_0 = 6e10;% cell C(t)
        M_0 = 0; % chemo concentration
        
    case 2 % 1 chemio dawki co 5 dni
        T_0 = 6e6;% tumor cells population T(t)
        N_0 = 1e3;% natural killer cells N(t)
        L_0 = 1e1;% CD8+T cells L(t)
        C_0 = 6e8;% cell C(t)
        M_0 = 0; % chemo concentration
       
    case 3  % chemio dawki co 10 dni
        T_0 = 1e6;% tumor cells population T(t)
        N_0 = 1e5;% natural killer cells N(t)
        L_0 = 1e1;% CD8+T cells L(t)
        C_0 = 6e8;% cell C(t)
        M_0 = 0; % chemo concentration
        
    case 4
        T_0 = 1e6;% tumor cells population T(t)
        N_0 = 1e5;% natural killer cells N(t)
        L_0 = 1e1;% CD8+T cells L(t)
        C_0 = 6e8;% cell C(t)
        M_0 = 0; % chemo concentration
end
       
x = [T_0; N_0; L_0; C_0; M_0; liczba_dni_w_cyklu]; % parametry wej�ciowe  uk�adu r�wna� bez sk�adowych leczenia
t = 0 : 1/24 : 120;
[t,y] = ode45(@model_de_Pillis_chemiotherapy, t, x); % rozwi�zanie uk�adu r�wna� r�niczkowych

% wy�wietlenie wykres�w
figure
semilogy(t, y(:,1), 'b');
hold on
semilogy(t, y(:,2), 'g');
legend();
hold on
semilogy(t, y(:,3), 'r');
hold on
semilogy(t, y(:,4), 'c');
axis([0, 120, 10e-1, 10e12])
legend('Kom�rki nowotworowe', 'Kom�rki NK', 'Limfocyty T_{CD8+}', 'Kr���ce limfocyty');
ylabel('Liczba kom�rek')
xlabel('Czas [dni]')

figure
plot(t, y(:, 5), 'g');
legend('chemo concentration')
ylabel('St�enie cytostatyku')
xlabel('Czas [dni]')