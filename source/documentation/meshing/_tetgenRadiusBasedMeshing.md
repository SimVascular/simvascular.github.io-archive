## Radius Based Meshing
	
When models contain surfaces of very different size scales, it is often desirable to scale the size of the mesh with the size of the vessel of the model. The following instructions describe how to apply a radius-based mesh:      

	IMPORTANT: You must have only one wall surface on your model to use this feature!!
	* Use Centerline Radius: Select this check box to base your mesh edge size on the centerline radius. This will compute the centerlines and find the distance to these centerlines prior to meshing. These values will be normalized by the smallest value and then multiplied by the global max edge size given in the "Mesh Options" tab. 

In this example, we leave the Global edge size at 0.15, but we used a redius-based mesh edge size. Note that we have editted our surfaces so that we have only one wall surface!! 

<figure>
  <img class="svImg svImgXl" src="documentation/meshing/img/TetGen_Set_Radius_Based_Mesh.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

Now we will generate the mesh for the model that includes these local mesh sizes:

1.	Go back to the "Mesh Options" tab.
2.	Click on the "Run Mesher (Internal)" button.
3.	Click "yes" button when the "Creating a mesh can take a long time. Continue Anyway?" dialog box appears.
4.	Click "yes" button when the "Use currently selected meshing options? This will save/overwrite the meshSim script file" dialog box appears.
5.	When prompted, select the wall surface by pressing "p" in the 3-D window.
6.	When the meshing is finished, a dialog box appears with mesh statistics.  Once you have reviewed the meshing output, you can click on the "OK" button in the "Mesh Statistics" dialog box.

<figure>
  <img class="svImg svImgXl" src="documentation/meshing/img/TetGen_Radius_Based_Mesh.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

Note that a majority of our model has vessels of very similar size. In this case, a radius-based mesh does not do much; however, there are other models where this is a very desirable feature.
