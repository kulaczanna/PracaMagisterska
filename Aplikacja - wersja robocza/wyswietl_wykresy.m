function [] = wyswietl_wykresy(t, y)

figure
semilogy(t, y(:,1), 'r');
hold on
semilogy(t, y(:,2), 'g');
hold on
semilogy(t, y(:,3), 'b');
hold on
semilogy(t, y(:,4), 'c');
% hold on
% plot(7, y(:, 3), 'k.');
% hold on
% plot(8, y(:, 3), 'k.');
% hold on
% plot(8, y(:, 3), 'm.');
% hold on
% plot(12, y(:, 3), 'm.');
axis([0, 120, 10e-1, 10e12])
legend('Kom�rki nowotworowe', 'Kom�rki NK', 'Limfocyty T_{CD8+}', 'Kr���ce limfocyty');
ylabel('Liczba kom�rek')
xlabel('Czas [dni]')

pochodna_TCD8 = diff(y(:, 3));

figure
subplot(3, 1, 1)
plot(t, y(:, 5), 'm');
legend('Cytostatyk - st�enie')
ylabel('St�enie')
xlabel('Czas [dni]')
hold on
subplot(3, 1, 2)
plot(t, y(:, 6), 'g');
legend('IL-2')
ylabel('St�enie')
xlabel('Czas [dni]')
hold on
% subplot(3, 1, 3)
% plot(t, y(:, 5), 'c');
% legend('IFN')
% ylabel('St�enie')
% xlabel('Czas [dni]')

subplot(3, 1, 3)
plot(t(2:end), pochodna_TCD8, 'g');
legend('Pochodna tcd8')
ylabel('St�enie')
xlabel('Czas [dni]')

end