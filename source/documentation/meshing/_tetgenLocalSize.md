## Local Mesh Size Application

Often, a designer may have insight into locations of interest or regions of complex behavior and may want to locally increase the mesh density in those regions to improve the quality of the given finite element analysis results for a given number of nodes.  In this example, we will assume the ends of a model are areas of interest and want to locally increase the mesh density near these faces.  In SimVascular you can specify different mesh densities on a local geometric model face.  First, let’s review the solid model.

Go to the "Model" tab. Click on the "File Input/Output" drop-down menu and select "Read model." Select the same model that you previously selected for meshing. You should now see your solid model in the 3D window. Click on the first FaceId and continue down the list by clicking on subsequent Face Ids. Look at the "surf_name:" entry for each Face Id to remind yourself of the names that you gave each face.  Once you have reviewed the model faces you can change the "Solid Model Object:" to "None" and return to the "Meshing" tab.

	* Select a Surface: In the 3-D Window, hover over a surface in which you would like to specify a local mesh edge size, and hit "p". After highlighting a surface enter a mesh edge size and hit "Add Local Mesh Size".
	* Size: Enter a value to specify the mesh edge size on a specific surface. 
	* Add Local Mesh Size: This will update the Meshing Parameters and add the local mesh size to the surface. You can specify a different mesh edge size to each surface of the model; however, make sure that it is not too drastic of a different between surfaces as you will be left with poor quality elements at the interface. If you do not specify a local mesh size for a surface, the global mesh edge size will be used for that surface. 

In this example, we are interested more in the flow in the right iliac of this model. we specify a mesh edge size of 0.17 on the aorta wall, and a mesh edge size of 0.1 on the right_iliac wall. We leave the global edge size at 0.15 for the remainder of the surfaces.

<figure>
  <img class="svImg svImgXl" src="documentation/meshing/img/TetGen_Local_Refinement.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

Now we will generate the mesh for the model that includes these local mesh sizes:

1.	Go back to the "Mesh Options" tab.
2.	Click on the "Run Mesher (Internal)" button.
3.	Click "yes" button when the "Creating a mesh can take a long time. Continue Anyway?" dialog box appears.
4.	Click "yes" button when the "Use currently selected meshing options? This will save/overwrite the meshSim script file" dialog box appears.
5.	When the meshing is finished, a dialog box appears with mesh statistics.  Once you have reviewed the meshing output, you can click on the "OK" button in the "Mesh Statistics" dialog box.

<figure>
  <img class="svImg svImgXl" src="documentation/meshing/img/TetGen_Refinement_Mesh.png">
  <figcaption class="svCaption" ></figcaption>
</figure>
