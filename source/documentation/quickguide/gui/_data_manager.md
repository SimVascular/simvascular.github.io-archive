
<h2 id="data_manager"> Data Manager </h2>

The <i> Data Manager </i> is used to view a <i>Project</i> as a hierarchy of <i>Tools</i> and <i>Data Nodes </i>
representing the data created by <i>Tool</i> instances: images, paths, segmentations, models, meshes, and simulation jobs. 
Most of the <i>Tools</i> produce geometry that can be interactively viewed in the 2D and 3D views of the 
<a href="#display"> Display </a> area of the main window. The <i> Data Manager  </i> provides an interface to interactively 
manage adding/removing <i>Tool</i> instances and changing some of the properties used to display the geometric data created by a 
<i>Tool</i> (e.g. color).

When creating a new <i>Project</i> the <i> Data Manager </i> displays a list of core <i>Tool Types</i> (Fig. 6).

<figure>
  <img class="svImg svImgSm"  src="documentation/quickguide/gui/images/data-manager-new-project.png">
  <figcaption class="svCaption">Fig. 6 &nbsp The <i>Data Manager</i> of a new <i>Project</i> listing 
      the core <b>Images</b>, <b>Paths</b>, <b>Segmentations</b>, <b>Models</b>, <b>Meshes</b>, <b>Simulations</b>, 
      <b>svFSI</b>, and <b>ROMSimulations</b> <b>Tool Types</b>.
  </figcaption>
</figure>

Adding a new <i>Tool</i> to the <i>Project</i> creates a new <i>Data Node </i> under the appropriate <i>Tool Type</i>.
The <i> Data Manager  </i> view of the
<a href="https://simtk.org/frs/download_confirm.php/file/5113/DemoProject.zip?group_id=930"> Demo Project </a>
created following the steps demonstrated in the <a href="#tutorial"> Tutorial</a> section is shown in Fig. 7.

<figure>
  <img class="svImg svImgSm"  src="documentation/quickguide/gui/images/demo-data-manager.png">
  <figcaption class="svCaption">Fig. 7 &nbsp An example of a <i>Project</i> displayed in the <i>Data Manager</i>.
      Instances of <i>Tools</i> added to the <i>Project</i> (e.g. <b>aorta</b>) are shown below the core <b>Images</b>, <b>Paths</b>,
      <b>Segmentations</b>, <b>Models</b>, <b>Meshes</b>, <b>Simulations</b>, <b>svFSI</b>, and
      <b>ROMSimulations</b> <b>Tool Types</b>.
  </figcaption>
</figure>

The <i> Data Manager  </i> hierarchy shown in Fig 7. indicates that the following <i>Tool</i> instances are defined for the 
<i>Project</i> as one or more  <i>Data Nodes</i>

<ul style="list-style-type:none;">
  <li> <b>Images</b> - A single <i>Tool</i> instance named <b>sample_data-cm</b>
  <li> <b>Paths</b> - Two <i>Tool</i> instances named <b>aorta</b> and <b>right_iliac</b>.
  <li> <b>Segmentations</b> - Two <i>Tool</i> instances named <b>aorta</b> and <b>right_iliac</b>
  <li> <b>Models</b> - A single <i>Tool</i> instance named <b>demo</b>
  <li> <b>Meshes</b> - A single <i>Tool</i> named <b>demomesh</b>
  <li> <b>Simulations</b> - A single <i>Tool</i> instance named <b>demojob</b>
</ul>
<br>


<h3 id="data_manager_interaction"> Interacting with the Data Manager </h3>

