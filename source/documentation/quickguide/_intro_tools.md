###Tools 

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

