function [ESV, ESn, ESm, ESh] = expected_solution(plotFlag)
    [Cm, dt, t, I, ENa, EK, El, gbarNa, gbarK, gbarl, V, m, n, h] = constants();
    
    for i=2:length(t)
        V(i+1) = (1 / gbarl) * (-exp((-gbarl*t)/Cm) * (I + 60*gbarl))
    end
end