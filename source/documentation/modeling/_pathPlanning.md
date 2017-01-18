## Path Planning ##

[Section: Creating a path](#modelingCreatingPath) shows you how to generate a path. [Section: Smoothing a path](#modelingSmoothingPath) shows you how to smooth a path.  Lastly, [Section Importing and Export Legacy Paths](#modelingImportingExportingPaths), will explain how to save your work, and then load it again after restarting SimVascular.

Some tips to keep in mind as you are constructing paths.

1.	The paths you create determine where you will be able to perform segmentations.  Make sure your paths cover the entire distance of the vessel that you’re interested in modeling. In general, it is a good idea to make your paths as long as possible. It is much easier to make a path a little longer in both directions than to try to “add on” to a path later.

2.	The paths are also important in determining how individual vessels can be joined together.  It’s generally helpful if there is some overlap in the paths.  This will ensure that the inlet of the branch vessel will fit entirely inside of the main vessel.

3.	Lastly, it’s easier if the paths pass near the center of the vessel lumens.  This makes it easier for the segmentation part of the process.

<figure>
  <img class="svImg svImgMd"  src="documentation/modeling/imgs/path_planning/pathplanningtips.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

