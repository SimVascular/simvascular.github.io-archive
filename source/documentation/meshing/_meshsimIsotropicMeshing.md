## Isotropic Meshing

To generate an isotropic mesh, we either need to specify a desired number of elements or some property (e.g. maximum edge length for each element) of the mesh.  In our case, we will specify the maximum allowable edge length for a given element for the entire mesh. In the “Global Max Edge Size” field, type in the value of the max edge size desired. In this case, we an absolute mesh size of 0.1. Click on the “Run Mesher (Internal)” button. A pop-up window will ask you if you would like to continue; click “Yes”. Another Pop-up Window will ask, “Use currently selected meshing options? This will save/overwrite the meshing script file.” Click, “Yes.”

<figure>
  <img class="svImg svImgXl" src="documentation/meshing/img/MeshSim_Iso_Generation.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

When your mesh has completed, a Mesh Statistics window will pop up. This tells you the number of nodes, elements, mesh edges, and meshes faces you have generated for your mesh. Click “OK”.

<figure>
  <img class="svImg svImgXl" src="documentation/meshing/img/MeshSim_Mesh_Stats.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

If the mesh is not displayed, clear the window by selecting "Actor"→"Delete All Actors". Then click on the "Display Options" drop-down menu, and select "Meshing" → "Exterior Surface Mesh". A gold wireframe representation of your model should appear, and if you zoom in, you will be able to see the individual mesh elements.

<figure>
  <img class="svImg svImgMd" src="documentation/meshing/img/MeshSim_Isotropic.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

Now try to change the "Global Max Edge Size" value to generate a mesh with more elements. Note that as you specify lower global max edge size values, SimVasxcular will take longer to generate the mesh. The software might appear as not responding, but should still be working. 
