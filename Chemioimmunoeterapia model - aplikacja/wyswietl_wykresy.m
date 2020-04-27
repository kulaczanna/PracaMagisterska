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
legend('Komórki nowotworowe', 'Komórki NK', 'Limfocyty T_{CD8+}', 'Krążące limfocyty');
ylabel('Liczba komórek')
xlabel('Czas [dni]')

figure
subplot(2, 1, 1)
plot(t, y(:, 5), 'g');
legend('Cytostatyk')
ylabel('Stężenie')
xlabel('Czas [dni]')
hold on
subplot(2, 1, 2)
plot(t, y(:, 6), 'g');
legend('IL-2')
ylabel('Stężenie')
xlabel('Czas [dni]')

end