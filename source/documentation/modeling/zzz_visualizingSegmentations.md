###Visualizing Segmentations

**3D Display Window:**

The 3D display window provides certain visualization features that are helpful when generating the 2D segmentations. 

Since we are going to make a solid model of the aorta and iliac artery based on the path we created in the previous exercises, we will first select the most accurate of our paths as the working path. To do this, go to the “Create Vessel” tab under the “Solids” tab and click on the “Select Current Path” button. A new window will appear, asking you which path you would like to use to create this solid model. In our case, we will pick aorta (ID:101):

GETTING AN ERROR: If you pick a path created under the “Smooth” tab that did not have a spline generated for it then you will the error message, “Error: can’t read “items(p)”:no such element in array.” You can refer back to, “Exercise 2.1.2:  Smoothing a path” to generate a spline for the path that you’d like to use to create the solid model.  

<figure>
  <img class="svImg svImgXs"  src="documentation/modeling/imgs/segmentation/visualizing_segmentations/1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

When the path has been selected by double-clicking, the “Select Path” window will disappear, and you will see the name of the path you have just selected beside the words “Current Path”:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/visualizing_segmentations/2.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

In order to display the current path, go to “Display Options” at the bottom of your 3D display window, select “Branch Controls” and then click on “Show Path”:

<figure>
  <img class="svImg svImgXl" src="documentation/modeling/imgs/segmentation/visualizing_segmentations/3.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Now we will turn on the 2D plane which you will use for your segmentations.  We call this plane the “intensity probe”, and it is image data that is reconstructed perpendicular to your path.  In order to display the current path, go to “Display Options” at the bottom of your 3D display window, select “Branch Controls” and then click on “Intensity Probe”. You will see a 2D slice plane (outlined in green) appear in your 3D display window. You can move the probe along the path by using the slider bar next to “Current Position” in the “Create Vessel” tab:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/visualizing_segmentations/4.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

**2D Intensity and Potential Windows**:

In the taskbar below your 3D display window, click on “3-D Window” and select “Show 3-D & 2-D Reslice”:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/visualizing_segmentations/5.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

You should now notice that your bottom two display windows say “2-D Intensity” (left) and “2-D Potential” (right). You could’ve also gotten to these windows by clicking and dragging down the horizontal pane borders in between the 3D display window and the 2D display windows.

The 2D display windows give you two additional ways to view the data as you perform the segmentations:

1.	The 2-D Reslice Intensity Window displays the intensities of the slice plane that is perpendicular to the path.  This is the same image as that displayed in the intensity probe. To display the image in this window, click on the “Display Options” drop-down menu in this 2D Intensity window and select “Show Window”.

2.	The 2-D Reslice Potential Window shows the magnitude of the image intensity gradients, again in the slice plane perpendicular to the path.  This means that large changes in intensity values, such as that at the edge of vessels, are very bright in this view, and locations with small changes in intensity values, such as in the vessel lumen, are dark, as shown below.  To display the image in this window, click on the “Display Options” drop-down menu in this 2D Intensity window and select “Show Window”:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/visualizing_segmentations/6.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

To query the actual intensity value at a given pixel, select the “Display Options” drop-down menu in the “2-D Intensity” window and click on “Views → Parallel Projection”. The 2-D windows should disappear and then reappear.

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/visualizing_segmentations/7.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Now, when you move the cursor over a pixel in the “2-D Intensity” window and click the left-mouse button, the value of pixel under the cursor (and the magnitude of the gradient at the given location) will appear as text in the graphics window:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/visualizing_segmentations/8.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

You may need to resize the window to see the entire display at the bottom. 
