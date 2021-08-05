### Creating a PolyData Model from 3D Segmentations ###

This exercise will use 3D segmentation to create a solid model.
 
**To create a PolyData model (empty):**

	Right click the data node "Models" in the SV project in Data Manager
	Click "Create Model" in the popup menu
	Model Type: PolyData
	Model Name: model_from_3dseg
	Click "OK"


Now a new data node “model_from_3dseg” for the model is created under the data node "Models" in Data Manager. Double click the data node “model_from_3dseg" and the tool "SV Modeling” automatically shows up. The new model is empty and has no data so far. 

**Use 3D segmentation to create model:**

	Click the button "Create Model..."
	A dialog pops up, showing all available groups
	Toggle on the check boxes in the column "Use" for the 3D segmentation you want
	Click "OK"

<figure>
  <img class="svImg svImgSm"  src="documentation/modeling/imgs/polydata/uniondialog_3dseg.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

After the model is created, you should now be able to see one face named as "wall-seg3d" created for the model. The model surface may be not very desirable and not have flat faces for the vessel ends. So we'll continue to process this model.

**Smooth**

	Global Ops -> WS Smooth -> Click the button "Smooth"
	Global Ops -> Densify -> Num Divisions: 1, Click the button "Subdivide"

**Trim and Fill**

	Trim -> use a plane or box to trim the vessel, try to make the cutting plane perpendicular to the vessel
	Global Ops ->  Fill Holes w/o ID

**Extract Faces**

	Face Ops -> Extract -> Click the button "Extract Faces"
	Remember to assign a type (wall or cap) for those faces

**Remesh**
If you show the model edges, the surface mesh may be too fine or not desirable to you. You can do remeshing:

	Global Ops -> Remesh -> Click "Estimate Size" or provide a proper value, click the button "Remesh"

**Extract Centerlines**

As now you have a nice model with faces extracted with type(wall/cap) info, you can extract paths (centerlines) for this model

	Right click the model "model_from_3dseg" in Data Manager
	Click "Extract Paths" in the popup menu
