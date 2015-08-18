###Using Groups of Segmentations to Create Solid Models  

This exercise will assume that you have completed [Section: Putting It All Together](#modelingPuttingTogether) and that you have created segmentations down the aorta and common iliac artery that you can now “loft” together to form solid model.

The first thing we will do is create a new group “aorta\_test” that mimics your original group, “aorta”. We will do this so that we can manipulate (i.e., delete) contours in this group without affecting the original group. Review [Section: Using Groups](#modelingUsingGroups), [Section: Adding Contours to a Group](#modelingAddingToGroup), and [Section: Creating and Modifying Segmentations in Batches](#modelingBatch) and create a group named “aorta_test” that contains all of the segmentations that are found in the group “aorta”.

Then, under the “2D Segmentation” tab:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/solid_modeling/creating_models/1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Highlight “aorta\_test” in the group treeview display window. Next to the group treeview display window, click on the “Model Operations → Use Surface” button under “Operations” on the right hand side of the screen. After this button is pressed, you should see a “X” appear in the column “Use in Model” next to “aorta\_test” in the group treeview window. This indicates that you would like to loft a 3D solid from the group “aorta_test”.

<font color="red">**HELPFUL HINT:** </font> You can only use Parasolid to generate a model if you have paid for a Parasolid license and have the licensed portion of the software. If you do, you can activate the Parasolid tab by going to the "Work Menus" selection in the upper left hand of your screen and selecting Parasolid. 

Under the “Model → Parasolid → Create Model” tab, click on the “Create Pre-Op Solid Model” button. A window will appear asking you to name your new model. Name your model "NewModel" and then click "Enter". You may not give a blank name, a name containing ".", or a name containing "/". Another window will appear asking you if you would like to “Recreate all solids”. Click on the “Yes” button. Another window appears asking if you would like to “Create missing solids using defaults.” Click on the “Yes” button. 

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/solid_modeling/creating_models/2.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

A box will pop up informing you that it is renaming one of the surfaces so that you do not have two surfaces with the same name. Then, a red solid representing your vessel should appear.

In addition, the name of the solid will appear underneath Parasolid in the dropdown list. The model should also have faces corresponding to the groups used to create the solid. Click on the model name to expand the list and see the faces.

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/solid_modeling/creating_models/2.5.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

The “num sample pts” under “Segmentation → Lofting Parameters” describes how many sample points around each segmentation are used to connect one contour to the adjacent contour. You can imagine that using fewer sample points creates a more smooth model, but one that may not adhere as well to the 2D segmentations. You are encouraged to play around with the option. Change the value in “num sample pts” and click on the “Create Pre-Op Solid Model” button to see how it affects the solid.

Now, let’s examine the solid in more detail. Click your mouse in the 3D display window and click on the semi-transparent solid model. If you type “p” on the keyboard, the model should now become opaque yellow and easier to visualize. If you would like to change the opacity of the lofted solid (optional), “pick” the 3D solid, which turns it opaque and yellow, and go to the “Visualization” portion on the right hand side of the screen. Click “Color and Opacity → Change Selected Opacity” and choose a desired opacity. Use this same button and click "Change Selected Color" to change the color of the model. 

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/solid_modeling/creating_models/3.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Whether or not you have decided to make your solid model opaque by changing its actor properties, zoom in and examine the features of your model. In our example model, we can see that we have a segmentation that creates a bump in the vessel, most likely because there is a branch coming off at that point.

Let’s try to fix the model by deleting the segmentation and re-lofting it. First, hide your lofted model by going to the "Model Visualization → Do Not Display Model". To delete the segmentation, navigate back to the “Segmentation → 2D Segmentation” tab.

In the group treeview display window, highlight the group “aorta_test”. To the right of the treeview display window, under “Visualization”, click on the “Display Groups” button. A new window will open, asking you to select a color to display your group in. We have selected bright green:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/solid_modeling/creating_models/4.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Right away we can see which segmentation was problematic. Pick this segmentation by clicking inside the 3D display window, placing your mouse over the segmentation, and typing “p” on the keyboard. Two things should happen – the contour will be highlighted in yellow in the 3D display window, and the path point which it corresponds to will be highlighted in blue in the group treeview display window:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/solid_modeling/creating_models/5.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

To delete this segmentation, simply click the “Delete Members” button located to the right of the group treeview display, under the heading “Member Operations”.

If you clear the 3D display window by going to “Group Visualization → Do Not Display Group” and the re-display the group by clicking on the “Group Visualization → Display Groups” button, you should see that the segmentation that you just deleted is now missing. Its corresponding pathpoint should also be missing from your group treeview display window.

We will now re-loft the model again. Click on the “aorta\_test” group in the treeview window and then click on the “Use Groups” button under the “Solid Model Lofting” header that is to the right of the treeview window. Again you should see the word, “YES” next to the “aorta_test” group name in the treeview window. 

<font color="red">**HELPFUL HINT:** </font> You will have to select the group for lofting by clicking the “Use Group” button and re-loft the model every time you make modifications to the group. 

Now, re-loft the model by clicking on the “Create Pre-Op Solid Model” button under the “Model → Parasolid → Create Model” tab. Did deleting the segmentation help? You can use the Display Options pane to turn on visualization options that will help you judge the fidelity of your solid model. For example, try turning on the “S/I” slider bar and running up and down the 3D solid. How well does it represent the imaging data? You can see that this is one time when it is useful to leave the lofted vessel in a semi-transparent state:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/solid_modeling/creating_models/6.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

**Changing the rendering resolution:**

Next, we will learn about the difference between true lofting artifacts and visualization artifacts. Zoom in on the iliac branch and check for lofting artifacts. Click on the model and type “p” to select the model and turn it opaque. You might see something like following. Is this a lofting artifact?

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/solid_modeling/creating_models/7.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

The answer is no. The crease you see in the picture above results from the resolution of the rendering. This can easily be fixed by changing the maximum facet size.

In the Functional Toolbox pane, click on the “Displays” tab and then click on the “General” tab. You will find a number of options that you can use to change the way things are displayed in your display windows. Next to “Facet Max Edge Size:”, you will see that the default is “1.0”. 

Type in “0.1” in the place of “1.0” and hit RETURN.

With your solid model “picked” (opaque yellow), under visualization on the right hand side, click "Model Operations → Copy Model". Give a name for your new visualized model. Now, every time a Parasolid object is displayed on screen, it will be created with facet sizes with a maximum of 0.1 units. This will display the model with smaller faces and give you a smoother looking surface. You should see that the creases have disappeared:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/solid_modeling/creating_models/8.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

**Fixing Segmentations that Cause Lofting Artifacts:**

Now that you have an acceptable maximum facet size, take a close look at the model. You should be able to take care of lofting artifacts using the techniques demonstrated in [Section: Copying and Pasting Contours](#modelingCopyingPastingContours) and [Section: Modifying Contours](#modelingModifyingContours).

For the purposes of this exercise, it is suggested that when you modify contours or create new ones, you should add them both to the “aorta” and “aorta\_test” group. Treat the “aorta” group as a running history of all available contours in case you need to draw from those again. Meanwhile, create your models from the “aorta_test” group and add and delete segmentations freely from this group.

Here are a few suggestions for fixing common problems:

1.	Your segmentation includes a branch artery. As we saw above, it is easy to just go ahead and delete this segmentation and re-loft your model without it. However, sometimes it is necessary to add in a contour near that location to make the model more true to the imaging data. In these cases, consider copying and pasting a nearby contour ([Section: Copying and Pasting Contours](#modelingCopyingPastingContours)) or hand drawing a contour in a manner that does NOT include the branching portion ([Section: Segmenting an Image Manually](#modelingManual)). Drawing by hand will require a bit of artistic license.

2.	The solid model of your branch vessel seems “bumpy”. If you have created level set segmentations in the iliac branch of the vessel and then fit circles to these segmentations, you may find your model looking something like this:

<figure>
  <img class="svImg svImgMd"  src="documentation/modeling/imgs/solid_modeling/creating_models/9.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

This is because the segmentations in this region are close together and not quite the same size. For small vessels, small differences in the level set segmentations can translate to big differences in area. Consider fixing this problem by either removing segmentations or copying and pasting a single contour down the length of the branch vessel. Copying and pasting a single contour is really only appropriate in the branch vessels, which are relatively far from the region of interest. This methodology may be justified using the shear stress autoregulation theory, which states that vessels will adjust their size to maintain relatively constant levels of shear stress. Thus, as long the flow remains constant along a given small segment of vessel, the vessel should remain about the same diameter for the given small segment. The exception, of course, is if the branch vessels have disease such as atherosclerosis or aneurysm. 

When you are happy with the solid model you have created, don’t forget to “Save Groups” in the File menu. Also save your model with "File Input/Outpu → Save Model".
