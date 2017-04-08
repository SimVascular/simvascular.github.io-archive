###Adding Contours to a Group

Once you have created a contour that you are satisfied with, you can “save” it by adding it to the group of 2D segmentations that will be used to build your solid model. This exercise will assume that you have created the group “aorta” as detailed in [Section: Using Groups](#modelingUsingGroups).

Now, under the “Solids” tab, you should see the group “aorta” in your group treeview window. Under the “Create Vessel” tab, move your “Current Position” slider to “0”. Review [Section: Using Level Sets to Define a Contour](#modelingLevelSet), and create a level set contour at this position “0”. Modify the contour until it is satisfactory to you using the techniques described in the previous section [Modifying Contours](#modelingModifyingContours). Make sure you have “Display Options → Level Set → segmentation” checked in the 2D display windows so that you can visualize the segmentation.

Under the “Level Set” tab, click on “Add Current Position to Group”. Under your group treeview window, the number “0” should appear, corresponding to the path position of the segmentation that was just added to the group (highlighted in blue):

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/adding_to_group/1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Let’s do another one. Move to position 10. You may already have a segmentation there from ]Section: Copying and Pasting Contours](#modelingCopyingPastingContours). We are going to overwrite it with a level set segmentation. Again, make and modify a level set contour until it represents the image data satisfactorily.

When you are through, click on the “Add Current Position to Group” button, and the number “10” should now appear below the number “0” in your group treeview window (highlighted in blue):

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/adding_to_group/2.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

You may now have the idea that creating each segmentation one-by-one would be pretty tedious. In [Section: Creating and Modifying Segmentations in Batches](#modelingBatch), we will learn how to create and modify segmentations by the batch. But first, it is helpful to learn to display our 2D contours in our 3D display window.
