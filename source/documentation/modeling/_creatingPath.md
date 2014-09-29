### Creating a Path ###

The goal of this exercise is to create a path for the abdominal aorta and the left common and external iliac.  As you will see, you need to create a path for each vessel of interest.

To create vessel paths, click on the "Paths" tab in the Functional Toolbox (bottom right corner) window.  

The path frame consists of an expandable list of all the paths currently in memory (which is initially blank, i.e. there are no entries under "All Paths").  In addition, there are four basic notebook tabs (General, Manual, Automatic, and Smooth) which will be described below.  We will first describe creating a path, and then go over loading / saving paths to disk.  

In **SimVascular**, a path is an ordered set of points defining a "vessel."  Each path consists of four specific items:

1.	The “Path ID” field specifies an identification number (an integer) for the path.  For this example, enter the value “100” in the “Path ID.”

2.	The “Path Name” field associates a name with the path you are about to create.  The path name CANNOT have any spaces.  For this example, enter the name “aorta” in the “Path Name”.

3.	The “Num. Of Spline Pts” specifies the total number of points to include in the path. It’s important to choose an appropriate number of spline points since they determine the maximum number of 2D segmentations of the vessel.  If you only have 10 points in your path, then you will only be able to generate 10 segmentations along your vessel.  We typically use 100 for smaller vessels and 300 to 500 for larger vessels.  The default is 100 points. For this example, enter the value “300” in the “Num. of Spline Pts” field. 

4. A set of "hand-picked" points which will be picked semi-automatically or manually selected by the user.  

<font color="red">**HELPFUL HINT:** </font>  Once you define “Num of Spline Pts,” you cannot change this value for the path that you are creating; you can however change the “Path ID” and “Path Name"

After you have entered “100” for the Path ID, “aorta” for the Path Name, and “300” for Num. of Spline Pts, click on the "Create New Path" button.

After you click the "Create New Path" button, you should see a "+" appear beside the text "All Paths".  Click on the "+" will expand the list of all paths, and you should see something similar to the following window:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/path_planning/creating_path/1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Additional functionality available under “Paths → General” tab: 
  
“Delete Selected Paths” button:  This allows the user to delete any unwanted vessel paths.  Select the desired path(s) to delete in the Paths treeview window in the top frame, then click this button.  This operation cannot be undone.  To select multiple paths in the treeview, use the shift key when selecting a range of paths and the “Ctrl” key to select paths one-by-one.

<font color="blue">**GETTING AN ERROR:**</font> When you have multiple paths in the treeview window, if you forget to select the path that you want to delete and instead you have “All Paths” highlighted, you will get the error message, “Error: can’t read “mapping”: no such variable.”

“Renumber Path” button:  This button enables the user to change the unique path ID for a selected path in the path treeview.  You may do this for example if you create multiple intermediate versions of a vessel path and decide to delete the unwanted paths and want to number your final paths sequentially.  You should renumber paths BEFORE doing segmentations.  Note that this is provided as a convenience for the user, but is not necessary for the software as the value of the integer path ID does not matter; it just needs to be unique.

“Update Current” button:  When you enter new values for Path Name or Num. of Spline Pts in the entry widgets the value is NOT used by the software until you either explicitly press return when entering the new values or click on the “Update Current” button.

<font color="red">**HELPFUL HINT:** </font>  When you are changing the Path Name, make sure that you see the correct Path ID for the path that you are trying to change in the “Path ID:” widget. When you select a path in the treeview window, this gets updated automatically. 

 “Update Spline” button: This button regenerates the spline associated with the points in the selected path in the path treeview window.  Note that the GUI typically automatically generates splines as paths are updated, but certain error conditions can cause splines not to be properly generated.  This button can be used to attempt to fix the problem of a missing spline.

Under the “Paths” tab, click on the “Manual” tab:

<figure>
  <img class="svImg svImgXl" src="documentation/modeling/imgs/path_planning/creating_path/2.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

There are five basic ways to select points to manually add to the path.  The technique you use will be a combination of preference and your specific application.  You can seamlessly switch between techniques, so using a combination for a particular path is common.  The major techniques consist of:

1.	Using a 3-D cursor ("cross hair") to interactively select a point.  
2.	Using the path planning scale bars and the "cross hair" to select a point.
3.	Using an image slice plane and pressing the "t" key.
4.	Using an interactive 3-D spline to select a path.
5.	Using an interactive 3-D spline with image reslices to select a path.

As you will see below, to use the 3-D interactive splines requires that you use one of the first two techniques to select at least two points first.  

Before we begin, you should familiarize yourself with the options found under the “Paths → Manual” Tab.

**Display Options:**

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/path_planning/creating_path/3.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

“Show Cursor”:  This toggles the display of the 3-D cursor (“cross-hair”) in the 3D display window.  Clicking on this option should result in a white crosshair to appear in a corner of your blue volumetric wireframe box. This cursor is controlled by the scrollbars in the “Paths → Manual” frame.   It can also be interactively moved by positioning the mouse cursor over the cross-hair and clicking on it.  The cross-hair will turn green while you interactively move it.  See “Attach Image Axis” and “Fix Axis” for additional functionality related to the 3-D cursor.

“Show Piecewise Linear Path”:  This toggles the display of a piecewise linear path through the points in the current path.  Note that if the path has less than two points, nothing is displayed.

“Show Points”:  This displays boxes at each point location.  The boxes can be interactively selected by pressing the “p” while the mouse cursor is over a given box in the 3D display window.  When the box is selected, it will blink briefly and then the point will be highlighted in the path treeview frame.

“Show Spline”:  This toggles the display of a cubic spline through the points of the current path.  Note that if the path has less than two points, nothing is displayed.  If the path has more than two points and the spline still isn’t displayed, there may be a problem with the path.  Try selecting the “Path → General” tab, pressing the “Update Spline” button, and then toggle the display of the spline off and then back on.

“Show All Paths (linear)”:  This displays all paths currently in memory and listed in the path viewframe using piecewise linear curves.

“Show All Paths (splines)”:  This displays all paths currently in memory and listed in the path viewframe as splines.

**Attaching an Image Axis:**

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/path_planning/creating_path/4.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

“R”, “A”, “S”:  Toggling on a coordinate direction under the “Attach Image Axis” drop-down menu “connects” the path planning scale bars with the volume visualization primary slice planes.  This means that when you move one of the scale bars in the path planning window, the volume visualization scale bar is automatically updated.  This allows the user to turn on a slice plane, e.g. the axial slice (“S”), and then control the slice interactively using the 3-D cursor or the path planning scale bars.  This technique is used extensively when selecting points manually.  Many users find it easier to pick points in 3-D space using an image slice and the 3-D cursor in contrast to using a 3-D visualization display such as a point cloud or volume rendered image.  Note that you must manually turn on the image slice under the “Volume Properties” tab in the Display Options pane (i.e. click the checkbox), attaching the image axis will not have a visible effect in the 3-D Window even though the scale bars are being updated. 

<font color="red">**HELPFUL HINT:** </font>  Don’t complete hide Display Options pane, otherwise the volume visualization scale bars in the Volume Properties tab can’t be automatically updated.  

**Fixing an Axis:**

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/path_planning/creating_path/5.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

“R”, “A”, “S”:  Interactively selecting points in 3-D space using a 2-D display (i.e. monitor) can be challenging.  When you select the 3-D cursor (see above) and interactively move inside of the window, the program has to “guess” what 3-D motion you want given a 2-D input (left/right and up/down mouse motion).  “Fixing” an axis means that motion is not permitted for the 3-D cursor when the user interactively selects it.  For example, if you toggle on (i.e. fix) the “R” axis, when you interactively move the 3-D cursor in the 3-D window using the mouse, the motion is “constrained” to only occur in the “A/P” and “S/I” directions.  If you are displaying the 2-D image slice at the time and trying to select a point found on the image slice, you will find fixing the “R” axis leads an intuitive motion of the 3-D cursor.  Note that you can still control the “R” direction in this example using the “L/R” scale bar in the “Path → Manual” frame.  Thus a user might position the “R” slice using the scale bar, select a point using the 3-D cursor, and repeat this process to select a series of points for a vessel.

