## Model Construction & Mesh Generation ##

**SimVascular** GUI provides a complete pipeline that includes model construction, mesh generation, problem configuration, input file generation, and numerical simulation. Although the model construction and mesh generation have been discussed extensively in other parts of the **SimVascular** user guides, we will go over them briefly in this subsection for the sake of completeness.

First, we create a SV Project called LV_Inflation. In cardiovascular modeling, computational models are usually generated from medical images. However, as we are using an idealized ventricular geometry here, we can directly import the model into the <code>SV Data Manager</code> by right clicking <code>Models</code> and selecting <code>Import Solid Model</code>. The solid model can be a surface mesh stored in either stl or vtp format.

<figure>
  <img class="svImg svImgMd" src="documentation/simcardio/mechanics/images/import_model.png">
  <figcaption class="svCaption" >Import solid model for mesh generation.</figcaption>
</figure>

We could name the new model LV. When asked if you would like to extract faces from the model, click yes and accept the default separation angle (50 degree). Oftentimes, the imported model is not centered in the field of view. One can right click on the model and click <code>Global Reinit</code> to recenter the geometry. Double click the model name to open the <code>SV Modeling</code> window and rename each face corresponding to its physiological interpretation (base - LV basal plane; endo - endocardium; epi - epicardium) and set each of these face types as wall. You may also change the color of each face to distinguish them in the Display window.

<figure>
  <img class="svImg svImgMd" src="documentation/simcardio/mechanics/images/faces.png">
  <figcaption class="svCaption" >Extract faces from the imported model.</figcaption>
</figure>

Next we will generate an unstructured mesh from this idealized LV model. In the <code>SV Data Manager</code>, right click <code>Meshes</code> and select <code>Create Mesh</code>. Accepting the default options will create a mesh object named LV. Double click the mesh object to open the <code>SV Meshing</code> configuration window. The most import parameter here is <code>Global Max Edge Size</code>, which controls the size of the elements. We will set this value to 2.0 and run the mesher. A relatively coarse mesh will be generated. Users can reduce the <code>Global Max Edge Size</code> if a finer mesh is desired. 

<figure>
  <img class="svImg svImgMd" src="documentation/simcardio/mechanics/images/Mesher.png">
  <figcaption class="svCaption" >Meshing configuration.</figcaption>
</figure>

To convert the generated mesh to the svFSI-ready format, right click the mesh object, LV, and select <code>Export Mesh Complete</code>.

<figure>
  <img class="svImg svImgMd" src="documentation/simcardio/mechanics/images/export_mesh.png">
  <figcaption class="svCaption" >Export the complete mesh.</figcaption>
</figure>

Open the destination folder to find the mesh files contained in a folder called &ltmesh object name&gt-mesh-complete (LV-mesh-complete in this case). In this folder, the vtu file (mesh-complete.mesh.vtu) contains the volume mesh of the ventricle. The surface (boundary) mesh files could be found in the subfolder mesh-surfaces in vtp format. This set of vtk files defines the computational domain of this problem and can be visualized in Paraview.

<figure>
  <img class="svImg svImgMd" src="documentation/simcardio/mechanics/images/mesh_folder.png">
  <figcaption class="svCaption" >Layout of the mesh folder.</figcaption>
</figure>
