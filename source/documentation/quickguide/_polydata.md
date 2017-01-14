###Creating a Model (with PolyData)

With the two groups of contour segmentation (aorta and right_iliac), we are now able to create a model for the aorta with two branch vessels using PolyData.

	Right click the data node "Models" in the project "SVProject" in Data Manager
	Click "Create Model" in the popup menu
	Model Type: PolyData
	Model Name: demo

A new PolyData model "demo" is created under the data node "Models" in Data Manager. Double click the model data node "demo"and the tool "SV Modeling" shows up. The new model is empty so far. To loft and create the actual model:

	Click the button "Create Model..."
	Choose and use "aorta" and "right_iliac" in the dialog
	Number of Sampling Points: 40 (optional for PolyData)
	Click the button "OK"

<figure>
  <img class="svImg svImgXl"  src="documentation/quickguide/imgs/modellofting.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

All the faces of the model are listed under “Face List” tab. Double click a face name to change it and change face type in (wall,cap).  For the inlet and outlets, we change the names as: *inflow_aorta*, *outflow\_aorta* and *outflow\_right\_iliac*. Click a face in the table and the face will highlighted in Display. To select/hightlight a face interactively from 3D view:
	
	Move the cursor on a face in 3D View
	Press key "S"

<figure>
  <img class="svImg svImgLg"  src="documentation/quickguide/imgs/highlightface.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Different colors can be assigned to those faces.

	Double click the table cell in the column "C" in the table.
	Selecte a color for the corresponding face.

<figure>
  <img class="svImg svImgLg"  src="documentation/quickguide/imgs/facecolor.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

<font color="red">**HELPFUL HINT:** </font> When the data in the project change, remember to save the project by:

	Click "Save SV Projects" on the tool bar

The model will be saved to files inside the project folder.
