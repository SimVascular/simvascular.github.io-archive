##Segmenting an image with 3D segmentation

NOTE: in older versions of SimVascular, to use 3D segmentation, make sure the loaded image data does not have the same name as your project, otherwise the 3D segmentation algorithms may not properly load your image data.

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

Once the image has been loaded in, click the "3D" plugin icon on the top menubar to open the 3D segmentation plugin. Take note of the following GUI elements as these will be needed for later steps.

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/3dseg/window.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

Maximize the 3D view by clicking the blue square in the top right corner of the 3D view.

In the 3D segmentation plugin tab, at the top, click the "Show seed points" checkbox so that it is checked.

Now move your mouse to the 3D window, you should see a blue sphere appear wherever your mouse cursor moves, this shows us where we are about to place a seed point.

Left click on the 3D window view to make sure it is activated.

Navigate the axial, coronal and sagittal view planes so that you have a good view of the aorta. Then, navigate your mouse cursor to an area inside the aorta, near the top. Once you have found a good location, press the S key to place a start seed point (note you may need to left click the 3D view to make sure it is activated).

Next navigate the axial, coronal and sagittal view planes so that you have a good view of the iliac arteries. Move your cursor inside each of the common iliac arteries, and press the E key to place end seed points.

Your seed points should look something like the following image

<figure>
  <img class="svImg svImaggeMd"  src="documentation/modeling/imgs/segmentation/3dseg/seeds.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

If you ever need to redo a seed point, you can delete a seed point by moving your cursor near it and right-clicking.

With the seed points in place, we can now set up the colliding fronts 3D segmentation algorithm.

First, in the 3D segmentation tab, find the "input image" dropdown menu and select the image data that you loaded (Note, if no options are available you may need to close and reopen the 3D segmentation plugin).

Now, in the 3D segmentation tab, find the algorithm menu. Click on the "full pipelines" bar and then on "colliding fronts segmentation". You should now see several input bars where you can specify parameters for the colliding fronts algorithm.

Here is a description of each of them:

*Gradient Length Scale*: The approximate wall thickness of the vessel lumen we are segmenting, generally values around 0.2 work well.

*Upper Threshold* and *Lower Threshold*: The intensity pixel values to bound the segmentation, the segmentation will only segment regions with intensity values within the Lower and Upper threshold range. You can find pixel values for the vessels you want to segment by left-clicking in one of the 2D cross-sectional views and dragging your mouse around. The pixel value will be shown in the bottom right of the Simvascular Application window. In general, to get good quality segmentations, the upper and lower threshold range should be chosen to be slightly larger than the intensity ranges you find in the vessels you are segmenting.

*Propagation Scaling*: Value between 0 and 1, higher values cause the segmentation to expand and fill out the vessel being segmented. Typically 0.7 works well

*Advection Scaling*: Value between 0 and 1, higher values cause the segmentation to move towards edges in the image. Typicaly 0.7 works well.

*Curvature Scaling*: Value between 0 and 1, The amount of smoothing that the level set will apply to the colliding fronts output, higher values result in more smoothing.

*Iterations*: The number of level set iterations to run after the colliding fronts algorithm. More iterations will cause the level set to propagate more, move closer to edges and smooth the segmentation more. Typically can be left at 50.

*IsoValue*: The pixel value to define the segmentation boundary after running colliding fronts, can be left at 0.

Now enter 180 and 30 for the Upper and Lower threshold respectively (if using the demo data, otherwise investigate the pixel values to find suitable threshold values.) Leave the other parameters with their default values.

Click "run colliding fronts", after some computation time, a popup window should appear asking you to name the produced 3D segmentation. Enter a name, and the 3D segmentation should appear in the "Segmentations" folder in the datamanager on the left of the SimVascular application window. Your 3D segmentation should look something like the following image
<figure>
  <img class="svImg svImgMd"  src="documentation/modeling/imgs/segmentation/3dseg/model.png">
  <figcaption class="svCaption" ></figcaption>
</figure>

convert it into a usable model using the ([3D modeling guide](#modelingSolidModelingPolyData))
