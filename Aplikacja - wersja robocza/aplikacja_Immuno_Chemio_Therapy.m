clc; clear all
close all
format long

n = 2; % wybór przypadku - 1 st³umienie nowotworu, 2 wzrost nowotworu

switch n
    case 1
        T_0 = 1e6;% tumor cells population T(t)
        N_0 = 1e5;% natural killer cells N(t)
        L_0 = 1e2;% CD8+T cells L(t)
        C_0 = 6e10;% cell C(t)
        I_0 = 0;% concentration of IL-2 I(t)
        I_alfa_0 = 0;% concentration of INF-a Ia(t)
        M_0 = 0;% concentration of chemotherapy drug M(t)
    case 2
        T_0 = 1e6;% tumor cells population T(t)
        N_0 = 1e3;% natural killer cells N(t)
        L_0 = 1e1;% CD8+T cells L(t)
        C_0 = 6e8;% cell C(t)
        I_0 = 0;% concentration of IL-2 I(t)
        I_alfa_0 = 0;% concentration of INF-a Ia(t)
        M_0 = 0;% concentration of chemotherapy drug M(t)
end

x = [T_0; N_0; L_0; C_0; M_0; I_0; I_alfa_0]; % parametry wejœciowe  uk³adu równañ
t = 0 : 1/24 : 120;
[t,y] = ode45(@model_Immuno_Chemio_Therapy, t, x); % rozwi¹zanie uk³adu równañ ró¿niczkowych

% wyœwietlenie wykresów
figure
semilogy(t, y(:,1), 'm');
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
