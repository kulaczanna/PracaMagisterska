function [] = wyswietl_wykresy(t, y, m)

switch m
    case 1
        figure
        semilogy(t, y(:,1), 'r');
        hold on
        semilogy(t, y(:,2), 'g');
        hold on
        semilogy(t, y(:,3), 'b');
        hold on
        semilogy(t, y(:,4), 'c');
        axis([0, 140, 10e-1, 10e12])
        legend('Kom�rki nowotworowe', 'Kom�rki NK', 'Limfocyty T_{CD8+}', 'Kr���ce limfocyty');
        ylabel('Liczba kom�rek')
        xlabel('Czas [dni]')

        figure
        subplot(2, 1, 1)
        plot(t, y(:, 5), 'g');
        legend('Cytostatyk')
        ylabel('St�enie')
        xlabel('Czas [dni]')
        hold on
        subplot(2, 1, 2)
        plot(t, y(:, 6), 'g');
        legend('IL-2')
        ylabel('St�enie')
        xlabel('Czas [dni]')
    
    case 2
        figure
        semilogy(t, y(:,1), 'r');
        hold on
        semilogy(t, y(:,2), 'g');
        axis([0, 140, 10e-1, 10e12])
        legend('Kom�rki nowotworowe', 'Limfocyty T_{CD8+}');
        ylabel('Liczba kom�rek')
        xlabel('Czas [dni]')

        figure
        subplot(3, 1, 1)
        plot(t, y(:, 3), 'g');
        legend('Cytostatyk')
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
        plot(t, y(:, 5), 'g');
        legend('IFN-alfa')
        ylabel('St�enie')
        xlabel('Czas [dni]')
end
end