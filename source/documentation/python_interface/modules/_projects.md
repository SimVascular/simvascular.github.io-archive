## SimVascular Projects ##

The SimVascular GUI requires an active project to access the image-based modeling pipeline. A project organizes and saves data to 
predefined subdirectories located under the main project directory. There is a separate folder for each tool in the image-based 
modeling pipeline. Each tool has an XML format file with a specific extension associated with it that stores data used by the tool
to represent geometry and parameters. The parameters store the tool's state and are typically displayed in the GUI and can be modified 
by the user. The predefined subdirectories and XML file extension for each tool are

<ul style="list-style-type:none;">
   <li> <b> Images </b> - Imagine tool supports several formats: DICOM <b>.dcm</b>, VTK image <b>.vti</b>, and other formats.
   <li> <b> Meshes </b> - Meshing tool <b>.msh</b> </li>
   <li> <b> Models </b> - Modeling tool <b>.mdl</b> </li>
   <li> <b> Paths </b> - Path planning tool <b>.pth</b> </li>
   <li> <b> Segmentations </b> - Segmentation tool <b>.ctgr</b> </li>
   <li> <b> Simulations </b> - Simulation tool <b>.sjb</b> </li>
   <li> <b> Simulations1d </b> - 1D Simulation tool <b>.s1djb</b> </li>
   <li> <b> svFSI </b> - FSI Simulation tool <b>.fsijob</b> </li>
</ul>


<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #d0d0d0; border-left: 6px solid #d0d0d0">
The SimVascular Python API cannot create SimVascular projects. Projects must be created interactively using the GUI.
</div>

<br>
Tool XML files were designed to store data derived from time-varying imaging data (e.g. 4D MRI). For this reason each file 
has a <b>timestep</b> element used to identify data with a discrete integer time step. Each <b>sv</b> module defines a 
<b>Series</b> class used to read in XML files and extract data for each time step.


