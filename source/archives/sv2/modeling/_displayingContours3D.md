###Displaying Contours in the 3D Display Window

This exercise assumes that you have added two segmentations to the group, as described in the previous exercise.

To display your contours in 3D space, go to the taskbar underneath the 3D display window and click on the “Display Options” menu. Select “Branch Controls” and then check “Level Set Segmentation”:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/displaying_contours_3D/1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

As you move the “Current Position” Slider bar under the “Create Vessel” tab from position “0” to position “10”, you should see the segmentations that you’ve created appear in blue along the path in the 3D display window.

<font color="red">**HELPFUL HINT:** </font>  This shows ALL segmentations that you created and still appear in the 2-D windows. To see only the segmentations that you added to the group, click on the “Display group” button to the right of the group treeview window and select a color when prompted.

Note that once a contour has been added to a group it can only be smoothed and edited in two ways:

1.	 If the contour is still displayed in the 2-D windows, you can smooth it and edit it as indicated previously in the tutorial. To update this on the group, you will need to delete the corresponding contour within the group and add the edited contour to the group. 
2.	If you closed **SimVascular**, then all of the segmentations that you created will no longer appear in the 2D Windows. They will only be saved in the group (If you saved the group). To edit segmentations that are no longer in the 2D windows: Select the contour member that you would like to edit in the group treeview window. Using the “Manipulate” drop down menu to the right of the group treeview window, you can choose to “show spline.” The contour will be highlighted in yellow and you can click on the contour in the 3D window to edit the spline, similar to the way you edited the path spline previously in the tutorial.  This editing technique will be described more in depth later in the tutorial.
