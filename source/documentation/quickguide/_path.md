###Creating a Path

To create a geometric model for a vessel, you need to first create a path, which you can regard as a centerline of the vessel. 

	Right click the data node "Paths" in the project "SVProject" in Data Manager
	Click "Create Path" in the popup menu
	Path Name: aorta
	Subdivision Type: choose "Spacing Based"
	The minimum image spacing is automatically filled for "Spacing"

A new path "aorta" is created under the data node "Paths" in Data Manager. Double click the data node "aorta" and the tool "SV Path Planning" shows up. The new path is empty and has no points so far. To add a contro point:

	Image Navigator: Axial slider: 475
	Place the curson into the Axial 2D View in display
	Right press and move to zoom in
	Method 1: Click at the center of the vessel; Ctrl+A or click the button "Add"
	Method 2(interactive): Move the cursor to the center of the vessle; Ctrl + Left Click

A control point is added for the path and should appear under the Control Point List. In Display, the point is shown as a blue or red point, depending on if the point is selected. To interactively move the point:

	Move the cursor to the control point, it becomes red(selected) if not selected yet
	Left press on the point and move 

<figure>
  <img class="svImg svImgXl"  src="documentation/quickguide/imgs/addpoint.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Continue to move down the aorta inferiorly in the Axial 2D View in increments of 25-50 using the Axial slider in Image Navigator, similarly, add the center points to the path. When you reach the bifurcation (the aorta splits into the two iliac arteries), continue your path down the LEFT iliac artery. At the same you can see the path in the 3D View.

<figure>
  <img class="svImg svImgXl"  src="documentation/quickguide/imgs/addpoint2.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

<font color="red">**Delete a control point** </font> in the path

	Method 1: select the one you want to remove in the Control Point List and click the button "Delete"
	Method 2(interactive): Move the cursor to the point you want to remove and Ctrl + Right Click

Build your path down as far as possible (you should be able to get to around Axial slider position 10 before things get harder to see. 

<font color="red">**Save SV Projects:** </font> When the data in the project change, remember to save the project by:

	Click "Save SV Projects" on the tool bar

The path will be saved to a file inside the project folder.

  
