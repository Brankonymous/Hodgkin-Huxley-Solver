function [FEV, FEn, FEm, FEh] = forward_euler(plotFlag)
    [Cm, dt, t, I, ENa, EK, El, gbarNa, gbarK, gbarl, V, m, n, h] = constants();
    
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
    FEV=V;
    FEm=m;
    FEn=n;
    FEh=h;
    clear V m n h;
    
    if plotFlag
        figure(1);
        plot(t,FE);
        legend('Forward Euler');
        xlabel('Time (ms)');
        ylabel('Voltage (mV)');
        title('Voltage Change for Hodgkin-Huxley Model');

        figure(2);
        plot(t, FEn);
        hold on;
        plot(t, FEm);
        plot(t, FEh);
        title('Gating Variables');
        xlabel('Time (ms)');
        ylabel('Gating Variable');
        legend('n','m','h');
    end

end
