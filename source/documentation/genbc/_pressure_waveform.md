## Prescribing a pressure waveform as an inlet boundary condition 

This section of the tutorial describes how to use the GenBC framework to define a Neumann boundary condition 
as a pressure waveform at an inlet surface. 

Create a new Simulation job by right-clicking the **Simulations** item in the **Data Manager**, then click **Create New Simulation Job**. 
Select the appropriate Model from the drop down menu and give it the name **cyl_pres**. Navigate through the various tabs to set 
simulation parameters discussed in <a href="http://simvascular.github.io/docsQuickGuide.html#simulation"> Quick Guide / Simulations</a>. 
In particular, the values for **Number of Time Steps**, **Time Step Size** and **Number of Timesteps between Restarts** parameters under 
the **Solver Parameters** tab must be set.


The pressure at the inlet is obtained by interpolating the pressure waveform. 


In addition to providing a user defined fortran subroutine for GenBC, 


the presover solver script (svpre) is needed to be modified by treating the inlet as a Neunmann face (see steady_rcr.svpre). Thus, to prepare a simulation with a prescribed pressure waveform, we run the presolver with the modified presolver script to generate geombc.dat and restart.0.1 files with surfaces properly tagged. Then we complie the GenBC files (user defined Fortran files) before calling the flow solver.

Note that apart from potentially increased computational cost and numerical instability (which might be insignificant), prescribing a pressure waveform doesn't necessarily make flow simulations better agree with clinical target values. So extra adjustments are often needed in order to match target pressures and flow. Don't forget to check resulting inflow when the Nuemann BC (pre-defined pressure or a lumped parameter model defined pressure) is applied to the inlet.

