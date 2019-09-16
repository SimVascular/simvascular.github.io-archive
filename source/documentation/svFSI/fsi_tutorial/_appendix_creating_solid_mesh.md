##Create the solid domain mesh

Similar to the way we create the mesh for the fluid domain in SimVascular (see: http://simvascular.github.io/docsMeshing.html) we can now create the mesh for the solid domain.

1. Import the .stl of the structural domain geometry into SimVascular

Right-click on the "Models" button and choose "Import solid Model", then select the .stl model you just exported from Meshmixer:

<figure>
  <img class="svImg svImgLg" src="documentation/svFSI/fsi_tutorial/imgs/importing_solid_into_SV.png">
  <figcaption class="svCaption" >Importing .stl model into SimVascular.</figcaption>
</figure>

2. Extract faces, rename them if wanted

Extracting faces allows users to reference specific parts of the exterior of the model for applying boundary conditions. It is important to have separate faces that represent each of the inlet and outlet faces, the inner wall, and the outer wall.

To extract faces from your .stl, double-click on your newly imported model in the “Models” section of the left-hand menu to bring up the SV Modeling window. Then, click “Face Ops” and “Extract”. This should reveal a dialogue box asking for a “Sep. Angle”, which is a parameter that determines how aggressively to search for faces. SimVascular will check the direction of the outward facing normals in each element of the surface, and if it finds the difference in the angle between two normals to be greater than the threshold, it will assign them different faces. We recommend a value of 70 for the Sep. Angle., but this depends on the geometry of your model. After extracting faces, you should see a list of “noname” faces appear on the “Face List”. Ideally, you should have a face for each of the inlets and outlets and the inner wall and outer wall, for a total of (number of inlets and outlet) + 2. If you click a noname face from the list, it will highlight in yellow on your 3D model, and the surface area of the face will be displayed in the bottom left corner of the SimVascular Window.

Now is a good time to click each face on the list so you can confirm its location on the model, then rename it appropriately for your convenience. An example naming convention could be to call the inner wall “wall\_inner”, the outer wall “wall\_outer”, and all of the inlets and outlets as “perimeter\_X”, where X is the name of the particular vessel.

This step can be difficult as Meshmixer often produces poor quality triangles that do not extract correctly in SimVascular. You will sometimes see many more faces in the Face List than you expected. If some or all faces are not correctly detected (number of faces is not correct or not correctly distinguished between faces) you can try to use a different separation angle and/or use the merge tool in SimVascular, or improve the affected areas in meshmixer, e.g. by smoothing, sculpting or remeshing them.

This situation most likely happens due to poor quality triangles being produced on the wall surfaces from either the extrusion or remeshing. This can be addressed with the surface treatment tools within SimVascular. Use Ctrl + click to select all the surfaces in your structural model EXCEPT for the perimeter surfaces that surround your caps. Then, under the "Face Ops" tab, click the "Combine" button to combine all of these faces into one. This will allow us to apply surface treatment on all of the walls and poor triangles. We now follow the usual procedure for smoothing surfaces. Now, click "Local Ops", then "Decimation", then click "Decimate Local" to decimate some triangles on that surface. Thenm click "Cstr. Smooth", then "Smooth Local" to smooth the wall surfaces. This will hopefully eliminate all of the poor quality triangles. We now need to re-extract the inner and outer wall surfaces into separate faces. Go back to "Face Ops" then "Extract". Select an extraction angle (70 degrees is usually good) and click "Extract Faces". Hopefully now when you do this, you should see a much smaller list of faces. If the number of faces equals the number of inlets and outlets + 2, then you are in great shape.

You will want separate faces for each of the inlets and outlet perimeters, as well as a separate face for the inner wall and a separate face for the outer wall. This is so that we can apply boundary conditions on all of these faces. Clicking on each face in your Face List should highlight their locations in your structural model in yellow. Do this for each face to confirm their location and to confirm that all faces are accounted for.

<figure>
  <img class="svImg svImgLg" src="documentation/svFSI/fsi_tutorial/imgs/extracting_faces.png">
  <figcaption class="svCaption" >Extracting faces in SimVascular.</figcaption>
</figure>

3. Create the structural mesh

Right-click on “Meshes” in the Data Manager Window and select “Create mesh”, then choose the structural domain model. If you double click on the newly created mesh item, the “mesh interactor” should open up. If the surface mesh of your structural model from Meshmixer was of a good spatial resolution, and quality, you may want to toggle off the option “Surface remeshing” (this will also speed up the meshing step, especially for larger models).

<figure>
  <img class="svImg svImgLg" src="documentation/svFSI/fsi_tutorial/imgs/creating_structural_mesh.png">
  <figcaption class="svCaption" >Creating volumetric solid mesh.</figcaption>
</figure>

4. Run the mesher

This will create your solid domain mesh. Export the mesh by selecting “Export Mesh-Complete”. This will save a folder in the location of your choice that has all the mesh information. Inside this folder you will find a file called “mesh-complete.mesh.vtu” that contain the full volumetric mesh information of your model. You should also notice a folder called “mesh-surfaces” that has separate .vtp files for each of the extracted faces. Both the mesh-complete.mesh.vtu and all the .vtp mesh-surfaces are viewable in the free software Paraview.
