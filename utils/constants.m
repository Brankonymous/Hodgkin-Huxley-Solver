function [Cm, dt, t, I, ENa, EK, El, gbarNa, gbarK, gbarl, V, m, n, h] = constants(isExactSolution)
    Cm=0.01; % Membrane Capcitance uF/cm^2
    dt=0.04; % Time Step ms
    t=0:dt:25; %Time Array ms
    
    I=0.1; % External Current Applied
    
    ENa=55.17; % mv Na reversal potential
    EK=-72.14; % mv K reversal potential
    El=-49.42; % mv Leakage reversal potential
    gbarNa=1.2; % mS/cm^2 Na conductance
    gbarK=0.36; % mS/cm^2 K conductance
    gbarl=0.003; % mS/cm^2 Leakage conductance
    
    V(1)=-60; % Initial Membrane voltage
    m(1)=am(V(1))/(am(V(1))+bm(V(1))); % Initial m-value
    n(1)=an(V(1))/(an(V(1))+bn(V(1))); % Initial n-value
    h(1)=ah(V(1))/(ah(V(1))+bh(V(1))); % Initial h-value
    
    if isExactSolution
        gbarK = 0;
        gbarNa = 0;
    end
end