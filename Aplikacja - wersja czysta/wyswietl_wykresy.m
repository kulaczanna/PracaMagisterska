function [] = wyswietl_wykresy(t, y)

figure
semilogy(t, y(:,1), 'r');
hold on
semilogy(t, y(:,2), 'g');
hold on
semilogy(t, y(:,3), 'b');
hold on
semilogy(t, y(:,4), 'c');
axis([0, 120, 10e-1, 10e12])
% axis([0, 120, 0, 10e12])
legend('Kom�rki nowotworowe', 'Kom�rki NK', 'Limfocyty T_{CD8+}', 'Kr���ce limfocyty');
title({'Zmiany w czasie liczby kom�rek badanych populacji';'dla warto�ci pocz�tkowych:';'T(0) = 1,8*10^7, N(0) = 10^5, L(0) = 10^2, C(0) = 3,5*10^9'})
ylabel('Liczba kom�rek [log]')
xlabel('Czas [dni]')

figure
subplot(3, 1, 1)
plot(t, y(:, 5), 'g');
title('St�enie cytostatyka')
legend('Cytostatyk')
ylabel('St�enie')
xlabel('Czas [dni]')
hold on
subplot(3, 1, 2)
plot(t, y(:, 6), 'g');
legend('IL-2')
title('St�enie IL-2')
ylabel('St�enie')
xlabel('Czas [dni]')
% hold on
% subplot(3, 1, 3)
% plot(t, y(:, 6), 'g');
% legend('IL-2')
% ylabel('St�enie')
% xlabel('Czas [dni]')

end