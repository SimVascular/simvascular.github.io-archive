## Local Mesh Refinement

Often, a designer may have insight into locations of interest or regions of complex behavior and may want to locally increase the mesh density in those regions to improve the quality of the given finite element analysis results for a given number of nodes.  In this example, we will assume the ends of a model are areas of interest and want to locally increase the mesh density near these faces.  In SimVascular you can specify different mesh densities on a local geometric model face.  First, let’s review the solid model.

Go to the "Model" tab. Click on the "File Input/Output" drop-down menu and select "Read model." Select the same model that you previously selected for meshing. You should now see your solid model in the 3D window. Click on the first FaceId and continue down the list by clicking on subsequent Face Ids. Look at the "surf_name:" entry for each Face Id to remind yourself of the names that you gave each face.  Once you have reviewed the model faces you can change the "Solid Model Object:" to "None" and return to the "Meshing" tab.

We will now specify increased mesh density on the inflow and outflow faces.  Under the "Meshing" tab,

First, we will specify the mesh density for the inflow face:

1.	Under the "Global/Local Size and Curvature Mesh Parameters" header make sure that the "Size Type:" is set as "absolute" and the "Type:" is set as "Local Max Edge Size." 
2.	Select the desired face in the 3D viewing window by pressing "p". In this case, we use "Inflow".
3.	Set the desired size n the "Size" entry box. In this case, we apply a local edge size 0f "0.05". 
4.	Click on the "Add Face Meshing" button. 

At the bottom of the "Advanced Mesh Options" tab check the "Display currently selected meshing parameters" box. The "Current List of Specified Meshing Parameters" should now appear. In this case, ours displays "size inflow absolute 0.05". Note that you can edit the text in the "Current List of Specified meshing Parameters" box. This may be useful if you decide you don’t like the meshing you specified and want to delete the previous refinement text and generate a new one. You can also edit the refinement text directly on that box. 

<figure>
  <img class="svImg svImgXl" src="documentation/meshing/img/MeshSim_Local_Refinement_Options_1.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

We will now repeat this process for the outflow faces, specifying a different mesh density:

1.	Under the "local Size and Curvature Mesh Parameters" change the face name to another face name by selecting it in the viewing window with "p".
2.	Set the desired size for this face. 
3.	Click on the "Add Face Meshing" button. 
4.	The "Meshing Parameters" should now ALSO show the text "R_ext_iliac absolute 0.5" and "L_ext_iliac 0.5".

<figure>
  <img class="svImg svImgXl" src="documentation/meshing/img/MeshSim_Local_Refinement_Options_2.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

Now we will generate the mesh for the model that includes the refined mesh specifications:

1.	Go back to the "Mesh Options" tab.
2.	Make sure the model that you would like to mesh is selected as the “Solid model file:”
3.	Enter a desired "Global Max Edge Size". We use "0.2" for this case.
4.	Press the "Run Mesher (Internal)" button.
5.	Click "yes" button when the "Creating a mesh can take a long time. Continue Anyway?" dialog box appears.
6.	Click "yes" button when the "Use currently selected meshing options? This will save/overwrite the meshSim script file" dialog box appears.
7.	When the meshing is finished, a dialog box appears with mesh statistics.  Once you have reviewed the meshing output, you can click on the "OK" button in the "Mesh Statistics" dialog box.

It is important to note that you have generated a volumetric mesh.  That is, the entire volume of the cylinder geometry has been filled with tetrahedral elements.  It is difficult to visualize thousands of elements at one time, so often only the exterior surface mesh is visualized.  In the case of a pure tetrahedral mesh, the exterior surface mesh will consist of a set of triangles.  

If you don’t already see the exterior surface mesh you just created, in the 3D window go to Display Options -> Meshing and check "Exterior Surface Mesh." 
If you zoom in on the inflow face, you will see that the triangulation for that face is more refined than the rest of the vessel mesh as shown below: 

<figure>
  <img class="svImg svImgMd" src="documentation/meshing/img/MeshSim_LocalRefinement.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

