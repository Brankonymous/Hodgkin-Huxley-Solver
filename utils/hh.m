function dydt = HH(t,y)
    constants();

    V = y(1);
    n = y(2);
    m = y(3);
    h = y(4);

    gNa=gbarNa*m^3*h;
    gK=gbarK*n^4;
    gl=gbarl;
    
    INa=gNa*(V-ENa);
    IK=gK*(V-EK);
    Il=gl*(V-El);

    % Hodgkin-Huxley Model Equation
    dydt = [((1/Cm)*(I-(INa+IK+Il))); an(V)*(1-n)-bn(V)*n; am(V)*(1-m)-bm(V)*m; ah(V)*(1-h)-bh(V)*h];
end