<h1 id="tutorial"> Tutorial </h1>

This section demonstrates how to use the SimVascular image-based modeling pipeline to create a patient-specific geometric model 
of the human vasculature and perform a finite element computational fluid dynamics (CFD) simulation of blood flow in that model.
A model of an aorta with left and right iliac vessels is created from an MR image volume.

The following <i>Tool</i> types are used to create an anatomic model from image data and then simulate blood flow in it 

<ol>
  <li> <b>Images</b> - Read in image data 
  <li> <b>Paths</b> - Create vessel centerline paths based on image data
  <li> <b>Segmentations</b> - Segment 2D slices along path geometry using various segmentation techniques
  <li> <b>Models</b> - Generate a solid model from segmentations
  <li> <b>Meshes</b> - Generate a finite element mesh from the solid model
  <li> <b>Simulations</b> - Perform a CFD simulation using the element mesh and solid model
</ol>

The <a href="https://simtk.org/frs/download_confirm.php/file/5113/DemoProject.zip?group_id=930"> Demo Project </a>
is a complete SimVascular project containing the data created by echo of these steps. 


