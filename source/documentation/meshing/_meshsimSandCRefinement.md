## Spherical Refinement

When simulating blood flow, interesting phenomenon can occur around the site of vessel bifurcations. It is advantageous to have increased mesh density at and around bifurcations. In this section we will refine the mesh at the abdominal aorta and common iliac artery bifurcation using sphere refinement:

1.	Go to the "Advanced Mesh Options" tab.
2.	Under the "Sphere Refinement" header, set the desired size to in the "Size:" entry widget. We use "0.05"
3.	Set the desired radius in the "Radius" entry widget. We used "3.0". 
4.	Under the Main Display Options box make sure you are in the "Volume Properties" tab
5.	Check the L/R, P/A, I/S slice plane boxes to turn on all slices (Make sure the image data set it loaded). 
6.	Position the slices so that they intersect at a point in the center of the bifurcation as shown in the figure below. In this case, we set them to:
   	- L/R: 275
	- P/A: 42
	- I/S: 192
7.	The pixel locations of the splice planes are shown above the scale bars. Under the "Sphere Refinement" header, set the desired center point. Our center point is "1.088 3.290 -7.946", and we put this in the "center pt" entry widget. Make sure you leave a space between each value. 
                                             
<figure>
  <img class="svImg svImgXl" src="documentation/meshing/img/MeshSim_SRefinement_Options.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

8.	Click on the "Add Sphere Refinement" button. 
9.	The "Meshing Parameters" should now show the sphere refinement macro. Ours is "sphereRefinement 0.05 3.0 1.088 3.290 -7.946".

Now we will generate the mesh for the model that includes the sphere refinement specification:

1.	Go back to the "Mesh Options" tab.
2.	Click on the "Run Mesher (Internal)" button.
3.	Click "yes" button when the "Creating a mesh can take a long time. Continue Anyway?" dialog box appears.
4.	Click "yes" button when the "Use currently selected meshing options? This will save/overwrite the meshSim script file" dialog box appears.
5.	This mesh may take a couple seconds longer than the previous ones. When the meshing is finished, a dialog box appears with mesh statistics.  Once you have reviewed the meshing output, you can click on the "OK" button in the "Mesh Statistics" dialog box.

The mesh in the area around the bifurcation should now be refined as compared to the mesh for the rest of the vessel. 

<figure>
  <img class="svImg svImgMd" src="documentation/meshing/img/MeshSim_Sphere_Refinement.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

## Cylindrical Refinement

In addition to the interesting phenomenon that may occur at the site of vessel bifurcations, we may be similarly interested in blood flow phenomenon at other sites of the model, such as the site of an aneurism. To refine the mesh of sites of interest along the vessel, we can use cylindrical refinement. Cylinder refinement is very similar to spherical refinement; however for cylinder refinement we will define a "length" and a "normal" direction in addition to radius and size. In this section we will refine the mesh near the outflow face of the left common iliac artery.

<figure>
  <img class="svImg svImgXl" src="documentation/meshing/img/MeshSim_Cylinder_Refinement_Options.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

1.	Go to the "Advanced Mesh Options" tab
2.	Under the "Cylinder Refinement" header, set the desired mesh size. In this case we use "0.05" in the "Size:" entry widget
3.	Set the desired radius in the "Radius:" entry widget. We use "3.0".  
4.	Set the desired length in the "Length" entry widget. We use "5.0". 
5.	Set the normal to the desired direction. In this case, we use "0.0 0.0 1.0" . This defines the normal in the positive I/S direction.
6.	Under the Main Display Options box make sure you are in the "Volume Properties" tab
7.	Check the L/R, P/A, I/S slice plane boxes to turn on all slices. 
8.	Position the slices so that they intersect at a point in near the desired face as shown in the figure below. You can also set the image plane scale bars to:
   	- L/R: 263
	- P/A: 38
	- I/S: 242
9.	The pixel locations of the splice planes are shown above the scale bars. Under the "Cylinder Refinement" header, set the desired center point in the "center pt." entry widget. In our case, these slice plane locations correspond to  "0.151 2.490 -4.040"  Make sure you leave a space between each value. 

10.	Click on the "Create Cylinder Refinement Macro" button. 

 The "Current List of Specified Meshing Parameters" should now show the macro for cylinder refinement. The text in our case is "cylinderRefinement 0.05 3.0 5.0 0.151 2.490 -4.040 0.0 0.0 1.0".

Now we will generate the mesh for the model that includes the cylinder refinement specification:

1.	Go back to the "Mesh Options" tab.
2.	Click on the "Run Mesher (Internal)" button.
3.	Click "yes" button when the "Creating a mesh can take a long time. Continue Anyway?" dialog box appears.
4.	Click "yes" button when the "Use currently selected meshing options? This will save/overwrite the meshSim script file" dialog box appears.
5.	This mesh may take a couple seconds longer than the previous ones. When the meshing is finished, a dialog box appears with mesh statistics.  Once you have reviewed the meshing output, you can click on the "OK" button in the "Mesh Statistics" dialog box.

The mesh near the desired area should now be refined as desired as shown below:

<figure>
  <img class="svImg svImgMd" src="documentation/meshing/img/MeshSim_Cylinder_Refinement.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

You can now go back and do a full mesh combining local mesh refinement, a boundary layer, and spherical or cylindrical refinment. 

