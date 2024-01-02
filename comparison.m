eulerFlag = true;
ode45Flag = true;
rungeFlag = true;

[~, ~, t, ~] = constants();

if eulerFlag
    [FEV, FEn, FEm, FEh] = forward_euler(false);
end

if ode45Flag
    [ODV, ODn, ODm, ODh] = ode_45(false);
end

if rungeFlag
    [RKV, RKn, RKm, RKh] = runge_kutta(false);
end

% Plot the voltage
figure(1);

legendNames = [];
if eulerFlag
    plot(t, FEV);
    legendNames = [legendNames, 'Forward Euler'];
    hold on;
end
if ode45Flag
    plot(t, ODV);
    legendNames = [legendNames, 'ODE45'];
    hold on;
end
if rungeFlag
    plot(t, RKV);
    legendNames = [legendNames, 'Runge-Kutta'];
    hold on;
end
xlabel('Time (ms)');
ylabel('Voltage (mV)');
title('Voltage Change for Hodgkin-Huxley Model');
legend(strcat('N=',string(legendNames(1:nN))));

%{
% Plot the gating variables
figure(2);
legendNames = [];
if eulerFlag
    plot(t, FEn);
    hold on;
    plot(t, FEm);
    hold on;
    plot(t, FEh);
    hold on;
    legendNames = [legendNames, 'Forward Euler n', 'Forward Euler m', 'Forward Euler h'];
end
if ode45Flag
    plot(t, ODn);
    hold on;
    plot(t, ODm);
    hold on;
    plot(t, ODh);
    hold on;
    legendNames = [legendNames, 'ODE45 n', 'ODE45 m', 'ODE45 h'];
end
if rungeFlag
    plot(t, RKn);
    hold on;
    plot(t, RKm);
    hold on;
    plot(t, RKh);
    hold on;
    legendNames = [legendNames, 'Runge-Kutta n', 'Runge-Kutta m', 'Runge-Kutta h'];
end
title('Gating Variables');
xlabel('Time (ms)');
ylabel('Gating Variable');
legend(legendNames);
%}