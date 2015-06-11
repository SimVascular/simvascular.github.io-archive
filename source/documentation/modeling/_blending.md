###Blending the Junction of Two Vessels

The idea behind blending two faces of a model together is similar to sweeping a clay sphere of a certain radius all along the seam to “fill in the cracks” and make it smoother. In order to blend your model, you will first have to know the names of the faces you will be blending.

You should have two faces whose names start with “wall” followed by the group names. By clicking on these names in the list, they will highlight the respective wall in the 3-D window to insure that you are in fact blendign 
For each of these “wall” faces, click on the “Change Color” button and choose a different color for them. This will ensure that the walls you are choosing to blend are what you think they are.

In our case, the two walls we would like to blend are named “wall_aorta_test” and “wall_right_iliac”. Take note of these names. We have changed the surfaces to be pink and sky blue, respectively:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/solid_modeling/blending/1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Now is also a good time to change the names of all the faces to be more descriptive. Change the name of the pink and sky blue surfaces to be “wall_aorta_test” and “wall_right_iliac,” if they do not already have those names. In the figure below, we have changed the color of the face that we will name “inflow_aorta_test” to yellow, “outflow_aorta_test” to green, and “outflow_right_iliac” to blue as shown below. To change the name of each face, click on the corresponding “Face Id”, type in the corresponding name in the “surf name:” field, and click the “Set Value” button. For future reference, the names of the faces are case sensitive so try to be consistent when capitalizing. We recommend that you use only lower case letters in your face names.

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/solid_modeling/blending/2.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Next, navigate to the “Model → Parasolid → Blend Model” tab. Click your model in the list, and this designates that this model will be used for the blending operations.

In the bottom frame of the “Blend Model” tab, you will find a field with three columns, labeled “face 1”, “face 2”, and radius. Type in the two names of the “wall” faces you would like to blend, and then type in “0.3” for the radius. At least one space must be separating each of these typed fields.

When you are done, click on the “Blend Model” button. Your previous model will be cleared from the screen and your new blended model should now appear. Zoom in to the bifurcation area. You can highlight the blended surface by putting your mouse over it and typing “p” on the keyboard to turn it yellow:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/solid_modeling/blending/3.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

You’ll see how blending the model created a surface that “smoothed over” the previous seam. What happens when you choose a different radius for blending?  Play around with different values for the radius, clicking undo, and then trying a new value.

Note: If there is a case where the “blending sphere” radius is such that it intersects a wall twice (you have a very tight junction), the two walls will not blend. Try decreasing the radius in these cases.

When you are satisfied with the level of blending you have chosen for your model, click on the “Save” button to save this model:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/solid_modeling/blending/4.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>
