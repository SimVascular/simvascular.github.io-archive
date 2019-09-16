##Creating the input files and running the job

Once all of the above has been set, you can create the input files for the simulation. 

	Go to the “Create Files and Run Simulation”
	Choose Mesh: normal1_mesh	
	click the “Create Data Files for Simulation” button.

At this point, you have all the data files needed to run a coronary simulation. As a final check, ensure you have all these files in your simulation folder:

**List of coronary simulation files**
<table class="table table-bordered">
<thead>
<tr>
  <td> </td>
  <th> File name </th>
  <th> Description </th>
</tr>
</thead>
<tr>
  <td> 1. </td>
  <td> bct.dat </td>
  <td> Contains inflow information </td>
</tr>
<tr>
  <td> 2. </td>
  <td> cort.dat </td>
  <td> Coronary outlet parameters </td>
</tr>
<tr>
  <td> 3. </td>
  <td> geombc.dat.1 </td>
  <td> Contains geometry information </td>
</tr>
<tr>
  <td> 4. </td>
  <td> numstart.dat </td>
  <td> Tells solver on which timestep to start the simulation (usually 0) </td>
</tr>
<tr>
  <td> 5. </td>
  <td> rcrt.dat </td>
  <td> Aortic outlet RCR boundary condition information </td>
</tr>
<tr>
  <td> 6. </td>
  <td> restart.0.1 </td>
  <td> Contains initial conditions </td>
</tr>
<tr>
  <td> 7. </td>
  <td> solver.inp </td>
  <td> Contains global solver parameters </td>
</tr>
</table>

Once done, you can finally run the job! If your mesh is large (>200,000 elements), it is recommended you run the simulation on a cluster otherwise the simulation can take a very long time.

Once the simulation has finished, make sure to Export Results to produce the all_results.vtu and all_results.vtp file that can be viewed in Paraview.
