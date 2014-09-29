##Visualizing Imaging Data

###Loading Medical Imaging Data

The demo data we are using are magnetic resonance images of the aorta and the iliac bifurcation, shown below in blue.  

<figure>
  <img class="svImg svImgMd"  src="documentation/userguide/imgs/imaging/1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>
<br>

	Menu: File → Load Image (VTI)
	Choose the file: sample_data/image_data/vti/sample_data-cm.vti, and click “Open.” 

###Visualizing Medical Imaging Data

Once your data (VTI) has loaded, a blue box outline should now appear in the 3D window. 

<figure>
  <img class="svImg svImgMd"  src="documentation/userguide/imgs/imaging/2.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Place your mouse within the 3D window. You should find that the:

	Left Mouse Button: rotates the 3D volume
	Right Mouse Button: zooms the 3D volume
	Center Mouse Button (or ‘shift’ + left mouse button): translates the 3D volume

The volume dataset we are using for this demo is 512 x 64 x 512 voxels. You can turn on any of the checkboxes labeled “L/R”, “P/A”, and “I/S”, and change the location of each plane by moving the scale bars to see the slices. The “L/R” refers to left/right direction; “P/A” refers to posterior/anterior direction; “I/S” refers to inferior/superior direction. You should see something similar to the image below in the 3D display window:

<figure>
  <img class="svImg svImgXl"  src="documentation/userguide/imgs/imaging/3.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Move the cursor (i.e. arrow pointer) into the 3D display window. By holding down the up/down/left/right arrow keys, you change the brightness of the image.

Turn off all the image planes in the view window (i.e. remove checks for “L/R”, “P/A”, and “I/S” planes). Click on the “point cloud” checkbox to threshold the image data under the “Volume Properties” tab.  The default minimum value for thresholding is 128 and the default maximum value for thresholding is 334.0. You should see something similar to the following image:

<figure>
  <img class="svImg svImgXl"  src="documentation/userguide/imgs/imaging/4.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

The point clouds can give an approximate 3-D view on the vessels. There are many ways/options to visualize imaging data, such as volume rendering, maximum intensity projection (MIP), resampling data, etc. Please refer to [**Imaging Guide**](docsImageGuide.html#imagingOverview).

