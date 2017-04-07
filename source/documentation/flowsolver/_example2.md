### Example 2

This example shows how to simulate a cylinder with plug steady flow at the inlet and RCR at the outlet.

Let create a new job by copying/pasting the job of Example 1.

	Right click the data node "steady" in Data Manager
	Click "Copy"
	Right click the data ndoe "Simulations" in Data Manager
	Click "Paste"
	A new data node "steady_copy" is created.
	Rename it as "steady_rcr"

Let modify some BCs and parameters.
	
	Go to "Inlet and Outlet BCs"
	Double click the row of "inflow", Analytic Type: plug
	Double click the row of "outlet", BC Type: RCR, Rp,C,Rd: 121 0.000015 1212

<figure>
  <img class="svImg scImgMd" src="documentation/flowsolver/imgs/outletrcr.png">
  <figcaption class="svCaption" > </figcaption>
</figure>

	Go to "Solver Parameters"
	Number of Timesteps: 500
	Time Step Size: 0.001
	Number of Timesteps between Restarts: 20

Similarly to Example 1, to run the job

	Go to "Create Files and Run Job"
	Choose Mesh: cylinder
	Click the button "Create Data Files for Simulation"
	Number of Processes: 8
	Staring Step Number: (leave it empty)
	Click the button "Run Job"

To export results:

	Goto "Convert Results"
	Result Dir: select the running dir .../Simulations/steady\_rcr/8-procs_case
	Start:  the initial restart file number (0)
	Stop: the final restart file number (500)
	Increment: the increment between restart files (20). 
	Toggle on "Volume Mesh" and "Surface Mesh"
	Toggle on "Last Step to restart.x.0"
	Click the button "Convert ..."
	Choose a directory for exporting

In this example, a smaller time step size is used, because the effect of the time constant in RCR type BC needs to be considered. For more accurate numerical computation, the time step size should be much smaller than the time constant (=R*C=(121+1212)*0.000015=0.02). With the small step size, the number of time steps is also increased.
