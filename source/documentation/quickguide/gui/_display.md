<h2 id="display"> Display </h2>

The GUI main window <i>Display</i> area uses a four-window view to display 2D and 3D views of image and geometry data as
the standard layout. The four-window view provides an interactive environment to view geometry data created by <i>Tools</i> in 
context with medical image data. This enables matching geometric data (e.g. models) to anatomical features present in the imaging data.

The layout of the <i>Display</i> windows and its GUI components are shown in Fig. 6.

<figure>
  <img class="svImg svImgMd"  src="documentation/quickguide/imgs/display.png"> 
  <figcaption class="svCaption"> Fig. 6 &nbsp </figcaption>
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

The location of the principal planes is represented by a pair of crosshairs the 2D view windows. Selecting a point with the left 
mouse button in a 2D window centers the crosshair on that point. Pressing the right mouse button and moving the mouse zooms 
in and out. Scrolling the mouse wheel changes the location of the principal plane for which the mouse cursor is in. 

Changing the principal planes locations changes the values displayed in the <a href="#image_navigator"> Image Navigator </a>
and vice versa.

The funcion of the mouse buttons depends on the window the mouse cursor is in.

<table class="table table-bordered" style="width:100%">
  <caption> <b> 2D View </b> </caption>
  <tr>
    <th> Mouse Button </th>
    <th> Function </th>
  </tr>

  <tr>
    <td> Left </td>
    <td> Moves the crosshairs </td>
  </tr>

  <tr>
    <td> Right </td>
    <td> Zooms the 2D view 
  </tr>

  <tr>
    <td> Mouse Wheel Scrolling </td>
    <td> Changes the location of the principal plane 
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
corner each window provides options to cusomize the view and crosshair behavior when selected using the left mouse button. 

<table class="table table-bordered" style="width:100%">
  <tr>
    <th> Icon </th>
    <th> Menu or Action </th>
    <th> Descriptiton </th>
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
        <li> <b> No crosshair rotation </b> - Select to toggle using crosshairs to position planes orthoganal to image axes </li>
        <li> <b> Crosshair rotation </b> - Select to toggle using crosshairs to rotate two planes </li>
        <li> <b> Coupled crosshair rotation </b> - Select to toggle using crosshairs to rotate planes both planes </li>
        <li> <b> Swivel mode </b> - Select to toggle using crosshairs to rotate planes in about all three axes </li>
        <li> <img src="documentation/quickguide/gui/images/window-ts-slider.png" width="140" height="30"> 
             - The <b>T</b>hicker <b>S</b>lices slider controls how many slices around the current one are used for a maximum intensity projection </li>

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


<br>
<h2 id="level_window"> Image Windowing </h2>

The <i>Image Windowing</i> tool is used to adjust image brightness and contrast using a techniqued called <i>Windowing</i>, 
also known as grey-level mapping, contrast stretching, histogram modification or contrast enhancement.
<i>Windowing</i> manipulates the image greyscale component using image values to change the appearance of the 
image to highlight particular structures. The image brightness is adjusted by changing the <i>window center</i>. 
The image contrast is adjusted by changing the <i>window width</i>. 

A blue region in the <i>Image Windowing</i> tool shows then <i>window center</i> and <i>window width</i>.

<figure>
  <img class="svImg svImgXs"  src="documentation/quickguide/gui/images/image-window-level-tool.png" style="width:2%">
  <figcaption class="svCaption"> The <b>Image Windowing</b> tool. The <b>window width</b> and <b>window center</b> is 
      represented using a blue region within the tool. The two text boxes at the bottom of the tool show the 
      <b>window center</b> (upper box) and the <b>window width</b> (lower box).
  </figcaption>
</figure>

The <i>window center</i> is changed by selecting the center of the <i>Image Windowing</i> tool blue region with the 
left mouse button and moving up or down. 

The <i>window width</i> is changed uniformly about the <i>window center</i> by selecting either end of the 
<i>Image Windowing</i> tool blue region with the left mouse button and moving up or down. 

The <i>window width</i> is changed non-uniformly about the <i>window center</i> by selecting either end of the 
<i>Image Windowing</i> tool blue region with using shift-left mouse button and moving up or down. 

