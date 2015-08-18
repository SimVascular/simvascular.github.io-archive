## Visualizing Point Clouds ##

We can also use point clouds to visualize image data.  First, turn off all of the image planes in the view window (i.e. remove checks for “L/R”, “P/A”, and “I/S” planes) from the previous exercises.

Click on the “point cloud” checkbox to threshold the image data under the “Volume Properties” tab.  The default minimum value for thresholding is 128 and the default maximum value for thresholding is 334.0. You should see something similar to the following image:

<figure>
  <img class="svImg svImgXl"  src="documentation/imaging/imgs/point_clouds/1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Now try two different minimum threshold values:  80 and 175.  To change the threshold value, enter the new value in the entry widget in the “Volume Properties” tab under “Threshold Range” and hit RETURN.  When you enter the value of 80, you should see something similar to (a) below.  Next, try a value of 175.  You should get something similar to (b) below.  Only the image intensity values that fall within the specified min and max range are displayed.

<figure>
  <img class="svImg svImgXl"  src="documentation/imaging/imgs/point_clouds/2.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

An additional useful technique when using thresholding is to apply a "connectivity" filter given a "seed" point and to discard pixels that are not simply connected to the "seed" voxel.

First de-select “point cloud” under “Visualization options”. Move the scale bars in the "Volume Properties" window to select the point exactly as shown below (L/R: 258, A/P: 26, S/I: 351).  The corresponding physical location in space is indicated at the top of the window (R: -0.240, A: 0.090, S:  4.476). 

Now change the minimum value of the "Threshold Range" to 90. Click on the “use seed” drop-down menu and select the first option, “Seed by Volume Sliders” as shown below. Within the “use seed” widget should appear the physical location in space that was selected by your scale bars (-0.240 {0.090} 4.476). Then, click the "use seed" checkbox underneath “Threshold Range”, and turn on the point cloud again by checking "point cloud" under “Visualization Options”. You should see an image similar to that below. 

<figure>
  <img class="svImg svImgXl"  src="documentation/imaging/imgs/point_clouds/3.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Note that if you did NOT use the "connectivity" filter and simply used a minimum threshold value of 90, you would get an image as shown below. All pixels above an intensity value of 90 are displayed, not only the pixels with intensity value above 90 that are connected to the seed voxel that was used above.

<figure>
  <img class="svImg svImgXl" src="documentation/imaging/imgs/point_clouds/4.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

<font color="orange">**WARNING:**</font>  You may have to deselect and then reselect "point cloud" if you change the value of "use seed" after you have already displayed a point cloud in order for the point cloud to update.
