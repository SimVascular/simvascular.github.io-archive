## Radius Based Meshing
	
When models contain surfaces of very different size scales, it is often desirable to scale the size of the mesh with the size of the vessel of the model. The following instructions describe how to apply a radius-based mesh:      

	IMPORTANT: You must have only one wall surface on your model to use this feature!!
	* Use Centerline Radius: Select this check box to base your mesh edge size on the centerline radius. This will compute the centerlines and find the distance to these centerlines prior to meshing. These values will be normalized by the smallest value and then multiplied by the global max edge size given in the "Mesh Options" tab. 
