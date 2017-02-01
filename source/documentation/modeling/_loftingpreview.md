###Lofting Preview

To check the quality of the contour group, which later will be lofted to create a 3D model, we can preview the lofted surface based on the group of contours. **This step is critical to get a good solid model later in solid modeling.**

	Toggle on the checkbox "Lofting Preview" 

<figure>
  <img class="svImg svImgLg"  src="documentation/modeling/imgs/segmentation/loftingpreview.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

A new data node named "Lofted" for the lofted surface is added under the data node "aorta" for the group. As you add/remove/modify contours, the surface will be udpated automatically.

<font color="red">**HELPFUL HINT:**</font> This step is especially important for discrete (PolyData) modelling later.If the lofted surface doesn't match the vessle you are modeling, you can change some paramters to improve it.

There are several parameters you can change for lofting.

	Click the button "Options..."

 <figure>
  <img class="svImg svImgSm"  src="documentation/modeling/imgs/segmentation/loftingdialog.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Changing the parameters can drastically change the shape and smoothness of your model surface. 

1. The "Sampling"  indicates the number of points that will be used to represent the circumference of each segmentation. The higher the number, the smoother the face of the model will be with respect to the circumference. The Default is 60 but more or less can be used depending on the size and complexity of the vessel. A smaller vessel needs less points around the circumference compared to a large vessel.

2. The "Number of Points Per Segment" sets the number of points to be used to create the segment between each segmentation. This creates points between two circumferential points created above. The points are joined to create a solid model. A higher number for this field would result in a smoother model but takes longer to render. The default is set at 12 but numbers upwards of 50 can be used with success for a smoother model.

3. Linear Sample Along Length: When this is checked on, the amount of triangles created between each segmentation is uniform. When off, the number of triangles is proportional to the length between the segmentations. The default Factor: 10 should be sufficient for most modeling. 

**Fixing Segmentations that Cause Lofting Artifacts:**
Here are a few suggestions for fixing common problems:

1.	Your segmentation includes part of a branch artery, which can cause a bump in the vessel. It is easy to just go ahead and delete this segmentation and re-loft your model without it. However, sometimes it is necessary to add in a contour near that location to make the model more true to the imaging data. In these cases, consider copying and pasting a nearby contour ([Section: Copying and Pasting Contours](#modelingCopyingPastingContours)) or manually create a contour in a manner that does NOT include the branching portion ([Section: Segmenting an Image Manually](#modelingManual)).

2.	The solid model of your branch vessel seems “bumpy”. If you have created contours using levelset in the iliac branch of the vessel and then fit circles to these segmentations, you may find your model looking something like this:

<figure>
  <img class="svImg svImgSm"  src="documentation/modeling/imgs/segmentation/loftingbumpy.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

This is because the segmentations in this region are close together and not quite the same size. For small vessels, small differences in the level set segmentations can translate to big differences in area. Consider fixing this problem by either removing segmentations or copying and pasting a single contour down the length of the branch vessel. Copying and pasting a single contour is really only appropriate in the branch vessels, which are relatively far from the region of interest. This methodology may be justified using the shear stress autoregulation theory, which states that vessels will adjust their size to maintain relatively constant levels of shear stress. Thus, as long the flow remains constant along a given small segment of vessel, the vessel should remain about the same diameter for the given small segment. The exception, of course, is if the branch vessels have disease such as atherosclerosis or aneurysm. 

**Fixing Ledge in Junction Region:**

Lofting preview can also provides a good way to check the quality of the junction between two vessels. In this example, we have two groups: aorta, right\_iliac. Similarly, follow the instruction above to create a path and contour group for right_iliac. 

Here, for better visualiztion, change the color of the lofted surface of aorta to blue, change the opacity of the image to about 0.6.

Now let's check the first contour of right\_iliac. You may find that the firt segmentation of right\_iliac looks something like this:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/checkledge.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

What is wrong with this segmentation? You will notice that part of it is not enclosed in the lofted surface of aorta shown in 2D/3D-view windows.ta that we generated. You can imagine that this will cause problems when we join the two vessels together later because it will create a “ledge” that juts out of the aorta.You can use of a number of ways mentioned above to fix this first segmentation so that it fits completely within the aorta vessel we created earlier. It is only crucial that the first segmentation fit completely within the main vessel in order to prevent the ledge effect, so we can rest easy when we are sure that is the case.

**When you are happy with the lofted surfaces, don’t forget to “Save SV Projects” to save the contour groups.**

 

