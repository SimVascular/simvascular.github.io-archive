###Creating a Model (with Parasolid)

With the two groups of segmentation, we are now able to create a model for the aorta with two branch vessels.

	Tab: 2D Segmentation
	Select the groups aorta and right_iliac in the group tree view
	Click the button “Use Groups”
	
	Tab: Parasolid → Create Model
	Click on the “Create Pre-Op Solid Model” button
	“Recreate all solids?”: Yes
	“Create missing solids using defaults?”: Yes 
	Click “Save Model” to the file demo.xmt_txt

<figure>
<img class="userGuideFigure"  src="documentation/userguide/imgs/modeling/parasolid1.jpg" width="100%"> 
</figure>

Now a 3D model is shown in the 3D Display Window. Here we only consider two branch vessels for this case. The other branches are ignored for this simple case. To get better view of the model:

	Click “Clear Window” in the menu “Window” at the window bottom
	Tab: Model
	Solid Model Type: Parasolid
	Solid Model Object → Preop Solid

<figure>
<img class="userGuideFigure"  src="documentation/userguide/imgs/modeling/parasolid2.jpg" width="100%"> 
</figure>

All the faces of the model are listed under “Face Ids”. We can select a face from the list and change color to make sure where the face is located. For the inlet and outlets, we change the names as: *inflow_aorta*, *outflow\_aorta* and *outflow\_right\_iliac*.

	Tab: Model
	Select the inlet face in the list and change color to green
	Enter inflow_aorta for surf name, and click “Set Value”

<figure>
<img class="userGuideFigure"  src="documentation/userguide/imgs/modeling/parasolid3.jpg" width="100%"> 
</figure>

Now the inlet face name is changed to *inflow\_aorta* in the list. Similarly, we change the names of the two outlet faces. As we changed the face names, we need to save the model again.

	File Input/Output → Save Model
	Save to the file demo.xmt_txt

<figure>
<img class="userGuideFigure"  src="documentation/userguide/imgs/modeling/parasolid4.jpg" width="100%"> 
</figure>

<font color="red">**HELPFUL HINT:** </font>  You can check more details on [ParaSolid modeling in the Modeling Guide](docsModelGuide.html#modelingSolidModeling).  