Interaction with the <i> Data Manager  </i> is performed using the mouse. The resulting action depends on if a
<i>Tool Type</i> or a <i>Data Nodes</i> is selected. The mouse buttons have the following functions 

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
      <b> <i>Tool Type</i></b> - Expand/collapse <i>Tool</i> <i>Data Nodes</i> <br><br>
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
         Double clicking on a <i>Tool Type</i> performs the same function.
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
         Selecting the box for a <i>Tool Type</i> toggles the display for all instances of that <i>Tool</i>.
    </td>
    <td> 
      <b> Toggle off</b><img src="documentation/quickguide/gui/images/data-manager-gui-control-box-3.png" width="160" height="70"> <br> <br>
      <b> Toggle on</b> <img src="documentation/quickguide/gui/images/data-manager-gui-control-box-2.png" width="160" height="70">
    </td>
  </tr>
</table> 
<br>


<h3 id="data_manager_menus"> Data Manager Menus </h3>

The <i> Data Manager  </i> menus used to manage <i>Tools</i> are opened using the right mouse button. Selecting a <i>Tool Type</i>
opens a menu containing options common to all <i>Tool Types</i> and additional options specialized for a particular <i>Tool Type</i>. 
Specialized options are located at the bottom of a menu and are separated from the common options by a line (Fig 8.).

<figure>
  <img class="svImg svImgLg"  src="documentation/quickguide/gui/images/data-manager-type-menu.png"> 
  <figcaption class="svCaption"> Fig. 8 &nbsp The menu for a <b>Paths</b> Tool Type showing common options in the top portion
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
    <td>Reset 2D/3D views of the <i>Display</i> using the maximum Cartesian space of all the <i>Data Nodes</i> in the <i>Data Manager</i> </td>
  </tr>

  <tr>
    <td> Save ... </td>
    <td> Save the selected <i>Data Node</i> to a file </td>
  </tr>

  <tr>
    <td> Reinit </td>
    <td> Reset 2D/3D views of the <i>Display</i> using the Cartesian space of the selected <i>Data Node</i> in the <i>Data Manager</i> </td>
  </tr>

  <tr>
    <td> Show only selected nodes </td>
    <td> Show the selected <i>Data Nodes</i> in the <i>Display</i> </td>
  </tr>

  <tr>
    <td> Toggle visibility </td>
    <td> Show ( or hide) the selected <i>Data Nodes</i> in the <i>Display</i> if they are hidden (or visible) </td>
  </tr>

  <tr>
    <td> Details</td>
    <td> Show more information about the selected <i>Data Node</i> in a popup dialog, such as dimensions, spacing, etc. </td>
  </tr>

  <tr>
    <td> Remove</td>
    <td> Remove the <i>Data Node</i> from the <i>Data Manager</i> </td>
  </tr>

  <tr>
    <td> Opacity</td>
    <td> Change the opacity of the selected <i>Data Node</i> </td>
  </tr>

  <tr>
    <td> Color</td>
    <td> Selecting the colored <i>Button</i> brings a color palette used to change the color of the selected <i>Data Node</i> </td>
  </tr>

 <tr>
    <td> Rename</td>
    <td> Rename the selected <i>Data Node</i> </td>
  </tr>

 <tr>
    <td> Copy</td>
    <td> Copy the selected <i>Data Node</i> </td>
  </tr>

 <tr>
    <td> Paste</td>
    <td> Duplicate the copied <i>Data Node</i> in a folder in <i>Data Manager</i> </td>
  </tr>
</table>
<br>


The following table lists each <i>Tool Type</i> with a brief description of each of its specialized menu options.

