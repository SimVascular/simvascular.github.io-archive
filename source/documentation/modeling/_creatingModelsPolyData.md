### Creating a PolyData Model from 2D Segmentations ###

This exercise will assume that you have completed [Section: Putting It All Together](#modelingPuttingTogether) and have created segmentations down the aorta and common iliac artery that you can now use to create a solid model.

Make sure the paths and groups you intend to model have been loaded.
 
Navigate to the 2D Segmentation Tab and Display your groups.

Navigate to the “Segmentation” tab in the functional toolbox. Under the Operations portion of the right hand side of the window, select the "Model Operations → Use Surface". This will put an "X" in the portion of the list that says "Use in Model". This will designate the surface as a surface to be used in the Boolean to create a full model.

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/polyData/creating_models/selectingOrderedGroups.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Now navigate to the "Model → PolyData → Create Model" and click the button called "Create Pre-Op Solid Model".
A window will pop up asking what you would like to create a model. Name your model and click "Enter". You may not give a blank name, a name containing ".", or a name containing "/".

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/polyData/creating_models/namingNewModel.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Your completed model should look something like this:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/polyData/creating_models/Boolean.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

**Boolean Options:**

Changing the parameters for the Boolean Union can drastically change the shape and smoothness of your model. To do this, navigate to the "Segmentation → Lofting Parameters" tab.

1. The "Sampling" box under "Circumferential Sampling Rules" indicates the number of points that will be used to represent the circumference of each segmentation. The higher the number, the smoother the face of the model will be with respect to the circumference. The Default is 30 but more or less can be used depending on the size and complexity of the vessel. A smaller vessel needs less points around the circumference compared to a large vessel.

2. The "Number of Points Per Segment" box under "Longitdunial Sampling Rules" sets the number of points to be used to create the segment between each segmentation. This creates points between two circumferential points created above. The points are joined to create a solid model. A higher number for this field would result in a smoother model but takes longer to render. The default is set at 6 but numbers upwards of 50 can be used with success for a smoother model.

3. Linear Sample Along Length: When this is checked on, the amount of triangles created between each segmentation is uniform. When off, the number of triangles is proportional to the length between the segmentations. The default Factor: 10 should be sufficient for most modeling. 


**Saving and Viewing the created PolyData Model:**

To save the model, click “File Input/Output → Save Model” on the top right, select the correct directory and save the model as “demo.vtp” ensuring it is a “.vtp” file.

<font color="red">**HELPFUL HINT:** </font> **Boolean Solid:**
At the end of the Boolean operation, a window pop up will display the number of free edges and bad cells on the surfaces. Bad cells are denoted by triangles that have more than one neighbor which should not be possible if you have a valid 3D surface. If these numbers are not zero, please report this occurence to the SimVascular development team.  

In addition, you should now be able to see the face names retained from your group segmentations. There should be wall and cap surfaces. If there are two caps for a surface, this means that after lofting, this surface had two holes. For a typical model, you should have one vessel like this and the rest should have one cap. If you have two caps, it may be the case that one of your vessels does not completely intersect into another vessel.


