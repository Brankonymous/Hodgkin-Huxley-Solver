%% Preprocess
add_paths();

isExactSolution = true;
eulerFlag = true;
ode45Flag = true;
rungeFlag = true;
plotSpecificModel = false;

[~, ~, t, ~] = constants(isExactSolution);


%% Run
if eulerFlag
    [FEV, FEn, FEm, FEh] = forward_euler(isExactSolution, plotSpecificModel);
end

if ode45Flag
    [ODV, ODn, ODm, ODh] = ode_45(isExactSolution, plotSpecificModel);
end

if rungeFlag
    [RKV, RKn, RKm, RKh] = runge_kutta(isExactSolution, plotSpecificModel);
end

if isExactSolution
    [ESV] = exact_solution(plotSpecificModel);
end

%% Voltage plot

figure(1);

legendNames = {};
if isExactSolution
    plot(t, ESV);
    legendNames = [legendNames, {'Exact'}];
    hold on;
end
if eulerFlag
    plot(t, FEV);
    legendNames = [legendNames, {'Forward Euler'}];
    hold on;

    if isExactSolution
        fprintf('[MAE] Euler error: %.10f\n', mean(abs(ESV - FEV)));
        fprintf('[MSE] Euler error: %.10f\n', mean(abs(ESV - FEV).^2));
        disp(' ');
    end
end
if ode45Flag
    plot(t, ODV);
    legendNames = [legendNames, {'ODE45'}];
    hold on;
    
    if isExactSolution
        fprintf('[MAE] ODE45 error: %.10f\n', mean(abs(ESV - ODV)));
        fprintf('[MSE] ODE45 error: %.10f\n', mean(abs(ESV - ODV).^2));
        disp(' ');
    end
end
if rungeFlag
    plot(t, RKV);
    legendNames = [legendNames, {'Runge-Kutta'}];
    hold on;

    if isExactSolution
        fprintf('[MAE] Runge-Kutta error: %.10f\n', mean(abs(ESV - RKV)));
        fprintf('[MSE] Runge-Kutta error: %.10f\n', mean(abs(ESV - RKV).^2));
        disp(' ');
    end
end

disp(' ');

xlabel('Time (ms)');
ylabel('Voltage (mV)');
title('Voltage Change for Hodgkin-Huxley Model');
legend(legendNames);

%% Gating variables plot
if isExactSolution == false
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
end

%% Find biggest differences in Voltage

% Initialize variables
largestDiffVoltage = -inf;
arraysDiff = [-1, -1];
index = 0;

if eulerFlag && ode45Flag
    for i = 1:length(FEV)
        diff = abs(FEV(i) - ODV(i));
        if diff > largestDiffVoltage
            largestDiffVoltage = diff;
            arraysDiff = 'Euler / ODE45';
            index = i;
        end
    end
end

if eulerFlag && rungeFlag
    for i = 1:length(FEV)
        diff = abs(FEV(i) - RKV(i));
        if diff > largestDiffVoltage
            largestDiffVoltage = diff;
            arraysDiff = 'Euler / Runge-Kutta';
            index = i;
        end
    end
end

if ode45Flag && rungeFlag
    for i = 1:length(ODV)
        diff = abs(ODV(i) - RKV(i));
        if diff > largestDiffVoltage
            largestDiffVoltage = diff;
            arraysDiff = 'ODE45 / Runge-Kutta';
            index = i;
        end
    end
end

disp('Biggest Voltage Difference in every ODE model');
largestDiffTime = t(index);

fprintf('Largest voltage difference: %.2fmV\n', largestDiffVoltage);
fprintf('Caused by models: %s\n', arraysDiff);
fprintf('Time when that difference occured: %.2fms\n', largestDiffTime);

clear