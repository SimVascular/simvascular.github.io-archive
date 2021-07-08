##Projects

The <i>Tools</i> that comprise a SimVascular pipeline and the data they create are organized as a SimVascular <i>Project</i>.
<i>Tools</i> are added to a <i>Project</i> interactively using the GUI. Multiple instances of most <i>Tools</i> can be
added to a <i>Project</i>. 

A SimVascular <i>Project</i> is stored in a directory on disk using the location and name provided by the user when creating a <i>Project</i>.
The <i>Project</i> directory contains sub-directories for each core <i>Tool</i>. Each <i>Tool</i> sub-directory in turn stores data
created by each <i>Tool</i> instance in files named by the instance. The data stored in <i>Tool</i> sub-directories are typically of
two types

<ol>
  <li> <b>Geometry Data</b> - The geometry created by the <i>Tool</i> stored in VTK VTP and VTU format files. 
  <li> <b>GUI State Data</b> - The values of the <i>Tool</i> panel GUI widgets stored in an XML format file. 
</ol>
<br>

An example <i>Project</i> directory is shown in Fig. 2. The .msh, .mdl, .pth, .ctgr and .sjb files are XML format files
storing GUI widget values.

<figure>
  <img class="svImg svImgSm"  src="documentation/quickguide/imgs/project-dir.png">
  <figcaption class="svCaption">Fig. 2 &nbsp An example of a <i>Project</i> directory showing core <i>Tool</i> 
      <b>Images</b>, <b>Segmentations</b>, <b>Models</b>, <b>Meshes</b>, <b>Simulations</b>, <b>svFSI</b>, and 
      <b>ROMSimulations</b> sub-directories. The data for each <i>Tool</i> instance (e.g. aorta) are shown under each
      <i>Tool</i> sub-directory.
  </figcaption>
</figure>

The GUI <i> Data Manager  </i> is used to view a <i>Project</i> as a hierarchy of <i>Tools</i> and <i>Data Nodes </i>
representing individual <i>Tool</i> data: images, paths, segmentations, models, meshes, and simulation jobs. The <i> Data Manager  </i>
provides a GUI interface to interactively manage adding/removing <i>Tools</i> and changing some of the properties used to
display the geometric data created by a <i>Tool</i> (e.g. color). 

The <i> Data Manager  </i> view of the 
<a href="https://simtk.org/frs/download_confirm.php/file/5113/DemoProject.zip?group_id=930"> Demo Project </a> 
created following the steps demonstrated in the tutorial section is shown in Fig. 2

<figure>
  <img class="svImg svImgSm"  src="documentation/quickguide/gui/images/demo-data-manager.png">
  <figcaption class="svCaption">Fig. 3 &nbsp An example of a <i>Project</i> displayed in the <i>Data Manager</i>. 
      Instances of <i>Tools</i> added to the <i>Project</i> (e.g. aorta) are shown below the core <b>Images</b>, <b>Paths</b>, 
      <b>Segmentations</b>, <b>Models</b>, <b>Meshes</b>, <b>Simulations</b>, <b>svFSI</b>, and 
      <b>ROMSimulations</b> <b>Tool</b> names.
  </figcaption>
</figure>

A more complete discussion of the <i> Data Manager  </i> is given below.
<br>


