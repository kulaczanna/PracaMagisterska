function V_M = podaj_cytostatyk(t, liczba_dni_w_cyklu, dawkowanie)

    if(t >= 0 + 6 && t <= dawkowanie + 6)
        V_M = 4.5;
    elseif(t >= liczba_dni_w_cyklu + 6 && t <= liczba_dni_w_cyklu + dawkowanie + 6)
        V_M = 4.5;
    elseif(t >= 2*liczba_dni_w_cyklu + 6 && t <= (2*liczba_dni_w_cyklu) + dawkowanie + 6)
        V_M = 4.5;
    elseif(t >= 3*liczba_dni_w_cyklu + 6 && t <= (3*liczba_dni_w_cyklu) + dawkowanie + 6)
        V_M = 4.5;
    elseif(t >= 4*liczba_dni_w_cyklu + 6 && t <= (4*liczba_dni_w_cyklu) + dawkowanie + 6)
        V_M = 4.5;
    elseif(t >= 4.5*liczba_dni_w_cyklu + 6 && t <= (4.5*liczba_dni_w_cyklu) + dawkowanie + 6)
        V_M = 4.5;
    elseif(t >= 6*liczba_dni_w_cyklu + 6 && t <= (6*liczba_dni_w_cyklu) + dawkowanie + 6)
        V_M = 4.5;
    elseif(t >= 7*liczba_dni_w_cyklu + 6 && t <= (7*liczba_dni_w_cyklu) + dawkowanie + 6)
        V_M = 4.5;
    elseif(t >= 8*liczba_dni_w_cyklu + 6 && t <= (8*liczba_dni_w_cyklu) + dawkowanie + 6)
        V_M = 4.5;
    else
        V_M = 0; 
    end
   
 end
