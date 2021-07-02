
<h2 id="data_manager"> Data Manager </h2>

The <i> Data Manager </i> is used to view a <i>Project</i> as a hierarchy of <i>Tools</i> and <i>Data Nodes </i>
representing individual <i>Tool</i> data: images, paths, segmentations, models, meshes, and simulation jobs. The <i> Data Manager  </i>
provides an interface to interactively manage adding/removing <i>Tools</i> and changing some of the properties used to
display the geometric data created by a <i>Tool</i> (e.g. color).

The <i> Data Manager  </i> view of the
<a href="https://simtk.org/frs/download_confirm.php/file/5113/DemoProject.zip?group_id=930"> Demo Project </a>
created following the steps demonstrated in the <a href="#tutorial"> Tutorial</a> section is shown in Fig. 4

<figure>
  <img class="svImg svImgSm"  src="documentation/quickguide/imgs/demo-data-manager.png">
  <figcaption class="svCaption">Fig. 4 &nbsp An example of a <i>Project</i> displayed in the <i>Data Manager</i>.
      Instances of <i>Tools</i> added to the <i>Project</i> (e.g. aorta) are shown below the core <b>Images</b>, <b>Paths</b>,
      <b>Segmentations</b>, <b>Models</b>, <b>Meshes</b>, <b>Simulations</b>, <b>svFSI</b>, and
      <b>ROMSimulations</b> <b>Tool</b> names.
  </figcaption>
</figure>



To show/hide data (in Display):

	Toggle on/off the checkbox next to the corresponding data node in Data Manager

When you right click the data node, a menu pops up. It gives you many functions to deal with data nodes. Some functions are only available to data nodes in a certain type.

<figure>
  <img class="svImg svImgSm"  src="documentation/quickguide/imgs/datamanagermenu.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

The functions for all types of data include:

**Global Reinit:** Reset 2D/3D views of Display using the maximum Cartesian space of all the data nodes in Data Manager <br>
**Save...:** Save the selected data node to a file <br>
**Reinit:**  Reset 2D/3D views of Display using the Cartesian space of the selected data node in Data Manager <br>
**Show only selected nodes:**  Show the selected data nodes in Display <br>
**Toggle visibility:**  show ( or hide) the selected data nodes in Display if they are hidden (or visible) <br>
**Details:** show more information about the selected data node in a popup dialog, such as dimensions, spacing, etc. <br>
**Remove:** remove the data node from Data Manager <br>
**Opacity:** change the opacity of the selected data node <br>
**Color:** click the color button to change the color of the selected data node <br>
**Rename:** Rename the selected data node<br>
**Copy:** copy the selected data node <br>
**Paste:** duplicate the copied data node in a folder in Data Manager <br>


As shown in the figure above, the functions only for images include:

**Texture Interpolation:** Smoothes the image, so that no single pixels are visible anymore. <br>
**Colormap:** Change the colormap for the image <br>