<table class="table table-bordered" style="width:100%">
  <caption> <b> Data Manager Tool Type Specialized Menu Options</b> </caption>
  <tr>
    <th> Tool Type </th>
    <th> Menu </th>
    <th> Description </th>
  </tr>

  <tr>
    <td> Images </td>
    <td> <img src="documentation/quickguide/gui/images/data-manager-image-type-menu.png" width="150" height="200"> </td>
    <td> 
      <i>Add/Replace Image</i> - Add or replace the image volume data for the <i>Project</i>. Image data can be DICOM or VTK VTI files.
      <br><br>
      <div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #e6e600; border-left: 6px solid #e6e600"> 
      A <i>Project</i> can contain only a single image volume. Adding new image volume replaces the current one.
      </div>
    </td> 
  </tr>

  <tr>
    <td> Paths </td>
    <td> <img src="documentation/quickguide/gui/images/data-manager-paths-type-menu.png" width="150" height="200"> </td>
    <td>
      <i> Create Path </i> - Create an instance of a <i>Paths</i> tool. <i>Paths</i> are then created from <i>Image</i> tool data.<br>
      <i> Import Paths </i> - Create an instance of a <i>Paths</i> tool from a <i>Path</i> data contained in SimVascular .pth or legacy .paths file. <br>
      <i> Export All as Legacy Paths </i> - N/A
    </td> 
  </tr>

  <tr>
    <td> Segmentations </td>
    <td> <img src="documentation/quickguide/gui/images/data-manager-seg-type-menu.png" width="150" height="200"> </td>
    <td>
      <i> Create Contour Group </i> - Create an instance of a <i>Segmentations</i> tool. <i>Segmentations</i> are created using geometry from a <i>Paths</i> tool.  <br>
      <i> Import Segmentations </i> - Create an instance of a <i>Segmentations</i> tool from the data contained in a SimVascular .ctgr file. <br>
      <i> Import Legacy Segmentations </i> - N/A <br>
      <i> Export All as Legacy Segmentations </i> - N/A
    </td>
  </tr>

  <tr>
    <td> Models </td>
    <td> <img src="documentation/quickguide/gui/images/data-manager-models-type-menu.png" width="150" height="200"> </td>
    <td>
      <i> Create Model </i> - Create an instance of a <i>Models</i> tool. 
                              A <i>Model</i> is created using segmentation geometry from one or more <i>Segmentations</i> tools. <br>
      <i> Import Solid Model </i> - Create an instance of a <i>Models</i> tool from a solid model file. 
                                    Supported file formats: VTP, STL and STEP.  <br>
      <br><br>
      <div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #d0d0d0; border-left: 6px solid #d0d0d0">
      A model can be imported into a <i>Project</i> without an image volume. After importing the model select the
      <b>Global Reinit</b> <i>Data Manager Menu</i> option to view the model.  
      </div>

    </td>
  </tr>

  <tr>
    <td> Meshes </td>
    <td> <img src="documentation/quickguide/gui/images/data-manager-meshes-type-menu.png" width="150" height="200"> </td>
    <td>
      <i> Create Mesh </i> - Create an instance of a <i>Meshes</i> tool. 
                             A mesh is created using a model from a <i>Models</i> tool. <br>
      <br>
      <div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #e6e600; border-left: 6px solid #e6e600">
      A mesh cannot be imported into a <i>Project</i>.
      </div>

    </td>
  </tr>

  <tr>
    <td> Simulations </td> 
    <td> <img src="documentation/quickguide/gui/images/data-manager-sims-type-menu.png" width="150" height="200"> </td>
    <td>
      <i> Create Simulation job </i> - Create an instance of a <i>Simulations</i> tool.     
                             A CFD simulation job is created using a model from a <i>Models</i> tool and a mesh from 
                             a  <i>Meshes</i> tool. <br>
    </td>
  </tr>

  <tr>
    <td> svFSI </td>
    <td> <img src="documentation/quickguide/gui/images/data-manager-fsi-type-menu.png" width="150" height="200"> </td>
    <td>
      <i> Create svFSI job </i> - Create an instance of a <i>svFSI</i> tool.
                                  A multi-physics simulation job is created using a model from a <i>Models</i> tool and 
                                  a mesh from a <i>Meshes</i> tool. <br>
    </td>
  </tr>

  <tr>
    <td> ROMSimulations </td>
    <td> <img src="documentation/quickguide/gui/images/data-manager-rom-type-menu.png" width="150" height="200"> </td>
    <td>
      <i> Create ROM Simulation job </i> - Create an instance of a <i>ROMSimulation</i> tool.
                                           A reduced-order model (ROM) simulation job is created using a model from a 
                                           <i>Models</i> tool.
    </td>
  </tr>
</table>


