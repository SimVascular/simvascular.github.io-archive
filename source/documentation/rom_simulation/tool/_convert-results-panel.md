
##Convert Results
The Convert Results panel is used to convert 1D simulation results to a CSV file format. 

The simulation results directory must contain a 1D solver input file named **solver.in** and results (.dat) files. 
Simulation results are stored in the project's **Simulations1d/JOBNAME** directory.  

Results can be selectively converted for segements at vessel outlets. 

A time range start/stop values can be given to only convert results within that range. The data conversion times 
are determined by the parameter values specified in the **Solver Parameters** panel.

The 1D solver writes results for cross-section area, flow, pressure, Reynolds number (Re), and wall shear stress (wss).
Results can be selectively converted for one or more of these data.


###Panel Layout

<br>
<figure>
  <img src="documentation/rom_simulation/tool/images/convert-results-panel.png" style="float: left; width: 30%; margin-right: 1%; margin-bottom: 0.5em;">
  <p style="clear: both;">
</figure>
<br>

###Usage 

**Results Directory** - Set the directory containing the 1D simulation results to convert. The directory path can be entered in 
                        the text box. Selecting **...** brings up a file browser.

**Convert Directory** - Set the directory where converted results are written. The directory path can be entered in 
                        the text box. Selecting **...** brings up a file browser.

**Start** - Set the start time for the time range usded to convert simulation data. The time is a real simulation time value.

**Stop** - Set the stop time for the time range usded to convert simulation data. The time is a real simulation time value.

**Segements** - Set the segment type used to convert data. Select <b>Outlet</b> to convert data only for segments that have 
                an outlet boundary condition. Select <b>All</b> for converting data for all segments.

**Data** - Set the names of data to convert. 

**Convert** - Convert the 1D simulation results.


