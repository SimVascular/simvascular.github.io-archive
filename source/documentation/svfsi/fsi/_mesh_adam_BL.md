## Creating the mesh for ALE simulations

To run an FSI simulation we need a mesh for both the structural domain and the fluid domain. These two meshes must have their interface nodes coincide exactly in order to satisfy the interfacial conditions that result from conservation of mass and momentum. The coincident nodes of the fluid mesh are mapped onto the corresponding nodes on the structural mesh and the solution of velocity, displacement, pressure, etc. are treated as equal in the structural and fluid domains.

The fluid domain geometry for patient-specific anatomies are generated using the usual [SimVascular modeling pipeline](http://simvascular.github.io/docsModelGuide.html). To create the geometry for the structural domain, we will make use of the [boundary layer meshing feature](https://simvascular.github.io/docsMeshing.html#tetgenboundarylayer) in the `Meshing` module. The usual case for boundary layer meshing involves extruding this thin layer of elements *inwards*, starting from the walls and going into the direction of the vessel centers. To make a wall mesh, we will instead use the boundary layer meshing feature to extrude elements *outwards* to effectively make a new mesh with a specified thickness that surrounds our fluid domain. This new mesh will form the geometry of our structural domain.

Before we use the boundary layer meshing to extrude outwards, it is extremely important that we thoroughly smooth our model. The outward extrusion of elements has the potential to cause some elements to extrude into each other and overlap, which will cause the extrusion to fail. This is especially true at bifurcations, where the extruded elements from the two daughter branches could easily run into each other near the junction if not properly smoothed. We will therefore make thorough use of the local smoothing tools in the Models module before meshing. Below is an example of a bifurcation that would normally occur after lofting segmentations together without smoothing. If we try to extrude a boundary layer mesh from this, the elements at the sharp corner will intersect with each other and cause it to fail.

<figure>
  <img class="svImg svImgSm" src="documentation/svfsi/fsi/imgs/sharp_bifurcation.png" style="width:100%;height:auto;max-width: 30vw;">
  <figcaption class="svCaption" >Sharp bifurcation that will cause problems with wall mesh extrusion.</figcaption>
</figure>

After creating your model from the Segmentations, you should see a list of all the surfaces in your model in the "Face List" section. The first thing we should do is remesh the entire surface to aid in the surface smoothing. Click on the "Global Ops" menu to the right of the "Face List", then click on the "Remesh" option to open up the remeshing tool. Click "Estimate Size" to choose an appropriate size for your model, then hit "Remesh" beneath the selected size. This should remesh the surface with triangles that should all be approximately the same size.

<figure>
  <img class="svImg svImgMd" src="documentation/svfsi/fsi/imgs/global_remeshing.png" style="width:100%;height:auto;max-width: 30vw;">
  <figcaption class="svCaption" >Remeshing in the Global Ops tab.</figcaption>
</figure>

Now that we have remeshed our entire outer surface, we can start to smooth the walls. We only want to smooth the walls and leave the caps alone, so we will make use of the smoothing tools in the "Local Ops" tab. Use Ctrl + click to select all the "wall" surfaces in your model from the Face List, then click "Local Ops" to reveal the list of local operations. We will make use of the "Decimation" and "Cstr. Smooth" tools to perform our smoothing. Decimation will smooth the outer surface of the model by reducing the amount of surface triangles, while Cstr. Smooth will attempt to fillet over any sharp angles in the model while retaining the overall volume. Using these tools in tandem will iteratively smooth the model.

Before starting, check to confirm that all of the wall surfaces are selected in the "Face List" and none of the caps are selected. Now click the "Decimation" to open the Decimation menu, then click "Decimate Local" to decimate using the default settings.

<figure>
  <img class="svImg svImgSm" src="documentation/svfsi/fsi/imgs/deimation_pic.png"style="width:100%;height:auto;max-width: 30vw;">
  <figcaption class="svCaption" >Local decimation.</figcaption>
</figure>

Now, click "Cstr. Local" to open up the constrained smoothing menu, then click "Smooth Local" to perform smoothing with the default settings. You should notice your model is a little smoother at the junctions.

<figure>
  <img class="svImg svImgSm" src="documentation/svfsi/fsi/imgs/constrained_smooth_pic.png"style="width:100%;height:auto;max-width: 30vw;">
  <figcaption class="svCaption" >Local constrained smoothing.</figcaption>
</figure>

Repeat this cycle of Decimation and Constrained Smoothing several times to achieve a smoothed model. We recommend at least 10 repetitions of decimation and constrained smoothing. Repeated use of the Decimation feature will sometimes cause the surface of your model to lose so many triangles that the surface loses many of its key geometrical features. It is thus recommended to do a global remeshing every 5 decimations to ensure adequate surface accuracy. Once you are done smoothing, your bifurcations should be sufficiently smoothed and look something like this.

<figure>
  <img class="svImg svImgSm" src="documentation/svfsi/fsi/imgs/smooth_bifurcation.png" style="width:100%;height:auto;max-width: 30vw;">
  <figcaption class="svCaption" >Smooth bifurcation.</figcaption>
</figure>

Now that we have a smoothed model, we can open the "Meshes" module. Right-click on "Meshes" in the SV Data Manager and click "Create Mesh". A new window will pop up asking you which model you would like to mesh, which meshing package to use, and the mesh name. Select the model you just smoothed in the previous step, select TetGen for the meshing package, and choose a name. You may leave the name section blank and SV will use the same name as your model. Once you have made these selections, the "SV Meshing" window should open and look like the image below.

<figure>
  <img class="svImg svImgMd" src="documentation/svfsi/fsi/imgs/meshing_window.png" style="width:100%;height:auto;max-width: 30vw;">
  <figcaption class="svCaption" >SV Meshing.</figcaption>
</figure>

We must first select an appropriate "Global Max Edge Size" for our model. This edge size will determine the thickness of our wall mesh. We will remesh the volume of the fluid and solid domains later, so select the edge size to be *double* what your desired thickness is. We select this to be double to cut down the meshing time. If you are not sure how to select the thickness of your model, choosing a thickness that is 10% of the mean radius in your model is a reasonable assumption used throughout the literature. Below the edge size selection, you should see a box to select boundary layer meshing. First, click the checkbox next to "Boundary Layer Meshing" to turn it on. Below this, you should notice three spaces to select parameters of the boundary layer meshing. Since we are producing this boundary layer for the wall mesh, we can use the same settings for these. "Portion Edge Size" determine the overall thickness of our boundary layer mesh, as a fraction of the "Global Max Edge Size" selected above. Since we selected a "Global Max Edge Size" to be double our desired thickness, we want this parameter to be 0.5. Next, you will have to choose the "Number of Layers" in your boundary layer mesh. Increasing this number will increase the accuracy of your structural domain calculations but also increase the number of elements and thus increase your cost. A reasonable number for this parameter is 2. Last, we must select the "Layer Decreasing Ratio", which is a parameter that allows subsequent layers to be a smaller size than the one before it. Since this parameter does not matter too much for creating a wall mesh, we can select this to be 1.0 to make it so all our layers are the same size.

Below these parameter are three checkboxes. The "Extrude Boundary Layer Inward from Wall" checkbox will extrude the boundary layer mesh inwards if selected. Since we want to extrude the boundary layer mesh *outwards*, we will uncheck this box. The next box is a setting for "Use Constant Boundary Layer Thickness", which will attempt to make the entire boundary layer the same thickness if selected. We recommend leaving this box unchecked so the boundary layer mesh can adaptively change thickness in areas of tricky geometry. The last checkbox, "Convert Boundary Layer to New Region/Domain", is very important. We want to check this so that we will have a way to separate the fluid and structural domains later.

Now, you are ready to run the mesher. Click "Run Mesher" near the top right of the "SV Meshing" window to run the mesher. If the meshing was successful, you should see a window pop up to inform you of the statistics of your mesh. If the meshing was unsuccessful, it is likely that your model may need to be smoothed more to avoid intersecting elements. Once you are successful in producing this boundary layer mesh, right-click it from the SV Data Manager, and click "Export Mesh-Complete" and choose a location to send the mesh.

Navigating to the location where you saved the mesh-complete, you should see that SimVascular has produced two folders. One folder contains the mesh for the fluid part (i.e. domain-1) and the other folder contains the mesh for the structural part of your domain (i.e. domain-2). These two folders are the inputs that are needed in the next step, which is setting up the simulation. We need to do one extra step in this phase before launching the svFSI plugin. If you go into the mesh-complete folder for the fluid domain, you should notice that there is a file called "walls_combined.vtp". We will need to copy this file into the "mesh-surfaces" folder. Now go into the "mesh-surfaces" folder, and you should notice that there are many "wall"faces. We need to move these out of this folder. Select all of the "wall" faces, EXCEPT for "walls_combined.vtp" and move them to the parent folder. The walls_combined file will contain all the information from the other walls, but combined into 1 file to make assigning boundary conditions easier. In the end, your mesh-surfaces folder should contain .vtp files for each of the caps and the walls_combined.vtp. An example with an aorta model is shown below:

<figure>
  <img class="svImg svImgMd" src="documentation/svfsi/fsi/imgs/fluid_mesh_surfaces.png" style="width:100%;height:auto;max-width: 30vw;">
  <figcaption class="svCaption" >mesh-surfaces folder for the fluid domain.</figcaption>
</figure>

Now exit from this folder, and enter the mesh-complete folder for the structural domain (i.e. domain-2). Inside this folder, you should notice two walls_combined (region_0 and region_1). We will need to copy both of these into the mesh-surfaces folder. The region_0 file is the .vtp which designates the interface between the solid and fluid domains, while region_1 is the outer wall. Navigate into the mesh-surfaces folder, and like we did in the fluid domain, remove all wall files EXCEPT for the two walls_combined files that we just put in here. Once you are done, your mesh-surfaces folder for the structural domain should look like below, where there is a surface for each cap in the model and the two walls_combined.

<figure>
  <img class="svImg svImgMd" src="documentation/svfsi/fsi/imgs/solid_mesh_surfaces.png" style="width:100%;height:auto;max-width: 30vw;">
  <figcaption class="svCaption" >mesh-surfaces folder for the solid domain.</figcaption>
</figure>
