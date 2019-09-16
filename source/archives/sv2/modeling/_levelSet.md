##Using Level Sets to Define a Contour

Thresholding is very dependent on the user-specified parameters and does not always result in a closed contour. An alternate method that’s been implemented within **SimVascular** is the level set method. **SimVascular** utilizes a specialized level set method built specifically for 2D vascular modeling. These level sets use to intensity image data and geometric constraints to produce a smooth contour of the vascular wall in 2D cross sections. **SimVascular**'s level set method is initialized with a seed and then performs segmentation in two stages.  Details of these stages are outlined below.

Note for all settings.  Hitting **enter** while in any of the text boxes will start the levelset computation.

####Seed Parameters

These parameters modify the location and size of the starting seed. These parameters are shown in two variants. On the left, the location and size are standardized, and will be the same across all images.  The settings on the right show the same fields but take into account the physical space of the data.  Updating either setting type will automaticaly update its counterpart.

+ **Center** controls the center of the seed using the center of the image as origin. Decreasing or increasing the **X** value will move the seed **left** or **right** respectively. Decreasing or increasing the **Y** value will move the seed **up** or **down**, respectively.

+ **Radius** controls the radius of the seed.  This is taken in the **X** direction.

#### Stage 1 Parameters

These parameters control the growth and stop criteria of the first stage levelset.  Stage 1 levelset is meant to arrive at a approximate solution to initialize stage 2. The result of the first stage is displayed in yellow.

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

#### Display and Refresh Options

##### Display

These radio buttons control what edge potential image is shown in the 2-D potential window.

##### Always Refresh

These check boxes force the segmentation to be re-computed every time the user modifies the level set parameters. If you modify parameters in stage 1 or seed, the final levelset will not be updated unless these are checked. Note: modifying a later change will automatically recompute the previous stages.

#### Smoothing and Batch Computation

+ **Fourier Smooth** performs a Fourier-based smoothing of the resulting level set. 
+ **Batch Segmentation** performs a batch set of segmentations using the current settings by inputting the batch settings in the text box and clicking "Batch Segmentation".

<font color="red">**HELPFUL HINT:**</font> Finding suitable level set parameters based on a few cross sections and then doing batch segmentation can dramatically speed up model building. After generating several segmentations in batch, it is good practice to quicly check through them paying attention to possibly unclosed and inaccuate segmentations.


