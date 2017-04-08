### Meshing Using TetGen

	Tab: TetGen → Mesh Options
	File: <project folder>/demo.vtp
	Set maximum edge size for equilateral tetrahedron: 0.3
	Click “Run Mesher (Internal)”

<figure>
  <img class="svImg svImgXl" src="documentation/userguide/imgs/meshing/tetgen1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Now the mesh is created for the model as below.

<figure>
  <img class="svImg svImgXl" src="documentation/userguide/imgs/meshing/tetgen2.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

To output mesh data files (later used for simulation):

	Click “Write Files”

All mesh data files are in the folder *mesh-complete* under the project folder *demo*.

<font color="red">**HELPFUL HINT:** </font>  You can check more details on [TetGen meshing in the Meshing Guide](docsMeshing.html#meshSec7).  

