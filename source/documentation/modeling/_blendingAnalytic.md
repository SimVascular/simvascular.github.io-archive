###Blending the Junction of Two Vessels

The idea behind blending two faces of a model together is similar to sweeping a clay sphere of a certain radius all along the seam to “fill in the cracks” and make it smoother. In order to blend your model, you will first have to know the names of the faces you will be blending. Also the faces' type should be "wall".

In our case, the two walls we would like to blend are named “wall\_aorta” and “wall\_right_iliac”. To blend those faces:

	Go to Tab Blend
	All the faces of type "wall" are already listed and paired in a table.
	When you select a row, the two faces will be highlighted in the 3D-view window
	Toggle on the checkbox in the column "Use" to decide which pairs you want to blend.
	Provide a value for Radius. Here we use 0.5
	You can also use the table menu to choose pairs and set radius.
	Click the button "Blend Faces"

<figure>
  <img class="svImg svImgLg"  src="documentation/modeling/imgs/analytic/blending.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

After the blending done, the rows which has been blended become dark grey in the table, and the checkbox "Use" is automatically toggled off. When you go to the tab "Face List", a new face named "wall\_blend_xxx" is created. Your new blended model should now appear. Zoom in to the bifurcation area. 

<figure>
  <img class="svImg svImgLg"  src="documentation/modeling/imgs/analytic/blendedmodel.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

You’ll see how blending the model created a surface that “smoothed over” the previous seam. What happens when you choose a different radius for blending?  Play around with different values for the radius, clicking undo, and then trying a new value.

Note: If there is a case where the “blending sphere” radius is such that it intersects a wall twice (you have a very tight junction), the two walls will not blend. Try decreasing the radius in these cases.

**When you are satisfied with the level of blending you have chosen for your model, click on the tool button  “Save SV Project ” to save this model.**

<br>
<br>
<br>
