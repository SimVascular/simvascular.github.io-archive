##Resampling the Volume Data

In some cases, you may only want to interact with a subset of the volumetric data. Under the “Volume Properties” tab, turn off all visualization methods. Now select the "Subvolume Properties" tab in the Display Options pane (top right corner)

Determining the Sub-Volume to Be Displayed

By defining the size and center of a box, you determine what sub-volume of the data to show.  The size of the box is a function of both the voxel size (can be integer or floating number) and the box dimensions (integer values).  

To begin with, set the values as follows: 

<table class="table table-bordered">
  <tr>
    <th>Box dims</th>
    <th>R</th>
    <th>A</th>
    <th>S</th>
  </tr>
  <tr>
    <th>min</th>
    <td>-50</td>
    <td>-50</td>
    <td>-100</td>
  </tr>
  <tr>
    <th>max</th>
    <td>50</td>
    <td>50</td>
    <td>100</td>
  </tr>
</table>

&nbsp;&nbsp;&nbsp;&nbsp;Resample voxel size:  .078125

There are 4 ways to set the center of the box:  using the “Volume Sliders” (controlled with image plane scale bars under the “Volume Properties” tab), the “Path Plan Cursor” (controlled with scale bars in the “Path Planner” tab, discussed in the next section), the “Path Point”, or the “Interactor”.  For this example, select the “Volume Slider” option.

Now click on the “Volume Properties” tab and set the image plane scale bars to:

&nbsp;&nbsp;&nbsp;&nbsp;L/R:  	275<br>
&nbsp;&nbsp;&nbsp;&nbsp;P/A:	41<br>
&nbsp;&nbsp;&nbsp;&nbsp;I/S:	193

Once the scale bars have been set under the “Volume Properties” tab, go back to the “Subvolume Properties” tab.

Click on the “Resample voxel size” checkbox.  A green outline of a box should appear in the 3D display window as shown in the following picture. This green box shows the bounding box of the sub-volume to be displayed.

<figure>
  <img class="svImg svImgXl" src="documentation/imaging/imgs/subvolume/1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Now try to use the “box dims” entry widget and the image plane scale bars (in the “Volume Properties” tab) to make the box:

&nbsp;&nbsp;&nbsp;&nbsp;(a)  bigger<br>
&nbsp;&nbsp;&nbsp;&nbsp;(b)  shift to one corner of the blue outlined box	

<font color="red">**HELPFUL HINT:** </font>  Some of the changes occur automatically but others won’t take place until you hit the “Update display” button in the upper-right-hand corner.  Changes to the values of the image plane scale bars in the “Volume Image Browser” window won’t be observed until the “Update display” button is pressed.

Enter a value of “0.234375” into the “resample voxel size” entry widget and hit RETURN.  **Don’t forget to hit RETURN or else the new value doesn’t register with the system.**  You are now resampling the volumetric data to a 0.234375 cm3 voxel volume from the original voxel data. This is 3 times larger than the original voxel size.  

Visually, this displays the same sub-volume as using a “resample voxel size” of 0.078125 and increasing the box dims min and max value by 3 (R min:  -150, R max:  150, A min: -150, A max:  150, S min: -300, S max:  300).  The crucial difference is in the computational overhead.  The larger voxel size of 0.234375 cm3 has (1/3) 3 or 1/27th fewer voxels in the sub-volume than that with a voxel size of 0.078125 cm3 and consequently, a significantly lower computational overhead.  Techniques such as resampling are useful when you are interested in coarse representations of large anatomic features (e.g. the aorta).

###Visualizing Data in the Sub-Volume

Reset the values as follows: 

<table class="table table-bordered">
  <tr>
    <th>Box dims</th>
    <th>R</th>
    <th>A</th>
    <th>S</th>
  </tr>
  <tr>
    <th>min</th>
    <td>-50</td>
    <td>-50</td>
    <td>-100</td>
  </tr>
  <tr>
    <th>max</th>
    <td>50</td>
    <td>50</td>
    <td>100</td>
  </tr>
</table>

&nbsp;&nbsp;&nbsp;&nbsp;Resample voxel size:  .078125<br>
&nbsp;&nbsp;&nbsp;&nbsp;Volume Sliders checkbox:  selected
	
In the “Volume Properties” tab, set the image plane scale bars to:

&nbsp;&nbsp;&nbsp;&nbsp;L/R:  	275<br>
&nbsp;&nbsp;&nbsp;&nbsp;P/A:	41<br>
&nbsp;&nbsp;&nbsp;&nbsp;I/S:	193

There are 3 different ways to visualize the data inside this sub-volume:  

&nbsp;&nbsp;&nbsp;&nbsp;a) point cloud: uses the thresholding range information (see [Visualizing Point Clouds](#imagingPointClouds))<br>
&nbsp;&nbsp;&nbsp;&nbsp;b) isosurface<br>
&nbsp;&nbsp;&nbsp;&nbsp;c) volume rendering (see [Using Volume Rendering](#imagingVolumeRendering))

For this example, we will just look at the data as a point cloud and as an isosurface.

**Visualizing Point Clouds:** Under the “Threshold Range” area in the “Subvolume Properties” tab, set the values to min: 100, max: 334.  Click the “point cloud” checkbox under “Visualization Options”.  You should see something like the following figure.  Notice that we now have only displayed part of the volume (the aortic bifurcation, where the aorta divides into the right and left common iliac arteries).

<figure>
  <img class="svImg svImgXl"  src="documentation/imaging/imgs/subvolume/2.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Now turn off the point cloud (deselect the “point cloud” checkbox).  

**Visualizing Isocontours:**  An additional technique, closely related to thresholding, is to display an isosurface of a user-defined value.  You can think of an isosurface as the 3D analog of a threshold. Click on the “isosurface” checkbox.  This will create an isosurface for the current sub-volume as shown below.

<figure>
  <img class="svImg svImgXl"  src="documentation/imaging/imgs/subvolume/3.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

When you are finished with this exercise, you should uncheck the “Resample voxel size” checkbox. The green subvolume should disappear.
