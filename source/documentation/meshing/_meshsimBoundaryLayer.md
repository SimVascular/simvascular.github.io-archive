## Boundary Layer Meshing

When simulating blood flow, interesting phenomenon can occur near the vessel walls.  Under laminar flow, for example, boundary layers can form with large velocity and pressure gradients near the wall.  It is advantageous to have increased mesh density in the areas of high gradients.  If a preferential flow direction is known, you can often “elongate” elements in the direction of the flow without loss of accuracy to reduce computational costs.  In the area of mesh generation applied to fluid flow, this is often referred to as boundary layer meshing.

We will now generate a boundary layer mesh from the "wall_aorta" model:

1.	Set the desired mesh edge size in the "Global Max Edge Size:" entry widget on the Mesh Options Tab. In this case, we use "0.4".  
2.	Go to the "Advanced Mesh Options" tab.
3.	Under the "Boundary Layer Meshing" header make sure that the "Type:" is set to "Relative Gradation (type 4)" and the "Growth Direction:" is set to "both."
4.	Go to the 3D viewing window and press "p" over the surface that you would like to apply the boundary layer to. This surface will be highlighted in the 3D viewing window and the Model Faces list.. 
5.	Set the desired number of layers in the "num Layers:". In this case, we use "3". 
6.	Set the gradation factor in the "Params:" entry widget. In this case, we use "0.5"  
7.	Click on the "Add Boundary Layer" button. 
8.	The “Current List of Specified Meshing Parameters” should now show the text for the desired boundary layer. Ours shows "boundaryLayer wall_aorta 4 both 3 0.5" underneath the two local refinement specifications from the previous section
9. 	Add the same boundary layer to the other surfaces that comprise the aorta wall. In our case, the other surface is "wall_R_ext_iliac".

<figure>
  <img class="svImg svImgXl" src="documentation/meshing/img/MeshSim_BoundaryLayer_Options.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

Now we will generate the mesh for the model that includes the boundary layer mesh options:

1.	Go back to the "Mesh Options" tab.
2.	Click on the "Run Mesher (Internal)" button.
3.	Click "yes" button when the "Creating a mesh can take a long time. Continue Anyway?" dialog box appears.
4.	Click "yes" button when the "Use currently selected meshing options? This will save/overwrite the meshSim script file" dialog box appears.
5.	When the meshing is finished, a dialog box appears with mesh statistics.  Once you have reviewed the meshing output, you can click on the "OK" button in the "Mesh Statistics" dialog box.

The mesh generated will have the boundary layer mesh on the specified region. Zooming in, you can see that the number of layers in the volumetric mesh is three. This boundary layer extends all the way up the length of the aorta wall. 

<figure>
  <img class="svImg svImgMd" src="documentation/meshing/img/MeshSim_BoundaryLayer_Labelled.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

 It is important to note, once again, that you have generated a volumetric mesh.  That is, the entire volume of the geometry has been filled with tetrahedral elements. Thus, the boundary layer meshing pattern that you see on the outflow face (in the figure above) continues up the entire volume of the aorta. It is difficult to visualize thousands of elements at one time, so we only visualize this refinement on the exterior surface mesh.  

