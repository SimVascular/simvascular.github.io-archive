## Radius Based Meshing
	
When models contain surfaces of very different size scales, it is often desirable to scale the size of the mesh with the size of the vessel of the model. Radius-based mehsing will compute the centerlines and find the distance to these centerlines prior to meshing. These values will be normalized by the smallest value and then multiplied by the global max edge size given.

	Toggle on the checkbox "Radius-Based Meshing".
	Click the button "Run Mesher".

<font color="red">**WARNNING:** </font> Fast Meshing is automatically disabled if using radius based meshing. 

Note that a majority of our model has vessels of very similar size. In this case, a radius-based mesh does not do much; however, there are other models where this is a very desirable feature. The operation takes a bit long, so you can also try to change local meshing size introduced in the following section to reach the same goal. If you don't use this operation, remember to turn it off before runing mesher.
