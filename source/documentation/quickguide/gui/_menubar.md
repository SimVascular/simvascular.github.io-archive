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

The _Tools_ menu is used to add a SimVascular <i>Tool</i> to the <i>Tool Panel</i>. It This does not add a new <i>Tool</i> 
to the <i>Project</i>. The <i>Level Set</i> menu item creates a level set segmentation <i>Tool</i> 
(see <a href="http://simvascular.github.io/docsModelGuide.html#modeling3DSeg"> 3D Level Set Segmentation </a>). 
The <i>Python Console</i> menu item opens a panel used to execute Python scripts. 
(see <a href="http://simvascular.github.io/docsPythonInterface.html#console"> Python Console </a>). 
The other menu items are mostly MITK tools that are typically not often used. 