<table class="table table-bordered" style="width:100%">
  <caption> <b> Adjusting image brightness and contrast </b> </caption>
  <tr>
    <th> Operation </th>
    <th> Result </th>
  </tr>

  <tr>
    <td> No operation, original image brightness and contrast </td>
    <td> <img src="documentation/quickguide/gui/images/image-window-level-demo-1.png" width="612" height="410"> </td>
  </tr>

  <tr>
    <td> Move the <i>window center</i> up by placing the mouse cursor in the center of the <i>Image Windowing</i> tool 
         blue region holding the left mouse button down while moving the mouse cursor up </td>
    <td> <img src="documentation/quickguide/gui/images/image-window-level-demo-2.png" width="612" height="410"> </td>
  </tr>

  <tr>
    <td> Move the <i>window center</i> down by placing the mouse cursor in the center of the <i>Image Windowing</i> tool
         blue region holding the left mouse button down while moving the mouse cursor down 
    </td>
    <td> <img src="documentation/quickguide/gui/images/image-window-level-demo-3.png" width="612" height="410"> </td>
  </tr>

  <tr>
    <td> Reduce the <i>window width</i> uniformally around the <i>window center</i> by placing the mouse cursor in the upper 
         boundary of the <i>Image Windowing</i> tool blue region holding and mouse button down while moving the mouse cursor down 
    </td>
    <td> <img src="documentation/quickguide/gui/images/image-window-level-demo-4.png" width="612" height="410"> </td>
  </tr>

  <tr>
    <td> Reduce the <i>window width</i> non-uniformally around the <i>window center</i> by placing the mouse cursor in the upper 
         boundary of the <i>Image Windowing</i> tool blue region holding and pressing shift-left mouse button down while 
         moving the mouse cursor down 
    </td>
    <td> <img src="documentation/quickguide/gui/images/image-window-level-demo-5.png" width="612" height="410"> </td>
  </tr>

</table>
<br>


Selecting the <i>Image Window Level</i> tool with the right mouse buttton pops up the following menu 

<figure>
  <img class="svImg svImgSm"  src="documentation/quickguide/gui/images/image-window-level-menu-1.png"> 
  <figcaption class="svCaption" ></figcaption>
</figure>

<table class="table table-bordered" style="width:100%">
  <caption> <b> Image Window Level Tool Menu </b> </caption>
  <tr>
    <th> Menu Item </th>
    <th> Description </th>
  </tr>

  <tr>
    <td> <b> Hide Scale </b> </td>
    <td> Hide the <i>Image Windowing</i> tool scale  </td>
  </tr>

  <tr>
    <td> <b> Set Slider Fixed </b> </td>
    <td> Disables modifying the <i>window width</i> and <i>window center</i>. </td>
  </tr>
  
  <tr>
    <td> <b> Use whole image grey values </b> </td>
    <td> Set the <i>Image Windowing</i> tool use the entire range of image values. </td>
  </tr>

  <tr>
    <td> <b> Use optimized levelwindow</b> </td>
    <td> Set the <i>Image Windowing</i> tool to use a range of image values that optimizes contrast and brightness. </td>
  </tr>
  
  <tr>
    <td> <b> Set Maximum Window</b> </td>
    <td> N/A </td>
  </tr>
  
  <tr>
    <td> <b> Default Level/Window</b> </td>
    <td> N/A </td>
  </tr>
  
  <tr>
    <td> <b> Change Scale Range </b> </td>
    <td> Displays a popup window used to manually change the upper and lower  <i>window width</i> bounds. </td>
  </tr>
  
  <tr>
    <td> <b> Default Scale Range </b> </td>
    <td> Resets the upper and lower <i>window width</i> bounds to their default values. </td>
  </tr>
  
  <tr>
    <td> <b> Presets </b> </td>
    <td> Displays a menu of preset upper and lower <i>window width</i> bounds for various tissues aquired using CT. </td>
  </tr>

  <tr>
    <td> <b> Images </b> </td>
    <td> N/A </td>
  </tr>
</table>




