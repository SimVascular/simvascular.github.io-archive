## Creating Data Files for Simulation

Before running simualtion, you need to create some required data files for presolver and flowsolver.

For Presolver:

- **.svpre**: script input file

For Flowsolver:

- **geombc.dat.1**: containing mesh info and boundary conditions specified in the problem, created by presolver
- **restart.0.1**: containing initial conditions for our problem, , created by presolver
- **numstart.dat**: contains a numberr **0**. This number is used by the solver to identify the restart file that should be used as initial condition.
- **bct.dat**: containing time-dependent velocity vectors at the inflow face of the model according to a prescribed flow wave coming from a \*.flow file. See [this section](#bctfile).
- **solver.inp**: providing further info for flowsolver, specifying parameters such as time step size, number of time steps, number of nonlinear iterations, boundary condition control, etc. A detailed description is  presented in [this section](#solverinp).

These five files are the bare minimum we need to run an analysis. However, if we want to perform more complicated simulations, involving more complex boundary conditions, we will need more input files.

**Impedance Boundary Condition simulations:**

In addition to the five standard files (geombc.dat.1, restart.0.1, numstart.dat, bct.dat, solver.inp), we will need to provide impedance functions in the time domain for each impedance outlet, as well as a history of flow rates for each outlet. We will have therefore two additional ascii files: **impt.dat** (containing the impedance functions for each of the outlets), and **Qhistor.dat** (containing the flow rate history). A detailed description is [here](#impbcfile).

**RCR Boundary Condition simulations:**

In addition to the five standard files (geombc.dat.1, restart.0.1, numstart.dat, bct.dat, solver.inp), we will need to provide the RCR parameters in a ascii file that will set the relationship between flow and pressure on each outflow face. This is done by defining a file named **rcrt.dat** containing such parameters. A detailed description is [here](#rcrtfile).

**Coronary Boundary Condition simulations:**

In addition to the five standard files (geombc.dat.1, restart.0.1, numstart.dat, bct.dat, solver.inp), we will need to provide the coronary model parameters in a ascii file that will set the relationship between flow and pressure on each outflow face. This is done by defining a file named **cort.dat** containing such parameters. A detailed description is [here](#cortfile).

**Closed-loop boundary conditions:**

This will required an executable that implements a lumped parameter network model for the patient circulation. This will be covered in a later version of this tutorial. Stay tuned!

<br>
**HINT**: In both files geombc.data.1 and restart.0.1, the number “.1” refers to the **partition number** of the file. Remember **svSolver** has the ability of running a problem _in parallel_ (i.e., using multiple processors or computing cores), using MPI (message-passing interface). When we run a job using multiple processors, the first thing that happens is the “splitting” of these two files into as many processors we are going to use in our analysis, so the calculations can be performed faster. For example, if we use $4$ processors later in svSolver, these files will be split as follows:

~~~
geombc.dat.1 => geombc.dat.1 , geombc.dat.2 , geombc.dat.3 , geombc.dat.4

restart.0.1 => restart.0.1 , restart.0.2 , restart.0.3 , restart.0.4
~~~

Roughly speaking, each of the four files is $1⁄4$ of the size of the original un-split file. For a generic time step **n**, the solution will be given by the following files:

~~~
restart.n.1 , restart.n.2 , restart.n.3 , restart.n.4 , ...
~~~

<br>
###Creating Data Files 

This step creates files inside the job folder in the SV project

	Choose Mesh: cylinder	
	Click the button "Create Input and Data Files in Job"

A new directory using the job name "steady" is created under the folder "Simulations" and contains the following folder/files:

	For presolver:	
		mesh-complete (folder)
		inflow.flow
		steady.svpre
	For flowsolver
		geombc.dat.1
		restart.0.1
		bct.dat (and bct.vtp)
		solver.inp
		numstart.dat

###Exporting Data Files (optional)

If you want run the simualtion in a computer cluster. You need export those data files and upload them to the computer cluster.

To export the files:

	Right click the job node "steady" in Data Manager
	Click "Export Data Files"
	Select a directory for exporting.

A new folder "steady-sim-files" is created, which includes the requied files by flowsolver



