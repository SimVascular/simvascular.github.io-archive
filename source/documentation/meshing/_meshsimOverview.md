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

1.  Important buttons for running and advanced mesh! Do not skip over these buttons as they are necessary for running an advanced mesh.
	* SETUP: Select in order to read the face names associated with the model and display them in the menu buttons. In order to use boundary layer meshing or local mesh refinement, this button must be pressed first! 
	* SAVE OPTIONS: Apply the specified parameters in the macro to the current mesh. Must press this before running the advanced mesh! 
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
 	* Face Name: Select the face for the certain edge size to be applied to (different edge sizes are described in **Type:**).
	* Size: Enter the desired global or local mesh edge size.
	* Create Size/Curvature Macro: Create the macro for setting a local or global edge size (can be viewed by selecting the radio button labelled with the number 6.
3.  Boundary Layer Meshing can be applied in a few different ways and on selected parts of the model.
	* Type: Select one of the options from the dropdown menu
		- Geometric Growth of Layer Thickness: Apply a gradation factor based on initial layer thickness and number of desired layers. In the **Params:** box, specify the following.
			- Params: [First Layer Height] [Total Height] 
		- Relative Height Gradation (type 2): Prescribe the initial layer thickness and a gradation factor (i.e. to reduce the layers by a factor of 2, apply a gradation factor of 0.5).
			- Params: [First Layer Height] [Gradation Factor (0<g<1)]
		- User Specified Heights: Specify the number of layers desired and apply a height for every individual layer. Each layer thickness is designated with the letter *t* and *n* is the number of layers.
			- Params: [t<sub>0</sub>] [t<sub>1</sub>] ... [t<sub>n-1</sub>]
		- Relative Height Gradation (specify gradation factor): Apply only a gradation factor. The initial layer height will then be the global or local max edge size multiplied by the gradation factor (i.e. To have an initial layer half the size of the mesh size, apply a factor of 0.5).
			- Params: [Gradation Factor(0<g<1)] 
	* num Layers: Specify the number of boundary layers. This needs to specified for every type of boundary layer meshing!
 	* Face Name: Select the face for the boundary layer to be applied to.
	* Size: Currently, this entry box does not have any effect. Any number placed in this box will have no effect.
4.  Sphere Refinement 
	* size: Specify the mesh edge size of the spherically selected area. Can be smaller or larger than the global mesh size.
	* radius: Specify the radius of the sphere bounding the elements to be refined.
	* center pt: Specify the center of the sphere bounding the elements to be refined.
5.  Cylinder Refinement
	* size: Specify the mesh edge size of the cylindrically selected area. Can be smaller or larger than the global mesh size.
	* radius: Specify the radius of the circular ends of the cylinder.
	* center pt: Specify the center of the cylinder. The center of the cylinder is located along the center line of the circular ends midway along the length of the cylinder.  
	* length: Specify the length of the cylinder. The center will be midway along this length.
	* normal: Specify the direction from the center the cylinder is to be extruded (i.e. Along the x axis would be 1.0 0.0 0.0).
	

##### Curvature

#### Adapt Tab

The Adapt Tab has
<figure>
<img class="meshGuideFigure" src="documentation/meshing/img/MeshSim_Adapt_Labelled.png" width="60%">
</figure>



