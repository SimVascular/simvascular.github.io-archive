### MeshSim Meshing for Parasolid(.xmt_txt) or Discrete(.dsm) Solids

#### About MeshSim
MeshSim is a component mesher used to create high quality meshes from CAD Models. Meshing capabilities include surface and volumetric meshing, boundary layer meshing, and local meshing refinement. MeshSim is a Licensed SimVascular package and must be purchased in order to be used with the Software.

#### MeshSim Interface

The MeshSim tab includes all of the operations to run a mesh with the commercial component MeshSim. The interface for MeshSim includes five tabs:

<figure>
<img class="meshGuideFigure" src="documentation/meshing/img/MeshSim_Tabs.png" width="60%">
</figure>

1. Mesh Options (This is for basic meshing parameters involving surface and volumetric meshing)
2. Advanced Mesh Options (This is for advanced meshing techniques like local mesh refinement and boundary layer meshing)
3. Adapt (This is for anisotropic and isotropic adaptive meshing)
4. MeshSim Licenses (This is for checking and installing licenses in order to use the commerical package MeshSim)
5. DiscreteModel (This is for creating a Discrete Model (.dsm), which MeshSim can then be used to mesh when using the Discrete Kernel)

#### Mesh Options Tab

The Mesh Options Tab has all the components to create a simple mesh.
<figure>
<img class="meshGuideFigure" src="documentation/meshing/img/MeshSim_MeshOptions_Labelled.png" width="60%">
</figure>

Button or Widget Functionality:

1.  Change the Meshing Kernel. In order to use MeshSim, the MeshSim kernel must be selected.
2.  Load or save a script file (.mss). This saves the meshing parameters specified for the specific mesh. In order to run a previous mesh with the same parameters, you can just load the script file from the run.
3.  Change the Solid Model Kernel. MeshSim has the ability to mesh either a Parasolid model (.xmt_txt) or a Discrete Model (.dsm).
4.  Load the solid model to be meshed. You can browse for the file and then the solid will be automatically loaded, or you can spedify the file location of your solid model and press Load.
5.  Load a previously loaded mesh for viewing (.sms)
6.  Surface, Volume, and extended options for meshing. These options are described below.
7.  Specify a global max edge size. This edge size will be targeted for all elements and no element will have a size larger than the specified number. 
	* Absolute - is used to specify a number based on the dimensions of the model. 
	* Relative - is a number between 0 and 1. The actual mesh size will be calculated by multiplying the length of the largest edge of the coordinate-aligned bounding box of the entity by the given parameter.
8.  Specify the number of optimization passes that the mesher will take on the solid. Higher optimization will change connectivity and move vertices in order to create a higher quality mesh.
9.  Once all the meshing parameters are specified, run the MeshSim within SimVascular.
10. Select the directory in which to place all the mesh files to be written from the mesh. These files are described in the Written Mesh Files section.

#### Advanced Mesh Options Tab

The Advanced Mesh Options Tab has the componenets to create a more advanced mesh such as a boundary layer mesh or a mesh with local refinement.
<figure>
<img class="meshGuideFigure" src="documentation/meshing/img/MeshSim_AdvancedMeshOptions_Labelled.png" width="60%">
</figure>

Button or Widget Functionality:

1.  Select SETUP in order to read the face names associated with the model and display them in the menu buttons. In order to use boundary layer meshing or local mesh refinement, this button must be pressed first! Save Options saves a file with these specified advanced parameters for later. 
2.  Select Mesh Parameters for local mesh refinement
	* Type: Select absolute or relative
		- Absolute - is used to specify a number based on the dimensions of the model. 
		- Relative - is a number between 0 and 1. The actual mesh size will be calculated by multiplying the length of the largest edge of the coordinate-aligned bounding box of the entity by the given parameter.
	* Create Mesh Macro: Select the mesh edge size type and apply it to the selected part of the model (part is selected with **Face Name:**). 
		- Global Max Edge Size: Specify maximum edge size for the entire model. 
		- Global Max Curvature Size: Specify maximum curvature size for the entire model (curvature is described below).
		- Global Min Curvature Size: Specify minimum curvature size for the entire model.
		- Local Max Edge Size: Specify maximum edge size for selected part of the model. If this local edge size is coarser than the global edge size, the global edge size will be used. 
		- Local Max Curvature Size: Specify maximum curvature size for selected part of the model.
		- Local Min Curvature Size: Specify minimum curvature size for selected patt of the model. If this local curvature size is larger than the global curvature minimum, the global minimum curvature will be used.
 	* Face Name: Select the face for the certain edge size to be applied to. The different edge sizes are described in **Type:**.
	* Size: This is also used to set the global maximum edge size of the entire model.
3.
4.
5.

##### Curvature

#### Adapt Tab

The Adapt Tab has
<figure>
<img class="meshGuideFigure" src="documentation/meshing/img/MeshSim_Adapt_Labelled.png" width="60%">
</figure>



