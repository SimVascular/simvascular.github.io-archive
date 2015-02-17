## Boundary Layer Meshing

When simulating blood flow, interesting phenomenon can occur near the vessel walls.  Under laminar flow, for example, boundary layers can form with large velocity and pressure gradients near the wall.  It is advantageous to have increased mesh density in the areas of high gradients.  If a preferential flow direction is known, you can often “elongate” elements in the direction of the flow without loss of accuracy to reduce computational costs.  In the area of mesh generation applied to fluid flow, this is often referred to as boundary layer meshing.

We will now generate a boundary layer mesh from a model of an Aorta.

1. 	In the "Mesh Options" tab, load in the desired polydata that already has regions that have been named (One of these faces must be named wall!) The region named wall will be the one given a boundary layer. 
2.	Set the desired mesh edge size in the "Edge Size:" entry widget on the Mesh Options Tab. In this case, we use "0.15".  
3.	Go to the "Advanced Mesh Options" tab under the "TetGen" tab, and click "Select Boundary Layer Surfaces". Select and move to the right side all walls of the model.
4.	Set the desired size of the initial layer in the "Portion of Edge Size" entry box. In this case, we use 0.5. 
5.	Set the desired number of Layers in the "Num Layers" entry box. In this case, we use 4 layers.
6. 	Set the desired gradation factor in the "Layer Decreasing Ratio" entry box. In this case, we would like each layer to be 0.6 of the previous layer. 

<figure>
  <img class="svImg svImgXl" src="documentation/meshing/img/TetGen_Load_BoundaryLayer.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

Now we will generate the mesh for the model that includes the boundary layer specifications:

1.	Go back to the "Mesh Options" tab.
2.	Click on the "Run Mesher (Internal)" button.
3.	Click "yes" button when the "Creating a mesh can take a long time. Continue Anyway?" dialog box appears.
4.	Click "yes" button when the "Use currently selected meshing options? This will save/overwrite the meshSim script file" dialog box appears.
5.	When the meshing is finished, a dialog box appears with mesh statistics.  Once you have reviewed the meshing output, you can click on the "OK" button in the "Mesh Statistics" dialog box.

The mesh generated will have the boundary layer mesh on the specified region. Zooming in, you can see that the number of layers in the volumetric mesh is four. The boundary layer extends all the way down the length of the surface named wall, and each layer is 0.8 of the previous layer.

<figure>
  <img class="svImg svImgXl" src="documentation/meshing/img/TetGen_BoundaryLayer.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

 It is important to note, once again, that you have generated a volumetric mesh.  That is, the entire volume of the geometry has been filled with tetrahedral elements. Thus, the boundary layer meshing pattern that you see on the outflow face (in the figure above) continues up the entire volume of the aorta. It is difficult to visualize thousands of elements at one time, so we only visualize this refinement on the exterior surface mesh.  
