### Post-processing: **svPost**

### Generating the *.vis and *.vtu files in SimVascular 

In order to generate the visualization files (*.vis) and (*.vtu) files, you need to launch again Simvascular in the folder containing the restart files you want to post-process. Go to the _Simulations->Create VTU Files_ tab, and enter the following parameters: 

- In the **start** box, enter the initial restart file number (0)
- In the **stop** box, enter the final restart file number (100)
- In the **increment** box, enter the increment between restart files (5). These value should be equal to the quantity **Number of Timesteps between Restarts** specified in the **solver.inp** file.
- Select the folder that contains the restart files under **Input Files/Dir** and that where you want your VTU files to be written under **Output Files/Dir**. 

<figure>
  <img class="svImg svImgLg" src="documentation/flowsolver/imgs/post_VTU.png">
  <figcaption class="svCaption" >Creating VTU result files from <b>svSolver</b> restart files.</figcaption>
</figure>

The following options are also provided:

- **Volume Mesh**, 
- **Surface Mesh**,
- **Single File**, this options combines all the results at different time steps into a single \*.vtu file. 
- **Sim Units**, enter **cm** as we used **GCS** units throughout this tutorial. 

Click on the button **Convert Files Only** to generate \*.vtu files contaning the results for the whole finite element model using partitioned restart files as inputs.

### Visualizing the results in ParaView

To visualize the time dependent results we use **ParaView**. 

- Launch **Paraview**.

- Select _File->Open..._. The _Open File_ dialog should appear. Go to the folder **n-procs_case** (where **n** is the number of processors you chose when running **svSolver**), select the entry **cylinder_..vtu** and click **OK**.

<figure>
  <img class="svImg svImgLg" src="documentation/flowsolver/imgs/open_PARAVIEW.png">
  <figcaption class="svCaption" >Opening a collection of time step results in Paraview</figcaption>
</figure>

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
