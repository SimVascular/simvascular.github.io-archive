###Creating and Modifying Segmentations in Batches

Now that you know how to segment one position using level sets and can add it to a group, let’s try it with a whole series of positions.  There are multiple approaches for doing this.  

Some users like to generate a level set segmentation for each point along the path, and then later in the process, select a subset of those for creating their geometric model.  There are fewer user decisions to be made upfront and you will have all the possible segmentations to use in constructing your model.  However, the process will take longer than other approaches. 

A second approach involves pre-selecting the locations for the segmentations, so that only a handful of locations get segmented.  This will be faster than generating all of the segmented contours at once.  However, it requires user knowledge about which locations are important for the modeling, and it can be especially tedious for vessels with large curvature and/or radius changes.  It may also require going back and segmenting other locations later in the process.

In general, you should go with the first approach: Making more segmentations than you will need and then selecting a subset to define the vessel. However, in the following exercise, we will try to gain some intuition that makes batch level set segmentation possible and efficient. 

The first step to success is making sure that the initialization sphere fits within the lumen of the vessel for all the positions we’d like to segment in the batch. Now, using your “Current Position” slider bar under the “Create Vessel” tab, browse through the 2D images and see how far down you can go with the initialization sphere still completely within the vessel lumen. Perhaps you can go about a third of the way down? Maybe you need to change the “Center” of the sphere to help it stay inside the vessel? Next, let’s choose some level set parameters that we think may be successful for a number of segmentations. 

Once we’ve set the parameters, click on the “Batch” tab under the “Create Vessel” tab. Under “Level Set Batch Segmentation Controls” you will see the field labeled “batch list:”. For the purposes of this exercise, type in “20, 30, 40” and then click on “Batch Segmentation”. The program will open a new window, checking with you to see if you would like to attempt 3 segmentations. Click “Yes”.

Three new segmentations should now appear as blue outlines at path positions 20, 30, and 40 in your 3D display window.You can add these new segmentations to your group “aorta” by clicking on the “Add All in List to Group” button, which is located underneath the “Level Set Batch Segmentation Controls” heading. The new segmentations should then appear in your group treeview display window under the group “aorta”.

If you want to segment at a regular interval, you can use a different convention for batch segmentation. The notation for this type of batch list is start#-end# by #, where # is an integer number.

For example, if you wanted to segment out every 5th position between position 0 and 300, you would enter 0-300 by 5.

For the purposes of this example, type in “50-80 by 10” in the “batch list” field and click on the “Batch Segmentation” button. Again, the program will ask you if you want to attempt 4 segmentations. Click “Yes”.

You will see 4 new segmentations appear along your path. How did these segmentations do at representing your model? Perhaps you want to go back and alter some of them using the methods we described in [Section: Modifying Contours](#modelingModifyingContours). Perhaps they look great, and you just want to Fourier Smooth them in a batch as we did before.

Note that you can also “Fit Circles” to your contours (as described in [Section: Modifying Contours](#modelingModifyingContours)) using a batch operation. WARNING: This will fit a circle to each one of the contours in the batch and this cannot be undone so be careful with fitting circles using a batch operation!

When you are happy with your contours, you can add them to your group by clicking on the “Add All in List to Group” button.

HELPFUL HINT: If you have some segmentations in the “level set” bucket and other segmentations in the “threshold” buckets, you need to do an “Add All in List to group both under the “Level Set Batch Segmentation Controls” AND the “Threshold Batch Segmentation Controls” headers.

Here are some helpful hints for checking out your contours that you have created in batch mode:

First, check to see that the contours are in the center of the “donut” in the potential window. An example of a contour that is in the center of the potential window “donut” is shown below:

<figure>
  <img class="svImg svImgSm"  src="documentation/modeling/imgs/segmentation/batch/10.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

If the contour is not exactly in the center of the donut (like the example shown below), you can scale it using the methods we described in [Section: Modifying Contours](#modelingModifyingContours).

<figure>
  <img class="svImg svImgSm"  src="documentation/modeling/imgs/segmentation/batch/11.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Secondly, you want to check to make sure that the segmentation does not include a branch vessel, like the example shown below.  Although the level set method can segment these, including these in your final model will cause an artificial geometry know as a “lofting artifact.” You can fix these types of segmentations using the techniques described in [Section: Copying and Pasting Contours](#modelingCopyingPastingContours).

<figure>
  <img class="svImg svImgSm"  src="documentation/modeling/imgs/segmentation/batch/12.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

<font color="red">**HELPFUL HINT:** </font>   You want the spacing between locations to be sufficient to capture the curvature and other changes in the vessel.  If the vessel is relatively straight, as is the case in this the abdominal aorta for this dataset, you can space the segmentations relatively far apart.