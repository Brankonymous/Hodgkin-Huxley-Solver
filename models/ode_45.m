function [ODV, ODn, ODm, ODh] = ode_45(isExactSolution, plotFlag)
    global HHisExactSolution;
    HHisExactSolution = isExactSolution;
    [Cm, dt, t, I, ENa, EK, El, gbarNa, gbarK, gbarl, V, m, n, h] = constants(isExactSolution);

    y0=[V;n;m;h];

    [t,V] = ode45(@HH,t,y0);

    ODV=V(:,1)';
    ODn=V(:,2)';
    ODm=V(:,3)';
    ODh=V(:,4)';

    if plotFlag
        figure;
        plot(t,ODV);
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