function forward_euler(plotFlag)
    [Cm, dt, t, I, ENa, EK, El, gbarNa, gbarK, gbarl, V] = constants();
    
    m(1)=am(V(1))/(am(V(1))+bm(V(1))); % Initial m-value
    n(1)=an(V(1))/(an(V(1))+bn(V(1))); % Initial n-value
    h(1)=ah(V(1))/(ah(V(1))+bh(V(1))); % Initial h-value
    
    for i=1:length(t)-1
        m(i+1)=m(i)+dt*((am(V(i))*(1-m(i)))-(bm(V(i))*m(i)));
        n(i+1)=n(i)+dt*((an(V(i))*(1-n(i)))-(bn(V(i))*n(i)));
        h(i+1)=h(i)+dt*((ah(V(i))*(1-h(i)))-(bh(V(i))*h(i)));
    
        gNa=gbarNa*m(i)^3*h(i);
        gK=gbarK*n(i)^4;
        gl=gbarl;
        
        INa=gNa*(V(i)-ENa);
        IK=gK*(V(i)-EK);
        Il=gl*(V(i)-El);
    
        V(i+1)=V(i)+(dt)*((1/Cm)*(I-(INa+IK+Il)));
    end
    
    %Store variables for graphing later
    FE=V;
    FEm=m;
    FEn=n;
    FEh=h;
    clear V m n h;
    
    if (plotFlag == true)
        %% Plot
        %Plot the functions
        plot(t,FE);
        legend('Forward Euler');
        xlabel('Time (ms)');
        ylabel('Voltage (mV)');
        title('Voltage Change for Hodgkin-Huxley Model');
    end

end
