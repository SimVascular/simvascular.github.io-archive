## MeshSim Meshing for Parasolid(.xmt_txt) or Discrete(.dsm) Solids

### About MeshSim

MeshSim is a component mesher used to create high quality meshes from CAD Models. Meshing capabilities include surface and volumetric meshing, boundary layer meshing, and local meshing refinement. MeshSim is a Licensed SimVascular package and must be purchased in order to be used with the Software.

### MeshSim Interface

The MeshSim tab includes all of the operations to run a mesh with the commercial component MeshSim. The interface for MeshSim includes five tabs:

<figure>
  <img class="svImg svImgLg" src="documentation/meshing/img/MeshSim_Tabs.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

1. Mesh: This is for basic meshing parameters involving surface and volumetric meshing.
2. Advanced Mesh Options: This is for advanced meshing techniques like local mesh refinement and boundary layer meshing.
3. Adapt: This is for anisotropic and isotropic adaptive meshing.
4. MeshSim Licenses: This is for checking and installing licenses in order to use the commerical package MeshSim.
5. DiscreteModel: This is for creating a Discrete Model (.dsm), which MeshSim can then be used to mesh when using the Discrete Kernel.

### Mesh Tab

The Mesh Options Tab has all the components to create a simple mesh.

<figure>
  <img class="svImg svImgLg" src="documentation/meshing/img/MeshSim_MeshOptions.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Button or Widget Functionality:

#### Select Solid Model

	* Type: Change the Solid Model Kernel. MeshSim has the ability to mesh either a Parasolid model (.xmt_txt) or a Discrete Model (.dsm).
	* File: Load the solid model to be meshed. You can browse for the file and then the solid will be automatically loaded.

#### Script File

	* Meshsim script file: Load or save a script file (.mss). If you have run a previous mesh with the same parameters, you can just load the script file from the run. The script file saves the meshing parameters specified. 

#### Basic Options

	* Global max edge size: Specify a global max edge size. This edge size will be targeted for all elements and no element will have a size larger than the specified number. 
	* Type: Specify to use absolute or relative edge size
		Absolute - is used to specify a number based on the dimensions of the model. 
		Relative - is a number between 0 and 1. The actual mesh size will be calculated by multiplying the length of the largest edge of the coordinate-aligned bounding box of the entity by the given parameter.

#### Load/Create Mesh

	* Run Mesher: Once all the meshing parameters are specified, run MeshSim within SimVascular.
	* Load Mesh: Load a previously created mesh for viewing in SimVascular.

#### Write Files

	* mesh complete dir: Select the directory in which to place all the mesh files to be written from the mesh. These files are described in the Written Mesh Files of the documentation.

### Advanced Mesh Options Tab

The Advanced Mesh Options Tab has the componenets to create a more advanced mesh such as a boundary layer mesh or a mesh with local refinement.

<figure>
  <img class="svImg svImgLg" src="documentation/meshing/img/MeshSim_AdvancedMeshOptions.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

Button or Widget Functionality:

#### Meshing Specified by Face

To add local size meshing and boundary layer meshing, select a face in the 3D viewing window by holding the cursor over the object and pressing "p". Then follow the steps below to add the features.

##### Local Size and Curvature
	* Type: Select the mesh edge size type and apply it to the selected part of the model. 
		- Local Max Edge Size: Specify maximum edge size for selected part of the model. If this local edge size is coarser than the global edge size, the global edge size will be used. 
		- Local Max Curvature Size: Specify maximum curvature size for selected part of the model. See **Curvature** section below for description.
		- Local Min Curvature Size: Specify minimum curvature size for selected patt of the model. If this local curvature size is larger than the global curvature minimum, the global minimum curvature will be used.
	* Size Type: Select absolute or relative
		- Absolute - is used to specify a number based on the dimensions of the model. 
		- Relative - is a number between 0 and 1. The actual mesh size will be calculated by multiplying the length of the largest edge of the coordinate-aligned bounding box of the entity by the given parameter.
	* Size: Enter the desired global or local mesh edge size.
	* Add Face Meshing: Create the macro for setting a local or global edge size (can be viewed by expanding the Meshing Parameters pane at the bottom of the tab).

