## Advanced Flags

TetGen provide more advanced flags to operate meshing. These flags apply ONLY to the volumetric meshing operation. 

<figure>
  <img class="svImg svImgSm" src="documentation/meshing/img/tetgen/tetgenflags.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

	 - O: Specity the number of times to optomize the mesh. This moves nodes to reach a better quality mesh.
	 - q: Specify a quality measure for the mesh. This number corresponds to the ratio between the radius of the circumsphere of an element and the maximum edge size (See below for figure). This number can be anywhere from 2.0 to 1.1, and a lower number corresponds to a higher quality element. A mesh with a quality ratio 1.0 is not attainable and the mesher will run infinitely.  
	 - T: Apply a tolerance to check whether a point lies on the surface or not (Default is $10^{-8}$).
	 - Y: Preserve the exact surface mesh. If this parameter is used without a surface remeshing, make sure a mesh size that corresponds to the surface mesh is applied.
	 - M: Do not merge facets that are coplanar or have very close vertices.
	 - d: Detect for intersecting facets. This can be helpful if there are regions with close facets.  
	 - C: Check the consistency of the final mesh.
	 - Q: Output nothing to the terminal except for errors.
	 - V: Print out more detailed information from TetGen. This information is viewable in the terminal.
	 - Specify other mesh tags: The full TetGen documentation indicates other possible mesh flags. This is where those can be specified.
