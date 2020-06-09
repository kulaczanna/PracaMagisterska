function [] = wyswietl_wykresy(t, y)

figure
semilogy(t, y(:,1), 'r');
hold on
semilogy(t, y(:,2), 'b');
hold on
semilogy(t, y(:,9), 'g');
axis([0, 120, 10e-1, 10e12])
legend('Kom�rki nowotworowe', 'Limfocyty T_{CD8+}', 'Kom�rki NK');
ylabel('Liczba kom�rek')
xlabel('Czas [dni]')

% pochodna_IL2 = diff(y(:, 6));

figure
subplot(3, 1, 1)
plot(t, y(:, 3), 'm');
legend('Cytostatyk - st�enie')
ylabel('St�enie')
xlabel('Czas [dni]')
hold on
subplot(3, 1, 2)
plot(t, y(:, 4), 'g');
legend('IL-2')
ylabel('St�enie')
xlabel('Czas [dni]')
hold on
subplot(3, 1, 3)
plot(t, y(:, 5), 'c');
legend('IFN')
ylabel('St�enie')
xlabel('Czas [dni]')

% subplot(3, 1, 3)
% plot(t(2:end), pochodna_IL2, 'g');
% legend('Pochodna IL-2')
% ylabel('St�enie')
% xlabel('Czas [dni]')

end