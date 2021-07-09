<h1 id="gui"> Graphical User Interface </h1>

The SimVascular GUI provides an interface for interactively managing the input of data needed for each step in the 
image-based modeling pipeline. The GUI provides different graphical controls (aka widgets) used to input data values 
and methods to interact and query image and geometical data in a graphics window.

The following table lists the controls used by the SimVascular GUI

<table class="table table-bordered" style="width:100%">
  <tr>
    <th> Control </th>
    <th> Descriptiton </th>
    <th> Example </th>
  </tr>

  <tr>
    <td> Button </td>
    <td> A rectangular region that typically displays a text label describing its action. 
         A button performs an action when pressed (clicked on)</td>
    <td><img src="documentation/quickguide/gui/images/gui-button.png" width="100" height="25"> </td>
  </tr>

  <tr>
    <td> Checkbox </td>
    <td> A rectangular region that permits the user to make a binary choice, i.e. a choice between one of two possible mutually 
         exclusive options </td>
    <td><img src="documentation/quickguide/gui/images/gui-check-box.png" width="100" height="20"> </td>
  </tr>

  <tr>
    <td> ComboBox </td>
    <td> A drop-down list that allows the user to select a value from the list. </td>
    <td> <img src="documentation/quickguide/gui/images/gui-combo-box.png" width="100" height="30"> </td>
  </tr>

  <tr>
    <td> DialogBox </td>
    <td> A popup window that asks a user for input. </td>
    <td> <img src="documentation/quickguide/gui/images/gui-dialog.png" width="150" height="125">  </td>
  </tr>

  <tr>
    <td> Icon </td>
    <td> A small graphical representation of a <i>Tool</i> or file. </td>
    <td> <img src="documentation/quickguide/gui/images/gui-icon.png" width="50" height="40">  </td>
  </tr>

  <tr>
    <td> Menu </td> 
    <td> A list of choices offered to the user for selection. </td> 
    <td> <img src="documentation/quickguide/gui/images/gui-menu.png" width="100" height="150">  </td>
  </tr>

  <tr>
    <td> MenuBar </td> 
    <td> A thin, horizontal bar containing the text labels for a group of menus. 
    <td> <img src="documentation/quickguide/gui/images/gui-menu-bar.png" width="200" height="20"> </td>
  </tr>

  <tr>
    <td> Slider </td> 
    <td> A horizontal bar used to set a value by moving an indicator on the bar horizontally. 
         Values can also be entered in the text box. </td>
    <td> <img src="documentation/quickguide/gui/images/gui-slider.png" width="400" height="25">  </td>
  </tr>

  <tr>
    <td> SpinBox </td> 
    <td> A rectangular region used to choose a value by clicking the up/down buttons or pressing up/down on the keyboard 
         to increase/decrease the value currently displayed.
    <td> <img src="documentation/quickguide/gui/images/gui-spin-box.png" width="200" height="25">  </td>
  </tr>

  <tr>
    <td> Table </td> 
    <td> A rectangular region that arranges data (e.g. text or other widges) into rows and columns of cells. 
         Data can be modified by selecting a cell in the table. </td>
    <td> <img src="documentation/quickguide/gui/images/gui-table.png" width="300" height="200">  </td>
  </tr>

  <tr>
    <td> TextBox </td> 
    <td> A rectangular region used to entry string, interger or float values. </td>
    <td> <img src="documentation/quickguide/gui/images/gui-text-box.png" width="130" height="24">  </td>
  </tr>

  <tr>
    <td> ToolBar </td> 
    <td> A row of buttons at the top of window that controls software functions. </td>
    <td> <img src="documentation/quickguide/gui/images/gui-tool-bar.png" width="250" height="20">  </td>
  </tr>

  <tr>
    <td> ToolBox </td> 
    <td> An area of a <i>Tool</i> panel that contains multiple pages of GUI widgets identified by a section 
         of rectangles with text at the Toolbox bottom. <br> Selecting a rectangle shows another page. </td>
    <td> <img src="documentation/quickguide/gui/images/gui-tool-box.png" width="200" height="300">  </td>
  </tr>

</table>

<br> <br>

The SimVascular main window GUI is composed of a _MenuBar_, _ToolBar_, _Data Manager_, _Image Navagator_ and _Display_. 
An additional _Tool Panel_ is displayed on the right side of the window when a <i>Tool</i> is active.

