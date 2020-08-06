function V_M = podaj_cytostatyk(t, liczba_dni_w_cyklu, dawkowanie)

    if(t >= 0 + 13 && t <= dawkowanie + 13)
        V_M = 5;
    elseif(t >= liczba_dni_w_cyklu + 13 && t <= liczba_dni_w_cyklu + dawkowanie + 13)
        V_M = 5;
    elseif(t >= 2*liczba_dni_w_cyklu + 13 && t <= (2*liczba_dni_w_cyklu) + dawkowanie + 13)
        V_M = 5;
    elseif(t >= 3*liczba_dni_w_cyklu + 13 && t <= (3*liczba_dni_w_cyklu) + dawkowanie + 13)
        V_M = 5;
    elseif(t >= 4*liczba_dni_w_cyklu + 13 && t <= (4*liczba_dni_w_cyklu) + dawkowanie + 13)
        V_M = 5;
    elseif(t >= 5*liczba_dni_w_cyklu + 13 && t <= (5*liczba_dni_w_cyklu) + dawkowanie + 13)
        V_M = 5;
    elseif(t >= 6*liczba_dni_w_cyklu + 13 && t <= (6*liczba_dni_w_cyklu) + dawkowanie + 13)
        V_M = 5;
    elseif(t >= 7*liczba_dni_w_cyklu + 13 && t <= (7*liczba_dni_w_cyklu) + dawkowanie + 13)
        V_M = 5;
    elseif(t >= 8*liczba_dni_w_cyklu + 13 && t <= (8*liczba_dni_w_cyklu) + dawkowanie + 13)
        V_M = 5;
    else
        V_M = 0; 
    end
   
 end
