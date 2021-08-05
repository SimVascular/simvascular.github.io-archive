<h1 id="gui"> Graphical User Interface </h1>

The SimVascular GUI provides an interface for interactively managing the input of data needed for each step in the 
image-based modeling pipeline. The GUI provides different graphical controls (aka widgets) used to input data values 
and methods to interact with and query image and geometrical data in a graphics window.

The following table lists the controls used by the SimVascular GUI

<table class="table table-bordered" style="width:100%">
  <tr>
    <th> Control </th>
    <th> Description </th>
    <th> Example </th>
  </tr>

  <tr>
    <td> Button </td>
    <td> A rectangular region that typically displays a text label describing its action. 
         A button performs an action when pressed (clicked on)</td>
    <td><img src="documentation/quickguide/gui/images/gui-button.png" width="100" height="25"> </td>
  </tr>

  <tr>
    <td> CheckBox </td>
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
    <td> FileBrowser </td>
    <td> A popup window used to select a file or directory. </td>
    <td> <img src="documentation/quickguide/gui/images/gui-file-browser.png" width="345" height="186">  </td>
  </tr>

  <tr>
    <td> Icon </td>
    <td> A small graphical representation of a <i>Tool</i> or file. </td>
    <td> <img src="documentation/quickguide/gui/images/gui-icon.png" width="50" height="40">  </td>
  </tr>

  <tr>
    <td> InformationPopup </td>
    <td> A popup window that provides information to the user. </td>
    <td> <img src="documentation/quickguide/gui/images/gui-info-popup.png" width="234" height="134">  </td>
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
    <td> QuestionPopup </td>
    <td> A popup window that asks the user to respond to a yes/no question. </td>
    <td> <img src="documentation/quickguide/gui/images/gui-quest-popup.png" width="234" height="134">  </td>
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
    <td> A rectangular region that arranges data (e.g. text or other widgets) into rows and columns of cells. 
         Data can be modified by selecting a cell in the table. </td>
    <td> <img src="documentation/quickguide/gui/images/gui-table.png" width="300" height="200">  </td>
  </tr>

  <tr>
    <td> TextBox </td> 
    <td> A rectangular region used to entry string, integer or float values. </td>
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

The SimVascular main window GUI is composed of a _MenuBar_, _ToolBar_, _Data Manager_, _Image Navigator_ and _Display_. 
An additional _Tool Panel_ is displayed on the right side of the window when a <i>Tool</i> is active.

<figure>
  <img class="svImg svImgLg"  src="documentation/quickguide/gui/images/mainwindow.png"> 
  <figcaption class="svCaption">Fig. 4 &nbsp The SimVascular GUI layout</figcaption>
</figure>

<br>

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #d0d0d0; border-left: 6px solid #d0d0d0">
The SimVascular GUI may look slightly different on MacOS, Ubuntu and Windows platforms.
</div>
<br> <br>

