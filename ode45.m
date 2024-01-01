function ode45(plotFlag)
    constants();

    y0=[V;n;m;h];
    tspan = [0,max(t)];

    [t,V] = ode45(@HH,tspan,y0);

    OD=V(:,1);
    ODn=V(:,2);
    ODm=V(:,3);
    ODh=V(:,4);

    if plotFlag
        figure;
        plot(t,OD);
        legend('ODE45');
        xlabel('Time (ms)');
        ylabel('Voltage (mV)');
        title('Voltage Change for Hodgkin-Huxley Model');

        figure;
        plot(t, ODn);
        hold on;
        plot(t, ODm);
        plot(t, ODh);
        title('Gating Variables');
        xlabel('Time (ms)');
        ylabel('Gating Variable');
        legend('n','m','h');
    end
end