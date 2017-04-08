###Creating a Path

To create a geometric model for a vessel, you need to first create a path, which you can regard as a centerline of the vessel. 

	Tab: Paths → General
	Path ID: 100 (any positive integer)
	Path Name: aorta (no spaces!)
	Num. of Spline Pts: 300 (the total number of points to include on the path)
	Click the button “Create New Path”

<figure>
  <img class="svImg svImgXl" src="documentation/userguide/imgs/modeling/path1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

A new path *aorta* appears under the “All Paths” in the path treeview. We’ll find some center points of the vessel based on the imaging data and add them into the path. The highlighted region in the 3-D display window is the intersection of the aorta.

	Tab: Paths → Manual
	Toggle on: Display Options → Show Cursor, Attach Image Axis → S
	I/S slider: 475
	Move L/R and P/A sliders, locate the 3-D cursor at the center of the aorta.
	Click “Add Point to End of Path”

<font color="red">**HELPFUL HINT:** </font>  Don’t complete hide **Display Options** pane, otherwise the volume visualization scale bars in the Volume Properties tab can’t be automatically updated.  

<figure>
  <img class="svImg svImgXl"  src="documentation/userguide/imgs/modeling/path2.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

The point should appear under aorta in the path treeview.

Continue to move down the aorta inferiorly (from “S” to “I”) in increments of 25-50 using the I/S slider, center the 3-D cursor inside the aorta and add the center points to your path. When you reach the bifurcation (the aorta splits into the two iliac arteries), continue your path down the LEFT iliac artery:

<figure>
  <img class="svImg svImgXl"  src="documentation/userguide/imgs/modeling/path3.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

<font color="red">**HELPFUL HINT:** </font>  To delete a point in the path, select the one you want to remove in the path treeview, then click Additional Options → Delete currently selected point. 

Build your path down as far as possible (you should be able to get to around I/S slider position 10 before things get harder to see. To visualize the current path:

	Tab: Paths → Manual
	Toggle on: Display Options → Show Points, Show Spline

<figure>
  <img class="svImg svImgXl"  src="documentation/userguide/imgs/modeling/path4.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

To save paths:

	Menu: File → Save Paths
	Make sure you are in the correct project directory.
	Enter the desired name “demo” for the file under “File name:” with the ending “.paths”
	Click on the “Save” button.  

<font color="red">**HELPFUL HINT:** </font>   You can check more details on [Path Planning in the Modeling Guide](docsModelGuide.html#modelingPathPlanning).  
