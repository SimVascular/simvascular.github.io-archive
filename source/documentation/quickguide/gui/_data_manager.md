
<h2 id="data_manager"> Data Manager </h2>

The <i> Data Manager </i> is used to view a <i>Project</i> as a hierarchy of <i>Tools</i> and <i>Data Nodes </i>
representing the data of a <i>Tool</i> instance: images, paths, segmentations, models, meshes, and simulation jobs. 
Most of the <i>Tools</i> produce geometry that can be interactively viewed in the graphics widows of the 
<a href="#display"> Display </a> area of the main window. The <i> Data Manager  </i> provides an interface to interactively 
manage adding/removing <i>Tool</i> instances and changing some of the properties used to display the geometric data created by a 
<i>Tool</i> (e.g. color).

When creating a new <i>Project</i> the <i> Data Manager </i> displays a list of core <i>Tool</i> types (Fig. 4).

<figure>
  <img class="svImg svImgSm"  src="documentation/quickguide/gui/images/data-manager-new-project.png">
  <figcaption class="svCaption">Fig. 4 &nbsp The <i>Data Manager</i> of a new <i>Project</i> listing 
      the core <b>Images</b>, <b>Paths</b>, <b>Segmentations</b>, <b>Models</b>, <b>Meshes</b>, <b>Simulations</b>, 
      <b>svFSI</b>, and <b>ROMSimulations</b> <b>Tool</b> types.
  </figcaption>
</figure>

Adding a new <i>Tool</i> to the <i>Project</i> creates a new <i>Data Nodes </i> under the appropriate <i>Tool</i> type.
The <i> Data Manager  </i> view of the
<a href="https://simtk.org/frs/download_confirm.php/file/5113/DemoProject.zip?group_id=930"> Demo Project </a>
created following the steps demonstrated in the <a href="#tutorial"> Tutorial</a> section is shown in Fig. 5.

<figure>
  <img class="svImg svImgSm"  src="documentation/quickguide/gui/images/demo-data-manager.png">
  <figcaption class="svCaption">Fig. 5 &nbsp An example of a <i>Project</i> displayed in the <i>Data Manager</i>.
      Instances of <i>Tools</i> added to the <i>Project</i> (e.g. aorta) are shown below the core <b>Images</b>, <b>Paths</b>,
      <b>Segmentations</b>, <b>Models</b>, <b>Meshes</b>, <b>Simulations</b>, <b>svFSI</b>, and
      <b>ROMSimulations</b> <b>Tool</b> types.
  </figcaption>
</figure>

The <i> Data Manager  </i> hierarchy from Fig 5. shows that the following <i>Tools</i> are defined for the <i>Project</i>

<ul style="list-style-type:none;">
  <li> <b>Images</b> - A single <i>Tool</i> named <b>sample_data-cm</b>
  <li> <b>Paths</b> - Two <i>Tools</i> named <b>aorta</b> and <b>right_iliac</b>.
  <li> <b>Segmentations</b> - Two <i>Tools</i> named <b>aorta</b> and <b>right_iliac</b>
  <li> <b>Models</b> - A single <i>Tool</i> named <b>demo</b>
  <li> <b>Meshes</b> - A single <i>Tool</i> named <b>demomesh</b>
  <li> <b>Simulations</b> - A single <i>Tool</i> named <b>demojob</b>
</ul>
<br>


<h3 id="data_manager_interaction"> Interacting with the Data Manager </h3>

Interaction with the <i> Data Manager  </i> is performed using the mouse. The resulting action depends on if a
<i>Tool</i> type or a <i>Data Nodes</i> is selected. The mouse buttons have the following functions 

<table class="table table-bordered" style="width:100%">
  <caption> <b> Data Manager mouse button function </b> </caption>
  <tr>
    <th> Mouse Button </th>
    <th> Function </th>
  </tr>

  <tr>
    <td> Left </td>
    <td> Used to select GUI controls to manage <i>Tool</i> data visibility and expand/collapse <i>Tool</i> hierarchy </td>
  </tr>

  <tr>
    <td> Left, double click </td>
    <td> 
      <b> <i>Tool</i> type</b> - Expand/collapse <i>Tool</i> <i>Data Nodes</i> <br><br>
      <b> <i>Tool</i> <i>Data Node</i> </b> - Brings up the <i>Tool</i> panel  </td>
     </td>
  </tr>

  <tr>
    <td> Right </td>
    <td> Opens a <i>Data Manager</i> menu
  </tr>

</table>
<br>


The <i> Data Manager  </i> has two GUI controls that are selected with the left mouse button

