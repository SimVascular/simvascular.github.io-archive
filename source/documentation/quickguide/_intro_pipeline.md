### Modeling Pipeline

The SimVascular image-based modeling pipeline comprises the following steps 

<ol>
  <li> <b>Image Visualization</b> - Identify anatomic features in the imaging data </li>
  <li> <b>Path planning</b> - Vessel centerlines geometry is created using 2D image slices to identify vessel lumens </li>
  <li> <b>Segmentation</b> - Vessel lumens are segmented from 2D slice probes of 3D image data oriented perpendicular to positions along paths</li>
  <li> <b>Modeling</b> - A geometric model of a vessel is created by generating a surface fitted to groups of 2D segmentations and joining individual
       vessels together to form a complete 3D solid model of vascular anatomy </li>
  <li> <b>Meshing</b> - A finite element mesh is generated from the 3D solid model </li>
  <li> <b>Simulation</b> - Perform a finite element computational fluid dynamics (CFD) simulation of blood flow in the vascular anatomy</li> 
</ol> 
<br>

A visual representation of the pipeline steps (Fig. 1) provides a sense of the primarily geometric data created in each step 
<br> <br>

<figure>
  <img class="svImg svImgXl"  src="documentation/quickguide/imgs/sv-pipeline.png">
  <figcaption class="svCaption">Fig. 1 &nbsp The SimVascular image-based modeling pipeline</figcaption>
</figure>
