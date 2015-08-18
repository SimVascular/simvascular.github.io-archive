###Running Simulation

	Create a folder "simulation" in the project folder
	Copy the five files bct.dat, numstart.dat, geombc.dat.1, restart.0.1, solver.inp to the folder "simulation"

	Tab: Simulations → Run Solver → localhost
	Click “Select Run Dir:” and choose the folder simulation
	Toggle off “Append Date and Time to Run Dir”
	Click “Select Log Dir:” and choose a log folder
	Click “whoami” and your user name is shown
	Choose the number of processors. Use 1 here.
	Click “Run Simulation” 

<figure>
  <img class="svImg svImgLg"  src="documentation/userguide/imgs/simulation/running1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Now SimVascular/Solver is running. To check the progress of simulation:

	Click the first “Start Tail” button
	Go to the tab “Console”

<figure>
  <img class="svImg svImgLg"  src="documentation/userguide/imgs/simulation/running2.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

In the console, the first column is the time step number, the second is the time used in seconds, and the third column is the nonlinear residual which gives you an idea of how accurate the solution is.

After the simulation is completed, all the simulation results files restart.*.1 are in the folder *simulation*.

<font color="red">**HELPFUL HINT:** </font>  If you choose more than one processors, for example, 4 processors are used. **SimVascular** will create a new folder *4-procs\_case* in the folder *simulation*. All the simulation result files restart.\*.\* are in the folder *4-procs\_case*.

Convert the simulation files to .vtu files, which we can use to show the results in ParaView.

	Tab: Simulations → Create VTU Files
	Select the folder simulation for the “Input Files/Dir:”
	Enter a file name for the “Output Files/Dir:”: steady.vtu
	Start: 500
	Stop: 500
	Click “Convert Files Only”

<figure>
  <img class="svImg svImgLg"  src="documentation/userguide/imgs/simulation/convertingtovtu.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Since it is a steady case, only the last time step is needed. The output file *steady.vtu* is created in the folder *simulation*.

<font color="red">**HELPFUL HINT:** </font>   You can check more details on [using SimVascualr/Solver for simulation in the svSolver Guide](docsFlowSolver.html).  