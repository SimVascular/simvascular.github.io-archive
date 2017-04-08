# Visualizing Medical Imaging Data

## Overview

Typically imaging data is a set of scalar values (e.g. integers ranging from 0 to 4096) defined on a structured 3D grid. Note that this data may be acquired in 2D slices and resampled in some fashion. The most common use for (diagnostic) medical imaging data is for visualization.  For example, a vascular surgeon may acquire image data on a patient suspected of having vascular disease.  Traditionally, most surgeons and radiologists look at sets of 2D slices of image data acquired in a 3D volume.  This requires the person to create a mental image of the patient’s 3D anatomy.

**SimVascular** has numerous ways to view and interact with medical imaging data.  The first is to visualize slices of image data parallel to the major coordinate axes.  See [Viewing Image Slice Planes](#imagingSlicePlanes). Note that this method is somewhat similar to the way some radiologists visualize data.

A very common technique in viewing image data is to use “window leveling.”  Window leveling basically creates a non-linear color mapping function to help distinguish features in the image data.  See [Changing the Window Level](#imagingWindowLevel).

Another common technique used for image visualization is thresholding.  Thresholding is technically an image segmentation technique.  It defines a region as inside or outside depending on a user-selected value (threshold).  **SimVascular** allows you to create a point cloud (set of small dots) with a dot being created for every voxel that meets user-defined criteria.  See [Visualizing Point Clouds](#imagingPointClouds).

An additional technique gaining popularity is known as 3D volume rendering.  The user defines an opacity transfer function (which can be non-linear) and uses ray casting (or hardware acceleration) to render the 3D volume.  It should be noted that 3D volume rendering is the most computationally intensive method of visualizing imaging data and usually requires very high-end graphics cards for decent performance.  See [Using Volume Rendering](#imagingVolumeRendering).

You may want to create a “flattened 3D image” similar to something you would get from an x-ray. See [Creating a Maximum Intensity Projection (MIP)](#imagingMIP).

Dealing with the entire volume of data can be a computational challenge (particularly for computed tomography angiography, or CTA, data).  Often you may only be interested in viewing a sub-volume or sub-sampled part of the data.  Inside of SimVascular, all of the techniques discussed previously can be used on a sub-sampled/sub-volume of the dataset. See [Resampling the Volume Data](#imagingSubvolume).
       
Most of the above techniques can be combined inside of SimVascular.  This will be especially useful when automated techniques do not work on your data set and you must manually generate information for the model construction or simulation.  See [Combining Several Visualization Techniques](#imagingCombining).

The demo data that we will be using throughout the manual are magnetic resonance images of the aorta and the iliac bifurcation, shown below in blue.  You can also see parts of the kidney attached to the renal arteries, which branch off of the aorta.

<figure>
  <img class="svImg svImgMd" src="documentation/imaging/imgs/1.jpg">
  <figcaption class="svCaption" ></figcaption>
</figure>

