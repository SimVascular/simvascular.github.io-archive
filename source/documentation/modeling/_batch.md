###Creating and Modifying Segmentations in Batches

Now that you know how to segment one position using level sets and can add it to a group, let’s try it with a whole series of positions.  There are multiple approaches for doing this.  

Some users like to generate a level set segmentation for each point along the path, and then later in the process, select a subset of those for creating their geometric model.  There are fewer user decisions to be made upfront and you will have all the possible segmentations to use in constructing your model.  However, the process will take longer than other approaches. 

A second approach involves pre-selecting the locations for the segmentations, so that only a handful of locations get segmented.  This will be faster than generating all of the segmented contours at once.  However, it requires user knowledge about which locations are important for the modeling, and it can be especially tedious for vessels with large curvature and/or radius changes.  It may also require going back and segmenting other locations later in the process.

In general, you should go with the first approach: Making more segmentations than you will need and then selecting a subset to define the vessel.

However, in the following exercise, we will try to gain some intuition that makes batch level set segmentation possible and efficient.
