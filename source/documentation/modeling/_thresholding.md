###Using Thresholding to Define a Contour

This exercise assumes that you have loaded in the path that most accurately represents your vessel according to the exercises above. This path name should appear next to “Current Path” in the “Create Vessel” tab.

Underneath the “2D Segmentation → Create Vessel” tabs, select the “Threshold” tab:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/thresholding/1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

**Threshold Intensity:**

To segment the image based on intensity, click on the “threshold intensity” radio button. For the purposes of this example, place your slider bar next to “Current Position” on “0”. Enter “90” in the field next to “Threshold Value”, and then click on the “Segment Current Position” button.

To visualize the segmentation(s) you have just created, click on the “Display Options” drop-down menu in the 2-D Intensity window and select “Threshold → threshold”. One or more blue lines outlining your image data should appear:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/thresholding/2.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

**Selected Threshold:**

If you have a number of enclosures displayed in your 2D Intensity window, you may be wondering how SimVascular knows which one is the one you want. The threshold contour that contains the specified center will be the one that is considered. Your current center should be set at “X: 0”, “Y: 0” next to the “Center:” widget under the “Threshold” tab. That should be the dead center of the 2D image. Therefore, your “selected threshold” will be the threshold contour that contains this centerpoint.  Changing this centerpoint will change the contour that is selected. To view the selected contour, go to the “Display Options” menu in the 2D Intensity window and select “Threshold → selected threshold contour”. The selected threshold will then be outlined by a heavier blue line:

<figure>
  <img class="svImg svImgXl" src="documentation/modeling/imgs/segmentation/thresholding/3.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

If you want to change your center, it is helpful to visualize it in space. Select the “Display Options” menu in the 2D Intensity window and select “Threshold → initialization sphere”. A green sphere will appear where your current center is located. If you don’t see a sphere or your sphere is merely a faint outline, click your mouse arrow in the 2D Intensity window and type “r” on the keyboard. This resizes objects to be properly displayed:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/segmentation/thresholding/4.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Play around with changing the Threshold Value to get what you think is a good representation of the vessel lumen. For example, start with a threshold of 60 and then try a threshold 70, 80…etc. so you can see how the blue contour changes if you change the threshold value. 
