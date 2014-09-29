###Fitting an Analytic Shape to the Image

If you want to create a segmentation where no data exists, you may want to create an analytic shape such as a circle or an ellipse.

First start by clearing the 2D display windows by clicking on the “Window” drop-down menu on the taskbar below each window and selecting “Clear Window”. We will be keeping the segmentations we create under the “level set” heading, so keeping “Display Options → Level Set → segmentation” checked will allow us to see what we’ve done.

Under the “Create Vessel” tab, select the “Analytic” tab. Make sure that the “Level Set” radio button is selected under “Create Contour As:”

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/analytic/1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Under the “Create Vessel” tab, place the “Current Position” slider bar to the path position where you would like to create your contour.

**Create a Circle:**

To make a circle, you will use the “Center” and “radius” fields under the “Circle Parameters”.  You can change these parameters and then click on the “Make Circle” button to see the contour that is created.  Can you find a combination that produces a good segmentation for this image?

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/analytic/2.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure> 

The “Center” determines the center of the circle.  The X=0, Y=0 position for the center corresponds to where the path intersects this imaging slice.  Changes to X and Y and the radius are in the same units as the imaging data.

**Create an Ellipse:**

To make an ellipse, you will use the “Center” X and Y fields, and the “a” and “b” fields under the “Ellipse Parameters”.  After you change the values for these fields, click on the “Make Ellipse” button to generate the contour.

As with the circles, the “Center” determines the center of the ellipse.  The X=0, Y=0 position for the center corresponds to where the path intersects this imaging slice.  Changes to X and Y are in the units of the image data, mm in this case.

“a” is the horizontal length of the ellipse, and “b” is the vertical length of the ellipse.  These quantities are in the same units as the imaging data, mm in this case. You can only generate ellipses along either the x- or y-axes. Can you find parameters that fit an ellipse to your imaging data?

<figure>
  <img class="svImg svImgX"  src="documentation/modeling/imgs/segmentation/analytic/3.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure> 

You will notice that after you click on the “Make Ellipse” button, a number will be generated in the “perimeter” field. This number describes the circumference of the ellipse you have just created.
