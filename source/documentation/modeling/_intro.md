# Creating Geometric Models from Medical Imaging Data #

Our eye is able to distinguish different objects within an image, but to the computer, the image is just a group of numbers to be displayed in a grid format.  It is not able to distinguish what parts of the image correspond to a specific object.  

One way to describe an object within a computing environment is with geometric solid models. 
SimVascular is one system that allows users to generate geometric models from medical imaging data. The first step is to segment the medical imaging data and identify what parts of the image describe the object of interest. While 3D segmentation methods are being developed, this document only details using SimVascular with the 2D segmentation method.  The information from the segmentations is then transformed into a solid model.

The figure that follows describes the process in more detail.  For the segmentation step, paths along the vessels of interest need to be specified first (See [Path Planning](#modelingPathPlanning)). 2D segmentations are then generated along each of the paths (See [Segmentation](#modelingSegmentation)) These segmentations can then be lofted together to create a solid model. A separate solid model is created for each vessel, and these are all unioned together to create the final model. The last step is to blend the vessel junctions so that they are smoother (see [Solid Modeling (PolyData)](#modelingSolidModelingPolyData) and [Solid Modeling (Analytic)](#modelingSolidModelingAnalytic)).

<figure>
  <img class="svImg svImgLg"  src="documentation/modeling/imgs/modelingpipeline.jpg"> 
  <figcaption class="svCaption" ></figcaption>
</figure>
