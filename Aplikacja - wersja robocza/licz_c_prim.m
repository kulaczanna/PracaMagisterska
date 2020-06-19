function c_prim = licz_c_prim(c_CTL, Ialfa, Ialfa_0)

c_prim = c_CTL * (2 - (exp(-Ialfa/Ialfa_0))); % tumor inactivation by CD8+T

end