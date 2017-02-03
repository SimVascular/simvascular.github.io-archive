## Local Mesh Size Application

Often, a designer may have insight into locations of interest or regions of complex behavior and may want to locally increase the mesh density in those regions to improve the quality of the given finite element analysis results for a given number of nodes.  In this example, we will assume the ends of a model are areas of interest and want to locally increase the mesh density near these faces. In SimVascular you can specify different mesh densities on a local geometric model face. 

In this example, we are interested more in the flow in the right iliac of this model. we specify a mesh edge size of 0.1 on the right_iliac wall. We leave the global edge size unchanged.

	Toggle off "Radius-Based Meshing"
	Go to "Local Size"
	All the faces are listed in the table.
	Set loca size 0.1 for wall\_right_iliac
	Or you can use table menu to set if there are many faces to set
	Click the button "Run Mesher"
	
<figure>
  <img class="svImg svImgLg" src="documentation/meshing/img/tetgen/tetgenlocalmeshing.png">
  <figcaption class="svCaption" ></figcaption>
</figure>


