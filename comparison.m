%% Preprocess
eulerFlag = true;
ode45Flag = true;
rungeFlag = true;

[~, ~, t, ~] = constants();

%% Run
if eulerFlag
    [FEV, FEn, FEm, FEh] = forward_euler(false);
end

if ode45Flag
    [ODV, ODn, ODm, ODh] = ode_45(false);
end

if rungeFlag
    [RKV, RKn, RKm, RKh] = runge_kutta(false);
end

%% Voltage plot

figure(1);

legendNames = {};
if eulerFlag
    plot(t, FEV);
    legendNames = [legendNames, {'Forward Euler'}];
    hold on;
end
if ode45Flag
    plot(t, ODV);
    legendNames = [legendNames, {'ODE45'}];
    hold on;
end
if rungeFlag
    plot(t, RKV);
    legendNames = [legendNames, {'Runge-Kutta'}];
    hold on;
end
xlabel('Time (ms)');
ylabel('Voltage (mV)');
title('Voltage Change for Hodgkin-Huxley Model');
legend(legendNames);

%% Gating variables plot
figure(2);
legendNames = {};
if eulerFlag
    plot(t, FEn);
    hold on;
    plot(t, FEm);
    hold on;
    plot(t, FEh);
    hold on;
    legendNames = [legendNames, 
        {'Forward Euler n', 'Forward Euler m', 'Forward Euler h'}];
end
if ode45Flag
    plot(t, ODn);
    hold on;
    plot(t, ODm);
    hold on;
    plot(t, ODh);
    hold on;
    legendNames = [legendNames, 
        {'ODE45 n'}, {'ODE45 m'}, {'ODE45 h'}];
end
if rungeFlag
    plot(t, RKn);
    hold on;
    plot(t, RKm);
    hold on;
    plot(t, RKh);
    hold on;
    legendNames = [legendNames, 
        {'Runge-Kutta n'}, {'Runge-Kutta m'}, {'Runge-Kutta h'}];
end
title('Gating Variables');
xlabel('Time (ms)');
ylabel('Gating Variable');
legendNames = [legendNames(:)];
legend(legendNames);


%% Find biggest differences in Voltage

% Initialize variables
largestDiff = -inf;
arraysDiff = [-1, -1];
index = 0;

if eulerFlag && ode45Flag
    for i = 1:length(FEV)
        diff = abs(FEV(i) - ODV(i));
        if diff > largestDiff
            largestDiff = diff;
            arraysDiff = 'Euler / ODE45';
            index = i;
        end
    end
end

if eulerFlag && rungeFlag
    for i = 1:length(FEV)
        diff = abs(FEV(i) - RKV(i));
        if diff > largestDiff
            largestDiff = diff;
            arraysDiff = 'Euler / Runge-Kutta';
            index = i;
        end
    end
end

if ode45Flag && rungeFlag
    for i = 1:length(ODV)
        diff = abs(ODV(i) - RKV(i));
        if diff > largestDiff
            largestDiff = diff;
            arraysDiff = 'ODE45 / Runge-Kutta';
            index = i;
        end
    end
end

disp('Biggest Voltage Difference (in ms and mV): ');
timeWithLargestDifference = t(index)
largestDiff

clear