<table class="table table-bordered" style="width:100%">
  <caption> <b> Data Manager mouse button function </b> </caption>
  <tr>
    <th> Control </th>
    <th> Function </th>
    <th> Example </th>
  </tr>

  <tr>
    <td> 
      <img src="documentation/quickguide/gui/images/data-manager-gui-control-arrow-1.png" width="30" height="22">
    </td>
    <td> Selecting the arrow toggles the display of the <i>Tool</i> instances. <br><br>
         Double clicking on a <i>Tool</i> type performs the same function.
    </td>
    <td> 
      <b> Toggle off</b><img src="documentation/quickguide/gui/images/data-manager-gui-control-arrow-2.png" width="160" height="23"> <br> <br>
      <b> Toggle on</b> <img src="documentation/quickguide/gui/images/data-manager-gui-control-arrow-3.png" width="160" height="70">
    </td>
  </tr>

  <tr>
    <td> 
      <img src="documentation/quickguide/gui/images/data-manager-gui-control-box-1.png" width="30" height="22">
    </td>
    <td> Selecting the CheckBox toggles the display of <i>Tool</i> geometry in the <i>Display</i>. 
         The CheckBox changes to blue when on. <br> <br>
         Selecting the box for a <i>Tool</i> type toggles the display for all instances of that <i>Tool</i>.
    </td>
    <td> 
      <b> Toggle off</b><img src="documentation/quickguide/gui/images/data-manager-gui-control-box-3.png" width="160" height="70"> <br> <br>
      <b> Toggle on</b> <img src="documentation/quickguide/gui/images/data-manager-gui-control-box-2.png" width="160" height="70">
    </td>
  </tr>
</table> 
<br>


<h3 id="data_manager_menu"> Data Manager Menus </h3>

The <i> Data Manager  </i> menus used to manage <i>Tools</i> are opened using the right mouse button. Selecting a <i>Tool</i> type
opens a menu containing options common to all <i>Tool</i> types and options specialized for a particular <i>Tool</i> type. 
Specialized options are located at the bottom of a menu and are separated from the common options by a line (Fig 6.).

<figure>
  <img class="svImg svImgLg"  src="documentation/quickguide/gui/images/data-manager-type-menu.png"> 
  <figcaption class="svCaption"> Fig. 6 &nbsp The menu for a <b>Paths</b> Tool type showing common options in the top portion
                                 of the menu (<b>Global Reinit</b> through <b>Paste</b>) and specialized options (<b>Create Path</b>,
                                 <b>Import Paths</b> and <b>Export All as Legacy Paths</b>) separated from them by a line. 
  </figcaption>
</figure>
<br>


<table class="table table-bordered" style="width:100%">
  <caption> <b> Data Manager Tool Type Common Menu Options</b> </caption>
  <tr>
    <th> Menu Option </th>
    <th> Description </th>
  </tr>

  <tr>
    <td>Global Reinit</td>
    <td>Reset 2D/3D views of Display using the maximum Cartesian space of all the data nodes in Data Manager </td>
  </tr>

  <tr>
    <td> Save ... </td>
    <td> Save the selected <i>Data Node</i> to a file </td>
  </tr>

  <tr>
    <td> Reinit </td>
    <td> Reset 2D/3D views of Display using the Cartesian space of the selected data node in Data Manager </td>
  </tr>

  <tr>
    <td> Show only selected nodes </td>
    <td> Show the selected data nodes in Display </td>
  </tr>

  <tr>
    <td> Toggle visibility </td>
    <td> Show ( or hide) the selected data nodes in Display if they are hidden (or visible) </td>
  </tr>

  <tr>
    <td> Details</td>
    <td> Show more information about the selected data node in a popup dialog, such as dimensions, spacing, etc. </td>
  </tr>

  <tr>
    <td> Remove</td>
    <td> Remove the data node from Data Manager </td>
  </tr>

  <tr>
    <td> Opacity</td>
    <td> Change the opacity of the selected data node </td>
  </tr>

  <tr>
    <td> Color</td>
    <td> Select the color button to change the color of the selected data node </td>
  </tr>

 <tr>
    <td> Rename</td>
    <td> Rename the selected data node </td>
  </tr>

 <tr>
    <td> Copy</td>
    <td> copy the selected data node </td>
  </tr>

 <tr>
    <td> Paste</td>
    <td> Duplicate the copied data node in a folder in <i>Data Manager</i> </td>
  </tr>

</table>


<table class="table table-bordered" style="width:100%">
  <caption> <b> Data Manager Tool Type Common Menu Options</b> </caption>
  <tr>
    <th> Tool Type </th>
    <th> Menu </th>
    <th> Description </th>
  </tr>

  <tr>
    <td> Images </td>
    <td> <img src="documentation/quickguide/gui/images/data-manager-image-type-menu.png" width="150" height="200"> </td>
    <td> 
      <i>Add/Replace Image</i> - 
    </td> 
  </tr>

  <tr>
    <td> Paths </td>
    <td> <img src="documentation/quickguide/gui/images/data-manager-paths-type-menu.png" width="150" height="200"> </td>
    <td>
      <i> Create Path </i> - <br>
      <i> Import Paths </i> - <br>
      <i> Export All as Legacy Paths </i> -
    </td> 
  </tr>


  <tr>
    <td> Segmentations </td>
    <td> <img src="documentation/quickguide/gui/images/data-manager-seg-type-menu.png" width="150" height="200"> </td>
    <td>
      <i> Create Contour Group </i> - <br>
      <i> Import Segmentations </i> - <br>
      <i> Import Legacy Segmentations </i> - <br>
      <i> Export All as Legacy Segmentations </i> -
    </td>
  </tr>


</table>
