function [] = wyswietl_wykresy(t, y)

figure
semilogy(t, y(:,1), 'm');
hold on
semilogy(t, y(:,2), 'g');
hold on
semilogy(t, y(:,3), 'r');
hold on
semilogy(t, y(:,4), 'c');
axis([0, 120, 10e-1, 10e12])
legend('Komórki nowotworowe', 'Komórki NK', 'Limfocyty T_{CD8+}', 'Kr¹¿¹ce limfocyty');
ylabel('Liczba komórek')
xlabel('Czas [dni]')

figure
subplot(3, 1, 1)
plot(t, y(:, 5), 'g');
legend('Cytostatyk')
ylabel('Stê¿enie')
xlabel('Czas [dni]')
hold on
subplot(3, 1, 2)
plot(t, y(:, 6), 'g');
legend('IL-2')
ylabel('Stê¿enie')
xlabel('Czas [dni]')
% hold on
% subplot(3, 1, 3)
% plot(t, y(:, 6), 'g');
% legend('IL-2')
% ylabel('Stê¿enie')
% xlabel('Czas [dni]')

end