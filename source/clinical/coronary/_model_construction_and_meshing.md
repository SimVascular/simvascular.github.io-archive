##Coronary model construction

Usually the best first step in constructing a coronary model is to construct the aorta, since it is the largest vessel in the image data. The left main and right coronary arteries also branch directly off the aorta, so it also provides a good anchor point. Start the path from the aorta at the point where it exits the left ventricle and the lumen is visible. In the example provided, this can be best seen in the axial view on axial slice 139 as shown in the figure below.

<figure>
  <img class="svImg svImgMd" src="clinical/coronary/imgs/aortic_root_image.png">
  <figcaption class="svCaption" >Figure 2: Aortic root in CT image data</figcaption>
</figure>

Follow the aorta away from the heart, placing path points in the center of the vessel in the image data. Once you have completed the path for the aorta, it is recommended that you segment the vessel lumen in the Segmentations section before making the paths for the coronary arteries. This will greatly assist you in locating the coronaries in your image data. After you have completed this step, you should have a group of aortic segmentations that look similar to the one below when viewed in the 3D window:

<figure>
  <img class="svImg svImgMd" src="clinical/coronary/imgs/aorta_path_and_segmentation.png">
  <figcaption class="svCaption" >Figure 3: Aorta path and segmentations</figcaption>
</figure>

The next step is to find the coronary arteries. In this step, we are looking for the left main coronary artery and the right main. There are many ways to find these vessels, but we suggest the axial viewing plane. This is because the coronaries will naturally proceed downwards along the surface of the heart, so you will likely be able to see the cross section of the coronaries from this view and trace them back to the aorta.

First, we will locate the left coronary artery. Recall that the biggest defining feature for the left coronary is that it splits into the left anterior descending artery and the left circumflex. This bifurcation is best seen in axial plane 166 in the example provided.

<figure>
  <img class="svImg svImgMd" src="clinical/coronary/imgs/left_bifurcation.png">
  <figcaption class="svCaption" >Figure 4: Left coronary bifurcation indicated with the cross hair</figcaption>
</figure>

Moving the axial view to plane 164 reveals its bifurcation point with the aorta. Use this information to construct the path for the left coronary artery.

NOTE: A couple general tips on path construction are repeated here. When making a branching vessel, it is best to start the path from a point very close to the path of the parent vessel. This is to ensure that you are able to easily make the branching vessel “fit” completely into it when performing lofting. Also, it is best practice to make your path follow as far down a vessel as you can. For the left coronary artery, this means you do not stop the path right as it bifurcates into the left anterior descending and the left circumflex but you continue the path down one of those branches until you can no longer see the vessel in the image data. In the project provided, you will see that the “lc1” path starts from the aorta and proceeds all the way down the length of the left circumflex artery.

The right coronary artery typically branches on the opposite side of the aorta relative to the left, at an axial location that is closer to the heart. In the example provided, this can be best seen in axial plane 145.

<figure>
  <img class="svImg svImgMd" src="clinical/coronary/imgs/right_coronary.png">
  <figcaption class="svCaption" >Figure 5: Right coronary branch</figcaption>
</figure>

Once you have made the paths for the left main and right coronary arteries, you will be able to find other coronary vessels that branch off of these. The example provided has six left coronary vessels and three right coronary vessels. After making the paths for these, you can segment them. Refer to the general SimVascular documentation on best segmenting practices. One note for segmenting the coronaries is that usually Manual segmentation is best since the vessels are often too small with low image resolution for the automatic segmenting tools to be effective. This can be done in SimVascular using the “SplinePoly” segmentation mode.

Once you have segmented all the coronary vessels, it should look something like this:

<figure>
  <img class="svImg svImgMd" src="clinical/coronary/imgs/segmentations.png">
  <figcaption class="svCaption" >Figure 6: Coronary model segmentations</figcaption>
</figure>

Once the segmentations are made, the lofting and meshing follow standard SimVascular procedures. Refer to the main documentation on how to perform these tasks.

A couple notes on performing these operations specifically for the coronaries are as follows. Since there are many bifurcations in this model, the meshing step will be made easier after performing some surface smoothing on the walls. This can be done by highlighting all the walls in the “SV Modeling” tab. Then, open up the “Local Ops” menu and do a “Decimation” by clicking the blue “Decimation” button, then the “Decimate Local” button. After Decimation, perform a smoothing by clicking the blue “Cstr. Smooth” button then the gray “Smooth Local” button. Repeat this Decimation and Constrained Smoothing procedure a couple times. Save the model.

<figure>
  <img class="svImg svImgMd" src="clinical/coronary/imgs/local_smoothing_options.png">
  <figcaption class="svCaption" >Figure 7: Local smoothing operations on the wall</figcaption>
</figure>

We next need to mesh the model into tetrahedral elements before running a simulation. Refer to the main documentation for more complete information on meshing. We will just cover a few coronary-specific tips here. Since coronary models are often characterized by a large aorta and slender coronaries, it can often be difficult to select an edge size that is appropriate for both. This can be alleviated in SimVascular with the help of a “Local Mesh Size”. First, open the “Meshing” module in SimVascular to bring up the meshing menu. Then, click the “Estimate Edge Size” button to have SimVascular estimate an edge size. The resulting size will be appropriate for the coronary vessels. You can go ahead and mesh with this size if you want, but often this will lead to the aorta having an unnecessary large number of elements. To fix this, we will select a different mesh size for the aorta. Highlight the wall of the aorta and all its caps and apply an edge size that is roughly 10 times bigger than the estimated edge size of the coronaries. Once you have done this, run the mesher. Hopefully, you should get a mesh with roughly ~300,000 to 1 million elements.

We encourage the user to re-read the path planning, segmentation, modeling, and meshing portions of the main documentation as needed to complete your coronary model before proceeding to the next sections, which describe boundary condition assignment and simulation in greater detail.












































