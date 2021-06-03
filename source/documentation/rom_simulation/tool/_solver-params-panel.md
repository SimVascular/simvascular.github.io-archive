## Solver Parameters Panel ##
The Solver Parameters panel is used to set the parameters needed to execute the 1D Solver.

Simulation results are computed for times **Time Step Size**\*i, i = 0,1,2,...,**Number of Time Steps** but are  
only written with the frequency given by **Number of Timesteps between Saving Data**.
 
###Panel Layout
The panel GUI contains a single table listing **Time Step** and **Output Control** solver parameters.

<br>
<figure>
  <img src="documentation/rom_simulation/tool/images/solver-params-panel.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>

###Usage 
Values may be entered in the table by double clicking in the **Value** column.

**Number of Time Steps** - The number of time steps to use for the 1D simulation.

**Time Step Size** - The size of the time step to use for the 1D simulation. Time step size affects numerical error and stability.

**Number of Timesteps between Saving Data** - The number of time steps to skip when saving 1D simulation results.


