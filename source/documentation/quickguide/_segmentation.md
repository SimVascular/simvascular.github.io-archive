###2-D Segmentation

Along the path we created, a group of contours of the aorta vessel wall can be defined based on the imaging data. First, create a contour group.

	Right click the data node "Segmentations" in the project "SVProject" in Data Manager
	Click "Create Contour Group" in the popup menu
	Select Path: aorta
	Group Name: use the path name by default

A new group "aorta" is created under the data node "Segmentations" in Data Manager. Double click the group data node "aorta"and the tool "SV 2D Segmentation" shows up. The window layout of Display changes. The left top view shows image reslice in intensity; the left bottom view shows in gradient magnitude; the right 3D view shows image intensity on the probe plane (the red square) perpendicular to the path. The new group is empty ans has no contours so far. To add create and add a contour point:

	Toggle on "Convert to Spline"; Ctrl No. (12) is the number of control points you want the along contour line	
	Click the button "LevelSet"; LevelSet parameter panel appears
	Use the default parameter values in the panel
	Click the button "LevelSet" again

A contour is created/added for the group and should appear under the Contour List. In Display, the countour is shown in red with 12 green control points on the contour line. Two more control points are inside the contour, one for shifting and the other for scaling.

<figure>
  <img class="svImg svImgXl"  src="documentation/quickguide/imgs/2dsegmentation.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

To interactively modify the contour:

	Move the cursor to a control point, it becomes red(selected)
	Left press on the point and move 

Continue to move along the path in increments of about 5-25 using the “Reslice" slider until approximately 285, and define and add contours to the group. You may wish to additionally smooth certain contours, then selecte the contour and click the button "Smooth". Values between 6 and 10 for Fourier number are appropriate for this section of the aorta.
If a contour is abnormal because the probe plane is at the vessel bifurcation region, just delete this contour and move down the path to get a better contour.

To speed up modeling, **SimVascular** can perform batch segmentations.  To perform batch segmentation:

	Toggle on "Batch Mode"
	Enter "10:30:600" in List.
	Click the button "LevelSet"

A number of new contours are created (at reslice positions: 10, 40, 70, 100...) and added to the group. If some are abnormal, just delete them.

To checkout the group quality for lofting:

	Toggle on "Lofting Preview"

A new data node "Lofted" for lofting face is created under this group in Data Manager

<figure>
  <img class="svImg svImgXl"  src="documentation/quickguide/imgs/batchlofting.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

<font color="red">**HELPFUL HINT:** </font> When the data in the project change, remember to save the project by:

	Click "Save SV Projects" on the tool bar

The contour will be saved to a file inside the project folder.


Similarly, we create a path and a group of contours for the right iliac artery.



