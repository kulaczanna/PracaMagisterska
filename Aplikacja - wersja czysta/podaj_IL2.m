function V_I = podaj_IL2(t, t1, dose, pause)

    if(t >= t1 && t <= (t1 + dose) ...
        || t >= (t1 + dose + pause) && t <= (t1 + (2 * dose) + pause) ...
        || t >= (t1 + (2 * dose) + (2 * pause)) && t <= (t1 + (3 * dose) + (2 * pause)) ...
        || t >= (t1 + (3 * dose) + (3 * pause)) && t <= (t1 + (4 * dose) + (3 * pause)) ...
        || t >= (t1 + (4 * dose) + (4 * pause)) && t <= (t1 + (5 * dose) + (4 * pause)) ...
        || t >= (t1 + (5 * dose) + (5 * pause)) && t <= (t1 + (6 * dose) + (5 * pause)))
%         || t >= (t1 + (6 * dose) + (6 * pause)) && t <= (t1 + (7 * dose) + (6 * pause)) ...
%         || t >= (t1 + (7 * dose) + (7 * pause)) && t <= (t1 + (8 * dose) + (7 * pause)) ...
%         || t >= (t1 + (8 * dose) + (8 * pause)) && t <= (t1 + (9 * dose) + (8 * pause)) ...
%         || t >= (t1 + (9 * dose) + (9 * pause)) && t <= (t1 + (10 * dose) + (9 * pause)) ...
%         || t >= (t1 + (10 * dose) + (10 * pause)) && t <= (t1 + (11 * dose) + (10 * pause)) ...
%         || t >= (t1 + (11* dose) + (11 * pause)) && t <= (t1 + (12 * dose) + (11 * pause)) ...
%         || t >= (t1 + (12 * dose) + (12 * pause)) && t <= (t1 + (13 * dose) + (12 * pause)) ...
%         || t >= (t1 + (13 * dose) + (13 * pause)) && t <= (t1 + (14 * dose) + (13 * pause)) ...
%         || t >= (t1 + (14 * dose) + (14 * pause)) && t <= (t1 + (15 * dose) + (14 * pause)))

        
        V_I = 2e6;
        
    else
        
        V_I = 0;
    
    end
   
 end