“in-plane only”:  This option under “Fix Axis” ONLY applies when the user is using the interactive spline with image reslices discussed below.  Selecting this function approximately bounds the 3-D cursor motion in the plane of the image reslice.  This typically leads to an “intuitive” motion when interactively repositioning points.

NOTE:  If you are using the interactive spline and image reslice, all of the Fix Axis toggle options can affect your 3-D cursor motion.  You should probably de-select the “R” “A” “S” options above when fixing the image reslice in plane.    

**Cursor Increment:**

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/path_planning/creating_path/6.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

“one pixel”, ‘half pixel”, “other” (fraction of a pixel):  When you move the path scale bars or the 3-D cursor, by default the cursor moves in whole pixel increments (i.e. by “one pixel”).  This can lead to a “jerky” motion.  By clicking the “half pixel” button, the cursor will move in half-pixel increments, leading to a smoother motion of the cursor.  You can also move in fractions of a pixel for an even smoother motion by changing the value found in the “other:” entry widget and hit RETURN.  It is not recommended to change this value to be less than “0.1”.

Now we are ready to start building a path! First, we need to decide where we should start the path. In general, it is better to make your path as long as possible, within reason. This is because it much easier to adjust an existing long path, than to try to “add on” to a path that is too short.

Let’s pick a point in the supra-celiac aorta.  Remember that you can display the point cloud or use another visualization technique to re-familiarize yourself with the data.  If you haven’t done so already, display the white 3-D path planning cursor (“cross-hairs”) by using selecting “Show Cursor” from “Paths → Manual → Display Options”:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/path_planning/creating_path/7.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

If you haven’t modified the location the values of the “Paths → Manual” scale bars, the 3-D cursor will appear in the lower left corner of the blue wireframe 3D box. You should now be able to click and “grab” the 3-D cursor in the 3-D graphics window.  Position the mouse pointer near the intersection of the three white lines making up the 3-D cross-hair.  You can then left mouse click on the cross-hair and drag the cursor around the 3-D window. 

In this example, we are going to use the axial image slice (“S/I”) to select a point in the supra-celiac aorta.  Turn on the axial slice under the “Volume Properties” tab in the Display Options pane (check the box next to “I”).  Now we will attach the path plan scale bar to the Volume Properties scale bar.  Select “Attach Image Axis” under “Paths → Manual” in the Functional Toolbox pane and check “S”.

 
Now you will see that if you move the 3-D cursor in the 3-D Graphics Window, the 3-D cursor automatically updates the scale bar in the Volume Visualization window keeping the cursor “snapped” to the image slice.  Make sure your “Cursor Increment” set to “one pixel”, and then using the 3-D cursor or the path scale bars, select position:

&nbsp;&nbsp;&nbsp;&nbsp;L/R:  228	A/P: 13	S/I:	475

Then click “Add Point to End of Path” button to add the point to the “aorta”. The point should appear under “aorta” in the path treeview window (shown highlighted in blue in the following picture).

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/path_planning/creating_path/8.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

<font color="red">**HELPFUL HINT:** </font>  It is generally a good practice to create paths that extend beyond where you may plan to create a model.  The reason for this is that the path is not explicitly included in the final geometric model, and you will see later that it is difficult to change a path AFTER you have started creating segmentations.

Keep the “S” image axis attached, and zoom in and rotate the image so that you are looking at the inferior/superior plane head-on. You will be looking at a cross-section of the aorta. Move the I/S slider bar under the “Paths” tab in the Functional Toolbox pane from 475 to 450. Move your mouse cursor to the center of the aorta and hit “t” on your keyboard. A point corresponding to the spatial location should appear underneath the previous point that you picked (shown highlighted in blue in the following picture). Now you should have 2 points listed underneath the heading “aorta” in the treeview window:

<font color="red">**HELPFUL HINT:** </font>  If you accidently put a point in an undesired location and would like to delete a point, you can skip to later in this exercise to learn more about, “Deleting points in your path:”

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/path_planning/creating_path/9.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Continue to move down the aorta inferiorly (from “S” to “I”) in increments of 25-50 using EITHER the slider bars associated with the “Volume Properties” tab in the Display Options pane OR the slider bars associated with the “Path → Manual” tab in the Functional Toolbox pane, adding points to your path by centering your mouse inside the aorta and typing “t” on your keyboard. If your S/I slider bar associated with the “Volume Properties” tab is not moving as you move down the path, then your “S” image axis is probably not attached (“Attach Image Axis → S”) and the points you choose will not necessarily be in the correct 3D location. 

