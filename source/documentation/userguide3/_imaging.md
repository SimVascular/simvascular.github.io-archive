##Visualizing Imaging Data

The demo data we are using are magnetic resonance images of the aorta and the iliac bifurcation, shown below in blue.

<figure>
  <img class="svImg svImgMd"  src="documentation/userguide3/imgs/imaging/sampleimage.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Place your mouse within the 2D View windows in Display. You should find that the:

	Left Mouse Button: moves the crosshairs.
	Right Mouse Button: zooms the 2D view
	Center Mouse Button (scrolling): navigates to a certain image slice

Place your mouse within the 3D View window in Display. You should find that the:

	Left Mouse Button: rotates the 3D volume
	Right Mouse Button: zooms the 3D volume
	Center Mouse Button (or ‘shift’ + left mouse button): translates the 3D volume

<figure>
  <img class="svImg svImgLg"  src="documentation/userguide3/imgs/imaging/display.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

The volume dataset we are using for this demo is 512 x 64 x 512 voxels. You can change the location of each slice plane by moving the sliders in Image Navigator. The “Sagittal” refers to left/right direction; “Coronal” refers to posterior/anterior direction; “Axial” refers to inferior/superior direction. 

<figure>
  <img class="svImg svImgSm"  src="documentation/userguide3/imgs/imaging/imagenavigator.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Move the vertical slider on the righ side of Display to change the brightness of the image.

Doule click the image data node and the tool "Volume Visualization" shows up. To see the image's volume rendering:

	Toggle on the checkbox "Volumerendering" Menu: File → Create SV Project...
	Choose a preset or click the tab "Thresh"/"Bell" to create a custom transfer function

<figure>
  <img class="svImg svImgXl"  src="documentation/userguide3/imgs/imaging/volumerendering.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

<!-- There are many ways/options to visualize imaging data, such as volume rendering, maximum intensity projection (MIP), resampling data, etc. Please refer to [**Imaging Guide**](docsImageGuide.html#imagingOverview). -->

