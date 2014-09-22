### TetGen Meshing for Discrete PolyDatas(.vtk,.vtp,.stl)

#### About TetGen
TetGen is an open source mesh generation software developed by Hang Si through WIAS in Berlin. TetGen is a tetrahedral mesh generator that uses 3D Delaunay Triangulation.
**More about TetGen**

#### TetGen Interface

The TetGen tab includes all of the the operations to run an open source using a discrete polydata. The interface for TetGen includes three tabs:

<figure>
<img class="meshGuideFigure" src="documentation/meshing/img/TetGen_Tabs.png" width="60%">
</figure>

1. Mesh Options: This is for basic meshing parameters involving surface and volumetric meshing.
2. Advanced Mesh Options: This is for advanced meshing techniques like spherical refinement and boundary layer meshing.
3. Adapt: This is for isotropic adaptive meshing.

#### Mesh Options Tab

The Mesh Options Tab has all the components to create a simple mesh.
<figure>
<img class="meshGuideFigure" src="documentation/meshing/img/TetGen_Mesh_Options_Labelled.png" width="60%">
</figure>

Button or Widget Functionality:

1.  Change the Meshing Kernel and Solid Model Kernel. In order to use TetGen, the TetGen kernel must be selected, and the PolyData kernel must also be selected.
2.  Load the solid model to be meshed. You can browse for the file and then the solid will be automatically loaded.
3.  Specify the TetGen meshing parameters. These parameters apply ONLY to the volumetric meshing operation.
	* a - Apply a mesh size. TetGen applies a maximum tetrahedron volume constraint. The value here is an edge size (a). The volume is then computed from this as a tetrahedron with equilateral sides. (i.e. $$ V = (a^3)/(6*sqrt(2)) $$)
	* O - 
	* q - Specify a quality measure for the mesh. This number corresponds to the ratio between the radius of the circumsphere of an element and the maximum edge size (See below for figure). This number can be anywhere from 2.0 to 1.1, and a lower number corresponds to a higher quality element. A mesh with a quality ratio 1.0 is not attainable and the mesher will run infinitely.  
	* T - Apply a tolerance to check whether a point lies on the surface or not (Default is 10^-8).
	* Y - Preserve the exact surface mesh. If this parameter is used without a surface remeshing, make sure a mesh size that corresponds to the surface mesh is applied.
	* M - Do not merge facets that are coplanar or have very close vertices.
	* d - Detect for intersecting facets. This can be helpful if there are regions with close facets.  
	* C - Check the consistency of the final mesh.
	* Q - Output nothing to the terminal except for errors.
	* V - Print out more detailed information from TetGen. This information is viewable in the terminal.
	* Specify other mesh tags - The full TetGen documentation indicates other possible mesh flags. This is where those can be specified. TetGen documentation can be found here: **FILL THIS IN** 
4.  Choose the surface and volumetric meshing options. It is possible to select one of the options or both. To only do a surface remeshing, only select surface. It is possible to only do a volumetric meshing. This will only run TetGen, and it will use the current polydata surface as input to TetGen. Typically, a higher quality mesh is generated with a surface remeshing; however, there may be times where only a volume mesh is desired. To do both, obviously select both options (default):
	* Surface -  Specify whether or not to do a surface remeshing. 
	* Volume - Specify whether or not to generate a volume mesh. 
	* Run Mesher - Run the mesh generator after all options are specified.
5. Select the directory in which to place all the mesh files to be written from the mesh. These files are described in the Written Mesh Files section.

#### Advanced Mesh Options Tab

The Advanced Mesh Options Tab has the componenets to create a more advanced mesh such as a boundary layer mesh or a mesh with spherical refinement.

<figure>
<img class="meshGuideFigure" src="documentation/meshing/img/TetGen_Advanced_Mesh_Options_Labelled.png" width="60%">
</figure>

1.  Boundary Layer Meshing:
	* Use Boundary Layer: In order to use a boundary layer, this box must be checked. In addition, a boundary layer cannot be created without both the volume and surface mesh options selected in the Mesh Options Tab.
	* Portion of Edge Size: Specify the portion of the edge size give in the Mesh Options Tab to use as the size for the initial boundary layer (typically this is a value between zero and one.
	* Num Layers: Input the number of layers desired. Too many layers can cause self intersections on smaller vessels, so be careful.
	* Layer Decreasing Ratio: Specify the amount the decrease the size between successive boundary layers. This gradation factor is multiplied by the previous layer to get the thickness of the new layer. In order to decrease the layers by a factor of 2, apply a decreasing ratio of 0.5. 
2.  Refinement:
	* Sphere Refinement: In order to do spherical refinement, this box must be checked. When you check this box, the meshing solid and a sphere will appear. The sphere must be moved to set the spherical refinement! 
	* Sphere Radius: Apply a radius for the refining sphere. Enter a number into the box and hit ENTER. The sphere size will not update unless the ENTER button is pressed! (After setting the radius, make sure to adjust the refinement sphere to the correct location. The radius is set when the sphere is moved.
	* Refinement Factor: Specify the amount to refine the elements that lie within the bounds of the sphere. This factor is multiplied by the edge size given in the Mesh Options Tab to get the new size for the refined area. 

#### Adapt Tab

The Adapt Tab is used to create an adaptive mesh based on a current solution. There are two steps identified in the GUI. First, create the error file (ybar) from the solution. Then, based on this error, run the adaptor to create a mesh optimized for this solution.  

<figure>
<img class="meshGuideFigure" src="documentation/meshing/img/TetGen_Adapt_Labelled.png" width="60%">
</figure>

1.  Input and Output Directory: Select the directories where all the solution(restart) files are located. This must also be the same location where the files are output.
2.  Flow Solver File Format: Identify whether the solver files are binary or ASCII. Typically, the solver files are binary.
3.  Specify solution files and create ybar file:
	* step number: Identify the desired output step number. For example, if you would like to start a new simulation with the new mesh from step 0, input the number 0 (make sure to name the restart file in 6 correspondingly).  
	* solution file: Specify the solution file that contains the ybar information. Typically, this is saved every (n)?? steps and the last step of the simulation.
	* error file: Specify the name of the ybar file to be written containing the error information.
	* Create Error File: Create the error file from the provided solution file and written with the given name.
4.  Solid Model Type: Specify the solid model type. This should be a PolyData (.vtk) when using TetGen.
6.  Specify mesh files and output file:
	* surface mesh file: Locate the original surface mesh file created by TetGen (.vtp).
	* mesh file: Locate the original mesh file created by TetGen (.vtu).
	* adapted surface mesh file: Give a name for the surface of the adapted mesh to be saved.
	* adapted mesh file: Give a name for the adapted mesh to be saved.
	* projected solution file: Give a name for the initial solution file for a new simulation.
7.  Options:
	* Error Reduction Factor: Value multiplied by the average interpolation error in order to get a target uniform local error distribution. This should be a value between zero and one. A smaller factor will attempt to achieve a mesh with smaller error.
	* Global Min Edge Size: Specify a minimum target edge size. No edge size will be smaller than this size, even if the adaptor identifies that solution needs a edge length smaller than this.
	* Global Max Edge Size: Specify a maximum target edge size. No edge size will be larger than this size, even if the adaptor identifies that the solution does not require an edge length this small.
	* Adapt Mesh: Run the mesh Adaptor. In the end, a new mesh and new restart file will be written. Visualize the information output from the Adaptor with the file **run_adaptor.log**.

##### Adaptive Mesh

