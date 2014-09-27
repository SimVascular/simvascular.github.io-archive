###Meshing Using TetGen

	Tab: TetGen → MeshOptions
	Meshing Kernel: TetGen
	File: <project folder>/demo.vtp
	Toggle on: –a  Set maximum tetrahedron edge size: 0.3
	Toggle on: -O  Specifies level of mesh optimization: 3
	Toggle on: -q  Minimum radius-edge ratio (quality): 1.4
	Toggle on: Surface Mesh
	Toggle on: Volume Mesh
	Click “Run Mesher (Internal)”

<figure>
<img class="userGuideFigure"  src="documentation/userguide/imgs/meshing/tetgen1.jpg" width="100%"> 
</figure>

Now the mesh is created for the model as below.

<figure>
<img class="userGuideFigure"  src="documentation/userguide/imgs/meshing/tetgen2.jpg" width="100%"> 
</figure>

To output mesh data files (later used for simulation):

	Click “Write Files”

All mesh data files are in the folder *mesh-complete* under the project folder *demo*.

<font color="red">**HELPFUL HINT:** </font>  You can check more details on [TetGen meshing in the Meshing Guide](docsMeshing.html#meshSec7).  

