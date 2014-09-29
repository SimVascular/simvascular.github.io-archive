##Segmentation

Extensive research has been conducted in the field of image segmentation, and as a result, many different techniques have been proposed.  The goal of all these techniques is to identify objects or structures within an image in an automated fashion.  For our purposes, we want to find the vessel lumen.

Currently, only 2D segmentation methods have been incorporated into **SimVascular**.  That means that the segmentations are performed in a plane.  So if we want to create a 3D model from our 3D imaging data, we generate a set of 2D segmentations along a given path (See [Path Planning](#modelingPathPlanning)).  These 2D segmentations can be stitched together later to create a 3D model.

We use groups to organize these 2D segmentations, and in [Section: Using Groups](#modelingUsingGroups), we will show you how to work with groups. In [Section: Visualizing Segmentations](modelingVisualizingSegmentations), you will learn about different ways to visualize data in the planes used for the 2D segmentations.  This will be important because ultimately, you, the user, must determine the acceptability of a given segmentation.  Look at the image below.  Is the segmentation, show in blue, good or bad?  You really can’t answer that question without more information about the object.  The semi-automated segmentation methods provided within **SimVascular** save you the work of generating the segmented contours, but you must decide if the segmentations are suitable for your purposes. 

<figure>
  <img class="svImg svImgSm"  src="documentation/modeling/imgs/segmentation/1.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

The following sections teach you about the different techniques available for producing a 2D contour.  One basic segmentation technique available in SimVascular is thresholding, which uses the image intensities to define a shape ([Using Thresholding to Define a Contour](#modelingThresholding)).  The level set method uses both image intensity values and geometric constraints to generate a segmentation ([Using Level Sets to Define a Contour](#modelingLevelSet)). You can draw the segmentation by hand ([Segmenting an Image Manually](#modelingManual)), and in some cases, you may just want to approximate the object with an analytic shape, such as a circle or an ellipse ([Fitting an Analytic Shape to the Image](#modelingAnalytic)).  Or you may have to copy and paste a shape ([ Copying and Pasting Contours](#modelingCopyingPastingContours)). The last one teaches you how to modify the contour, if needed ([Modifying Contours](#modelingModifyingContours)).

In the end, you will be using a level-set technique to build the abdominal aorta, and you will be drawing segmentations by hand and then using fit-circle to build the branch vessels. Keep this in mind as you work through the exercises. 
