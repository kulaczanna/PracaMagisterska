function [] = wyswietl_wykresy_i(t, y0, y1, y2, y3)
      
        figure
        semilogy(t, y0(:,1), 'r');
        hold on
        semilogy(t, y1(:,1), 'g');
        hold on
        semilogy(t, y2(:,1), 'b');
        hold on
        semilogy(t, y3(:,1), 'k');
        axis([0, 140, 10e4, 10e9])
        legend('Brak leczenia', 'Chemioterapia', 'Immunoterapia IL-2', 'Immunoterapia IL-2 + IFN-alfa');
        ylabel('Liczba komórek nowotworowych')
        xlabel('Czas [dni]')
        
        figure
        semilogy(t, y0(:,2), 'r');
        hold on
        semilogy(t, y1(:,2), 'g');
        hold on
        semilogy(t, y2(:,2), 'b');
        hold on
        semilogy(t, y3(:,2), 'k');
        axis([0, 140, 10e6, 10e10])
        legend('Brak leczenia', 'Chemioterapia', 'Immunoterapia IL-2', 'Immunoterapia IL-2 + IFN-alfa');
        ylabel('Liczba komórek CTL')
        xlabel('Czas [dni]')
        
        figure
        semilogy(t, y0(:,2), 'r');
        hold on
        semilogy(t, y1(:,2), 'g');
        hold on
        semilogy(t, y2(:,2), 'b');
        hold on
        semilogy(t, y3(:,2), 'k');
        axis([0, 140, 0, 60])
        legend('Brak leczenia', 'Chemioterapia', 'Immunoterapia IL-2', 'Immunoterapia IL-2 + IFN-alfa');
        ylabel('Liczba komórek IL-2')
        xlabel('Czas [dni]')

        figure
        plot(t, y0(:, 3), 'g');
        legend('Cytostatyk')
        ylabel('Stężenie')
        xlabel('Czas [dni]')
        hold on
%         
%         subplot(3, 1, 2)
%         plot(t, y(:, 4), 'g');
%         legend('IL-2')
%         ylabel('Stężenie')
%         xlabel('Czas [dni]')
%         hold on
%         
%         subplot(3, 1, 3)
%         plot(t, y(:, 5), 'g');
%         legend('IFN-alfa')
%         ylabel('Stężenie')
%         xlabel('Czas [dni]')
end