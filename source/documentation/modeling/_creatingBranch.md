###Creating a Branch Vessel

To create a model of the entire human abdominal aorta, the aorta and its branch vessels will need to be joined together. For the purposes of this tutorial, we will focus on adding the right common and external iliac to the vessel that you just created, which includes the main trunk of the aorta and the left external iliac artery.

It is not immediately obvious how best to create a branch vessel so that we end up with a desirable model, so the purpose of this exercise is to teach you some tricks that you may find useful. This exercise will also describe some of the common pitfalls in branch vessel creation.

Follow the instructions in [Section: Path Planning](#modelingPathPlanning) to create a path for the right iliac artery. Make sure that your path overlaps the path that we created for the aorta:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/solid_modeling/creating_branch/1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

When you have created your path, follow the instructions in [Section: Segmentation](#modelingSegmentation) to create contours down this path. 

Here are some tips for creating the first few segmentations, which may be the most important in creating a branch vessel that is easily joined to another one. Start by lofting together the solid model that you created for the aorta and left iliac artery in [Section: Using Groups of Segmentations to Create Solid Models](#modelingCreatingModels).

Then change to the path you’ve just created for the right iliac artery under the “2D Segmentation → Create Vessel” tabs, and create a new group called “right_iliac” for this branch vessel.

Move the current position slider bar just above the bifurcation point. Segment this position using level set methods and Fourier smooth it. You may find that your segmentation looks something like this:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/solid_modeling/creating_branch/2.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

What is wrong with this segmentation (shown in blue in the 3D display window)? You will notice that part of it is not enclosed in the solid model of the aorta that we generated. You can imagine that this will cause problems when we join the two vessels together because it will create a “ledge” that juts out of the aorta.

You already know of a number of ways to fix this first segmentation so that it fits completely within the main aorta vessel we created earlier, but now we will demonstrate another one. Start by adding this segmentation to the group “right_iliac”. Now, highlight this segmentation in the group treeview display and click on the “Manipulate” drop-down menu in the sidebar to the right of the group treeview display. Select “Show Spline” and “Show Image”:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/solid_modeling/creating_branch/3.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

A yellow segmentation should appear on top of your blue one. If you click on this ring and try to move it, you will see a number of grey spheres appear. These are handles that you can use to adjust the shape of the segmentation. Click on sphere with your left mouse button and drag it to see how the segmentation changes. If you click on a part of the yellow segmentation in between the grey spheres, it should turn green and you can then translate it within the plane. If you do not like the changes you have made to your segmentation, you can choose “Refresh Spline” (highlighted in blue) in the “Manipulate” drop-down menu to the right of the group treeview window.

If you are happy with your new segmentation, choose “Replace Seg with Spline” in the “Manipulate” drop-down menu. 

Now let’s move on to the second segmentation in the bifurcation. It is only crucial that the first segmentation fit completely within the main trunk in order to prevent the ledge effect described earlier, so we can rest easy when we are sure that is the case.

Move down a few slices, and segment this portion of the vessel using level set techniques and then Fourier Smooth it. You may end up with something like this:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/solid_modeling/creating_branch/4.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

You’ll notice that the segmentation shown in the 3D display window above does not fall completely within the bounds of the main aorta solid model. This is okay – we will discover what effect this has on the overall model in just a bit. If you are happy with your segmentation, add it to your group.

Continue segmenting down your vessel until you are clear past the bifurcation, adding your segmentations to the group “right_iliac” along the way. In order to properly represent the bifurcation, it is important to get a contour as close to the point where the vessel has split off completely as possible.

Once you’ve cleared the bifurcation, we can start to see how you’re doing. Highlight all of the segmentations you have just made in the group treeview display window by holding down the “shift” key while clicking with your left mouse button. Click on the “Manipulate” drop-down menu to the right of the group treeview display and select “Align All Profiles”. After the profiles have been aligned, click on “Show Surface” in the “Manipulate” drop-down menu. A solid red surface made with your new segmentations should now appear. Click your mouse in the 3D display window and, while your mouse is over the semi-transparent solid model of the aorta, type “p” on the keyboard. The main branch of the aorta should now turn solid yellow: 

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/solid_modeling/creating_branch/5.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Fly around in the 3D window and examine the junction. Because your first segmentation should be housed completely within the main branch of the aorta, you should not observe any sharp ledges where the first segmentation juts out of the aorta. Do you?

What happens where your segmentations are partly inside and partly outside of the main branch of the aorta? Are there smooth transitions there?

Perhaps you have constructed your branch vessel such that most of your segmentations were inside the main branch of the aorta until after the bifurcation, and the joined pieces look more like the following:

<figure>
  <img class="svImg svImgXl"  src="documentation/modeling/imgs/solid_modeling/creating_branch/6.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

This can work as well. However, you will notice that you may find a slight “bump” where the right iliac comes out of the aorta (shown with the green arrow in the picture above). This type of junction may not be quite as smooth as what is shown on the previous page. However, you will learn how to fix this in [Section: Blending the Junction of Two Vessels](#modelingBlending). 

For now, use the new skills you’ve learned in this exercise along with the techniques you learned in the previous section to complete contour creation down the length of the right iliac artery. As with the aorta branch, you may want to fit circles down where the right iliac becomes much smaller.
