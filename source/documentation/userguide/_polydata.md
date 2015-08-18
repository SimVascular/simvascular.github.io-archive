###Creating a Model (with PolyData)

With the two groups of segmentation, we are now able to create a model for the aorta with two branch vessels using PolyData.

	Tab: Segmentation → 2D Segmentation
	Select the groups aorta and right_iliac in the group tree view
	Click the button “Model Operations → Use Surface”

	Tab: Model → PolyData → Create Model
	Use the default parameter values/options (To change lofting options, go to Segmentation → Lofting Parameters)
	Click on the “Create Pre-Op Solid Model” button
	“Model Name”: demo
	Click “File Input/Output → Save Model” to the file demo.vtp

<figure>
  <img class="svImg svImgXl"  src="documentation/userguide/imgs/modeling/polydata1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

A geometric model is created for the blood vessels.

	Click the button “Save Result”

A model file *demo.vtp* is created in the projector folder.

	Tab: Model → PolyData → Face Manipulation
	Click the button “Extract Boundaries”

<figure>
  <img class="svImg svImgXl" src="documentation/userguide/imgs/modeling/polydata2.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

All the faces of the model are listed under Face Id. 


All the faces of the model are listed under “Face Id”. You can move the cursor to a face of interest in the 3D display window and hit “p” in the keyboard, and the face will be highlighted in yellow and the corresponding face id/name is highlighted in the list under "Face Id". If our model is displayed as faces (look for the "X" under "Show Faces"), then we can also select the faces in the list and they will be highlighted on our screen. However, if our model is displayed as a full model (look for the "X" under "Show Model"), we only have one selectable surface in the 3D window which is the entire solid. We can also change the names of the faces on our model. For the inlet and outlets, we change the names as: *inflow_aorta*, *outflow\_aorta* and *outflow\_right\_iliac*.

	Tab: Model → PolyData
	Select the inlet face in the list and change color to green
	Enter inflow_aorta for surf name, and click “Set Value”

<figure>
  <img class="svImg svImgXl"  src="documentation/userguide/imgs/modeling/polydata3.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Now the inlet face name is changed to *inflow_aorta* in the list. Similarly, we change the names of the two outlet faces and the wall. As we changed the face names, we need to save the model again.

	File Input/Output → Save Model
	Save to the file demo.vtp

<figure>
  <img class="svImg svImgXl"  src="documentation/userguide/imgs/modeling/polydata4.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>
