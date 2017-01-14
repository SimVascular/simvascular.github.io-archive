###Creating a Model (with OpenCASCADE or Parasolid)

With the two groups of contour segmentation (aorta and right_iliac), we are also able to create a model for the aorta with two branch vessels using OpenCASCADE or Parasolid, besides PolyData.

	Right click the data node "Models" in the project "SVProject" in Data Manager
	Click "Create Model" in the popup menu
	Model Type: OpenCASCADE (or Parasolid)
	Model Name: demo2

A new OpenCASCADE model "demo2" is created under the data node "Models" in Data Manager. Double click the model data node "demo2"and the tool "SV Modeling" shows up. The new model is empty so far. To loft and create the actual model:

	Click the button "Create Model..."
	Choose and use "aorta" and "right_iliac" in the dialog
	Number of Sampling Points: 20 (default)
	Click the button "OK"

To get smoother surface for the mode, click the button "Change Facet Size.." and give a smaller size.

<figure>
  <img class="svImg svImgLg"  src="documentation/quickguide/imgs/occtlofting.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>


To blend faces:

	Click the tab "Blend"
	Set radius for the face pair as 0.2
	Click the button "Blend Faces"

<figure>
  <img class="svImg svImgLg"  src="documentation/quickguide/imgs/occtblending.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

<font color="red">**HELPFUL HINT:** </font> When the data in the project change, remember to save the project by:

	Click "Save SV Projects" on the tool bar

The model will be saved to files inside the project folder.
