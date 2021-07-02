<h1 id="gui"> Graphical User Interface </h1>

The SimVascular GUI provides an interface for interactively managing the input of data needed for each step in the 
image-based modeling pipeline. The GUI provides different graphical elements (aka widgets) used to input data values 
and methods to interact and query image and geometical data in a graphics window.

The following is a list of each of the  graphical elements used in the GUI

<ul style="list-style-type:none;">
  <li> <b>Button</b> - A button is rectangular and typically displays a text label describing its action. 
                       A button performs an action when pressed (clicked on).
                       &nbsp; &nbsp; <img src="documentation/quickguide/imgs/gui-button.png" width="100" height="25"> 
  </li>

  <li> <b>Dialog box</b> - A popup window that asks a user for input.
                       &nbsp; &nbsp <img src="documentation/quickguide/imgs/gui-dialog.png" width="150" height="125">  
                       <br> <br>
  </li>

  <li> <b>Icon</b> - Small graphical representation of a <i>Tool</i> or file.
                       &nbsp; &nbsp <img src="documentation/quickguide/imgs/gui-icon.png" width="50" height="40">  
                       <br> <br>
  </li>

  <li> <b>Menu</b> - A list of choices offered to the user for selection. 
                       &nbsp; &nbsp <img src="documentation/quickguide/imgs/gui-menu.png" width="100" height="150">  
                       <br> <br>
  </li>

  <li> <b> Menu bar </b> - A thin, horizontal bar containing the text labels for a group of menus.
                       &nbsp; &nbsp <img src="documentation/quickguide/imgs/gui-menu-bar.png" width="200" height="20">  
                       <br> <br>
  </li>

  <li> <b>Toolbar</b> - A row of buttons at the top of window that controls software functions.
                       &nbsp; &nbsp <img src="documentation/quickguide/imgs/gui-tool-bar.png" width="250" height="20">  
                       <br> <br>
  </li>

  <li> <b>Toolbox</b> - An area of a <i>Tool</i> panel that contains multiple pages of GUI widgets identified by a section 
                        of rectangles with text at the Toolbox bottom. <br> Selecting a rectangle shows another page. 
                        &nbsp; &nbsp <img src="documentation/quickguide/imgs/gui-tool-box.png" width="200" height="300">  
  </li>

</ul>
<br> <br>

The SimVascular GUI is composed of a _Menubar_, _Toolbar_, _Data Manager_, _Image Navagator_ and _Display_. An additional 
_Tool Panel_ is displayed on the left side of the window when a tool is active.

<figure>
  <img class="svImg svImgLg"  src="documentation/quickguide/imgs/mainwindow.png"> 
  <figcaption class="svCaption">Fig. 3 &nbsp The SimVascular GUI layout</figcaption>
</figure>

<br>

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #d0d0d0; border-left: 6px solid #d0d0d0">
The SimVascular GUI may look slightly different on MacOS, Ubuntu and Windows platforms.
</div>
<br> <br>


<h2 id="gui_menubar"> Menubar </h2>

The <i>Menubar</i> contains _File_, _Edit_, _Tools_, _Window_ and _Help_ menu items. 

<figure>
  <img class="svImg svImgMd"  src="documentation/quickguide/imgs/menus.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>


<h3 id="gui_menubar_file"> File Menu </h3>

The _File_ menu is used to create, open and save SimVascular _Projects_. Creating or opening a _Project_ is typically the first
step when using SimVascular.

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #e6e600; border-left: 6px solid #e6e600">
It is not recommended to use the <i>Open File</i> menu item because it is used to read files (e.g. image files) outside of 
a SimVascular <i>Project</i>. The data read in from the file can therefore not be operated on by any SimVascular tools (e.g. Segmentations). 
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
<h2 id="gui_toolbar"> Toolbar </h2>

The Toolbar is composed of three sections. The first section is used to save a <i>Project</i>, undo an operation, hide/show
the <i>Image Navagator</i> and toggle the <b>A</b>xis, <b>S</b>agital and <b>C</b>oronal image slice planes.

<figure>
  <img class="svImg svImgMd"  src="documentation/quickguide/imgs/toolbar-1.png"> 
  <figcaption class="svCaption">The first Toolbar section </figcaption>
</figure>

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #e6e600; border-left: 6px solid #e6e600">
SimVascular does not automatically save data created by a <i>Tool</i> to the project. If a project is closed without
saving the data will be lost. 
</div>
<br>


The second section duplicates the _Tools_ menu using icons. 

<figure>
  <img class="svImg svImgMd"  src="documentation/quickguide/imgs/toolbar-2.png"> 
  <figcaption class="svCaption"> The second Toolbar section</figcaption>
</figure>

The third second section duplicates the _Tools_ menu using icons. 

<figure>
  <img class="svImg svImgMd"  src="documentation/quickguide/imgs/toolbar-3.png"> 
  <figcaption class="svCaption"> The third Toolbar section</figcaption>
</figure>

