##Segmenting an image with 3D segmentation

The 2D Segmentation tools in **SimVascular** allow for flexible segmentation of various vessel geometries.
 However certain geometries with complex 3D structures are difficult to segment in 2D. In this section we will
show you how to use the 3D segmentation tools in **SimVascular** to tackle complex 3D geometries and rapidly
segment many vessels at once.

The 3D segmentation algorithm in **SimVascular** is the Colliding Fronts algorithm. The Colliding fronts
algorithm lets you pick seed points at the start and end of vessels and then creates a 3d segmentation
inside the selected vessels by numerically propagating fronts.

To start out, open a project, or create a new one and import the image data from the demo data

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/3dseg/1_imageopen.png">
  <figcaption class="svCaption" ></figcaption>
</figure>


Once the image has been loaded in, right click on segmentations in the project menu and select
  create 3D segmentation. You will be asked to name your segmentation, we called it myseg. After creating
the segmentation you should see it appear in the segmentations tab.

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/3dseg/2_3dseg.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

Once the segmentation object is visible in the project menu, double-click on it and the SV 3D Segmentation
  tab should open on the right hand side of the screen.

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/3dseg/3_doubleclick.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

After double-clicking the segmentation we can now start placing seed points. We will segment from the top of the aorta
  down into the external illiacs. **SimVascular** allows you to place seed points by clicking in the 3D View. So to get a
  good view of the top of the aorta position your axial, sagittal and coronal slices at 474, 44 and 63 respectively. Your
  3D view should look as follows:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/3dseg/4_view.png">
  <figcaption class="svCaption" ></figcaption>
</figure>
</section>

Now that we have a good view of the Aorta, we can place the starting seed point. Starting seed points can be placed
by ctrl+left-clicking in the 3d view, for windows and linux, and cmd+clicking for mac. So place a starting seed point
on the part of the image with a bright intensity in the aorta, it should look like this:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/3dseg/6_ctrl_click.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

Now we will navigate our view to the bottom of the image to get a good view of the external illiacs. Position your
  axial, sagittal and coronal views at 91, 36 and 57 and respectively. It should look like this

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/3dseg/7_bottomview.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

We can now place ending seed points at the iliacs. On all platforms, ending seed points can be placed shift+let-clicking
in the 3D view. A nice feature of 3D segmentation is that we can segment multiple vessels at once by placing multiple seed points.
So place an ending seed point in each illiac (image region with high intensity).

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/3dseg/8_shiftclick.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

We are now ready to segment. One last step is to choose lower and upper image intensity thresholds within which we
wish to segment. Selecting thresholds makes sure the segmentation does not leak out of the desired areas. For the
  demo image, vessels typically have a minimum threshold of 30, so on the right hand menu, enter 30 for the lower threshold.
  For the upper intensity we can choose the maximum vessel intensity, about 250 for this image.

After selecting the intensity thresholds, click segment. **SimVascular** will start the 3d segmentation algorithm. After it completes
you should see the 3D segmentation appear in the 3D view, as in the following image:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/3dseg/10_model.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

Congratulations, you have successfully used **SimVascular**'s 3D segmentation! Now you can take the 3D segmentation that was produced and
convert it into a usable model using the ([3D modeling guide](#modelingPolyData3DSeg)) 
