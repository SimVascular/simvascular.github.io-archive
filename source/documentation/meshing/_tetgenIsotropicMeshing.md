## Isotropic Meshing

To generate an isotropic mesh, we either need to specify a desired number of elements or some property (e.g. maximum edge length for each element) of the mesh.  In our case, we will specify the maximum allowable edge length for a given element for the entire mesh. We have the ability to specify our own mesh size or have SimVascular calculate a size for us. 

	Global Max Edge Size: click the button "Estimate" to let SimVascular to provide a value
	Click the button "Run Mesher"
	Click "Yes" to continue	

It may take a while fo meshing, which depends on the size of model and the estimated global max edge size. When your mesh has completed, the mesh shows in the 3D-view window of Display and a dialog pops up to show some mesh info (like the number of points, elements, faces, etc.). To see the mesh easier, hide the model temporarily.

<figure>
  <img class="svImg svImgXl" src="documentation/meshing/img/tetgen/tetgenisomesh.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

If you zoom in, you will be able to see the individual mesh elements.

<figure>
  <img class="svImg svImgSm" src="documentation/meshing/img/tetgen/tetgenisomesh2.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

Now try to change the "Global Max Edge Size" value to generate a mesh with more elements. Note that as you specify lower global max edge size values, SimVasxcular will take longer to generate the mesh. The software might appear as not responding, but should still be working. 

<font color="red">**HELPFUL HINT:** </font> There is an option for faster meshing, to use it:

	Toggle on "Fast Meshing"

It speeds up meshing with the same wall mesh, while cap mesh may not be desirable sometimes. Fast Meshing is automatically disabled if you turn on "Boundary Layer Meshing" or "Radius-Based Meshing".
 
