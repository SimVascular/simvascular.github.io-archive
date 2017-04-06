## Data Manager

Data Manager is normally located on the left side of the main window. It lists and organize all the loaded data in a tree structure. After data is loaded from a file, a data node (representing the data) shows in Data Manager.

To open a file (loading data into Data Manager):

	Menu: File → Open File...

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
