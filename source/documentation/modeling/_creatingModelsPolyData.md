### Creating a PolyData Model from 2D Segmentations ###

This exercise will assume that you have completed [Section: Putting It All Together](#modelingPuttingTogether) and have created segmentations down the aorta and common iliac artery that you can now use to create a solid model.

Make sure the paths and groups you intend to model have been loaded.
 
Navigate to the 2D Segmentation Tab and Display your groups.

Navigate to the “PolyData —> Boolean” tab in the functional toolbox. Click “Select Ordered Groups” and a window should pop up containing your groups. Move the groups “aorta” and “right iliac” from the “available” to “selected” by clicking each to highlight them and pressing right arrow button in the window.

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/polyData/creating_models/selectingOrderedGroups.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

<font color="red">**HELPFUL HINT:** </font> **Ordering Groups:**
The Boolean union takes the first group listed and unions it with the second. It then takes this lofted result and unions it with the next group. The operation follows down the list until the model is rendered. To ensure a complete model, be sure the order of the listed groups follows the order of the flow of the model. For this example, "aorta" should be placed first and "right iliac", which is a branch vessel of the aorta should be second.

Using the default parameters, click the button “Boolean” under “Execute and Save”. A solid model created from the selected groups should appear in the Display Window. 

Your completed model should look something like this:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/polyData/creating_models/Boolean.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

**Boolean Options:**

Changing the parameters for the Boolean Union can drastically change the shape and smoothness of your model. 

1. The "Sampling" box under "Circumferential Sampling Rules" indicates the number of points that will be used to represent the circumference of each segmentation. The higher the number, the smoother the face of the model will be with respect to the circumference. The Default is 30 but more or less can be used depending on the size and complexity of the vessel. A smaller vessel needs less points around the circumference compared to a large vessel.

2. The "Number of Points Per Segment" box under "Longitdunial Sampling Rules" sets the number of points to be used to create the segment between each segmentation. This creates points between two circumferential points created above. The points are joined to create a solid model. A higher number for this field would result in a smoother model but takes longer to render. The default is set at 6 but numbers upwards of 50 can be used with success for a smoother model.

3. Linear Sample Along Length: When this is checked on, the amount of triangles created between each segmentation is uniform. When off, the number of triangles is proportional to the length between the segmentations. The default Factor: 10 should be sufficient for most modeling. 

4. Cap Vessels: when on, this caps the end of each vessel. When off, it leaves the inflow and outflow ends of the vessels as a hole


**Saving and Viewing the created PolyData Model:**

To save the model, click “Save” on the bottom left, select the correct directory and save the model as “demo.vtp” ensuring it is a “.vtp” file.

Clear the Display Window by choosing “Clear Window” under the window tab.

Navigate to “Model” tab and by “Solid Model Type” select “PolyData”
Hit “Read Model” and select the model created with PolyData, in this case “demo.vtp”.
The Model should appear in the Display Window.