<figure>
  <img class="svImg svImgLg"  src="documentation/quickguide/gui/images/mainwindow.png"> 
  <figcaption class="svCaption">Fig. 3 &nbsp The SimVascular GUI layout</figcaption>
</figure>

<br>

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #d0d0d0; border-left: 6px solid #d0d0d0">
The SimVascular GUI may look slightly different on MacOS, Ubuntu and Windows platforms.
</div>
<br> <br>


<h2 id="gui_menubar"> MenuBar </h2>

The <i>MenuBar</i> contains _File_, _Edit_, _Tools_, _Window_ and _Help_ menu items. 

<figure>
  <img class="svImg svImgMd"  src="documentation/quickguide/gui/images/menus.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>


<h3 id="gui_menubar_file"> File Menu </h3>

The _File_ menu is used to create, open and save SimVascular _Projects_. Creating or opening a _Project_ is typically the first
step when using SimVascular.

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #e6e600; border-left: 6px solid #e6e600">
It is not recommended to use the <i>Open File</i> menu item because it is used to read files (e.g. image files) outside of 
a SimVascular <i>Project</i>. The data read in from the file can therefore not be used by any SimVascular tools (e.g. Segmentations). 
</div>
<br>


<h3 id="gui_menubar_tools"> Tools Menu </h3>

The _Tools_ menu is used to used to add a SimVascular <i>Tool</i> to the <i>Tool Panel</i>. It This does not add a new <i>Tool</i> 
to the <i>Project</i>. The <i>Level Set</i> menu item creates a level set segmentation <i>Tool</i> 
(see <a href="http://simvascular.github.io/docsModelGuide.html#modeling3DSeg"> 3D Level Set Segmentation </a>). 
The <i>Python Console</i> menu item opens a panel used to execute Python scripts. 
(see <a href="http://simvascular.github.io/docsPythonInterface.html#console"> Python Console </a>). 
The other menu items are mostly MITK tools that are not very useful. 

<br>
<h2 id="gui_toolbar"> ToolBar </h2>

The <i>ToolBar</i> is composed of three sections. The first section contains icons used to save a <i>Project</i>, undo an operation, hide/show
the <i>Image Navagator</i> and toggle the <b>A</b>xial, <b>S</b>agital and <b>C</b>oronal image scan slices.

<figure>
  <img class="svImg svImgMd"  src="documentation/quickguide/gui/images/toolbar-1.png"> 
  <figcaption class="svCaption">The first ToolBar section </figcaption>
</figure>

<table class="table table-bordered" style="width:100%">
  <tr>
    <th> Icon </th>
    <th> Description </th>
  </tr>

  <tr>
    <td> <img src="documentation/quickguide/gui/images/gui-save-icon.png" width="40" height="35"> </td>
    <td> Save the Project. </td>
  </tr>

  <tr>
    <td> <img src="documentation/quickguide/gui/images/gui-undo-icon.png" width="75" height="32"> </td>
    <td> Undo an operation. </td>
  </tr>

  <tr>
    <td> <img src="documentation/quickguide/gui/images/gui-img-nav-icon.png" width="45" height="40"> </td>
    <td> Hide/show the <i>Image Navagator</i>. </td>
  </tr>

  <tr>
    <td> <img src="documentation/quickguide/gui/images/gui-a-plane-icon.png" width="40" height="40"> </td>
    <td> Hide/show the axial image scan slice. </td>
  </tr>

  <tr>
    <td> <img src="documentation/quickguide/gui/images/gui-s-plane-icon.png" width="40" height="40"> </td>
    <td> Hide/show the sagital image scan slice. </td>
  </tr>

  <tr>
    <td> <img src="documentation/quickguide/gui/images/gui-c-plane-icon.png" width="40" height="40"> </td>
    <td> Hide/show the coronal image scan slice. </td>
  </tr>


</table> 


<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #e6e600; border-left: 6px solid #e6e600">
SimVascular does not automatically save data created by a <i>Tool</i> to the project. If a project is closed without
saving the data will be lost. 
</div>
<br>


The second section duplicates the _Tools_ menu using icons. 

<figure>
  <img class="svImg svImgMd"  src="documentation/quickguide/gui/images/toolbar-2.png"> 
  <figcaption class="svCaption"> The second ToolBar section</figcaption>
</figure>

The third second section duplicates the _Tools_ menu using icons. 

<figure>
  <img class="svImg svImgMd"  src="documentation/quickguide/gui/images/toolbar-3.png"> 
  <figcaption class="svCaption"> The third ToolBar section</figcaption>
</figure>

