### Prerequisite Files for svSolver

Besides bct.dat, geombc.dat.1,restart.0.1 and numstart.dat, we are only missing one file in order to be able to run our analysis. This file is another input file for the solver that controls the actual flow of the numerical simulation, specifying parameters such as time step size, number of time steps, number of nonlinear iterations, boundary condition control, etc. This file needs to have the name **solver.inp** (input file for the solver), and we will characterize it in detail in the following section. A detailed description is also presented in [this section](#solverSec72).

These five files are the bare minimum we need to run an analysis. However, if we want to perform more complicated simulations, involving more complex boundary conditions, we will need more input files.

#### Impedance Boundary Condition simulations :

In addition to the five standard files (geombc.dat.1, restart.0.1, numstart.dat, bct.dat, solver.inp), we will need to provide impedance functions in the time domain for each impedance outlet, as well as a history of flow rates for each outlet. We will have therefore two additional ascii files: **impt.dat** (containing the impedance functions for each of the outlets), and **Qhistor.dat** (containing the flow rate history). A detailed description is [here](#solverSec73).

#### RCR Boundary Condition simulations :

In addition to the five standard files (geombc.dat.1, restart.0.1, numstart.dat, bct.dat, solver.inp), we will need to provide the RCR parameters in a ascii file that will set the relationship between flow and pressure on each outflow face. This is done by defining a file named **rcrt.dat** containing such parameters. A detailed description is [here](#solverSec74).

#### Coronary Boundary Condition simulations :

In addition to the five standard files (geombc.dat.1, restart.0.1, numstart.dat, bct.dat, solver.inp), we will need to provide the coronary model parameters in a ascii file that will set the relationship between flow and pressure on each outflow face. This is done by defining a file named **cort.dat** containing such parameters. A detailed description is [here](#solverSec75).

#### Closed-loop boundary conditions: 

This will required an executable that implements a lumped parameter network model for the patient circulation. This will be covered in a later version of this tutorial. Stay tuned!

We have completed the section on preprocessing the model. Let’s move on to **svSolver**, define the solver.inp file and run the analysis.

