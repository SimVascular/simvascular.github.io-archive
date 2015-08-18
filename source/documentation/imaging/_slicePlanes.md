## Viewing Image Slice Planes ##

Once your data (VTI) has loaded, a blue box outline should now appear in the 3D window. 

<figure>
  <img class="svImg svImgLg"  src="documentation/imaging/imgs/slice_planes/1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

A 3-button mouse is ideal for maneuvering about the 3D display window. Place your mouse within the 3D window. You should find that the:

	Left Mouse Button: rotates the 3D volume
	Right Mouse Button: zooms the 3D volume
	Center Mouse Button (or ‘shift’ + left mouse button): translates the 3D volume

<font color="red">**HELPFUL HINT:** </font>  If you ever get lost navigating through your data, press the “r” key to resize your data.

You may only see a zoomed-in part of the blue outlined box. To zoom in/out and see the entire box, put your cursor in the 3D window, keep the right mouse button pressed down and move the mouse up/down until you see the entire box. 

To see your image data go to the “Volume Properties” tab under the Display Options toolbox and check the box next to the A/P slice. Then slide the A/P slider to position 24. You should now see the 24th slice of the Anterior/Posterior slicing data as shown below!

<figure>
  <img class="svImg svImgXl" src="documentation/imaging/imgs/slice_planes/2.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

What you are seeing is the kidneys and part of the aorta.

You can also turn on all the checkboxes labeled “L/R”, “P/A”, and “I/S”, and change the location of each plane by moving the scale bars.  “L/R” refers to left/right direction; “P/A” refers to posterior/anterior direction; “I/S” refers to inferior/superior direction.

The volume dataset we are using for this demo is 512 x 64 x 512 voxels.  This explains why the L/R and I/S scale widget allows you to move between 0-511, while the P/A scale widget only allows you to go from 0-63.  These are indices.  The actual physical location (in mm, cm, etc.) is indicated by the numbers at the top for R, A, and S.

Select the options exactly as they appear below (L/R: 159, A/P: 32, S/I: 231).  The corresponding physical location in space is indicated at the top of the window (R: -7.974, A: 1.290, S:  -4.899). You should see something similar to the image below in the 3D display window:

<figure>  
  <img class="svImg svImgXl" src="documentation/imaging/imgs/slice_planes/3.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Try changing the size of the viewing window, moving the sliders and turning on/off different combinations of the image planes.  

<font color="red">**HELPFUL HINT:**</font> To make sliding to a specific position easier, you can enlarge Display Options toolbox to make the sliders longer. 