##### Boundary Layer Meshing 
There are found different types of boundary layer meshing and can be applied on selected parts of the model.

	* Type: Select one of the options from the dropdown menu
		- Geometric Growth of Layer Thickness: Apply a gradation factor based on initial layer thickness and number of desired layers. In the **Params:** box, specify the following.
			- Params: |First Layer Height| |Total Height| 
		- Relative Height Gradation (type 2): Prescribe the initial layer thickness and a gradation factor (i.e. to increase the next layer size by a factor of 2, apply a gradation factor of 0.5).
			- Params: |First Layer Height| |Gradation Factor (0<g<1)|
		- User Specified Heights: Specify the number of layers desired and apply a height for every individual layer. Each layer thickness is designated with the letter *t* and *n* is the number of layers.
			- Params: |t<sub>0</sub>| |t<sub>1</sub>| ... |t<sub>n-1</sub>|
		- Relative Height Gradation (specify gradation factor): Apply only a gradation factor. The initial layer height will then be the global or local max edge size multiplied by the gradation factor (i.e. To have an initial layer half the size of the mesh size, apply a factor of 0.5).
			- Params: |Gradation Factor(0<g<1)| 
	* Direction: Specify the direction of the boundary layer. Both will cause the boundary layer to grow in both directions from the original geometry. Negative will cause the boundary layer to go inward, and positive will cause the boundary layer to go outward.
	* num Layers: Specify the number of boundary layers. This needs to specified for every type of boundary layer meshing!
	* Size: Currently, this entry box does not have any effect. Any number placed in this box will have no effect.

#### Global Size and Curvature

<figure>
  <img class="svImg svImgLg" src="documentation/meshing/img/MeshSim_AdvancedGlobalSize.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

	* Type:
		- Global Max Edge Size: Specify maximum edge size for the entire model. 
		- Global Max Curvature Size: Specify maximum curvature size for the entire model.
		- Global Min Curvature Size: Specify minimum curvature size for the entire model.
	* Size Type: Select absolute or relative.
		- Absolute - is used to specify a number based on the dimensions of the model. 
		- Relative - is a number between 0 and 1. The actual mesh size will be calculated by multiplying the length of the largest edge of the coordinate-aligned bounding box of the entity by the given parameter.
	* Size: Specify a global max edge size.

#### Spatial Options

<figure>
  <img class="svImg svImgLg" src="documentation/meshing/img/MeshSim_AdvancedSpatialOptions.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

##### Sphere Refinement 

	* size: Specify the mesh edge size of the spherically selected area. Can be smaller or larger than the global mesh size.
	* radius: Specify the radius of the sphere bounding the elements to be refined.
	* center pt: Specify the center of the sphere bounding the elements to be refined.

##### Cylinder Refinement
	* size: Specify the mesh edge size of the cylindrically selected area. Can be smaller or larger than the global mesh size.
	* radius: Specify the radius of the circular ends of the cylinder.
	* center pt: Specify the center of the cylinder. The center of the cylinder is located along the center line of the circular ends midway along the length of the cylinder.  
	* length: Specify the length of the cylinder. The center will be midway along this length.
	* normal: Specify the direction from the center the cylinder is to be extruded (i.e. Along the x axis would be 1.0 0.0 0.0).

#### Mesh Control Options

<figure>
  <img class="svImg svImgLg" src="documentation/meshing/img/MeshSim_AdvancedMeshControlOptions.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

##### Surface Options
	* Generate Surface Mesh: Generate a surface mesh if this optiion is selected (Default ON). If this option is not selected, it will not do a surface remeshing before created a volumetric mesh.
	* Optimize Surface Mesh: Specify whether or not optimization is to be used (Default ON). Turning off optimization will result in a mesh that will not meet any specified shape metric for the mesh. 
	* Fix Surface Mesh: This currently has no functionality.
	* Constrain Surface: This also has no functionality currently.

##### Volume Options
	* Generate Volume Mesh: Generate a volume mesh if this option is selected (Default ON). If this option is not selected, it will only do a surface remeshing.
	* Optimize Volume Mesh: Specify whether or not optimization is to be used (Default ON). 
	* Smooth Volume Mesh: Specify whether or not smoothing is to be used (Default ON). The number of smoothing operations to be performed is specified by the **Num. Optimization Passes**.

#### Miscellaneous Options
	* Write Mesh Statistics: At the end of the meshing operations, display the meshing statistics in the terminal (Default OFF).