When you reach the bifurcation (the aorta splits into the two iliac arteries), continue your path down the LEFT iliac artery:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/path_planning/creating_path/10.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Once you have finished building your path down as far as possible (you should be able to get to around slider position 6 before things get a harder to see – remember that you can change the window level in the 3D display window by clicking on the image slice and using your up/down and right/left arrow keys on the keyboard), visualize the current path by clicking on the “Display Options” drop-down menu under the “Paths” tab and check “Show Points” and “Show Spline”. The points you have chosen will appear as purple boxes, and the spline should show as a red line:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/path_planning/creating_path/11.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

You can quickly see how well your path stays within the vessel by:

1.	Sliding through the “S/I” slider bar under the “Volume Properties” tab

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/path_planning/creating_path/12.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

2.	Setting the “Threshold Range” min value to “110” and displaying the “point cloud” under “Visualization Options”

<figure>
  <img class="svImg svImgXl" src="documentation/modeling/imgs/path_planning/creating_path/13.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

<font color="red">**HELPFUL HINT:** </font>  When creating your paths, the 3D point clouds are a helpful guide in selecting your points.  However, they are highly dependent on the threshold values, so the slice planes are a better way to check if your path is inside the vessels of interest.

Here are some ways you can modify your path so that it is more true to the image data:

**Deleting points in your path:**

Select the pathpoint you want to delete by going to your 3D display window, placing your mouse arrow over the purple box representing the point you would like to delete, and typing “p” on your keyboard. Typing “p” when your mouse arrow is over a particular object “picks” that object. Anything in the window can be “picked” including the path, image slices, and the point cloud. You will know when something is selected when it becomes highlighted in yellow. You should also notice that when you have “picked” a pathpoint, that point’s coordinates will become highlighted in blue in your path treeview display. To delete the point, select the “Additional Options” drop-down menu under the “Path → Manual” tab and select “Delete currently selected point”. The pathpoint should disappear and your spline should regenerate based upon the points that are remaining.

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/path_planning/creating_path/14.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

**Copying and pasting a point in your path:**

First select the point that you would like to copy using the instructions described in the section above, “Deleting points in your path”. Once your point is highlighted, click on the “Additional Options” drop-down menu under the “Path → Manual” tab and select “Copy point”. Next, highlight the point where you would like the previously selected point to be copied to (by either “picking” it in the 3D display window or clicking on its coordinates in the path treeview display window). Again select the “Additional Options” drop-down menu and select either “Paste point above selection” or “Paste point below selection”. Your copied point should appear in the path treeview display window and your path spline should regenerate based upon the addition of the new pathpoint.

 
**Interactively adjusting your path in three-space:**
 
First, re-set your display options by turning OFF (“un-checking”) “Show Points” and “Show Spline” in the “Display Options” drop-down menu.

Next, select the “spline” radiobutton for “Interactor” under the “Manual” tab. A yellow path with grey spheres should appear as a representation of your path. These spheres are “handles” that you can grab and move around in the 3D display window. In the “Interactor” widget, change “num handles” to 50 and hit RETURN. The number of grey spheres along your path should now be 50.

Using point cloud or 2D image slice visualization techniques under the “Volume Properties” tab in the Display Options pane, modify your path by clicking on a grey sphere and dragging it to a desired location. You will know that you have “grabbed” the handle when it turns red. You will see the whole yellow path change along with your movements. Play around with this function, grabbing different handles and moving them around, until you are satisfied with the path you have created. You may need to “fly around” in the 3D display window to ensure that you are truly placing the handles where you think you are.
 
Once you are happy with your path, click on the “Update Path” button in the “Interactor” widget. Your old path will now be replaced by the new path you just adjusted.

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/path_planning/creating_path/15.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

<font color="orange">**WARNING:**</font> If you don’t click “Update Path” and then save the path, none of the handle adjustments will be saved! When you click “Update Path” you will notice that the numbers in the path treeview display will be updated.
