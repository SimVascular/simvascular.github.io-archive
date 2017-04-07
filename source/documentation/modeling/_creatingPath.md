### Creating a Path ###

The goal of this exercise is to create a path for the abdominal aorta and the left common and external iliac.  As you will see, you need to create a path (centerline) for each vessel of interest. In **SimVascular**, a path contains two ordered sets of points. One set is "Control Points"; the other set is "Path Points" which define a vessle and are calculated using a spline based on the control points.

<figure>
  <img class="svImg svImgMd"  src="documentation/modeling/imgs/path_planning/pathdefinition.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>



**To create a path (empty):**

	Right click the data node "Paths" in the SV project in Data Manager
	Click "Create Path" in the popup menu
	Path Name: aorta
	Subdivision Type: "Spacing Based"
	Click "OK"

<figure>
  <img class="svImg svImgSm"  src="documentation/modeling/imgs/path_planning/createemptypath.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>


<figure>
  <img class="svImg svImgSm"  src="documentation/modeling/imgs/path_planning/createpathdialog.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

There are three options for Subdivision Type. Each option uses a different way to calculate the number (n) of path points between two adjacent control points. Assume the total number of control points is Nc.

**Total Number** (Np): appoximate total number of path points. n=[(Np-1)/(Nc-1)]-1; the actual total number of path ponts Npa=(n+1)*(Nc-1)+1 <br>

**Subdivision Number** (Ns): n=Ns-1; Npa=(n+1)*(Nc-1)+1 <br>

**Spacing Based**: Assume s is the spacing; l is the distance between two adjacent control points. n= [l/s]-1; Npa=(n+1)*(Nc-1)+1

Now a new data node “aorta” for the path is created under the data node “Paths” in Data Manager. Double click the data node “aorta" and the tool "SV Path Planning” automatically shows up. The new path is empty and has no control or path points so far. 

**To add a contro point:**

	Adding Mode: Smart
	Move the cursor to Axial view in Display
	Move the slice to position 475: by scrolling center mouse button or moving Axial slider (in Image Navigator) to 475
	Right press and move to zoom in to enlarge the vessel cross secton
	Method 1: Click at the center of the vessel; Ctrl+A or click the button "Add Smart"
	Method 2(interactive): Move the cursor to the center of the vessle; Ctrl + Left Click

A control point is added for the path and should appear under the Control Point List. In Display, the point is shown as a blue or red point, depending on if the point is selected. 

**To move a control point (interactively):**

	Move the cursor to the control point; it becomes red(selected) if not selected yet
	Left press on the point and move 

<font color="red">**HELPFUL HINT:** </font>  Use the three 2D views at the same time to check if the contrl point is really located at the ceter of the vessel.

<font color="red">**HELPFUL HINT:** </font>  The control points may look too large or small in 2D/3D-view windows. You can change the size, to do it:
	
	Select all the paths you want to change in Data Manager
	Right Click and click "Point 2D Size" or "Point 3D Size"
	Give new size in the popup dialog

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/path_planning/addpoint.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

<font color="red">**HELPFUL HINT:** </font>  It is generally a good practice to create paths that extend beyond where you may plan to create a model.

Continue to move down the aorta inferiorly in the Axial 2D View in increments of 25-50 using the Axial slider in Image Navigator or scrolling the center mouse button, and similarly add the center points to the path. When you reach the bifurcation (the aorta splits into the two iliac arteries), continue your path down the LEFT iliac artery. At the same you can see the path in the 3D View. 

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/path_planning/addpoint2.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

**More Options to add a control point:**

Normally SimVascular will insert a control control to the path in the right order, but sometimes a user may need to explicitly insert a control point in a specific location. You can change the "Adding Mode".

	Smart: add the poing according to the distance to other points
	Begining: add the poing to the beginning
	End: add the poing to the end
	Before: add the poing just before the selected point
	After: add the poing just after the selected point

You can also add a point by manually inputing coordiantes:

	Click the button "Add Manually"
	Input coordinates in the popup dialog using the suggested format
	Click "OK"


**To Delete a control point:**

	Method 1: select the one you want to remove in the Control Point List and click the button "Delete"
	Method 2(interactive): Move the cursor to the point you want to remove and Ctrl + Right Click


After a complete path is created, you can check the quality by reslicing the image along the path.

	Toggle on the checkbox "Turn on Reslicing"

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/path_planning/pathreslicing.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

A slider appears. You can move the slider to change reslice position. Click the button "Size" to change the reslice size to make the whole vessel cross section is inside the reslice. Now, the layout of Display is changed, which has tree windows:

+ **The right window (3D view)**:  shows a 2D slice plane (outlined in a red square in reslice size) ,call "intensity probe". it is image data that is reconstructed perpendicular to your path.
+ **The left top window (2D view)**: displays the intensities of the slice plane that is perpendicular to the path.  This is the same image as that displayed in the intensity probe. 
+ **The left bottom window (2D view)**: shows the magnitude of the image intensity gradients, again in the slice plane perpendicular to the path.  This means that large changes in intensity values, such as that at the edge of vessels, are very bright in this view, and locations with small changes in intensity values, such as in the vessel lumen, are dark, as shown below.

To adjust the position of a control point in the reslice:

	Select a control point in Control Point List
	Move the cursor to the control point in a 2D view 
	Left press on the point and move 

To add a new control pointin the reslice:

	Move the cursor to a 2D view in Display
	Move the cursor to the center of the vessle; Shift+Left Click

Everytime a point is changed/added, the reslice will updated according the changed path.


You can change the type of path after created. 

	Click the button "Change"

