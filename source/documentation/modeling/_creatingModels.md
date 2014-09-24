###Using Groups of Segmentations to Create Solid Models  

This exercise will assume that you have completed Exercise 2.2.12:  Putting It All Together and that you have created segmentations down the aorta and common iliac artery that you can now “loft” together to form solid model.

The first thing we will do is create a new group “aorta_test” that mimics your original group, “aorta”. We will do this so that we can manipulate (i.e., delete) contours in this group without affecting the original group. Review [Section: Using Groups](#modelingUsingGroups), [Section: Adding Contours to a Group](#modelingAddingToGroup), and [Section: Creating and Modifying Segmentations in Batches](#modelingBatch) and create a group named “aorta_test” that contains all of the segmentations that are found in the group “aorta”.

Then, under the “2D Segmentation” tab:

<figure>
<img  src="documentation/modeling/imgs/solid_modeling/creating_models/1.jpg" width="100%"> 
</figure>

Highlight “aorta_test” in the group treeview display window. Next to the group treeview display window, click on the “Use Groups” button under “Solid Model Lofting”. After this button is pressed, you should see a “YES” appear in the column “Use in Lofting” next to “aorta_test” in the group treeview window. This indicates that you would like to loft a 3D solid from the group “aorta_test”.

Under the “Parasolid → Create Model” tab, click on the “Create Pre-Op Solid Model” button. A window will appear asking you if you would like to “Recreate all solids”. Click on the “Yes” button. Another window appears asking if you would like to “Create missing solids using defaults.” Click on the “Yes” button. 

<figure>
<img  src="documentation/modeling/imgs/solid_modeling/creating_models/2.jpg" width="100%"> 
</figure>

The blue outlines representing your segmentation should begin to turn red, and a red solid representing your vessel should appear.

The “num sample pts” under “Lofting Options” describes how many sample points around each segmentation are used to connect one contour to the adjacent contour. You can imagine that using fewer sample points creates a more smooth model, but one that may not adhere as well to the 2D segmentations. You are encouraged to play around with the option. Change the value in “num sample pts” and click on the “Create Pre-Op Solid Model” button to see how it affects the solid.

Now, let’s examine the solid in more detail. Click your mouse in the 3D display window and click on the semi-transparent solid model. If you type “p” on the keyboard, the model should now become opaque yellow and easier to visualize. This is a trick – if you would actually like to change the opacity of the lofted solid (optional), “pick” the 3D solid, which turns it opaque and yellow, and go to the “Displays” tab in the Functional Toolbox. Under the “Display” tab, click on the “Actor Properties” tab. This tab allows you to change the 3D representation, color, and overall display properties of anything you have “picked” in your display windows.

In the “Opacity” field, you can change “0.5” to “1.0” for totally opaque, and click on the button “Set Opacity”:

<figure>
<img  src="documentation/modeling/imgs/solid_modeling/creating_models/3.jpg" width="100%"> 
</figure>

Whether or not you have decided to make your solid model opaque by changing its actor properties, zoom in and examine the features of your model. In our example model, we can see that we have a segmentation that creates a bump in the vessel, most likely because there is a branch coming off at that point.

Let’s try to fix the model by deleting the segmentation and re-lofting it. To delete the segmentation, navigate back to the “2D Segmentation” tab. Clear the 3D display window by clicking on the “Actor” drop-down menu and selecting “Delete All Actors”.

In the group treeview display window, highlight the group “aorta_test”. To the right of the treeview display window, under “Visualization”, click on the “Display Groups” button. A new window will open, asking you to select a color to display your group in. We have selected bright green:

<figure>
<img  src="documentation/modeling/imgs/solid_modeling/creating_models/4.jpg" width="100%"> 
</figure>

Right away we can see which segmentation was problematic. Pick this segmentation by clicking inside the 3D display window, placing your mouse over the segmentation, and typing “p” on the keyboard. Two things should happen – the contour will be highlighted in yellow in the 3D display window, and the path point which it corresponds to will be highlighted in blue in the group treeview display window:

<figure>
<img  src="documentation/modeling/imgs/solid_modeling/creating_models/5.jpg" width="100%"> 
</figure>

To delete this segmentation, simply click the “Delete Members” button located to the right of the group treeview display, under the heading “Member Operations”.

If you clear the 3D display window by going to “Actor → Delete All Actors” and the re-display the group by clicking on the “Display Groups” button to the right of the group treeview display window (under the “Visualization” heading), you should see that the segmentation that you just deleted is now missing. Its corresponding pathpoint should also be missing from your group treeview display window.

We will now re-loft the model again. Click on the “aorta_test” group in the treeview window and then click on the “Use Groups” button under the “Solid Model Lofting” header that is to the right of the treeview window. Again you should see the word, “YES” next to the “aorta_test” group name in the treeview window. 

<font color="red">**HELPFUL HINT:** </font> You will have to select the group for lofting by clicking the “Use Group” button and re-loft the model every time you make modifications to the group. 

Now, re-loft the model by clicking on the “Create Pre-Op Solid Model” button under the “Create Model” tab. Did deleting the segmentation help? You can use the Display Options pane to turn on visualization options that will help you judge the fidelity of your solid model. For example, try turning on the “S/I” slider bar and running up and down the 3D solid. How well does it represent the imaging data? You can see that this is one time when it is useful to leave the lofted vessel in a semi-transparent state:

<figure>
<img  src="documentation/modeling/imgs/solid_modeling/creating_models/6.jpg" width="100%"> 
</figure>

**Changing the rendering resolution:**

Next, we will learn about the difference between true lofting artifacts and visualization artifacts. Zoom in on the iliac branch and check for lofting artifacts. Click on the model and type “p” to select the model and turn it opaque. You might see something like following. Is this a lofting artifact?

<figure>
<img  src="documentation/modeling/imgs/solid_modeling/creating_models/7.jpg" width="100%"> 
</figure>

The answer is no. The crease you see in the picture above results from the resolution of the rendering. This can easily be fixed by changing the maximum facet size.

In the Functional Toolbox pane, click on the “Displays” tab and then click on the “General” tab. You will find a number of options that you can use to change the way things are displayed in your display windows. Next to “Facet Max Edge Size:”, you will see that the default is “1.0”. 

Type in “0.1” in the place of “1.0” and hit RETURN.

Now, return to the “Parasolid → Create Model” tabs in your Functional Toolbox. With your solid model “picked” (opaque yellow), click on the “Actor” drop-down menu underneath the 3D display window and select “Delete Actor”. Your model should have disappeared. Now create a new model by making sure that “aorta_test” is selected as “YES” under the “use in lofting” column of the group treeview display window, and then click on “Create Pre-Op Solid” under the “Create Model” tab. By refreshing the window this way, you should see that the creases have disappeared:

<figure>
<img  src="documentation/modeling/imgs/solid_modeling/creating_models/8.jpg" width="100%"> 
</figure>

**Fixing Segmentations that Cause Lofting Artifacts:**

Now that you have an acceptable maximum facet size, take a close look at the model. You should be able to take care of lofting artifacts using the techniques demonstrated in [Section: Copying and Pasting Contours](#modelingCopyingPastingContours) and [Section: Modifying Contours](#modelingModifyingContours).

For the purposes of this exercise, it is suggested that when you modify contours or create new ones, you should add them both to the “aorta” and “aorta_test” group. Treat the “aorta” group as a running history of all available contours in case you need to draw from those again. Meanwhile, create your models from the “aorta_test” group and add and delete segmentations freely from this group.

Here are a few suggestions for fixing common problems:

1.	Your segmentation includes a branch artery. As we saw above, it is easy to just go ahead and delete this segmentation and re-loft your model without it. However, sometimes it is necessary to add in a contour near that location to make the model more true to the imaging data. In these cases, consider copying and pasting a nearby contour (Exercise 2.2.7:  Copying and Pasting Contours) or hand drawing a contour in a manner that does NOT include the branching portion (Exercise 2.2.5:  Segmenting an Image Manually). Drawing by hand will require a bit of artistic license.

2.	The solid model of your branch vessel seems “bumpy”. If you have created level set segmentations in the iliac branch of the vessel and then fit circles to these segmentations, you may find your model looking something like this:
<figure>
<img  src="documentation/modeling/imgs/solid_modeling/creating_models/9.jpg" width="100%"> 
</figure>
This is because the segmentations in this region are close together and not quite the same size. For small vessels, small differences in the level set segmentations can translate to big differences in area. Consider fixing this problem by either removing segmentations or copying and pasting a single contour down the length of the branch vessel. Copying and pasting a single contour is really only appropriate in the branch vessels, which are relatively far from the region of interest. This methodology may be justified using the shear stress autoregulation theory, which states that vessels will adjust their size to maintain relatively constant levels of shear stress. Thus, as long the flow remains constant along a given small segment of vessel, the vessel should remain about the same diameter for the given small segment. The exception, of course, is if the branch vessels have disease such as atherosclerosis or aneurysm. 

When you are happy with the solid model you have created, don’t forget to “Save Groups” in the File menu.
