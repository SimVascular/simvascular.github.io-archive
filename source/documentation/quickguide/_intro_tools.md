<h2 id="intro_tools"> Tools </h2>

The SimVascular application provides a set of core <i>Tools</i> (aka plugins) implementing methods for each step in the 
SimVascular image-based modeling pipeline. The follow lists each core <i>Tool</i> type and primary function

<ol>
  <li> <b>Paths</b> - Interactively creates paths based on image data 
  <li> <b>Segmentations</b> - Segments 2D slices along path geometry using various segmentation techniques
  <li> <b>Models</b> - Generates surface and solid models from segmentations 
  <li> <b>Meshes</b> - Generates a finite element mesh from a solid model
  <li> <b>Simulations</b> - Performs a CFD simulation 
  <li> <b>svFSI</b> - Performs a coupled fluid-solid interaction simulation 
  <li> <b>ROMSimulations</b> - Performs a reduced-order model (ROM) simulation 
</ol> 

One or more instances of these <i>Tool</i> types are created to implement an image-based modeling pipeline for a particular
application. An instance of a <i>Tool</i> is called a <i>Data Node</i>.

<i>Tools</i> typically use data from other tools to perform their functions. For example, the <i>Segmentations Tool</i> uses 
paths created by the <i>Paths Tool</i> to position and orient 2D slices in the 3D image volume. The data used by a 
<i>Tool</i> is specified by the user.

The geometry created by each <i>Tool</i> is typically stored in <a href="https://vtk.org"> Visualization Toolkit (VTK) </a> 
VTP and VTU <a href="https://vtk.org/wp-content/uploads/2015/04/file-formats.pdf"> VTK File Formats </a>.

Each <i>Tool</i> has a panel containing GUI controls (i.e. widgets) used to specify the parameters that control tool behavior. 
A <i>Tool</i> panel is displayed using the <a href="#data_manager"> Data Manager </a>.

<br>
<h3 id="intro_tools_instances"> Creating Tool Instances</h3>
An instance of a particular <i>Tool</i> type is created using options selected from <a href="#data_manager_menus">Data Manager Menus</a>. 
Some <i>Tool</i> instances can be created in two ways based on the source of the data used by the <i>Tool</i> 

<ol>
  <li> <b>Internal</b> - Data used by the <i>Tool</i> is obtained from another <i>Tool</i>.<br><br> 
                         Example: A <i>Models Tool</i> uses segmentations created by a <i>Segmentations Tool</i>.  </li> <br>

  <li> <b>External</b> - Data used by the <i>Tool</i> is read in (imported) from a file.  The instances of <i>Paths</i>, 
                         <i>Segmentations</i> and <i>Models</i> <i>Tools</i> can be created by reading data from a file. <br><br>
                         Example: <i>Models Tool</i> geometry is read in from a VTK VTP file.</li> 

</ol>



