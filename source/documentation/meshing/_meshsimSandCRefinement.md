### Spherical and Cylindrical Refinement

In addition to the interesting phenomenon that may occur at the site of vessel bifurcations, we may be similarly interested in blood flow phenomenon at other sites of the model, such as the site of an aneurism. To refine the mesh of sites of interest along the vessel, we can use cylindrical refinement. Cylinder refinement is very similar to spherical refinement; however for cylinder refinement we will define a “length” and a “normal” direction in addition to radius and size. In this section we will refine the mesh near the outflow face of the left common iliac artery.

<figure>
<img class="meshGuideFigure" src="documentation/meshing/img/MeshSim_Cylinder_Refinement.png" width="60%">
</figure>

1)	Go to the “Advanced Mesh Options” tab
2)	Under the “Cylinder Refinement” header, set the size to “0.5” in the “Size:” entry widget
3)	Set the radius to “10.0” in the “Radius:” entry widget.  This is well beyond the radius of the vessel to ensure that the vessel is enclosed within the cylinder that we are defining.
4)	Set the length to “10.0” in the “Length” entry widget. 
5)	Set the normal to “0.0 0.0 1.0” in the “normal entry widget. This defines the normal in the positive I/S direction.
6)	Under the Main Display Options box make sure you are in the “Volume Properties” tab
7)	Check the L/R, P/A, I/S slice plane boxes to turn on all slices. 
8)	Position the slices so that they intersect at a point in near the “outflow_aorta_test” face as shown in the figure below. You can also set the image plane scale bars to:
                                             L/R:       359
	P/A:	42
	I/S:	46
9)	The pixel locations of the splice planes are shown above the scale bars. Under the “Cylinder Refinement” header, set the center point to “76.859 33.8 -193.172,” in the “center pt.” entry widget. Make sure you leave a space between each value. 

10)	Click on the “Create Cylinder Refinement Macro” button. 

 The “Current List of Specified Meshing Parameters” should now show the text “cylinderRefinement 0.5 10.0 10.0 76.859 33.8 -193.172 0.0 0.0 1.0”. Click the “SAVE OPTIONS” button at the top of the “Advanced Mesh Options” tab. Uncheck the slice planes in the “Volume Properties” tab.

Now we will generate the mesh for the model that includes the cylinder refinement specification:

1.	Go back to the “Mesh Options” tab.
2.	Click on the “Run Mesher (Internal)” button.
3.	Click “yes” button when the “Creating a mesh can take a long time. Continue Anyway?” dialog box appears.
4.	Click “yes” button when the “Use currently selected meshing options? This will save/overwrite the meshSim script file” dialog box appears.
5.	This mesh may take a couple seconds longer than the previous ones. When the meshing is finished, a dialog box appears with mesh statistics.  Once you have reviewed the meshing output, you can click on the “OK” button in the “Mesh Statistics” dialog box.

The mesh near the “outflow_aorta_test” face should now be refined to a global max edge size of 0.5 as shown below:

  

You should now go back and do a size “0.5” local mesh refinement on the “outflow_right_iliac” face and boundary layer mesh refinement on the “wall_aorta_test” surface of size 0.5, with 3 layers, and with a gradation factor (“Params:”) of 0.5. 

