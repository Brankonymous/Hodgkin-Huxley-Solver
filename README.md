# The Hodgkin Huxley Model solver
Comparing differential equation solvers for simulating Hodgkin Huxley Model in MATLAB

## Prerequisites
Based on Hodgkin-Huxley model, certain formulas are given:

![equations](./formulas/equations.png)
![constants](./formulas/constants.png)

## Numerical methods used
- Forward Euler
- Runge-Kutta
- ODE45 

## Run instructions
Run `forward_euler.m`, `ode_45.m`, `runge_kutta.m` or `comparison.m`. Make sure to add `./utils` to path when running.

## Results
![voltage comparison](./results/comparison_voltage_change.jpg)
![gates comparison](./results/comparison_gating_variables.jpg)

## Work done by
- Lea Kojičić
- Branko Grbić