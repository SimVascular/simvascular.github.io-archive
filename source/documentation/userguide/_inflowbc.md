###Inflow Boundary Conditions

For the boundary condition of the inlet face: *inflow_aorta*, we need to create a file *steady.flow* in the folder *flow-files* under the project folder. It contains the data for the flow rate with respect to time. Here we assume the flow rate is constant. 

***steady.flow***

	0.0 -100
	0.2 -100

The first column is time (s), the second is flow rate (cm^3/s).

Use the inflow file to create boundary condition file for the inlet.

	Tab: Simulations → Inflow BC
	Analytic Shape of Profile: parabolic
	Mesh Face File (vtk): <project folder>/mesh-complete/mesh-surfaces/inflow_aorta.vtp
	Flow Rate File: <project folder>/flow-files/steady.flow
	Period: 0.2 
	Viscosity: 0.04 g/(cm*s)
	Density: 1.06 g/cm^3
	Num of period: 1 (always 1, later use solver.inp to loop)
	Num pts in period: 2 (for constant flow rate, 20 for pulsatile flow rate)
	Num fourier modes: 1 (for constant flow rate, 10 for pulsatile flow rate)
	Click “CREATE 3-D FLOW SOLVER BC FILE” 

<figure>
  <img class="svImg svImgLg"  src="documentation/userguide/imgs/simulation/inflowbc.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

The inflow boundary condition file ***bct.dat*** is created in the project folder. 