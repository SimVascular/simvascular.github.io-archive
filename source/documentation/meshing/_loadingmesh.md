## Unloading/Loading Mesh Data

Sometimes a created mesh (especially volume mesh) occupies very large amount of computer memory. In this case, after you save the mesh, you can unload the mesh data from a mesh to save memory while the mesh node is still in Data Manager.

With the same concern, when you open an existing SV project, mesh nodes are listed in Data Manager while the mesh data are not loaded for them.

To unload or load mesh data:

	Right click a mesh node in Data Manager
	Click "Load/Unload Surface Mesh" : load surface mesh if it has no mesh data; or unload both surface/volume mesh if it already has mesh data
	Click "Load/Unload Volume Mesh" : load both volume/surface mesh if it has no mesh data; or unload volume mesh if it already has volume mesh

	
 
