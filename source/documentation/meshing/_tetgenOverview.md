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

<figure>
<img class="meshGuideFigure" src="documentation/meshing/img/TetGen_Advanced_Mesh_Options_Labelled.png" width="60%">
</figure>

#### Adapt Tab

<figure>
<img class="meshGuideFigure" src="documentation/meshing/img/TetGen_Adapt_Labelled.png" width="60%">
</figure>



