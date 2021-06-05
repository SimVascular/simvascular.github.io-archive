# Getting Started Guide

This quick start guide first gives a brief introduction to the SimVascular GUI and basic functionality. A tutorial then follows 
demonstrating the basic steps in the SimVascular image-based modeling pipeline, from medical image data segmentation to patient 
specific blood flow simulation. A model of an aorta and two iliac arteries is created from medical imaging data. A finite element 
mesh is then generated from the model and used in a CFD simulation to simulate blood flow in the arteries. 


### SimVascular Pipeline

The SimVascular image-based modeling pipeline comprises the following steps 

<ol>
  <li> Image Visualization: Identify anatomic features in the imaging data </li>
  <li> Path planning: Vessel centerlines geometry is created using 2D image slices to identify vessel lumens </li>
  <li> Segmentation: Vessel lumens are segmented from 2D slice probes of 3D image data oriented perpendicular to positions along paths</li>
  <li> Modeling: A geometric model of a vessel is created by generating a surface fitted to groups of 2D segmentations and joining individual
       vessels together to form a complete 3D solid model of vascular anatomy </li>
  <li> Meshing: A finite element mesh is generated from the 3D solid model </li>
  <li> Simulation: Perform a finite element computational fluid dynamics (CFD) simulation of blood flow in the vascular anatomy</li> 
</ol> 

A visual representation of the pipeline steps are shown below providing a sense of the primarily geometric data created in each step 

<figure>
  <img class="svImg svImgXl"  src="documentation/quickguide/imgs/sv-pipeline.png">
  <figcaption class="svCaption">The SimVascular image-based modeling pipeline</figcaption>
</figure>

### SimVascular Tools 

The SimVascular application provides a set of core <i>Tools</i> (aka plugins) implementing methods for each step in the 
SimVascular image-based modeling pipeline. The follow lists each core <i>Tool</i> name and primary function

<ol>
  <li> <b>Paths</b> - Interactively creates paths based on image data 
  <li> <b>Segmentations</b> - Segments 2D slices along path geometry using various segmentation techniques
  <li> <b>Models</b> - Generates surface and solid models from segmentations 
  <li> <b>Meshes</b> - Generates a finite element mesh from a solid model
  <li> <b>Simulations</b> - Performs a CFD simulation 
  <li> <b>svFSI</b> - Performs a coupled fluid-solid interaction simulation 
  <li> <b>ROMSimulations</b> - Performs a reduced-order model (ROM) simulation 
</ol> 

<i>Tools</i> typically use data from other tools to perform their functions. For example, the <i>Segmentations Tool</i> uses 
paths created by the <i>Paths Tool</i> to position and orient 2D slices in the 3D image volume. The data used by a 
<i>Tools</i> is specified by the user.

Each <i>Tool</i> has a panel containing GUI components (i.e. widgets) used to specify the parameters that control tool behavior. 

### SimVascular Projects

The <i>Tools</i> that comprise a SimVascular pipeline and the data they create are organized as a SimVascular <i>Project</i>.
<i>Tools</i> are added to a SimVascular <i>Project</i> interactively using the GUI. Multiple instances of any <i>Tool</i> may be
added to a <i>Project</i>. 

A <i>Project</i> is viewed in the GUI using the <i> Data Manager  </i> as a hierarchy of <i>Tools</i> and <i>Data Nodes </i>
representing individual <i>Tool</i> data: images, paths, segmentations, models, meshes, and simulation jobs. The <i> Data Manager  </i>
provides a GUI interface to interactively manage adding/removing <i>Tools</i> and changing some of the properties used to
display <i>Tool</i> data (e.g. color). 

The <i> Data Manager  </i> view of the 
<a href="https://simtk.org/frs/download_confirm.php/file/5113/DemoProject.zip?group_id=930"> Demo Project </a> 
created following the steps demonstrated in the tutorial section is shown below

<figure>
  <img class="svImg svImgSm"  src="documentation/quickguide/imgs/demo-data-manager.png">
  <figcaption class="svCaption">An example of a <i>Project</i> displayed in the <i>Data Manager</i>. 
      Instances of <i>Tools</i> added to the <i>Project</i> (e.g. aorta) are shown below the core <b>Paths</b>, 
      <b>Segmentations</b>, <b>Models</b>, <b>Meshes</b>, <b>Simulations</b>, <b>svFSI</b>, and 
      <b>ROMSimulations</b> <b>Tool</b> names.
  </figcaption>
</figure>

A more complete discussion of the <i> Data Manager  </i> is given below.
<br>


## SimVascular MITK Framework 

The SimVascular application uses the <a href="https://www.mitk.org/"> Medical Imaging Interaction Toolkit (MITK)</a>
framework for medical imaging, plugin and interactive graphics. Standard <i>MITK</i> tools have been incorporated into SimVascular: 
a graphics display window with three orthographic 2D views and one 3D view, image file readers (e.g. DICOM), an image navigator tool for
displaying 2D image planes, image processing, and volume rendering.

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #e6e600; border-left: 6px solid #e6e600">
The <i>MITK</i> image processing tools are not integrated into 
</div>


