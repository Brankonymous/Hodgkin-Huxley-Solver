function [RKV, RKn, RKm, RKh] = runge_kutta(isExactSolution, plotFlag)
    global HHisExactSolution;
    HHisExactSolution = isExactSolution;

    [Cm, dt, t, I, ENa, EK, El, gbarNa, gbarK, gbarl, V, m, n, h] = constants(isExactSolution);

    for i=1:length(t)-1
        % obtain 4 variables (V,m,n,h) from HH function for each 4 k

        K1=dt*HH(i,[V(i); n(i); m(i); h(i)]);
        k1=K1(1,1);
        n1=K1(2,1);
        m1=K1(3,1);
        h1=K1(4,1); 
    
        K2=dt*HH(i+(0.5*dt),[V(i)+(0.5*k1);n(i)+(0.5*n1);m(i)+(0.5*m1);h(i)+(0.5*h1)]);
        k2=K2(1,1);
        n2=K2(2,1);
        m2=K2(3,1);
        h2=K2(4,1);

        K3=dt*HH(i+(0.5*dt),[V(i)+(0.5*k2);n(i)+(0.5*n2);m(i)+(0.5*m2);h(i)+(0.5*h2)]);
        k3=K3(1,1);
        n3=K3(2,1);
        m3=K3(3,1);
        h3=K3(4,1);

        K4=dt*HH(i+dt,[V(i)+k3;n(i)+n3;m(i)+m3;h(i)+h3]);
        k4=K4(1,1);
        n4=K4(2,1);
        m4=K4(3,1);
        h4=K4(4,1);

        % Next step
        V(i+1)=V(i)+1/6*(k1+2*k2+2*k3+k4);
        n(i+1)=n(i)+1/6*(n1+2*n2+2*n3+n4);
        m(i+1)=m(i)+1/6*(m1+2*m2+2*m3+m4);
        h(i+1)=h(i)+1/6*(h1+2*h2+2*h3+h4);

    end
    
    %Store variables for graphing later
    RKV=V;
    RKm=m;
    RKn=n;
    RKh=h;
    clear V m n h;
    
    if plotFlag
        figure;
        plot(t,RKV);
        legend('Runge-Kutta');
        xlabel('Time (ms)');
        ylabel('Voltage (mV)');
        title('Voltage Change for Hodgkin-Huxley Model');

        figure;
        plot(t, RKn);
        hold on;
        plot(t, RKm);
        plot(t, RKh);
        title('Gating Variables');
        xlabel('Time (ms)');
        ylabel('Gating Variable');
        legend('n','m','h');
    end

end
