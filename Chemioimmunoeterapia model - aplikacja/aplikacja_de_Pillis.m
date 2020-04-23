clc; clear all
close all
format long

n = 1; %

switch n
    case 1
        T_0 = 1e7;% tumor cells population T(t)
        N_0 = 2.5e8;% natural killer cells N(t)
        L_0 = 5.268e5;% CD8+T cells L(t)
        C_0 = 2.25e9;% cell C(t)
        I_0 = 1073;% concentration of IL-2 I(t)
        M_0 = 0;% concentration of chemotherapy drug M(t)
        v_M = 0;
        v_I = 0;
        v_L = 0;
        
    case 2 % with chemotherapy drug
        T_0 = 1e7;% tumor cells population T(t)
        N_0 = 2.5e8;% natural killer cells N(t)
        L_0 = 5.268e5;% CD8+T cells L(t)
        C_0 = 2.25e9;% cell C(t)
        I_0 = 1073;% concentration of IL-2 I(t)
        M_0 = 0;% concentration of chemotherapy drug M(t)
        v_M = 2.3869;
        v_I = 2.7859e6;
        v_L = 1.77e10;
end

x = [T_0; N_0; L_0; C_0; M_0; I_0; v_L; v_M; v_I]; % parametry wejœciowe  uk³adu równañ
[t,y] = ode45(@model_de_Pillis, [0 200], x); % rozwi¹zanie uk³adu równañ ró¿niczkowych

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
axis([0, 120, 10e-1, 10e12])
legend('Tumour', 'Natural killer cells', 'CD8+ T cells', 'Circulating lymphocytes', 'Chemotherapy drug', 'IL2');
