###Using Groups

Groups are used to organize the 2D segmentations or contours that you create.  You want to have a different group for each vessel that you are creating.  In addition, you might only use a subset of the 2D contours for producing the solid model of the vessel, so for future reference, it’s helpful to save that subset of contours to a new group.

 In **SimVascular**, similar to a path, a contour contains two ordered sets of points. One set is "Control Points"; the other set is "Contour Points" which define a contour and are calculated using a closed spline based on the control points.

<figure>
  <img class="svImg svImgMd"  src="documentation/modeling/imgs/segmentation/contourdefinition.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

**To create a contour group (empty):**

	Right click the data node "Segmentations" in the SV project in Data Manager
	Click "Create Contour Group" in the popup menu
	Select Path: aorta
	Group Name: (if blank, use path name by default)
	Click "OK"

<figure>
  <img class="svImg svImgSm"  src="documentation/modeling/imgs/segmentation/createemptygroup.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>


<figure>
  <img class="svImg svImgSm"  src="documentation/modeling/imgs/segmentation/creategroupdialog.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Now a new data node “aorta” for the contour group is created under the data node "Segmentations" in Data Manager. Double click the data node “aorta" and the tool "SV 2D Segmentation” automatically shows up. The new group is empty and has no coutours so far. At the same time, the layout of Display is changed, which has tree windows, and the image is resliced along the path. The left top window shows image reslices in intensity; the left bottom one shows reslices in the magnitude of intensity gradient; the right one shows intensity probe in 3D view. You can move the slider "Reslice:" to change reslice position. Click the button "Size” to change the reslice size to make the whole vessel cross section is inside the reslice.

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/emptygroup.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>