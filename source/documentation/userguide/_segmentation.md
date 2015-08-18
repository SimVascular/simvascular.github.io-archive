###2-D Segmentation

Along the path we created, a group of contours of the aorta vessel wall can be defined based on the imaging data. First, create a group.

	Tab: 2D Segmentation → General
	Group Name: aorta
	Click the button “Create New Group”

<figure>
  <img class="svImg svImgXl"  src="documentation/userguide/imgs/modeling/segmentation1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

In the group treeview, a group with the name *aorta* appears.

To visualize 2-D segmentations (contours):

	Tab: 2D Segmentation → Create Vessel
	Click the button “Select Current Path”, double-click “100 : aorta”

	In the 3D display window:
	Toggle on: Display Options → Branch Controls → Show Path, Intensity Probe
	Toggle on: 3-D Window → Show 3-D & 2-D Reslice

	In the 2-D Intensity window:
	Toggle on: Display Options → Views → Parallel projection
	Toggle on: Display Options → Level Set → segmentation
	
	In the 2-D Potential window:
	Toggle on: Display Options → Level Set → segmentation

<figure>
  <img class="svImg svImgXl"  src="documentation/userguide/imgs/modeling/segmentation2.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Now under the 3D Display  Window, there are two more 2D Display Windows showing image intensity and potential on the probe plane (the green square on the 3D Display Window).
 
	Tab: 2D Segmentation → Create Vessel → Level Set
	Use the default parameter values in the tab
	Click the text field “Center: X” and push the key “Enter”
	Click the button “Add Current Segmentation to Group”

<figure>
  <img class="svImg svImgXl"  src="documentation/userguide/imgs/modeling/segmentation3.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

A segmentation (contour) of the aorta on the probe plane is defined and added to the group *aorta*, as shown in the group treeview. 

Continue to move along the path in increments of about 5-10 using the “Current Position” slider until approximately 285, and define and add segmentations to the group. You may wish to additionally smooth certain contours, using the 'Fourier Smooth Button'.
Values between 6 and 10 for fourier smoothing are appropriate for this section of the aorta.
If a segmentation is abnormal because the probe plane is at the vessel bifurcation region, just skip this segmentation and move down the path to get a better segmentation.

To speed up modeling, **SimVascular** can perform batch segmentations.  To perform batch segmentation:

	Enter "155-285 by 10" in the batch segmentation text box.
	Select "Add to Group" and "Smooth" check boxes.
	Click "Batch Segmentation."


Similarly, we create a path and a group of segmentations for the right iliac artery.

To show all the paths and the segmentations for the aorta and the right iliac artery in the 3D Display Window:

	Tab: Paths → Manual
	Toggle on: Display Options → Show All Paths

	Tab: 2D Segmentation
	Select the groups “aorta” and “right_iliac” in the group tree view
	Click the button “Display Groups” and choose a color

<figure>
  <img class="svImg svImgXl"  src="documentation/userguide/imgs/modeling/segmentation4.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

To save groups:

	Menu: File → Save Groups
	Make sure you are the folder groups under the project directory.
	Click on the “Save” button.  

<font color="red">**HELPFUL HINT:** </font>  You can check more details on [2D segmentation in the Modeling Guide](docsModelGuide.html#modelingSegmentation).  

