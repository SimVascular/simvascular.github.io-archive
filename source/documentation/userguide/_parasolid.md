###Creating a Model (with Parasolid)

With the two groups of segmentation, we are now able to create a model for the aorta with two branch vessels using Parasolid.

	Tab: Segmentation → 2D Segmentation
	Select the groups aorta and right_iliac in the group tree view
	Click the button “Model Operations → Use Surface”
	
	Tab: Model → Parasolid → Create Model
	Click on the “Create Pre-Op Solid Model” button
	“Model Name”: demo
	“Recreate all solids?”: Yes
	“Create missing solids using defaults?”: Yes 
	Click “File Input/Output → Save Model” to the file demo.xmt_txt

<figure>
  <img class="svImg svImgXl"  src="documentation/userguide/imgs/modeling/parasolid1.jpg"> 
   <figcaption class="svCaption" ></figcaption>
</figure>

Now a 3D model is shown in the 3D Display Window. Here we only consider two branch vessels for this case. The other branches are ignored for this simple case.

All the faces of the model are listed under “Face Id”. You can move the cursor to a face of interest in the 3D display window and hit “p” in the keyboard, and the face will be highlighted in yellow and the corresponding face id/name is highlighted in the list under "Face Id". If our model is displayed as faces (look for the "X" under "Show Faces"), then we can also select the faces in the list and they will be highlighted on our screen. However, if our model is displayed as a full model (look for the "X" under "Show Model"), we only have one selectable surface in the 3D window which is the entire solid. We can also change the names of the faces on our model. For the inlet and outlets, we change the names as: *inflow_aorta*, *outflow\_aorta* and *outflow\_right\_iliac*.

	Tab: Model → Parasolid
	Select the inlet face in the list and change color to green
	Enter inflow_aorta for surf name, and click “Set Value”

<figure>
  <img class="svImg svImgXl"  src="documentation/userguide/imgs/modeling/parasolid3.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Now the inlet face name is changed to *inflow\_aorta* in the list. Similarly, we change the names of the two outlet faces. As we changed the face names, we need to save the model again.

	File Input/Output → Save Model
	Save to the file demo.xmt_txt

<figure>
  <img class="svImg svImgXl"  src="documentation/userguide/imgs/modeling/parasolid4.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

<font color="red">**HELPFUL HINT:** </font>  You can check more details on [ParaSolid modeling in the Modeling Guide](docsModelGuide.html#modelingSolidModeling).  

