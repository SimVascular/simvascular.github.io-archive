###Creating a Model (with PolyData)

With the two groups of segmentation, we are now able to create a model for the aorta with two branch vessels.

	Tab: PolyData → Boolean
	Click the button “Select Ordered Groups” 
	Move aorta and right_iliac from the list “Available” to “Selected” in the popup window
	Use the default parameter values/options
	Click the button “Boolean”

<figure>
  <img class="svImg svImgXl"  src="documentation/userguide/imgs/modeling/polydata1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

A geometric model is created for the blood vessels.

	Click the button “Save Result”

A model file *demo.vtp* is created in the projector folder.

	Tab: PolyData → Boundaries
	File Input/Output → Read Model 
	Choose the model file demo.vtp
	Click the button “”Extract Boundaries”

<figure>
  <img class="svImg svImgXl" src="documentation/userguide/imgs/modeling/polydata2.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

All the faces of the model are listed under Model Faces. 

<font color="red">**HELPFUL HINT:** </font>  If an error happens when reading model, go to the tab Model.

	Tab: Model
	Solid Model Type: PolyData
	File Input/Output → Read Model 
	Choose the model file demo.vtp
	Go back to tab PolyData → Boundaries

Now we need to give them more meaningful names. Go to the tab Model. All the faces of the model are listed under “Face Ids”. We can select a face from the list and change color to make sure where the face is located. For the inlet and outlets, we change the names as: *inflow\_aorta*, *outflow\_aorta*, *outflow\_right\_iliac* and *all\_wall*.

	Tab: Model
	Select the inlet face in the list and change color to green
	Enter inflow_aorta for surf name, and click “Set Value”

<figure>
  <img class="svImg svImgXl"  src="documentation/userguide/imgs/modeling/polydata3.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Now the inlet face name is changde to *inflow_aorta* in the list. Similarly, we change the names of the two outlet faces and the wall. As we changed the face names, we need to save the model again.

	File Input/Output → Save Model
	Save to the file demo.vtp

<figure>
  <img class="svImg svImgXl"  src="documentation/userguide/imgs/modeling/polydata4.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>