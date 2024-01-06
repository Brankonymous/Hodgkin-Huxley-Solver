isExactSolution = true;

[Cm, dt, t, I, ENa, EK, El, gbarNa, gbarK, gbarl, V, m, n, h] = constants(isExactSolution);

y0=[V;n;m;h];

[t,V] = ode45(@HH,t,y0);

ODV=V(:,1);
ODn=V(:,2);
ODm=V(:,3);
ODh=V(:,4);

plotFlag = true;
if plotFlag
    % Define the grid for the phase portrait
    V_values = linspace(-100, 100, 100);  % Adjust these ranges as needed
    n_values = linspace(0, 1, 100);

    [V_grid, n_grid] = meshgrid(V_values, n_values);
    dVdt_grid = zeros(size(V_grid));
    dn_dt_grid = zeros(size(n_grid));

    % Compute derivatives at each grid point
    for i = 1:length(V_grid)
        for j = 1:length(n_grid)
            y_temp = [V_grid(i, j); n_grid(i, j); am(V_grid(i,j)); ah(V_grid(i,j))];
            dy = HH(0, y_temp);
            dVdt_grid(i, j) = dy(1);
            dn_dt_grid(i, j) = dy(2);
        end
    end

    % Plotting the quiver diagram
    figure;
    quiver(V_grid, n_grid, dVdt_grid, dn_dt_grid);
    xlabel('Membrane Potential V (mV)');
    ylabel('Gating Variable n');
    title('Phase Portrait of the Hodgkin-Huxley Model');
    hold on; % Keep the current plot

    % Plotting the trajectory from the ODE solution
    plot(ODV, ODn, 'k', 'LineWidth', 2);
    hold off; % Release the current plot

end

clear;