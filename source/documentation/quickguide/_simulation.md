##Simulation

Now we’ll use **SimVascular/Solver** for three-dimensional blood flow numerical simulations (solving Navier-Stokes equations in an arbitrary domain). 

With the model "demo" and the mesh "demomesh" ready, we are now able to create a job for blood flow simulation.

	Right click the data node "Simulations" in the project "SVProject" in Data Manager
	Click "Create Simulation Job" in the popup menu
	Select Model: demo
	Job Name: demojob

A new job "demojob" is created under the data node "Simulations" in Data Manager. Double click the job data node "demojob"and the tool "SV Simulation" shows up. Now we start to set parameters for the job


###Basic Parameters

Basic paramters include fluid material properties, cardiac cycle period and initial conditions. Just use the defult values.

<figure>
  <img class="svImg svImgXl"  src="documentation/quickguide/imgs/basic.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

###Inlet and Outlet Bcs

Click "Inlets and Outlet BC" and the parameter table appears. This model has one inlet "inflow\_aorta" and two outlets "outflow\_right\_iliac", "outflow\_aorta". Let's set boundary conditions for those faces.

For the inlet: inflow\_aorta, we need to prepare a file "steady.flow" first. It contains the data for the flow rate with respect to time. Here we assume the flow rate is constant.

**steady.flow**

	0.0 -100
	1.0 -100

To set BC for the inlet:

	Right click on its line (first line on the table)
	Click "Set BC" on the popup menu; a setting dialog shows
	BC Type: Prescribed Velocities
	Analytic Shape: parabolic
	Point Number: 2 (for constant flow rate, 20 for pulsatile flow rate)
	Fourier Modes: 1 (for constant flow rate, 10 for pulsatile flow rate)
	Period: optional (provide if it's different from the value in Basic Parameters)
	Click the button "..." to select the file "steady.flow for its flow rate
	Click the button "OK"

<figure>
  <img class="svImg svImgSm"  src="documentation/quickguide/imgs/inletbc.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

To set BC for the outlets (outflow\_right\_iliac, outflow\_aorta):

	Double click the column "BC Type" on the table
	Choose "Resistance"
	Double click the column "Values" on the table
	Assign 16000

<figure>
  <img class="svImg svImgSm"  src="documentation/quickguide/imgs/outletbc.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

###Wall Properties

	Type: Rigid


###Solver Parameters

There are many parameters for flow solver, but only a few is required to set explicitly. Advanced paramters are optional.

	Number of Timesteps: 100
	Time Step Size: 0.0004
	Number of Timesteps between Restarts: 10
	Step Construction : 2 # standard two iterations, enough for constant  problems.

<figure>
  <img class="svImg svImgSm"  src="documentation/quickguide/imgs/solverparameters.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>


<font color="red">**HELPFUL HINT:** </font> Step Construction together with Time Step Size and the quality of the spatial discretization given by the finite element mesh, will completely determine the performance of the linear solver of equations. The better chosen these parameters are, the faster and more accurately our simulation will run.

###Running Simulation

To run simualtion:

	Click the button "Create Data Files for Simulation"
	Number of Processes: give the number of cores you need
	Click the button "Run Simulation"

<figure>
  <img class="svImg svImgSm"  src="documentation/quickguide/imgs/runjob.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

After the simulation is completed, all the simulation result files restart.**.*\* are in the folder [proj_path]/Simulations/demojob.

<font color="red">**HELPFUL HINT:** </font>  If you choose more than one processors, for example, 8 processors are used. **SimVascular** will create a new folder *8-procs\_case* in the folder [proj_path]/Simulations/demojob. All the simulation result files restart.\*.\* are in the folder 8-procs_\_case.

(Optional) You can also export the required data files and upload to a computer cluster to run the simulation.

To export the files:

	Right click on the job node "demojob" in Data Manager
	Click "Export Data Files"
	Select a directory

A folder "demojob-sim-files" is created, which contains the exported data files to run the simulation.

###Convert Results

To convert the simulation result files to .vtp and .vtu files, which we can use to show the results in ParaView.

	Result Dir:  [proj_path]/Simulations/demojob/*8-procs_\_case* or Click the button "..." to select a directory
	Start: 10
	Stop: 100
	Increment: 10
	Click the button "Convert ..."
	Select a directory for exporting (in this example: [proj_path]/Simulations/demojob/)

<figure>
  <img class="svImg svImgSm"  src="documentation/quickguide/imgs/convertresults.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Since it is a steady case, only the last time step is needed. A new folder "demojob-converted-results" is created and contains the output files all\_results\_00010.vtp,..., all\_results\_00100.vtp, all\_results\_00010.vtu, ..., all\_results\_00100.vtu, average_results.vtp.

