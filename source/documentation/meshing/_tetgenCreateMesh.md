### Creating a TetGen Mesh from a Solid Model ###

This exercise will assume that you have created segmentations down the aorta and common iliac artery that you can now use to create a solid model.
 
**To create a TetGen mesh (empty):**

	Right click the data node "Meshes" in the SV project in Data Manager
	Click "Create Mesh" in the popup menu
	Select Model: demo
	Mesh Type: TetGen
	Mesh Name: (use model name by default)
	Click "OK"

<figure>
  <img class="svImg svImgSm"  src="documentation/meshing/img/tetgen/createemptymesh.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

<figure>
  <img class="svImg svImgSm"  src="documentation/meshing/img/tetgen/createmeshdialog.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Now a new data node “demo” for the mesh is created under the data node "Meshes" in Data Manager. Double click the data node “demo" and the tool "SV Meshing” automatically shows up. The new mesh is empty and has no data so far. 

<figure>
  <img class="svImg svImgXl"  src="documentation/meshing/img/tetgen/emptymesh.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

