###Copying and Pasting Contours

Another option for creating contours is to copy and paste a contour from another location.  This allows you to extrude that shape and is useful, for instance, at the point where one vessel joins up with another vessel.

<figure>
  <img class="svImg svImgMd"  src="documentation/modeling/imgs/segmentation/copying_pasting_contours/1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

You can copy and paste any kind of contour you have created: threshold, level set, manual, or analytic.

For this quick exercise, we will assume that you have just made an ellipse as shown in the previous section and that it has been created under the “Level Set” heading (See [Section: Fitting an Analytic Shape to the Image](#modelingAnalytic)). Make sure you have “Display Options → Level Set → segmentation” checked in the 2D display windows.

Under the “Create Vessel” tab, choose the “Smooth” tab. This tab contains many options to modify the segmentations you have created and will be described in more detail in the following section: [Modifying Contours](#modelingModifyingContours). Under “Level Set Additional Single Slice Manipulations”, you will find the buttons “Copy” and “Paste”. So, starting with the ellipse that we had from the previous exercise:

<font color="red">**HELPFUL HINT:** </font> Note the distinction between the “Level Set Additional Single Splice Manipulations” and the “Threshold Additional Single Splice Manipulations” headers. In **SimVascular**, there are two segmentation “buckets.” One bucket is the “level set” bucket that contains a “level set” segmentation and the other is the “threshold” bucket that contains a “threshold” bucket. You can create a manual or analytic segmentation and put it in either of these “buckets” by selecting either “level set” or “threshold” under “Create Contour As” when you are creating segmentation. When you copy, paste, or modify a segmentation under the “Smooth” tab you can copy, paste, or modify the segmentation in the “level set” bucket or the “threshold bucket.” You need to make sure that you are making these modifications under the correct header under the “Smooth” tab which are respectively, “Level Set Additional Single Splice Manipulations” and “Threshold Additional Single Splice Manipulations.” This tutorial works mostly in the “level set” bucket. 

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/copying_pasting_contours/2.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Slide your “Current Position” bar to the position that contains the segmentation that you would like to copy. In our case this position is “0”. Click on the “Copy” button.

Now slide your “Current Position” bar to the position of the slice where you would like to copy the segmentation into. In our case this is “10.” Now click on the “Paste” button. The ellipse that you created in the previous exercise should now show up as a red outline in your new path position. Does the ellipse that you made previously fit in the new path position?
