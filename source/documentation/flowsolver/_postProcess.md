## Post-processing

### Generating the *.vip and *.vtu files in SimVascular 

In order to generate the visualization files (*.vip) and (*.vtu) files:

~~~
	Goto "Export Results"
	Result Dir: select the running dir .../Simulations/steady/8-procs_case
	Start:  the initial restart file number (0)
	Stop: the final restart file number (200)
	Increment: the increment between restart files (10). 
	Toggle on "Volume Mesh" and "Surface Mesh"
	Click the button "Export..."
	Choose a directory for exporting
~~~

A new folder "steady-converted-results" is created, which contains all the converted vtp and vtu files.

<figure>
  <img class="svImg svImgMd" src="documentation/flowsolver/imgs/convertingresults.png">
  <figcaption class="svCaption" >Creating VTU result files from <b>svSolver</b> restart files.</figcaption>
</figure>

Other options are also provided:

- **As Single File**, this options combines all the results at different time steps into a single \*.vtp or \*.vtu file. 
- **Last Step to restart.x.0**, this options combines all the resart files of the last step (200) to a single restart file restart.200.0. which can be used to start a new simulation after renamed as restart.0.1.
 
### Visualizing the results in ParaView

To visualize the time dependent results we use **ParaView**. 

- Launch **Paraview**.

- Select _File->Open..._. The _Open File_ dialog should appear. Go to the project folder , select the entry **all_results..vtu** and click **OK**.

- Under _Properties_ click **Apply**. The solid model will show up on the screen.

- At this point, you can interact with the model by rotating it using the rotation or translation buttons. Use the **Surface with Edges** option to visualize the finite element mesh.

<figure>
  <img class="svImg svImgMd" src="documentation/flowsolver/imgs/para_showEdges.png">
  <figcaption class="svCaption" >By showing edges, the finite element mesh will become apparent</figcaption>
</figure>


<figure>
  <img class="svImg svImgLg" src="documentation/flowsolver/imgs/para_CylMesh.png">
  <figcaption class="svCaption" >Visualizing the cylinder mesh in Paraview</figcaption>
</figure>

### Visualizing Pressure Results

- First you should increase your current result time from **0** to **20** (the last available time step). 

<figure>
  <img class="svImg svImgSm" src="documentation/flowsolver/imgs/para_time.png">
  <figcaption class="svCaption" >Choosing the last time step results in Paraview</figcaption>
</figure>

- You should now see the available result quantities for your model, i.e., cellsNormals, GlobalElementID, GlobalNodeID, pressure, timeDeriv, traction, velocity, WSS. 

<figure>
  <img class="svImg svImgXs" src="documentation/flowsolver/imgs/para_Results.png">
  <figcaption class="svCaption" >Available model results</figcaption>
</figure>

- Go to _Properties-Coloring_ click on **Show** and **Rescale**. The default color map of the model is showing the pressure results in dynes/cm$^{2}$. Let’s transform the pressure scale to mmHg (1 mmHg = 1333.2 dyn/cm$^{2}$). To do this, use the **calculator** filter.

- Add a calculator filter, choose pressure in the _scalars_ drop-down list and divide _pressure_ by the conversion factor 1333.2.

- Enter a meaningful name in the “Results Array Name” box (for example, Pressure in mmHg)

You should now see the following contour plot. 

<figure>
  <img class="svImg svImgLg" src="documentation/flowsolver/imgs/para_ConvertTommHg.png">
  <figcaption class="svCaption" >Final contour of pressures in mmHg</figcaption>
</figure>
