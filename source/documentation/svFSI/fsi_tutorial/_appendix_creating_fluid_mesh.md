##Create the fluid domain mesh

When making the mesh for the fluid domain, we need to ensure that the nodes at the interface between the structural and fluid domains coincide. We will thus use the surface mesh of the inner wall of the solid domain that we just created in the previous step. You will find it in the exported mesh in the subdirectory “mesh-surfaces” of your exported solid mesh. If you used the suggested naming convention from the previous step, this inner wall will be named “wall_inner”.

1. Import the interfacial mesh of the solid domain by right-clicking "Models" in the SV Data Manager, then click "Import Solid Model". Select the surface representing the interface between the structural and fluid domains (i.e. the "inner wall" of your structural domain mesh). Rename it as you wish.

2. Extract the face of the solid domain interface. You should get a single face which shows the entire wall. Rename it to something convenient like “wall_lumen”.

3. Fill holes with ID's.

We now need to fill the inlet and outlet holes and name them so we can apply boundary conditions. Under the “SV Modeling” window, click the “Face Ops” button, then click the newly revealed “Fill Holes w. IDs”. This should place “noname” faces at each inlet and outlet of your fluid domain. Rename them to something convenient to remember, such as by the name of the vessel they are representing.

4. Remesh the inlets and outlets

Filling the inlet and outlet holes produced geometry on those surfaces, but it does not have a mesh appropriate for computational modeling. We thus need to remesh them. Make sure you are under the “Face Ops” tab by clicking “Face Ops” on the right side of the screen. Clicking the blue “Remesh” button should reveal the Remeshing dialogue, which asks you to select an appropriate size of the elements. The element size you select should reflect the kind of accuracy and cost you would like to use in the FSI simulation. A good starting point is to use the same size that you used for the structural domain solid mesh, though they do not have to be equal. Remesh each of the inlet and outlet faces but DO NOT remesh the wall interface. This will ensure that the nodes still coincide with the structural domain nodes after this remeshing.

<figure>
  <img class="svImg svImgLg" src="documentation/svFSI/fsi_tutorial/imgs/remesh_caps.png">
  <figcaption class="svCaption" >Remeshing inlet and outlets of fluid domain.</figcaption>
</figure>

5. Create the fluid domain mesh.

In the SimVascular DataManager right click “Meshes” and create a new mesh from the fluid model. This time, it is REQUIRED to toggle off the option “Surface mesh”. This is important, because it will keep the surface nodes exactly where they are. This way the nodes on the fluid interface will coincide with the nodes on structural interface. Choose your refinement to be consistent with the size of the elements you chose for the wall and caps, then run the mesher. Once it finishes, right-click your fluid mesh and click "Export Mesh-Complete". You are done!

<figure>
  <img class="svImg svImgLg" src="documentation/svFSI/fsi_tutorial/imgs/meshing_final_pic.png">
  <figcaption class="svCaption" >Creating fluid domain mesh.</figcaption>
</figure>

