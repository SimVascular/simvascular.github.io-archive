### Creating a Analytic Model from 2D Segmentations ###

This exercise will assume that you have created segmentations down the aorta and common iliac artery that you can now use to create a solid model.
 
**To create a analytic model (empty):**

	Right click the data node "Models" in the SV project in Data Manager
	Click "Create Model" in the popup menu
	Model Type: OpenCASCADE or Parasolid (if available)
	Model Name: demo2
	Click "OK"

Now a new data node “demo2” for the model is created under the data node "Models" in Data Manager. Double click the data node “demo" and the tool "SV Modeling” automatically shows up. The new model is empty and has no data so far. 

<figure>
  <img class="svImg svImgMd"  src="documentation/modeling/imgs/analytic/emptymodelanalytic.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

**Union (Boolean) groups to create model:**

	Click the button "Create Model..."
	A dialog pops up, showing all avaiable groups
	Toggle on the checkboxs in the column "Use" for the groups you want
	You can also use the table menu to decide whether to use some groups 
	Number of Sampling Points: 20 (default)
	Click "OK"

At the end of the Boolean operation, the model is created. In addition, you should now be able to see the face names retained from your group segmentations. There should be wall and cap surfaces. If there are two caps for a surface, this means that after lofting, this surface had two holes. For a typical model, you should have one vessel like this and the rest should have one cap. If you have two caps, it may be the case that one of your vessels does not completely intersect into another vessel.

To change face names, types, etc., refer to In [Face Operations for PolyData Model](#modelingPolyDataFaces)

<font color="red">**HELPFUL HINT:** </font> The surface may look not very smooth. There is a difference between true lofting artifacts and visualization artifacts. Is this a lofting artifact? The answer is no. The crease you see results from the resolution of the rendering. This can easily be fixed by changing the maximum facet size.  **It's required for you to make sure the model surface look right to for you.** To improve it:

	Click the button "Change Facet Size.."
	Provide a smaller value for Max Edge Size, like 0.1 or 0.2 for this case
	Click "OK"

You shall have a much nicer surface for the model.

<font color="red">**HELPFUL HINT:** </font>
Because your first segmentation of right\_iliac should be housed completely within the aorta, you should not observe any sharp ledges where the first segmentation juts out of the aorta. Do you? What happens where your segmentations are partly inside and partly outside of the the aorta? Are there smooth transitions there? Perhaps you have constructed your branch vessel such that most of your segmentations were inside the main branch of the aorta until after the bifurcation, and the joined pieces look more like the following:

<figure>
  <img class="svImg svImgSm"  src="documentation/modeling/imgs/analytic/junction.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

This can work as well. However, you will notice that you may find a slight “bump” on the junction area. If you zoom into the bifurcation area, you will find the seam where the two solids were united. You will learn how to smooth out this seam in the next section [Blending the Junction of Two Vessels](#modelingBlendingAnalytic). If you notice any lofting artifacts or ledges in junctions, you need to go back to Segmentation and modify contours.

**Convert to PolyData Model**

Sometimes, you may want to convert an analytic model to a PolyData model. In this way, you are able to use varisou face/global/local operation to continue edit the model surface.

	Click the button "Convert to PolyData..."
	Provide a name in the popup dialog
	Click "OK"

A new PolyData model is created and added under the "Models" in Data Manager.


