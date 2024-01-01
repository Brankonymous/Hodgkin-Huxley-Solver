function [Cm, dt, t, I, ENa, EK, El, gbarNa, gbarK, gbarl, V] = constants()
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
end