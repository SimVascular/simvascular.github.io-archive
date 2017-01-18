###Lofting Preview

To check the quality of the contour group, which later will be lofted to create a 3D model, we can preview the lofted surface based on the group of contours. 

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




