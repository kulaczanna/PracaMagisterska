function [] = wyswietl_wykresy_i(t, y, V_I)
      
%         figure
%         semilogy(t, y(:,2), 'r');
%         hold on
%         semilogy(t, y(:,2), 'g');
%         hold on
%         semilogy(t, y(:,2), 'b');
%         hold on
%         semilogy(t, y(:,2), 'k');
%         axis([0, 140, 10e4, 10e9])
%         legend('Brak leczenia', 'Chemioterapia', 'Immunoterapia IL-2', 'Immunoterapia IL-2 + IFN-alfa');
%         ylabel('Liczba komórek nowotworowych')
%         xlabel('Czas [dni]')
        
%         figure
%         semilogy(t, y0(:,2), 'r');
%         hold on
%         semilogy(t, y1(:,2), 'g');
%         hold on
%         semilogy(t, y2(:,2), 'b');
%         hold on
%         semilogy(t, y3(:,2), 'k');
%         axis([0, 140, 10e6, 10e10])
%         legend('Brak leczenia', 'Chemioterapia', 'Immunoterapia IL-2', 'Immunoterapia IL-2 + IFN-alfa');
%         ylabel('Liczba komórek CTL')
%         xlabel('Czas [dni]')
%         
        figure
        plot(t, y(:, 4)/1e6, 'r');
        axis([0, 140, 0, 60])
        legend('Chemioterapia');
        ylabel('Liczba jednostek IL-2')
        xlabel('Czas [dni]')
% 
        figure
        plot(t, y(:, 3), 'g');
        axis([0, 50, 0, 0.2])
        legend('Cytostatyk')
        ylabel('Stężenie')
        xlabel('Czas [dni]')
        
%         
%         figure
%         plot(t, y0(:, 5), 'g');
%         legend('IFN-alfa')
%         ylabel('Stężenie')
%         xlabel('Czas [dni]')
%         hold on

end