#### Optimization Passes:
	* Specify the number of optimization passes that the mesher will take on the solid. Mesh optimization consists of two operations: Optimization - changes the mesh connectivity. Smoothing - moves vertices to an optimal location. The number of optimization passes refers to the number of smoothing operations to perform (if smoothing is turned on).

#### Meshing Parameters
Displays the current macro for the specified meshing parameters. These parameters are written to the .mss script file when the mesh is run.

#### Curvature
Curvature refinement allows the mesh to be automatically refined to match the curvature of the entities in the geometric model. This allows MeshSim to automatically control the level of geometric approximation in the mesh. The value specified for curvature is a value relative to the element size. In the figure below, $*Curv Size*>d/h$. The value specified should always be less than 0.5, and typical values are in the range of 0.01 to 0.4. A smaller value corresponds to more refinement. 

<figure>
  <img class="svImg svImgLg" src="documentation/meshing/img/MeshSim_Curvature.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

### Adapt Tab

The Adapt Tab is used to create an adaptive mesh based on a current solution. There are two steps identified in the GUI. First, create the error file (ybar) from the solution. Then, based on this error, run the adaptor to create a mesh optimized for this solution.  

<figure>
  <img class="svImg svImgLg" src="documentation/meshing/img/MeshSim_Adapt.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

#### Filenames

	* solid model file: Locate the file containing the Parasolid or Discrete Solid Model that was used to create the original mesh.
	* mesh file: Locate the original mesh file created by MeshSim.
	* adapted mesh file: Give a name for the adapted mesh to be saved.
	* projected solution file: Give a name for the initial solution file for a new simulation.
	* Solid Model Type: Specify whether to use Parasolid (.xmt_txt) or Discrete Solid (.dsm) for the adaptive meshing. This should be the same as when the original mesh was created.

#### Create Error File

	* Input and Output Directory: Select the directories where all the solution(restart) files are located. This must also be the same location where the files are output.
	* Flow Solver File Format: Identify whether the solver files are binary or ASCII. Typically, the solver files are binary.
	* step number: Identify the desired output step number. For example, if you would like to start a new simulation with the new mesh from step 0, input the number 0 (make sure to name the restart file in 6 correspondingly).  
	* solution file: Specify the solution file that contains the ybar information. Typically, this is saved every (n)?? steps and the last step of the simulation.
	* error file: Specify the name of the ybar file to be written containing the error information.
	* Create Error File: Create the error file from the provided solution file and written with the given name.

#### Options

	* Error Reduction Factor: Value multiplied by the average interpolation error in order to get a target uniform local error distribution. This should be a value between zero and one. A smaller factor will attempt to achieve a mesh with smaller error.
	* Global Min Edge Size: Specify a minimum target edge size. No edge size will be smaller than this size, even if the adaptor identifies that solution needs a edge length smaller than this.
	* Global Max Edge Size: Specify a maximum target edge size. No edge size will be larger than this size, even if the adaptor identifies that the solution does not require an edge length this small.

#### Run Adaptor

	* Adapt: Run the mesh Adaptor. In the end, a new mesh and new restart file will be written. Visualize the information output from the Adaptor with the file **run_adaptor.log**.

#### Adaptive Mesh

### MeshSim Licences Tab

This tab is used to install or remove license information for the use of MeshSim (Only for Microsoft Windows).

	* Check License Keys: Check the status of the license currently.
	* Remove License Keys: Remove the current license for MeshSim.
	* Install License Keys: Install a license in order to use MeshSim for meshing.

### Discrete Model Tab

This tab is used to create a Discrete Solid Model from a a VTK. This Discrete Solid Model can then be meshed with MeshSim.

<figure>
  <img class="svImg svImgLg" src="documentation/meshing/img/MeshSim_DiscreteModel.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

#### Model Faces

	* Display the current surface model regions. When a region is selected with "p" in the viewing window, the selected surface will be highlighted in the list window.

#### Load vtkPolyData

	* Load: Browse and load a vtkPolyData surface
	* Show PolyData Surface: After loading a surface, display the surface in the 3D Viewing Window.

#### Create Solid

	* angle (degrees): Define the angle of separation on which to define feature edges and separate regions. This angle defines the minimum angle between the normals of two adjacent cells. An angle larger than the specified angle will consider the two adjacent cells part of two separate regions.
	* Create: Create the new Discrete Solid Model (.dsm) from the specified vtk file.
	* Save: Save the newly created Discrete Solid Model.




