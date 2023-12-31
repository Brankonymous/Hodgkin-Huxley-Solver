# The Hodgkin-Huxley Model solver
Comparing ODE models for simulating Hodgkin Huxley Model in MATLAB

## Formulas
The Hodgink-Huxley model describes action potential given the following dynamical system:  
![equations](./formulas/equations.png)
![constants](./formulas/constants.png)

The <b>exact solution</b> is achieved only for voltage-independet variables, i.e. leak gates. Thus, we set sodium and potassium conductances (`gbarNa` and `gbarK`) to <b>0</b> when running ODE comparison. The exact solution is then calculated by solving a first order linear ODE:
![exact formula](./formulas/exact_solution.png)


## Numerical methods used
- Forward Euler
- Runge-Kutta
- ODE45 

## Run instructions
<b>Run `comparisons.m` or `phase_portrait.m` from root folder</b>.
<br/>
_NOTE:_ Make sure you set the desired flags at the beggining of the file in a section `%% Preprocess`.

If you want to run a <b>specific model</b>, run `add_paths.m` first and then `forward_euler.m`, `ode_45.m`, `runge_kutta.m` or `exact_solution.m` depending on your choice.
<br/>
_NOTE:_ Make sure you set the <b>function arguments</b> when calling a model. First argument is <b>exact solution</b> and second is <b>plot</b> flag.


## Results

### Without exact solution
![voltage comparison](./results/comparison_voltage_change.jpg)
![gates comparison](./results/comparison_gating_variables.jpg)
![phase portrait 30x30](./results/phase_portrait_30x30.jpg)
![phase portrait 30x30](./results/phase_portrait_100x100.jpg)

### With exact solution
![voltage comparison with exact solution](./results/comparison_voltage_change_with_exact_solution.jpg)

| Error     | Euler             | ODE45             | Runge-Kutta       |
| :---:     | :---:             | :---:             | :---:             |
| MAE       | 0.1050938840      | 0.0701103701      | 0.0701102954      |
| MSE       | 0.0301526437      | 0.0184829570      | 0.0184826558      |

_MAE = Mean Absolute Error_
<br/>
_MSE = Mean Square Error_

## Work done by
- Lea Kojičić
- Branko Grbić
