## Local Mesh Size Application

When models contain surfaces of very different size scales, it is often desirable to specify a different mesh edge size for each surface. The following instructions describe how to apply a mesh edge size for each surface:      

	* Select a Surface: In the 3-D Window, hover over a surface in which you would like to specify a local mesh edge size, and hit "p". After highlighting a surface enter a mesh edge size and hit "Add Local Mesh Size".
	* Size: Enter a value to specify the mesh edge size on a specific surface. 
	* Add Local Mesh Size: This will update the Meshing Parameters and add the local mesh size to the surface. You can specify a different mesh edge size to each surface of the model; however, make sure that it is not too drastic of a different between surfaces as you will be left with poor quality elements at the interface. If you do not specify a local mesh size for a surface, the global mesh edge size will be used for that surface. 
