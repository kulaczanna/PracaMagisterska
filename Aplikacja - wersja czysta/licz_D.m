function D = licz_D(d, L, T, s, l)

D = (d * ((L / T)^l)) / (s + ((L / T)^l)); % tumor inactivation by CD8+T

end