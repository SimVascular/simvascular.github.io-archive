## TetGen Meshing for Discrete PolyDatas(.vtk,.vtp,.stl)

### About TetGen

TetGen is an open source mesh generation software developed by Hang Si through WIAS in Berlin. TetGen is a tetrahedral mesh generator that uses 3D Delaunay Triangulation.
Learn more about [TetGen](http://wias-berlin.de/software/tetgen/) here.

### TetGen Interface

The TetGen tab includes all of the the operations to run an open source meshing using a discrete polydata. The interface for TetGen includes three tabs:

<figure>
  <img class="svImg svImgLg" src="documentation/meshing/img/TetGen_Tabs.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

1. Mesh Options: This is for basic meshing parameters involving surface and volumetric meshing.
2. Advanced Mesh Options: This is for advanced meshing techniques like spherical refinement and boundary layer meshing.
3. Adapt: This is for isotropic adaptive meshing.

### Mesh Options Tab

The Mesh Options Tab has all the components to create a simple mesh.

<figure>
  <img class="svImg svImgLg" src="documentation/meshing/img/TetGen_Mesh_Options.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

Button or Widget Functionality:

#### Select Solid Model

	* File: Load the solid model to be meshed. You can browse for the file and then the solid will be automatically loaded. Accepted file formats include .vtk(as a polydata),.vtp,.stl, and .ply.

#### Script File

	* TetGen script file: Load or save a script file (.tgs). If you have run a previous mesh with the same parameters, you can just load the script file from the run. The script file saves the meshing parameters specified. 

#### TetGen Flags
	* Specify the TetGen meshing parameters. These parameters apply ONLY to the volumetric meshing operation.
	 - O: Specity the number of times to optomize the mesh. This moves nodes to reach a better quality mesh.
	 - q: Specify a quality measure for the mesh. This number corresponds to the ratio between the radius of the circumsphere of an element and the maximum edge size (See below for figure). This number can be anywhere from 2.0 to 1.1, and a lower number corresponds to a higher quality element. A mesh with a quality ratio 1.0 is not attainable and the mesher will run infinitely.  
	 - T: Apply a tolerance to check whether a point lies on the surface or not (Default is $10^{-8}$).
	 - Y: Preserve the exact surface mesh. If this parameter is used without a surface remeshing, make sure a mesh size that corresponds to the surface mesh is applied.
	 - M: Do not merge facets that are coplanar or have very close vertices.
	 - d: Detect for intersecting facets. This can be helpful if there are regions with close facets.  
	 - C: Check the consistency of the final mesh.
	 - Q: Output nothing to the terminal except for errors.
	 - V: Print out more detailed information from TetGen. This information is viewable in the terminal.
	 - Specify other mesh tags: The full TetGen documentation indicates other possible mesh flags. This is where those can be specified. TetGen documentation can be found here: **FILL THIS IN** 

#### Basic Options

	* Estimate Global Edge Size: Based on the areas of the surfaces on your solid, SimVascular will calculate a reasonable mesh edge size. This size is slightly smaller than what may be necessary, but start with this size and slowly increase the size for a larger mesh edge size. 
	* Set maximum edge size for equilateral triangle - Apply a mesh size. TetGen applies a maximum tetrahedron volume constraint. The value here is an edge size (a). The volume is then computed from this as a tetrahedron with equilateral sides. Volume of an equilateral tetrahedron: $V = (a^3)/(6*sqrt(2))$
	* Run Mesher: Once all the meshing parameters are specified, run TetGen within SimVascular.

#### Write Files

	* mesh complete dir: Select the directory in which to place all the mesh files to be written from the mesh. These files are described in the Written Mesh Files of the documentation.


### Advanced Mesh Options Tab

The Advanced Mesh Options Tab has the componenets to create a more advanced mesh such as a boundary layer mesh or a mesh with spherical refinement.

<figure>
  <img class="svImg svImgLg" src="documentation/meshing/img/TetGen_Advanced_Mesh_Options.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

#### Boundary Layer Meshing

	* Use Boundary Layer: In order to use a boundary layer, you must click "Select Boundary Layer Surfaces" and select all walls to be a part of the boundary layer. In addition, a boundary layer cannot be created without both the volume and surface mesh options selected in the Mesh Options Tab.
	* Portion of Edge Size: Specify the portion of the edge size in the Mesh Options Tab to use as the size for the initial boundary layer (typically this is a value between zero and one.
	* Num Layers: Input the number of layers desired. Too many layers can cause self intersections on smaller vessels, so be careful.
	* Layer Decreasing Ratio: Specify the amount the decrease the size between successive boundary layers. This gradation factor is multiplied by the previous layer to get the thickness of the new layer. In order to decrease the layers by a factor of 2, apply a decreasing ratio of 0.5. 

<font color="red">**HELPFUL HINT:** </font> If you do not select all the walls for the boundary layer, your output mesh will only contain the domain of the wall that you selected.

#### Local Size

	* Select a Surface: In the 3-D Window, hover over a surface in which you would like to specify a local mesh edge size, and hit "p". After highlighting a surface enter a mesh edge size and hit "Add Local Mesh Size".
	* Size: Enter a value to specify the mesh edge size on a specific surface. 
	* Add Local Mesh Size: This will update the Meshing Parameters and add the local mesh size to the surface. You can specify a different mesh edge size to each surface of the model; however, make sure that it is not too drastic of a different between surfaces as you will be left with poor quality elements at the interface. If you do not specify a local mesh size for a surface, the global mesh edge size will be used for that surface. 

#### Refinement

	* Sphere Refinement: In order to do spherical refinement, this box must be checked. When you check this box, the meshing solid and a sphere will appear. The sphere must be moved to set the spherical refinement! 
	* Sphere Radius: Apply a radius for the refining sphere. Enter a number into the box and hit ENTER. The sphere size will not update unless the ENTER button is pressed! (After setting the radius, make sure to adjust the refinement sphere to the correct location. The radius is set when the sphere is moved.
	* Refinement Factor: Specify the mesh edge within the desired spherical region. In this way, it is possible to specify a size larger or smaller than the edge size for the rest of the domain. 
	* Add Sphere Refinement: Once the sphere is set, select this button to update the Meshing Parameters and add the sphere refinement. You can add multiple sphere refinement regions; however, if spheres overlap, the mesh edge size in the latter sphere will be the edge size in the overlapping region. 

#### Radius-Based Meshing

	<font color="red">**IMPORTANT:** </font> You must have only one wall surface on your model to use this feature!!
	* Use Centerline Radius: Select this check box to base your mesh edge size on the centerline radius. This will compute the centerlines and find the distance to these centerlines prior to meshing. These values will be normalized by the smallest value and then multiplied by the global max edge size given in the "Mesh Options" tab. 

### Adapt Tab

The Adapt Tab is used to create an adaptive mesh based on a current solution. There are two steps identified in the GUI. First, create the error file (ybar) from the solution. Then, based on this error, run the adaptor to create a mesh optimized for this solution.  

<figure>
  <img class="svImg svImgLg" src="documentation/meshing/img/TetGen_Adapt.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

#### Filenames

	* surface mesh file: Locate the original surface mesh file created by TetGen (.vtp).
	* mesh file: Locate the original mesh file created by TetGen (.vtu).
	* adapted surface mesh file: Give a name for the surface of the adapted mesh to be saved.
	* adapted mesh file: Give a name for the adapted mesh to be saved.
	* projected solution file: Give a name for the initial solution file for a new simulation.

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

	* Adapt Mesh: Run the mesh Adaptor. In the end, a new mesh and new restart file will be written. Visualize the information output from the Adaptor with the file **run_adaptor.log**.


