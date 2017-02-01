###Segmenting an Image Manually

Sometimes it is not possible to use automated techniques to segment an image. Other times, automatic techniques work, but yield poor contours. In these situations, you may need to segment the image manually. SimVascular provide several options: circle, ellipse, spline polygon, polygon.


####Circle

To create a circle (interactively):

	Click the button "Circle"
	The button is highlighted in light blue, which means the method is activated for interaction.
	Move the cursor to a 2D view window
	Left click at the vessel center
	Move the cusor away from the center.
	A circle shows up. It keeps changing the radius as you move the cursor.
	Left click again. The circle is placed.

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/circle.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

To create a circle (manually):

	RIGHT Click the button "Circle"
	A dialog pops up.
	Provide values in the suggested format.

The circular coutour has only two control points, one is for shifting and the other is for changing radius.

####Ellipse

To create an ellipse (interactively):

	Click the button "Ellipse"
	The button is highlighted in light blue, which means the method is activated for interaction.
	Move the cursor to a 2D view window
	Left click at the vessel center
	Move the cusor away from the center.
	An ellipse shows up as a circle initially. It keeps changing the radius as you move the cursor.
	Left click again. The ellipse is placed.

<figure>
  <img class="svImg svImgMd"  src="documentation/modeling/imgs/segmentation/ellipse.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

To create an ellipse (manually):

	RIGHT Click the button "Ellipse"
	A dialog pops up.
	Provide values in the suggested format.

The elliptical coutour has four control points. The two points on the contour line are for adjusting the orientation and size of the major and minor axes.



####Spline Polygon

A spline polyon is composed of multiple points and the adjacent points are connected by a closed spline.

To create a polygon with a spline (interactively):

	Click the button "SplinePoly"
	The button is highlighted in light blue, which means the method is activated for interaction.
	Move the cursor to a 2D view window
	Left click at the vessel edge and a control point is added.
	Move the cusor clockwise or anticlockwise along the edget and left click; a second control point is added.
	Repeat the step above before the last point.
	Double click for the last point. The contour is completed and placed. 

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/splinepoly.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

To create a polygon with a spline (manually):

	RIGHT Click the button "SplinePoly"
	A dialog pops up.
	Provide values in the suggested format.

After the contour is finished. You can continue to modify it, by shifting, scaling, or moving/adding/deleting points.



To create a normal polygon, use the same way as above. The only difference is that the adjacent points are connected by straight lines. 
