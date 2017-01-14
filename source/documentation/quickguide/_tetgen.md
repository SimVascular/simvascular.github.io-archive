### Meshing Using TetGen

With the solid model "demo" (or "demo2") ready, we are now able to create a mesh for this model using TetGen.

	Right click the data node "Meshes" in the project "SVProject" in Data Manager
	Click "Create Mesh" in the popup menu
	Select Model: demo (or demo2)
	Mesh Type: TetGen
	Mesh Name: demomesh

A new TetGen mesh "demomesh" is created under the data node "Meshes" in Data Manager. Double click the mesh data node "demomesh"and the tool "SV Meshing" shows up. The new model is empty so far. To create the actual mesh:

	Click the button "Estimate" to provide estimated value for "Global Max Edge Size"
	Use the default parameter values
	Click the button "Run Mesher"

<figure>
  <img class="svImg svImgXl"  src="documentation/quickguide/imgs/tetgenmesh.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Now the mesh is created for the model as above.

<font color="red">**HELPFUL HINT:** </font> When the data in the project change, remember to save the project by:

	Click "Save SV Projects" on the tool bar

The mesh will be saved to files inside the project folder.
