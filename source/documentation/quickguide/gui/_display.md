<h2 id="display"> Display </h2>

The GUI main window <i>Display</i> area uses a four-window view to display 2D and 3D views of image and geometry data as
the standard layout. The four-window view provides an interactive environment to view geometry data created by <i>Tools</i> in 
context with medical image data. This enables matching geometric data (e.g. models) to anatomical features present in the imaging data.

The layout of the <i>Display</i> windows and its GUI components are shown in Fig. 5.

<figure>
  <img class="svImg svImgMd"  src="documentation/quickguide/imgs/display.png"> 
  <figcaption class="svCaption"> Fig. 5 &nbsp The standard four-window view comprising three 2D and one 3D views.
</figure>

The three 2D views represent the principal planes used in medical imaging to describe the location of anatomical 
structures defined as 

<ul style="list-style-type:none;">

  <li> <b>axial</b> - Divides the body into top and bottom sections. Upper left 2D window. </li>

  <li> <b>coronal</b> - Divides the body into back and front, or posterior and anterior, sections. Upper right 2D window. </li>

  <li> <b>sagittal</b> - Divides the body into left and right sections. Lower left 2D window. </li>

</ul>
<br>

<h3 id="navigation"> Navigation </h3>

The principal planes slice is represented by a pair of crosshairs the 2D view windows. Selecting a point with the left 
mouse button in a 2D view centers the crosshair on that point. Pressing the right mouse button and moving the mouse zooms 
in and out. Scrolling the mouse wheel changes the principal plane slice for which the mouse cursor is in. 

Changing the principal planes slice changes the values displayed in the <a href="#image_navigator"> Image Navigator </a>
and vice versa.

The function of the mouse buttons depends on the window the mouse cursor is in.

<table class="table table-bordered" style="width:100%">
  <caption> <b> 2D View </b> </caption>
  <tr>
    <th> Mouse Button </th>
    <th> Function </th>
  </tr>

  <tr>
    <td> Left </td>
    <td> Moves the crosshairs, select image points and pixel values </td>
  </tr>

  <tr>
    <td> Right </td>
    <td> Zooms the 2D view 
  </tr>

  <tr>
    <td> Mouse Wheel Scrolling </td>
    <td> Changes the principal plane slice
  </tr>

</table>

<table class="table table-bordered" style="width:100%">
  <caption> <b> 3D View </b> </caption>
  <tr>
    <th> Mouse Button </th>
    <th> Function </th>
  </tr>
  <tr>
    <td> Left </td>
    <td> Rotates the 3D view </td>
  </tr>

  <tr>
    <td> Right </td>
    <td> Zooms the 3D view 
  </tr>

  <tr>
    <td> Shift-left </td>
    <td> Translates the 3D view 
  </tr>

</table>

<div style="background-color: #F0F0F0; padding: 10px; border: 1px solid #d0d0d0; border-left: 6px solid #d0d0d0">
Pressing the <b>F</b> key in the 3D view changes the center of rotation and zoom to be the point under 
the mouse cursor. 
</div>


<br>
<h3 id="window_menus"> Window Menus</h3>

The three icons 
<img src="documentation/quickguide/gui/images/display_icon_menu.png" width="70" height="30"> </td> displayed in the upper right 
corner each window provides options to customize the view and crosshair behavior when selected using the left mouse button. 

<table class="table table-bordered" style="width:100%">
  <tr>
    <th> Icon </th>
    <th> Menu or Action </th>
    <th> Description </th>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/gui/images/window-icon-1.png" width="28" height="24"> </td>
    <td>
       <img src="documentation/quickguide/gui/images/window-menu-1.png" width="180" height="180"> 
    </td>
    <td> 
      <ul style="list-style-type:none;"> 
        <li> <b> Reset view </b> - Resets 1) crosshairs to their default position and 2) viewing transformations (e.g. rotations) </li>
        <li> <b> Show crosshair </b> - Select to toggle showing crosshairs </li>
        <li> <b> No crosshair rotation </b> - Select to toggle using crosshairs to position planes orthogonal to image axes </li>
        <li> <b> Crosshair rotation </b> - Select to toggle using crosshairs to rotate two planes </li>
        <li> <b> Coupled crosshair rotation </b> - Select to toggle using crosshairs to rotate planes both planes </li>
        <li> <b> Swivel mode </b> - Select to toggle using crosshairs to rotate planes in about all three axes </li>
        <li> <img src="documentation/quickguide/gui/images/window-ts-slider.png" width="140" height="30"> 
             - The <b>T</b>thicker <b>S</b>slices slider controls how many slices around the current one are used for a maximum intensity projection </li>

      </ul> 
    </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/gui/images/window-icon-2.png" width="28" height="24"> </td>
    <td> Changes the view layout </td>
    <td> The view is changed to a full-screen layout for the window and plane the mouse cursor is in
         When selected it changes to <img src="documentation/quickguide/gui/images/window-icon-4.png" width="28" height="24">
     </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/gui/images/window-icon-4.png" width="28" height="24"> </td>
    <td> Changes the view layout </td>
    <td> Expands the corresponding window to full screen within the four window view </td>
  </tr>

  <tr>
    <td><img src="documentation/quickguide/gui/images/window-icon-3.png" width="28" height="24"> </td>
    <td>
       <img src="documentation/quickguide/gui/images/window-menu-2.png" width="180" height="180"> 
    </td>
    <td> 
      <ul style="list-style-type:none;"> 
        <li> <b> standard layout </b> - Resets the display to the four-window view  </li>
        <li> <b> 2D images top, 3D bottom </b> - Sets the display to all three 2D views on top of the 3D view
        <li> <b> 2D images top, 3D right </b> - Sets the display to all 2D and 3D views on top 
        <li> <b> Big 3D </b> - Sets the display to a single 3D view
        <li> <b> Axial plane </b> - Sets the display to a single 2D axial plane view
        <li> <b> Sagittal plane </b> - Sets the display to a single 2D sagittal plane view
        <li> <b> Coronal plane </b> - Sets the display to a single 2D coronal plane view
        <li> <b> Coronal top, 3D bottom </b> - Sets the display to the 2D coronal view on top of the 3D view 
        <li> <b> Coronal left, 3D right </b> - Sets the display to the 2D coronal view to the left of the 3D view 
        <li> <b> Sagittal top, Coronal n 3D bottom </b> - Sets the display to the 2D sagittal view on top of the coronal and 3D view 
        <li> <b> Axial n Sagittal left, 3D right </b> - Sets the display to the 2D axial and sagittal views on top and 3D view right
        <li> <b> Axial n 3D left, Sagittal right </b> - Sets the display to the 2D axial and 3D view to the left of the sagittal view
    </td>
  </tr>

</table>


