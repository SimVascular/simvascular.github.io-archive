###Using Level Sets to Define a Contour

Thresholding is very dependent on the user-specified parameters and does not always result in a closed contour. An alternate method that’s been implemented within **SimVascular** is the level set method. **SimVascular** utilizes a specialized level set method built specifically for 2D vascular modeling. These level sets use to intensity image data and geometric constraints to produce a smooth contour of the vascular wall in 2D cross sections. **SimVascular**'s level set method is initialized with a seed and then performs segmentation in two stages.  Details of these stages are outlined below.

####Seed Parameters

These parameters modify the size of the starting seed. The size is standardized, and will be the same across all images. The location of the seed is fixed at the image center (path point)T

+ **Radius** controls the radius of the seed. 

#### Stage 1 Parameters

These parameters control the growth and stop criteria of the first stage levelset.  Stage 1 levelset is meant to arrive at a approximate solution to initialize stage 2. 

+ **Blur** parameters control the image blur on the feature image and the advection image.  If your image has a lot of noise, increasing these values can improve accuracy. Increased image blur will decrease precision, however.
+ **Kthr** is the equilibrium curvature value of the level set. A higher value will result in less curvature smoothing.

##### Advanced Features

+ **Exponent Factor Rise and Fall** affect the speed of of the level set when rising on an image gradient, or falling.  A ratio of 1:2 is reccomended.
+ **Max Iterations** specifies the maximum number of iterations that can be complete before levelset is halted.
+ **Max Error** specifies the maximum RMS error for the levelset stop criteria.

#### Stage 2 Parameters

Stage 2 level set is intended to provide a smooth, accurate contour based on the results of stage 1.

+ **Blur** parameters control the image blur on the feature image and the advection image. Similar to what discussed for stage 1, inceasing this value on images subject to a significant noise level may improve the accuracy of the resulting segmentation. Increased image blur will decrease percision, for this reason it is reccomended that blur settings be lower in stage 2 than in stage 1.
+ **Kupp** and **Klow** specifies the maximum tolerable curvature. Unlike stage 1, where there is a equilbrium curvature, stage 2 has a specific allowable range for curvature.  When the curvature is too low the level set will grow/shrink the front to obtain a allowable curvature. <font color="orange">**WARNING:**</font> If Klow is set too high, it may result in overshoot.

##### Advanced Features

+ **Max Iterations** specifies the maximum number of iterations that can be complete before levelset is halted.
+ **Max Error** specifies the maximum RMS error for the levelset stop criteria.


Now let's use the levelset method to create and add contours to the group.

	Click the button "LevelSet"
	A new panel shows inside the tool

<figure>
  <img class="svImg svImgSm"  src="documentation/modeling/imgs/segmentation/levelsetpanel.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

The new panel is to set parameters for the levelset.

To create a contour using Levelset:

	Move the reslice position to 158
	Use default levelset paramters
	Toggle on the checkbox "Convert to Spline" in the threshold panel.
	Ctrl No.: 12
	Toggle off the checkbox "Batch Mode"
	Click the button "LevelSet"

<figure>
  <img class="svImg svImgLg"  src="documentation/modeling/imgs/segmentation/levelset.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Now a new contour is created and added to the group.

####Batch Segmentation

<font color="red">**HELPFUL HINT:**</font> Finding suitable level set parameters based on a few cross sections and then doing batch segmentation can dramatically speed up model building.

Now let's try  create contours in batch model using levelset.

	Toggle on the checkbox "Convert to Spline" in the threshold panel.
	Ctrl No.: 12
	Toggle on the checkbox "Batch Mode", List: 180:30:600
	Click the button "LevelSet"

<figure>
  <img class="svImg svImgLg"  src="documentation/modeling/imgs/segmentation/levelsetbatch.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

Three more contours are created for reslice positions: 180,210,240,270,300,330,...,600. After batch segmentation, it is good practice to quicly check through them paying attention to possibly unclosed and inaccuate segmentations.

