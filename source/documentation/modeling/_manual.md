###Segmenting an Image Manually

Sometimes it is not possible to use automated techniques to segment an image. Other times, automatic techniques work, but yield poor contours. In these situations, you may need to segment the image manually.

First clear the 2D display windows by de-selecting “evolution” and “initialization sphere” under “Level Set” in the “Display Options” menu. We will be keeping the segmentations we create under the “level set” heading, so keeping “Display Options → Level Set → segmentation” checked will allow us to see what we’ve done.

Under the “Create Vessel” tab, choose the “Manual” tab. Select a position on the path for which you want to create a contour, and make sure “Parallel Projection” is turned on. Under “Create Contour As”: choose “Level Set”.

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/manual/1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Click on the 2D Intensity window to activate it (you may need to zoom in and out with your right mouse button to activate it).  

<font color="red">**HELPFUL HINT:** </font>  If you ever find yourself trying to do a manual segmentation and you are not seeing the contours that you are trying to create. Zoom in and out in the 2-D Intensity window to activate manual segmentation and try again. 

Place the cursor along the edge of the vessel (you don’t need to click any mouse buttons, just move the mouse) and type “a” on the keyboard. You’ve just defined the first point in your contour. Move the mouse cursor along the edge of the vessel just slightly to the right of the first position.  Type “a” on the keyboard to add this second point to your contour.  A red line should appear connecting the first and second points. Continue adding points around the edge of the contour by moving the cursor and typing the “a” key.  If you make a mistake, just press the “Shift” key and the “a” key simultaneously and this will remove the last point that you added to the contour:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/manual/2.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

When you’ve finished drawing the outline of the contour, type “c” on the keyboard to indicate that you’re done and the first and last points should be joined.

<font color="orange">**WARNING:**</font>  Do not try to make the last point on top of the first point; while the contour may look fine if you do this, it might actually overlap itself, which will cause problems in the future. Thus, right before hitting “c”, your contour should appear not quite closed.

Typing “c” will create the final contour that you have just drawn, which will show up as a heavy red line in your 2D windows:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/manual/3.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>
