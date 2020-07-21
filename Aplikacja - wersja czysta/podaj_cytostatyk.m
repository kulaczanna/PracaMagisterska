function V_M = podaj_cytostatyk(t, liczba_dni_w_cyklu, dawkowanie)

    if(t >= 0 + 0 && t <= dawkowanie + 0)
        V_M = 10;
    elseif(t >= liczba_dni_w_cyklu + 0 && t <= liczba_dni_w_cyklu + dawkowanie + 0)
        V_M = 10;
    elseif(t >= 2*liczba_dni_w_cyklu + 0 && t <= (2*liczba_dni_w_cyklu) + dawkowanie + 0)
        V_M = 10;
    elseif(t >= 3*liczba_dni_w_cyklu + 0 && t <= (3*liczba_dni_w_cyklu) + dawkowanie + 0)
        V_M = 10;
    elseif(t >= 4*liczba_dni_w_cyklu + 0 && t <= (4*liczba_dni_w_cyklu) + dawkowanie + 0)
        V_M = 10;
    elseif(t >= 5*liczba_dni_w_cyklu + 0 && t <= (5*liczba_dni_w_cyklu) + dawkowanie + 0)
        V_M = 10;
    elseif(t >= 6*liczba_dni_w_cyklu + 0 && t <= (6*liczba_dni_w_cyklu) + dawkowanie + 0)
        V_M = 10;
    elseif(t >= 7*liczba_dni_w_cyklu + 0 && t <= (7*liczba_dni_w_cyklu) + dawkowanie + 0)
        V_M = 10;
    elseif(t >= 8*liczba_dni_w_cyklu + 0 && t <= (8*liczba_dni_w_cyklu) + dawkowanie + 0)
        V_M = 10;
    else
        V_M = 0; 
    end
   
 end
